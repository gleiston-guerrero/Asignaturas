-- FN06 - Generacion de codigo secuencial de factura
-- Categoria: generacion de codigos secuenciales
-- Parametros: (ninguno)
-- Retorno: VARCHAR (formato FAC-YYYY-NNNNNN)
-- Tablas afectadas: seq_factura_numero (nextval)

CREATE OR REPLACE FUNCTION fn_generar_codigo_factura()
RETURNS VARCHAR AS $$
DECLARE
    v_seq BIGINT;
BEGIN
    v_seq := nextval('seq_factura_numero');
    RETURN 'FAC-' || TO_CHAR(CURRENT_DATE, 'YYYY') || '-' || LPAD(v_seq::TEXT, 6, '0');
END;
$$ LANGUAGE plpgsql;
