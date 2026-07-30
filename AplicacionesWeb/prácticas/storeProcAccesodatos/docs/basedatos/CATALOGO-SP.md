# Catálogo de Stored Procedures / SQL Functions

**Proyecto:** `storeProcAccesodatos` (dominio Facturación)
**Motor:** PostgreSQL 16
**Gestión de esquema:** Flyway (migraciones versionadas `V*` para DDL y datos referenciales; migraciones repetibles `R*` para stored procedures y funciones).
**Ubicación en el repositorio:**
- Migraciones versionadas: `src/main/resources/db/migration/`
- Migraciones repetibles (SPs / SQL functions): `src/main/resources/db/procs/`

---

## Política híbrida de acceso a datos (Unidad II)

En este proyecto rige la **política híbrida** definida para la asignatura:

1. **Vía JPA / Spring Data** (obligatoriamente y únicamente) los **5 CRUD elementales**:
   1. `save` (inserción nueva de una entidad).
   2. `findById` (recuperación por clave primaria).
   3. `findAll` o `findAll(Pageable)` (listado paginado sin filtros).
   4. Actualización escalar por PK (`@Modifying @Query` sobre un único campo por PK).
   5. Borrado lógico por PK (marcar `activo = FALSE`).

2. **Vía Stored Procedure o SQL Function** todo el resto: búsquedas dinámicas, agregaciones, reportes, operaciones transaccionales con múltiples tablas, cualquier lógica que implique JOINs, condiciones opcionales o consumo de listas.

3. **Prohibido:** concatenar SQL dinámicamente en Java. Toda operación que no sea uno de los 5 CRUD elementales debe existir aquí catalogada.

---

## Convenciones

