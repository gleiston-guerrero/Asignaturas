# Auditoría técnica — Equipo FUVV · SCLI (Sistema de Control de Laboratorios Informáticos)

Fecha de auditoría: 16/09/2026. Corte: domingo 13/09/2026 19:00 (UTC−5).

## 1. Cabecera

| Campo | Valor |
|---|---|
| Repositorio | https://github.com/gleiston-guerrero/Entrega-final-del-PFC (antes `ffarinangog2/Entrega-final-del-PFC`) |
| Propietario actual | `gleiston-guerrero` (transferido). `docs/evidencias/revision-cruzada-e4.md` todavía consulta `ffarinangog2/...` a las 22:49Z del 13/09, y el merge 7800b76 (02:28Z del 14/09) ya aparece como `gleiston-guerrero/feature/entrega-4`. La transferencia ocurrió entre las 17:49 y las 21:28 (−05) del 13/09. |
| Rama evaluada | `feature/entrega-4` |
| Commit de corte | `d0ef60b`, 13/09/2026 17:55:49 −05:00, "Evidencias del cuestionario" |
| Commits alcanzables desde el corte | **366** (`git rev-list --count d0ef60b`). La rama tiene hoy 368: 1cede75 (19:05) y b01732b (20:13) son posteriores al corte y no cuentan. |
| `main` al corte | Un único commit, 859bc58 "Entrega anterior" (15/08). El PR #1 se fusionó el 13/09 a las 21:28 (7800b76), **después del corte**. |
| Etiquetas al corte | **Ninguna**: `git tag` = 0 y `git ls-remote --tags origin` vacío. No hay Releases en GitHub. |

Integrantes (identidades unificadas con `.mailmap`; commits hasta d0ef60b, sin merges):

| Integrante | Usuario git / GitHub | Commits | Líneas (+/−) |
|---|---|---:|---|
| Farinango Guandinango Freddy Vladimir | `ffarinangog2` / ffarinangog2 | 89 | +359.675 / −12.166 (297.070 son datos en `experimentos/resultados`) |
| Urbina Romero Isaías Abraham (**suspenso**) | `IsaiasUrb` / IsaiasUrb | 73 | +25.603 / −5.096 |
| Villamarín Cuenca Iván Andrés (**suspenso**) | `iavillamarin98-pred` (2 correos) / pushes como `ivillamarinc` | 91 | +52.684 / −3.295 (26.002 son JSON OpenAPI generados) |
| Vinueza Sánchez Harold Nicolás | `Harold-Vinueza` / Harold-Vinueza | 113 | +36.971 / −13.804 |

## 2. Tabla de los 20 entregables

| # | Entregable | Estado propio | Estado efectivo | % |
|---|---|---|---|---:|
| 1 | Identificación y URL | Por modificar | Por modificar | 75 |
| 2 | Estructura y archivos de raíz | Por modificar | Por modificar | 70 |
| 3 | Línea base congelada e integración | Por culminar | Por culminar | 25 |
| 4 | Backend en capas y SOLID | Por modificar | Por modificar | 65 |
| 5 | Patrones GoF y ADR | Por modificar | Por modificar | 70 |
| 6 | Aplicación web funcional | Por modificar | Por modificar | 75 |
| 7 | Calidad web | Por modificar | Por modificar | 80 |
| 8 | Aplicación móvil funcional | Por modificar | Por modificar | 70 |
| 9 | Calidad móvil | Por modificar | Por modificar | 60 |
| 10 | Integración y contratos | Por modificar | Por modificar | 60 |
| 11 | Persistencia distribuida | Por modificar | Por modificar | 75 |
| 12 | Pirámide de pruebas | Por modificar | Por modificar | 70 |
| 13 | Pipeline CI/CD | Por modificar | Por modificar | 70 |
| 14 | Observabilidad | Por modificar | Por modificar | 60 |
| 15 | Protocolo y campaña experimental | Por modificar | Por modificar | 60 |
| 16 | Paquete de datos y reproducibilidad | Por modificar | Por modificar | 60 |
| 17 | Evaluación ISO/IEC 25010 | Por modificar | Por modificar | 55 |
| 18 | Manuscrito, bibliografía y trazabilidad | Por modificar | Por modificar | 55 |
| 19 | Amenazas a la validez y ética | Por modificar | Por modificar | 80 |
| 20 | Trabajo en equipo y autoría | Por modificar | Por modificar | 55 |

Regla de dependencia aplicada:
- §17 queda limitado por §15 y §16, y §18 por §17 (propio 65 → efectivo 55).
- §12 y §10 quedan limitados por §13: CI estaba en rojo en el SHA de corte.

## 3. Entregables no Hechos

### §1 Identificación y URL

**Qué encontré**
- La URL antigua `github.com/ffarinangog2/Entrega-final-del-PFC` aparece en 8 archivos (`git grep -c 'ffarinangog2/Entrega' d0ef60b`), entre ellos:
  - `CITATION.cff:7`
  - `README.md:87`
  - `docs/main.tex:83` (`\RepoURL`)
  - `docs/entrega-4/main.tex:19`
  - `docs/actas/README.md:4`
- El nombre del sistema no es uniforme:
  - "Sistema de Control de Laboratorios **e Infraestructura**" en `CITATION.cff` y `README.md`;
  - "Sistema de Control de Laboratorios **e Informática**" en el resumen de `main.tex`;
  - "Laboratorios **Informáticos**" en la guía.
- El equipo aparece como "Equipo PFC **ForáCode**" en la portada de `main.tex` y como FUVV en el resto.
- `CITATION.cff` solo lleva un nombre y un apellido por autor, sin roles. Los roles están en `docs/actas/README.md` y en `main.tex` §"Organización".

**Cómo debe quedar**
- La URL `https://github.com/gleiston-guerrero/Entrega-final-del-PFC` debe estar en README, CITATION.cff, `docs/main.tex` y los documentos vivos.
- Un único nombre de sistema y de equipo (FUVV).
- Nombres completos de los cuatro integrantes, con sus roles.

**Qué deben hacer**
- `git grep -l 'ffarinangog2/Entrega'` y reemplazar la URL. Los enlaces históricos a commits pueden conservarse, pero con el dominio actual.
- Unificar el título en CITATION, README y portada.
- Completar `authors` con los nombres completos.

**Cómo lo verifico**
- `git grep -n 'ffarinangog2/Entrega' HEAD -- README.md CITATION.cff docs/main.tex` debe salir vacío.
- `grep -n 'ForáCode\|Infraestructura\|e Informática' README.md CITATION.cff docs/main.tex` debe salir vacío.

**Estimación**
- P1: tarea mecánica.
- C1: sin dificultad técnica.
- A2: unos 8 archivos.
- T1: menos de 2 h.

### §2 Estructura del repositorio y archivos de raíz

**Qué encontré**
- **No existe `LICENSE`** (`git ls-files | grep -i licen` vacío), aunque el Listado 3 lo exige.
- `.env.example` no incluye variables de web ni de móvil (no hay `VITE_API_BASE_URL` ni `SCLI_API_BASE_URL`), aunque la guía pide "incluye variables de web y móvil".
- **Archivos ajenos al proyecto:**
  - d0ef60b añade `docs/Cuestionario de Evaluaciones/Cuestionario de Evaluacion Calificacion-Farinango 9.33 Final.pdf` (1,19 MB): la calificación personal de un integrante en el cuestionario.
  - `docs/evidencias/Evidencias de commit mas relevantes-trabajo/<nombre>/…png`: 20 capturas de commits con espacios y Unicode en las rutas.
- **Binarios pesados:**
  - `docs/evidencias/video_tolerancia_fallos.mp4` (24,6 MB);
  - `release/apk/scli-mobile-0.1.0-release.apk` (36,7 MB), exigido por la guía;
  - `docs/entrega-4/Informe_E4_SCLI_FUVV.pdf`, de 28 páginas y creado el 05/09, que no corresponde a la fuente actual (ver §18).
- **Falta equivalencia con el Listado 3:** no hay `docs/api/openapi.yaml` (existe `docs/openapi/*.json`), `protocolo-e3.md`, `resultados/boxplot_latencia.png` ni `entrega1/` y `entrega2/`. El README describe la estructura pero no mapea esas ausencias.
- **`.gitattributes` fija `eol=lf` solo para `experimentos/resultados/SHA256SUMS` y `raw/*.txt`.** En un clon Windows (autocrlf) fallan:
  - 373/468 entradas del manifiesto general;
  - 7/7 del smoke E2;
  - 50/50 de `evidencia-e3-canonica`;
  - `release/apk/SHA256SUMS.txt`.

  El detalle está en §16.
- No hay secretos en el historial: las búsquedas de `.env`, `.jks`, `.pem` y `BEGIN PRIVATE KEY` salen vacías; los `security.jwt.secret` en tests son valores ficticios.

**Cómo debe quedar**
- `LICENSE` en la raíz.
- `.env.example` con las variables de web y móvil.
- Nada ajeno al proyecto versionado.
- Tabla de equivalencias con el Listado 3 en el README.
- `.gitattributes` que proteja todos los manifiestos y datos hasheados.

**Qué deben hacer**
- `git rm "docs/Cuestionario de Evaluaciones/…pdf"`.
- Añadir `LICENSE` (p. ej. MIT).
- Añadir `VITE_API_BASE_URL=` y `SCLI_API_BASE_URL=` a `.env.example`.
- Añadir `experimentos/** -text` (o `text eol=lf` según cómo se hashearon), `docs/entrega-3/** -text` y `release/apk/SHA256SUMS.txt text eol=lf`, y luego `git add --renormalize .`.
- Añadir al README una tabla "Listado 3 → ruta real".

