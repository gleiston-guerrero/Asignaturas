-- SP07 - Transaccion compleja: registrar factura completa
-- Categoria: transacciones multi-tabla
-- Parametros:
--   p_cliente_id   IN  BIGINT
--   p_detalles_json IN TEXT (JSON array de {productoId, cantidad})
--   p_factura_id   OUT BIGINT
--   p_numero       OUT VARCHAR
--   p_total        OUT NUMERIC
-- Tablas afectadas: facturas (INSERT/UPDATE), detalles_factura (INSERT), productos (UPDATE stock)

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
    v_tasa_iva   NUMERIC(4,2)  := 0.15;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM clientes WHERE id = p_cliente_id AND activo = TRUE) THEN
        RAISE EXCEPTION 'Cliente % no existe o esta inactivo', p_cliente_id;
    END IF;

    p_numero := fn_generar_codigo_factura();

    INSERT INTO facturas (numero, fecha, cliente_id, subtotal, iva, total, estado)
    VALUES (p_numero, CURRENT_DATE, p_cliente_id, 0, 0, 0, 'EMITIDA')
    RETURNING id INTO p_factura_id;

    FOR v_linea IN
        SELECT
            (item->>'productoId')::BIGINT  AS producto_id,
            (item->>'cantidad')::INTEGER   AS cantidad
        FROM jsonb_array_elements(p_detalles_json::JSONB) AS item
    LOOP
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

    v_iva   := ROUND(v_subtotal * v_tasa_iva, 2);
    p_total := v_subtotal + v_iva;

    UPDATE facturas
    SET subtotal = v_subtotal,
        iva      = v_iva,
        total    = p_total
    WHERE id = p_factura_id;
END;
$$;
