-- =============================================================
-- V2 - Registro de procedimientos y funciones almacenados
-- Los archivos fuente originales se conservan en db/procs/ para
-- version control y auditoria. Aqui se replican textualmente
-- para que Flyway los aplique en el schema.
-- =============================================================

-- -----------------------------------------------------------------
-- SP01 - Consulta multi-tabla: factura + cliente + detalles
-- -----------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_factura_completa(p_factura_id BIGINT)
RETURNS TABLE (
    factura_id           BIGINT,
    numero               VARCHAR,
    fecha                DATE,
    cliente_cedula_ruc   VARCHAR,
    cliente_nombres      VARCHAR,
    subtotal             NUMERIC,
    iva                  NUMERIC,
    total                NUMERIC,
    estado               VARCHAR,
    producto_codigo      VARCHAR,
    producto_descripcion VARCHAR,
    cantidad             INTEGER,
    precio_unitario      NUMERIC,
    subtotal_linea       NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        f.id, f.numero, f.fecha,
        c.cedula_ruc, c.nombres,
        f.subtotal, f.iva, f.total, f.estado,
        p.codigo, p.descripcion,
        d.cantidad, d.precio_unitario, d.subtotal
    FROM facturas f
    JOIN clientes c ON c.id = f.cliente_id
    LEFT JOIN detalles_factura d ON d.factura_id = f.id
    LEFT JOIN productos p ON p.id = d.producto_id
    WHERE f.id = p_factura_id
    ORDER BY d.id NULLS FIRST;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------------------
-- FN02 - Calculo agregado: total facturado a un cliente en un rango
-- -----------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_total_ventas_cliente(
    p_cliente_id BIGINT,
    p_desde      DATE,
    p_hasta      DATE
) RETURNS NUMERIC AS $$
DECLARE
    v_total NUMERIC(12,2);
BEGIN
    SELECT COALESCE(SUM(total), 0)
    INTO v_total
    FROM facturas
    WHERE cliente_id = p_cliente_id
      AND estado <> 'ANULADA'
      AND fecha BETWEEN p_desde AND p_hasta;
    RETURN v_total;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------------------
-- SP03 - Reporte de ventas por producto en un periodo
-- -----------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_reporte_ventas_periodo(
    p_desde DATE,
    p_hasta DATE
) RETURNS TABLE (
    producto_id       BIGINT,
    codigo            VARCHAR,
    descripcion       VARCHAR,
    unidades_vendidas INTEGER,
    total_facturado   NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        p.id,
        p.codigo,
        p.descripcion,
        COALESCE(SUM(d.cantidad), 0)::INTEGER AS unidades_vendidas,
        COALESCE(SUM(d.subtotal), 0)::NUMERIC AS total_facturado
    FROM productos p
    LEFT JOIN detalles_factura d ON d.producto_id = p.id
    LEFT JOIN facturas f ON f.id = d.factura_id
        AND f.estado <> 'ANULADA'
        AND f.fecha BETWEEN p_desde AND p_hasta
    GROUP BY p.id, p.codigo, p.descripcion
    ORDER BY total_facturado DESC;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------------------
-- SP04 - Actualizacion masiva de precios por proveedor
-- -----------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_actualizar_precios_proveedor(
    p_proveedor_id BIGINT,
    p_porcentaje   NUMERIC
) RETURNS INTEGER AS $$
DECLARE
    v_afectados INTEGER;
    v_factor    NUMERIC;
BEGIN
    IF p_porcentaje IS NULL OR p_porcentaje <= -100 THEN
        RAISE EXCEPTION 'Porcentaje invalido: %', p_porcentaje;
    END IF;

    v_factor := 1 + (p_porcentaje / 100.0);

    UPDATE productos
    SET precio_unitario = ROUND(precio_unitario * v_factor, 2),
        actualizado_en  = NOW()
    WHERE proveedor_id = p_proveedor_id
      AND activo = TRUE;

    GET DIAGNOSTICS v_afectados = ROW_COUNT;
    RETURN v_afectados;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------------------
-- FN05 - Validacion cruzada: stock disponible
-- -----------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_validar_stock_disponible(
    p_producto_id BIGINT,
    p_cantidad    INTEGER
) RETURNS BOOLEAN AS $$
DECLARE
    v_stock INTEGER;
BEGIN
    SELECT stock INTO v_stock
    FROM productos
    WHERE id = p_producto_id AND activo = TRUE;

    IF v_stock IS NULL THEN
        RETURN FALSE;
    END IF;

    RETURN v_stock >= p_cantidad;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------------------
-- FN06 - Generacion de codigo secuencial de factura
-- -----------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_generar_codigo_factura()
RETURNS VARCHAR AS $$
DECLARE
    v_seq BIGINT;
BEGIN
    v_seq := nextval('seq_factura_numero');
    RETURN 'FAC-' || TO_CHAR(CURRENT_DATE, 'YYYY') || '-' || LPAD(v_seq::TEXT, 6, '0');
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------------------
-- SP07 - Transaccion compleja: registrar factura completa
--       (cabecera + detalles + actualizar stock + numerar)
-- -----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_registrar_factura_completa(
    IN  p_cliente_id     BIGINT,
    IN  p_detalles_json  TEXT,
    OUT p_factura_id     BIGINT,
    OUT p_numero         VARCHAR,
    OUT p_total          NUMERIC
) LANGUAGE plpgsql AS $$
DECLARE
    v_subtotal   NUMERIC(12,2) := 0;
    v_iva        NUMERIC(12,2) := 0;
    v_linea      RECORD;
    v_precio     NUMERIC(12,2);
    v_stock      INTEGER;
    v_sub_linea  NUMERIC(12,2);
    v_tasa_iva   NUMERIC(4,2)  := 0.15;   -- 15% Ecuador
BEGIN
    -- Valida existencia y estado del cliente
    IF NOT EXISTS (SELECT 1 FROM clientes WHERE id = p_cliente_id AND activo = TRUE) THEN
        RAISE EXCEPTION 'Cliente % no existe o esta inactivo', p_cliente_id;
    END IF;

    -- Genera numero
    p_numero := fn_generar_codigo_factura();

    -- Inserta cabecera con totales en 0 (se actualizan al final)
    INSERT INTO facturas (numero, fecha, cliente_id, subtotal, iva, total, estado)
    VALUES (p_numero, CURRENT_DATE, p_cliente_id, 0, 0, 0, 'EMITIDA')
    RETURNING id INTO p_factura_id;

    -- Recorre el JSON de detalles
    FOR v_linea IN
        SELECT
            (item->>'productoId')::BIGINT  AS producto_id,
            (item->>'cantidad')::INTEGER   AS cantidad
        FROM jsonb_array_elements(p_detalles_json::JSONB) AS item
    LOOP
        -- Bloquea la fila del producto para evitar condiciones de carrera
        SELECT precio_unitario, stock
        INTO v_precio, v_stock
        FROM productos
        WHERE id = v_linea.producto_id AND activo = TRUE
        FOR UPDATE;

        IF v_precio IS NULL THEN
            RAISE EXCEPTION 'Producto % no existe o esta inactivo', v_linea.producto_id;
        END IF;

        IF v_stock < v_linea.cantidad THEN
            RAISE EXCEPTION 'Stock insuficiente para producto %: disponible=%, solicitado=%',
                v_linea.producto_id, v_stock, v_linea.cantidad;
        END IF;

        v_sub_linea := ROUND(v_precio * v_linea.cantidad, 2);
        v_subtotal := v_subtotal + v_sub_linea;

        INSERT INTO detalles_factura (factura_id, producto_id, cantidad, precio_unitario, subtotal)
        VALUES (p_factura_id, v_linea.producto_id, v_linea.cantidad, v_precio, v_sub_linea);

        UPDATE productos
        SET stock = stock - v_linea.cantidad,
            actualizado_en = NOW()
        WHERE id = v_linea.producto_id;
    END LOOP;

    -- Calcula IVA y total, actualiza cabecera
    v_iva   := ROUND(v_subtotal * v_tasa_iva, 2);
    p_total := v_subtotal + v_iva;

    UPDATE facturas
    SET subtotal = v_subtotal,
        iva      = v_iva,
        total    = p_total
    WHERE id = p_factura_id;
END;
$$;
