-- FN05 - Validacion cruzada: stock disponible
-- Categoria: validaciones cruzadas
-- Parametros: p_producto_id (IN, BIGINT), p_cantidad (IN, INTEGER)
-- Retorno: BOOLEAN (TRUE si hay stock suficiente)
-- Tablas afectadas: productos (solo lectura)

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
