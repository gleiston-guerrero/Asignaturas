-- =====================================================================
--  R__fn_emitir_factura.sql   (migracion Flyway repetible)
--  Funcion : fn_emitir_factura
--  Dominio : Facturacion
--  Autor   : Dr. Gleiston Guerrero -- UTEQ
--  Proposito
--    Emitir una factura completa (cabecera + detalles) en UNA sola
--    transaccion: valida stock, calcula subtotales, IVA y total,
--    descuenta stock e inserta cabecera y lineas. Retorna el id y el
--    numero generados.
--
--  Firma logica
--    fn_emitir_factura(
--        p_cliente_id     BIGINT,
--        p_observaciones  TEXT,
--        p_lineas         JSONB   -- [{"producto_id":1,"cantidad":2}, ...]
--    ) RETURNS TABLE (factura_id BIGINT, numero VARCHAR)
-- =====================================================================

CREATE OR REPLACE FUNCTION fn_emitir_factura(
    p_cliente_id    BIGINT,
    p_observaciones TEXT,
    p_lineas        JSONB
) RETURNS TABLE (factura_id BIGINT, numero VARCHAR)
LANGUAGE plpgsql AS
$$
DECLARE
    v_factura_id     BIGINT;
    v_numero         VARCHAR(20);
    v_secuencial     BIGINT;
    v_linea          JSONB;
    v_producto_id    BIGINT;
    v_cantidad       INTEGER;
    v_producto       RECORD;
    v_precio         NUMERIC(12,2);
    v_iva_pct        NUMERIC(5,2);
    v_subtotal_ln    NUMERIC(14,2);
    v_iva_ln         NUMERIC(14,2);
    v_total_ln       NUMERIC(14,2);
    v_tot_subtotal   NUMERIC(14,2) := 0;
    v_tot_iva        NUMERIC(14,2) := 0;
    v_tot_total      NUMERIC(14,2) := 0;
BEGIN
    -- Validacion de cliente
    IF NOT EXISTS (SELECT 1 FROM cliente WHERE id = p_cliente_id AND activo = TRUE) THEN
        RAISE EXCEPTION 'Cliente % no existe o no esta activo', p_cliente_id
              USING ERRCODE = 'P0001';
    END IF;

    -- Validacion de lineas
    IF p_lineas IS NULL OR jsonb_typeof(p_lineas) <> 'array' OR jsonb_array_length(p_lineas) = 0 THEN
        RAISE EXCEPTION 'Debe enviar al menos una linea de detalle'
              USING ERRCODE = 'P0002';
    END IF;

    -- Numero visible (formato 001-001-#########)
    v_secuencial := nextval('seq_factura_numero');
    v_numero     := '001-001-' || lpad(v_secuencial::TEXT, 9, '0');

    -- Inserta cabecera con totales en cero (se recalculan al final)
    INSERT INTO factura (numero, cliente_id, observaciones)
    VALUES (v_numero, p_cliente_id, p_observaciones)
    RETURNING id INTO v_factura_id;

    -- Procesa cada linea
    FOR v_linea IN SELECT * FROM jsonb_array_elements(p_lineas)
    LOOP
        v_producto_id := (v_linea->>'producto_id')::BIGINT;
        v_cantidad    := (v_linea->>'cantidad')::INTEGER;

        IF v_cantidad IS NULL OR v_cantidad <= 0 THEN
            RAISE EXCEPTION 'Cantidad invalida para producto %', v_producto_id
                  USING ERRCODE = 'P0003';
        END IF;

        -- Bloqueo de fila del producto para evitar sobreventa
        SELECT precio_unitario, iva_porcentaje, stock, activo
          INTO v_producto
          FROM producto
         WHERE id = v_producto_id
         FOR UPDATE;

        IF NOT FOUND THEN
            RAISE EXCEPTION 'Producto % no existe', v_producto_id
                  USING ERRCODE = 'P0004';
        END IF;

        IF v_producto.activo = FALSE THEN
            RAISE EXCEPTION 'Producto % esta inactivo', v_producto_id
                  USING ERRCODE = 'P0005';
        END IF;

        IF v_producto.stock < v_cantidad THEN
            RAISE EXCEPTION 'Stock insuficiente para producto % (stock=%, solicitado=%)',
                            v_producto_id, v_producto.stock, v_cantidad
                  USING ERRCODE = 'P0006';
        END IF;

        v_precio      := v_producto.precio_unitario;
        v_iva_pct     := v_producto.iva_porcentaje;
        v_subtotal_ln := ROUND(v_precio * v_cantidad, 2);
        v_iva_ln      := ROUND(v_subtotal_ln * v_iva_pct / 100, 2);
        v_total_ln    := v_subtotal_ln + v_iva_ln;

        INSERT INTO factura_detalle (
            factura_id, producto_id, cantidad, precio_unitario,
            iva_porcentaje, subtotal, iva, total
        ) VALUES (
            v_factura_id, v_producto_id, v_cantidad, v_precio,
            v_iva_pct, v_subtotal_ln, v_iva_ln, v_total_ln
        );

        UPDATE producto
           SET stock = stock - v_cantidad,
               fecha_actualizacion = CURRENT_TIMESTAMP
         WHERE id = v_producto_id;

        v_tot_subtotal := v_tot_subtotal + v_subtotal_ln;
        v_tot_iva      := v_tot_iva      + v_iva_ln;
        v_tot_total    := v_tot_total    + v_total_ln;
    END LOOP;

    -- Actualiza totales en cabecera
    UPDATE factura
       SET subtotal  = v_tot_subtotal,
           total_iva = v_tot_iva,
           total     = v_tot_total
     WHERE id = v_factura_id;

    RETURN QUERY SELECT v_factura_id, v_numero;
END;
$$;

COMMENT ON FUNCTION fn_emitir_factura(BIGINT, TEXT, JSONB)
    IS 'Emite factura completa (cabecera + detalles) validando stock y calculando totales.';
