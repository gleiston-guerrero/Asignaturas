# Auditoría técnica — Equipo ACC (TicketFold · Soporte técnico distribuido para un ISP)

Fecha de la auditoría: 16/09/2026. Corte: 13/09/2026 19:00 (UTC−5). Evaluado sobre la copia congelada en `964fa6e` y el clon completo.

## 1. Cabecera

| Campo | Valor |
|---|---|
| Repositorio | https://github.com/gleiston-guerrero/PFC-SOPORTE-ISP (transferido al docente; antes `carlospatroner-boop/PFC-SOPORTE-ISP`) |
| Rama evaluada | `main` |
| Commit de corte | `964fa6e` — 13/09/2026 16:57 −05 — "docs(informe): recompila el PDF con los porcentajes finales del manuscrito" (Carlos Carpio) |
| Commits alcanzables | 198 (`git rev-list --count 964fa6e`) |
| CI en el corte | run 34785316252 sobre `964fa6e`: 15 jobs en verde (lint, test-backend, test-web, test-mobile, integration, build-mobile-apk, 7× build-images, compile-latex, verify-checksums) |

**Integrantes (identidades unificadas, commits hasta el corte):**

| Integrante | Rol | Identidades git (commits) | Total |
|---|---|---|---|
| Pacheco Cárdenas Cristhian Daniel | Arquitecto | `CristhianP03` (51), `Cristhian D. Pacheco Cárdenas` (13), `Cristhian Pacheco` (9), `Cristhian Daniel Pacheco Cárdenas` (1) | 74 |
| Carpio Mendoza Carlos José | Líder de desarrollo | `Carlos Carpio` (51), `carlospatroner-boop` (3), `Carlos José Carpio Mendoza` (1) | 55 |
| Cando Moreno Robinson Rodrigo | Documentación | `Robinson R. Cando Moreno` (21), `Robinson Cando` (14), `Robinson Cando M` (9), `Robinson Rodrigo Cando Moreno` (1) | 45 |
| **Álvarez Párraga Jeremy Alexis** (rinde el suspenso) | Calidad | `Jeremy Álvarez` (10), `DeJere` (6), `Jeremy Alexis Álvarez Párraga` (6), `Jeremy Alvarez` (1), `Alvarez Parraga Jeremy Alexis` (1) | 24 |

**Etiquetas en el corte.** Hay cuatro y **todas son ligeras** (`git cat-file -t` → `commit`). **Ninguna es de cierre** y **ninguna apunta a un commit de `main`**:

| Etiqueta | Commit | Fecha del commit | ¿En `main`? |
|---|---|---|---|
| `backup-main-antes-de-limpiar-850bb16` | `850bb16` | 09/09 06:48 | No: 16 commits de Cristhian descartados por reescritura |
| `backup-antes-de-revertir-commits-carlos` | `3b8eb69` | 09/09 21:52 | No: 7 commits de Carlos del 09/09 21:39–21:52 descartados |
| `backup-antes-de-quitar-f32a70c` | `373e0a7` | 13/09 16:28 | No: se eliminó `f32a70c` (DeJere, 13/09 15:43) |
| `mobile-release` | `f5300ed` | 13/09 16:16 | No: su parche equivalente en `main` es `f60c452` |

El Release de GitHub `mobile-release` se publicó el 13/09 a las 21:27Z (16:27 −05). Sus tres assets (`main.pdf`, `SHA256SUMS.txt`, `soporte-isp.apk`) **se reemplazaron el 16/09 a las 05:46Z**, así que su contenido en el corte ya no es recuperable.

**Ramas.** `feature/entrega-3` está totalmente integrada. `feature/entrega-4` tiene 1 commit fuera del corte (merge `e47a59e`). `feature/entrega22-conteos-pruebas` es trabajo posterior al corte y no cuenta.

## 2. Tabla de los 20 entregables

| # | Entregable | Estado propio | Estado efectivo | % |
|---|---|---|---|---|
| 1 | Identificación y URL | Por modificar | Por modificar | 75 |
| 2 | Estructura y archivos de raíz | Por modificar | Por modificar | 70 |
| 3 | Línea base congelada e integración | Por culminar | Por culminar | 25 |
| 4 | Backend en capas y SOLID | Por modificar | Por modificar | 65 |
| 5 | Patrones GoF y ADR | Por modificar | Por modificar | 70 |
| 6 | Aplicación web funcional | Por modificar | Por modificar | 75 |
| 7 | Calidad de la aplicación web | Por modificar | Por modificar | 75 |
| 8 | Aplicación móvil funcional | Por modificar | Por modificar | 65 |
| 9 | Calidad de la aplicación móvil | Por modificar | Por modificar | 55 |
| 10 | Integración y contratos | Por culminar | Por culminar | 45 |
| 11 | Persistencia distribuida | Por modificar | Por modificar | 70 |
| 12 | Pirámide de pruebas | Por culminar | Por culminar | 40 |
| 13 | Pipeline CI/CD | Hecho | Por modificar | 85 |
| 14 | Observabilidad | Por modificar | Por modificar | 65 |
| 15 | Protocolo y campaña experimental | Por culminar | Por culminar | 35 |
| 16 | Paquete de datos y reproducibilidad | Por modificar | Por culminar | 35 |
| 17 | Evaluación ISO/IEC 25010 | Por culminar | Por culminar | 30 |
| 18 | Manuscrito, bibliografía y trazabilidad | Por modificar | Por culminar | 35 |
| 19 | Amenazas a la validez y ética | Por modificar | Por modificar | 60 |
| 20 | Trabajo en equipo y autoría | Por culminar | Por culminar | 25 |

**Criterios de dependencia aplicados:**
- 7 ≤ 6.
- 9 ≤ 8.
- 10 ≤ 8, porque falta el consumidor móvil.
- 13 ≤ 12: el pipeline es correcto, pero lo que protege (cobertura, contratos) está incompleto.
- 16, 17 y 18 ≤ 15.

---

## 3. Entregables no Hecho

### §1 Identificación y URL

**Qué encontré**
- `CITATION.cff:26`: `repository-code: 'https://github.com/carlospatroner-boop/PFC-SOPORTE-ISP'`, es decir, el propietario anterior.
- `docs/diapositivas/identificacion_lms.tex:32` cita la misma URL antigua.
- `README.md` (11 380 B) no contiene la URL del repositorio, ni los nombres de los integrantes, ni sus roles. Los roles solo figuran en `PLAN.md`, que es un plan de la Entrega 3.
- `README.md:10-12` aún muestra el aviso «fecha límite… viernes 28 de agosto de 2026» (obsoleto).
- `README.md` dice «compila las 51 páginas», pero el PDF versionado y el recompilado tienen 55.
- El manuscrito **no contiene ninguna URL del repositorio** (`grep -rn "github.com" docs/latex/main.tex docs/latex/secciones` → vacío). La portada sí lista a los cuatro integrantes.
- `CITATION.cff` tiene `date-released: '2026-09-04'` y no hay versión declarada.

**Cómo debe quedar.** La misma URL canónica (`https://github.com/gleiston-guerrero/PFC-SOPORTE-ISP`) en README, CITATION.cff, portada del manuscrito y diapositiva de identificación. README con tabla de integrantes, rol y usuario git. `version` y `date-released` en CITATION.cff coherentes con la etiqueta de cierre.

**Qué deben hacer**
1. Sustituir la URL en `CITATION.cff`, `identificacion_lms.tex` y la portada (`docs/latex/main.tex`).
2. Añadir a README una sección «Equipo» (nombre completo, rol, usuario GitHub) y un enlace al repositorio.
3. Eliminar el aviso del 28/08 y la cifra de páginas.
4. Añadir `version: 4.0.0` a CITATION.cff y alinear `date-released` con la etiqueta de §3.

**Cómo lo verifico**
- `git grep -n "carlospatroner-boop" <tag>` → vacío.
- `git grep -n "gleiston-guerrero/PFC-SOPORTE-ISP" <tag> -- README.md CITATION.cff docs/latex/main.tex`.
- `cffconvert --validate`, o `python -c "import yaml;yaml.safe_load(open('CITATION.cff'))"`.

**Estimación**
- P1: edición documental sin juicio técnico.
- C1: sustituciones de texto.
- A2: 4–5 archivos.
- T1: menos de 2 h.

---

### §2 Estructura del repositorio y archivos de raíz

**Qué encontré**
- **Artefactos de compilación versionados.**
  - `docs/latex/main.bbl` y `docs/latex/main.blg`, subproductos de bibtex (la propia `.gitignore` excluye `*.aux`/`*.log`, pero no estos).
  - `docs/evidencias/jacoco-svc-principal/`: 194 archivos HTML/recursos generados por JaCoCo.
  - `docs/evidencias/jacoco-svc-principal-raw.exec` (1,33 MB).
- **Peso del historial.** `node_modules` de notification-service (1 575 archivos, +226 767 líneas) entró en `b0e120c` y sigue en el historial: pack de 52,96 MiB (`git count-objects -vH`). Hay además dos vídeos de 26,5 MB y 23,0 MB (`docs/evidencias/*.mp4`).
- **Carpetas huérfanas o heredadas sin mapear.**
  - `Evidencias de Modificaciones/Cristhian Pacheco/`: 4 PNG de «evidencia de clic en editar», nombres con espacios.
  - `frontend/`: el SPA vanilla de la E3, sustituido por `apps/web`.
  - `PLAN.md`: plan de la E3.
  - `start-all.ps1`.
- **Diferencias con el Listado 3 de la guía E4 no justificadas en README.**
  - Faltan `docs/adr/ADR-001` y `ADR-002`: solo existen 0003–0009.
  - Falta `docs/diagrams/c4-nivel3.*.png`: solo hay `c4-nivel3-particionado.md`, véase §5.
  - Faltan `docs/experimentos/resultados/iso25010.csv` y `boxplot_latencia.png`: esa carpeta contiene solo resultados Spark de la E3.
  - No existen `entrega1/…entrega4/`.
  - `services/` tiene 7 servicios con nombres distintos de los del listado (`svc-principal` en vez de `resource-service`) y no hay tabla de correspondencia.
- **Rutas citadas que no existen.**
  - `docs/evidencias/tolerancia_fallos.md:8` remite a «capturas… en `docs/evidencias/frames/`», carpeta inexistente.
  - `apps/web/e2e/console.spec.ts` cita `resultados/rebalance_demo_tickets.sql`, que tampoco existe.
- **Configuración de raíz.**
  - `.env.example` incluye `VITE_GATEWAY_BASE_URL` (línea 68), pero ninguna variable del cliente móvil: la URL base `10.0.2.2:8000` está fija en el código.
  - `.gitattributes` es correcto en el corte: `git ls-files --eol | awk '$1=="i/crlf"'` → 0 archivos.
  - LICENSE (MIT) y CITATION.cff existen.

**Cómo debe quedar.** Sin subproductos de compilación ni informes generados. Las carpetas heredadas se retiran o se mueven a `docs/entrega3/`. README incluye una tabla «Listado 3 → ruta real» que justifica cada diferencia. Ninguna ruta citada apunta a algo inexistente. `.env.example` cubre web, móvil y backend.

**Qué deben hacer**
1. `git rm --cached docs/latex/main.bbl docs/latex/main.blg` y añadir `*.bbl` y `*.blg` a `.gitignore`.
2. Sustituir el HTML de JaCoCo por `jacoco.xml` + `jacoco.csv` (los datos) y regenerar el HTML en CI como artefacto.
3. Mover `frontend/`, `PLAN.md` y `Evidencias de Modificaciones/` a `docs/entrega3/` (o retirarlos) y documentarlo.
4. Añadir a README la tabla de correspondencia con el Listado 3.
5. Crear los ADR-001/002 o justificar su ausencia en `docs/adr/README.md`.
6. Corregir o retirar las referencias a `frames/` y a `rebalance_demo_tickets.sql`.
7. Añadir `MOBILE_API_BASE_URL` (o `buildConfigField`) y documentarlo en `.env.example`.
8. Opcional, con acuerdo del docente: purgar `node_modules` del historial (`git filter-repo --path services/notification-service/node_modules --invert-paths`).

**Cómo lo verifico**
- `git ls-files | grep -E "\.(bbl|blg|aux|log|exec)$|jacoco-resources|node_modules"` → vacío.
- `git ls-files "Evidencias de Modificaciones" frontend PLAN.md` → vacío o bajo `docs/entrega3/`.
- `grep -rn "frames/\|rebalance_demo_tickets" --include=*.md --include=*.ts .` → vacío.
- `grep -n "Listado 3" README.md`.

