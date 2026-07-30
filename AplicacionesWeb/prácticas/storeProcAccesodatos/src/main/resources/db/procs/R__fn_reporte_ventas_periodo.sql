-- =====================================================================
--  R__fn_reporte_ventas_periodo.sql   (migracion Flyway repetible)
--  Funcion : fn_reporte_ventas_periodo
--  Dominio : Facturacion
--  Autor   : Dr. Gleiston Guerrero -- UTEQ
--  Proposito
--    Reporte agregado de ventas por rango de fechas y estado, con
--    totales por dia. Excluye por defecto facturas ANULADAS a menos
--    que p_incluir_anuladas = TRUE.
--
--  Firma logica
--    fn_reporte_ventas_periodo(
--        p_desde              DATE,
--        p_hasta              DATE,
--        p_incluir_anuladas   BOOLEAN
--    ) RETURNS TABLE(
--        fecha         DATE,
--        num_facturas  BIGINT,
--        subtotal      NUMERIC,
--        total_iva     NUMERIC,
--        total         NUMERIC
--    )
-- =====================================================================

CREATE OR REPLACE FUNCTION fn_reporte_ventas_periodo(
    p_desde            DATE,
    p_hasta            DATE,
    p_incluir_anuladas BOOLEAN
) RETURNS TABLE (
    fecha        DATE,
    num_facturas BIGINT,
    subtotal     NUMERIC,
    total_iva    NUMERIC,
    total        NUMERIC
)
LANGUAGE sql
STABLE AS
$$
    SELECT f.fecha_emision                AS fecha,
           COUNT(*)::BIGINT                AS num_facturas,
           COALESCE(SUM(f.subtotal),  0)   AS subtotal,
           COALESCE(SUM(f.total_iva), 0)   AS total_iva,
           COALESCE(SUM(f.total),     0)   AS total
      FROM factura f
     WHERE f.fecha_emision BETWEEN p_desde AND p_hasta
       AND (p_incluir_anuladas = TRUE OR f.estado = 'EMITIDA')
     GROUP BY f.fecha_emision
     ORDER BY f.fecha_emision;
$$;

COMMENT ON FUNCTION fn_reporte_ventas_periodo(DATE, DATE, BOOLEAN)
    IS 'Reporte agregado de ventas por dia dentro de un rango de fechas.';
