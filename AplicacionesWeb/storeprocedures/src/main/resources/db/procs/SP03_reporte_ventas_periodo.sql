-- SP03 - Reporte: ventas por producto en un periodo
-- Categoria: reportes
-- Parametros: p_desde (IN, DATE), p_hasta (IN, DATE)
-- Retorno: SETOF con producto, unidades y total facturado
-- Tablas afectadas: productos, detalles_factura, facturas (solo lectura)

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