**Estimación**
- P2: decidir qué es heredado y justificar el mapeo.
- C2: `git rm`, `.gitignore`, reorganización con enlaces.
- A3: raíz, docs, apps, README.
- T2: 2–6 h, o 3 si se purga el historial.

---

### §3 Línea base congelada e integración

**Qué encontré**
- **No hay etiqueta anotada de cierre.** Las 4 etiquetas son ligeras y apuntan a commits que no están en `main` (véase la cabecera).
- **No existe `CHANGELOG`** (`git ls-files | grep -i changelog` → vacío).
- **Revisión cruzada casi inexistente.** Hay 13 PR anteriores al corte (API `pulls?state=all`) y **solo el #1 tiene revisiones** (CristhianP03 y Robimson, APPROVED).
  - Los #3, #5, #7, #10 y #12 los abrió y fusionó el mismo usuario (CristhianP03), sin revisión.
  - Los #4, #6, #8, #9 y #13 son fusiones `main→feature` o circulares.
- **Pushes directos y reescritura de `main`.** Tras el último PR fusionado (#12, merge `2964a87` del 08/09 05:43), los **45 commits** hasta `964fa6e` entraron directamente en `main` sin PR (`git rev-list --count --merges 2964a87..964fa6e` → 0). La historia de `main` se reescribió con force-push al menos 3 veces, y las etiquetas `backup-*` lo prueban:
  - 16 commits de Cristhian descartados (tag `…850bb16`).
  - 7 commits de Carlos del 09/09 21:39–21:52 descartados y **reaplicados el 10/09 con otros autores** (véase §20).
  - `f32a70c` de DeJere eliminado el 13/09 hacia las 16:28.
  - Un run de CI sobre `10093dc` (13/09 21:31Z) corresponde a otro commit que ya no existe en `main`.

**Cómo debe quedar**
- Etiqueta **anotada** (p. ej. `v4.0.0-entrega4`) sobre el último commit de `main`, con fecha de tagger dentro del plazo.
- `CHANGELOG.md` con entradas fechadas por versión (E1–E4).
- Todo cambio a `main` mediante PR con al menos una aprobación de un integrante distinto del autor.
- Rama `main` protegida, sin force-push.

**Qué deben hacer**
1. Activar la protección de `main`: PR obligatorio, 1 aprobación, sin force-push.
2. Crear `CHANGELOG.md` (Keep a Changelog) con v1.0.0…v4.0.0 y sus fechas reales.
3. Integrar las correcciones pendientes mediante PR revisados por otro integrante (Jeremy debe revisar y ser revisado).
4. `git tag -a v4.0.0 -m "Cierre Entrega final PFC" <sha>` y `git push origin v4.0.0`.
5. Borrar las etiquetas `backup-*` o documentarlas.
6. Mover `mobile-release` a un commit de `main`, o sustituirlo por un release versionado e inmutable ligado a `v4.0.0`.

**Cómo lo verifico**
- `git cat-file -t v4.0.0` → `tag`.
- `git for-each-ref refs/tags/v4.0.0 --format='%(taggerdate:iso) %(objectname:short)'`.
- `git merge-base --is-ancestor v4.0.0 origin/main`.
- `GET /repos/…/pulls?state=closed` y `/pulls/N/reviews` → cada PR con un review `APPROVED` de un usuario distinto del autor.
- `git log --first-parent main` → solo merges de PR tras la fecha de activación.

**Estimación**
- P2: flujo de integración estándar.
- C2: protección de rama, etiqueta anotada, changelog.
- A2: repositorio y configuración de GitHub.
- T2: 2–6 h, incluido rehacer el changelog con fechas reales.

---

### §4 Backend en capas y SOLID

**Qué encontré**
- **El dominio tiene anotaciones de Spring**, lo que contradice `docs/adr/0005-patrones-gof.md` («El dominio queda libre de anotaciones JPA/Spring»). En `services/svc-principal/.../ticketservice/domain/` son 9 archivos:
  - `correlation/SinCorrelacionStrategy.java:14` → `@Component("c0")`
  - `ZonaVentanaStrategy.java:20` → `@Component("c1")`
  - `ZonaVentanaTelemetriaStrategy.java:8,24` → `@Value` y `@Component("c2")`
  - `escalation/EscalationChain.java:15`
  - `SlaBreachedEscalationHandler.java:12-13` → `@Component @Order(1)`
  - `StaleCriticalEscalationHandler.java:18-19`
  - `factory/TicketFactory.java:22`
  - `policy/ClassifiedSlaPolicy.java:14`
  - `DefaultSlaPolicy.java:12`

  Lo mismo ocurre en `telemetry-service/.../domain/TelemetryStore.java:17` (`@Component`).

  Comando: `grep -rn "^import org.springframework" services/*/src/main/java/**/domain`.
- **Entidades de dominio anémicas y mutables**, con Lombok `@Setter @NoArgsConstructor @AllArgsConstructor @Builder`: `Ticket.java:22-26`, `Incidencia.java:27-31`, `auth User.java:18-22`, `RefreshToken.java`, `report TicketSummary.java:27-31`. Las invariantes se pueden saltar con los setters.
- **Capas incompletas en varios servicios.**
  - `telemetry-service` solo tiene `domain/` e `infrastructure/`, sin `application/` ni `presentation/`.
  - `notification-service` es plano: `src/{config,db,dispatcher,index,kafkaConsumer,logger}.js` y `routes/`.
  - `ai-service` también es plano: `app/{classifier,config,kafka_consumer,main,mongo}.py`.
  - Las cuatro capas solo existen en `svc-principal`, `auth-service` y `report-service`.
- **Violación de DIP.** `presentation/TicketController.java:38-46` depende de las clases concretas `CreateTicketHandler`, `UpdateTicketStatusHandler` y `AssignTechnicianHandler`, no de la abstracción `TicketCommandHandler<C,R>`.
- **Puertos y adaptadores correctos.**
  - `domain/TicketRepository` e `IncidenciaRepository` están implementados en `infrastructure/persistence/*RepositoryAdapter`.
  - `domain/EventPublisher` se implementa en `KafkaEventPublisherAdapter`.
  - `TelemetryQueryPort` se implementa en `TelemetryGrpcClientAdapter`.
  - No hay JPA en el dominio.

**Cómo debe quedar**
- `grep -rn "org.springframework\|jakarta.persistence\|lombok.Setter" services/*/src/main/java/**/domain` → vacío.
- Registro de beans en `infrastructure/config/*Config.java`, con `@Bean` que construyen las estrategias, la cadena y la fábrica.
- Entidades con constructor y métodos de negocio (`asignar()`, `cambiarEstado()`, `escalar()`), sin setters públicos.
- Las cuatro capas en todos los microservicios con lógica (incluidos telemetry, notification y ai), o una justificación explícita en un ADR para los servicios triviales.
- Controladores que dependen de interfaces.

**Qué deben hacer**
1. Crear `infrastructure/config/DomainBeansConfig.java` y quitar `@Component`/`@Order`/`@Value` del dominio. `c2` recibe la ventana temporal por constructor.
2. Sustituir `@Setter` y `@AllArgsConstructor` por métodos de negocio y ajustar los `*Mapper`.
3. Reorganizar notification-service (`domain/`, `application/`, `infrastructure/`, `presentation/`) y ai-service de la misma forma, o documentar la excepción.
4. Inyectar `TicketCommandHandler<CreateTicketCommand, Ticket>` en el controlador.
5. Añadir una prueba de arquitectura con ArchUnit: el dominio no depende de `org.springframework..`.

**Cómo lo verifico**
- `grep -rln "import org.springframework" services/*/src/main/java/ec/edu/uteq/soporte/*/domain` → 0 líneas.
- `mvn -B test -Dtest=ArchitectureTest` en `svc-principal`, `auth-service`, `report-service` y `telemetry-service`, en verde.
- `ls services/notification-service/src` → carpetas por capa.

**Estimación**
- P3: juicio de diseño hexagonal y DIP.
- C3: reconfigurar la inyección sin romper 86 pruebas.
- A4: 4 servicios Java y 2 no Java.
- T3: 6–15 h.

---

### §5 Patrones GoF y ADR

**Qué encontré**
- **Patrones implementados con código real y pruebas:**
  - **Repository:** `TicketRepositoryAdapter`.
  - **Factory Method:** `TicketFactory`.
  - **Strategy:** `SlaPolicy` y `CorrelationStrategy` c0/c1/c2.
  - **Command:** 3 comandos y 3 manejadores.
  - **Chain of Responsibility:** `EscalationHandler.linkWith`, `EscalationChain:20-24`.
  - **Observer:** `EscalationObserver` con 3 observadores y `EscalationScheduler` (`@Scheduled` cada 5 min).
- **Falta el Strategy de rutas que exige la Tabla 1 para ACC.** No existe estrategia de rutas ni de asignación de visitas: `grep -rli "route\|ruta" services apps/mobile` solo devuelve filtros HTTP y navegación. El Strategy implementado es de SLA y de correlación.
- **«Observer (SLA)» solo cubre el escalado.** No hay sujeto que notifique cambios de SLA (cumplido, en riesgo o vencido) a la consola.
- **Command** se aplica como manejador de estilo CQRS, sin invocador ni historial. Es aceptable, pero el controlador depende de clases concretas (véase §4).
- **Defectos de `docs/adr/0005-patrones-gof.md`:**
  - El párrafo «Antes de este refactor, `ticket-service` tenía una única clase…» aparece **duplicado** casi literalmente en «Contexto».
  - Afirma en «Consecuencias» que el dominio está libre de Spring, lo cual es falso (§4).
  - Cita «45 tests», cuando hoy hay 86 `@Test` en `svc-principal/src/test`.
  - La nomenclatura es `0005-…`, no `ADR-005-…`.
- **`docs/adr/0006-eleccion-movil.md`** tiene formato Nygard y dos criterios con cifras propias: APK de 11,06 MB y 20 dependencias. Pero **no aporta ninguna cifra de las alternativas** (Flutter o React Native). El propio ADR reconoce en «Riesgos» que no se midió una alternativa, así que no hay comparación cuantitativa.

**Cómo debe quedar.** Los cinco patrones de la Tabla 1 con uso real y prueba:
- Strategy de rutas, p. ej. `RutaStrategy` con `CercaniaStrategy` y `PrioridadSlaStrategy` para ordenar las visitas del técnico con GPS.
- Observer de SLA que notifique el estado de SLA a la consola y al móvil.

Además, ADR-005 coherente con el código y sin duplicados, y ADR-006 con al menos dos criterios cuantificados **para ambas opciones** (p. ej. tamaño del APK *hello world* en Flutter y en Compose, tiempo de arranque en frío), con fuente o medición reproducible.

**Qué deben hacer**
1. Implementar en `domain/routing/` una interfaz `RutaStrategy` con dos implementaciones, usada por un caso de uso `PlanificarRutaTecnico` que expone `GET /api/v1/tickets/route?technicianId=` y que consume el móvil. Añadir pruebas unitarias.
2. Implementar `SlaObserver`: un sujeto en el caso de uso de cambio de estado que notifica `SlaStatusChanged` a los observadores (métrica, Kafka, WebSocket/SSE). Añadir su prueba.
3. Editar ADR-005: quitar el duplicado, corregir la afirmación sobre el dominio y el conteo de pruebas, y añadir los patrones de rutas y SLA.
4. Completar ADR-006 con una tabla comparativa medida o citada: por ejemplo, compilar un proyecto mínimo de Flutter y otro de Compose y anotar los MB, o citar fuentes con cifras.

**Cómo lo verifico**
- `grep -rn "interface RutaStrategy\|implements RutaStrategy" services/svc-principal/src/main` → al menos 3.
- `mvn -B test -Dtest='*Ruta*Test,*Sla*Observer*Test'` en verde.
- `grep -c "Antes de este refactor" docs/adr/0005-patrones-gof.md` → 1.
- ADR-006 con una tabla de al menos 2 filas × 2 opciones con valores numéricos.

**Estimación**
- P3: modelar rutas y SLA con patrones de forma no placebo.
- C3: nuevo caso de uso, endpoint y consumo móvil.
- A3: backend, móvil y 2 ADR.
- T3: 6–15 h.

---

### §6 Aplicación web funcional

**Qué encontré**
- **Lo que cumple:**
  - Las 5 rutas en `apps/web/src/App.tsx`: `/` redirige, `/login`, y `/main`, `/settings` y `/about` bajo `ProtectedRoute`; además `/admin` y `/reports` bajo `RoleRoute`.
  - i18n es/en (`src/i18n/locales/{es,en}.json`) y tema claro/oscuro (`src/theme/ThemeContext.tsx`).
  - JWT en `sessionStorage` con expiración (`features/auth/session.ts`), no en `localStorage`.
  - Todo el consumo pasa por el gateway (`lib/apiClient.ts`, `VITE_GATEWAY_BASE_URL`).
  - Estados de carga y error presentes (`useTickets`: `loading`, `error`).
- **Falta la vista de SLA por zona y por técnico exigida en la Tabla 1.** Es solo un subtítulo: `es.json:30` dice «Vista de SLA por zona y por técnico». En la práctica `ConsolePage.tsx` muestra 3 KPI globales (total, escalados, SLA vencido), un filtro de zona (solo ADMIN) y una insignia de SLA por fila.
  - `ReportsPage.tsx:47-49` desglosa por estado, zona y categoría, pero **no hay desglose por técnico ni porcentaje de cumplimiento de SLA** por zona.
  - `SummaryResponse.java:10` solo expone `byStatus`, `byZone` y `byCategory`.
- **No existe el rol coordinador/operador.** Los roles son `CLIENTE`, `TECNICO` y `ADMIN` (`session.ts: type Role`), así que la «consola de operadores y coordinadores» se reduce a ADMIN.

**Cómo debe quedar.** En `/main`, o en una subruta enlazada, una vista con, por zona y por técnico:
- Tickets abiertos, vencidos y porcentaje de cumplimiento de SLA.
- Tiempo medio de resolución.

Debe alimentarse de un endpoint real (p. ej. `GET /api/v1/reports/sla?groupBy=zone|technician`), con i18n, estados de carga y error, y pruebas. Rol `COORDINADOR` (o equivalente documentado) con acceso a esa vista.

**Qué deben hacer**
1. En report-service, añadir `SlaSummaryResponse` agrupado por `zone` y `technicianId` (cumplidos, vencidos, porcentaje, MTTR) y su prueba.
2. En la web, añadir `features/sla/pages/SlaPage.tsx` con dos tablas o gráficos, claves i18n es/en y pruebas Vitest.
3. Añadir el rol en auth-service y en `RoleRoute`.
4. Añadir una prueba Playwright que abra la vista SLA.

**Cómo lo verifico**
- `grep -rn "groupBy\|byTechnician" services/report-service/src/main apps/web/src` → no vacío.
- `npx vitest run src/features/sla`.
- `npx playwright test -g "SLA"` contra el stack.
- `curl -H "Authorization: Bearer $T" localhost:8000/api/v1/reports/sla?groupBy=technician` → JSON con porcentaje por técnico.

**Estimación**
- P2: requisito funcional claro.
- C3: agregación en el modelo de lectura CQRS con UI.
- A3: report-service, web, auth e i18n.
- T3: 6–15 h.

---

### §7 Calidad de la aplicación web

**Qué encontré.** Lo ejecuté en `scratchpad/work/ACC/web` sobre `git archive 964fa6e`:

| Comprobación | Resultado |
|---|---|
| `npm ci` | exit 0 |
| `npx tsc -b` | exit 0 (`tsconfig.app.json`: `strict: true`) |
| `npm run lint` (`--max-warnings 0`) | exit 0 |
| `npx vitest run --coverage` | **23 archivos, 75 pruebas en verde**; líneas/sentencias 87,6 % (1583/1807), ramas 89,09 % (237/266), funciones 78,3 % (83/106) |

Alcance de la cobertura: `src/**/*.{ts,tsx}`, excluyendo `main.tsx`, tipos y tests (`vitest.config.ts`). Es razonable, no un alcance elegido a conveniencia.

Dockerfile multi-stage correcto: `node:20-alpine AS builder` → `nginx:1.27-alpine`.

**Defectos:**
- **La cobertura no se mide ni se exige en CI.** `ci-cd.yml:137-139` ejecuta `npm test` (= `vitest run`, sin `--coverage`) y `vitest.config.ts` no define `thresholds`. Una caída por debajo del 70 % no rompería el pipeline.
- **No hay artefacto `dist` versionado por hash.** Ningún job hace `npm run build` + `upload-artifact` de `dist/` con el SHA. Solo existe la imagen `ghcr.io/.../web:${{ github.sha }}`, que es aceptable como artefacto, pero no se publica `dist` ni su suma.

**Cómo debe quedar**
- `vitest.config.ts` con `coverage.thresholds: { lines: 70, branches: 70, functions: 70, statements: 70 }`.
- Job `test-web` que ejecute `npm run test:coverage` y suba `coverage/` como artefacto.
- Job (o paso) que ejecute `npm run build` y publique `web-dist-${{ github.sha }}` con `SHA256SUMS`.

**Qué deben hacer**
1. Añadir `thresholds` a `vitest.config.ts` y el reporter `json-summary`.
2. Cambiar el paso de CI a `npm run test:coverage`, añadir `actions/upload-artifact` de `apps/web/coverage`, y un paso de build que suba `apps/web/dist` con el nombre `web-dist-${{ github.sha }}`.
3. Demostrar que la compuerta puede fallar con un PR temporal que suba el umbral a 95 % y muestre el fallo, luego revertir. El enlace al run va en el PR.

**Cómo lo verifico**
- `grep -n "thresholds" apps/web/vitest.config.ts`.
- `grep -n "test:coverage\|web-dist-" .github/workflows/ci-cd.yml`.
- `GET /actions/runs/<run>/artifacts` → artefactos `web-dist-<sha>` y `web-coverage`.
- `cd apps/web && npx vitest run --coverage` → ≥70 % en todas las métricas.

**Estimación**
- P1: configuración conocida.
- C2: umbrales y artefactos de CI.
- A2: `vitest.config.ts` y `ci-cd.yml`.
- T1: menos de 2 h.

---

### §8 Aplicación móvil funcional

**Qué encontré**
- **Lo que cumple:**
  - Login (`ui/auth`).
  - Listado con pull-to-refresh (`TicketListScreen.kt:79,117`, `pullRefresh`).
  - Detalle.
  - Modo sin conexión con Room (`data/local/*`, `TicketRepository.observeTickets` lee de la caché).
  - JWT en `EncryptedSharedPreferences` AES256 (`data/session/SessionManager.kt:14-24`).
  - Captura real de foto (`ActivityResultContracts.TakePicture`, `TicketDetailScreen.kt:96`) y de GPS (`FusedLocationProviderClient.getCurrentLocation`, `TicketDetailScreen.kt:427-432`).
- **El cierre en sitio NO envía la evidencia.**
  - `TicketDetailViewModel.closeOnSite()` (líneas 57-73) solo exige que existan la foto y las coordenadas (`canCloseOnSite`, líneas 25-26) y luego llama a `ticketRepository.closeOnSite(ticketId)` **sin foto ni coordenadas**.
  - `data/repository/TicketRepository.kt:41-47` lo reconoce: «hoy solo actualiza el estado a RESUELTO… La foto de evidencia y la geolocalizacion… quedan listas para enviarse en cuanto el backend exponga el campo».
  - `TicketApi.kt` no tiene ningún endpoint multipart ni de evidencia, y el backend tampoco.
  - Aun así, el diálogo de confirmación afirma «Se enviará la evidencia fotográfica y las coordenadas GPS del sitio» (`TicketDetailScreen.kt:381`). **Es un mensaje engañoso para el usuario.**

  Las capacidades del dispositivo se capturan pero no se usan de verdad en el flujo de negocio: la foto y el GPS se descartan.
- **«Tickets asignados» no está implementado.**
  - `TicketRepository.refreshTickets()` llama a `listTickets(zone = null, status = null)`.
  - El backend filtra al TECNICO **por zona**, no por asignación (`TicketQueryService.java:52-55`: «un TECNICO solo puede ver su propia zona»).
  - El técnico ve todos los tickets de su zona, asignados o no.
- **No hay logging estructurado** (Timber + JSON, exigido en D6): `grep -rn Timber apps/mobile` → vacío. Véase §14.

**Cómo debe quedar**
- El cierre en sitio sube la foto (multipart o almacenamiento de objetos) y lat/lon.
- El backend persiste la evidencia (tabla `ticket_evidence`: ticket_id, url o blob, lat, lon, captured_at, technician_id) y la expone en el detalle web.
- El listado móvil muestra solo los tickets **asignados al técnico autenticado**.
- Sin conexión, el cierre queda en cola y se sincroniza.

**Qué deben hacer**
1. Backend:
   - `POST /api/v1/tickets/{id}/close-on-site` (multipart: `photo`, `latitude`, `longitude`), con un comando `CloseOnSiteCommand` y su manejador que validen el rol TECNICO y la asignación.
   - Migración de la tabla de evidencias.
   - Pruebas unitarias y de contrato.
2. Móvil:
   - `@Multipart` en `TicketApi`, `closeOnSite(ticketId, photoUri, lat, lon)` en el repositorio, y `WorkManager` para la cola sin conexión.
   - Prueba de `TicketDetailViewModel` que verifique que se envían los tres datos.
3. Backend: el filtro `assignedTo=me` para TECNICO. En el móvil, pedir ese filtro.
4. Web: mostrar la foto y las coordenadas en `TicketDetailModal`.

**Cómo lo verifico**
- `grep -n "Multipart\|latitude" apps/mobile/app/src/main/java/**/data/remote/TicketApi.kt`.
- `grep -rn "close-on-site\|ticket_evidence" services/svc-principal/src db-cluster`.
- `./gradlew :app:testDebugUnitTest --tests '*TicketDetailViewModelTest*'`.
- Evidencia versionada: request/response real (log del gateway o captura) de un cierre con foto y GPS, y fila en `ticket_evidence`.

**Estimación**
- P3: flujo extremo a extremo con evidencia binaria y trabajo sin conexión.
- C4: multipart, almacenamiento, cola, migración y contrato.
- A4: móvil, backend, BD y web.
- T4: 15–30 h.

---

### §9 Calidad de la aplicación móvil

**Qué encontré**
- **Pruebas unitarias de ViewModels:** solo `app/src/test/.../ui/auth/LoginViewModelTest.kt`, con **3 `@Test`**. `TicketListViewModel` y `TicketDetailViewModel` (este último con la lógica de cierre) **no tienen pruebas**.
- **Prueba instrumentada:** `app/src/androidTest/.../LoginScreenTest.kt`, con 2 `@Test` que solo validan campos vacíos del formulario de login. El propio comentario (líneas 14-19) dice que no dependen del backend. **No es un recorrido E2E** (login → lista → detalle → cierre).
- **APK:**
  - `release/apk/soporte-isp.apk` (12 860 790 B), sha256 `ff762b9b…` = `release/apk/SHA256SUMS.txt`.
  - `jarsigner -verify` → «signature was verified», certificado `CN=Equipo ACC` válido del 10/09/2026 al 26/01/2054.
  - Pero **el APK versionado se subió a mano** (`e03c15c`, Carlos, 10/09 14:56); CI no lo commitea.
  - El job `build-mobile-apk` (`ci-cd.yml:303-360`) sí firma con un keystore desde un secreto y publica un artefacto (90 días) y el Release `mobile-release`.
  - Ese Release depende de una etiqueta ligera que apunta a `f5300ed`, **fuera de `main`**, y sus assets se sobrescriben en cada push: están fechados el 16/09. No hay forma de demostrar que el APK del Release coincide con el del corte.
  - La corrida del corte (34785316252) tiene el artefacto `soporte-isp-release-firmado` (12 320 636 B, empaquetado zip), pero caduca a los 90 días.

**Cómo debe quedar**
- Pruebas unitarias para los 3 ViewModels (casos de éxito, error, sin conexión y cierre con evidencia), con JUnit 5, coroutines-test y turbine.
- Al menos una prueba instrumentada que recorra login → lista → detalle con un backend simulado (MockWebServer) o real.
- APK firmado generado por CI y publicado en un Release **inmutable** ligado a la etiqueta de cierre (`v4.0.0`), con SHA256 que coincida con el publicado.

**Qué deben hacer**
1. Crear `TicketListViewModelTest` y `TicketDetailViewModelTest` (con `mockk` para el repositorio), al menos 4 casos cada uno.
2. Crear `TicketFlowE2ETest` en `androidTest` con `MockWebServer`: login, lista, clic en ticket, detalle visible.
3. En CI, publicar el Release con `tag_name: ${{ github.ref_name }}` solo con `on: push: tags: ['v*']`, sin sobrescribir. Subir `SHA256SUMS.txt` y documentar en README la URL del Release `v4.0.0`.

**Cómo lo verifico**
- `grep -c "@Test" apps/mobile/app/src/test/**/*ViewModelTest.kt` → 3 archivos, al menos 10 pruebas.
- `grep -rn "MockWebServer\|onNodeWithText" apps/mobile/app/src/androidTest`.
- `curl -sL https://api.github.com/repos/gleiston-guerrero/PFC-SOPORTE-ISP/releases/tags/v4.0.0` → assets con fecha igual a la del tag.
- Descargar el APK y comprobar `sha256sum -c SHA256SUMS.txt` y `apksigner verify --print-certs`.

**Estimación**
- P2: pruebas estándar de Android.
- C3: E2E instrumentada con servidor simulado en el emulador de CI.
- A3: tests, workflow y README.
- T3: 6–15 h.

---

### §10 Integración y contratos

**Qué encontré**
- **Solo hay un consumidor Pact, la web:** `apps/web/tests/contract/ticketsApi.pact.test.ts` → `pacts/soporte-web-ticket-service.json`.
  - Tiene **2 interacciones**, ambas `GET /api/v1/tickets`: 401 sin token y 200 con ADMIN.
  - No cubre detalle, creación, cambio de estado, asignación, login ni reportes.
- **No hay contrato del consumidor móvil:** `git ls-files | grep -i pact` → 3 archivos, ninguno en `apps/mobile`. El móvil usa `GET /tickets`, `GET /tickets/{id}` y `PATCH /tickets/{id}/status` sin ningún contrato.
- **El proveedor se verifica contra el stack real.** `TicketServiceProviderPactTest` va condicionado con `@EnabledIfSystemProperty(RUN_CONTRACT_VERIFICATION)` y lo ejecuta el job `integration` (`ci-cd.yml:417-419`), en verde en el run del corte. Es correcto, pero solo para las 2 interacciones.
- **Misma API para ambos clientes vía gateway:** sí (`apiClient.ts`, `NetworkModule.kt`).
- **`docs/api/openapi.yaml` (OpenAPI 3.0.3):**
  - Rutas relativas ambiguas (`/`, `/{id}`, `/{id}/status`, `/summary`…) bajo 10 `servers` globales. Un validador no puede asociar `/` a ticket-service.
  - Respuestas 2xx **sin esquema** en `GET /` (listar), `PATCH /{id}/status`, `POST /{id}/assign` y `GET /admin/users`, entre otras.
  - El endpoint real `GET /api/v1/tickets/incidencias` (`IncidenciaController.java:24`) **no está documentado**.
  - Nada en CI valida el contrato OpenAPI.

**Cómo debe quedar**
- Dos consumidores (`soporte-web` y `soporte-mobile`) con interacciones para cada operación que usa cada cliente, incluida la de cierre en sitio de §8.
- Pactos verificados por el proveedor real en CI; opcionalmente con Pact Broker o `can-i-deploy`.
- OpenAPI con rutas absolutas `/api/v1/...`, esquemas en todas las respuestas, incidencias incluidas, y validación en CI (`swagger-cli validate` o `spectral lint`).

**Qué deben hacer**
1. Móvil: añadir `au.com.dius.pact.consumer:junit5` a `testImplementation` y crear `TicketApiPactTest.kt` (lista, detalle, cambio de estado y cierre) que genere `pacts/soporte-mobile-ticket-service.json`.
2. Web: ampliar a detalle, creación, estado y asignación.
3. Proveedor: `@PactFolder` ya carga todos los pactos de `pacts/`. Añadir los `@State` necesarios.
4. Reescribir las rutas de OpenAPI con prefijo completo, añadir esquemas (`TicketResponse`, `ApiResponseTicketList`…) y el paso `npx @redocly/cli lint docs/api/openapi.yaml` en `lint`.

**Cómo lo verifico**
- `ls pacts/` → 2 archivos.
- `python -c "import json;[print(f,len(json.load(open('pacts/'+f))['interactions'])) for f in __import__('os').listdir('pacts')]"` → web ≥5, móvil ≥4.
- Log del job `integration` con «Verifying a pact between soporte-mobile and ticket-service», en verde.
- `npx @redocly/cli lint docs/api/openapi.yaml` → 0 errores.

**Estimación**
- P3: pruebas de contrato dirigidas por el consumidor en dos plataformas.
- C3: Pact JVM en Android y estados del proveedor.
- A3: móvil, web, proveedor, OpenAPI y CI.
- T3: 6–15 h.

---

### §11 Persistencia distribuida

**Qué encontré**
- **Clúster y healthchecks:**
  - Tres nodos CockroachDB en `docker-compose.yml:61-125`, con localidades `quevedo-centro`, `quevedo-norte` y `quevedo-sur`.
  - Healthcheck `curl -f http://localhost:8080/health`.
  - `db-init` espera `service_healthy`.
  - `db-cluster/config/zones.sql`: `num_replicas = 3`.
- **Tolerancia a fallos:** la evidencia es de la E3.
  - `docs/evidencias/tolerancia_fallos.md`: caída de roach2 con 0 errores y P95 transitorio de 1590,8 ms.
  - Vídeos de 4:55 y 5:34.
  - La bitácora cita capturas en `docs/evidencias/frames/`, que **no existe**.
  - **No hay migraciones versionadas**: ni Flyway ni Liquibase (`grep -rn "flyway\|liquibase" services/*/pom.xml` → vacío). El esquema se aplica con scripts `CREATE TABLE IF NOT EXISTS` en `db-cluster/scripts/*.sql` desde el `command` de `db-init`.
  - **Hay un cambio de esquema incrustado en el compose**: `ALTER TABLE auth_db.users ADD COLUMN IF NOT EXISTS zone STRING;` (`docker-compose.yml:~155`). Es deriva de esquema sin historial.
  - `docs/db/schema.sql` es una copia «de referencia» que puede divergir de los scripts reales.
  - `ddl-auto: none` en los 3 servicios JPA.
- **Imágenes flotantes:** `cockroachdb/cockroach:latest-v23.2`, también en Testcontainers (`TicketRepositoryIntegrationTest.java:66`).

**Cómo debe quedar**
- Migraciones versionadas (`V1__init.sql`, `V2__users_zone.sql`, …) aplicadas por Flyway (o `cockroach sql` con tabla de versiones) en cada servicio con BD.
- `schema.sql` generado desde las migraciones, o retirado.
- Imagen con versión fija (p. ej. `v23.2.x`).
- Evidencia reproducible de tolerancia a fallos en la configuración de la E4: script que mata un nodo bajo carga, log CSV versionado y SHA256.

**Qué deben hacer**
1. Añadir `flyway-core` y `flyway-database-cockroachdb` a auth, ticket y report. Mover los `CREATE` a `src/main/resources/db/migration/V1__*.sql` y el `ALTER` a `V2__*.sql`. Retirar el SQL del `command` de `db-init` (dejar solo `cockroach init`).
2. Fijar `cockroachdb/cockroach:v23.2.<patch>` en el compose y en Testcontainers.
3. Crear `db-cluster/scripts/fault_injection.sh`, que ejecute `load_write.py` y `docker kill roach2` y guarde `db-cluster/results/tolerancia_e4_<fecha>.csv` en el manifiesto.
4. Corregir la referencia a `frames/`.

**Cómo lo verifico**
- `git ls-files "services/*/src/main/resources/db/migration/V*.sql"` → al menos 2 por servicio con BD.
- `grep -n "ALTER TABLE" docker-compose.yml` → vacío.
- `grep -n "latest" docker-compose.yml` → vacío.
- `docker compose up -d && docker exec roach1 cockroach sql --insecure -e "SELECT version,success FROM ticket_db.flyway_schema_history"` (en la máquina del docente).
- `sha256sum -c db-cluster/results/SHA256SUMS.txt`.

**Estimación**
- P2: migraciones y pruebas de caída.
- C3: Flyway sobre CockroachDB en 3 servicios.
- A3: poms, recursos, compose y scripts.
- T3: 6–15 h.

---

### §12 Pirámide de pruebas

**Qué encontré.** Recuento de pruebas (`grep "@Test"` y equivalentes):

| Ubicación | Pruebas |
|---|---|
| svc-principal | 86 `@Test` + 1 plantilla Pact |
| auth-service | 15 |
| report-service | 11 |
| telemetry-service | 8 |
| api-gateway | 1 |
| ai-service | 8 `def test_` |
| notification-service | 4 |
| web, unitarias | 75 (ejecutadas, en verde) |
| web, E2E Playwright | 3 (`apps/web/e2e/console.spec.ts`) × 3 navegadores |
| móvil | 3 unitarias + 2 instrumentadas |

- **Integración con Testcontainers:** solo 3 `@Test` en `TicketRepositoryIntegrationTest` (svc-principal) y la de sockets de telemetry. Nada en auth-service ni en report-service.
- **Cobertura del backend:**
  - **Solo se mide svc-principal**: `docs/evidencias/jacoco-svc-principal`, CSV con 555/684 líneas = 81,1 %, 2582/3582 instrucciones = 72,1 %, 88/154 ramas = 57,1 %. El XML del reporte da 551/679, diferencia explicada en `0f46bd5`.
  - auth, report y telemetry **no tienen JaCoCo**.
  - En svc-principal JaCoCo está en un perfil `coverage` **no activado en CI** (`ci-cd.yml:89` ejecuta `mvn -B test`), **sin ejecución `check` ni umbral**: no hay compuerta.
  - La cifra del 81,1 % procede de una ejecución local del 07/09 (sessioninfo `1788837301995` = 07/09 22:15 −05) sobre `31f1ef5`, un commit que no está en `main`.
- **Contrato:** incompleto (§10).
- **E2E móvil:** inexistente (§9).
- **Carga:** fuera de especificación (detalle en §15). Hay 5 corridas por escenario:

  | Escenario | Exigido | Ejecutado (según `*_stats_history.csv`) |
  |---|---|---|
  | A | 50 usuarios × 5 min | máximo **30 usuarios × 58–60 s** |
  | B | rampa 0→200 en 10 min | rampa **0→60 en 118–119 s** |

  Los comandos de `tests/load/locustfile.py:12-21` no se ejecutaron tal como se declaran.
- **Artefactos por tipo en CI:** solo `playwright-report`. No se suben informes surefire, JaCoCo, Vitest ni resultados instrumentados.

**Cómo debe quedar**
- Cobertura ≥70 % **por servicio backend con lógica** (o agregada con `jacoco:report-aggregate`), medida y exigida en CI.
- Testcontainers al menos en auth-service y report-service.
- Contratos web y móvil (§10) y E2E web y móvil.
- Locust con 50u×5min y 0→200 en 10 min según §15.
- Cada job sube su informe como artefacto.

**Qué deben hacer**
1. En los 4 `pom.xml` Java: JaCoCo siempre activo con `prepare-agent`, `report` y `check` (`INSTRUCTION COVEREDRATIO 0.70`, también `BRANCH` y `LINE`) ligados a `test`. Añadir pruebas hasta superar el umbral: las ramas de svc-principal están en 57,1 %.
2. Añadir `*RepositoryIntegrationTest` con Testcontainers en auth y report.
3. Subir `target/surefire-reports`, `target/site/jacoco`, `apps/web/coverage` y `apps/mobile/app/build/reports` con `upload-artifact`.
4. Ejecutar Locust con los parámetros exactos (véase §15).

**Cómo lo verifico**
- `for s in auth-service svc-principal report-service telemetry-service; do (cd services/$s && mvn -B test) ; done` → cada uno con `jacoco:check` «All coverage checks have been met».
- `grep -rn "<minimum>0.70" services/*/pom.xml` → 4.
- `GET /actions/runs/<run>/artifacts` → surefire-*, jacoco-*, web-coverage, mobile-test-reports, playwright-report.
- `python - <<'EOF'` sobre `resultados/locust/*_stats_history.csv`: máximo de `User Count` = 50 y duración ≥ 300 s (A); máximo = 200 y duración ≥ 600 s (B).

**Estimación**
- P3: estrategia de pruebas completa.
- C3: cobertura en 4 servicios, Testcontainers y artefactos.
- A4: todos los servicios, apps y CI.
- T4: 15–30 h.

---

### §13 Pipeline CI/CD (estado efectivo)

**Qué encontré.** El pipeline en sí es correcto:
- 7 jobs exigidos más `compile-latex` y `verify-checksums`.
- DAG: `build-images.needs: [lint, test-backend, test-web, test-mobile, integration]`.
- Imágenes `ghcr.io/<repo>/<svc>:${{ github.sha }}` publicadas: 7 jobs en verde en el run del corte.
- `integration` con sonda de salud (`docker inspect … Health.Status`, 40 × 15 s).
- `lint` con `--max-warnings 0`.

Baja por dependencia:
- No hay compuerta de cobertura (backend §12, web §7).
- No se verifica el contrato móvil (§10).
- `build-mobile-apk` no depende de `lint`.
- El agente OTel se descarga con `releases/latest` (`services/*/Dockerfile:20`), lo que hace la compilación no reproducible.

**Cómo debe quedar.** Igual que ahora, más las compuertas de §7 y §12, la verificación del pacto móvil, `build-mobile-apk.needs: [lint, test-mobile]` y el agente OTel con versión fija.

**Qué deben hacer.** Aplicar los pasos de CI de §7, §10 y §12. Cambiar la URL del agente a `download/v2.x.y/opentelemetry-javaagent.jar` con su suma verificada.

**Cómo lo verifico**
- `grep -n "releases/latest" services/*/Dockerfile` → vacío.
- `grep -n "needs: \[lint, test-mobile\]" .github/workflows/ci-cd.yml`.

**Estimación**
- P1: ajustes conocidos.
- C2: dependencias del DAG y versiones fijas.
- A2: workflow y Dockerfiles.
- T1: menos de 2 h, sin contar lo imputado en §7 y §12.

---

### §14 Observabilidad

**Qué encontré**
- **Métricas:** las 4 nuevas están instrumentadas (`http_requests_total`, `http_request_duration_seconds`, `app_business_events_total` y `app_active_sessions` en los `HttpMetricsFilter`/`SessionMetrics`) junto con `crdb_query_duration_seconds`, `crdb_transaction_retries_total` y `crdb_pool_active_connections` (`CrdbMetrics.java`).
- **Logs:** JSON con `trace_id` (`logback-spring.xml` en 4 servicios Java).
- **Trazas:** agente OTel → `otel-collector` (`ops/otel-collector/config.yaml`) → Tempo.
- **Dashboard:** `ops/grafana/pfc-dashboard.json` con 6 paneles.
- **Defectos:**
  1. **El panel 6 no mide la «latencia end-to-end desde el cliente móvil».** Usa `avg(http_request_duration_seconds{job="api-gateway", quantile="0.95"})`, que es latencia del gateway en el servidor. El móvil no emite ninguna métrica ni traza.
  2. **Los logs del móvil no son JSON ni llevan `trace_id`.** No hay Timber (`grep -rn Timber apps/mobile` → vacío).
  3. Los logs de notification-service y ai-service no pasan por el Collector (`OTEL_LOGS_EXPORTER: none`). El pipeline de logs del Collector no existe (solo `traces` y `metrics`).
  4. **No hay evidencia versionada de funcionamiento bajo carga.** No hay capturas de Grafana ni de Tempo, ni exportación de Prometheus (`git ls-files | grep -i "grafana\|tempo" | grep -i "png\|jpg"` → vacío). Las figuras del manuscrito (`docs/latex/figuras/`) son de la E3 y de las apps.
  5. Los paneles de latencia promedian cuantiles de *summaries* entre instancias (`avg(...{quantile="0.95"})`), lo cual no es estadísticamente válido; debería usarse `histogram_quantile` sobre buckets.

**Cómo debe quedar**
- Panel 6 alimentado por una métrica emitida por el móvil: interceptor OkHttp que mida la duración y la envíe por OTLP, o `mobile_request_duration_seconds` enviada al gateway.
- Timber con un árbol JSON que incluya `trace_id` (propagado con cabecera `traceparent`).
- Histograma con `histogram_quantile`.
- Carpeta `docs/evidencias/observabilidad/` con capturas del dashboard y de una traza durante la campaña Locust (fechadas dentro de la ventana de la campaña) y el JSON de consulta de Prometheus con marcas de tiempo.

**Qué deben hacer**
1. Móvil:
   - Añadir `com.jakewharton.timber:timber` y un `JsonTree`.
   - Añadir un `Interceptor` que cree `traceparent` y registre la duración.
   - Exportar vía OTLP HTTP al collector, o vía un endpoint del gateway.
2. Publicar `http_request_duration_seconds` como histograma (`publishPercentileHistogram`) y cambiar las expresiones a `histogram_quantile(0.95, sum(rate(..._bucket[1m])) by (le, job))`.
3. Ejecutar Locust (§15) con el stack y Grafana abiertos. Capturar los 6 paneles y una traza de Tempo con `trace_id` presente también en un log JSON. Exportar `curl 'localhost:9090/api/v1/query_range?...'` a JSON. Versionarlo todo con SHA256.

**Cómo lo verifico**
- `grep -rn "Timber\|traceparent" apps/mobile/app/src/main`.
- `python -c "import json;d=json.load(open('ops/grafana/pfc-dashboard.json'));print([t['expr'] for p in d['panels'] for t in p['targets'] if 'mobile' in t['expr'] or 'histogram_quantile' in t['expr']])"` → no vacío.
- `ls docs/evidencias/observabilidad/` → capturas y JSON cuyas marcas de tiempo caen dentro del intervalo de `resultados/locust/*_stats_history.csv`.

**Estimación**
- P3: correlación de trazas cliente→servidor.
- C3: instrumentación móvil e histogramas.
- A3: móvil, servicios, dashboard y evidencias.
- T3: 6–15 h.

---

### §15 Protocolo y campaña experimental

**Qué encontré.** El paquete de datos se recalculó desde el crudo sobre `git archive 964fa6e`.

**Campaña CORREL** (`experimentos/`, estrategias c0/c1/c2):
- **r = 5, no 10.** `correlacion_corridas.csv` tiene 60 filas: 3 escenarios × 3 modos × 5 réplicas, con Esc-4 aportando 2 zonas.
- **Réplicas degeneradas.** Las 5 filas de cada una de las 12 celdas son **idénticas valor a valor** (DE = 0), y c1 y c2 son idénticos fila a fila. El sistema es determinista, así que repetir no aporta variabilidad.
- **Población reducida:** 20/60/20+20 abonados frente a 100/500/100+100 (`docs/experimentos/protocolo-e4.md:63-64`). Falta el escenario «Esc-4 en la misma zona» que exigía `docs/adr/0008-correl-incidencias.md:40-47`.
- **Protocolo no registrado antes de medir.** `protocolo-e4.md` entra en el **mismo commit** que los datos (`8869188`, 08/09 00:32), con los resultados ya escritos, y declara haber corrido con 23 archivos sin commitear (línea 61). El ADR-0008 (`e506ef2`, 29/08) no contiene hipótesis ni umbrales. Aun así, `docs/latex/secciones/resultado_correl_e4.tex:48-49` dice «Se rechaza H0».
- **Descartes:** no se declaran ni se aplican.
- **Estadística incorrecta.**
  - «IC95 binomial [0,0]» es un intervalo de Wald degenerado (`generar_reporte_correl.py:108-110`). Clopper-Pearson con 0/30 da [0; 0,116].
  - «30 corridas de Esc-4» son 30 filas: 15 corridas × 2 zonas.
  - El contraste Mann-Whitney con n = 20 (U = 400, p = 2,578e-09, A12 = 1,0) usa filas no independientes: es pseudorreplicación.
- **Marca temporal eliminada.** La única marca de tiempo (`inicio_utc: 2026-09-08T02:43:54Z`) y los metadatos `repeticiones_por_condicion`/`escenarios` **se borraron** del JSON en `286f9b3` (10/09). Los CSV no tienen columna temporal, así que la duración y la secuencia no son verificables.

**Campaña Locust** (`resultados/locust/`):
- 5 corridas por escenario, no 10.
- A: máximo 30 usuarios, 58–60 s. B: rampa 0→60 en 118–119 s. Todo el 24/08 entre 08:47 y 09:03.
- Descartes (1.ª y 5.ª) aplicados en `analizar_resultados.py:42`, de modo que n = 3.
- Marcas de tiempo monótonas y anteriores al commit `fa8c54d` (15:31): no hay retrofechado.
- «Error (%)» etiquetado como 5xx incluye `ConnectionResetError` (A2 y A4).

**E3 (Spark):** diseño correcto. `protocolo.md` (`f196973`, 26/07) es anterior a los datos (`768925b`, 27/07), con r = 10 y 2 descartes. Pero `stats_test.json` se rehízo el 08/09 (`62ac709`) **cambiando la prueba estadística a posteriori** (a Mann-Whitney + Vargha-Delaney).

**Cómo debe quedar**
- `docs/experimentos/protocolo-e4.md` versionado **en un commit anterior al primer dato**, con:
  - Hipótesis H0/H1 por comparación, variables independientes, dependientes y de control, umbrales y α.
  - r = 10 por escenario con descarte de la primera y la última réplica.
  - Poblaciones del ADR-0008 y Locust 50u×5min y 0→200/10min.
  - Plan de análisis (prueba, tamaño de efecto, IC).
- Campaña ejecutada tal cual, con **variabilidad real entre réplicas**: semilla distinta por réplica en la generación de averías y tickets, orden aleatorio de modos, ruido de llegada. Cada fila con `run_id`, `seed` e `inicio_utc`/`fin_utc`.
- Unidad de análisis = corrida (no fila por zona). IC exactos (Clopper-Pearson o Wilson).

**Qué deben hacer**
1. Redactar y commitear primero el protocolo (commit A).
2. Modificar `correr_campana.py`: `--reps 10 --seed-base`, marca temporal por réplica, poblaciones del ADR y aleatorización del orden. Ejecutar con árbol limpio (`git status --porcelain` vacío, registrado en el JSON) (commit B posterior a A).
3. Locust:
   - `locust -f tests/load/locustfile.py --headless -u 50 -r 10 -t 5m --csv resultados/locust/A_runNN` × 10.
   - B con `LoadTestShape` 0→200 en 600 s × 10.
4. Rehacer el análisis con descartes, n = 8, IC exactos y Mann-Whitney por corrida. Sustituir «Se rechaza H0» por el contraste real frente a la hipótesis declarada.
5. Documentar el cambio de prueba de la E3 como desviación del protocolo.

**Cómo lo verifico**
- `git log --format='%h %ad' --date=iso -- docs/experimentos/protocolo-e4.md | tail -1` anterior a `git log ... -- experimentos/resultados/correlacion_corridas.csv | tail -1`.
- `python -c "import csv,collections as c;r=list(csv.DictReader(open('experimentos/resultados/correlacion_corridas.csv')));print(c.Counter((x['escenario'],x['modo']) for x in r))"` → 10 por celda (o más, por zona).
- Varianza > 0 en al menos una métrica por celda para c1 o c2.
- Por cada `resultados/locust/A_run*_stats_history.csv`: máximo de `User Count` = 50 y `Timestamp` final − inicial ≥ 300 s. Para B: máximo = 200 y ≥ 600 s.

**Estimación**
- P4: diseño experimental con aleatorización, unidad de análisis e hipótesis previas.
- C3: instrumentar la campaña y ejecutarla contra el stack.
- A3: protocolo, guiones, datos y análisis.
- T4: 15–30 h, porque la campaña Locust completa suma ≥ 150 min de carga más la preparación.

---

### §16 Paquete de datos y reproducibilidad

**Qué encontré**
- **Manifiestos:** `sha256sum -c` pasa en los tres, sobre los blobs git y sobre la copia (experimentos 3/3, locust 41/41, apk 1/1), y el job `verify-checksums` (`ci-cd.yml:507-522`) solo verifica, no regenera. Pero:
  - **Cobertura incompleta.** Quedan fuera:
    - `docs/experimentos/resultados/*` (5)
    - `spark/results/**` (15)
    - `db-cluster/results/*` (6)
    - `docs/evidencias/jacoco-svc-principal/jacoco.{csv,xml}` y `jacoco-svc-principal-raw.exec`
    - `docs/latex/secciones/generado/tabla_resultado_correl.tex`
    - los guiones `experimentos/*.py`

    Mientras tanto, el de locust sí incluye `analizar_resultados.py`. `generar_checksums.py:24-27` solo contempla 2 rutas.
  - **Circularidad local:** `correr_campana.py:266-267` y `analizar_resultados.py:74-75` regeneran el manifiesto al final de cada ejecución. El manifiesto de locust se regeneró 4 veces después de los datos (`02020ad`, `f3f8905`, `077bff6`, `3b780d1`, frente a datos de `fa8c54d`).
- **Reproducibilidad:**
  - `python experimentos/generar_reporte_correl.py` reproduce el JSON y la tabla **idénticos byte a byte tras quitar CR**. En Windows escribe CRLF (`open` sin `newline=""`, líneas 124 y 149) y la suma no coincide (`d743618b…` frente a `31b0ce0e…`).
  - `correr_campana.py` ya no genera el esquema del JSON versionado: sus claves difieren.
  - Fallo latente en `generar_reporte_correl.py:105-106`: compara enteros como cadenas.
- **Más de un juego de resultados:**
  - `docs/experimentos/resultados/` es copia byte a byte de `spark/results/protocol/`.
  - `spark/results/verificacion_individual/` es un segundo juego **distinto**: T(1) = 352,75 s frente a 235,22 s. No se declara cuál es el canónico.
- **No hay diccionario de datos ni metadatos** (codebook, `datapackage.json`, README de columnas con unidades y procedencia).
- **Validación de cabecera:**
  - `inyector_averias.py:99-108` valida antes del login y de la red. Correcto.
  - `correr_campana.py:105-115` valida después de `cambiar_modo` (l. 196, recrea el contenedor) y de `truncar_incidencias` (l. 199, `TRUNCATE`), y `main()` borra `verdad_campo.csv` sin respaldo (l. 189-190).

**Cómo debe quedar**
- Un único árbol de resultados canónico (p. ej. `resultados/{correl,locust,spark,cluster}/`), con los duplicados retirados.
- Un `SHA256SUMS.txt` raíz (o uno por carpeta) que cubra **todos** los datos crudos, derivados y guiones, generado por un comando independiente (`make checksums`) que no se ejecute implícitamente al analizar.
- `DATA_DICTIONARY.md` o `datapackage.json` por conjunto de datos.
- Guiones deterministas multiplataforma (`newline=""`).
- Validación de precondiciones antes de cualquier efecto (cambio de modo, TRUNCATE, borrado).
- CI que regenere tablas y figuras en limpio y ejecute `git diff --exit-code`.

**Qué deben hacer**
1. Consolidar carpetas y declarar el juego canónico en `resultados/README.md`.
2. Ampliar `generar_checksums.py` a todas las rutas y quitar la regeneración automática de `correr_campana.py` y `analizar_resultados.py`.
3. Añadir `newline=""` a todos los `open(..., 'w')` de CSV y JSON.
4. Mover la validación de cabecera y de precondiciones al inicio de `main()`, y hacer copia `.bak` antes de borrar.
5. Crear el diccionario de datos: columna, tipo, unidad, dominio y script productor.
6. Job `reproduce`: `python experimentos/generar_reporte_correl.py && python resultados/locust/analizar_resultados.py && git diff --exit-code`.

**Cómo lo verifico**
- `find resultados experimentos docs/experimentos spark/results db-cluster/results -type f ! -name SHA256SUMS.txt | wc -l` igual al número de líneas de todos los `SHA256SUMS.txt`.
- `sha256sum -c` en cada carpeta.
- En Windows y Linux: `python experimentos/generar_reporte_correl.py && git status --porcelain` → vacío.
- `grep -n "SHA256SUMS" experimentos/correr_campana.py resultados/locust/analizar_resultados.py` → vacío.
- `ls resultados/**/DATA_DICTIONARY.md`.

**Estimación**
- P3: diseño de un paquete de datos verificable.
- C2: guiones y manifiestos.
- A3: 5 carpetas de resultados, guiones y CI.
- T2: 2–6 h, sin contar la nueva campaña de §15.

---

### §17 Evaluación ISO/IEC 25010

**Qué encontré** (`docs/experimentos/evaluacion_iso25010.md`, `docs/latex/secciones/evaluacion_iso25010*.tex`):

| Característica | Exigido | Reportado | Problema |
|---|---|---|---|
| Eficiencia | p95 < 500 ms con 50 usuarios | A: 1600 ± 100 ms, IC95 [1351,6; 1848,4], n = 3 | Medido con 30 usuarios × 60 s, no 50u × 5 min |
| Fiabilidad | 5xx < 1 % durante **1 h continua** | 17,50 ± 4,74 % (A) y 35,28 ± 1,39 % (B) | **Nunca se midió 1 h**: el máximo continuo fue 119 s, ≈14,75 min en total. La causa atribuida (licencia de CockroachDB, md:88-90) no tiene log versionado |
| Seguridad | 100 % de endpoints con JWT; OWASP Top 10 | 30/30 | n = 1, sin DE ni IC, **sin artefacto crudo**. Solo 2 endpoints probados, sin inventario. A04/A06/A08/A10 no verificados |
| Mantenibilidad | cobertura ≥ 70 % + CC media < 10 | 542/668 y 2529/3518 (md:153-154); CCN 1,8 | Las cifras de md:153-154 **no aparecen en ningún archivo** (JaCoCo da 555/684 y 2582/3582). Sin salida de lizard versionada. n = 1 |
| Compatibilidad | Chrome, Firefox y Safari; API 26+ | «9/9 Playwright», «Sí» | Sin reporte versionado. WebKit ≠ Safari. Móvil solo con `minSdk = 26`, sin ejecución |

Otras observaciones:
- En el manuscrito, `evaluacion_iso25010.tex:57-58,70` da «19–34 %»: son totales de las 5 corridas **sin aplicar los descartes** que el propio documento declara, y sin DE ni IC.
- `analizar_resultados.py:2` cita `docs/resultados_iso25010.md`, que no existe.
- md:7 afirma «generados el 2026-08-24», pero las cifras de cobertura se editaron el 04/09 y el 08/09.
- El contraste con el umbral es honesto: No / No / Parcial.

**Cómo debe quedar.** Las 5 características con métrica objetiva, umbral, n ≥ 8 réplicas válidas, media, DE e IC95 % calculados por un guion versionado a partir de artefactos crudos versionados:
- Fiabilidad sobre una ejecución continua de 60 min a carga nominal (o r ejecuciones de 60 min).
- Seguridad sobre el inventario completo de endpoints de OpenAPI, con salida de ZAP u OWASP versionada.
- Mantenibilidad con salida JaCoCo y lizard versionada.
- Compatibilidad con reportes de Playwright (Chromium, Firefox, WebKit) y ejecución en emulador API 26 y API 34.
- Tabla del manuscrito generada automáticamente desde `iso25010.csv`.

**Qué deben hacer**
1. Tras §15, ejecutar `locust ... -u 50 -t 60m` para Fiabilidad y guardar el CSV.
2. Crear `tests/security/jwt_endpoints.py`, que recorra todos los paths de OpenAPI sin token y con token inválido y escriba un CSV por endpoint. Ejecutar `zap-baseline.py` y versionar el informe.
3. `lizard services/*/src/main -o resultados/iso25010/lizard.csv`, con JaCoCo XML de los 4 servicios.
4. Guion `resultados/iso25010/calcular.py` → `iso25010.csv` (característica, métrica, umbral, n, media, DE, IC_inf, IC_sup, cumple) → tabla LaTeX generada.
5. Corregir las cifras 542/668 y 2529/3518 y la referencia rota.

**Cómo lo verifico**
- `python resultados/iso25010/calcular.py && git diff --exit-code resultados/iso25010/iso25010.csv docs/latex/secciones/generado/`.
- `python -c "import csv;[print(r['caracteristica'],r['n'],r['de']) for r in csv.DictReader(open('resultados/iso25010/iso25010.csv'))]"` → n ≥ 8 y DE > 0 donde aplique.
- Duración del CSV de Fiabilidad ≥ 3600 s.
- `grep -rn "542/668\|2529/3518" docs` → vacío.

**Estimación**
- P4: métricas objetivas y análisis estadístico por característica.
- C3: herramientas de seguridad y compatibilidad automatizadas.
- A3: pruebas, resultados, manuscrito y CI.
- T4: 15–30 h, por la hora continua y las réplicas.

---

### §18 Manuscrito final, bibliografía y trazabilidad E1–E4

**Qué encontré.** Compilé desde `git archive 964fa6e` (pdflatex → bibtex → pdflatex ×2):
- **Compilación:** 0 errores, 0 citas o referencias indefinidas, 0 etiquetas duplicadas.
  - Tras el tercer pase aún aparece «Label(s) may have changed. Rerun».
  - 22 *Overfull hbox*, 8 de más de 30 pt; el mayor es de 71,7 pt en `pruebas_cicd.tex:19-20`.
  - 55 páginas, unas 47,5 de contenido (p. 6–53).
- **PDF versionado frente a fuente:** corresponden. pdftotext difiere solo en 2 números de página del índice, así que el PDF versionado se generó sin el último pase. La tabla de aporte (`conclusiones_e4.tex:62-88`) incluye a los 4 integrantes, de modo que **el pendiente del 12/09 quedó cerrado** con `964fa6e`.
- **Estructura (Tabla 3):** todas las secciones están presentes. Trazabilidad E1–E4 explícita (tabla en `conclusiones_e4.tex:20-45` y tabla temas → artefacto en `fundamento_teorico_e4.tex:78`). PI1–PI3 formuladas y respondidas (`evaluacion_iso25010.tex:9-40`). Pero:
  - `observabilidad.tex` (66 líneas, unas 1,3 páginas) no incluye **ninguna figura**: ni dashboard ni traza.
  - `arquitectura_sistema_e4.tex:18,36` solo tiene C4 de nivel 1 y 2: **falta el nivel 3**.
  - La tabla ISO (`evaluacion_iso25010.tex:47-63`) da rangos **sin DE ni IC95 %**.
  - `resumen_e4.tex` muestra «Abstract / Resumen» duplicado (título manual y el entorno `abstract` de babel), con unas 247 y 217 palabras.
- **Cifras que no coinciden con la evidencia:**
  - `pruebas_cicd.tex:18`: «90/90 backend (5 servicios Java), 78/78 web, 5/5 móvil». Hay **121 `@Test`** Java (86+15+11+8+1) y **75** pruebas web ejecutadas.
  - «5/5 móvil» contradice la amenaza externa 2 de `evaluacion_iso25010.tex` (las instrumentadas no se ejecutaron).
  - `discusion_amenazas.tex:9`: «174 pruebas automatizadas» no cuadra con ninguna suma.
  - «19 % y 34 %» de error Locust son agregados de las 5 corridas, no la media de las corridas 2–4 que declara el método.
  - Mantenibilidad 542/668 no figura en ningún archivo (§17).
  - «IC95 binomial [0,0]» incorrecto (§15).
  - CORREL (U = 400, p = 2,578e-9, A12 = 1,0, exhaustividad c0 0,04) sí coincide con `correlacion_analisis.json`.
- **Bibliografía:** `\bibliographystyle{ieeetr}` con 39 entradas, todas citadas; 18 con DOI (formato correcto, sin duplicados), 11 con ISBN y **10 sin DOI ni ISBN**.
  - Sin DOI ni ISBN: `ongaro2014raft`, `zaharia2012rdd`, `fielding2000rest`, `sigelman2010dapper`, `brown2018c4model`, además de documentos normativos o web.
  - **`ieeetr` no imprime los campos `doi`/`isbn`**: `pdftotext main.pdf - | grep -ci "doi\|isbn"` → 0. Desde el PDF los DOI no se ven ni se pueden resolver.
  - `kim2021devops` tiene un ISBN inexistente (978-1-9425-8940-2); el de la 2.ª edición es 978-1-950508-40-2.
  - `brewer2012cap` sale con comillas rotas («How the rules"have changed»).
  - No se detectaron referencias inventadas.
- **Documento vivo frente a congelado:** en el corte **no existe** versión congelada (ni carpeta `entrega4/`, ni etiqueta de entrega, ni PDF sellado). La separación llegó en `a5c8092` (15/09), después del corte.
- **Aporte e IA:**
  - La tabla de aporte no declara que los 16 commits del 26/07 se generaron con `auto_commits_timed.py`, lo que infla filas (p. ej. «Arquitectura: Álvarez 46 %»).
  - `ai-usage-declaration.md:84` sigue diciendo que la batería CORREL «queda pendiente», cuando la campaña ya estaba en `8869188`.

**Cómo debe quedar**
- PDF compilado en 4 pases sin avisos de *rerun*, y sin *overfull* de más de 10 pt en tablas.
- Todas las cifras (conteos de pruebas, cobertura, Locust, CORREL, ISO) generadas o comprobadas desde los resultados canónicos de §16, con DE e IC95 %.
- Figuras de observabilidad (dashboard y traza) y C4 de nivel 3 de componentes (ticket-service con web y móvil).
- Estilo IEEE que imprima DOI/ISBN (`IEEEtran.bst`, o `biblatex-ieee` con `doi=true`), 12 o más referencias con DOI/ISBN verificado y ISBN corregidos.
- Versión congelada: PDF adjunto a la etiqueta `v4.0.0` y copia en `docs/entregas/E4/` con su SHA256, separada del `main.pdf` vivo.
- Tabla de aporte con método reproducible (`.mailmap` y exclusiones) y declaración de los commits por guion.
- Declaración de IA actualizada.
- URL canónica en la portada.

**Qué deben hacer**
1. Cambiar a `\bibliographystyle{IEEEtran}` (copiar `IEEEtran.bst`), corregir `kim2021devops`, `ammann2016testing` y `brewer2012cap`, y añadir DOI o ISBN donde exista (Raft: USENIX ATC 2014, ISBN 978-1-931971-10-2; Dapper, informe técnico con URL estable).
2. Generar `docs/latex/secciones/generado/tabla_pruebas.tex` con un guion que cuente las pruebas desde los informes de CI (surefire, vitest JSON, gradle) y sustituir las cifras 90/78/5/174.
3. Generar la tabla ISO desde `iso25010.csv` (§17).
4. Añadir `figuras/grafana_dashboard_carga.png`, `figuras/tempo_traza.png` y `c4-nivel3-componentes.png`.
5. Corregir «Abstract/Resumen», el IC binomial y los descartes de Locust.
6. Actualizar `ai-usage-declaration.md` y la tabla de aporte (con nota sobre commits por guion y reatribuidos).
7. Añadir la URL en la portada.
8. Compilar con `latexmk -pdf`, copiar a `docs/entregas/E4/PFC_ACC_E4.pdf` con su `SHA256SUMS.txt` y adjuntarlo al Release `v4.0.0`.

**Cómo lo verifico**
- `git archive v4.0.0 | tar -x -C /tmp/ms && cd /tmp/ms/docs/latex && latexmk -pdf -interaction=nonstopmode main.tex && grep -c "Rerun\|undefined" main.log` → 0.
- `pdftotext main.pdf - | grep -c "doi"` → ≥ 12.
- `pdftotext main.pdf - | grep -n "90/90\|78/78\|174 pruebas\|542/668"` → vacío.
- `pdftotext main.pdf - | diff -q - <(pdftotext docs/entregas/E4/PFC_ACC_E4.pdf -)`.
- `grep -n "gleiston-guerrero" docs/latex/main.tex`.

**Estimación**
- P2: redacción técnica de nivel estudiantil y coherencia de cifras.
- C2: LaTeX, bst y tablas generadas.
- A4: unas 10 secciones, bib, figuras y guiones.
- T3: 6–15 h, dependiendo de que §15–§17 estén terminados.

---

### §19 Amenazas a la validez y reflexión ética

**Qué encontré**
- **E3** (`protocolo_resultados.tex:64-89`): 3 internas y 2 externas, pero **solo la interna 1 tiene mitigación aplicada**; las demás no tienen mitigación o son recomendaciones.
- **ISO** (final de `evaluacion_iso25010.tex`): 3 internas y 2 externas, **ninguna con mitigación**.
- **Proyecto** (`discusion_amenazas.tex:36-66`): 3 internas marcadas como «mitigado…», con dos problemas.
  - I1 («un solo desarrollador por capa») contradice la tabla de aporte (backend 41/27/25/7 %).
  - I3 se apoya en `resultados/rebalance_demo_tickets.sql`, que **no existe en ningún commit** (`git log --all -- '*rebalance*'` vacío).
  - Las 2 externas (otros ISP, producción) **no tienen mitigación**.
- **No se discute ninguna amenaza** sobre la validez de la campaña real: réplicas deterministas, pseudorreplicación, carga distinta a la exigida, protocolo redactado después de medir.
- **Reflexión ética** (`discusion_amenazas.tex:68-89`): unas 221 palabras (≈0,4 páginas, **menos de ½**).
  - Cita `acm2018ethics`, pero solo con principios genéricos sin numerar («evitar daño», «respetar la privacidad»).
  - Dice que el sistema «procesa datos personales reales», lo que contradice el uso declarado de datos sintéticos.
  - No trata la integridad de la autoría (commits por guion), que es un asunto ético directamente aplicable (ACM 1.3 «ser honesto y confiable»; 2.1 calidad del trabajo).

**Cómo debe quedar**
- Una única sección de amenazas con ≥ 3 internas y ≥ 2 externas (más constructo y conclusión si procede), cada una con **mitigación concreta aplicada** o limitación declarada con su efecto, y referencia a evidencia existente.
- Deben cubrir las amenazas reales de las campañas de E4.
- Reflexión ética ≥ ½ página (≈350–450 palabras) con principios ACM numerados (1.2, 1.3, 1.6, 2.5…) aplicados a decisiones concretas del sistema: datos de abonados y geolocalización y foto del técnico en campo, retención, consentimiento, autoría honesta. Sin contradicciones con el resto del documento.

**Qué deben hacer**
1. Reescribir `discusion_amenazas.tex` consolidando las tres listas. Añadir mitigaciones (p. ej. aleatorización y semillas, n ≥ 8 por corrida, protocolo previo con hash de commit, carga conforme a la guía, repetición en otra máquina).
2. Retirar las referencias inexistentes y la contradicción de I1.
3. Ampliar la reflexión ética con los principios ACM numerados, aplicados a la privacidad de la ubicación y las fotos del técnico (§8), al principio de mínimo privilegio en JWT/RBAC y a la transparencia sobre el uso de IA y la autoría. Corregir «datos reales».

**Cómo lo verifico**
- Lectura de `docs/latex/secciones/discusion_amenazas.tex`: cada amenaza con la etiqueta «Mitigación:» y un artefacto verificable.
- `grep -rn "rebalance_demo_tickets" docs` → vacío.
- `pdftotext -f <p> -l <p> main.pdf - | wc -w` de la reflexión ética → ≥ 350.
- `grep -nE "[12]\.[0-9]" docs/latex/secciones/discusion_amenazas.tex` → principios ACM numerados.

**Estimación**
- P3: juicio metodológico sobre validez.
- C1: texto.
- A2: 2–3 secciones.
- T2: 2–6 h.

---

### §20 Evidencia de trabajo en equipo y autoría

**Qué encontré**
- **Commits generados por guion con identidades de otros integrantes.**
  - `10703f1` (27/07, «Robinson Cando») añade `auto_commits_timed.py`. Ese guion cambia `git config user.name/user.email` por Carlos, Cristhian, Robinson y **Jeremy** y hace 16 commits con pausas de 15–20 min en `feature/entrega-3`.
  - Esos commits coinciden con la serie del 26/07 16:13–20:47, entre ellos `b0e120c`, `86a547c`, `a3447a3` y `1b81699`, todos atribuidos a Jeremy.
  - El guion se borró en `cc0a785` (05/08).
  - El 21/08, `0357e95` (Carlos) añade `ejecutar_commits.py` a `.gitignore` («Automatización local»).
  - A partir de ahí, las identidades `Cristhian D. Pacheco Cárdenas`, `Robinson R. Cando Moreno` y `Jeremy Alexis Álvarez Párraga` solo aparecen intercaladas en los mismos días en que commitea Carlos Carpio (24/08, 28–29/08, 04/09, 07–08/09, 10/09), en rachas alternadas cada 10–40 min.
  - La identidad «orgánica» de cada integrante es otra: `CristhianP03`, `Robinson Cando M` y `DeJere`, con commits hechos desde la web de GitHub (committer `GitHub <noreply@github.com>`).
- **Reatribución demostrable.** Los 7 commits de Carlos del 09/09 21:39–21:40 (etiqueta `backup-antes-de-revertir-commits-carlos`) se eliminaron de `main` y se reaplicaron el 10/09 bajo otros autores:
  - `df72093` (Carlos) → **`286f9b3` («Jeremy Alexis Álvarez Párraga»)**, con **patch-id idéntico** `45268f6e`: `generar_reporte_correl.py`, +225/−42.
  - `0f22773` (Carlos) → `1f6f016` («Cristhian D. Pacheco Cárdenas»), patch-id idéntico `b5456f64`.

  Comando: `git show <c> | git patch-id --stable`.
- **PR sin revisión cruzada** (véase §3). Solo el PR #1 tiene aprobaciones.
- **Actas** (`docs/actas_reunion.md`, 244 líneas, 14 reuniones):
  - Son **«reconstruidas»** (commit `95ef22c`, 04/09) a partir de un chat.
  - Por política declarada (líneas 12-17), la asistencia se registra como completa salvo indicación en contrario. Resultado: 14/14 para todos, **no verificable**.
  - La última reunión es del 01/09. No hay actas del periodo 08/09–13/09, que incluye force-push y redistribución de commits.
  - La reunión del 26/07 (día de los commits por guion) no lo menciona. La 10 solo alude a una carpeta `PE-U4` «con generación automática de commits».
- **Declaración de IA:** `ai-usage-declaration.md` existe (Claude Code). Hecho parcial.
- **Aporte real de Jeremy Álvarez Párraga hasta el corte:** 24 commits (12,1 % de 198).
  - **6 con su identidad orgánica `DeJere`** (commits web):
    - `8a3b6fd`, `8cb347c` y `7521211` (29/08): +124 líneas en `docs/ci_cd/informe_ci_cd.tex`, documentando correcciones de Pact y Playwright que hizo Carlos.
    - `6e4be70` (13/09): recompila el PDF.
    - `17c2ba9` (13/09): +35 líneas en `.gitattributes`.
    - `8d735d8` (13/09): diff vacío.
  - Hubo un séptimo commit orgánico, `f32a70c` (13/09 15:43, normalización LF), **eliminado de `main` por reescritura** (etiqueta `backup-antes-de-quitar-f32a70c`).
  - **Commits con identidades «de lote» o de guion:**
    - `1d7d5e6` (24/08): pruebas Pact; 108 líneas Java + 106 TS + 336 JSON + 1533 de `package-lock`.
    - `28a7606` (24/08): ADR-005, 145 líneas.
    - `8c64c70`, `1f4689a` y `3afb07b`.
    - `286f9b3` (commit de Carlos reatribuido).
    - `719c7d2`, en el mismo minuto 21:04 que dos commits de Carlos.
    - `b0e120c`: notification-service con **node_modules**, +226 767 líneas.
    - `86a547c` (ai-service).
    - `a3447a3` (README, LICENSE, CI).
    - `64937f1` (08/08): añade la carpeta `PE-U4`, ajena al PFC (242 líneas, borrada en `e40a40d`).
  - Excluyendo `node_modules`, `package-lock` y el commit reatribuido, el volumen atribuido a Jeremy es de unas 4 026 líneas añadidas (incluye el pacto JSON de 336 líneas y los 796 del mazo de la E3), y **no puede demostrarse que lo haya escrito él**.
  - La evaluación del 12/09 le asignó un 18,2 % de participación.

**Cómo debe quedar**
- Cada integrante commitea con su propia cuenta, una identidad por persona (`.mailmap` en la raíz para unificar las históricas).
- Todo cambio entra por PR revisado por **otro** integrante; Jeremy como autor de PR y como revisor.
- Actas levantadas en el momento (fecha, asistentes confirmados, decisiones, tareas con responsable) para el periodo de corrección.
- Sección de aporte del manuscrito calculada con un método declarado y reproducible desde `git log` con `.mailmap`, **que declare la existencia de commits por guion y reatribuidos**.

**Qué deben hacer**
1. Añadir `.mailmap` (p. ej. `Jeremy Alexis Álvarez Párraga <jalvarezp3@uteq.edu.ec> DeJere <144397723+DeJere@users.noreply.github.com>`) y el resto de alias.
2. Jeremy realiza y defiende desde su cuenta **DeJere** un bloque sustantivo de las correcciones (sugerido: §8, cierre con evidencia; §9, pruebas de ViewModel y E2E móvil; §12, cobertura y compuertas), cada una en su PR revisado por otro integrante.
3. Añadir en `docs/actas_reunion.md` una nota de transparencia sobre `auto_commits_timed.py`, `ejecutar_commits.py` y la reatribución del 10/09, más actas nuevas de la fase de corrección.
4. Corregir la tabla de aporte del manuscrito según el método real.

**Cómo lo verifico**
- `git shortlog -sne --since=2026-09-16 main` con `.mailmap` → commits de Jeremy con su cuenta.
- `GET /repos/.../pulls?state=closed` → PR de DeJere con review `APPROVED` de otro usuario, y PR de otros con review de DeJere.
- `git log --author=jalvarezp3 --author=DeJere --since=2026-09-16 --numstat -- apps/mobile services` → líneas sustantivas en código y pruebas.
- `grep -n "auto_commits_timed\|reatribu" docs/actas_reunion.md docs/latex/secciones/*.tex`.

**Estimación**
- P2: gestión de equipo y transparencia.
- C1: `.mailmap`, actas y PR.
- A2: repositorio, actas y manuscrito.
- T2: 2–6 h, sin contar el trabajo técnico imputado a otros ítems.

---

## 4. Lo que está Hecho

Hechos verificados que no se recalifican:
- **CI/CD:**
  - Pipeline con los 7 jobs en DAG, más `compile-latex` y `verify-checksums`.
  - `build-images` depende de `lint`, `test-backend`, `test-web`, `test-mobile` e `integration`, y publica 7 imágenes en GHCR etiquetadas con `${{ github.sha }}`.
  - `integration` levanta el stack completo con sonda de salud (40 × 15 s) y verifica el proveedor Pact y Playwright contra servicios reales.
  - El run 34785316252 sobre `964fa6e` terminó con 15 jobs en verde.
- **Web:**
  - Recompilada desde cero: `tsc -b` y `eslint --max-warnings 0` sin errores.
  - Vitest con 23 archivos y 75 pruebas en verde; cobertura de líneas 87,6 % (1583/1807) y de ramas 89,09 % (237/266) sobre `src/**`.
  - TypeScript estricto, las 5 rutas con `ProtectedRoute`, i18n es/en, tema claro/oscuro, JWT en `sessionStorage` con expiración, consumo vía gateway y Dockerfile multi-stage.
- **Móvil:**
  - JWT en `EncryptedSharedPreferences` AES256, caché Room sin conexión y pull-to-refresh.
  - Captura real de cámara (`TakePicture`) y GPS (`FusedLocationProviderClient`).
  - APK `release/apk/soporte-isp.apk` firmado (jarsigner verificado, certificado hasta 2054) y SHA256 `ff762b9b…` coincidente.
  - Firma automatizada en CI desde un secreto.
- **Backend:**
  - Puertos y adaptadores de Repository, EventPublisher y TelemetryQuery sin JPA en el dominio.
  - Command, Chain of Responsibility, Observer, Factory Method y Strategy (SLA y correlación) con código y pruebas reales: 86 `@Test` en svc-principal.
- **Observabilidad:** las 4 métricas nuevas y las 3 `crdb_*` instrumentadas, logs JSON con `trace_id` en 4 servicios Java, trazas OTel → Collector → Tempo y dashboard versionado con 6 paneles.
- **Persistencia:** clúster CockroachDB de 3 nodos con healthchecks y `num_replicas = 3`.
- **Cobertura de svc-principal:** CSV de JaCoCo 555/684 líneas (81,1 %), 2582/3582 instrucciones (72,1 %), 88/154 ramas (57,1 %), recalculado.
- **Manifiestos:** los tres verifican (3/3, 41/41 y 1/1) en CI y en local.
- **Reproducibilidad de CORREL:** `generar_reporte_correl.py` reproduce `correlacion_analisis.json` y la tabla del manuscrito idénticos salvo finales de línea.
- **Finales de línea:** `.gitattributes` cubre código y datos; 0 archivos `i/crlf` en el índice.
- **Otros artefactos:** LICENSE MIT, CITATION.cff válido (con URL antigua) y declaración de uso de IA.
- **Manuscrito:** compila desde copia limpia sin errores ni referencias indefinidas, con 55 páginas (≈47,5 de contenido), 39 referencias citadas (18 con DOI y 11 con ISBN), tabla de trazabilidad E1–E4 y PI1–PI3 respondidas. El PDF versionado corresponde a la fuente del corte y su tabla de aporte incluye a los cuatro integrantes.

## 5. Orden de ejecución recomendado

1. **§3a (protección de `main`) y §20 (`.mailmap`, flujo por PR).** Deben activarse antes de cualquier corrección, para que todo el trabajo posterior quede revisado y atribuible.
2. **§4 (dominio sin Spring).** Es la base de los nuevos casos de uso.
3. **§8 (cierre con evidencia y tickets asignados) y §5 (Strategy de rutas, Observer de SLA)** comparten backend y móvil. §11 (migraciones Flyway) debe ir antes o a la vez, porque §8 necesita la tabla `ticket_evidence`.
4. **§6 (vista SLA por zona y técnico).** Depende del Observer de SLA y del modelo de lectura.
5. **§10 (Pact web y móvil, OpenAPI).** Requiere los endpoints finales de §5, §6 y §8.
6. **§9 (pruebas de ViewModel, E2E móvil, Release inmutable) y §7 (umbral y artefactos web).**
7. **§12 y §13 (cobertura con compuerta en los 4 servicios, Testcontainers, artefactos, versiones fijas).**
8. **§15 (protocolo previo, luego campaña CORREL r = 10 con semillas y Locust según la guía).** Hay que congelar el código antes de medir.
9. **§14 (evidencia de observabilidad bajo carga).** Se captura durante la campaña de §15.
10. **§16 (paquete de datos canónico, manifiestos completos, diccionario, job de reproducción)** y luego **§17 (ISO 25010 con n ≥ 8 y 1 h de Fiabilidad).**
11. **§18 y §19 (manuscrito y amenazas).** Regenerar tablas y cifras desde los resultados canónicos y recompilar el PDF.
12. **§1 y §2 (URL, README, limpieza).** Luego **§3b (CHANGELOG y etiqueta anotada `v4.0.0` sobre el último commit) y Release inmutable.**

## 6. Lista de verificación final (docente)

1. `git cat-file -t v4.0.0 && git for-each-ref refs/tags/v4.0.0 --format='%(taggerdate:iso) %(objectname:short)' && git merge-base --is-ancestor v4.0.0 origin/main && echo OK`
2. `grep -rln "import org.springframework" services/*/src/main/java/ec/edu/uteq/soporte/*/domain; grep -rn "Multipart\|latitude" apps/mobile/app/src/main/java/ec/edu/uteq/soporte/mobile/data/remote/TicketApi.kt` → primera orden vacía, segunda con coincidencias.
3. `for s in auth-service svc-principal report-service telemetry-service; do (cd services/$s && mvn -B -q test) || echo FALLA $s; done; (cd apps/web && npm ci && npx vitest run --coverage)` → `jacoco:check` superado y ≥70 %.
4. `ls pacts/ && python -c "import json,os;[print(f,len(json.load(open('pacts/'+f))['interactions'])) for f in os.listdir('pacts')]"` → web y móvil.
5. `for d in $(git ls-files | grep SHA256SUMS.txt | xargs -n1 dirname); do (cd $d && sha256sum -c --quiet SHA256SUMS.txt) || echo FALLA $d; done; python experimentos/generar_reporte_correl.py && git status --porcelain`
6. `python - <<'EOF'`, que recorra `resultados/locust/*_stats_history.csv` y compruebe el máximo de `User Count` (50 o 200), la duración (≥300 o ≥600 s) y el número de corridas (≥10 por escenario), y `experimentos/resultados/correlacion_corridas.csv` con 10 réplicas por celda y DE > 0.
7. `git log --format='%h %ad' --date=iso -- docs/experimentos/protocolo-e4.md | tail -1; git log --format='%h %ad' --date=iso -- experimentos/resultados/correlacion_corridas.csv | tail -1` → el protocolo es anterior a los datos.
8. `cd docs/latex && latexmk -pdf -interaction=nonstopmode main.tex && pdftotext main.pdf - | diff -q - <(pdftotext <PDF del Release v4.0.0> -)`, sin referencias indefinidas y con el PDF publicado igual a la fuente.

## 7. Notas para el docente (no van a la guía)

- **Autoría fabricada o redistribuida (grave).**
  - `auto_commits_timed.py` (`10703f1`) demuestra la creación de commits con las identidades de los cuatro integrantes desde una misma máquina, con pausas simuladas de 15–20 min.
  - `.gitignore` oculta un `ejecutar_commits.py` desde `0357e95` (Carlos, 21/08).
  - La reescritura del 09–10/09 cambió el autor de commits de Carlos a Jeremy (`df72093` → `286f9b3`) y a Cristhian (`0f22773` → `1f6f016`) con patch-id idéntico.
  - Las identidades «de nombre completo» de Cristhian, Robinson y Jeremy cambian de formato el mismo día (21/08 → 24/08) y solo aparecen intercaladas con commits de Carlos. Es un patrón compatible con un único operador.
  - **Conclusión:** los conteos de commits y líneas por integrante **no son prueba de aporte individual** en este repositorio, incluida la participación del 18,2 % que se asignó a Jeremy el 12/09.
- **Aporte verificable de Jeremy Álvarez Párraga hasta el corte:** muy bajo. Con su identidad orgánica (`DeJere`, web):
  - 3 ediciones de documentación (+124 líneas, 29/08).
  - `.gitattributes` (+35).
  - Una recompilación de PDF.
  - Un commit vacío.
  - Otro (`f32a70c`) que un compañero eliminó de `main` por force-push.

  Todo lo demás a su nombre (Pact, ADR-005, ai-service, notification-service con `node_modules`, `PE-U4`) procede de lotes o guiones. **Después del corte** (14–16/09) figura como autor de 10 PR autofusionados sin revisión (#14–#23) que atacan justo los pendientes (dominio sin Spring, C4 nivel 3, OpenAPI, pom y umbral, conteos, documento congelado, Flyway, cierre con cámara y GPS). Ese trabajo debe calificarse en el suspenso y **defenderse oralmente**, porque su perfil previo no lo respalda.
- **Pistas posteriores al corte, contrastadas con la copia congelada:**
  - Confirmadas en el corte: dominio con anotaciones Spring (§4), C4 nivel 3 que no es de componentes (solo `c4-nivel3-particionado.md`, que describe `TicketService` anterior al refactor), OpenAPI sin esquemas de respuesta 2xx (§10), sin umbral de cobertura ni ejecución de JaCoCo en CI (§12), sin migraciones Flyway (§11), móvil que no envía foto ni GPS (§8), Release estable sin manuscrito en el corte, separación entre documento vivo y congelado (véase §18).
  - **No confirmado:** «pom.xml no parseable». En el corte los 5 `pom.xml` se parsean (`xml.etree`). El XML inválido lo introdujo el propio Jeremy en `acc7e89` (14/09), después del corte.
- **Pendientes del 12/09 cerrados antes del corte:**
  - `.gitattributes` cubre ya el código (`70f4f39`, `3c6af0b`, `17c2ba9`; 0 archivos CRLF en el índice).
  - El README menciona el inyector (`2b96b36`).
  - Existe el job `verify-checksums` (`bc6e1c5`).
  - La diferencia 551/679 frente a 555/684 está explicada (`0f46bd5`).
  - Hay Release estable (`f60c452`).
  - La cabecera se valida antes del bucle de red en `inyector_averias.py` y parcialmente en `correr_campana.py` (antes de la red, pero después de `TRUNCATE` y del cambio de modo).
- **También cerrado antes del corte:** el PDF del manuscrito ya no va un commit por detrás. `964fa6e` recompila tras `51e334b`, y la tabla de aporte del PDF incluye a los 4 integrantes.
- **Elementos marcados «Hecho» el 12/09 que, revisados con rigor, no lo son:**
  - «Protocolo experimental y campaña ejecutada según diseño»: r = 5 réplicas idénticas, protocolo commiteado junto con los datos, Locust a 30 usuarios × 60 s.
  - «Correspondencia exacta análisis–tablas»: los «19 %/34 %» del manuscrito ignoran los descartes declarados, el IC [0,0] es degenerado y 542/668 no está en ningún archivo.
  - «Vistas C4 (tres niveles)»: el nivel 3 no es de componentes y no está en el manuscrito.
  - «Contrato OpenAPI»: rutas ambiguas y 2xx sin esquema.
  - «Refactorización en capas y SOLID»: Spring en el dominio.
  - «Capacidades de dispositivo»: se capturan, pero no se envían.
  - «Separación documento vivo/congelado»: inexistente en el corte.
  - «Amenazas con mitigación»: las externas y las de ISO no la tienen.
  - «Bibliografía con identificador persistente»: `ieeetr` no imprime DOI.

  Conviene considerarlo al calificar el suspenso, aunque no «se recalifiquen».
- **Posible manipulación del Release:** los assets de `mobile-release` se reemplazaron el 16/09 a las 05:46Z (posterior al corte) y la etiqueta es ligera y apunta a un commit fuera de `main`. No sirve como prueba del estado en el corte.
- **No verificable en este entorno:** ejecución del stack (sin Docker), pruebas instrumentadas Android (sin SDK), existencia de las imágenes GHCR (la API de paquetes requiere autenticación; se infiere de los jobs `build-images` en verde) y logs de CI (requieren autenticación; solo se consultaron el estado de jobs y los artefactos). No ejecuté `mvn test`, para limitar el tiempo: las cifras del backend proceden de artefactos versionados y del recuento de `@Test`.
- **Duplicado entre E3 y E4:** `docs/latex/informe_entrega3_completo.tex` convive con el manuscrito acumulativo.
