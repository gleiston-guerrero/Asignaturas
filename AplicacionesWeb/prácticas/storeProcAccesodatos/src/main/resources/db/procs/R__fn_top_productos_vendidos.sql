-- =====================================================================
--  R__fn_top_productos_vendidos.sql   (migracion Flyway repetible)
--  Funcion : fn_top_productos_vendidos
--  Dominio : Facturacion
--  Autor   : Dr. Gleiston Guerrero -- UTEQ
--  Proposito
--    Ranking de los N productos mas vendidos por unidades y por
--    facturacion (subtotal) dentro de un rango de fechas. Considera
--    solo facturas EMITIDAS.
--
--  Firma logica
--    fn_top_productos_vendidos(
--        p_desde  DATE,
--        p_hasta  DATE,
--        p_top_n  INTEGER
--    ) RETURNS TABLE(
--        producto_id      BIGINT,
--        codigo           VARCHAR,
--        nombre           VARCHAR,
--        unidades         BIGINT,
--        subtotal_vendido NUMERIC
--    )
-- =====================================================================

CREATE OR REPLACE FUNCTION fn_top_productos_vendidos(
    p_desde DATE,
    p_hasta DATE,
    p_top_n INTEGER
) RETURNS TABLE (
    producto_id      BIGINT,
    codigo           VARCHAR,
    nombre           VARCHAR,
    unidades         BIGINT,
    subtotal_vendido NUMERIC
)
LANGUAGE sql
STABLE AS
$$
    SELECT p.id                             AS producto_id,
           p.codigo                         AS codigo,
           p.nombre                         AS nombre,
           SUM(d.cantidad)::BIGINT          AS unidades,
           COALESCE(SUM(d.subtotal), 0)     AS subtotal_vendido
      FROM factura_detalle d
      JOIN factura  f ON f.id = d.factura_id
      JOIN producto p ON p.id = d.producto_id
     WHERE f.estado = 'EMITIDA'
       AND f.fecha_emision BETWEEN p_desde AND p_hasta
     GROUP BY p.id, p.codigo, p.nombre
     ORDER BY unidades DESC, subtotal_vendido DESC
     LIMIT COALESCE(p_top_n, 10);
$$;

COMMENT ON FUNCTION fn_top_productos_vendidos(DATE, DATE, INTEGER)
    IS 'Ranking de los N productos mas vendidos en unidades y facturacion.';
