# TiendaUTEQ (jakartapp)

Aplicacion web Jakarta EE (Servlets + JSP/JSTL) sobre PostgreSQL.
Control de acceso por rol (RBAC), carrito con reservas de inventario,
facturacion, reparto de pedidos equilibrado por numero de productos,
despacho por despachador y aviso por correo al proveedor cuando un
producto cae bajo el minimo de existencias.

## Stack
- Java 17, Maven (WAR), Jakarta EE (Servlet 6.1 / JSP / JSTL 3.0)
- Apache Tomcat 11
- PostgreSQL 13+ (JDBC directo)
- Jakarta Mail (correo al proveedor)
- Bootstrap 5 (CDN) en las vistas

## 1. Base de datos
```bash
createdb tiendauteq
psql -d tiendauteq -f sql/01_esquema.sql
psql -d tiendauteq -f sql/02_datos.sql
```
Esquemas creados: `seguridad`, `inventario`, `facturacion`.

## 2. Configuracion
Edite `src/main/resources/aplicacion.properties`:
```
db.url=jdbc:postgresql://localhost:5432/tiendauteq
db.user=postgres
db.password=postgres
factura.iva=0.15
mail.enabled=false          # true para enviar correos reales por SMTP
```
Con `mail.enabled=false` el aviso al proveedor NO se envia: se registra en
el log del servidor con la etiqueta `[CORREO SIMULADO]` (util para probar
sin un servidor SMTP).

## 3. Compilar y desplegar
```bash
mvn clean package
# genera target/jakartapp.war  ->  copielo a <TOMCAT>/webapps/
```
Abra: http://localhost:8080/jakartapp/

En IntelliJ IDEA Ultimate: Run Configuration tipo *Tomcat Server (Local)*,
artefacto `jakartapp:war exploded`, e inicie.

## 4. Usuarios de prueba
| Usuario | Clave    | Rol         |
|---------|----------|-------------|
| admin   | admin123 | ADMIN       |
| ana     | ana123   | CLIENTE     |
| luis    | luis123  | CLIENTE     |
| carlos  | desp123  | DESPACHADOR |
| marta   | desp123  | DESPACHADOR |

## 5. Como funciona la logica de negocio
- **RBAC**: la tabla `seguridad.pagina` marca paginas publicas; `seguridad.permiso`
  une rol-pagina. El filtro `SeguridadFiltro` resuelve cada peticion: publica ->
  pasa; restringida -> exige sesion y permiso, si no redirige a login o a 403.
- **Reservas**: `producto.existencias` es el stock fisico y `producto.reservado`
  lo retenido. Disponible = existencias - reservado. Al **agregar al carrito** se
  incrementa `reservado` (si hay disponible). Las unidades quedan reservadas.
- **Pago**: genera la factura, asigna el pedido al **despachador con menor carga
  medida por numero de productos** (suma de cantidades de lineas no despachadas)
  y lo deja `EN_DESPACHO`. El stock sigue reservado.
- **Despacho**: al marcar una linea como despachada se descuenta el stock fisico
  (`existencias--`) y se libera la reserva (`reservado--`). Si `existencias <
  existencias_minimas` se envia el correo al proveedor. Cuando todas las lineas
  estan despachadas el pedido pasa a `DESPACHADO`.
- **Cerrar sesion sin pagar**: se liberan las reservas (vuelven al inventario)
  pero el carrito se conserva (`pedido.liberado = TRUE`). Al **continuar** (o al
  volver a iniciar sesion) se re-reservan las cantidades segun la disponibilidad
  actual, ajustando o retirando lo que ya no alcance, y avisando al cliente.

## 6. Estructura
```
sql/                         scripts de BD
src/main/resources/          aplicacion.properties
src/main/java/org/uteq/servlet/
  config/   Config, Db
  modelo/   POJOs
  dao/      acceso a datos (JDBC)
  servicio/ logica de negocio (transacciones)
  filtro/   SeguridadFiltro (RBAC)
  web/      Servlets (controladores)
  util/     Passwords
src/main/webapp/             JSP publicas, WEB-INF/vistas, css
```

## Notas academicas
- Contrasenas: SHA-256 hex (demo). En produccion use bcrypt/Argon2 con sal.
- Conexiones: JDBC directo. En produccion use un pool (HikariCP) o DataSource JNDI.