**Cómo lo verifico**
- `test -f LICENSE`
- `grep -c 'VITE_API_BASE_URL\|SCLI_API_BASE_URL' .env.example`
- `git ls-files | grep -i cuestionario` (debe salir vacío)
- En un clon nuevo con `core.autocrlf=true` y otro con `false`: `sha256sum -c experimentos/resultados/SHA256SUMS | grep -vc ': OK$'` debe dar 0.

**Estimación**
- P1: decisiones simples.
- C2: la normalización de finales de línea exige cuidado.
- A2: raíz, docs y experimentos.
- T1: menos de 2 h.

### §3 Línea base congelada e integración

**Qué encontré**
- **Al corte, `main` = 859bc58.** El PR #1 (creado el 25/08 por ffarinangog2) se fusionó a las 02:28Z del 14/09 (21:28 −05). La fusión la hizo el mismo autor, fuera de plazo y con dos commits más que la aprobación no cubre (1cede75 y b01732b).
- **Única review** (API `pulls/1/reviews`): IsaiasUrb, APPROVED, 23:04:13Z del 13/09 (18:04 −05), sobre el commit d0ef60b. Tiene una sola frase genérica ("No se encontraron observaciones bloqueantes"), 0 comentarios en líneas y 0 comentarios generales.
- Ese PR abarca 367 commits, 2.417 archivos y +1.909.004 líneas. En el momento de la aprobación, el CI de d0ef60b estaba **en rojo** (run 34788220065, job de integración de Compose; ver §13). No es una revisión cruzada real.
- **Sin etiqueta anotada de cierre** (0 etiquetas) y **sin `CHANGELOG`**.

**Cómo debe quedar**
- `feature/entrega-4` integrada en `main` mediante PR con CI en verde y revisión sustantiva de otro integrante: comentarios en líneas y aprobación sobre el SHA final.
- Etiqueta anotada (p. ej. `v4.0.0`) sobre el último commit de `main`.
- `CHANGELOG.md` con entradas fechadas por versión (E1–E4).

**Qué deben hacer**
- Abrir un PR para lo que se trabaje en el suspenso. Un integrante distinto del autor debe revisarlo por partes (backend, web, móvil, experimentos) con comentarios y aprobar solo con CI en verde.
- Fusionar y luego ejecutar `git tag -a v4.0.0 -m "Cierre E4 SCLI" <sha>` y `git push origin v4.0.0`.
- Redactar `CHANGELOG.md` (Keep a Changelog) con fechas reales.

**Cómo lo verifico**
- `git cat-file -t v4.0.0` debe dar `tag`, y `git for-each-ref refs/tags --format='%(taggerdate:iso) %(objectname:short) %(*objectname:short)'`.
- `git merge-base --is-ancestor <tag> origin/main`.
- `curl -s …/pulls/<n>/reviews` y `…/pulls/<n>/comments`: debe haber un aprobador distinto del autor y comentarios mayores que 0.
- `test -f CHANGELOG.md`.

**Estimación**
- P2: criterio de revisión.
- C2: conflictos y CI verde.
- A3: todo el repositorio.
- T2: 2–6 h, sin contar las correcciones que exija la revisión.

### §4 Backend en capas y SOLID

**Qué encontré** (análisis por grep de imports, código main)
- **Aplicación → infraestructura:** 71 líneas (auth 14, reservas 38, usuarios 17, académico 2).
- **Aplicación → presentación:** 157 líneas (académico 51, reservas 66, usuarios 33, auth 7).
- En total, 56 archivos de `application/` afectados. Ejemplos:
  - `auth_service/application/service/AdminUsuarioService.java:3-6` usa `infrastructure.persistence.UsuarioAuthRepository` directamente y se salta su propio puerto `UsuarioRepository`;
  - `reservas/application/service/NotificacionService.java:11` usa un repositorio JPA.
- **Dominio con framework:** los 10 `*RepositoryPort` de académico importan `org.springframework.data.domain.Page/Pageable` (p. ej. `domain/port/BloqueRepositoryPort.java:4-5`).
- `reservas/domain/port/out/BloqueoAgendaRepositoryPort.java:2` expone la entidad JPA `ec.edu.scli.reservas.entity.BloqueoAgenda`, que tiene `@Entity`.
- **Reservas mantiene paquetes fuera de las capas:** `entity`, `repository`, `client`, `mapper` y `security`.
- **Controladores que usan infraestructura:** `usuarios/presentation/controller/DocentePlanificacionController.java:4-5` (JPA) y `LaboratorioController.java:25`.
- **Nada hace cumplir las capas en CI:** no hay ArchUnit (`grep -r archunit services/` vacío).
- **Positivo:** todos los puertos tienen adaptador (académico 11/11, usuarios 5/5, auth 2/2, reservas 12/12). Dominio → otras capas: 0 imports. El gateway, sin capas, está justificado en ADR-005.

**Cómo debe quedar**
- 0 imports de `application` hacia `infrastructure` o `presentation` en los 4 servicios con dominio.
- Dominio sin tipos Spring ni JPA.
- Paquetes heredados de reservas movidos bajo `infrastructure`.
- Reglas ArchUnit ejecutadas en `mvn verify`.

**Qué deben hacer**
- Mover los DTO request/response a `application/dto` o a comandos y resultados; mapear en el controlador.
- Sustituir los JPA repositories usados en aplicación por puertos del dominio.
- Crear un tipo de paginación propio del dominio en académico (usuarios ya tiene `domain/pagination`).
- Crear un modelo de dominio para `BloqueoAgenda`.
- Añadir `layeredArchitecture()` de ArchUnit por servicio.

**Cómo lo verifico**
- `grep -rn "import .*\.infrastructure\.\|import .*\.presentation\." services/*/src/main/java/**/application | wc -l` debe dar 0.
- `grep -rn "org.springframework\|jakarta.persistence" services/*/src/main/java/**/domain | wc -l` debe dar 0.
- `grep -rl ArchRule services/*/src/test` debe tener 4 o más archivos, y el job test-backend debe estar en verde.

**Estimación por ítem**

**§4a. Imports de aplicación hacia infraestructura y presentación**
- P3: requiere criterio de DIP.
- C3: refactor con riesgo de regresiones.
- A4: 56 archivos en 4 servicios.
- T4: 15–30 h.

**§4b. Dominio de académico y reservas**
- P2
- C2
- A2: 12 archivos.
- T2: 2–6 h.

**§4c. ArchUnit**
- P2
- C2
- A2
- T2

### §5 Patrones GoF y ADR

**Qué encontré**
- **State (reserva y solicitud): genuino.**
  - `reservas/domain/state/reserva/AbstractReservaState` rechaza las transiciones inválidas con `IllegalStateException` (líneas 50-53).
  - Se usa en `ReservaServiceImpl:105-137` y tiene pruebas.
  - Defecto: `application/service/SolicitudExpirationScheduler.java:22` hace `s.setEstado(EstadoSolicitud.EXPIRADA)` y se salta el patrón.
- **Facade: genuino.** `LaboratorioDetalleFacadeImpl` coordina 5 servicios y lo consumen `LaboratorioController:102` y `QrApi.kt:8`.
- **Repository y Factory Method: aceptables.** El Factory es `UserDetailsFactory`.
- **Singleton "cliente Prometheus": no cumple.** `academico/infrastructure/observability/HttpRequestsMetricsRegistry.java` es un `@Component` con **constructor público** que ejecuta `instance = this` (línea 23). Envuelve `MeterRegistry`, no es un cliente de Prometheus, y hay una copia idéntica en usuarios. El cliente real (`PrometheusQueryClient`) es un bean normal.
- **Observer "alertas": no cumple.** Solo existe `PerfilEventListener` con un suscriptor de log (`LoggingPerfilEventListener`), y `grep -ri 'alert' services/*/src/main` devuelve 0.
- **Strategy "políticas de reserva": débil.**
  - `DisponibilidadStrategy` tiene una única implementación, fijada en `StrategyConfig.java:11-12`, y ADR-005 lo admite.
  - La Strategy real, `ArbitrajeStrategy` S0–S4, está desactivada en operación (`EXPERIMENTAL_ARBITER_ENABLED=false`) y no figura en el ADR.
- **ADR-005:** tiene formato Nygard, pero subestima la deuda: omite los 17 imports de usuarios hacia infraestructura y el puerto que expone una entidad JPA.
- **ADR-006:**
  - su Estado es "Implementado", que no es un valor Nygard;
  - tiene 2 criterios cuantitativos (adopción de Kotlin según developer.android.com; −45 % de líneas con Compose según un blog de Medium);
  - las fuentes no llevan fecha de acceso y no hay ninguna cifra comparada con Flutter o React Native.

**Cómo debe quedar**
- Los cinco patrones de la Tabla 1 implementados según su definición y usados en flujos reales:
  - Singleton del cliente Prometheus con constructor privado, o con justificación explícita de singleton gestionado por el contenedor;
  - Observer de alertas o incidentes con 2 o más suscriptores reales;
  - Strategy con 2 o más políticas de reserva seleccionables en ejecución.
- ADR-005 y ADR-006 exactos y en formato Nygard.

**Qué deben hacer**

**§5a. Singleton**
- Convertir `PrometheusQueryClient` en un singleton real, o documentarlo como singleton del contenedor.
- Eliminar la copia duplicada en usuarios.

**§5b. Observer de alertas**
- Crear el sujeto `AlertaPublisher` (umbral de ocupación o incidente creado) con suscriptores de notificación push (`NotificationPort`) y de auditoría o métrica.

**§5c. Strategy**
- Añadir, p. ej., `PrioridadDocenteStrategy` y `AntelacionMinimaStrategy`, seleccionables por propiedad o por tipo de laboratorio, con pruebas.

**§5d. State y ADR**
- Llevar la expiración por `SolicitudReservaStates` y hacer privado el setter.
- Corregir ADR-005 con conteos reales.
- En ADR-006: Estado "Aceptado", fechas de acceso, fuente primaria y una cifra comparativa entre alternativas.

