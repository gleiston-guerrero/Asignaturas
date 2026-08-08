# Sistema de Facturacion - Spring Boot 3.4 + PostgreSQL 16

Proyecto de referencia para la asignatura **Aplicaciones Web** (5.o nivel, PPA 2026-2027) y para la **Entrega 3 del PFC**. Implementa el patron **hibrido de acceso a datos** establecido en la politica del PFC: CRUD elementales via JPA/Spring Data y operaciones no elementales (multi-tabla, agregadas, reportes, actualizaciones masivas, validaciones cruzadas, generacion de codigos y transacciones complejas) via **procedimientos almacenados** en PostgreSQL.

## Dominio

- `Cliente`, `Proveedor`, `Producto`, `Factura`, `DetalleFactura`.
- Cliente compra productos (5 entidades).
- Cada producto tiene un proveedor.
- Cada factura tiene un cliente y varias lineas de detalle.

## Stack

| Componente        | Version       |
| ----------------- | ------------- |
| Java              | 21 LTS        |
| Spring Boot       | 3.4.1         |
| Spring Data JPA   | (Boot)        |
| Hibernate         | 6 (Boot)      |
| PostgreSQL        | 16-alpine     |
| Flyway            | 10 (Boot)     |
| Springdoc OpenAPI | 2.7.0         |
| Lombok            | (Boot)        |
| JUnit             | 5 (Boot)      |

## Arquitectura del acceso a datos (politica hibrida)

**CRUD elementales via JPA/Spring Data** (5 entidades):
- `ClienteRepository`, `ProveedorRepository`, `ProductoRepository`, `FacturaRepository`, `DetalleFacturaRepository`.

**Operaciones no elementales via procedimientos almacenados** (7 SPs/funciones):

| Codigo | Nombre                            | Categoria                         |
| ------ | --------------------------------- | --------------------------------- |
| SP01   | `sp_factura_completa`             | Consulta multi-tabla              |
| FN02   | `fn_total_ventas_cliente`         | Calculo agregado                  |
| SP03   | `sp_reporte_ventas_periodo`       | Reporte                           |
| SP04   | `sp_actualizar_precios_proveedor` | Actualizacion masiva              |
| FN05   | `fn_validar_stock_disponible`     | Validacion cruzada                |
| FN06   | `fn_generar_codigo_factura`       | Generacion de codigos secuenciales|
| SP07   | `sp_registrar_factura_completa`   | Transaccion multi-tabla           |

Todas las invocaciones respetan la especificacion JPA 2.1 (`@Procedure` sobre repositorio Spring Data o `EntityManager.createStoredProcedureQuery`). **Queda prohibido invocar SPs por concatenacion en `createNativeQuery(...)`**.

Ver el catalogo completo en `docs/basedatos/CATALOGO-SP.md`.

## Estructura del repositorio

```
sistema-facturacion/
|-- pom.xml
|-- docker-compose.yml
|-- http-requests.http                          # Requests para IntelliJ HTTP Client
|-- README.md
|-- .gitignore
|-- docs/
|   `-- basedatos/
|       `-- CATALOGO-SP.md                      # Requisito A.2.1 del PFC
`-- src/
    |-- main/
    |   |-- java/ec/edu/uteq/facturacion/
    |   |   |-- FacturacionApplication.java
    |   |   |-- config/
    |   |   |   `-- OpenApiConfig.java
    |   |   |-- domain/
    |   |   |   |-- Cliente.java
    |   |   |   |-- Proveedor.java
    |   |   |   |-- Producto.java
    |   |   |   |-- Factura.java                # @NamedStoredProcedureQuery para SP07
    |   |   |   `-- DetalleFactura.java
    |   |   |-- repository/
    |   |   |   |-- ClienteRepository.java
    |   |   |   |-- ProveedorRepository.java
    |   |   |   |-- ProductoRepository.java     # @Procedure para SP04 y FN05
    |   |   |   |-- FacturaRepository.java      # @Procedure para FN02 y FN06
    |   |   |   |-- DetalleFacturaRepository.java
    |   |   |   `-- procedures/
    |   |   |       |-- FacturaProcedureRepository.java   # SP01 y SP07 via EntityManager
    |   |   |       `-- ReporteProcedureRepository.java   # SP03 via EntityManager
    |   |   |-- service/
    |   |   |   |-- ClienteService.java
    |   |   |   |-- ProveedorService.java
    |   |   |   |-- ProductoService.java
    |   |   |   |-- FacturaService.java
    |   |   |   |-- DetalleFacturaService.java
    |   |   |   `-- reports/
    |   |   |       `-- ReporteService.java
    |   |   |-- dto/
    |   |   |   |-- ClienteDTO.java
    |   |   |   |-- ProveedorDTO.java
    |   |   |   |-- ProductoDTO.java
    |   |   |   |-- FacturaDTO.java
    |   |   |   |-- DetalleFacturaDTO.java
    |   |   |   |-- FacturaCompletaDTO.java
    |   |   |   |-- ReporteVentasProductoDTO.java
    |   |   |   |-- RegistrarFacturaRequest.java
    |   |   |   `-- RegistrarFacturaResultado.java
    |   |   |-- web/
    |   |   |   |-- ClienteController.java
    |   |   |   |-- ProveedorController.java
    |   |   |   |-- ProductoController.java
    |   |   |   |-- FacturaController.java
    |   |   |   |-- DetalleFacturaController.java
    |   |   |   `-- ReporteController.java
    |   |   `-- exception/
    |   |       |-- GlobalExceptionHandler.java
    |   |       |-- ResourceNotFoundException.java
    |   |       `-- BusinessException.java
    |   `-- resources/
    |       |-- application.yml
    |       `-- db/
    |           |-- migration/
    |           |   |-- V1__crear_tablas.sql
    |           |   |-- V2__crear_procedimientos.sql
    |           |   `-- V3__datos_iniciales.sql
    |           `-- procs/                      # Fuente de verdad (auditoria)
    |               |-- SP01_factura_completa.sql
    |               |-- FN02_total_ventas_cliente.sql
    |               |-- SP03_reporte_ventas_periodo.sql
    |               |-- SP04_actualizar_precios_proveedor.sql
    |               |-- FN05_validar_stock_disponible.sql
    |               |-- FN06_generar_codigo_factura.sql
    |               `-- SP07_registrar_factura_completa.sql
    `-- test/
        `-- java/ec/edu/uteq/facturacion/
            `-- FacturacionApplicationTests.java
