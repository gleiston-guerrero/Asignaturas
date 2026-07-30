-- =====================================================================
--  R__fn_anular_factura.sql   (migracion Flyway repetible)
--  Funcion : fn_anular_factura
--  Dominio : Facturacion
--  Autor   : Dr. Gleiston Guerrero -- UTEQ
--  Proposito
--    Anular una factura EMITIDA marcandola como ANULADA y reversando
--    el stock de todas sus lineas. Idempotente ante llamadas repetidas
--    sobre la misma factura ya anulada (lanza excepcion controlada).
--
--  Firma logica
--    fn_anular_factura(
--        p_factura_id BIGINT,
--        p_motivo     VARCHAR
--    ) RETURNS BOOLEAN
-- =====================================================================

CREATE OR REPLACE FUNCTION fn_anular_factura(
    p_factura_id BIGINT,
    p_motivo     VARCHAR
) RETURNS BOOLEAN
LANGUAGE plpgsql AS
$$
DECLARE
    v_estado VARCHAR(20);
BEGIN
    SELECT estado INTO v_estado
      FROM factura
     WHERE id = p_factura_id
     FOR UPDATE;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Factura % no existe', p_factura_id
              USING ERRCODE = 'P0010';
    END IF;

    IF v_estado = 'ANULADA' THEN
        RAISE EXCEPTION 'Factura % ya se encuentra anulada', p_factura_id
              USING ERRCODE = 'P0011';
    END IF;

    -- Reversa el stock de cada linea
    UPDATE producto p
       SET stock = p.stock + d.cantidad,
           fecha_actualizacion = CURRENT_TIMESTAMP
      FROM factura_detalle d
     WHERE d.factura_id = p_factura_id
       AND d.producto_id = p.id;

    -- Marca cabecera como anulada
    UPDATE factura
       SET estado           = 'ANULADA',
           fecha_anulacion  = CURRENT_TIMESTAMP,
           motivo_anulacion = p_motivo
     WHERE id = p_factura_id;

    RETURN TRUE;
END;
$$;

COMMENT ON FUNCTION fn_anular_factura(BIGINT, VARCHAR)
    IS 'Anula una factura EMITIDA y reversa el stock de sus lineas.';
