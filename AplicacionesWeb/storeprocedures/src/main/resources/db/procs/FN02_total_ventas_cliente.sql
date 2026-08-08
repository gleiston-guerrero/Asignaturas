-- FN02 - Calculo agregado: total facturado a un cliente en un rango
-- Categoria: calculos agregados
-- Parametros: p_cliente_id (IN, BIGINT), p_desde (IN, DATE), p_hasta (IN, DATE)
-- Retorno: NUMERIC (suma de totales de facturas no anuladas)
-- Tablas afectadas: facturas (solo lectura)

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