**Cómo lo verifico**
- `grep -n "private .*PrometheusQueryClient()\|getInstance" -r services/academico-laboratorios-service/src/main`.
- `grep -rn "implements .*Strategy" services/reservas-solicitudes-service/src/main | wc -l` debe dar 2 o más, además de la prueba de selección.
- `grep -rln "Alerta.*Listener\|implements .*AlertaObserver" services/*/src/main` debe dar 2 o más.
- Leer ADR-005 y ADR-006.

**Estimación por ítem**

**§5a. Singleton**
- P2
- C2
- A1
- T1

**§5b. Observer**
- P3: requiere diseño de eventos.
- C3
- A3: dominio, aplicación e infraestructura.
- T3: 6–15 h.

**§5c. Strategy**
- P2
- C3
- A2
- T3

**§5d. State y ADR**
- P2
- C1
- A2
- T2

### §6 Aplicación web funcional

**Qué encontré** (`scratchpad/work/FUVV/web`; npm ci, lint, tsc, vitest y build ejecutados)
- **Cumple:**
  - 5 rutas (`src/router/index.tsx:40-83`) y `ProtectedRoute`;
  - JWT en `sessionStorage` con `expiresAt` (`AuthContext.tsx:25-33`); `localStorage` solo para preferencias;
  - consumo vía nginx → `api-gateway:8080`;
  - serie temporal real (`MonitoreoPanel.tsx`, recharts sobre `/api/v1/laboratorios/metricas/ocupacion`, respaldado por Prometheus);
  - calendario semanal real (`CalendarioReservasPage.tsx`, `/api/v1/reservas/calendario`);
  - `es.json` y `en.json` con las mismas 57 claves.
- **i18n aplicado de forma marginal:** solo 3 de 38 archivos `.tsx` usan `t()` (`DashboardLayout`, `AboutPage`, `SettingsPage`). Quedan unos 283 textos fijos en español (`LoginPage.tsx:56-88`, calendario, monitoreo, menú en `DashboardLayout.tsx:186,195`, `apiClient.ts:24-33`). Al cambiar a inglés, casi toda la aplicación sigue en español.
- **`/settings` y `/about` exigen el rol ADMINISTRADOR** (`router/index.tsx:45-48`): el resto de roles no puede cambiar idioma ni tema.
- **`/` solo redirige a `/login`** (línea 82), incluso con sesión iniciada.
- **Tema oscuro parcial:** un único bloque `[data-theme='dark']` (`pages/MainPage.css:33`) frente a 233 colores hexadecimales fijos.
- **La serie temporal solo la ve el administrador** (`MainPage.tsx:306-310`).

**Cómo debe quedar**
- Toda la interfaz traducida.
- `/settings` y `/about` para cualquier usuario autenticado.
- `/` como página de inicio real.
- Tema oscuro coherente en todas las pantallas.

**Qué deben hacer**
- Extraer los textos a `t()` y formatear fechas con `i18n.language`.
- Abrir las rutas a cualquier usuario con sesión.
- Pasar los colores a variables CSS.
- Añadir al CI un script que compare claves y detecte literales sin traducir.

**Cómo lo verifico**
- `grep -rL "useTranslation" apps/web/src --include=*.tsx | grep -v test | wc -l`, en contraste con el número de páginas.
- E2E `settings-theme-i18n.spec.ts` ampliada: cambiar a `en` y comprobar textos de `/login`, `/main` y `/reservas/calendario`.
- `grep -c "#[0-9a-fA-F]\{6\}" apps/web/src/**/*.css`.

**Estimación por ítem**

**§6a. i18n completo**
- P1
- C2
- A4: unos 35 componentes.
- T3: 6–15 h.

**§6b. Rutas y página de inicio**
- P1
- C1
- A1
- T1

**§6c. Tema oscuro**
- P1
- C2
- A3
- T2

### §7 Calidad de la aplicación web

**Qué encontré**
- **TypeScript y lint:** `strict: true`; `tsc` con 0 errores; lint con 0 errores y 1 aviso; 280/280 tests en 41 archivos.
- **Cobertura con la configuración del repositorio:** statements 85,96 %, branches 73,69 %, functions 81,87 %, lines 89,91 %.
- **La cobertura se mide sobre un alcance favorable:** `vite.config.ts:17-26` no define `coverage.include` (Vitest 4.1.11 no tiene `all`), así que solo se miden los archivos importados por las pruebas.
  - Con `include: src/**`, **branches baja a 68,94 %** y el umbral falla (código de salida 1).
  - Quedan fuera, con 0 %, `LoginPage.tsx`, `ProfilePage.tsx`, `PlanificacionPage.tsx`, `router/index.tsx` y `App.tsx`.
  - El 73,69 % mal acotado es la cifra que llega a la tabla ISO de mantenibilidad (`04-observabilidad-iso.tex:622`).
- **E2E en CI:**
  - `reservas-freddy.spec.ts:88` se omite con `test.skip` porque ningún workflow define `DEMO_DOCENTE_*` ni `DEMO_ADMIN_PISO_*`;
  - `seguridad-e3.spec.ts` está excluida en `playwright.config.ts:5`;
  - solo corren 6 pruebas (auth y settings) por 3 motores, ninguna sobre la serie temporal ni el calendario;
  - **en d0ef60b ni siquiera se ejecutaron**, porque falla el paso anterior del job de integración (§13).
- **Credenciales** `admin` / `Admin123!` escritas en `auth.spec.ts:4-5`.
- **Positivo:** Dockerfile multi-stage (node:22-alpine → nginx:alpine, sin versión fijada) y artefacto `web-dist-${{ github.sha }}` (`ci-cd.yml:300`).

**Cómo debe quedar**
- Cobertura ≥70 % en las cuatro métricas con `include: ['src/**/*.{ts,tsx}']`.
- E2E sin saltos condicionales, ejecutadas en verde en el SHA final y cubriendo `/main` y el calendario.
- Credenciales fuera del código.

**Qué deben hacer**
- Fijar `coverage.include` y excluir solo tests, `main.tsx` y `*.d.ts`.
- Escribir pruebas de `LoginPage`, `ProfilePage`, `PlanificacionPage` y `SolicitudDetailPage`.
- Definir `DEMO_*` en el job de integración.
- Ejecutar `playwright.security-e3.config.ts`.
- Añadir E2E de gráfico y calendario.
- Usar `--max-warnings 0` en lint.

**Cómo lo verifico**
- `cd apps/web && npm ci && npx vitest run --coverage --coverage.include='src/**/*.{ts,tsx}'` debe terminar con código 0.
- `grep -rn "test.skip" apps/web/e2e`.
- En el run del SHA final: el job de integración en verde, con el conteo de pruebas Playwright en el log.

**Estimación por ítem**

**§7a. Cobertura del conjunto**
- P2
- C2
- A3: unas 5 páginas.
- T2: 2–6 h.

**§7b. E2E en CI**
- P2
- C3: datos y secretos del compose.
- A2
- T2

### §8 Aplicación móvil funcional

**Qué encontré**
- **Cumple:**
  - Kotlin + Compose MVVM con minSdk 26 y target 34;
  - login contra `api/v1/auth/login` vía gateway;
  - JWT en `EncryptedSharedPreferences` (`EncryptedAuthStorage.kt:8-16`);
  - listado y detalle con pull-to-refresh y caché Room sin conexión (`RemoteReservaRepository.kt:49-56,71-74`);
  - QR real con CameraX 1.3.4 + ML Kit;
  - `FirebaseMessagingService` registrado.
- **El APK release no puede hablar con un backend real:**
  - el `.dex` del APK versionado contiene `http://10.0.2.2:8080/` (CI no define `SCLI_API_BASE_URL`);
  - `usesCleartextTraffic` solo está en `src/debug/AndroidManifest.xml:4`;
  - con target 34, el tráfico HTTP sin cifrar queda bloqueado en release.
- **FCM inoperante:**
  - no hay `google-services.json` (el plugin se aplica condicionalmente en `build.gradle.kts:17-19`);
  - en `resources.arsc` no están `google_app_id` ni `gcm_defaultSenderId`;
  - en backend `FIREBASE_ENABLED=false` (`application.yml:121`);
  - el propio README (Pendientes) dice "no está completamente operativo".
- **"Notificación de incidentes" (Tabla 1):**
  - `IncidenteService.crear` (líneas 24-31) no notifica a nadie;
  - solo se avisa al reportante al cambiar el estado;
  - la notificación al crear es local (`IncidentesViewModel.kt:90-93`).
- **"Reserva rápida por QR" (Tabla 1):** el detalle escaneado (`QrScanScreen.kt:183-206`) no navega a `NuevaReserva`.

**Cómo debe quedar**
- APK release apuntando al gateway por HTTPS o con `network_security_config` restringido.
- Push FCM funcionando de extremo a extremo, desde la creación del incidente hasta los técnicos con permiso, con evidencia de recepción.
- Escaneo de QR que precargue el laboratorio en una reserva rápida.

**Qué deben hacer**
- Inyectar `SCLI_API_BASE_URL` y `google-services.json` desde secretos en el job release.
- Emitir la notificación en `IncidenteService.crear` a los perfiles con `INCIDENTE_GESTIONAR`.
- Añadir la acción "Reservar este laboratorio" → `reservas/nueva?laboratorioId=`.
- Versionar la evidencia: captura, log de `messaging.send` con `messageId` y log del dispositivo.

**Cómo lo verifico**
- `unzip -p release/apk/*.apk classes*.dex | strings | grep -c 10.0.2.2` debe dar 0.
- `unzip -l release/apk/*.apk | grep -i google` o recursos `google_app_id` presentes.
- `grep -n "notificar" services/reservas-solicitudes-service/src/main/java/**/IncidenteService.java`.
- Prueba de ViewModel de QR → navegación.

