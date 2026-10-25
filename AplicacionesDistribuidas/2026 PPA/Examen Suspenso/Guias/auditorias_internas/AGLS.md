# Auditoría técnica — Equipo AGLS (TiendaTech · Comercio electrónico distribuido con asistente de armado)

Fecha de la auditoría: 16/09/2026. Corte: 13/09/2026 19:00 (UTC−5). Se evaluó sobre la copia congelada en `822399a` y sobre el clon completo. Las compilaciones y ejecuciones se hicieron en copias dentro de `scratchpad\work\AGLS\`.

## 1. Cabecera

| Campo | Valor |
|---|---|
| Repositorio | https://github.com/JoseLozanoMorales/TiendaTech. **No está transferido al docente**: la API de GitHub devuelve `owner.login = JoseLozanoMorales` el 16/09. Antes se llamó `PFC-AppsDistribuidas`. |
| Rama evaluada | `main` |
| Commit de corte | `822399a`, del 13/09/2026 18:20:50 −05. Mensaje: "actualizar portada y regenerar el manuscrito final". Autor: José Lozano. |
| Commits alcanzables | **341** en total (`git rev-list --count 822399a`); **212** por first-parent (`--first-parent`). El dato "341 por first-parent" de la asignación no es correcto: 341 es el total. |
| CI en el corte | Cinco workflows sobre `822399a`, todos `success` y terminados antes de las 19:00: CI run 34789458812 (11 jobs, fin 23:30Z = 18:30 −05), CI-CD quality gate 34789458803 (15 jobs), Integridad de datos, Publicar imágenes Docker y Desplegar en producción. |
| Commits posteriores al corte | 34 commits del 14 y 15/09 en `origin/main`, **todos de JhinsonAucatoma** (`60f2a1f`…`0cbd193`). Son trabajo del examen y no cuentan aquí. |

**Integrantes: commits hasta el corte.** Cifras de `git shortlog -sne 822399a`; entre paréntesis, sin merges.

| Integrante | Rol (guía / README) | Usuario git | Commits |
|---|---|---|---|
| **Aucatoma Celorio Jhinson Stalyn** (rinde el suspenso) | Arquitecto | `JhinsonAucatoma` <jaucatomac@uteq.edu.ec> | 99 (87) |
| Lozano Morales José Alejandro | Documentalista | `JoseLozanoMorales` | 90 (81) |
| Sánchez Pilaloa Andy Paul | Responsable de calidad | `AndySanchez2004` (85) + `Anyod26` (7), mismo correo | 92 (81) |
| Gaibor Rodríguez Jeremy Ruperto | Desarrollador (el README dice "Líder de Desarrollo") | `JeremyGaibor` | 60 (60) |

**Etiquetas existentes al corte.** Todas son ligeras (`git cat-file -t` → `commit`) y no hay ninguna anotada.

| Etiqueta | Tipo | Commit | ¿Existía al corte? |
|---|---|---|---|
| `pre-e4` | ligera | `b24a571` (28/08 23:56) | Sí |
| `mobile-debug-*` (31 etiquetas) | ligeras, creadas por CI (`gh release create`) | `3e07382` (11/09) … `ee19a03` (13/09 12:52) | Sí |
| `mobile-release-34780292598-1`, `…34781959553-1`, `…34786122582-1`, `…34789458812-1` | ligeras, creadas por CI | `c3edc7a`, `27180aa`, `4387e04` y **`822399a`** (Release publicado 23:29:57Z = 18:29 −05) | Sí |
| `mobile-release-34881001598-1`, `…34885565296-1` | ligeras | `60f2a1f`, `fb76f9b` (14/09) | **No**: posteriores al corte y fuera de su historial |
| `v4.0.0` | **ligera** | `92e6668` (14/09 18:51; Release creado 23:51Z) | **No**: posterior al corte |

Las cinco ramas remotas (`feature/ci-cd`, `feature/entrega-3`, `feature/entrega-4`, `fix/cobertura-ventas-facturacion`, `paso8-experimento-real`) están fusionadas en `822399a`: `git branch -r --merged 822399a`.

## 2. Tabla de los 20 entregables

| # | Entregable | Estado propio | Estado efectivo | % |
|---|---|---|---|---|
| 1 | Identificación y URL | Por modificar | Por modificar | 80 |
| 2 | Estructura y archivos de raíz | Por modificar | Por modificar | 65 |
| 3 | Línea base congelada e integración | Por culminar | Por culminar | 40 |
| 4 | Backend en capas y SOLID | Por modificar | Por modificar | 80 |
| 5 | Patrones GoF y ADR | Por culminar | Por culminar | 35 |
| 6 | Aplicación web funcional | Por culminar | Por culminar | 55 |
| 7 | Calidad de la aplicación web | Por modificar | Por culminar | 55 |
| 8 | Aplicación móvil funcional | Por modificar | Por modificar | 60 |
| 9 | Calidad de la aplicación móvil | Por modificar | Por modificar | 65 |
| 10 | Integración y contratos | Por culminar | Por culminar | 30 |
| 11 | Persistencia distribuida | Por modificar | Por modificar | 85 |
| 12 | Pirámide de pruebas | Por culminar | Por culminar | 45 |
| 13 | Pipeline CI/CD | Por modificar | Por culminar | 50 |
| 14 | Observabilidad | Por modificar | Por modificar | 55 |
| 15 | Protocolo y campaña experimental | Por culminar | Por culminar | 45 |
| 16 | Paquete de datos y reproducibilidad | Por modificar | Por culminar | 45 |
| 17 | Evaluación ISO/IEC 25010 | Por culminar | Por culminar | 35 |
| 18 | Manuscrito, bibliografía y trazabilidad | Por modificar | Por culminar | 45 |
| 19 | Amenazas a la validez y ética | Hecho | Por modificar | 85 |
| 20 | Trabajo en equipo y autoría | Por modificar | Por modificar | 55 |

Cómo se aplicó la regla de dependencia:
- §7 no puede superar a §6.
- §13 se construye sobre §12, porque las compuertas ejecutan esas pruebas.
- §16 depende de §15.
- §17 depende de §12 y §16.
- §18 depende de §15 a §17.
- §19 es análisis de la campaña de §15: habrá que reescribirlo cuando esta se repita.

## 3. Entregables no Hecho

### §1 Identificación y URL

**Qué encontré**
- La URL `https://github.com/JoseLozanoMorales/TiendaTech` es coherente en tres sitios:
  - `README.md:108`
  - `CITATION.cff:16-17`
  - la macro de enlaces del manuscrito (`PFC4.tex:23-24`) y 9 enlaces más
- El repositorio **no se transfirió** al docente, a diferencia de los otros tres equipos.
- **El commit de corte `822399a` quitó la URL de la portada.** El diff de `PFC4.tex` elimina 4 líneas: la URL y la leyenda "FECHA PERMITIDO DE ÚLTIMO COMMIT: Viernes 4 de septiembre…".
- La portada que queda (`PFC4.tex:30-56`) tiene tres datos desfasados: "Proyecto Fin de Curso — Paso 13", "Corte documental: 1 de septiembre de 2026" y "Período académico 2026" (el correcto es 2026–2027).
- Roles incoherentes: Jeremy figura como "Desarrollador" en el manuscrito y como "Líder de Desarrollo" en `README.md:15`.
- `CITATION.cff` declara `version: "4.0.0"` y `date-released: "2026-09-01"`, pero al corte no existía ninguna etiqueta `v4.0.0`.

**Cómo debe quedar**
- Repositorio transferido a `gleiston-guerrero`.
- La URL del nuevo propietario, idéntica en README, CITATION.cff, macro y portada del PDF.
- Portada con período 2026–2027, fecha de corte real y roles de la guía.
- `date-released` igual a la fecha de la etiqueta anotada de cierre.

**Qué deben hacer**
1. Transferir el repositorio (Settings → Transfer). Luego `git remote set-url origin https://github.com/gleiston-guerrero/TiendaTech.git`.
2. Sustituir la URL en `README.md`, `CITATION.cff`, `PFC4.tex` (macro y enlaces `\href`) y `scripts/validate_evidence_refs.py`, si la contiene. Con el cambio de propietario los enlaces pinneados siguen resolviendo por SHA.
3. Rehacer la portada: URL, período 2026–2027, corte real y "Entrega 4".
4. Unificar el rol de Jeremy.
5. Ajustar `date-released` tras crear la etiqueta (§3).

**Cómo lo verifico**
- `curl -s https://api.github.com/repos/gleiston-guerrero/TiendaTech | python -c "import json,sys;print(json.load(sys.stdin)['owner']['login'])"`
- `grep -rn "JoseLozanoMorales/TiendaTech" README.md CITATION.cff docs/entrega4/*.tex` debe devolver 0.
- `pdftotext -l 1 docs/entrega4/PFC4.pdf - | grep -E "github.com/gleiston-guerrero|2026.2027"`

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 1 | Trámite. |
| C | 1 | Sustituciones de texto. |
| A | 2 | Cuatro o cinco archivos y la recompilación. |
| T | 1 | Menos de 2 h. |

### §2 Estructura del repositorio y archivos de raíz

**§2a Configuración de IDE y binarios pesados versionados**

*Qué encontré*
- **Configuración de IDE.** Jhinson quitó 7 de los 8 archivos de `.idea/` raíz en `7147aa1` (12/09 22:06). Aun así, al corte siguen versionados:
  - `.idea/TiendaTech.iml`, con una excepción explícita en `.gitignore`
  - **7 archivos en `Apps/mobile/.idea/`**: `.gitignore`, `AndroidProjectSystem.xml`, `gradle.xml`, `markdown.xml`, `misc.xml`, `runConfigurations.xml`, `vcs.xml`

  La regla `.idea/*` de la raíz no alcanza a subcarpetas y la tabla de estructura del README no menciona `Apps/mobile/.idea/`.
- **Binarios y artefactos** en `git ls-files`:
  - `docs/evidencias/tolerancia_fallos.mp4` (92 MB)
  - `release/tiendatech-debug.apk` (40 MB)
  - `ops/observability/opentelemetry-javaagent.jar` (22 MB, descargable)
  - `docs/entrega4/cierre/integracion-20260912/compilacion.log`
  - **358 bases SQLite `.db`**, entre ellas `experiments/paso8/resultados-rubrica-20260904/` (240 `.db`, más un `…/warmup/2pc-none-c400-r10.db-journal` que delata una transacción SQLite sin cerrar)
- El pack pesa **230,55 MiB** (`git count-objects -vH`).

*Cómo debe quedar*
- Sin configuración de IDE en ninguna profundidad.
- Binarios de más de 5 MB fuera del árbol: como assets de Release o descargados por Dockerfile.
- Sin bases SQLite huérfanas ni journals.

*Qué deben hacer*
- Ejecutar: `git rm -r --cached Apps/mobile/.idea .idea/TiendaTech.iml`.
- Añadir `**/.idea/` y `*.iml` a `.gitignore` y quitar la excepción `!.idea/TiendaTech.iml`.
- Retirar el APK debug, el vídeo (publicarlo como asset y enlazarlo), el `javaagent.jar` (descargarlo con `ADD`/`curl` y verificar su suma en el Dockerfile) y `compilacion.log`.
- Borrar o empaquetar como asset `resultados-rubrica-20260904/` (ver §16).

*Cómo lo verifico*
- `git ls-files | grep -iE "(^|/)\.idea/|\.iml$|\.db-journal$|\.mp4$|debug\.apk$|\.jar$" | grep -v gradle-wrapper.jar` → vacío.
- `git ls-files | xargs -d '\n' du -k | sort -rn | head` → nada mayor de 5000 KB salvo el APK release, si se justifica.

*Estimación*

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 1 | Higiene conocida. |
| C | 2 | Mover el agente OTel al Dockerfile exige probar la imagen. |
| A | 3 | Más de 360 archivos y 3 Dockerfiles. |
| T | 2 | Entre 2 y 6 h. |

**§2b Secreto en el historial**

*Qué encontré*
- `396b1b3` (JeremyGaibor, 26/07/2026 15:11) versionó en `Tienda_Tech/src/main/resources/application.properties` un `paypal.clientId=Acrd3…` y un `paypal.clientSecret=EG6AQ…` de PayPal (`paypal.mode=sandbox`).
- `22c446b` los retiró 73 minutos después, pero siguen legibles en el historial de un repositorio público: `git show 396b1b3:Tienda_Tech/src/main/resources/application.properties`.
- No encontré claves AWS, claves privadas ni tokens `ghp_` en ninguna revisión: `git grep` de patrones sobre `git rev-list 822399a`.

