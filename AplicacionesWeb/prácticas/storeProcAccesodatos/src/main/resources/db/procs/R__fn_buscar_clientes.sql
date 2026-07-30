-- =====================================================================
--  R__fn_buscar_clientes.sql   (migracion Flyway repetible)
--  Funcion : fn_buscar_clientes
--  Dominio : Facturacion
--  Autor   : Dr. Gleiston Guerrero -- UTEQ
--  Proposito
--    Busqueda dinamica de clientes por texto libre, con parametros
--    opcionales. Aplica unaccent + ILIKE para busqueda tolerante a
--    tildes y mayusculas.
--
--  Firma logica
--    fn_buscar_clientes(
--        p_texto       VARCHAR,   -- puede ser NULL o vacio
--        p_solo_activos BOOLEAN,
--        p_limit       INTEGER,
--        p_offset      INTEGER
--    ) RETURNS SETOF cliente
-- =====================================================================

CREATE OR REPLACE FUNCTION fn_buscar_clientes(
    p_texto        VARCHAR,
    p_solo_activos BOOLEAN,
    p_limit        INTEGER,
    p_offset       INTEGER
) RETURNS SETOF cliente
LANGUAGE plpgsql
STABLE AS
$$
DECLARE
    v_patron VARCHAR;
BEGIN
    v_patron := CASE
                    WHEN p_texto IS NULL OR btrim(p_texto) = ''
                        THEN NULL
                    ELSE '%' || unaccent(lower(btrim(p_texto))) || '%'
                END;

    RETURN QUERY
        SELECT *
          FROM cliente c
         WHERE (v_patron IS NULL
                OR unaccent(lower(c.cedula))    LIKE v_patron
                OR unaccent(lower(c.nombres))   LIKE v_patron
                OR unaccent(lower(c.apellidos)) LIKE v_patron
                OR unaccent(lower(coalesce(c.email, ''))) LIKE v_patron)
           AND (p_solo_activos = FALSE OR c.activo = TRUE)
         ORDER BY c.apellidos, c.nombres
         LIMIT  COALESCE(p_limit,  50)
         OFFSET COALESCE(p_offset, 0);
END;
$$;

COMMENT ON FUNCTION fn_buscar_clientes(VARCHAR, BOOLEAN, INTEGER, INTEGER)
    IS 'Busqueda dinamica paginada de clientes tolerante a tildes y mayusculas.';