**Estimación por ítem**

**§8a. URL y red del APK release**
- P2
- C2
- A1
- T1

**§8b. FCM de extremo a extremo e incidentes a técnicos**
- P3
- C4: Firebase, secretos y backend.
- A3
- T3

**§8c. QR → reserva rápida**
- P2
- C2
- A2
- T2

### §9 Calidad de la aplicación móvil

**Qué encontré**
- **Pruebas unitarias:** `src/test` tiene 291 `@Test`; unos 120 de ViewModels (mockk, `runTest`) y son reales. Se usa **JUnit 4**: 46 archivos importan `org.junit.Test` y ninguno usa jupiter.
- **Pruebas instrumentadas:** 7 `@Test` en `androidTest`. Son pantallas Compose con fakes, un DAO y una migración; **ninguna es E2E** (no pasan por MainActivity, login, navegación ni red).
- **Cobertura:** 38,3407 % de líneas (1.733/4.520, recalculada desde `jacocoTestReport.xml`), frente al 70 %.
- **Job firmado** `build-mobile-release-signed` (`ci-cd.yml:416-523`):
  - a1e0982 (Villamarín, 17:34) sustituye `::notice::` por `::error::` + `exit 1` si faltan secretos. **Hecho verificado.**
  - Pero el job solo corre en `push` a `refs/heads/feature/entrega-4` (línea 419): en PR salió `skipped` (run 34788223252) y en `main` no se genera.
  - No tiene `needs`: no depende de las pruebas instrumentadas.
- **APK versionado:**
  - se subió **a mano** en 6f98108 (IsaiasUrb, 12/09);
  - firma v1, v2 y v3 válida, con clave propia CN=scli (no la de debug);
  - `sha256sum` OK sobre el blob;
  - no hay atestación que lo vincule byte a byte con el artefacto del run 34688947156 (el tamaño del artefacto zip, 24.433.378 B, no permite comparar);
  - en un checkout Windows `SHA256SUMS.txt` tiene CRLF y `sha256sum -c` falla.

**Cómo debe quedar**
- ViewModels con JUnit 5 y cobertura móvil ≥70 % con compuerta.
- 1 o más E2E instrumentadas con `createAndroidComposeRule<MainActivity>` que cubran login → lista → detalle → sin conexión, contra MockWebServer, y que corran en el emulador de CI.
- APK firmado publicado por CI de forma verificable (Release o attestation) y generado también desde `main`, después de las pruebas.

**Qué deben hacer**
- Migrar a `android-junit5`.
- Añadir `jacocoTestCoverageVerification` con 0,70.
- Escribir la E2E `MainActivityFlowTest`.
- Añadir `needs: [test-mobile-instrumented]` y la condición `refs/heads/main` al job firmado.
- Usar `actions/attest-build-provenance` o subir a un GitHub Release con digest citado en el README.

**Cómo lo verifico**
- `grep -rl "org.junit.jupiter" apps/mobile/app/src/test | wc -l`
- `./gradlew jacocoTestCoverageVerification` en CI.
- `grep -rn "createAndroidComposeRule<MainActivity>" apps/mobile/app/src/androidTest`
- `gh attestation verify release/apk/*.apk -R gleiston-guerrero/Entrega-final-del-PFC`

**Estimación por ítem**

**§9a. JUnit 5, cobertura ≥70 % y E2E instrumentada**
- P3
- C3
- A4: más de 20 clases.
- T4: 15–30 h.

**§9b. Publicación verificable del APK**
- P2
- C2
- A1
- T1

### §10 Integración y contratos

**Qué encontré**
- **Pacts escritos a mano en Java:** los consumidores están en `tests/contract` con pact-jvm (`scli-web` 5 interacciones, `scli-mobile` 13, `scli-web-mobile` 3). **No se generan desde los clientes reales**: no hay pact-js en `apps/web/package.json` ni pact en el Gradle móvil.
- **Desfase demostrable:** la app llama a `GET api/v1/incidentes?tamanio=100` (`IncidentesApi.kt:13`) y el pact (`MobileIncidentesNotificacionesPactTest.java:19`) define ese GET sin query.
- **Verificación del proveedor:** solo en académico, reservas y usuarios, con `MockMvcBuilders.standaloneSetup` y servicios simulados (sin contexto Spring ni seguridad). **auth-service no tiene prueba de proveedor**, así que sus pacts se generan y nunca se verifican. El gateway queda fuera del circuito.
- **Validador en tiempo de ejecución** (a137778, aa3095d, 33da7ea, 6507bb4): lee `RequestMappingHandlerMapping` desde `@SpringBootTest` y es independiente para método + ruta en los 5 servicios. Es una mejora real respecto del 12/09, pero:
  - no valida esquemas, parámetros ni códigos;
  - el conteo está fijado con `hasSize(...)`;
  - la verificación del gateway solo va en la dirección contrato → router.
- **El job CI `validate-openapi-contracts` sigue ejecutando el validador circular:** `scripts/validar-contratos-openapi.py:286,293` compara el JSON con su propio extractor regex. En local da 12/12, 44/44, 71/71, 79/79 y 224/224.
- **Esos cambios rompieron el CI:** a137778 añadió `build-helper-maven-plugin` con fuentes en `../../tests/openapi-runtime`, fuera del contexto Docker (`services/auth-service/pom.xml:174`), y `jackson-databind` con scope test. Resultado: `crdb-tests` e `integration` en rojo desde e1b7249 hasta d0ef60b. La corrección (1cede75, b01732b) es posterior al corte.

**Cómo debe quedar**
- Pacts generados por los clientes reales: pact-js sobre `src/api` web y pruebas consumer sobre las interfaces Retrofit.
- Verificados contra el proveedor arrancado (`@SpringBootTest(RANDOM_PORT)` + `HttpTestTarget`) en los servicios consumidos, incluido auth.
- En verde en CI en el SHA final.
- Validación de esquema no circular.

**Qué deben hacer**
- Añadir `@pact-foundation/pact` en web y pact-jvm consumer en móvil.
- Crear un job `contract-consumers` que publique los pacts como artefacto y otro que los verifique.
- Crear `AuthProviderPactTest`.
- Sustituir el script regex por la comparación de `/v3/api-docs` con el snapshot (openapi-diff) o por schemathesis contra el compose.
- Añadir `validate-openapi-contracts` a los `needs` de `build-images`.

**Cómo lo verifico**
- `grep -n pact apps/web/package.json apps/mobile/app/build.gradle.kts`
- `ls services/auth-service/src/test/**/**ProviderPact*`
- `grep -rn standaloneSetup services/*/src/test/**/*Pact*` debe salir vacío.
- Run del SHA final con verify en verde.

**Estimación por ítem**

**§10a. Consumidores reales web y móvil**
- P3
- C3
- A3
- T3

**§10b. Verificación del proveedor real, incluido auth**
- P3
- C3
- A3
- T3

**§10c. Validación de esquema no circular**
- P2
- C3
- A2
- T2

### §11 Persistencia distribuida

**Qué encontré**
- **Cumple:**
  - `crdb-e3-1/2/3` (v26.2.0, TLS) con healthchecks e init con `num_replicas=3`;
  - Flyway en 4 servicios;
  - `scripts/ci/verify-crdb-e3.sh` detiene un nodo en CI, y ese job estaba en verde en d0ef60b.
- **La evidencia de tolerancia a fallos no se puede verificar:**
  - `docs/evidencias/tolerancia_fallos.md` solo tiene capturas del 28/07 (`--insecure`, contenedores `scli-crdb-e3-*`, que no son la topología actual) y un vídeo de 24,6 MB;
  - las latencias 2604/2681/2906 ms son una sola medición con `Measure-Command` de `docker exec … SELECT COUNT(*)`, dominada por el arranque del CLI;
  - la Figura 5 cita `conteo_100000_registros.png`, que no existe.
- **Registros `RECOVERY` de esc4-s4 incompletos:** no traen el comando, el nodo detenido ni `exit_code`, aunque `caida_coordinador.py:36-39` los genera.
- **Comprobaciones débiles en `verify-crdb-e3.sh`:**
  - con un nodo caído solo hace `SELECT 1`;
  - compara `max(version) != "9"` como texto, así que "9" > "14" y nunca verifica V10–V14.
- **Solo Reservas está replicada:** auth, usuarios y académico usan `start-single-node`.
- **Sin licencia:** `raw/fiabilidad_nominal_50u_1h/rep-01/reservas-service.log` registra "No license installed. The maximum number of concurrently open transactions has been reached". Es el origen de los HTTP 500 en todas las campañas.

**Cómo debe quedar**
- Experimento de caída reproducible sobre el compose actual: `node status` antes, durante y después; lecturas y escrituras con marca UTC; 5 o más repeticiones por escenario (1 y 2 nodos); SHA256SUMS.
- Script de CI que lea y escriba en tablas replicadas con el nodo caído y compruebe la última migración.
- Límite de licencia resuelto o justificado en un ADR.

**Qué deben hacer**
- Crear `experimentos/crdb-failover/` con script y datos.
- Corregir `verify-crdb-e3.sh` (usar `installed_rank` o el entero de la versión, e `INSERT`/`SELECT` sobre `reservas`).
- Corregir la referencia de la Figura 5.
- Escribir un ADR sobre los nodos únicos y la licencia.

**Cómo lo verifico**
- `sha256sum -c experimentos/crdb-failover/SHA256SUMS`
- `grep -n 'installed_rank\|INSERT' scripts/ci/verify-crdb-e3.sh`
- Job `crdb-tests` en verde.

**Estimación por ítem**

**§11a. Experimento de caída reproducible**
- P3
- C3
- A2
- T3

**§11b. Script de CI**
- P2
- C2
- A1
- T1

