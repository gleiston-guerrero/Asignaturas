# Catalogo de procedimientos almacenados y funciones SQL

Este catalogo cumple el requisito **A.2.1** del PFC: cada procedimiento y funcion versionado en `db/procs/` esta listado aqui con nombre, categoria funcional, proposito, parametros (tipo y modo), retorno y tablas afectadas.

| Codigo | Nombre                          | Categoria funcional            | Tipo       | Archivo fuente                                |
| ------ | ------------------------------- | ------------------------------ | ---------- | --------------------------------------------- |
| SP01   | `sp_factura_completa`           | Consultas multi-tabla          | Function   | `db/procs/SP01_factura_completa.sql`          |
| FN02   | `fn_total_ventas_cliente`       | Calculos agregados             | Function   | `db/procs/FN02_total_ventas_cliente.sql`      |
| SP03   | `sp_reporte_ventas_periodo`     | Reportes                       | Function   | `db/procs/SP03_reporte_ventas_periodo.sql`    |
| SP04   | `sp_actualizar_precios_proveedor` | Actualizaciones masivas      | Function   | `db/procs/SP04_actualizar_precios_proveedor.sql` |
| FN05   | `fn_validar_stock_disponible`   | Validaciones cruzadas          | Function   | `db/procs/FN05_validar_stock_disponible.sql`  |
| FN06   | `fn_generar_codigo_factura`     | Generacion de codigos secuenciales | Function | `db/procs/FN06_generar_codigo_factura.sql`  |
| SP07   | `sp_registrar_factura_completa` | Transacciones multi-tabla      | Procedure  | `db/procs/SP07_registrar_factura_completa.sql`|

---

## SP01 - `sp_factura_completa`

**Proposito:** obtener en un solo viaje al motor la cabecera de una factura, los datos del cliente y todas las lineas de detalle con sus productos.

| Parametro     | Modo | Tipo   | Descripcion               |
| ------------- | ---- | ------ | ------------------------- |
| p_factura_id  | IN   | BIGINT | ID de la factura a leer   |

**Retorno:** `SETOF RECORD` con 14 columnas (cabecera repetida por linea).

**Tablas afectadas:** `facturas`, `clientes`, `detalles_factura`, `productos` (solo lectura).

**Invocacion Java:** `FacturaProcedureRepository.obtenerFacturaCompleta(Long)` mediante `EntityManager.createStoredProcedureQuery`.

---

## FN02 - `fn_total_ventas_cliente`

**Proposito:** calcular el total facturado a un cliente en un rango de fechas, excluyendo facturas anuladas.

| Parametro     | Modo | Tipo   | Descripcion         |
| ------------- | ---- | ------ | ------------------- |
| p_cliente_id  | IN   | BIGINT | ID del cliente      |
| p_desde       | IN   | DATE   | Fecha inicial       |
| p_hasta       | IN   | DATE   | Fecha final         |

**Retorno:** `NUMERIC(12,2)` con la suma de totales.

**Tablas afectadas:** `facturas` (solo lectura).

**Invocacion Java:** `FacturaRepository.totalVentasCliente(...)` con `@Procedure`.

---

## SP03 - `sp_reporte_ventas_periodo`

**Proposito:** reporte agregado de unidades vendidas y total facturado por producto en un rango de fechas.

| Parametro | Modo | Tipo | Descripcion   |
| --------- | ---- | ---- | ------------- |
| p_desde   | IN   | DATE | Fecha inicial |
| p_hasta   | IN   | DATE | Fecha final   |

**Retorno:** `SETOF RECORD` con `producto_id`, `codigo`, `descripcion`, `unidades_vendidas`, `total_facturado`.

**Tablas afectadas:** `productos`, `detalles_factura`, `facturas` (solo lectura).

**Invocacion Java:** `ReporteProcedureRepository.reporteVentasPorPeriodo(...)`.

---

## SP04 - `sp_actualizar_precios_proveedor`

**Proposito:** actualizar masivamente el precio unitario de todos los productos activos de un proveedor aplicando un porcentaje (positivo o negativo).

| Parametro      | Modo | Tipo    | Descripcion                                    |
| -------------- | ---- | ------- | ---------------------------------------------- |
| p_proveedor_id | IN   | BIGINT  | ID del proveedor                               |
| p_porcentaje   | IN   | NUMERIC | Porcentaje de ajuste (p. ej. 10 = subir 10%)   |

**Retorno:** `INTEGER` con el numero de filas afectadas.

**Tablas afectadas:** `productos` (UPDATE).

**Invocacion Java:** `ProductoRepository.actualizarPreciosProveedor(...)` con `@Procedure`.

---

## FN05 - `fn_validar_stock_disponible`

**Proposito:** verificar si un producto activo tiene stock suficiente para una cantidad solicitada.

| Parametro     | Modo | Tipo    | Descripcion            |
| ------------- | ---- | ------- | ---------------------- |
| p_producto_id | IN   | BIGINT  | ID del producto        |
| p_cantidad    | IN   | INTEGER | Cantidad requerida     |

**Retorno:** `BOOLEAN` (`TRUE` si hay stock suficiente).

**Tablas afectadas:** `productos` (solo lectura).

**Invocacion Java:** `ProductoRepository.validarStockDisponible(...)` con `@Procedure`.

---

## FN06 - `fn_generar_codigo_factura`

**Proposito:** generar el siguiente numero correlativo de factura con el formato `FAC-YYYY-NNNNNN` usando `seq_factura_numero`.

| Parametro | Modo | Tipo | Descripcion |
| --------- | ---- | ---- | ----------- |
| (ninguno) | -    | -    | -           |

**Retorno:** `VARCHAR` con el numero generado.

**Tablas afectadas:** secuencia `seq_factura_numero` (`nextval`).

**Invocacion Java:** `FacturaRepository.generarCodigoFactura()` con `@Procedure`. Tambien es llamada internamente por SP07.

---

## SP07 - `sp_registrar_factura_completa`

**Proposito:** registrar una factura completa dentro de una unica transaccion: valida cliente, genera numero, inserta cabecera, procesa cada linea con bloqueo pesimista sobre el producto, valida stock, inserta detalles, actualiza stock y recalcula totales.

| Parametro       | Modo | Tipo    | Descripcion                                         |
| --------------- | ---- | ------- | --------------------------------------------------- |
| p_cliente_id    | IN   | BIGINT  | ID del cliente                                      |
| p_detalles_json | IN   | TEXT    | Array JSON de `{"productoId": N, "cantidad": M}`    |
| p_factura_id    | OUT  | BIGINT  | ID de la factura creada                             |
| p_numero        | OUT  | VARCHAR | Numero de factura generado                          |
| p_total         | OUT  | NUMERIC | Total con IVA calculado                             |

**Retorno:** valores por parametros OUT.

**Tablas afectadas:** `facturas` (INSERT + UPDATE), `detalles_factura` (INSERT), `productos` (UPDATE stock).

**Invocacion Java:** `FacturaProcedureRepository.registrarFacturaCompleta(...)` mediante `EntityManager.createStoredProcedureQuery`. La entidad `Factura` tambien declara `@NamedStoredProcedureQuery` como referencia.

---

## Regla de invocacion (queda prohibido)

Todas las invocaciones se realizan mediante los mecanismos formales de la especificacion JPA 2.1: `@Procedure` sobre repositorios Spring Data o `EntityManager.createStoredProcedureQuery`. Queda prohibido invocarlos mediante concatenacion de cadenas en `createNativeQuery(...)`.
