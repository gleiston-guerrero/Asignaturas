-- SP01 - Consulta multi-tabla: factura + cliente + detalles
-- Categoria: consultas multi-tabla
-- Parametros: p_factura_id (IN, BIGINT)
-- Retorno: SETOF con cabecera repetida por linea + datos de producto
-- Tablas afectadas: facturas, clientes, detalles_factura, productos (solo lectura)

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