**§11c. Licencia y ADR de nodos únicos**
- P2
- C2
- A2
- T2

### §12 Pirámide de pruebas

**Qué encontré**
- **Cumple:**
  - backend con 869 `@Test` (académico 279, gateway 29, auth 94, reservas 280, usuarios 187);
  - Testcontainers con CockroachDB en auth, usuarios y reservas, sin `@Disabled` ni `assume`;
  - JaCoCo `check` a 0,70 (reservas 0,80/0,48) y en verde;
  - `tests/load/locustfile.py:95-133` ya renueva el token (corrección de 1649142);
  - `ramp_locustfile.py` implementa 0→200 en 600 s.
- **Pruebas que no se ejecutaron en el corte:** el job de integración falló en d0ef60b (runs 34788220065 y 34788223252, paso "Start stack and run integration checks"), así que **Playwright y el smoke de Locust no se ejecutaron**.
- **E2E móvil inexistente** (§9).
- **Carga no repetida con el locustfile corregido:**
  - las 10 nominales y la única rampa son del sha a47f044, del 30/08;
  - la rampa tiene `metadata.json` con `status: failed`, `exit_code: 1`;
  - el endpoint `/{id}` nunca aparece en la campaña nominal.
- **Sin artefactos de informe:** CI no sube informes Playwright ni JaCoCo del backend.
- **Integración de académico con H2** (Flyway desactivado).
- **Versión de CockroachDB:** Testcontainers usa v24.3.5 y el compose v26.2.0.

**Cómo debe quedar**
- Los cinco tipos en verde en el SHA final y cada uno con artefacto descargable.
- Carga nominal y rampa ejecutadas con el harness corregido.

**Qué deben hacer**
- Reparar el CI (§13a).
- Añadir `--reporter=json,html` y `upload-artifact` para Playwright y `target/site/jacoco`.
- Repetir la rampa (3 o más corridas) y la nominal con datos sembrados.
- Igualar la imagen de Testcontainers.
- Añadir `CockroachFlywayIntegrationTest` en académico.

**Cómo lo verifico**
- `curl -s …/actions/runs?head_sha=<sha>` con `conclusion=success`, y artefactos `playwright-report`, `jacoco-*` y `locust-*` listados en `…/runs/<id>/artifacts`.
- `ls experimentos/resultados/raw/ramp_0_200_10m/`, con sha ≥ 1649142 en `metadata.json`.

**Estimación por ítem**

**§12a. Artefactos de pruebas en CI**
- P2
- C2
- A2
- T2

**§12b. Repetir la carga (nominal y rampa)**
- P2
- C3: requiere la VM.
- A2
- T3

**§12c. Integración de académico y versión de Testcontainers**
- P2
- C2
- A2
- T2

### §13 Pipeline CI/CD

**Qué encontré**
- **DAG:** los 7 jobs existen con `needs` coherentes (`ci-cd.yml`). No hay compuertas trucadas (`continue-on-error`, `-DskipTests` en tests, `|| true` salvo en limpieza). `integration` hace `curl --fail` al health con 30 intentos, login real y petición autenticada. Hay 6 imágenes en GHCR con `${{ github.sha }}`.
- **CI en rojo en el corte:** 11 commits consecutivos en rojo, de a137778 a d0ef60b. El último run verde antes del corte es 3702e7d (run 34772282570, intento 2). **No hay imágenes publicadas para d0ef60b.**
- **Causa reproducida en local:** `mvn -B clean test-compile -DskipTests` sobre una copia de auth-service da `package ec.edu.scli.contracts does not exist` porque `build-helper` apunta fuera del contexto Docker. A eso se suma `jackson-databind` con scope test (`auth-service/pom.xml:163-167`).
- **Lint backend:** Checkstyle solo en académico (`ci-cd.yml:23-25`), con 6 reglas (`checkstyle.xml`, 20 líneas). ESLint sin `--max-warnings 0`.
- **Publicación sin compuertas completas:** `validate-openapi-contracts` y `build-mobile-release-signed` no están en los `needs` de `build-images` (línea 686).
- **CD nunca ejecutado:** `call-deploy` salió siempre `skipped`.

**Cómo debe quedar**
- Run completo en verde en el SHA final, con imágenes publicadas para ese SHA.
- Lint efectivo en los 5 servicios.
- Todas las validaciones como compuertas de la publicación.

**Qué deben hacer**
- Copiar el verificador en tiempo de ejecución a `src/test` de cada servicio y quitar `build-helper`.
- Quitar el scope test de jackson.
- Usar `-Dmaven.test.skip=true` en los Dockerfile.
- Añadir `maven-checkstyle-plugin` con `failOnViolation` en los 5 pom y ejecutarlo en `lint`.
- Poner `eslint . --max-warnings 0`.
- Ampliar los `needs` de `build-images`.

**Cómo lo verifico**
- `curl -s "https://api.github.com/repos/gleiston-guerrero/Entrega-final-del-PFC/actions/runs?head_sha=<sha>" | jq '.workflow_runs[]|{name,conclusion}'`
- `grep -n "checkstyle:check" .github/workflows/ci-cd.yml | wc -l` debe dar 5 o más.
- `grep -n -A12 "build-images:" .github/workflows/ci-cd.yml | grep validate-openapi`

**Estimación por ítem**

**§13a. CI en verde**
- P2
- C3
- A2: 4 pom y 5 Dockerfile.
- T2

**§13b. Lint en los 5 servicios**
- P1
- C2: corregir las violaciones que aparezcan.
- A3
- T2

**§13c. `needs` de publicación**
- P1
- C1
- A1
- T1

### §14 Observabilidad

**Qué encontré**
- **Cumple:**
  - `app_business_events_total` incrementado en flujos reales (`SolicitudReservaServiceImpl.java:239,593,631…`);
  - `app_active_sessions` como gauge en auth;
  - logs JSON con `trace_id` en los 5 servicios (73/73 líneas con `trace_id` en `rep-01/reservas-service.log`);
  - Collector → Tempo y Loki;
  - `ops/grafana/pfc-dashboard.json` con 6 paneles.
- **La propia evidencia del equipo muestra "No data" en 3 de los 6 paneles** (`release/screenshots/panel-monitoreo.png`, tomada bajo carga):
  - **CockroachDB/Raft:** el clúster usa `--certs-dir` y el scrape `crdb-e3-cluster` (`prometheus.yml:49-55`) no declara `scheme: https` ni `tls_config`;
  - **Recursos por contenedor:** cAdvisor sin `privileged` ni `/dev/kmsg`;
  - **Latencia E2E móvil:** es un proxy por URI del gateway, y además sale vacío.
- **Latencia desde la app inexistente:** la app no mide ni exporta latencia; su `TraceId.kt` es un UUID por proceso sin `traceparent`.
- **Métricas nuevas incompletas:**
  - `http_requests_total` solo en usuarios y académico;
  - `http_request_duration_seconds` es una regla de grabación solo para reservas;
  - el tablero no usa ninguna de las cuatro métricas nuevas.
- **Trazas:** no hay evidencia exportada de Tempo, y auth y gateway no declaran endpoint OTLP de trazas.

**Cómo debe quedar**
- Los 6 paneles con datos bajo carga, con captura y `query_range` JSON versionados.
- Latencia móvil medida en el cliente y propagada con `traceparent`.
- Las 4 métricas en todos los servicios que corresponda, usadas en el tablero.
- Una traza distribuida exportada y correlacionada con Loki.

**Qué deben hacer**
- Añadir `scheme: https` y `tls_config.ca_file` en el scrape de CockroachDB y montar el volumen de certificados.
- Corregir cAdvisor o añadir node-exporter.
- Crear un interceptor OkHttp que mida la duración, genere `traceparent` y exporte `mobile_http_client_duration_seconds` por OTLP.
- Añadir `HttpMetricsFilter` con `@Order(HIGHEST_PRECEDENCE)` en gateway, auth y reservas.
- Versionar la evidencia en `ops/evidencia/`.

**Cómo lo verifico**
- `grep -n -A6 crdb-e3-cluster ops/prometheus/prometheus.yml | grep -c "https\|tls_config"`
- `jq '.panels[].targets[].expr' ops/grafana/pfc-dashboard.json | grep -c "http_requests_total\|mobile_http_client"`
- Revisar la captura nueva: 6/6 paneles con series.
- `ls ops/evidencia/*query_range*.json`

**Estimación por ítem**

**§14a. Paneles vacíos (CockroachDB y recursos)**
- P2
- C3
- A2
- T2

**§14b. Latencia E2E móvil real**
- P3
- C4
- A3
- T3

**§14c. Métricas completas y evidencia de trazas**
- P2
- C2
- A3
- T2

### §15 Protocolo y campaña experimental

**Qué encontré**
- **PI1 (eficiencia):** corregido en a8d5c14 (Villamarín). Recalculé desde `raw/eficiencia_nominal_50u_5m/rep-02..09/locust_stats.csv` (fila `GET /api/v1/reservas`):
  - p95: media 45,5 ms, DE 21,764978, IC95 [27,304023; 63,695977];
  - p99: media 371,25 ms, IC95 [66,911235; 675,588765];
  - coincide exactamente con el manuscrito;
  - el umbral p99 = 750 ms existe desde e1c82c7 (24/08) y la campaña es del 30/08;
  - el texto admite que PI1/PI2 "se formalizaron posteriormente".
- **Fiabilidad (E2): la campaña correctiva prerregistrada no se ejecutó.**
  - `protocolo-e2-fiabilidad-correctiva.md` prerregistra 10 repeticiones × 1 h con refresh.
  - `resultados/iso25010-correctiva.csv` tiene las 10 filas **vacías**.
  - `cierre-e2-fiabilidad.md` declara una sola repetición correctiva "válida" (r1) y tres intentos inválidos de r2, pero admite que sus datos "no están incorporados a este checkout", así que no se pueden verificar.
  - Lo único versionado es un smoke de 25 min (`evidencia-e2/smoke-refresh-25m`, 04:32–04:57Z del 13/09, sha 1649142).
