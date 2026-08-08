-- SP04 - Actualizacion masiva de precios por proveedor
-- Categoria: actualizaciones masivas
-- Parametros: p_proveedor_id (IN, BIGINT), p_porcentaje (IN, NUMERIC)
-- Retorno: INTEGER (numero de productos actualizados)
-- Tablas afectadas: productos (UPDATE)

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