```

## Puesta en marcha

**1. Requisitos**

- JDK 21
- Maven 3.9+
- Docker + Docker Compose

**2. Levantar PostgreSQL**

```
docker compose up -d
```

**3. Compilar y ejecutar**

```
./mvnw spring-boot:run
```

Flyway aplicara automaticamente las migraciones `V1`, `V2` y `V3`.

**4. Documentacion interactiva**

- Swagger UI: `http://localhost:8080/swagger-ui.html`
- OpenAPI JSON: `http://localhost:8080/v3/api-docs`
- Actuator health: `http://localhost:8080/actuator/health`

**5. Pruebas rapidas**

Abra `http-requests.http` desde IntelliJ IDEA Ultimate y ejecute cada bloque `###`.

## Endpoints clave (SPs)

| Metodo | Endpoint                                                   | SP invocado                        |
| ------ | ---------------------------------------------------------- | ---------------------------------- |
| `POST` | `/api/v1/facturas`                                         | SP07 - `sp_registrar_factura_completa` |
| `GET`  | `/api/v1/facturas/{id}/completa`                           | SP01 - `sp_factura_completa`       |
| `GET`  | `/api/v1/facturas/cliente/{clienteId}/total?desde&hasta`   | FN02 - `fn_total_ventas_cliente`   |
| `GET`  | `/api/v1/reportes/ventas/por-periodo?desde&hasta`          | SP03 - `sp_reporte_ventas_periodo` |
| `PATCH`| `/api/v1/productos/proveedor/{proveedorId}/precios?porcentaje` | SP04 - `sp_actualizar_precios_proveedor` |
| `GET`  | `/api/v1/productos/{id}/stock/validar?cantidad`            | FN05 - `fn_validar_stock_disponible` |

FN06 (`fn_generar_codigo_factura`) es invocada internamente por SP07; tambien puede llamarse via `FacturaRepository.generarCodigoFactura()`.

## Ejemplo de invocacion completa

```
curl -X POST http://localhost:8080/api/v1/facturas \
  -H "Content-Type: application/json" \
  -d '{
    "clienteId": 1,
    "detalles": [
      {"productoId": 1, "cantidad": 1},
      {"productoId": 2, "cantidad": 3}
    ]
  }'
```

Respuesta esperada:

```
{
  "facturaId": 1,
  "numero": "FAC-2026-000001",
  "total": 1030.53
}
```

## Cumplimiento del PFC

- **A.2.1** - 7 SPs versionados en `db/procs/` cubriendo las 6 categorias funcionales exigidas (con SP07 adicional para la transaccion completa).
- **A.2.2** - Catalogo formal en `docs/basedatos/CATALOGO-SP.md`.
- **Regla de invocacion** - Todo SP se llama con `@Procedure` o `createStoredProcedureQuery`. Ninguna concatenacion en `createNativeQuery`.