- **La campaña que sustenta PI2 sigue con población mezclada:**
  - r2–r9 suman 75,05 % de HTTP 401 (IC95 [75,008; 75,091]);
  - `iso25010.csv` marca esas filas `valida=si`.
- **ARBITER (E3):**
  - Esc-1 con 7/10 corridas fallidas → n=3 frente a r=10;
  - los invariantes **I4 e I5 quedan en 96/96 NOT_OBSERVED**, así que el oráculo de 5 invariantes solo evalúa 3;
  - el censo HTTP del documento omite Esc-4, donde **S4 tuvo 351/1.600 HTTP_ERROR (21,94 %) frente a 0 en S3** (recalculado desde `raw/esc4-s4-r02..r09*.json`), porque `auditar_http_arbiter.py:13` fija `COMPARISON_SCENARIOS=("esc2","esc3")`;
  - esc2/esc3 cuadran exactamente con la Tabla `tab:arbiter-http` (p. ej. Esc-3/S1 427/1.600).
- **Seguridad, mantenibilidad y compatibilidad:** r=3 por diseño (`protocolo-e4.md:253`) frente a r=10 de la guía. En mantenibilidad las tres "repeticiones" dan valores idénticos (`metricas.csv` con el mismo hash d336496f… en las 3); ahora se declaran honestamente como deterministas (b8613bf), pero siguen sin aportar variabilidad.

**Cómo debe quedar**
- Campaña de fiabilidad 10 × 1 h ejecutada con el harness corregido, r2–r9 analizadas y datos versionados.
- Población de negocio sin 401 inducidos por el instrumento.
- ARBITER con n suficiente en Esc-1 (o exclusión declarada antes de ejecutar) y un escenario que ejercite I4 (cancelación) e I5 (acceso).
- Censo HTTP de todos los escenarios analizados.

**Qué deben hacer**
- Ejecutar `ejecutar_iso25010.sh` con `locustfile_e2_correctiva.py` 10 veces en la VM.
- Versionar `raw/fiabilidad_nominal_50u_1h_refresh/rep-01..10` con metadata y SHA256SUMS, y llenar `iso25010-correctiva.csv`.
- Añadir `esc4` a `COMPARISON_SCENARIOS`.
- Diseñar corridas de cancelación y acceso para I4 e I5.
- Resolver el límite de licencia de CockroachDB (§11c) antes de medir.

**Cómo lo verifico**
- `python - <<<'import csv;print(sum(1 for r in csv.DictReader(open("experimentos/resultados/iso25010-correctiva.csv")) if r["total_requests"]))'` debe dar 10.
- `ls experimentos/resultados/raw/fiabilidad_nominal_50u_1h_refresh/`.
- `grep -c 401 raw/fiabilidad_nominal_50u_1h_refresh/rep-0*/locust_failures.csv`.
- `grep -o NOT_OBSERVED -r experimentos/resultados/arbiter/campaign/analysis/oracle | wc -l`.

**Estimación por ítem**

**§15a. Campaña correctiva de fiabilidad 10 × 1 h**
- P3
- C3
- A2
- T4: más de 10 h de máquina más preparación y análisis.

**§15b. ARBITER: Esc-1, I4/I5 y censo de Esc-4**
- P4: diseño experimental.
- C3
- A3
- T3

**§15c. Diseño de las campañas E3 de calidad**
- P3
- C2
- A2
- T2

### §16 Paquete de datos y reproducibilidad

**Qué encontré**
- **Manifiesto general:** `experimentos/resultados/SHA256SUMS` verifica 468/468 sobre los bytes del blob (`git -c core.autocrlf=false archive d0ef60b … | tar -x`). En un checkout Windows (la propia copia congelada) fallan **373/468**. El texto que decía "198" ya dice "468" (`04-observabilidad-iso.tex:240`). **Corregido.**
- **ARBITER:** `arbiter/campaign/SHA256SUMS` verifica 315/315.
- **`evidencia-e3-canonica/MANIFEST-SHA256.txt`: no verifica en ningún modo de checkout.**
  - Sobre el blob fallan 43/50.
  - Comprobé archivo por archivo: 43 hashes corresponden a la versión CRLF y 7 a la LF.
  - En el checkout Windows fallan 50/50.
- **Smoke E2:** `evidencia-e2/smoke-refresh-25m/SHA256SUMS.txt` falla 3/7 sobre el blob (los tres CSV están hasheados en CRLF) y 7/7 en Windows.
- **Ningún job de CI verifica los manifiestos versionados.** `experimentos/tests` solo prueba funciones sobre directorios temporales.
- **No hay un único juego canónico de resultados:**
  - `resultados/iso25010.csv` conserva para eficiencia los percentiles de la fila **Aggregated** (r1: p95 110, p99 2200; r3: 130/1600);
  - el manuscrito publica como oficiales los de la fila GET (r1: 87/1000; r3: 80/1000), que no están en ningún CSV procesado y solo se derivan en la salida del analizador.
- **Datos de la corrección E2 ausentes** (r1 y los intentos de r2), aunque el documento los cita.
- **`boxplot_latencia.png` no versionado.**
- **Positivo:**
  - `analizar_e3.py --raw-root evidencia-e3-canonica` regenera `analisis-e3.json` idéntico (`a==b True`);
  - `analizar_iso25010.py` reproduce todas las cifras de eficiencia y fiabilidad del documento.

**Cómo debe quedar**
- Todos los manifiestos verifican en un clon limpio en Linux y en Windows, y un job de CI lo comprueba.
- Un solo CSV canónico con los valores que publica el documento.
- Datos de todas las ejecuciones citadas versionados.

**Qué deben hacer**
- Añadir en `.gitattributes` `experimentos/** -text` y `release/apk/SHA256SUMS.txt -text`.
- Regenerar los manifiestos sobre los bytes del blob (desde `git archive`) y hacer `git add --renormalize`.
- Añadir en CI el paso `sha256sum -c` para los 4 manifiestos.
- Escribir en `iso25010.csv` (o en `iso25010-oficial.csv`) las columnas p95/p99 de la población GET que usa el texto.
- Versionar los raws correctivos y `boxplot_latencia.png`.

**Cómo lo verifico** (en Linux y en Windows)

```
git clone … && cd … && git checkout <sha>
sha256sum -c experimentos/resultados/SHA256SUMS | grep -vc ': OK$'   # 0
(cd experimentos/resultados/evidencia-e3-canonica && sha256sum -c MANIFEST-SHA256.txt | grep -vc ': OK$')   # 0
(cd experimentos/evidencia-e2/smoke-refresh-25m && sha256sum -c SHA256SUMS.txt | grep -vc ': OK$')   # 0
python experimentos/analizar_iso25010.py | grep p99_ms
```

**Estimación por ítem**

**§16a. Manifiestos verificables y compuerta en CI**
- P2
- C2
- A2
- T2

**§16b. Juego canónico único y datos faltantes**
- P2
- C2
- A2
- T2

### §17 Evaluación ISO/IEC 25010

**Qué encontré**
- **Fiabilidad:** la media 0,061315 % (IC95 [0,032045; 0,090585]) se calcula sobre la fila Aggregated, donde el 75 % son 401 que no llegan al servicio.
  - Con el denominador sin 401, recalculado desde `locust_failures.csv`, da **0,245893 %, IC95 [0,128246; 0,363541]**: cuatro veces más.
  - En el smoke con sesión renovada, **219 HTTP 500 de 36.331 GET = 0,60 %** en 25 min, cerca del umbral de 1 %.
  - La respuesta "Sí" a PI2 se apoya en una población inválida.
  - Los p95/p99 de fiabilidad (28,75 / 115,625 ms) siguen saliendo de Aggregated, **con una regla de población distinta de la aplicada a PI1**: con la fila GET, p99 = 111,25 ms.
- **Mantenibilidad:**
  - DE = 0 e IC degenerado en todas las métricas, ahora declarado explícitamente (`04-observabilidad-iso.tex:600-604`);
  - **no se mide la complejidad ciclomática** que exige la Tabla 2 de la guía ("≥70 %; <10"; `grep -ri ciclom` en secciones, protocolo y analizador vacío);
  - la cobertura web del 73,69 % en ramas está medida sobre un alcance parcial (68,94 % sobre todo `src/`, ver §7).
- **Seguridad:** 21/21 decisiones = 7 decisiones × 3. La métrica de la guía es "% de endpoints con verificación JWT" sobre una superficie de 224 operaciones del gateway; la auditoría de 198 operaciones quedó como "antecedente".
- **Compatibilidad:** web 24/24 por motor. La parte móvil "API 26+" solo se prueba en emulador API 29.
- **Eficiencia:** Hecho (recalculado, §15).

**Cómo debe quedar**
- Las cinco características con métricas de la Tabla 2 sobre la población declarada:
  - fiabilidad sobre la campaña correctiva (r2–r9) con 5xx/GET de negocio;
  - mantenibilidad con cobertura del conjunto más complejidad ciclomática media;
  - seguridad como % de endpoints protegidos del inventario OpenAPI;
  - compatibilidad móvil en API 26 y 34.
- IC calculados sobre réplicas que varíen, o métricas deterministas reportadas como medición única sin IC.

**Qué deben hacer**
- Recalcular fiabilidad tras §15a.
- Añadir PMD/Checkstyle `CyclomaticComplexity` o `lizard` y reportar la media por componente.
- Cruzar `docs/openapi/api-gateway-openapi.json` con pruebas 401 por endpoint.
- Ejecutar las instrumentadas en emuladores API 26 y 34.