*Cómo debe quedar*
- Credencial revocada en PayPal Developer.
- Constancia de la revocación en `docs/` (fecha y captura sin el valor).
- Opcional: historial depurado.

*Qué deben hacer*
- Revocar y rotar la app sandbox.
- Documentar la revocación en `docs/evidencias/`.
- Añadir `gitleaks detect` (o `trufflehog git file://.`) como job del CI.

*Cómo lo verifico*
- Leer la evidencia de revocación.
- Confirmar que el job de secretos está en `ci.yml` y en verde.

*Estimación*

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 2 | Criterio de gestión de secretos. |
| C | 1 | Revocar y añadir un job. |
| A | 1 | Un workflow y un documento. |
| T | 1 | Menos de 2 h. |

**§2c README contradictorio y Listado 3 sin mapear**

*Qué encontré*
- `README.md:47` declara "✅ Completo" los patrones Repository, Factory Method, Strategy, Observer y Decorator. `docs/adr/ADR-005-patrones-gof.md:150-170` admite que Factory Method y Observer no existen (ver §5).
- `README.md:231-232` ("5. Pruebas y CI/CD") dice "No implementado: contratos Pact, pruebas E2E con Playwright y lint … para la web", en contra de la tabla de §1 y de la §9 del mismo README.
- La tabla D5.2 afirma que la publicación "se condiciona a" contratos y E2E, lo que es falso (ver §13).
- Faltan, o no están mapeadas, varias piezas del Listado 3:
  - `docs/adr/ADR-006-*` no existe; la decisión móvil está en `002-mobile-platform.md`.
  - `docs/experimentos/protocolo-e3.md` y `protocolo-e4.md` no existen: `protocolo.md` es PySpark y `protocolo-iso25010.md` es ISO.
  - `ops/grafana/pfc-dashboard.json` y `ops/otel-collector/config.yaml` no existen.
  - `release/apk/` no existe.
- `.gitattributes` fija LF para `*.csv`, `*.tsv`, `checksums.txt`, `docs/evidencias/*-e4.txt` y `checksums-datos.sha256`, pero no incluye `* text=auto`.
  - Hoy hay 943 archivos LF y 7 CRLF, todos `*.headers` HTTP crudos: `git ls-files --eol`.
  - Los cuatro integrantes trabajan en Windows (rutas `C:\Users\franc\…` en los XML de PMD), así que el riesgo de regresión sigue.
- La carpeta `Evidencias de trabajo/` ya figura en la tabla del README (`9d6b242`), así que ese pendiente quedó cerrado.

*Cómo debe quedar*
- README sin afirmaciones falsas y alineado con el estado real.
- Tabla de correspondencia Listado 3 → ruta real, con justificación de cada desviación.
- `.gitattributes` con `* text=auto eol=lf` y las excepciones binarias o CRLF.

*Qué deben hacer*
- Reescribir las tablas de estado §1, §5 y §9 del README con estados verificables.
- Añadir una tabla "Listado 3 → TiendaTech".
- Añadir al principio de `.gitattributes`: `* text=auto eol=lf`, `*.headers -text`, `*.png binary`, `*.apk binary`, etc.
- Ejecutar `git add --renormalize .`.

*Cómo lo verifico*
- `git ls-files --eol | awk '{print $1}' | sort | uniq -c`
- `grep -n "No implementado" README.md`
- Revisión manual de la tabla de mapeo.

*Estimación*

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 2 | Exige conocer el estado real. |
| C | 1 | Documental. |
| A | 2 | README, .gitattributes y renormalización. |
| T | 2 | Entre 2 y 6 h. |

### §3 Línea base congelada e integración