| Aspecto | Regla |
|---|---|
| Prefijo | Todas las funciones se nombran `fn_<verbo>_<sujeto>`. Los procedimientos (`CALL`) llevarían `sp_<verbo>_<sujeto>` — en este catálogo se prefieren funciones para invocación uniforme desde JPA. |
| Idempotencia | Se declaran con `CREATE OR REPLACE FUNCTION` y viven como migraciones repetibles `R__fn_<nombre>.sql` en Flyway. |
| Códigos de error | Excepciones controladas usan `ERRCODE` bajo el rango `P0001–P0099`. Ver sección [Códigos de error](#códigos-de-error). |
| Estabilidad | Funciones de solo lectura se marcan `STABLE` o `IMMUTABLE`; las que modifican datos se dejan `VOLATILE` (default). |
| Parámetros | Todos los filtros opcionales aceptan `NULL` y aplican `COALESCE` o `CASE` para su tratamiento. |

---

## Inventario

| # | Nombre | Tipo | Categoría | Archivo |
|---|---|---|---|---|
| 1 | `fn_emitir_factura`         | FUNCTION | Transaccional | `db/procs/R__fn_emitir_factura.sql` |
| 2 | `fn_anular_factura`         | FUNCTION | Transaccional | `db/procs/R__fn_anular_factura.sql` |
| 3 | `fn_buscar_clientes`        | FUNCTION | Consulta      | `db/procs/R__fn_buscar_clientes.sql` |
| 4 | `fn_reporte_ventas_periodo` | FUNCTION | Reporte       | `db/procs/R__fn_reporte_ventas_periodo.sql` |
| 5 | `fn_top_productos_vendidos` | FUNCTION | Reporte       | `db/procs/R__fn_top_productos_vendidos.sql` |

---

## 1. `fn_emitir_factura`

Emite una factura completa (cabecera + detalles) en una única transacción. Valida existencia y estado del cliente, valida stock por producto con bloqueo de fila (`FOR UPDATE`), calcula subtotal, IVA y total por línea, descuenta stock, e inserta la cabecera y todas las líneas. Retorna el `id` y el `numero` visible generados.

**Firma**

```sql
fn_emitir_factura(
    p_cliente_id    BIGINT,
    p_observaciones TEXT,
    p_lineas        JSONB           -- [{"producto_id": 1, "cantidad": 2}, ...]
) RETURNS TABLE (factura_id BIGINT, numero VARCHAR)
```

**Ejemplo de invocación (psql)**

```sql
SELECT * FROM fn_emitir_factura(
    1,
    'Venta mostrador',
    '[{"producto_id":1,"cantidad":3},{"producto_id":2,"cantidad":10}]'::JSONB
);
```

**Errores controlados**

| ERRCODE | Situación |
|---|---|
| `P0001` | Cliente inexistente o inactivo. |
| `P0002` | Lista de líneas vacía o no es un arreglo JSON. |
| `P0003` | Cantidad no positiva en una línea. |
| `P0004` | Producto inexistente. |
| `P0005` | Producto inactivo. |
| `P0006` | Stock insuficiente. |

**Invocación desde JPA (Spring Data)**

```java
@Query(value = "SELECT * FROM fn_emitir_factura(:clienteId, :obs, CAST(:lineas AS JSONB))",
       nativeQuery = true)
List<Object[]> emitirFactura(@Param("clienteId") Long clienteId,
                             @Param("obs")       String observaciones,
                             @Param("lineas")    String lineasJson);
```

---

## 2. `fn_anular_factura`

Marca una factura `EMITIDA` como `ANULADA`, registra motivo y fecha, y reversa el stock de cada línea al producto correspondiente. Rechaza reintentos sobre facturas ya anuladas.

**Firma**

```sql
fn_anular_factura(
    p_factura_id BIGINT,
    p_motivo     VARCHAR
) RETURNS BOOLEAN
```

**Errores controlados**

| ERRCODE | Situación |
|---|---|
| `P0010` | Factura inexistente. |
| `P0011` | Factura ya anulada previamente. |

**Ejemplo**

```sql
SELECT fn_anular_factura(1, 'Error en digitación del cliente');
```

---

## 3. `fn_buscar_clientes`

Búsqueda dinámica paginada de clientes por cédula, nombres, apellidos o email. Tolera diferencias de mayúsculas y tildes gracias a `unaccent` + `lower`. Todos los parámetros son opcionales.

**Firma**

```sql
fn_buscar_clientes(
    p_texto        VARCHAR,       -- NULL o vacío = sin filtro de texto
    p_solo_activos BOOLEAN,       -- TRUE = solo activo = TRUE
    p_limit        INTEGER,       -- por defecto 50 si NULL
    p_offset       INTEGER        -- por defecto 0 si NULL
) RETURNS SETOF cliente
```

**Ejemplo**

```sql
SELECT * FROM fn_buscar_clientes('per', TRUE, 20, 0);
```

**Invocación desde JPA**

```java
@Query(value = "SELECT * FROM fn_buscar_clientes(:texto, :soloActivos, :limit, :offset)",
       nativeQuery = true)
List<Cliente> buscarClientes(@Param("texto")       String texto,
                             @Param("soloActivos") boolean soloActivos,
                             @Param("limit")       int limit,
                             @Param("offset")      int offset);
```

---

## 4. `fn_reporte_ventas_periodo`

Reporte agregado de ventas por día dentro de un rango cerrado `[p_desde, p_hasta]`. Retorna número de facturas y sumas de subtotal, IVA y total. Por defecto excluye facturas `ANULADAS`; con `p_incluir_anuladas = TRUE` las incluye.

**Firma**

```sql
fn_reporte_ventas_periodo(
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
```

**Ejemplo**

```sql
SELECT * FROM fn_reporte_ventas_periodo(DATE '2026-07-01', DATE '2026-07-31', FALSE);
```

---

## 5. `fn_top_productos_vendidos`

Ranking de los `N` productos más vendidos (por unidades, con desempate por subtotal facturado) dentro de un rango de fechas. Considera únicamente facturas `EMITIDAS`.

**Firma**

```sql
fn_top_productos_vendidos(
    p_desde DATE,
    p_hasta DATE,
    p_top_n INTEGER   -- por defecto 10 si NULL
) RETURNS TABLE (
    producto_id      BIGINT,
    codigo           VARCHAR,
    nombre           VARCHAR,
    unidades         BIGINT,
    subtotal_vendido NUMERIC
)
```

**Ejemplo**

```sql
SELECT * FROM fn_top_productos_vendidos(DATE '2026-07-01', DATE '2026-07-31', 5);
```

---

## Códigos de error

Los siguientes códigos usan la clase `P0` (usuario) reservada por PostgreSQL para excepciones definidas por el desarrollador.

| Rango | Uso |
|---|---|
| `P0001–P0009` | Errores del flujo de **emisión** de factura. |
| `P0010–P0019` | Errores del flujo de **anulación** de factura. |
| `P0020–P0029` | Reservado para futuras operaciones sobre productos. |
| `P0030–P0039` | Reservado para futuras operaciones sobre clientes. |

En Java, estas excepciones se recogen como `org.springframework.dao.DataIntegrityViolationException` o `PSQLException`, con `getSQLState()` == código correspondiente.

---

## Procedimiento para añadir un nuevo SP

1. Crear el archivo `src/main/resources/db/procs/R__fn_<nombre>.sql` con encabezado normalizado (proyecto, autor, propósito, firma).
2. Usar exclusivamente `CREATE OR REPLACE FUNCTION` (nunca `DROP`).
3. Añadir la entrada correspondiente al inventario y sección detallada de este catálogo.
4. Añadir prueba de invocación en `src/test/java/.../facturacion/procs/`.
5. Compilar `./mvnw clean verify` — Flyway aplica la migración repetible al arranque.
6. Actualizar la sección [Códigos de error](#códigos-de-error) si se agregan nuevos.