**Cómo lo verifico**
- `python experimentos/analizar_iso25010.py resultados/iso25010-correctiva.csv`
- `grep -n "ciclom" docs/entrega-4/secciones/04-observabilidad-iso.tex`
- `jq '.security' experimentos/resultados/analisis-e3.json` con total ≥ número de endpoints protegidos.
- Matriz de API en `ci-cd.yml`.

**Estimación por ítem**

**§17a. Fiabilidad sobre la población válida**
- P3
- C2
- A2
- T2, tras §15a.

**§17b. Mantenibilidad: complejidad ciclomática y alcance completo**
- P2
- C2
- A3
- T2

**§17c. Seguridad por endpoint y compatibilidad móvil**
- P3
- C3
- A3
- T3

### §18 Manuscrito final, bibliografía y trazabilidad

**Qué encontré**
- **Compilación:** `docs/main.tex` compila desde una copia limpia (`pdflatex`, `bibtex`, `pdflatex` ×2): **33 páginas, 0 citas y 0 referencias indefinidas**.
- **Bibliografía:** 29 referencias citadas, 23 con DOI o ISBN; 14 DOI comprobados en Crossref y todos resuelven al título declarado. Cumple.
- **Snapshot E3 (E6 del 12/09):** corregido. `docs/entrega-3` es autocontenido; `SHA256SUMS.txt` verifica sobre el blob; compila con 14 páginas y 0 indefinidas, y dos compilaciones consecutivas dan el mismo hash.
  - En Windows, `compilar.sh` termina con código 2 porque `BIBINPUTS=".:"` usa el separador POSIX. Es una limitación de portabilidad, no un defecto del contenido.
- **El defecto se trasladó a `docs/entrega-4`**, el "snapshot histórico" E4:
  - su `main.tex` hace `\input{secciones/…}`, las mismas secciones vivas que usa `docs/main.tex`;
  - compilado da `File 'panel-monitoreo.png' not found` y `Reference 'sec:contratos-openapi' undefined`;
  - su PDF (28 páginas, creado el 05/09) no corresponde a la fuente.
- **No hay PDF versionado de la fuente oficial:** `docs/main.pdf` no existe; solo se genera como artefacto en `docs.yml`.
- **Estructura:**
  - **dos secciones "Introducción"** (`main.tex:153` y `secciones/01-arquitectura.tex:1`);
  - las secciones E4 se insertan dentro de "Continuidad…" (`main.tex:1420-1435`) **antes** de la Discusión y las Conclusiones de E3, así que el documento termina con las conclusiones E3;
  - el texto E3 mantiene afirmaciones caducadas que contradicen E4: Tabla `tab:modulos` con "G. Métricas Prometheus: No iniciado" y "F. Protocolo: sin repeticiones ejecutadas" (líneas 1388-1418), y "La comparación pandas/PySpark… no tiene ejecuciones registradas";
  - el resumen dice que "evidencias experimentales… aún deban ejecutarse" y no da ningún resultado; tiene **154 palabras en español y 97 en inglés**, frente a ≥200 cada uno.
- **Faltan capturas** de las 5 rutas web, de la app móvil y de una traza distribuida (Tabla 3). Las dos "figuras" de aplicaciones son bloques `verbatim` ASCII (`02-aplicaciones.tex:147-160`).
- **Cifras:**
  - PI2 y la tabla ISO usan la población con 401 (§17);
  - el censo HTTP omite Esc-4 S4 = 21,94 % (§15);
  - `iso25010.csv` no contiene los percentiles que publica el texto (§16).

**Cómo debe quedar**
- Un documento acumulativo único con la estructura de la Tabla 3: una introducción, un fundamento teórico que incluya capas/SOLID/GoF/móvil/CI/observabilidad, y discusión y conclusiones finales integradas.
- Resúmenes de ≥200 palabras con resultados.
- Capturas exigidas.
- PDF versionado idéntico a la compilación de la fuente.
- `docs/entrega-4` congelado de verdad, igual que `docs/entrega-3`.
- Cifras idénticas al CSV canónico.

**Qué deben hacer**
- Eliminar la introducción duplicada.
- Reescribir la tabla de módulos E3 como histórica o actualizarla.
- Mover Discusión y Conclusiones al final, integrando E3 y E4.
- Ampliar los resúmenes con cifras.
- Añadir capturas de `/`, `/login`, `/main`, `/settings`, `/about` (es/en), de la app y de Tempo.
- Congelar `docs/entrega-4` con copias locales de las secciones y figuras, como en `docs/entrega-3`.
- Versionar `docs/main.pdf` y comprobar en `docs.yml` que su hash coincide con el compilado.

**Cómo lo verifico**

```
cd docs && latexmk -pdf -interaction=nonstopmode main.tex && grep -c "undefined\|not found" main.log   # 0
grep -c '\\section{Introducción}' main.tex entrega-4/secciones/*.tex   # total 1
cd entrega-4 && latexmk -pdf main.tex && grep -c "undefined\|not found" main.log   # 0
awk '/begin{abstract}/{f=1;next}/end{abstract}/{print c;c=0;f=0}f{c+=NF}' docs/main.tex   # ≥200 y ≥200
```

**Estimación por ítem**

**§18a. PDF versionado y snapshot E4 congelado**
- P1
- C2
- A2
- T1

**§18b. Estructura, resúmenes y capturas**
- P2
- C1
- A3
- T3

**§18c. Cifras alineadas con resultados canónicos (tras §15–§17)**
- P2
- C1
- A2
- T2

### §19 Amenazas a la validez y reflexión ética

**Qué encontré**
- **Amenazas** (`04-observabilidad-iso.tex:710-785`): 3 internas, 2 externas y 3 de constructo, con el formato amenaza/efecto/mitigación/riesgo.
- **Dos "mitigaciones" internas no mitigan, solo informan:**
  - asimetría HTTP: "se conservan y publican todos los intentos";
  - 5xx frente a disponibilidad: "se reporta… separada".
- **Faltan las dos amenazas internas que más afectan los resultados:**
  - el token no renovado (75 % de 401) en la campaña de fiabilidad;
  - el límite de transacciones por falta de licencia de CockroachDB, que causa los HTTP 500 de ARBITER y fiabilidad.
- **Reflexión ética:** menciona el Código ACM (`\cite{acm2018code}`) aplicado a privacidad, vigilancia y decisiones humanas, pero son 342 palabras, cerca de ⅓ de página en doble columna a 10 pt.

**Cómo debe quedar**
- ≥3 internas y ≥2 externas, cada una con una mitigación que reduzca la amenaza (control, repetición o medición adicional), incluidas las de sesión y licencia.
- Reflexión ética de ≥½ página vinculada a principios concretos del Código ACM (1.2, 1.6, 2.5, 3.1…).

**Qué deben hacer**
- Añadir las dos amenazas con mitigación real: campaña correctiva y licencia o ajuste de `max_open_transactions`.
- Reescribir las dos mitigaciones de solo reporte.
- Ampliar la ética citando principios numerados del Código ACM.

**Cómo lo verifico**
- `grep -n "Amenaza" docs/entrega-4/secciones/04-observabilidad-iso.tex | wc -l`
- `grep -n "401\|licencia" … sección amenazas`
- `awk '/subsection{Reflexión ética}/{f=1}/subsection{Declaración/{f=0}f' … | wc -w` debe dar 500 o más.

**Estimación**
- P2
- C1
- A1
- T1

### §20 Evidencia de trabajo en equipo y autoría

**Qué encontré**
- **Actas:** tras 88d4a80 (Vinueza, 13/09 17:53) se renombraron como "**registros retrospectivos**" (`docs/actas/README.md`). Admiten que se consolidaron el 12/09 a las 03:33 −05 (commit 1ce91ba) y que "no demuestran reuniones". La cronología ahora es honesta, pero **no existe ninguna acta contemporánea de reunión**: los 5 registros cubren hitos del 20/08 al 12/09 escritos a posteriori.
- **Revisión cruzada:** `docs/evidencias/revision-cruzada-e4.md` (consulta de las 22:49Z) registra 0 reviews. La única aprobación posterior (IsaiasUrb, 18:04 −05) es una frase genérica sobre un PR de 367 commits con CI en rojo (§3).
- **Pushes:** según la API de eventos, cada commit lo empuja la cuenta de su propio autor (p. ej. a1e0982 por `ivillamarinc` a las 22:34Z; ed6b48b por `IsaiasUrb` a las 22:27Z). No hay indicios de suplantación.
- **Aporte de Urbina (73 commits):**
  - web +6.594 líneas, usuarios-service +6.247, móvil +3.112 (18 commits; subió el APK firmado en 6f98108);
  - patrón Observer y capas de usuarios (3588ea3), ADR-006 (1e358a6);
  - entre el 12/09 y el corte, 4 commits: corrección de frontera temporal E2 (3476654), evidencia del smoke (c8827dc), validador del gateway (6507bb4) y snapshot E3 (ed6b48b);
  - aprobó el PR.
- **Aporte de Villamarín (91 commits):**
  - web +11.340, móvil +5.689 (12 commits), capas de auth (9dd3fb4), Factory (837dff4);
  - 26.002 de sus 52.684 líneas son JSON OpenAPI generados (0bc47c6);
  - entre el 12/09 y el corte, 3 commits: corrección de población PI1 (a8d5c14, +528, sustantiva), nota de mantenibilidad (b8613bf, +64) y cambio de 2 líneas en el job APK (a1e0982).
- **Evidencias individuales:** `docs/evidencias/Evidencias de commit mas relevantes-trabajo/<integrante>/` contiene capturas de commits autoseleccionadas, que no prueban nada por sí mismas.
- **Declaración de uso de IA:** presente (README y §`subsec:declaracion-ia`), genérica y sin indicar en qué artefactos se usó.