**Qué encontré**
- **No hay etiqueta anotada de cierre al corte.** `pre-e4` es ligera y está en `b24a571` (28/08). `v4.0.0` es ligera y posterior al corte (`92e6668`, 14/09).
- **No hay `CHANGELOG`**: `git ls-tree -r --name-only 822399a | grep -i changelog` → vacío.
- La integración en `main` está completa: todas las ramas fusionadas.
- **Casi nada pasó por PR revisado.** De 21 merges en first-parent, solo 3 son de PR (#14, #79, #80). Según la API (`/pulls/N/reviews`):

  | PR | Autor | Fusionado por | Revisión |
  |---|---|---|---|
  | #79 | Jhinson | José | `APPROVED` de José: **la única aprobación cruzada** |
  | #80 | Jhinson | Jhinson | ninguna |
  | #81–#84 | Andy | Andy | ninguna (#84, del Paso 8, se fusionó 4 minutos después de abrirse) |
  | #14 | José | Jhinson | solo comentarios |

- **Desde el 01/09 hubo 82 commits directos a `main` sin PR**: José 28, Andy 18, Jeremy 18, Jhinson 18 (`git log --first-parent --no-merges --since=2026-09-01 822399a`).
- `main` no tiene protección efectiva: los push directos entraron sin bloqueo.

**Cómo debe quedar**
- Etiqueta **anotada** (`git cat-file -t` → `tag`) sobre el último commit de la entrega, con mensaje y tagger.
- `CHANGELOG.md` con entradas fechadas por versión (E1, E2, E3, E4 y examen).
- A partir de ahora, todo cambio por PR con aprobación de un integrante distinto del autor.
- Protección de rama con "Require approvals: 1".

**Qué deben hacer**
1. Activar la protección de `main`: 1 aprobación y checks obligatorios.
2. Llevar el trabajo del suspenso por PR. Jhinson abre y **otro integrante** aprueba y fusiona.
3. Crear `CHANGELOG.md` siguiendo keepachangelog, con fechas reales tomadas del historial (`pre-e4` 28/08, entregas y examen).
4. Al terminar, ejecutar:
   - `git tag -a v4.1.0 -m "Cierre examen suspenso AGLS" <sha>`
   - `git push origin v4.1.0`
   - borrar la etiqueta ligera `v4.0.0` o sustituirla por una anotada.

**Cómo lo verifico**
- `git cat-file -t v4.1.0` → `tag`.
- `git rev-list -n1 v4.1.0` igual a la punta de `main`.
- `curl -s ".../pulls?state=closed&per_page=100"` más `/reviews` por PR: el aprobador debe ser distinto del autor.
- `head -30 CHANGELOG.md`.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 1 | Proceso conocido. |
| C | 1 | Comandos git y ajustes de GitHub. |
| A | 2 | CHANGELOG, etiqueta y proceso de PR para todo lo demás. |
| T | 2 | CHANGELOG retrospectivo de E1 a E4, entre 2 y 6 h. |

### §4 Backend en capas y SOLID

**Qué encontré**
- Los 6 servicios Java tienen `domain/application/infrastructure/presentation`. Archivos por capa (dominio / aplicación / infraestructura / presentación):

  | Servicio | domain | application | infrastructure | presentation |
  |---|---|---|---|---|
  | inventario | 4 | 4 | 10 | 6 |
  | ordenes-proveedores | 7 | 2 | 7 | 10 |
  | pedidos | 27 | 5 | 21 | 11 |
  | productos | 6 | 1 | 5 | 6 |
  | usuarios | 26 | 17 | 36 | 14 |
  | ventas | 6 | 3 | 7 | 7 |

- El dominio está limpio: `grep -rE "import (jakarta.persistence|org.springframework|lombok)" services/*/src/main/java/**/domain` → 0.
- Hay 34 puertos en dominio con su adaptador; `application → infrastructure` → 0 imports.
- **Violaciones concretas:**
  - `inventario/application/reservation/StockReservationService.java:5,16,21,47-66` recibe `JdbcTemplate` y ejecuta `SELECT … FOR UPDATE` en la capa de aplicación.
  - `CrdbTransactionRetryExecutor.java:17,27` usa `TransactionTemplate`.
  - `usuarios/application/.../OtpService.java:8,73,137` usa `BCrypt` directamente aunque existe el puerto `PasswordHasher`.
  - `ResponseStatusException` en la capa de aplicación:
    - `UsuarioService.java:227-325` (unas 12 veces)
    - `OrdenCompraService.java:84`
    - `ProveedorService.java:44`
    - `OrdenService.java:192`
    - `FacturaService.java:56`
  - La presentación importa infraestructura concreta:
    - `inventario/presentation/ReservationStatusController.java:4-5` (servidores TCP/gRPC)
    - `ventas/presentation/FacturaController.java:11` (`ExperimentFaultInjector`)
    - `pedidos/presentation/CarritoController.java:8-10`
- El gateway (`Apps/web/frontend`) no tiene capas: un paquete plano más `security/`.

**Cómo debe quedar**
- La capa de aplicación depende solo de puertos del dominio y de excepciones de dominio.
- El SQL y la transacción del framework viven en adaptadores.
- La traducción a HTTP ocurre en `@ControllerAdvice` de presentación.
- Una prueba de arquitectura lo impide en CI.

**Qué deben hacer**
- Extraer un `StockReservationPort` en el dominio de inventario y mover el SQL a `infrastructure/persistence`.
- Envolver `TransactionTemplate` tras un puerto `TransactionRunner`.
- Sustituir `BCrypt` por `PasswordHasher`.
- Crear excepciones de dominio (`RecursoNoEncontrado`, `ConflictoNegocio`) y mapearlas en `ApiExceptionHandler`.
- Añadir **ArchUnit** a cada servicio con las reglas `noClasses().that().resideInAPackage("..application..").should().dependOnClassesThat().resideInAnyPackage("org.springframework..","..infrastructure..","..presentation..")` y la equivalente para `domain`.

**Cómo lo verifico**
- `grep -rn "JdbcTemplate\|ResponseStatusException\|TransactionTemplate\|BCrypt" services/*/src/main/java/**/application` → 0.
- `mvn -f services/<s>/pom.xml test -Dtest=ArquitecturaTest` en verde en CI.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | Diseño hexagonal y excepciones de dominio. |
| C | 3 | Refactor con riesgo en la reserva de stock (TCP/gRPC). |
| A | 3 | Seis servicios y unos 20 archivos. |
| T | 3 | Entre 6 y 15 h. |

### §5 Patrones GoF y ADR

**§5a Patrones exigidos por la Tabla 1**

*Qué encontré*

| Patrón exigido | En el código | Evidencia |
|---|---|---|
| Repository | Real | Puertos más `Jdbc*Repository` en 6 servicios. El propio ADR-005:180 lo califica de Fowler, no de GoF. |
| Factory Method | **No existe** | ADR-005:154-158: "no tienen lógica condicional… no Factory Method GoF". |
| Strategy (métodos de pago) | **No existe** | `MetodoPago` y `TipoMetodoPago` son POJOs; `OrdenService.generarOrdenDesdeCarrito` (`:88-125`) solo pasa el entero `metodopagoId`. El único Strategy real está en `services/armado-ia/app/explicacion/` (Python: Bedrock frente a fallback). |
| Observer (eventos de pedido) | **No existe** | 0 usos de `ApplicationEventPublisher`/`@EventListener`; ADR-005:163-166 lo admite. |
| Decorator (promociones) | **No existe** | Ninguna clase de promoción o descuento en `services/`. El único Decorator es `TrustedUserHeaderRequest extends HttpServletRequestWrapper` en `JwtGatewayFilter.java:112,149`, ajeno a promociones. |

- Patrones reales fuera de la Tabla 1: Strategy, Adapter, Chain of Responsibility y Template Method en `armado-ia`, más el Decorator del gateway. **Ninguno está en el dominio de venta.**
- El README los declara "✅ Completo".

*Cómo debe quedar*

Los cinco patrones de la Tabla 1 en el flujo real de checkout, cada uno con prueba unitaria que demuestre la variación:
- `PaymentStrategy` con al menos 2 implementaciones (tarjeta, transferencia o contra entrega), elegida en `OrdenService` según `TipoMetodoPago`.
- `PedidoEventPublisher`/`OrderObserver` con al menos 2 suscriptores reales, por ejemplo facturación y notificación, que desemboquen en el push del móvil de §8.
- `PrecioDecorator` o `PromocionDecorator` apilable (porcentaje y 2×1) aplicado al total del carrito.
- `Factory Method` con creador abstracto y concretos, por ejemplo `CreadorMetodoPago`.

*Qué deben hacer*
- Implementar los cuatro patrones en `pedidos-service` y `ventas-service`, por puertos y sin Spring en el dominio.
- Conectarlos al endpoint `/api/ordenes/checkout`.
- Escribir las pruebas `PaymentStrategyTest`, `PromocionDecoratorTest`, `PedidoObserverTest` y `FactoryMethodTest`.
- Actualizar ADR-005 con clase, archivo y línea de cada patrón.

*Cómo lo verifico*
- `grep -rln "interface .*Strategy\|interface .*Observer\|abstract class .*Decorator\|Decorator implements" services/*/src/main/java`
- Leer que `OrdenService` invoca la estrategia.
- `mvn test` de las 4 pruebas.
- Retirar una implementación y comprobar que una prueba falla.

*Estimación*

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | Aplicar GoF con criterio, no como adorno. |
| C | 3 | Integración en checkout con transacciones y outbox. |
| A | 3 | Dos servicios, unos 15 archivos, pruebas y ADR. |
| T | 4 | Entre 15 y 30 h. |

**§5b ADR-006 (elección móvil)**

*Qué encontré*
- No existe `ADR-006`: la numeración salta de 005 a 007.
- `docs/adr/002-mobile-platform.md` tiene Estado, Contexto, Decisión y Consecuencias, pero sus "criterios cuantitativos" son triviales ("1 de 1", "proyectos base 1 vs 0", "módulos Gradle 1 vs ≥2").
- No nombra alternativas concretas (Flutter, React Native, KMP).

*Cómo debe quedar*
- `docs/adr/ADR-006-eleccion-movil.md` en formato Nygard.
- Al menos 2 alternativas nombradas.
- Al menos 2 criterios medidos con cifra y fuente: tamaño del APK release (35 849 002 B en `release/`), tiempo de arranque en frío, líneas de código compartidas, tiempo de build en CI (Android job ≈ 3 min 15 s en el run 34789458812), soporte de CameraX/ML Kit.

*Qué deben hacer*
- Redactar el ADR con las cifras medidas y enlazarlo desde README y manuscrito.

*Cómo lo verifico*
- `ls docs/adr/ADR-006*`
- `grep -cE "^## (Estado|Contexto|Decisión|Consecuencias)" docs/adr/ADR-006*` → 4.
- Revisar que haya al menos 2 cifras con unidad.

*Estimación*

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 2 | Criterio de decisión. |
| C | 1 | Documental más 2 mediciones. |
| A | 1 | Un archivo. |
| T | 1 | Menos de 2 h. |

### §6 Aplicación web funcional

**Qué encontré** (`Apps/web/frontend/webapp`, React 18 + Vite, `App.tsx:69-82`, HashRouter)
- **Rutas.** Hay 12: `/`, `/login`, `/producto/:id`, `/carrito`, `/admin`, `/armado`, `/registro`, `/recuperacion`, `/cuenta`, `/pago`, `/factura/:id?`, `/trabajador`. **Faltan `/main`, `/settings` y `/about`**, y no hay mapeo justificado.
- **Protección.** Solo `/admin` tiene guarda (`AdminRoute`, `App.tsx:17-20`), y decide por el rol en `sessionStorage` sin validar el JWT ni su expiración. `/carrito`, `/trabajador` y `/factura` no tienen guarda.
- **i18n inexistente**: textos en español escritos a mano y ninguna librería (`grep i18n package.json` → 0).
- Tema claro/oscuro: sí (`App.tsx:25-26`). Estados de carga y error: sí.
- **JWT.** El access token está en `sessionStorage` (`session.ts:43-47,72-74`), accesible desde JavaScript. El refresh va en cookie httpOnly (`AuthController.java:25-26`).
- **Checkout inoperante.** `CheckoutView.tsx:7` contiene `<button className="button" disabled>Pago pendiente de integración</button>` y nunca llama a `/api/ordenes/checkout`. Ya figuraba como pendiente en `docs/actas/acta-2026-09-04.md`.
- **Panel de vendedor.** `WorkerView.tsx` solo muestra 2 contadores y 2 enlaces.
- **Dashboard de administrador sin métricas de negocio.** `AdminView.tsx`: `Overview:53` cuenta productos, categorías y usuarios; `SalesPanel:59` lista facturas sin agregados.
- **Suplantación de identidad.** El cliente envía `X-Usuario-Id` (`api.ts:149`); el gateway solo sobrescribe `X-User-Id`, `X-Usuario` y `X-User-Role` (`JwtGatewayFilter.java:107-110`); `OrdenCompraController.java:29-31` confía en `X-Usuario-Id`.

**Cómo debe quedar**
- Las 5 rutas de la guía, más las del dominio, con guarda JWT (validación de `exp`) en todas las privadas.
- i18n es/en con conmutador y persistencia.
- Access token en memoria, con refresh por cookie httpOnly.
- Checkout funcional hasta la factura.
- Panel de vendedor con operaciones: sus productos, stock y pedidos por estado.
- Dashboard admin con métricas agregadas (ventas por día, ticket medio, top-N productos, conversión).
- `X-Usuario-Id` eliminado o sobrescrito en el gateway.

**Qué deben hacer**
1. Añadir `/main` (portada autenticada), `/settings` (idioma, tema, sesión) y `/about` (equipo, versión, enlace al repositorio) en `App.tsx`, y un `ProtectedRoute` que decodifique `exp`.
2. Instalar `i18next` + `react-i18next`, crear `locales/es.json` y `locales/en.json` y sustituir los literales.
3. Mover el token a un módulo en memoria (`let accessToken`) con refresh silencioso al recargar.
4. Implementar `CheckoutView` contra `POST /api/ordenes/checkout` (dirección, método de pago, estrategia de §5, confirmación y redirección a `/factura/:id`).
5. Crear un endpoint de métricas agregadas en ventas o pedidos y consumirlo en `AdminView`.
6. En `JwtGatewayFilter`, eliminar o sobrescribir `X-Usuario-Id` con el `sub` del token.

**Cómo lo verifico**
- `grep -nE "path=\"/(main|settings|about)\"" src/App.tsx`
- `grep -rn "localStorage\|sessionStorage" src/services/session.ts` → sin token.
- `ls src/locales/{es,en}.json`
- `grep -n "disabled" src/views/CheckoutView.tsx` → 0.
- Spec Playwright de compra completa (§12) en verde.
- `curl -H "X-Usuario-Id: 1" …` con el token de otro usuario → 403.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | Seguridad de sesión e i18n. |
| C | 3 | Checkout real y métricas agregadas con backend. |
| A | 4 | 12 vistas con i18n, gateway y un endpoint nuevo. |
| T | 4 | Entre 15 y 30 h. |

### §7 Calidad de la aplicación web

**Qué encontré**
- `strict: true` (`tsconfig.app.json:7`). `npx tsc -p tsconfig.test.json` termina con código 0.
- ESLint: 0 errores y 0 advertencias. `lint-report.mjs:22,29` falla ante cualquier advertencia y CI lo ejecuta en `web-quality`.
- **La cobertura sigue siendo de alcance elegido.** `vitest.config.ts:14-27` enumera 12 vistas en `coverage.include` y excluye `App.tsx`, `main.tsx`, `services/api.ts`, `services/cart.ts`, `services/session.ts` y `views/shared.ts`.
  - **No hay `coverage.thresholds`**: la compuerta no puede fallar por cobertura.
  - `a55a3a0` (Jhinson, "generar dinámicamente el alcance…") solo cambia el texto del resumen en `ci.yml:152-159`; no el alcance.
- **Ejecución en copia** (`npm ci && npx vitest run --coverage`): 14 archivos y 62 pruebas en verde.

  | Alcance | Líneas | Sentencias | Ramas | Funciones |
  |---|---|---|---|---|
  | Configurado | 79,37 % (177/223) | **56,08 % (631/1125)** | 43,98 % | 43,12 % |
  | Todo `src` | 71,77 % (267/372) | **56,22 % (741/1318)** | 45,10 % | 44,47 % |

  - El porcentaje de líneas está inflado porque los componentes están escritos en muy pocas líneas: `AdminView.tsx` son 48 KB en 138 líneas y `CheckoutView.tsx` 2,9 KB en 7.
  - En 0 % están `App.tsx` (0/50 sentencias) y `cart.ts` (0/25).
- **La evidencia versionada está desfasada.** `docs/evidencias/cobertura/web/` es del 11/09 (`e4027c0`): 3 vistas, 19 pruebas, 53,39 % de líneas y 30,78 % de sentencias. El README la enlaza como "Cobertura medida de carrito, checkout y órdenes".
- `Apps/web/frontend/Dockerfile` es multi-stage de 3 etapas (node → maven → JRE), pero corre como root y no tiene HEALTHCHECK.
- **No hay artefacto `dist` versionado por hash en CI.** El bundle solo viaja dentro de la imagen `frontend-<sha7>`.

**Cómo debe quedar**
- Cobertura medida sobre `src/**/*.{ts,tsx}` (exclusiones solo de `main.tsx` y tipos, justificadas) con `thresholds: {statements:70, branches:70, functions:70, lines:70}`.
- CI en rojo si no se alcanza.
- Evidencia versionada regenerada desde la última corrida.
- Artefacto `webapp-dist-<sha>` con su SHA-256 subido en CI.

**Qué deben hacer**
1. En `vitest.config.ts`, usar `include: ['src/**/*.{ts,tsx}']`, `exclude: ['src/main.tsx','src/**/*.d.ts']` y `thresholds` al 70.
2. Escribir pruebas de `App.tsx` (enrutado y guardas), `cart.ts`, `session.ts`, `api.ts` y de las ramas de `AdminView`.
3. Desminificar los componentes (Prettier) para que la métrica de líneas sea significativa.
4. En `web-quality`, añadir `npm run build`, `tar czf webapp-dist-${GITHUB_SHA}.tgz dist && sha256sum … > ….sha256` y `upload-artifact`.
5. Regenerar `docs/evidencias/cobertura/web/` desde `coverage-summary.json`.
6. En el Dockerfile, añadir `USER` no root y `HEALTHCHECK`.

**Cómo lo verifico**
- `cd Apps/web/frontend/webapp && npm ci && npx vitest run --coverage`: 0 si se alcanza y distinto de 0 si no.
- `node -e "console.log(require('./coverage/coverage-summary.json').total.statements.pct)"` ≥ 70.
- Bajar un umbral a 99 en una rama y comprobar que el CI se pone en rojo.
- Artefacto `webapp-dist-<sha>` en el run.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 2 | Testing de componentes React. |
| C | 3 | Llegar de 56 % a 70 % de sentencias con `AdminView` al 35,85 % exige muchas pruebas de ramas. |
| A | 3 | Unos 10 archivos de prueba, configuración y CI. |
| T | 3 | Entre 6 y 15 h. |

### §8 Aplicación móvil funcional

**Qué encontré** (`Apps/mobile`, Kotlin, Compose y Hilt)
- Correcto: login, catálogo (listado y detalle), carrito y checkout contra el backend (`AccountRepository.kt:88-106`).
- JWT cifrado con AES-GCM y clave del Android Keystore (`AndroidKeystoreTokenCipher.kt:15-56`): correcto.
- **Sin conexión, pero parcial**: Room solo para productos y categorías (`CatalogRepository.kt:21-84`).
- **No hay pull-to-refresh**: 0 usos de `PullToRefresh`; solo el botón "Actualizar catálogo" (`CatalogScreens.kt:128-130`).
- **Las notificaciones push de estado del pedido no existen.**
  - No hay Firebase ni FCM en `build.gradle.kts`.
  - `AndroidOrderNotificationPublisher` solo se dispara con un botón de demostración (`NotificationsScreen.kt:37,57`).
  - La pantalla lo declara en `:51-52`: "No existe configuración Firebase, registro de dispositivo ni eventos de estado en el backend".
- **La cámara es real, pero la búsqueda es falsa.** CameraX y ML Kit sí están (`BarcodeAnalyzer.kt:10-34`, `ScannerScreen.kt:114-124`), pero el código leído se busca en **una tabla fija de 5 EAN de demostración** (`BarcodeLookup.kt:21-31`, `ScannerModule.kt:17-21`), no en el backend.
- El README (§1) describe la segunda capacidad como "caché local Room/SQLite + funcionalidad adicional", lo que no corresponde a la Tabla 1.

**Cómo debe quedar**
- Push real (FCM o, como mínimo documentado, WorkManager con sondeo y notificación) disparado por cambios de estado reales del pedido. Idealmente, desde el Observer de §5.
- Escáner que resuelva el código contra `GET /api/productos?codigoBarras=`.
- `PullToRefreshBox` en el catálogo y en los pedidos.

**Qué deben hacer**
1. Añadir la columna `codigo_barras` en productos (migración y seed), el endpoint de búsqueda y la sustitución de `BarcodeLookup` por un repositorio remoto con caché Room.
2. Integrar FCM:
   - `google-services.json` fuera del repositorio, inyectado como secreto en CI.
   - Registro de token en `usuarios-service`.
   - Envío desde el Observer de pedidos.
   - Como alternativa sin Firebase: `WorkManager` periódico que consulte `/api/ordenes/{id}` y notifique el cambio.
3. `PullToRefreshBox` en `CatalogScreen` y `OrdersScreen`.

**Cómo lo verifico**
- `grep -rn "firebase-messaging\|FirebaseMessagingService\|WorkManager" Apps/mobile/app`
- `grep -rn "codigoBarras\|codigo_barras" services Apps/mobile`
- `grep -rn "PullToRefresh" Apps/mobile/app/src/main`
- Vídeo o capturas en `release/screenshots/` con el pedido cambiando de estado y la notificación recibida sin pulsar el botón de demostración.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | Push y ciclo de vida de Android. |
| C | 4 | FCM de extremo a extremo (backend, token y CI con secreto). |
| A | 3 | Móvil, usuarios, pedidos y productos. |
| T | 4 | Entre 15 y 30 h. |

### §9 Calidad de la aplicación móvil

**Qué encontré**
- **Pruebas unitarias.** 13 archivos con 58 `@Test`, pero **solo 1 de 11 ViewModels tiene pruebas** (`ScannerViewModelTest`, 6). Sin pruebas: Auth, Session, Catalog ×2, Cart, Account ×2, Orders ×2 y Theme.
- **Pruebas instrumentadas.** 4, en `ExampleInstrumentedTest` (plantilla), `TiendaTechDatabaseTest` y `NotificationIntegrationTest`. **Ninguna es E2E de interfaz** (0 Espresso o Compose UI test).
- **Firma de release: resuelta al corte.**
  - `build.gradle.kts:65-72,86` define `signingConfig distribution` desde variables de entorno.
  - `ci.yml:279-327` decodifica el secreto, ejecuta `assembleRelease` y verifica con `apksigner` la huella fijada `6ad168c1…8bbd`.
  - `ci.yml:329-361` publica la prerelease `mobile-release-34789458812-1` sobre `822399a` (23:29:57Z).
  - `keytool -printcert -jarfile release/tiendatech-release.apk` da `CN=Jose Alejandro Lozano Morales`, válido de 2026-09-13 a 2054.
  - No hay keystore versionado.
- **Defectos que quedan:**
  - `release/tiendatech-debug.apk` (`CN=Android Debug`, debuggable) sigue versionado, y es el único que verifica el job `android-mobile` (`ci.yml:237-239`).
  - `release/tiendatech-release.apk` (35 849 002 B) es la compilación **local** de `62b59f1`. No es el binario del CI (35 849 007 B y sha256 `91276296…`, según `docs/evidencias/firma-release-jose/verificacion-ci-20260913.json`).
  - `versionCode = 1`, `versionName "1.0"` (`build.gradle.kts:59`) y R8 desactivado (`:91`).

**Cómo debe quedar**
- Al menos 1 prueba unitaria por ViewModel con lógica (unos 10), con corrutinas de prueba.
- Al menos 1 prueba instrumentada E2E de interfaz (login → catálogo → carrito) ejecutada en CI con emulador (`reactivecircus/android-emulator-runner`) o documentada con su informe.
- El APK del repositorio igual al publicado por CI, o solo el enlace al Release.
- `versionCode` incremental.

**Qué deben hacer**
1. Crear pruebas de `AuthViewModel`, `CatalogViewModel`, `CartViewModel`, `OrdersViewModel` y `AccountViewModel` con `kotlinx-coroutines-test` y repositorios falsos.
2. Escribir `LoginToCartE2ETest` con `createAndroidComposeRule<MainActivity>()` y un servidor simulado (MockWebServer).
3. Añadir un job de emulador en CI (API 26 y 34) que ejecute `connectedDebugAndroidTest`.
4. Retirar el APK debug del árbol, sustituir el release local por el descargado del Release de CI (o retirarlo) y verificar `sha256sum -c` contra el asset.
5. `versionCode` a partir de `GITHUB_RUN_NUMBER`.

**Cómo lo verifico**
- `grep -rl "ViewModel" Apps/mobile/app/src/test | wc -l` ≥ 10.
- `grep -rn "createAndroidComposeRule\|onView(" Apps/mobile/app/src/androidTest`
- Job de emulador en verde.
- `sha256sum release/tiendatech-release.apk` igual al `.sha256` del Release de CI.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | Testing de Android y emulador en CI. |
| C | 3 | Emulador en GitHub Actions y corrutinas. |
| A | 3 | Unos 12 archivos de prueba y un workflow. |
| T | 3 | Entre 6 y 15 h. |

### §10 Integración y contratos

**Qué encontré**
- En `tests/contract/` hay 2 pruebas de consumidor Node, con 1 interacción cada una:
  - `web-catalog.pact.test.js`: `GET /api/productos?page=0&size=12`.
  - `mobile-login.pact.test.js`: `POST /api/login`.
- Llaman al mock de Pact con `fetch`. **No ejercen el cliente real**: ni `api.ts` de la web ni Retrofit de Kotlin; el "consumidor móvil" es JavaScript.
- **No hay verificación de proveedor**: `grep -ri pact services/*/pom.xml` → 0. No hay `@Provider`, `@State` ni broker.
- El job `contract-tests` (`ci.yml:169-191`) solo genera y sube JSON: **no puede fallar por incompatibilidad con el backend**.
- **Los contratos no coinciden con los proveedores reales:**
  - `productos-service/presentation/ApiResponseAdvice.java:20-37` envuelve en `{status,data,message,timestamp}`, pero el pact espera un arreglo.
  - El móvil real espera `ApiEnvelope<LoginResponse>` (`AuthApi.kt:13`), pero el pact espera `{user, access}`.

**Cómo debe quedar**
- Consumidores Pact escritos sobre el código real de cada cliente: Pact JS sobre `src/services/api.ts` y Pact JVM consumer en `Apps/mobile` sobre la interfaz Retrofit.
- Al menos 3 interacciones por cliente: login, catálogo y checkout.
- Verificación de proveedor con `pact-jvm-provider-junit5` en `usuarios`, `productos` y `pedidos`, con `@State`.
- Job de verificación en CI que falle si cambia el contrato.

**Qué deben hacer**
1. Reescribir los consumidores para que importen y usen los clientes reales.
2. Añadir el consumidor Kotlin (`au.com.dius.pact.consumer:junit5`).
3. En cada proveedor: `@Provider("productos-service") @PactFolder("../../tests/contract/pacts")`, pruebas `@TestTemplate` con `@State` que siembren datos.
4. Job `contract-verify` que dependa de `contract-tests` y ejecute `mvn -Dtest=*PactVerificationTest test` en los 3 servicios.
5. Corregir la forma de las respuestas en los contratos (el envelope).

**Cómo lo verifico**
- `grep -rln "@Provider\|PactVerificationContext" services`
- Alterar un campo del envelope en `ApiResponseAdvice` en una rama: el job `contract-verify` debe ponerse en rojo.
- Contar interacciones: `jq '.interactions|length' tests/contract/pacts/*.json`.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | CDC con estados de proveedor. |
| C | 3 | Pact JVM, estados con base de datos y CI. |
| A | 3 | Web, móvil, 3 servicios y CI. |
| T | 3 | Entre 6 y 15 h. |

### §11 Persistencia distribuida

**Qué encontré**
- Lo que está bien:
  - `docker-compose.yml` levanta `tiendatech-crdb-1/2/3` (v23.2.4) con healthchecks e init (`:332-349`).
  - Evidencia de fragmentación en `docs/evidencias/rangos-pedidos-e4.txt` y `rangos-catalogo-e4.txt`.
  - Prueba de caída en `docs/evidencias/resultados-tolerancia-e4/`: `docker kill crdb-2` el 01/09 02:15; `estado-tras-30s.txt` con `is_live=false`; consultas con éxito (4 919 ms inmediatamente después y 428 ms a los 30 s); reintegración en 3,62 s. Coherente con el commit `78aac37` (01/09 02:26).
- Defectos:
  - **Migraciones incompletas y sin mecanismo.** `crdb-init` aplica solo `docs/db/schema.sql`. `docs/db/migrations/` contiene únicamente `V004`, `V005` y `V006` (faltan V001–V003), no hay Flyway ni Liquibase y nada las ejecuta.
  - La prueba de tolerancia es una sola ejecución (n = 1), solo de lectura (`SET ordenes_dia 1644`), sin escrituras durante la caída.
  - Los CSV usan BOM y coma decimal (`"464,01"`).

**Cómo debe quedar**
- Migraciones versionadas completas (V001…Vn) aplicadas por una herramienta (Flyway en cada servicio o un job `flyway migrate` en compose) e idempotentes.
- Prueba de caída con escrituras concurrentes (al menos 3 repeticiones) que verifique que no se pierden commits.

**Qué deben hacer**
1. Generar `V001__esquema_base.sql` desde `schema.sql` y renumerar.
2. Añadir `flyway-core` y `flyway-database-postgresql` (compatible con CRDB) o un servicio `flyway` en compose.
3. Ampliar `probar-tolerancia-fallos-e4.ps1` con un bucle de inserciones durante la caída y conteo final (insertadas = confirmadas), repetido 3 veces, con CSV en formato decimal con punto y sin BOM.

**Cómo lo verifico**
- `ls docs/db/migrations` (o `services/*/src/main/resources/db/migration`) → V001 continuo.
- `grep -rn flyway services/*/pom.xml docker-compose.yml`
- CSV nuevo con 3 filas y `perdidas=0`.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 2 | Migraciones y CRDB. |
| C | 2 | Flyway sobre CockroachDB tiene particularidades. |
| A | 2 | Compose, SQL y un script. |
| T | 2 | Entre 2 y 6 h. |

### §12 Pirámide de pruebas

**§12a Cobertura backend real y compuerta sin filtro**

*Qué encontré*
- Los 6 `pom.xml` exigen `BUNDLE LINE ≥ 0.70` **solo sobre `application/**`**:
  - `inventario/pom.xml:90`
  - `ordenes-proveedores/pom.xml:79`
  - `pedidos/pom.xml:112-114`
  - `productos/pom.xml:70`
  - `ventas/pom.xml:85`
  - `usuarios/pom.xml:146`, aún más estrecho: `application/service/**`
- El gateway no tiene JaCoCo. armado-ia mide `--cov=app.domain --cov=app.explicacion` (`ci-cd.yml:70`).
- `docs/experimentos/resultados/iso25010/cobertura-summary.csv` declara inventario 8/8 líneas, productos 23/23 y ventas 27/27, **sobre XML del 28/08 (`15e4554`) desfasados**: inventario ya tiene 270 líneas en `application/reservation`.
- La auditoría del 12/09 ya señalaba la compuerta filtrada a un paquete, y sigue sin corregirse al corte.
- **Confirmación posterior al corte** (no computa como hecho): el commit `da164e4` de Jhinson (15/09) regenera sobre el árbol completo y obtiene **25,60 % agregado (1506/5884)**, con 11,72–41,14 % por servicio. **Ningún servicio alcanza el 70 %.**

*Cómo debe quedar*
- JaCoCo sin `<includes>` restrictivos. Exclusiones solo de `*Application.java`, DTOs generados y configuración, justificadas.
- Umbral 0,70 por servicio (incluido el gateway) que falle en CI.
- Evidencia regenerada en cada CI.

*Qué deben hacer*
- Quitar los `<includes>` y añadir `<excludes>` mínimos.
- Escribir pruebas de infraestructura (repositorios JDBC con Testcontainers), presentación (`@WebMvcTest`) y dominio.
- Añadir JaCoCo al gateway.
- Regenerar `cobertura-summary.csv` desde los `jacoco.xml` del CI.

*Cómo lo verifico*
- `grep -n "<include>" services/*/pom.xml` → 0 (o solo exclusiones justificadas).
- `mvn -f services/<s>/pom.xml verify` falla si se borra una clase de prueba.
- `python - <<EOF` que sume `LINE covered/missed` de cada `target/site/jacoco/jacoco.xml` → ≥ 70 % por servicio.

*Estimación*

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | Pruebas por capa con dobles y contenedores. |
| C | 3 | Pasar de 25,6 % a 70 % en 6 servicios exige unas 4 300 líneas cubiertas más. |
| A | 5 | 6 servicios, gateway y decenas de clases de prueba. |
| T | 5 | Más de 30 h. |

**§12b Integración, E2E y carga según la guía**

*Qué encontré*
- **Testcontainers** solo en `pedidos-service` (`CockroachDbIntegrationTest`); hay 0 `@SpringBootTest` o `@WebMvcTest` en los servicios.
- **Playwright** (`tests/e2e-web`): 2 specs con 3 pruebas, todas con APIs simuladas (`page.route` en `fixtures.js`) contra el servidor de Vite. No cubren carrito ni checkout.
- **Espresso**: 0 pruebas.
- **Locust** (`tests/load/locustfile.py`): solo 4 GET públicos (`/api/categorias`, `/api/marcas`, `/api/productos`, `/api/provincias`).
  - `run-load-test.ps1`: 50 usuarios, 5/s, **60 s**.
  - Una única corrida versionada (`tests/load/results/tiendatech-50-users-20260904-local_*`).
  - **No existen el escenario 50 u × 5 min ni la rampa 0→200 en 10 min** (sin `LoadTestShape`).

*Cómo debe quedar*
- Testcontainers en al menos inventario, ventas y usuarios.
- Al menos 1 E2E Playwright de compra contra el stack real (compose en CI).
- 1 Espresso o Compose UI (§9).
- Locust con dos escenarios versionados (`--users 50 --run-time 5m` y `LoadTestShape` 0→200 en 600 s) que incluyan carrito y checkout, cada uno con sus CSV, HTML y sumas.

*Qué deben hacer*
- `tests/load/locustfile.py`: tareas autenticadas (login, carrito, checkout) y clase `RampaShape(LoadTestShape)`.
- `run-load-test.ps1 -Scenario nominal|rampa`.
- Ejecutar ambos escenarios y versionar `tests/load/results/<fecha>-{nominal,rampa}_*.csv` con `checksums.txt`.
- Spec `compra.spec.js` sin `page.route` contra `docker compose up`.

*Cómo lo verifico*
- `grep -n "LoadTestShape\|checkout" tests/load/locustfile.py`
- `python -c` que lea `*_stats_history.csv` y compruebe duración ≥ 300 s y pico de `User Count` = 200.
- `grep -c "page.route" tests/e2e-web/tests/compra.spec.js` → 0.

*Estimación*

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 2 | Herramientas conocidas. |
| C | 3 | E2E y carga contra el stack real. |
| A | 3 | Tests de carga, e2e, 3 servicios y CI. |
| T | 3 | Entre 6 y 15 h, más 15 min de carga. |

### §13 Pipeline CI/CD

**Qué encontré**
- **Correspondencia con los 7 jobs exigidos:**

  | Job exigido | Equivalente |
  |---|---|
  | lint | "Static analysis", `ci-cd.yml:81` |
  | test-backend | "Test ×6", `ci-cd.yml:18` |
  | test-web | "Web lint and unit tests", `ci.yml:96` |
  | test-mobile | "Android mobile quality", `ci.yml:228` |
  | build-images | `build` en `ci-cd.yml:138` más `publish-images.yml`, que publica en GHCR como `ghcr.io/…:<imagen>-<sha7>` para amd64 y arm64 |
  | build-mobile-apk | "Firmar APK release de Jose", `ci.yml:279` |
  | integration | "Gateway and CockroachDB integration", `ci-cd.yml:120` |

  Todo en verde sobre `822399a`.
- **Compuertas que no pueden fallar por lo que dicen medir:**
  - test-backend: JaCoCo filtrado a `application/**` (§12a).
  - test-web: sin `thresholds` de cobertura (§7).
  - contratos: sin verificación de proveedor (§10).
  - E2E: con APIs simuladas (§12b).
  - Codecov: `fail_ci_if_error: false` (`ci-cd.yml:183`).
- **El DAG está partido entre workflows.** `publish-images.yml:5-8` solo espera a "CI-CD quality gate". El workflow "CI" (contratos, E2E, web, Android, manuscrito) no condiciona la publicación, en contra de la tabla D5.2 del README.
  - `workflow_dispatch` (`publish-images.yml:4`) publica sin compuerta.
  - `deploy-production.yml:4-9` despliega también ante un push que toque el propio workflow.
- **Integración sin sonda de salud del stack.** `integration-test` ejecuta un `@SpringBootTest` del gateway y Testcontainers de pedidos. No hay `docker compose up` con `curl --fail …/actuator/health`; la sonda solo existe en el despliegue a EC2 (`deploy-production.yml:112`).

**Cómo debe quedar**
- Un único DAG `needs:` en el que `build-images` dependa de lint, test-backend, test-web, test-mobile y contract-verify.
- `integration` levanta el compose con las imágenes del commit y sondea la salud de gateway y servicios.
- Todas las compuertas con umbral real.
- Publicación y despliegue solo desde ese DAG.

**Qué deben hacer**
1. Unificar `ci.yml` y `ci-cd.yml`, o hacer que `publish-images` use `workflow_run` de ambos con `conclusion == success` y quitar `workflow_dispatch` sin compuerta.
2. Crear el job `integration` con `needs: build-images`: `docker compose -f docker-compose.yml up -d` con `IMAGE_TAG=${sha7}`, un bucle `curl --fail --retry 30 --retry-delay 5 http://localhost:8180/actuator/health` y un checkout de humo.
3. Aplicar los umbrales de §7 y §12a y la verificación de §10.

**Cómo lo verifico**
- `grep -n "needs:" .github/workflows/*.yml`: `build-images` o `publish` debe depender de todos los tests.
- `grep -n "curl --fail" .github/workflows/ci*.yml` en el job `integration`.
- Rama con un test web roto: la publicación no debe ejecutarse.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | Diseño de pipelines. |
| C | 3 | Compose en Actions con 8 servicios y CRDB. |
| A | 2 | 3 o 4 workflows. |
| T | 3 | Entre 6 y 15 h, contando iteraciones en CI. |

### §14 Observabilidad

**Qué encontré**
- **Dashboard.** `ops/observability/grafana-dashboard.json` tiene **5 paneles**: solicitudes/s, latencia P50/P95/P99, errores 4xx, errores 5xx y conexiones activas. **Faltan** disponibilidad Raft de CRDB, recursos por contenedor y latencia de extremo a extremo desde el móvil. La ruta no es `ops/grafana/pfc-dashboard.json`.
- **Métricas.** Los nombres no son los exigidos: `request_count`, `request_duration` y `active_connections` (`HttpObservabilityFilter.java:33,60-61`) en lugar de `http_requests_total`, `http_request_duration_seconds` y `app_active_sessions`. `app_business_events_total` solo existe en pedidos (`BusinessMetrics.java`). Las métricas `crdb.*` solo existen en `pedidos-service` (`CrdbMetrics.java:23-32`).
- **Prometheus** (`ops/observability/prometheus.yml`) no hace scrape de CockroachDB (`/_status/vars`), ni del gateway, ni de cAdvisor.
- **Logs.** JSON con `LogstashEncoder` e `includeMdc` en los 6 servicios. En el móvil no hay Timber ni logs JSON (`grep -ri timber Apps/mobile` → 0).
- **Trazas.** Agente OTel (`opentelemetry-javaagent.jar` versionado, 22 MB) hacia Jaeger v2 (`docker-compose.yml:428-430`), sin un OTel Collector independiente con `config.yaml`. Hay traza de compra en `docs/experimentos/resultados/iso25010/2026-09-04T08-44-12/trace/purchase-traces.json` y evidencia bajo carga en `docs/evidencias/paso10-item5-grafana-carga.md`.

**Cómo debe quedar**
- Las 4 métricas con los nombres de la guía en los 6 servicios.
- Scrape de CRDB (`crdb_*`, `ranges_unavailable`, `liveness_livenodes`) y cAdvisor.
- Dashboard con los 6 paneles en `ops/grafana/pfc-dashboard.json`.
- Collector OTel en compose con `ops/otel-collector/config.yaml` exportando a Jaeger.
- Logs JSON con `trace_id` en el móvil (Timber más un árbol JSON).
- Captura bajo carga con los 6 paneles.

**Qué deben hacer**
1. Renombrar o añadir métricas en un filtro común, más `app_active_sessions` (gauge de sesiones JWT activas) y `app_business_events_total{tipo}`.
2. En `prometheus.yml`: jobs `cockroachdb` (`metrics_path: /_status/vars`, puertos 8080 de los 3 nodos), `cadvisor` y `gateway`.
3. Añadir `otel/opentelemetry-collector-contrib` a compose con receptor OTLP y exportador a Jaeger.
4. Crear paneles Raft (`ranges_unavailable`, `replicas_leaders`), CPU y memoria (`container_cpu_usage_seconds_total`) y latencia móvil (métrica `mobile_e2e_latency_seconds` enviada por la app, o span del cliente).
5. Timber con `JsonTree` y `trace_id` propagado por cabecera `traceparent` en OkHttp.

**Cómo lo verifico**
- `python -c "import json;d=json.load(open('ops/grafana/pfc-dashboard.json'));print(len(d['panels']),[p['title'] for p in d['panels']])"` → 6.
- `grep -rn "http_requests_total\|app_active_sessions" services`
- `grep -n "_status/vars\|cadvisor" ops/**/prometheus.yml`
- `ls ops/otel-collector/config.yaml`
- Captura versionada con los 6 paneles y ventana de carga.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | Prometheus, OTel y Grafana. |
| C | 3 | Métrica de latencia móvil y collector. |
| A | 4 | 6 servicios, compose, dashboard y móvil. |
| T | 3 | Entre 6 y 15 h. |

### §15 Protocolo y campaña experimental

**§15a Diseño: réplicas, hipótesis y umbrales antes de medir**

*Qué encontré*
- **Hay 5 repeticiones por condición, no las 10 que exige la guía** (E3 Módulo F y E4 5.8: "bloque completo con r = 10… se descartan la primera y la última").
  - `experimento_real_crudo.csv`: 24 condiciones × 5 = 120 filas.
  - `PFC4.tex:396-403` (tabla `tab:protocolo`) atribuye "Cinco por condición" a la "Referencia de la guía", **lo que es falso**.
- **No hubo hipótesis ni umbrales declarados antes de medir.** `PFC4.tex:388`: "Esta formulación explicita el alcance de datos ya disponibles; **no se presenta como un protocolo preespecificado antes de la corrida histórica**". No existe `protocolo-e3.md` ni `protocolo-e4.md` para 2PC frente a Saga; `docs/experimentos/protocolo.md` trata de PySpark.
- **El diseño no permite significación por construcción.** Con n₁ = n₂ = 5, el p exacto bilateral mínimo de Mann–Whitney es 2/252 = 0,0079 > α Bonferroni = 0,05/12 = 0,004167. El manuscrito lo reconoce, pero no corrige el diseño. Recalculé las 12 permutaciones exactas de p95 y el mínimo es 0,0159 (`timing`, c = 100).
- **Orden fijo**, no aleatorizado: repetición > coord > fallo > concurrencia (`README-experimento-real.md`), confirmado con `inicio_epoch`.
- **El experimento de E3 (PySpark) tampoco cumple r = 10 ni N = 8.** `resultados/tiempos_crudos.csv`, que cita el manuscrito (`PFC4.tex:514`), tiene `ejecutores ∈ {1,2,4}` con 5 repeticiones útiles (3 en la modalidad particionada). El juego que sí cumple (`docs/experimentos/resultados/raw.csv`: N = 1, 2, 4, 8 con 10 repeticiones) no es el que se usa.

*Cómo debe quedar*
- `docs/experimentos/protocolo-e4.md` versionado **antes** de la nueva campaña, con commit y fecha anteriores al primer `inicio_epoch`. Debe contener:
  - H0 y H1 por variable, por ejemplo: "tasa de órdenes inconsistentes de Saga ≤ 2PC + δ" y "p95 de Saga < p95 de 2PC".
  - Umbrales (δ, α y potencia).
  - Variables dependiente, independientes y controladas.
  - r = 10 con descarte de la primera y la última (8 útiles).
  - Orden aleatorizado con semilla declarada.
  - Criterios de descarte.
- Con 8 frente a 8, el p exacto mínimo es 2/12870 = 0,00016, así que la corrección de Bonferroni sí es alcanzable.

*Qué deben hacer*
1. Redactar `protocolo-e4.md` con análisis de potencia (Wohlin): tamaño de efecto esperado a partir de los datos piloto actuales.
2. Hacer commit **antes** de ejecutar y citar el hash en el manuscrito.
3. Si no hay tiempo para 24 × 10 condiciones (unas 24 h a 360 s por corrida), reducir el diseño y declararlo en el protocolo antes de medir. Por ejemplo, concurrencias {50, 100} × fallos {none, timing} × 2 estrategias = 8 condiciones × 10 = 80 corridas, unas 8 h.
4. Para E3: citar `raw.csv` (N = 1, 2, 4, 8, r = 10) o repetir en el clúster con N = 8 y r = 10.

*Cómo lo verifico*
- `git log --format='%h %cI' -- docs/experimentos/protocolo-e4.md | tail -1` anterior al mínimo `inicio_epoch` del nuevo CSV.
- `python -c` que agrupe el nuevo CSV por condición y compruebe 10 repeticiones y 2 descartes marcados.

*Estimación*

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 4 | Diseño experimental, potencia y control de validez. |
| C | 2 | Documental. |
| A | 2 | Protocolo y manuscrito. |
| T | 2 | Entre 2 y 6 h. |

**§15b Ejecución: variable central, población y saturación**

*Qué encontré* (recalculado desde `experiments/paso8/resultados-reales/correctiva-20260905-final-v2/experimento_real_crudo.csv`, 120 filas)
- **Totales.** 208 003 solicitudes y **98 298 fallidas (47,26 %)**. 49 786 intentos de checkout y **30 275 confirmados**, cifra que coincide con el README y el manuscrito.
- **Por concurrencia.** Con c = 400 fallan entre el 68,9 % y el 76,6 % de las solicitudes y se confirman entre 150 y 226 checkouts por condición. Con c = 200, entre el 27,4 % y el 43,9 %.
- **El p95 está censurado por timeout.** Las medianas de p95 son 30 000–37 000 ms con c = 50 y 86 000–92 000 ms con c ≥ 200.
  - En `none/2pc/200`, `omission/2pc/200` y `timing/2pc/200` los cinco p95 valen exactamente 90 000 ms: réplicas degeneradas, con 1 solo valor distinto.
  - Throughput de unos 2,7 rps.
  - **El sistema medido está saturado desde c = 50**: p95 de 30 s por compra. La comparación de p95 mide el timeout del cliente, no la coordinación.
- **La variable central (consistencia) no se midió durante la campaña.**
  - Se reconstruyó a posteriori con `reconstruct_real_oracle.py` sobre una instantánea MVCC del **07/09 20:10Z**, unas 19 h después de la última corrida (`analisis/informe_final.md`).
  - Los estados COMPLETADA/FALLIDA estaban en `TransactionObservationStore`, un buffer en memoria de 200 entradas perdido en los reinicios.
  - El invariante de compensación queda `no_verificado` en **las 120 filas** (`oracle_por_corrida_crdb.csv`, columna `cancelados_compensados_estado`). `oracle_pass` nunca es `true`: 104 `false` y 16 `no_verificado`.
- **Poblaciones mezcladas.**
  - Locust cuenta 30 275 confirmaciones HTTP, pero hay **43 168 órdenes persistidas** en las ventanas: 12 893 órdenes existen sin que el cliente viera éxito.
  - Además, 13 321 órdenes sintéticas cayeron fuera de las ventanas.
  - La "tasa de inconsistencia" (13 210/43 168 = 30,60 %) usa las persistidas como denominador y la latencia usa las respuestas HTTP.
  - La convergencia de Saga tiene una mediana global de 20 602 253 ms (5,7 h): mide backlog de outbox, no coordinación.
- **Instrumentación de recursos rota.** `locust_cpu_pct_media = 0.0` en **82 de 120 filas**.
- **El juego anterior sigue versionado.** `oficial-v4-20260904/experimento_real_crudo.csv` tiene 120 filas, 3 checkouts confirmados y 74,13 % de error (recalculado). Es la campaña citada en la revisión del 05/09 (`acta-2026-09-04.md`, punto 3).
- **Sin indicios de retrofechado.** Corridas del 06/09 02:30 al 07/09 00:53 (−05) y commit `62f0b15` el 07/09 01:31. Instantánea del oráculo a las 20:10Z y commit `163f0cb` a las 20:49Z.

*Cómo debe quedar*
- Campaña con las 10 réplicas del protocolo de §15a.
- Nivel de carga **por debajo de la saturación**: tasa de error < 5 % en la condición sin fallos, determinada con la rampa previa y declarada antes.
- Oráculo **prospectivo**: cada intento con `Idempotency-Key` persistido junto a su resultado HTTP, verificado al final de cada corrida antes de reiniciar.
- Una única población para latencia e invariantes: los intentos del banco dentro de la ventana, con su estado persistido.
- CPU y memoria medidas (proceso Locust y `docker stats` de los contenedores).

*Qué deben hacer*
1. Persistir el resultado de cada intento en una tabla `experimento.intento(id, corrida, coord, idempotency_key, http_status, inicio, fin, estado_final)` y retirar el buffer de 200.
2. Ejecutar `oracle` al final de cada corrida, antes del reinicio. Añadir controles positivos: inyectar una violación conocida y comprobar que se detecta.
3. Elegir concurrencias con la rampa (por ejemplo, las que den un error < 5 % y < 20 %).
4. Corregir el muestreo de CPU (`psutil.Process(locust_pid).cpu_percent(interval=1)` en un hilo) y añadir `docker stats --no-stream` por corrida.
5. Aleatorizar el orden con semilla.
6. Mover `oficial-v4-20260904/` a `experiments/paso8/historico/` con un README que lo marque como no canónico.

*Cómo lo verifico*
- `python - <<EOF` que, sobre el nuevo CSV, calcule por condición el número de réplicas (10), `requests_fail/requests_total` en `none` (< 0,05), la desviación de p95 (≠ 0) y `locust_cpu_pct_media > 0` en el 100 % de las filas.
- Cruce `experimento.intento` ↔ `pedidos.orden` por `idempotency_key`: 0 intentos sin estado final.
- Comprobar que el oráculo de cada corrida tiene fecha anterior al `inicio_epoch` de la siguiente.

*Estimación*

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 4 | Operacionalizar invariantes y controlar la saturación. |
| C | 4 | Instrumentar el oráculo transaccional en servicios distribuidos. |
| A | 4 | Pedidos, ventas, orquestador, oráculo y análisis. |
| T | 5 | Más de 30 h: desarrollo más 8–24 h de ejecución. |

### §16 Paquete de datos y reproducibilidad

**Qué encontré**
- **Manifiesto de datos: cerrado para CSV y TSV.**
  - `docs/experimentos/resultados/checksums-datos.sha256` cubre 60/60 `.csv`/`.tsv`.
  - `python -B scripts/check_data_checksums.py` → "Verificadas 60 sumas".
  - `campaign_checksums.py` verifica 10 sumas de `correctiva`, 2 de `oficial-v4` y 4 de `tests/load/results`.
  - El workflow `data-integrity.yml` lo ejecuta en cada push, con pruebas de detección de alteraciones.
  - Queda cerrado el pendiente del 12/09 ("1 de 60 y sin CI").
- **Fuera del manifiesto:**
  - **358 `.db`** (bases crudas de los pilotos SQLite, incluidas 240 de `resultados-rubrica-20260904/`).
  - **54 `.json`**: `preflight.json`, `piloto-*.json`, `rampa-readiness.json`, `oracle_resumen_crdb.json` y trazas.
  - 15 `.xml` de PMD y JaCoCo, y 7 `.headers`.
- **El manifiesto es circular.** Se regenera en el mismo commit que cambia los datos (`2d827a5`, `cd8d336`), así que no protege frente a una alteración comprometida. El hash del CSV crudo canónico no está fijado en el manuscrito.
- **No hay un único juego canónico:**
  - `experiments/paso8/resultados/experimento_crudo.csv`, simulación SQLite de 120 filas, duplicada byte a byte en `docs/entrega4/cierre/experimento_crudo.csv` (sha256 `37d376268c35…` en ambos).
  - `resultados-reales/oficial-v4-20260904/` (3 checkouts).
  - `resultados-rubrica-20260904/`: solo `.db` de 2PC, sin CSV y **sin referencias** en ningún `.md`, `.tex` o `.py`.
  - `correctiva-20260905-final-v2/` (el canónico).
  - Dos juegos PySpark distintos: `resultados/tiempos_crudos.csv` y `docs/experimentos/resultados/raw.csv`.
  - Dos juegos de p valores para el mismo contraste dentro del canónico: `comparaciones_mann_whitney.csv` usa `p_aprox` (p. ej. `timing/100` = 0,012186) y `comparacion_estrategias.csv` y el manuscrito usan el exacto (0,015873).
- **Regeneración determinista confirmada.** En una copia, `analyze_corrective_comparison.py` y `analyze_corrective_results.py` reproducen **byte a byte** 12 salidas: `comparacion_estrategias.csv`, `resumen_*`, `comparaciones_mann_whitney.csv`, `resumen_estadistico_ic95.csv`, `proporciones_binomiales_ic95.csv` y las 5 SVG.
  - `campaign_checksums.write` falla con Python 3.9 (`newline=` en `write_text`); el README exige 3.11.
  - **La entrada `experimento_real_crudo_enriquecido.csv` depende del oráculo sobre una instantánea de un clúster externo que no se conserva**, así que las columnas de inconsistencia no son regenerables desde datos preservados.
- **Sin diccionario de datos**: ningún archivo describe las 30 columnas del CSV crudo ni las 25 del oráculo (`grep -ril diccionario` → 0).

**Cómo debe quedar**
- Un único directorio canónico por experimento, con un README que declare los históricos.
- Diccionario (`DATOS.md` o `datapackage.json`) con nombre, tipo, unidad y origen de cada columna.
- Manifiesto que cubra todo archivo de datos del paquete (CSV, JSON y DB conservadas) y cuyo hash raíz esté fijado en el manuscrito y en la etiqueta anotada.
- Volcado del estado de la base usado por el oráculo (export de las tablas `pedidos.orden`, `ventas.factura*` e `inventario.kardex` filtradas al banco sintético, en CSV comprimido) para que el oráculo sea regenerable sin el clúster.

**Qué deben hacer**
1. Borrar `resultados-rubrica-20260904/` y `docs/entrega4/cierre/experimento_crudo.csv`, o moverlos a un Release. Mover `oficial-v4` y `resultados/` (SQLite) a `experiments/historico/`.
2. Ampliar `inventory()` de `check_data_checksums.py` a `.json`, `.db` y `.csv.gz` bajo `experiments/` y `docs/experimentos/`.
3. Exportar las tablas del oráculo de la nueva campaña (§15b) y hacer que `reconstruct_real_oracle.py` acepte `--desde-volcado`.
4. Añadir `\newcommand{\hashcrudo}{…}` al manuscrito.
5. Escribir `experiments/paso8/DATOS.md`.
6. Unificar los p valores: una sola tabla, la exacta.

**Cómo lo verifico**
- `python scripts/check_data_checksums.py`, más `git ls-files 'experiments/**' | grep -E "\.(json|db|csv)$" | wc -l` igual al número de líneas del manifiesto.
- `python experiments/paso8/reconstruct_real_oracle.py --desde-volcado … && cmp` contra `oracle_por_corrida_crdb.csv`.
- `ls experiments/paso8/resultados-reales` → un solo directorio canónico.
- `grep -n hashcrudo docs/entrega4/PFC4.tex`

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | Diseño de paquete reproducible. |
| C | 3 | Oráculo desde volcado. |
| A | 4 | Unos 400 archivos movidos, scripts y manuscrito. |
| T | 3 | Entre 6 y 15 h. |

### §17 Evaluación ISO/IEC 25010

**Qué encontré** (`docs/experimentos/resultados/iso25010.csv`, 6 filas)
- **Falta Compatibilidad**, exigida por la Tabla 2: web en Chrome, Firefox y Safari; móvil en API 26+. Se sustituyó por "Disponibilidad". En `PFC4.tex:674` Compatibilidad dice "Contratos HTTP/gRPC; Pact… no acreditados".
- **Rendimiento.** p95 de 610 ms (verificado en `load-final/tiendatech-50-users_stats.csv`, fila Aggregated), pero:
  - de **una sola corrida de 60 s**;
  - solo con 4 GET públicos, sin checkout;
  - sin media, DE ni IC95 ("No estimable con una sola corrida");
  - con el límite de tasa del gateway elevado respecto a la configuración nominal (`ejecucion.md`, "Incidencia y repetición").
- **Fiabilidad.** La guía exige "5xx durante una hora continua bajo carga nominal". El 0/2112 procede de la misma carga de 60 s (13:52:14–13:53:09Z). La hora de disponibilidad (`uptime-summary.csv`, 14:02:34–15:02:35Z) se midió **después y sin carga**: 3588 sondeos de 1 GET por segundo.
- **Mantenibilidad.** 935/1136 = 82,31 % sobre XML JaCoCo del 28/08 filtrados a `application/**` (inventario 8 líneas, productos 23, ventas 27); la medición completa posterior da 25,60 % (§12a). Complejidad: se reporta el **máximo** (9), no la **media** que pide la guía.
- **Seguridad.** 8/8 familias responden 401 sin JWT (`security-401-gatewayintegration-2026-09-11.csv`). No se evaluó "ausencia de OWASP Top 10": no hay ZAP, dependency-check ni npm audit.
- **Intervalos degenerados.** Los IC95 son de Wilson sobre líneas o sondeos tratados como observaciones independientes; no son intervalos sobre réplicas. **No hay réplicas en ninguna característica.**

**Cómo debe quedar**

Las cinco características de la Tabla 2, cada una con métrica, umbral, r ≥ 10 réplicas (8 útiles), media, DE e IC95 t-Student sobre réplicas, y contraste con el umbral:

| Característica | Medición |
|---|---|
| Fiabilidad | 1 h con Locust nominal (50 usuarios y checkout) y 5xx por ventana |
| Eficiencia | p95 por réplica de 5 min |
| Seguridad | % de endpoints con JWT más informe OWASP ZAP baseline sin alertas High |
| Mantenibilidad | cobertura completa por servicio más complejidad media |
| Compatibilidad | Playwright en chromium, firefox y webkit, y emulador API 26 y 34 |

**Qué deben hacer**
1. Ejecutar 10 réplicas de 5 min del escenario nominal de §12b y calcular p95 y 5xx por réplica.
2. Hacer una corrida de 1 h bajo carga nominal para fiabilidad, partida en 10 ventanas de 6 min como réplicas.
3. `zap-baseline.py -t http://localhost:8180` y `npm audit --omit=dev`, con informes versionados.
4. `playwright.config.js` con `projects: chromium, firefox, webkit` y emulador en API 26 y 34; tasa de aprobados por navegador.
5. Complejidad media desde los XML de PMD (`python` sobre `violation` → media por método) y cobertura de §12a.
6. Regenerar `iso25010.csv` con las columnas `n`, `media`, `de`, `ic95_inf`, `ic95_sup`, `umbral` y `cumple`, más un script `scripts/iso25010_stats.py` que lo calcule desde los crudos.

**Cómo lo verifico**
- `python scripts/iso25010_stats.py && git diff --exit-code docs/experimentos/resultados/iso25010.csv`
- `python -c "import csv;r=list(csv.DictReader(open('docs/experimentos/resultados/iso25010.csv')));print({x['caracteristica'] for x in r}, [x['n'] for x in r])"` → debe incluir Compatibilidad y n ≥ 8 en todas.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | Métricas ISO y estadística básica. |
| C | 3 | ZAP, multi-navegador y emulador. |
| A | 3 | Carga, e2e, scripts y CSV. |
| T | 4 | Entre 15 y 30 h, con 2 h de carga más 1 h de fiabilidad. |

### §18 Manuscrito final, bibliografía y trazabilidad E1–E4

**Qué encontré**
- **Compila.** `git archive 822399a docs/entrega4 docs/entrega3/referenciasPFC.bib release/screenshots experiments/paso8/resultados-reales` y `latexmk -pdf` dan **0 errores, 59 páginas y 0 Overfull**. Una sola advertencia `undefined`: el `Font shape T1/lmr/bx/sc`.
  - En este Windows hubo que acortar la ruta de `campana-correctiva-resumen.png`, porque pdfTeX no abre rutas de más de 260 caracteres; no es defecto del equipo.
  - Texto extraído (`pdftotext`) idéntico al del PDF versionado salvo acentos y ligaduras: 20 672 frente a 20 674 palabras.
- **Bibliografía.** 23 entradas impresas, 20 con DOI; las 3 sin DOI son normas ISO y el código ACM/IEEE, tipo `online`.
- **Compilar desde una copia limpia no funciona solo con lo que dice la documentación.** `docs/entrega4/README.md` y `README.md:258` dicen que basta con `docs/entrega4` más la `.bib`, pero el `.tex` también incluye 16 imágenes de `../../release/screenshots/` y 1 de `../../experiments/…/analisis/` (`PFC4.tex:323-352,584,745,750`). Mi primera compilación falló con `File '../../release/screenshots/principal_web.jpeg' not found`.
- **Hash desfasado.** `docs/entrega4/cierre/integracion-20260912/verificacion.json:7` declara `pdf_sha256 30dd00cd…`, que es el PDF de `75aeac6`, `27180aa` y `4387e04`. El PDF del corte (`822399a`) es `03b3a388…` y no hay suma actualizada.
- **Portada y fechas desfasadas** (§1): "Corte documental: 1 de septiembre de 2026" y "Paso 13".
- **Cifras que no corresponden a la medición real:**
  - Cobertura 82,31 % (`PFC4.tex:676,690-700`), procedente de XML del 28/08 filtrados. La corrección de `da164e4` es del 15/09 y no cuenta.
  - La tabla `tab:protocolo` atribuye r = 5 a la guía (§15a).
- **Estructura frente a la Tabla 3.** No hay secciones "Fundamento teórico", "Aplicación web", "Aplicación móvil", "Pruebas y CI/CD" ni "Observabilidad". Están repartidas en "Implementación", "Calidad del producto" y "Gestión de la revisión cruzada" (secciones de `PFC4.tex`: 135, 163, 254, 287, 378, 444, 553, 619, 662, 754, 858, 879, 897, 910).
- **Sin evidencia de i18n**, porque no existe (§6). Las capturas web (`PFC4.tex:323-339`) no cubren `/main`, `/settings` ni `/about`.

**Cómo debe quedar**
- Estructura de la Tabla 3: Resumen/Abstract, Introducción, Trabajos relacionados, Fundamento teórico, Arquitectura, Aplicación web, Aplicación móvil, Pruebas y CI/CD, Observabilidad, Evaluación ISO 25010, Discusión y amenazas, Conclusiones y Bibliografía.
- Cifras idénticas a las de la nueva campaña (§15), la nueva ISO (§17) y la cobertura completa (§12a).
- Portada con URL y fecha reales.
- `README` de compilación con la lista completa de rutas externas.
- `verificacion.json` (o `PFC4.pdf.sha256`) actualizado en el mismo commit que el PDF y comprobado en CI.

**Qué deben hacer**
1. Reordenar `\seccion` según la Tabla 3.
2. Sustituir las tablas `tab:protocolo`, `tab:iso` y `tab:cobertura` con `\input` de `.tex` generados por los scripts desde los CSV canónicos, para que no se tecleen cifras.
3. Actualizar la portada.
4. Añadir `release/screenshots` y `experiments/.../analisis` a las instrucciones de copia limpia.
5. En `manuscript-quality`, tras compilar, comparar `sha256sum docs/entrega4/PFC4.pdf` con el declarado, o texto a texto con `pdftotext`.

**Cómo lo verifico**
- `git archive HEAD docs/entrega4 docs/entrega3/referenciasPFC.bib release/screenshots experiments/paso8/resultados-reales | tar -x -C /tmp/m && cd /tmp/m/docs/entrega4 && latexmk -pdf -halt-on-error PFC4.tex` → 0 errores y ≥ 20 páginas.
- `grep -c "undefined" PFC4.log` → 0 citas o referencias.
- `sha256sum PFC4.pdf` igual al valor declarado.
- `grep -o "82{,}31" PFC4.tex` → 0.
- Comparar las cifras de la tabla ISO con `iso25010.csv`.

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 3 | Redacción técnica y trazabilidad. |
| C | 2 | Generación de tablas desde CSV. |
| A | 4 | Manuscrito de 944 líneas y 4 `\input`. |
| T | 4 | Entre 15 y 30 h, con la reescritura de resultados. |

### §19 Amenazas a la validez y reflexión ética (estado efectivo)

**Qué encontré**
- El artefacto está Hecho: `PFC4.tex:619-660`, con 14 amenazas en bloque `\textbf`.
  - Cinco internas:
    - "Mitigación:" explícita en contención del anfitrión y en semillas y orden;
    - mitigación implícita en configuración ("los pilotos y la rampa reducen el riesgo") y en saturación ("se reportan confirmaciones y fallos");
    - el candado solo explica que se trasladó al piloto.
  - Tres externas: "Mitigación:" explícita en topología y en catálogo artificial; ninguna en carga sintética.
  - Constructo: 4 amenazas, 3 con mitigación explícita.
  - Conclusión: 2 amenazas, sin mitigación explícita.
  - Reflexión ética de 5 párrafos (`:897-908`, más de media página) aplicada a stock, pagos, credenciales, bibliografía e IA.
- Límite menor: se cita el *Software Engineering Code of Ethics* ACM/IEEE-CS (`acmieee`), no el *ACM Code of Ethics and Professional Conduct* (2018) que nombra la guía.
- Las amenazas describen la campaña actual (r = 5, saturación, oráculo retrospectivo) y **deberán reescribirse** cuando se repita (§15).

**Cómo debe quedar**
- Amenazas actualizadas a la nueva campaña (orden aleatorizado, oráculo prospectivo).
- Cada amenaza, al menos 3 internas y 2 externas, con una frase "Mitigación:" concreta; en particular configuración, saturación y carga sintética.
- Referencia añadida al ACM Code of Ethics 2018 (https://www.acm.org/code-of-ethics) con al menos 2 principios aplicados, por ejemplo 1.2 "Avoid harm" y 2.5 "Give comprehensive and thorough evaluations…".

**Qué deben hacer**
- Tras §15, revisar cada amenaza contra el nuevo diseño.
- Añadir la entrada bibliográfica y 1 párrafo.

**Cómo lo verifico**
- `grep -n "Mitigación" PFC4.tex | wc -l` ≥ 11 (hoy son 8).
- `grep -n "acm.org/code-of-ethics\|acm2018" docs/entrega3/referenciasPFC.bib`

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 2 | Validez experimental. |
| C | 1 | Documental. |
| A | 1 | Una sección. |
| T | 1 | Menos de 2 h. |

### §20 Evidencia de trabajo en equipo y autoría

**Qué encontré**
- **Actas.** Solo hay **una**: `docs/actas/acta-2026-09-04.md`. En ella participan Jhinson (presente) y Andy (remoto); José y Jeremy no figuran. No hay actas de otras sesiones de E4 (del 24/08 al 13/09) ni de la fase del 12–13/09.
- **Revisión cruzada.** Solo el PR #79 tiene una aprobación de otro integrante. Hay 82 commits directos a `main` desde el 01/09 (§3).
- **Declaración de IA.** Existe (`README.md:268-277`; `PFC4.tex:926`): Claude para Jhinson y Andy, Codex para Jeremy y José.
- **Aporte de Jhinson hasta el corte**, verificado en el historial:
  - En total: 99 commits (87 sin merges), el mayor número del equipo; +11 096/−3 110 líneas de texto sin binarios ni datos.
  - Autor de las secciones de arquitectura y estado del arte, de las refactorizaciones en capas de ordenes-proveedores y ventas (`1ea39a9`, 23/08), del outbox de ventas (`2fc3dd1`), de las pruebas JaCoCo (`15e4554`) y de la tolerancia a fallos (`78aac37`).
  - **Tras la evaluación del 12/09 (`75aeac6..822399a`), 15 commits sin merges** (+997/−170 líneas de texto):
    - 5 archivos de prueba web nuevos más ampliaciones (`26296d7`, `8a9c400`, `641bf52`: 292 líneas en `tests/*.test.tsx`)
    - `.idea/` raíz (`7147aa1`)
    - 2 filas del README (`9d6b242`, `6e15199`)
    - `.gitattributes` +2 líneas (`86a39bc`)
    - texto del resumen de CI (`a55a3a0`)
    - refactor de complejidad en ordenes-proveedores (`bcd173c`, `99cf556`: +126/−45)
    - 14 PNG de evidencia en `Evidencias de trabajo/Jhinson Aucatoma/`
    - `1a776d1` ("forzar disparo de CI") y `dc8cd79` (imports) son triviales.
- **Reparto en el mismo intervalo:** José 9 commits (+2 975), Jeremy 4 (+4 774), Andy 3 (+509/−603).

**Cómo debe quedar**
- Una acta por sesión, con fecha, asistentes, decisiones, responsables y commits o PR asociados, coherente con el historial.
- Cada PR aprobado por un integrante distinto del autor.
- Tabla de autoría por entregable en el manuscrito, verificable con `git shortlog`.

**Qué deben hacer**
1. Crear actas para cada sesión del examen: `docs/actas/acta-2026-09-XX.md` con enlace a los PR.
2. Llevar todo el trabajo del suspenso por PR: Jhinson abre y otro integrante revisa con comentarios sustantivos y aprueba.
3. Actualizar "Autoría y contribución" (`PFC4.tex:911`) con los ítems de esta guía y su responsable.

**Cómo lo verifico**
- `ls docs/actas | wc -l`
- Comparar las fechas de las actas con `git log --format=%cI` de los commits citados.
- `curl -s …/pulls/N/reviews` → `APPROVED` de un usuario distinto a `user.login`.
- `git shortlog -sne v4.0.0..v4.1.0`

**Estimación**

| Dimensión | Valor | Justificación |
|---|---|---|
| P | 1 | Proceso. |
| C | 1 | Documental. |
| A | 2 | Actas y PR. |
| T | 2 | Entre 2 y 6 h, repartidas a lo largo del examen. |

## 4. Lo que está Hecho

Solo §19 está Hecho como artefacto propio. Sus datos: 14 amenazas (5 internas, 3 externas, 4 de constructo y 2 de conclusión), 8 de ellas con "Mitigación:" explícita, entre ellas 2 internas y 2 externas. Además, una reflexión ética de 5 párrafos aplicada a stock, pagos, credenciales, bibliografía e IA.

También quedan verificados, dentro de entregables que tienen otros defectos, estos resultados que no se recalifican:
- El manuscrito compila desde copia limpia a 59 páginas, con 0 errores y 0 Overfull; el texto coincide con el PDF versionado. Tiene 23 referencias, 20 con DOI. El validador de citas corre en CI antes de compilar.
- CI en verde sobre `822399a`:
  - CI: 11 jobs.
  - CI-CD quality gate: 15 jobs.
  - Integridad de datos.
  - Publicación en GHCR con etiqueta `<imagen>-<sha7>` en amd64 y arm64.
  - Despliegue con sonda de salud.
- APK release firmado por CI con certificado `CN=Jose Alejandro Lozano Morales` (SHA-256 `6ad168c1…8bbd`, verificado con `apksigner` en `ci.yml:318`), publicado como Release `mobile-release-34789458812-1` a las 18:29 −05 del 13/09. JWT móvil cifrado con AES-GCM y Android Keystore.
- Manifiesto SHA-256 de los 60 CSV/TSV versionados, que verifica y se comprueba en CI (`data-integrity.yml`), con pruebas de alteración. Las salidas estadísticas de la campaña (12 archivos, SVG incluidos) se regeneran byte a byte.
- Recálculo de la campaña: 120 filas, 24 condiciones × 5, 30 275 checkouts confirmados, 43 168 órdenes persistidas y 13 210 inconsistentes; las cifras coinciden con el manuscrito.
- Dominio Java sin anotaciones de framework en los 6 servicios; 34 puertos con adaptador.
- Clúster CRDB de 3 nodos con healthchecks y prueba de caída y reintegración (3,62 s).
- Complejidad ciclomática máxima de 9 (menor de 10) en 7 módulos Java y la web, medida por PMD en CI con compuerta que puede fallar.
- ESLint con 0 errores y 0 advertencias; TypeScript estricto.
- 62 pruebas Vitest en verde.
- CRLF limitado a 7 `.headers` HTTP.
- `Evidencias de trabajo/` documentada en el README.
- Todas las ramas fusionadas en `main`.

## 5. Orden de ejecución recomendado

1. **§1 y §3 (proceso).** Transferir el repositorio y activar la protección de rama con PR revisado. Todo lo demás pasa por PR.
2. **§2** (higiene, revocar el secreto, `.gitattributes`). Libera peso antes de los cambios grandes.
3. **§4 → §5a.** Primero las capas limpias; después Strategy, Observer, Decorator y Factory Method en el checkout. §5b puede ir en paralelo.
4. **§6** (checkout web con la Strategy de §5, rutas, i18n, token en memoria) **→ §7** (cobertura completa con umbral).
5. **§8** (push desde el Observer de §5, escáner contra backend) **→ §9** (pruebas de ViewModels, E2E instrumentada, APK de CI).
6. **§10** (Pact contra los clientes y proveedores reales) y **§12a/§12b** (cobertura backend completa, Testcontainers, E2E real, dos escenarios Locust).
7. **§13** (DAG único con compuertas reales e integración con sonda). Depende de 7, 10 y 12.
8. **§14** (métricas, scrape de CRDB y cAdvisor, collector, 6 paneles).
9. **§15a** (protocolo con commit **antes** de medir) **→ §15b** (instrumentación del oráculo prospectivo, rampa y campaña r = 10) **→ §16** (paquete canónico, volcado del oráculo, diccionario, manifiesto ampliado).
10. **§17** (ISO con réplicas; usa §12b, §14 y §16). §11 puede ir en paralelo desde el paso 2.
11. **§18 y §19** (manuscrito regenerado desde CSV canónicos, portada y hash) **→ §20** (actas y autoría) **→ etiqueta anotada de cierre** (§3).

## 6. Lista de verificación final (docente)

```bash
# 1. Propietario, etiqueta anotada y revisión cruzada
curl -s https://api.github.com/repos/gleiston-guerrero/TiendaTech | python -c "import json,sys;print(json.load(sys.stdin)['owner']['login'])"
git cat-file -t $(git describe --tags --abbrev=0) && git rev-list -n1 $(git describe --tags --abbrev=0)

# 2. Patrones GoF de la Tabla 1 en el flujo de checkout
grep -rlnE "interface \w*(Payment|Pago)\w*Strategy|interface \w*Observer|\w*Decorator (implements|extends)|abstract class \w*Creator" services/*/src/main/java

# 3. Cobertura real sin filtros (web y backend)
grep -n "<include>" services/*/pom.xml; grep -n "thresholds\|include:" Apps/web/frontend/webapp/vitest.config.ts
(cd Apps/web/frontend/webapp && npm ci && npx vitest run --coverage) ; echo "exit=$?"

# 4. Campaña: réplicas, error bajo saturación, CPU medida
python - <<'EOF'
import csv,collections,glob
f=sorted(glob.glob('experiments/paso8/resultados-reales/*/experimento_real_crudo.csv'))[-1]; r=list(csv.DictReader(open(f,encoding='utf-8')))
g=collections.Counter((x['fallo'],x['coord'],x['concurrencia']) for x in r)
print(f, set(g.values()), sum(float(x['locust_cpu_pct_media'])==0 for x in r),
      sum(int(x['requests_fail']) for x in r if x['fallo']=='none')/sum(int(x['requests_total']) for x in r if x['fallo']=='none'))
EOF
git log --format='%h %cI' -- docs/experimentos/protocolo-e4.md | tail -1

# 5. Integridad de datos y contratos verificados contra proveedor
python scripts/check_data_checksums.py && python experiments/paso8/campaign_checksums.py
grep -rln "@Provider\|PactVerificationContext" services

# 6. ISO 25010 con las 5 características y réplicas
python -c "import csv;r=list(csv.DictReader(open('docs/experimentos/resultados/iso25010.csv')));print([(x['caracteristica'],x.get('n')) for x in r])"

# 7. Manuscrito desde copia limpia y hash del PDF
git archive HEAD docs/entrega4 docs/entrega3/referenciasPFC.bib release/screenshots experiments/paso8/resultados-reales | tar -x -C /tmp/m && (cd /tmp/m/docs/entrega4 && latexmk -pdf -halt-on-error PFC4.tex && pdfinfo PFC4.pdf | grep Pages && grep -c undefined PFC4.log)

# 8. Higiene
git ls-files | grep -iE "(^|/)\.idea/|\.iml$|\.db-journal$|\.mp4$|debug\.apk$" ; git ls-files --eol | awk '{print $1}' | sort | uniq -c
```

## 7. Notas para el docente (no van a la guía)

- **Repositorio no transferido.** Al 16/09 el propietario sigue siendo `JoseLozanoMorales` (API de GitHub). Los otros tres equipos sí lo transfirieron.
- **Aporte de Jhinson.** El 0,0 % de la evaluación del 12/09 no refleja su historial completo: hasta el corte es el integrante con más commits (99; 87 sin merges). En la ventana de la rúbrica anterior sí tuvo poca actividad propia: `c5dca58` (07/09), `f60de05` (11/09) y el merge `aaf6d6c`. Entre la evaluación del 12/09 y el corte hizo 15 commits reales pero modestos (unas 1 000 líneas de texto), con buena parte de trabajo "cosmético":
  - `a55a3a0` cambia solo el texto del resumen de CI aunque su mensaje dice "generar dinámicamente el alcance de cobertura", y el alcance no cambió.
  - `1a776d1` es un commit vacío de disparo.
  - `b8476a7` solo sube un PNG.
  - Sus pruebas web (292 líneas) son reales y pasan.
- **Trabajo posterior al corte, todo de Jhinson** (34 commits del 14 y 15/09, que no cuentan):
  - Corrige en `da164e4` la cobertura Java del manuscrito a **25,60 %**, lo que confirma que la compuerta filtrada ocultaba el problema.
  - Crea la etiqueta `v4.0.0` otra vez ligera (`92e6668`).
  - Adjunta al Release `v4.0.0` binarios pesados (mp4, jar, zip de bases de datos).
- **Afirmaciones falsas en el README al corte:** patrones GoF "✅ Completo", publicación "condicionada" a contratos y E2E, móvil con "2 capacidades" que son Room y una "funcionalidad adicional". El ADR-005 del propio equipo contradice los patrones. En la revisión del 12/09 se dio por Hecho "Patrones de diseño documentados en registros de decisión", pero **4 de los 5 patrones de la Tabla 1 no existen en código**.
- **Atribución falsa en el manuscrito.** `tab:protocolo` atribuye a la guía "Cinco [repeticiones] por condición", cuando la guía exige r = 10. Y como con n = 5 el p exacto mínimo (0,0079) supera el umbral de Bonferroni (0,0042), el diseño no podía producir un resultado significativo.
- **Sin indicios de retrofechado.** Las marcas internas de la campaña correctiva, del oráculo, de la hora de disponibilidad y de la tolerancia a fallos son anteriores a los commits que las registran, con márgenes de 38 min a 5 h. Los PDF y los PMD tienen fechas coherentes.
- **Detalles del commit de corte:**
  - `822399a` quitó de la portada la URL y la leyenda "FECHA PERMITIDO DE ÚLTIMO COMMIT: Viernes 4 de septiembre del 2026 hasta Hora: 20h00", y dejó "Corte documental: 1 de septiembre de 2026".
  - El PDF del corte (sha256 `03b3a388…`) no coincide con el hash declarado en `verificacion.json` (`30dd00cd…`, del PDF anterior). En la evaluación del 12/09 ese hash sí coincidía.
- **Secreto en el historial.** Credenciales sandbox de PayPal (`396b1b3`, Jeremy, 26/07). No pude comprobar si siguen activas.
- **Lo que no pude verificar:**
  - La ejecución real del stack, la campaña y el oráculo (no hay docker y el clúster es externo).
  - Instrumentadas y emulador Android (no hay SDK).
  - `mvn test` de inventario en local: 17 errores `MockitoException` por JDK 25 frente a JDK 21 del CI, así que es del entorno. El CI con JDK 21 está en verde.
  - Que las imágenes GHCR existan hoy: el run de publicación sobre `822399a` está en `success`.
- **Incidente de auditoría.** El subagente que revisó el código dejó por error dos archivos `.cer` en `snap\TiendaTech\release\` al extraer certificados. Los borró de inmediato y `git status --porcelain` de la copia congelada quedó vacío. No afecta a ningún hallazgo.
- **Cifra del encargo.** "341 commits alcanzables por first-parent" no es correcto: 341 es el total alcanzable y por first-parent son 212.