**Cómo debe quedar**
- Actas contemporáneas (fecha anterior o igual al commit que las registra) de las reuniones del periodo de suspenso.
- PR revisados con comentarios sustantivos por un integrante distinto del autor.
- Aporte individual verificable en el historial de cada integrante del suspenso sobre ítems concretos de esta guía.
- Declaración de IA que indique herramientas y alcance.

**Qué deben hacer**
- Registrar un acta por reunión en el mismo día, con commit el mismo día.
- Un PR por ítem, cuyo autor sea el responsable (Urbina o Villamarín) y cuyo revisor sea el otro, con comentarios en líneas.
- Ampliar la declaración de IA (herramienta, tareas, verificación).

**Cómo lo verifico**
- `git log --format='%h %cI %aN' -- docs/actas/ACTA-0*.md` y comparar con la fecha interna de cada acta.
- `curl -s …/pulls?state=all` y, por PR, `…/reviews` y `…/comments`.
- `git shortlog -sn --use-mailmap d0ef60b..HEAD`.

**Estimación por ítem**

**§20a. Actas contemporáneas y PR revisados**
- P1
- C1
- A2
- T2: continuo.

**§20b. Declaración de IA**
- P1
- C1
- A1
- T1

## 4. Lo que está Hecho

No hay ningún entregable completo. Lo siguiente está verificado y no se recalifica:

**Eficiencia (PI1)**
- Recalculada desde los raws: 10 repeticiones de 5 min con 0 HTTP 5xx.
- p95 GET: media 45,5 ms, IC95 [27,30; 63,70]. p99: media 371,25 ms, IC95 [66,91; 675,59].
- Umbrales fijados antes de medir (5b1c498, 18/08; e1c82c7, 24/08; campaña del 30/08).

**Campaña ARBITER**
- 130 corridas planificadas, 123 completadas y 7 fallidas.
- Manifiesto: 315/315 SHA-256 verificados.
- Censo HTTP de Esc-2 y Esc-3 idéntico al publicado (Esc-3/S1 427/1.600; S3 0; S0 14).
- S0 con doble adjudicación en 16/16 muestras.

**Manifiesto general**
- 468/468 verificados sobre los bytes del blob.
- `analisis-e3.json` se regenera idéntico.

**Validador de contratos en tiempo de ejecución**
- Lee `RequestMappingHandlerMapping` y cubre los 5 servicios (12/44/71/79/224 operaciones).

**Snapshot documental E3**
- Autocontenido; compila con 14 páginas y 0 indefinidas.

**Manuscrito vivo**
- Compila con 33 páginas y 0 indefinidas.
- 29 referencias, 23 con DOI/ISBN; 14 DOI resueltos en Crossref.

**Web**
- `strict: true`; tsc y lint limpios; 280/280 pruebas.
- JWT en `sessionStorage` con expiración; consumo vía gateway.
- Serie temporal y calendario semanal conectados a API real.

**Móvil**
- EncryptedSharedPreferences, Room sin conexión y QR CameraX + ML Kit.
- Unas 120 pruebas de ViewModel.
- APK con firma v1/v2/v3 de clave propia; su job CI falla si faltan secretos (a1e0982).

**Backend**
- 869 pruebas.
- Testcontainers con CockroachDB en 3 servicios.
- JaCoCo ≥70 % con compuerta (auth 88,0 %, usuarios 84,1 %, académico 83,2 %, reservas 84,4 %, gateway 88,9 %).
- State, Facade, Repository y Factory Method genuinos.

**Observabilidad**
- Logs JSON con `trace_id` en los 5 servicios.
- `app_business_events_total` instrumentado en flujos reales.

## 5. Orden de ejecución recomendado

1. **§13a.** CI en verde; es prerrequisito de §7b, §10, §12 y §3.
2. **§2 y §16a.** `.gitattributes`, manifiestos verificables y compuerta en CI; antes de generar datos nuevos.
3. **§11c.** Licencia o límite de CockroachDB, antes de cualquier medición.
4. **§15a → §17a → §16b.** Campaña correctiva de fiabilidad, análisis y CSV canónico.
5. **§15b y §15c.** En paralelo con el paso 4.
6. **§4a/b/c → §5a–d.** Los patrones se apoyan en capas limpias; ArchUnit protege el refactor.
7. **§6, §7a, §8a–c, §9a/b, §10a–c, §14a–c.** Pueden repartirse en paralelo:
   - Urbina: móvil (§8, §9, §14b);
   - Villamarín: web y contratos (§6, §7, §10).
8. **§11a/b y §12a–c.**
9. **§18a–c y §19.** Al final, con cifras definitivas.
10. **§1, §20, §3.** PR revisados, merge a `main`, etiqueta anotada y CHANGELOG. La etiqueta, lo último.

## 6. Lista de verificación final (docente)

```
# 1. Integración y línea base
git fetch --tags && git cat-file -t v4.0.0 && git merge-base --is-ancestor v4.0.0 origin/main && test -f CHANGELOG.md -a -f LICENSE
# 2. CI verde en el SHA etiquetado
curl -s "https://api.github.com/repos/gleiston-guerrero/Entrega-final-del-PFC/actions/runs?head_sha=$(git rev-list -n1 v4.0.0)" | python -c "import sys,json;[print(r['name'],r['conclusion']) for r in json.load(sys.stdin)['workflow_runs']]"
# 3. Manifiestos en clon limpio (repetir con core.autocrlf=true)
for m in experimentos/resultados/SHA256SUMS; do sha256sum -c $m | grep -vc ': OK$'; done; (cd experimentos/resultados/evidencia-e3-canonica && sha256sum -c MANIFEST-SHA256.txt | grep -vc ': OK$')
# 4. Campaña correctiva de fiabilidad completa y sin 401 masivos
python experimentos/analizar_iso25010.py experimentos/resultados/iso25010-correctiva.csv; grep -h 401 experimentos/resultados/raw/fiabilidad_nominal_50u_1h_refresh/rep-*/locust_failures.csv
# 5. Capas
grep -rEn "import .*\.(infrastructure|presentation)\." services/*/src/main/java --include=*.java | grep "/application/" | wc -l   # 0
# 6. Cobertura web sobre el conjunto
cd apps/web && npm ci && npx vitest run --coverage --coverage.include='src/**/*.{ts,tsx}'
# 7. Manuscrito
cd docs && latexmk -pdf main.tex && grep -c "undefined\|not found" main.log && cd entrega-4 && latexmk -pdf main.tex && grep -c "undefined\|not found" main.log
# 8. Revisión cruzada real
curl -s https://api.github.com/repos/gleiston-guerrero/Entrega-final-del-PFC/pulls?state=all | python -c "import sys,json;[print(p['number'],p['user']['login'],p['merged_at']) for p in json.load(sys.stdin)]"   # después, /reviews y /comments por PR
```

## 7. Notas para el docente (no van a la guía)

- **Aprobación del PR previa al corte pero sin sustancia.** IsaiasUrb aprobó el 13/09 a las 18:04 −05, sobre d0ef60b, 51 minutos antes del corte, con el CI de ese SHA en rojo (runs 34788220065 y 34788223252). La aprobación es una frase genérica sobre 2.417 archivos. La fusión (21:28) y las correcciones de CI (1cede75 a las 19:05, b01732b a las 20:13) son posteriores al corte. El merge lo hizo el propio autor del PR.
- **Reparto mecánico de los 8 pendientes del 12/09.** Entre 445e5b0 y el corte hay un commit por pendiente (E1…E8), asignado cada uno a un integrante distinto. Los cuatro últimos (ed6b48b, a1e0982, 88d4a80, d0ef60b) entraron en 28 minutos. La API de eventos confirma que cada cuenta empujó su propio commit, pero todos los commits del 12–13/09 llevan zona +0000, a diferencia del resto del historial (−0500). Sugiere que trabajaban sobre un mismo entorno (la VM `servidor-proyectos`, cuyo `campaign.log` muestra `/home/ffarinangog2/...`). No lo pude confirmar.
- **Aporte desigual en el tramo final.**
  - Villamarín: después del 12/09, 1 commit sustantivo (a8d5c14) y 2 menores; uno de ellos, a1e0982, cambia 2 líneas.
  - Urbina: 4 commits de alcance medio.
  - En el historial completo ambos aportan código real en web, móvil y servicios. El volumen de Villamarín está inflado por los JSON OpenAPI generados; el de Farinango, por los datos crudos.
- **Evidencia no verificable citada como válida.** `cierre-e2-fiabilidad.md` declara una repetición correctiva de 1 h "válida" (r1, 88.248 GET) y tres intentos de r2 cuyos datos no están en el repositorio. No hay forma de comprobarlos.
- **Datos que contradicen la conclusión de fiabilidad.** Con sesión renovada (smoke de 25 min), la tasa de 5xx sube a 0,60 %, diez veces el 0,061 % publicado. Es probable que una campaña correctiva completa se acerque al umbral o lo supere; no hay dato que lo descarte.
- **Documento ajeno en el repositorio.** d0ef60b ("Evidencias del cuestionario") versiona un PDF con la calificación personal de Farinango en el cuestionario del SGA (9,33). No aporta al proyecto y debería retirarse.
- **Sin sospechas de retrofechado en este tramo.** Las actas se reetiquetaron como retrospectivas y ya no afirman reuniones. El snapshot E3 declara su fecha real de reconstrucción (13/09) y "Commit que congela: pendiente".
- **No verificado:**
  - logs de los jobs de Actions (403 sin autenticación; la causa del rojo se reprodujo en local);
  - ejecución de Testcontainers, emulador Android y despliegue;
  - correspondencia byte a byte del APK versionado con el artefacto del run 34688947156 (su descarga requiere autenticación);
  - hash reproducible del snapshot E3 con la imagen Docker `texlive@sha256:4984…` (no hay Docker).
