# Auditoría técnica — Equipo BCEL (AcadTrace / SGA Escuela · gestión académica con bitácora de auditoría encadenada)

Fecha de la auditoría: 16/09/2026. Corte: 13/09/2026 19:00 (UTC−5). Se evaluó sobre la copia congelada en `78b0d175` y el clon completo. Todas las ejecuciones se hicieron en copias bajo `scratchpad\work\BCEL\`. Los commits del 14/09 al 16/09 (25 en `main`, entre ellos `9941f993` «Entrega release firmada» y `0a56cf74` «eliminar bypass de validación») **no cuentan**.

## 1. Cabecera

| Campo | Valor |
|---|---|
| Repositorio | https://github.com/gleiston-guerrero/acadtrace. Fue transferido al docente después del corte: el PR #119 (13/09 22:58Z) aún se abrió desde `LEO23as/devBedon` y el #120 (14/09) ya desde `gleiston-guerrero/devBedon`. Antes era `LEO23as/acadtrace`. |
| Rama evaluada | `main` |
| Commit de corte | `78b0d175`, 13/09/2026 17:58:32 −05, «Merge pull request #119 from LEO23as/devBedon» (fusionado por BedonViteri) |
| Commits alcanzables | 720 (`git rev-list --count 78b0d175`); 271 en la primera línea de `main`, de los cuales 184 se empujaron directamente (committer ≠ GitHub) |
| Evaluación previa | `ff6f68ba` (12/09 15:35). Entre esa evaluación y el corte entraron 44 commits sin merge y 26 PR fusionados (#90–#119). |

**Integrantes (identidades unificadas; commits hasta el corte, con merges / sin merges):**

| Integrante | Rol declarado (portada del .tex) | Identidades git | Commits |
|---|---|---|---|
| Castro López Pedro Leonardo | Arquitecto y líder | `LEO23as <pcastrol@>` (139), `Castro Lopez Pedro <pcastrol@>` (37), `leonardo castro lopez <…+LEO23as@users.noreply>` (24), `Asosanta Lucia <pcastrol@iteq.edu.ec>` (1, «Initial commit» del 25/05) | 201 / 171 |
| Luna Mora Ernesto Gregory | Secretaría y calidad | `Ernesto835 <elunam4@>` (190), `Ernesto835 <ernesto835@example.com>` (2) | 192 / 144 |
| Bedón Viteri Keyla Betzabe | Docente y app móvil | `BedonViteri <kbedonv@>` (153), `Keyla Bedon <kbedonv@>` (11) | 164 / 114 |
| Emanuel Pino Juliana Romina | Soporte y observabilidad | `Juliana Emanuel <jemanuelp@>` (105), `JulianaEmanuel <jemanuelp@>` (35) | 140 / 121 |
| *(identidad mixta)* | — | `Juliana Emanuel <elunam4@uteq.edu.ec>` (23; nombre de Emanuel con el correo de Luna, ver §7 Notas) | 23 / 22 |

Los cuatro integrantes rinden el examen suspenso.

**Etiquetas.** Hay dos y **ambas son ligeras**: `git cat-file -t` devuelve `commit`, no `tag`.

| Etiqueta | Commit | Fecha | ¿Cuenta? |
|---|---|---|---|
| `pre-e4` | `00cc927b` | 26/08/2026 19:59 | Existe al corte, pero es ligera y no marca el cierre |
| `v1.0.0` | `9941f993` | 15/09/2026 21:43 | **No**: es posterior al corte y ese commit no es alcanzable desde `78b0d175` |

**Ramas al corte.** Quedan 6 commits sin fusionar anteriores al corte: `fix/cobertura-e8` (1), `fix/secretaria-longitud-claves` (4) y `hotfix/flyway-arranque` (1). Todos son equivalentes a squash-merges que sí entraron (`git cherry` marca `-` y el contenido de los archivos coincide con el corte). **Los 29 commits sin fusionar del 12/09 se integraron.** `Juliana-Emanuel` (26) y `devBedon` (23) solo tienen trabajo posterior al corte.

## 2. Tabla de los 20 entregables

| # | Entregable | Estado propio | Estado efectivo | % |
|---|---|---|---|---|
| 1 | Identificación y URL | Por modificar | Por modificar | 70 |
| 2 | Estructura y archivos de raíz (incl. secretos) | Por culminar | Por culminar | 40 |
| 3 | Línea base congelada e integración | Por culminar | Por culminar | 25 |
| 4 | Backend en capas y SOLID | Por modificar | Por modificar | 50 |
| 5 | Patrones GoF y ADR | Por culminar | Por culminar | 30 |
| 6 | Aplicación web funcional | Por modificar | Por modificar | 55 |
| 7 | Calidad de la aplicación web | Por culminar | Por culminar | 20 |
| 8 | Aplicación móvil funcional | Por modificar | Por modificar | 70 |
| 9 | Calidad de la aplicación móvil | Por culminar | Por culminar | 35 |
| 10 | Integración y contratos | Por culminar | Por culminar | 30 |
| 11 | Persistencia distribuida | Por culminar | Por culminar | 25 |
| 12 | Pirámide de pruebas | Por culminar | Por culminar | 35 |
| 13 | Pipeline CI/CD | Por modificar | Por modificar | 60 |
| 14 | Observabilidad | Por culminar | Por culminar | 40 |
| 15 | Protocolo y campaña experimental | Por culminar | Por culminar | 25 |
| 16 | Paquete de datos y reproducibilidad | Por culminar | Por culminar | 35 |
| 17 | Evaluación ISO/IEC 25010 | Por culminar | Por culminar | 20 |
| 18 | Manuscrito, bibliografía y trazabilidad | Por modificar | Por culminar | 55 |
| 19 | Amenazas a la validez y ética | Por modificar | Por modificar | 50 |
| 20 | Trabajo en equipo y autoría | Por culminar | Por culminar | 35 |

Ningún entregable llega a Hecho. De los 17 pendientes del 12/09, al corte quedan así:
- **Cerrados:** E17 (finales de línea: 38 CSV y 0 con CR), E12 (`npm ci` con lockfiles sincronizados en las 4 interfaces) y E15 (sonda de salud con `|| exit 1`).
- **Resuelto casi por completo:** E9 (commits sin fusionar), que sigue abierto por la revisión cruzada.
- **Mejorados pero abiertos:**
  - E1, E3, E4, E6, E7, E8, E10, E13 y E16.
  - E11: `locust==2.46.4` solo aparece en `microservicio-soporte/requirements-load.txt`; ningún guion lo referencia y CI no lo instala.
  - E14: se publican las 5 imágenes, pero volvió el paso duplicado de Secretaría.
- **Prácticamente sin cambios:** E5.

Además, la re-verificación **degrada** cuatro elementos que el 12/09 figuraban como Hecho:
- Patrones GoF: 4 de 5 son placebo.
- Persistencia distribuida: no hay clúster.
- Aplicación web: JWT en localStorage y afirmaciones falsas en el manuscrito.
- Higiene del repositorio: hay credenciales en un PDF versionado, un respaldo SQL con datos personales, logs y 823 informes de cobertura.

---

## 3. Entregables no Hecho

### §1 Identificación y URL

**Qué encontré**
- Al corte no aparece en ningún archivo la URL del propietario actual (`gleiston-guerrero/acadtrace`). `LEO23as/acadtrace` figura en 9 lugares:
  - `README.md:63`
  - `CITATION.cff:23-24`
  - `Informe-E4_BCEL/TA-PFC-E4_BCEL.tex:121` (portada), `:885` y `:901`
  - `docs/api/openapi.yaml:11`
  - `docs/seguridad/gestion_rotacion_secretos.md:56`
  - `.github/workflows/ci-cd.yml:573` (el despliegue clona ese repositorio)
  - `docs/bitacora.md:6`, que además apunta a `LEO23as/sga-sistema-distribuido`
- `CITATION.cff`:
  - Empieza con BOM.
  - El correo de Castro es `pcastro@uteq.edu.ec`, cuando en git usa `pcastrol@`.
  - Declara `version: 4.0.0` y `date-released: 2026-09-04`, pero no existe ninguna etiqueta que corresponda.
  - No indica roles.
- Los roles de los integrantes solo aparecen en la portada del `.tex` (líneas 108-112). El README no tiene sección de integrantes.

**Cómo debe quedar.** Una sola URL canónica (`https://github.com/gleiston-guerrero/acadtrace`) en README, CITATION.cff, portada y cuerpo del manuscrito, OpenAPI y CI. En CITATION.cff y README: los cuatro integrantes con nombre completo, correo institucional correcto y rol, y una versión que coincida con una etiqueta anotada.

**Qué deben hacer**
1. `git grep -n "LEO23as/"` y sustituir las 9 apariciones. En `ci-cd.yml:573`, clonar la URL canónica.
2. Corregir el correo, quitar el BOM y ajustar `version` y `date-released` a la etiqueta de cierre (§3).
3. Añadir en el README una tabla «Integrantes y roles».

**Cómo lo verifico**
- `git grep -n "LEO23as/" <tag>` debe devolver 0 líneas.
- `git grep -c "gleiston-guerrero/acadtrace" <tag> -- README.md CITATION.cff Informe-E4_BCEL/TA-PFC-E4_BCEL.tex` debe dar ≥1 en cada archivo.
- `head -c3 CITATION.cff | xxd` no debe mostrar `efbbbf`.

**Estimación.** P1 · C1 · A2 · T1
- P1: es una sustitución mecánica.
- C1: no exige conocimiento técnico.
- A2: toca 7 archivos.
- T1: menos de 2 horas.

---

### §2 Estructura del repositorio y archivos de raíz

#### §2a Secretos y datos sensibles (E1 del 12/09)

**Qué encontré**

*Lo que corrigieron entre el 12/09 y el corte:*
- `.gitleaks.toml` quedó en `useDefault = true` sin allowlist. El PR #106 (`8c3e3b83`) borró 17 líneas de la allowlist y `.gitleaksignore`.
- Los `application.properties` de Principal y Soporte usan `${VAR}` sin valor por defecto.

*Lo que sigue abierto al corte:*

1. **Credenciales en claro dentro del árbol, en un PDF que ningún detector de texto inspecciona.** `pdftotext docs/pdf/MANUAL_MAESTRO_COMANDOS_OPERACIONES_SGA.pdf` (commit `3c6a0aea`, 25/08, Castro), línea 14, contiene:
   - La orden SSH con el nombre de la clave `.pem` y la IP pública del servidor EC2 (`16.59.…`).
   - Usuario y contraseña de un director y de un representante (`Password…!`).
   - **La contraseña de PostgreSQL** (`SgaProvU…Db`), la misma que el documento de rotación declara «rotada».

   El 12/09 se dio por «árbol limpio» porque el PDF no se había inspeccionado.

2. **El historial no se purgó.** `4e6fcf14` (12/09, alcanzable desde el corte) tiene en `.gitleaks.toml` los cuatro valores reales: secreto JWT, contraseña de BD, clave AES y token gRPC. Con `git grep -F <valor> $(git rev-list 78b0d175)`:
   - Secreto JWT: en 60 commits.
   - Contraseña de BD: en 21.
   - Clave AES: en 26, incluidos `ci-cd.yml` y `SecretariaContainerIntegrationTest.java`.
   - `dev-token-123`: en 29.

   No hay ninguna reescritura de historial. Las variantes `***REMOVED***` de `a20f960a` conviven con los originales `4e6fcf14` y `8af5e238`.

3. **Nuevo secreto introducido después del 12/09.** `sga-principal/src/main/resources/db/migration/V18__…sql:18`: `CREATE ROLE sga_app WITH LOGIN PASSWORD 'sga_app_…_2026'` (commit `f8ee2d0c`, 13/09, Luna). La misma contraseña se repite en dos pruebas.

4. **No es fail-fast, al contrario de lo que afirma `docs/seguridad/gestion_rotacion_secretos.md`.**
   - `microservicio-secretaria/backend/src/main/resources/application.properties:9,13,16,21` define valores de reserva: `${JWT_SECRET:***REMOVED-JWT-SECRET-MINIMO-32-CARACTERES***}`, igual para AES, BD y token gRPC.
   - Los introdujo `309237b7` (#114, Castro), con el mensaje «ampliar longitud de claves de reemplazo a 32 caracteres para evitar crash de jjwt».
   - Si falta la variable, el servicio arranca firmando JWT con una clave pública conocida.
   - El mismo archivo fija `db.host=${DB_HOST:3.23.195.43}`, `db.user=postgres` y `CORS_ORIGIN:*`.
   - `36ac78a7` (13/09) quitó además los `:?` obligatorios de `docker-compose.yml`.

5. **Puerta trasera en la interfaz de Secretaría.** `microservicio-secretaria/client/src/pages/Login.jsx:74-87,238-244`: un botón visible, «Ingresar con los 4 Roles», guarda en `localStorage` un token fijo `dev-token-secretaria-2026` con los roles DIRECTOR, SECRETARIA, DOCENTE y SOPORTE_TECNICO. No está condicionado a `import.meta.env.DEV`. **El backend lo acepta.** `microservicio-secretaria/backend/src/main/java/ec/uteq/sga/secretaria/infrastructure/security/JwtAuthFilter.java:56-57` hace `if (token.startsWith("dev-token")) user = new AuthenticatedUser("secretaria", List.of("SECRETARIA","DIRECTOR"))`: **cualquier petición con `Authorization: Bearer dev-token…` obtiene los roles de secretaría y directivo** sin firma ni perfil de desarrollo. Lo introdujo `2f333b74` (24/08, Luna), y gitleaks no lo detecta. Además, la API de calificaciones de Docente (`docentes/views.py:217`, `CalificacionViewSet`) no tiene `permission_classes` (§10).

6. **Posibles datos personales.** `scripts/backups/backup_pre_seed_20260806_135036.sql` (485 545 B, `81d447c9`, 06/08, Castro) contiene `COPY sga_principal.estudiantes`:
   - 677 filas con cédula, nombres, apellidos y correos (96 distintos).
   - 21 hashes bcrypt de `usuarios`.
   - De los 696 números de 10 dígitos, **637 superan la validación del dígito verificador de la cédula ecuatoriana**, con prefijos repartidos entre provincias (09: 85, 12: 41, 13: 36, …).

   No pude determinar si son reales o generados con un generador que respete el dígito. El manuscrito (`.tex:941`) afirma que todos los datos son sintéticos para proteger a menores.

7. **IPs públicas de infraestructura en 24 archivos**, entre ellos `.env.example:10`, `docker-compose.yml` (6 veces), `Constants.kt:5,8`, `openapi.yaml:16` y `settings.py:63`.

8. **Deficiencias del escaneo en CI.** El job `secret-scan` (`ci-cd.yml:27-38`) usa `gitleaks-action@v2` con `fetch-depth: 0`:
   - En eventos `push` y `pull_request` solo escanea el rango de commits del evento, no el historial completo.
   - **Ningún job depende de él** (`needs` de `build-images` e `integration` no lo incluye), así que no bloquea la publicación ni el despliegue.

**Cómo debe quedar**
- Ninguna credencial, contraseña ni clave en el árbol, incluidos PDF, PPTX y SQL. Ningún valor de reserva para secretos en `*.properties` y compose.
- Rol de BD con contraseña inyectada, no literal.
- Historial reescrito con `git filter-repo`, o bien una declaración formal, con evidencia, de que las cuatro credenciales y la de `sga_app` se rotaron en el servidor.
- `secret-scan` con `gitleaks detect --log-opts="--all"` sobre el historial completo, dentro de `needs` de `build-images`.
- Botón de acceso de desarrollo eliminado o condicionado a `import.meta.env.DEV`.
- Respaldo SQL retirado y purgado del historial.

**Qué deben hacer**
1. `git rm docs/pdf/MANUAL_MAESTRO_COMANDOS_OPERACIONES_SGA.pdf scripts/backups/backup_pre_seed_20260806_135036.sql`, y revisar `docs/defensa/*.pdf|pptx` con `pdftotext` y `unzip -p`.
2. Rotar la contraseña de BD, las contraseñas de las cuentas publicadas y la clave SSH. Documentar la fecha de rotación con evidencia (captura de `ALTER ROLE … PASSWORD` sin mostrar el valor).
3. `git filter-repo --replace-text secretos.txt --path scripts/backups --invert-paths`, y luego `push --force` coordinado.
4. En `microservicio-secretaria/.../application.properties`, quitar todos los `:valor` de secretos. En V18, `CREATE ROLE sga_app LOGIN` sin contraseña y `ALTER ROLE … PASSWORD` desde un placeholder de Flyway (`${sga_app_password}`).
5. Eliminar la rama `startsWith("dev-token")` de `JwtAuthFilter.java`, y eliminar `handleDevBypass` y su botón, o condicionarlo a `import.meta.env.DEV` con un backend de desarrollo separado. Añadir `permission_classes` a los ViewSet de Docente.
6. Añadir `secret-scan` a los `needs` de `build-images`.

**Cómo lo verifico**
- `git grep -n -I -E "PASSWORD '[^$]|:\*\*\*REMOVED|dev-token|Pass: " <tag> -- ':!*.md'` debe dar 0.
- `curl -s -o /dev/null -w "%{http_code}" -H "Authorization: Bearer dev-token-x" http://<host>:5176/api/secretario/reportes` debe dar 401.
- `for f in $(git ls-files '*.pdf'); do pdftotext "$f" - | grep -ciE "pass:|password|\.pem"; done` debe dar 0 en todos.
- `gitleaks detect --source . --log-opts="--all"` debe dar 0 hallazgos.
- `git log --all -S "SgaProvU" --oneline | wc -l` debe dar 0.
- `grep -n "secret-scan" .github/workflows/ci-cd.yml` debe aparecer dentro de un bloque `needs`.

**Estimación.** P3 · C3 · A3 · T3
- P3: exige criterio de gestión de secretos y de datos personales.
- C3: reescribir el historial es delicado y afecta a todas las ramas.
- A3: toca unos 8 archivos, más el historial y el servidor.
- T3: entre 6 y 15 horas, contando rotación y coordinación.

#### §2b Artefactos y basura versionada

**Qué encontré** (tamaños obtenidos con `git ls-tree -r -l 78b0d175`)
- `docs/cobertura/`: 823 archivos, 13,0 MB de informes HTML de JaCoCo y coverage.py. Además hay una copia en `microservicio-secretaria/docs/cobertura/`, con 239 archivos bajo `microservicio-secretaria/docs`.
- Logs: `sga-principal/build.log` (451 170 B), `maven-debug.log` (217 500 B), `backend.log` (1 852 B) y `microservicio-docente/server.{err,out}.log` (0 B). `.gitignore` ya contiene `*.log`, pero estos archivos siguen en el índice.
- `sga-principal/uploads/fotos/*`: 2 fotos, 912 262 B.
- Dos APK debug: `release/apk/app-representante-debug.apk` (19 992 081 B) y `evidencias/Bedon/app-movil/08-E14-artefacto-apk/app-debug.apk` (20 781 337 B).
- `package-lock.json` en la raíz con 102 B (`"packages": {}`) y sin `package.json` que lo acompañe.
- Presentaciones de defensa: `.pptx` y `.pdf`.
- 18 rutas de `evidencias/` con espacios y rayas, por ejemplo `evidencias/Pedro_Castro/E1 — Secretos/`.
- Dos protocolos casi idénticos (`docs/experimentos/protocolo-e4.md` y `experimentos/protocolo-e4.md`) y resultados duplicados en `docs/experimentos/resultados` y `experimentos/resultados`.
- `ops/grafana/pfc-dashboard.json` es distinto de `infra/grafana/dashboards/pfc-dashboard.json`.
- **No hay `CHANGELOG`** (se trata en §3).

**Cómo debe quedar.** Ningún informe generado, log, upload, APK duplicado ni lockfile huérfano en el índice. Un único juego de protocolo, resultados y dashboard. Rutas de evidencias sin espacios. La estructura del Listado 3 mapeada en el README (el mapa existe, ver §12c).

**Qué deben hacer**
1. `git rm -r --cached docs/cobertura microservicio-secretaria/docs/cobertura sga-principal/*.log microservicio-docente/*.log sga-principal/uploads package-lock.json evidencias/Bedon/app-movil/08-E14-artefacto-apk/app-debug.apk`.
2. Añadir a `.gitignore` `docs/cobertura/`, `uploads/` y `*.apk` (salvo `release/`).
3. Dejar un solo `protocolo-e4.md`, una sola carpeta de resultados y un solo dashboard, y actualizar las referencias.
4. Renombrar las carpetas de `evidencias/` a ASCII sin espacios.

**Cómo lo verifico**
- `git ls-files | grep -cE "\.log$|docs/cobertura/|uploads/"` debe dar 0.
- `git ls-files '*.apk' | wc -l` debe dar ≤1.
- `git ls-files | grep -c " "` debe dar 0.
- `test -f package-lock.json` debe fallar.

**Estimación.** P1 · C1 · A3 · T2
- P1 y C1: son operaciones de índice.
- A3: afecta a más de mil rutas y a las referencias del informe.
- T2: entre 2 y 6 horas, sobre todo por actualizar rutas en el `.tex` y el README.

#### §2c `.env.example` desalineado

**Qué encontré**
- `docker-compose.yml:242` exige `${GRAFANA_ADMIN_PASSWORD:?}`, pero `.env.example` define `GF_SECURITY_ADMIN_PASSWORD`. Con la plantilla copiada, `docker compose up` falla.
- Faltan en la plantilla, aunque las usa el código o compose:
  - `MAIL_PASSWORD`, `FIREBASE_CREDENTIALS_PATH`, `ZIPKIN_ENDPOINT`, `CORS_ORIGIN`, `DB_SSL`, `UPLOADS_PATH`.
  - `VITE_API_URL` y `VITE_API_PRINCIPAL`.
- Además, `DB_HOST` apunta a la IP pública real.

**Cómo debe quedar.** `.env.example` contiene exactamente el conjunto de variables que referencian `docker-compose.yml`, los `application.properties`, `settings.py` y los `import.meta.env` de las SPA, con marcadores `change-me` y `DB_HOST=localhost`.

**Qué deben hacer.** Generar la lista con `grep -ohE '\$\{[A-Z_]+' docker-compose.yml */**/application.properties | sort -u` y `grep -ohE 'VITE_[A-Z_]+' -r */src`, y completar la plantilla.

**Cómo lo verifico.** `cp .env.example .env && docker compose config -q` debe terminar con código 0. Como verificación sin Docker: `comm -23 <(grep -ohE '\$\{[A-Z_]+' docker-compose.yml | tr -d '${' | sort -u) <(cut -d= -f1 .env.example | sort -u)` debe salir vacío.

**Estimación.** P1 · C1 · A1 · T1
- P1, C1 y A1: es un inventario de variables en un solo archivo.
- T1: menos de 2 horas.

---

### §3 Línea base congelada e integración

**Qué encontré**
- **No hay etiqueta anotada de cierre al corte.** `pre-e4` es ligera (26/08). `v1.0.0` es ligera y posterior (15/09, `9941f993`, no alcanzable desde el corte).
- **No existe `CHANGELOG`** (`ls CHANGELOG*` no encuentra nada).
- **Revisión cruzada inexistente.** API de GitHub, `GET /pulls/{n}/reviews`:
  - Los 26 PR fusionados entre el 12 y el 13/09 (#90–#119) tienen **0 revisiones** y 0 comentarios.
  - `merged_by` coincide con el autor en #105, #106, #108, #109, #110, #114, #115, #116, #117, #118 y #119. En los merges de GitHub del resto, el autor del commit de merge es el mismo autor del PR.
  - Los PR que el manuscrito cita como «validados por otro integrante» (#48, #51, #55, #58, #59, #60) tienen 0 revisiones y los fusionó su propio autor. El #58 lo abrió y fusionó Ernesto835, aunque la tabla lo atribuye a Keyla Bedón con validación de Pedro Castro.
- **No hay issues** en el repositorio (`GET /issues`: 0 issues que no sean PR). Ninguno de los 114 PR contiene `Closes|Fixes #n`. Aun así, `.tex:887-893` describe un flujo «formalizado previamente mediante un issue» con directivas de cierre.
- **Empujes directos a `main`:** 184 de los 271 commits de la primera línea. 45 son de septiembre, por ejemplo `9897647c` (12/09), `84742c44` y `194bbf8d`.
- **Una integración sin revisión dejó Secretaría sin configuración durante unas 17 horas.**
  - El merge `62933d72` (Juliana Emanuel, 12/09 23:07, entró por el PR #98 sin revisión) dejó `microservicio-secretaria/backend/src/main/resources/application.properties` en **0 bytes** (`git cat-file -s`: 2220 → 0).
  - Se restauró en `309237b7` (13/09 16:33), ya con valores de reserva inseguros (§2a).
  - Hubo un PR #113 «recuperar properties vitales borradas a 0 b» que se cerró sin fusionar.
- **Ramas.** Los 29 commits sin fusionar del 12/09 se integraron. Los 6 restantes al corte (`fix/cobertura-e8`, `fix/secretaria-longitud-claves`, `hotfix/flyway-arranque`) son duplicados de squash cuyo contenido ya está en `main`. Estas ramas deberían borrarse.

**Cómo debe quedar**
- Etiqueta **anotada** `v4.0.0` (o `e4-final`) sobre el último commit de `main`, con fecha de tagger anterior al corte de la próxima evaluación.
- `CHANGELOG.md` con entradas fechadas por versión (E1, E2, E3, E4).
- Protección de rama en `main`: PR obligatorio, al menos una aprobación de otro integrante y checks obligatorios.
- Todos los PR desde ahora con una revisión `APPROVED` de alguien distinto del autor, y el `.tex` sin afirmaciones de issues ni validaciones que no existen.

**Qué deben hacer**
1. Activar la protección de rama (Settings → Branches: *Require a pull request*, *Require approvals = 1*, *Require status checks*). El propietario ahora es el docente, así que deben pedirlo o documentar la regla.
2. Borrar las ramas residuales: `git push origin --delete fix/cobertura-e8 fix/secretaria-longitud-claves hotfix/flyway-arranque`.
3. Redactar `CHANGELOG.md` (formato Keep a Changelog) a partir de `git log --first-parent`.
4. Sustituir la tabla `tab:peer-review` del `.tex` por los datos reales de PR, autor, `merged_by` y aprobador, o eliminarla.
5. Al cierre: `git tag -a v4.0.0 -m "Cierre E4" <sha> && git push origin v4.0.0`.

**Cómo lo verifico**
- `git cat-file -t v4.0.0` debe dar `tag`.
- `git for-each-ref refs/tags/v4.0.0 --format='%(taggerdate:iso) %(object)'` debe mostrar un objeto igual a `git rev-parse main`.
- `test -f CHANGELOG.md && grep -cE "^## \[.*\] - 20[0-9]{2}-" CHANGELOG.md` debe dar ≥4.
- `curl -s https://api.github.com/repos/gleiston-guerrero/acadtrace/pulls/<n>/reviews` debe mostrar `state=APPROVED` y `user.login ≠ autor` en cada PR posterior.
- `git log --first-parent <tag> --since=<fecha> --format=%cn | grep -vc GitHub` debe dar 0.

**Estimación.** P2 · C1 · A2 · T2
- P2: exige disciplina de proceso más que conocimiento.
- C1: sin complejidad técnica.
- A2: CHANGELOG, ajustes del repositorio y una tabla del `.tex`.
- T2: entre 2 y 6 horas, más el tiempo de revisión en cada PR futuro.

---

### §4 Backend en capas y SOLID

**Qué encontré**

| Módulo | Archivos en `domain` | Con anotaciones JPA o Spring | Puertos en `domain` | Acoplamiento en `application` |
|---|---|---|---|---|
| `sga-principal` | 74 | **27**: 25 `@Entity`, 25 `@Table`, 207 `@Column`, 28 `import jakarta.persistence` y 2 `@Component` en `domain/strategy/Promedio*Strategy.java` | 0 (la única interfaz es `CalculoPromedioStrategy`) | 17 archivos importan `infrastructure` (39 imports); 25 `JpaRepository` en `infrastructure/repository` se usan directamente desde servicios |
| `microservicio-secretaria` | 23 (solo DTO) | 0 | 0; no hay entidades ni puertos | 15 servicios usan `JdbcTemplate` o SQL directamente |
| `microservicio-soporte` | 5 | 0 | 1 (`TicketRepositoryPort`, implementado por `JdbcTicketRepository`) ✔ | `TecnicoService` importa `infrastructure.grpc` |
| `microservicio-docente` (Django) | sin capa de dominio | — | 0 | 13 `models.Model`; `services.py` importa `django.db.models` |

Entre el 12/09 y el corte la situación **empeoró**: se añadió `domain/entity/EstadoCadenaAuditoria.java` con `@Entity`. La evaluación del 12/09 la había dado por Hecho; al re-verificar, el dominio de Principal no cumple «sin anotaciones de framework/JPA», y en ningún módulo salvo Soporte hay puertos en el dominio.

**Cómo debe quedar.** En al menos los dos servicios Java de negocio (Principal y Secretaría): paquete `domain` sin `jakarta.persistence` ni `org.springframework`, interfaces de repositorio (puertos) en `domain/port`, entidades JPA y adaptadores en `infrastructure/persistence` con mapeadores, y `application` que dependa solo de puertos. En Docente (Django), una capa `services` y puertos explícitos, y el ADR-001 que justifique la adaptación.

**Qué deben hacer**
1. Mover las 25 entidades de `sga-principal/.../domain/entity` a `infrastructure/persistence/entity` y crear modelos de dominio POJO.
2. Crear `domain/port/*RepositoryPort` e implementarlos en adaptadores que envuelvan los `JpaRepository`.
3. Sustituir en `application` los imports de `infrastructure` por los puertos.
4. Añadir una prueba ArchUnit: `noClasses().that().resideInAPackage("..domain..").should().dependOnClassesThat().resideInAnyPackage("jakarta.persistence..","org.springframework..")`.

**Cómo lo verifico**
- `grep -rlE "jakarta.persistence|org.springframework" sga-principal/src/main/java/ec/edu/uteq/sga/domain | wc -l` debe dar 0.
- `grep -rl "import ec.edu.uteq.sga.infrastructure" sga-principal/src/main/java/ec/edu/uteq/sga/application | wc -l` debe dar 0.
- `mvn -q test -Dtest=*Architecture*` debe pasar.

**Estimación.** P4 · C4 · A5 · T5
- P4: exige diseño hexagonal real con mapeadores.
- C4: puede romper consultas JPA y gRPC existentes.
- A5: toca más de 100 archivos entre dos módulos.
- T5: más de 30 horas.

---

### §5 Patrones GoF y ADR

**Qué encontré.** Hay 5 patrones exigidos por la Tabla 1. **Cuatro son placebo: las clases existen y nadie las invoca.** Lo comprobé con `grep -rl <Clase> --include=*.java --include=*.kt --include=*.py`, excluyendo el propio archivo.

| Patrón | Clase | Llamadores fuera de su archivo | Veredicto |
|---|---|---|---|
| Facade (portal) | `application/facade/PortalAcademicoFacade` | **0** | Placebo |
| Template Method (reportes) | `application/report/GeneradorReporteAcademicoTemplate` y `ReporteNotasPeriodoPDF` | Solo la subclase; `ReporteNotasPeriodoPDF` tiene **0** llamadores y genera texto, no PDF | Placebo |
| Observer (notificaciones) | `NotaPublicadaEvent` y `NotificacionRepresentanteListener` | Solo lo publica la fachada, que no tiene llamadores; el listener solo escribe un log («Simulación del despacho») | Placebo. El push real (`docentes/notifications.py` → `PushNotificationService` → FCM) no sigue el patrón |
| Strategy (promedio) | `CalculoPromedioStrategy` con dos implementaciones | Solo la fachada muerta; el promedio real está fijo en código en `microservicio-docente/docentes/services.py:45-140` (70/30) | Placebo |
| Repository | 25 `JpaRepository` | Uso real | Real |

Fuera de la Tabla 1, el Strategy de auditoría en Python (`docentes/auditoria/strategies.py:168`) es real.

**ADR-005:**
- Cita `CalificacionService` y `CalificacionRepository`, que no existen.
- Solo tiene consecuencias positivas y ninguna alternativa.
- El ADR es del 24/08 (`8fe19d76`); las clases llegaron aisladas el 31/08 (`2d72bd27`).

**ADR-006:**
- Tiene formato Nygard y alternativas.
- Sus cifras son internas (minSdk, número de archivos, tamaño del APK) y no tienen fuente externa. La comparación con Flutter y React Native es cualitativa.
- Está desactualizado: la línea 27 dice «No se integra FCM», pero FCM está desde `d7c506eb` (09/09); habla de «36 pruebas JVM» y hay 62 `@Test`.

Esta pieza figuraba como Hecho el 12/09. Al re-verificar no alcanza el mínimo de 5 patrones reales.

**Cómo debe quedar**
- Los cinco patrones de la Tabla 1 en flujos que ejecuta un endpoint real, cada uno con al menos una prueba que lo recorra:
  - Controlador de portal → `PortalAcademicoFacade`.
  - Cálculo de promedio seleccionable por `CalculoPromedioStrategy` según la configuración del año lectivo.
  - Reporte por período generado mediante la plantilla (`generarReporte` final con pasos abstractos).
  - Publicación de `NotaPublicadaEvent` desde el registro real de calificaciones, con un listener que invoque el servicio de push.
- ADR-005 con rutas verificables, alternativas y consecuencias negativas.
- ADR-006 con al menos 2 criterios cuantitativos con fuente citada.

**Qué deben hacer**
1. Inyectar `PortalAcademicoFacade` en un controlador REST (p. ej. `CalificacionesController`) y enrutar por ella el registro de calificación.
2. Seleccionar la estrategia de promedio por la configuración de `ConfiguracionCalificacion` y usarla en el cálculo real, o mover el cálculo de Docente a Principal.
3. Exponer `GET /api/reportes/periodo/{id}` que use `ReporteNotasPeriodoPDF`, generando PDF de verdad.
4. Hacer que `NotificacionRepresentanteListener` llame a `PushNotificationService`.
5. Escribir una prueba de integración por patrón.
6. Reescribir ADR-005 y actualizar ADR-006.

**Cómo lo verifico**
- `for c in PortalAcademicoFacade ReporteNotasPeriodoPDF CalculoPromedioStrategy NotaPublicadaEvent; do grep -rl $c sga-principal/src/main/java | grep -v "/$c.java" | grep -c -i "controller\|service"; done` debe dar ≥1 en cada caso.
- `mvn -q test -Dtest='*Facade*,*Strategy*,*Reporte*,*Notificacion*'` debe pasar.
- `grep -c "CalificacionRepository" docs/adr/ADR-005-patrones-gof.md` debe dar 0 si la clase no existe.

**Estimación.** P3 · C3 · A3 · T4
- P3: exige aplicar los patrones a flujos existentes.
- C3: integra Principal con Docente y FCM.
- A3: entre 10 y 15 archivos, más los ADR.
- T4: entre 15 y 30 horas.

---

### §6 Aplicación web funcional

**Qué encontré**
- **Rutas** (`sga-principal/sga-frontend/src/App.jsx:35-39`): existen `/`, `/login`, `/settings` y `/about`; **`/main` no existe** (`grep -rn "/main" src` da 0). Las SPA de Secretaría, Docente y Soporte tampoco tienen el conjunto.
- **JWT en `localStorage` plano en las 4 SPA**, justo lo que la guía prohíbe. Por ejemplo `sga-frontend/src/pages/login/Login.jsx:43,65`, `components/ProtectedRoute.jsx:4`, `secretaria/client/src/App.jsx:28` y `docente/frontend/src/services/api.js:15`. `ProtectedRoute` solo comprueba que haya un token; no valida `exp`.
- **El manuscrito afirma lo contrario** (`.tex:541-543`): sin localStorage, cookies HttpOnly y SameSite, validación de firma y `ThemeLanguageContext` con `es.json`/`en.json`. Todo es falso. `.tex:511` dice «React + TypeScript»: en `sga-frontend/src` hay 33 `.jsx`, 4 `.js`, 0 `.ts`/`.tsx` y ningún `tsconfig`.
- **i18n y tema:** i18n es/en con `I18nContext.jsx` y `ThemeContext` en sga-frontend y Secretaría; no existen en Docente ni Soporte. Hay estados de carga en 16 páginas de sga-frontend.
- **Llamadas que saltan el gateway:**
  - `Calificaciones.jsx:118` (sga-frontend y Secretaría): `fetch("http://16.59.242.157:8084/api/ia/diagnostico-estudiante")`. HTTP, IP fija y **sin cabecera Authorization**, enviando notas de estudiantes a un servicio que llama a Gemini.
  - `secretaria/client/src/pages/Reportes.jsx:34`: `http://localhost:3000/...`, puerto equivocado.
- **Portal directivo:** no hay SPA propia; el rol DIRECTOR reutiliza el portal de administración. Hay reportes por período solo en Secretaría (libreta por `idPeriodo`).

Figuraba como Hecho («cuatro interfaces») el 12/09. Los defectos anteriores ya existían y no se habían inspeccionado.

**Cómo debe quedar.** Una SPA canónica (sga-frontend) con:
- Las cinco rutas, `/main` incluida.
- Rutas protegidas que validen la expiración.
- Token en memoria, `sessionStorage` con expiración, o cookie HttpOnly emitida por el backend.
- i18n y tema.
- Todas las llamadas por el gateway con Authorization.
- Portal de directivo con reporte por período.
- El manuscrito describiendo exactamente eso.

**Qué deben hacer**
1. Añadir la ruta `/main` (panel del rol) en `App.jsx`.
2. Crear `authStore` en memoria con refresco, o cookie HttpOnly desde `AuthController`. Sustituir las 77 lecturas de `localStorage` en sga-frontend.
3. Validar `exp` con `jwt-decode` en `ProtectedRoute`.
4. Enrutar IA por HAProxy (`/api/ia`) con JWT, y corregir `Reportes.jsx:34`.
5. Añadir una vista de directivo con un reporte por período.
6. Corregir `.tex:511,541-543`.

**Cómo lo verifico**
- `grep -rn "localStorage.*token" sga-principal/sga-frontend/src | wc -l` debe dar 0.
- `grep -n 'path="/main"' sga-principal/sga-frontend/src/App.jsx` debe encontrar la ruta.
- `grep -rn "16.59.242.157\|localhost:3000" */client/src */sga-frontend/src | wc -l` debe dar 0.
- `grep -c "HttpOnly" Informe-E4_BCEL/TA-PFC-E4_BCEL.tex` debe corresponderse con `grep -rn "HttpOnly" sga-principal/src/main/java`.

**Estimación.** P3 · C3 · A4 · T4
- P3: exige conocer seguridad de sesiones.
- C3: el cambio de almacenamiento afecta a todas las llamadas.
- A4: unos 40 archivos JSX y el backend de autenticación.
- T4: entre 15 y 30 horas.

---

### §7 Calidad de la aplicación web

**Qué encontré**
- **Sin TypeScript:** las 4 interfaces son JavaScript puro. sga-frontend tiene 37 archivos `.jsx`/`.js`, Secretaría 18, Docente 10 y Soporte 34. No hay ningún `.ts`/`.tsx` ni `tsconfig`.
- **Lint en rojo y fuera de CI:**
  - `npx eslint .` en `sga-principal/sga-frontend` da **63 problemas (54 errores, 9 avisos)** y sale con código 1.
  - `npx oxlint` en Docente da 13 avisos y 0 errores.
  - Secretaría (`client`) no tiene script de lint.
  - El job `lint` (`ci-cd.yml:95`) no ejecuta ESLint ni oxlint; solo `flake8 --select=E9,F63,F7,F82` sobre Python.
- **Sin pruebas unitarias ni cobertura web:** no hay vitest ni jest configurado ni ninguna configuración `coverage` en las 4 interfaces. El único archivo de prueba es `docente/frontend/src/pages/asistencia/asistenciaFechas.test.js`, que ningún script ejecuta. `test-web` (`ci-cd.yml:299`) solo hace `npm ci` y `npm run build`.
- **Dockerfile:**
  - sga-frontend y docente-frontend **no tienen Dockerfile**. En `docker-compose.yml:188-219` corren con `node:20-alpine` y `npm install && npm run dev`, es decir, servidor de desarrollo en producción.
  - Solo los frontends empaquetados dentro de los backends de Secretaría y Soporte tienen construcción multi-stage.
- **Lo que está bien:** `test-web` publica `web-dist-sha-${{ github.sha }}` (tar.gz de las 4 carpetas `dist`, `ci-cd.yml:336-345`) con nombres de recursos con hash de Vite, y usa `npm ci` con lockfiles sincronizados en las 4 interfaces (E12 cerrado por `d835e46b`). No publica el checksum del tar, y 3 de los 4 `npm ci` usan `--legacy-peer-deps`.

**Cómo debe quedar.** Una SPA canónica (sga-frontend) con:
- TypeScript `strict: true` y `tsc --noEmit` en verde.
- ESLint con 0 errores ejecutado en el job `lint` y capaz de fallar.
- Vitest con Testing Library y cobertura ≥70 % de líneas sobre `src/**` completo (sin `include` a conveniencia; solo se excluyen `main.tsx` y los tipos), con `coverage.thresholds` que haga fallar `test-web`.
- Dockerfile multi-stage (`node` para construir, `nginx:alpine` para servir) para cada SPA desplegada, usado en compose y en `build-images`.
- Artefacto `dist` con su `sha256sum` publicado.

**Qué deben hacer**
1. `npx tsc --init --strict`, renombrar `.jsx` a `.tsx` y tipar props y servicios. Como mínimo en sga-frontend; declarar las otras SPA como secundarias o migrarlas también.
2. Corregir los 54 errores de ESLint y añadir `npm run lint` en cada interfaz dentro del job `lint`.
3. `npm i -D vitest @vitest/coverage-v8 @testing-library/react jsdom`, con `vite.config` `test.coverage.thresholds.lines: 70` y `include: ['src/**']`. Escribir pruebas de `ProtectedRoute`, `Login`, contextos de i18n y tema, y servicios.
4. Crear `sga-principal/sga-frontend/Dockerfile` y `microservicio-docente/frontend/Dockerfile` multi-stage con nginx, y cambiar compose para usarlos.
5. En `test-web`: `npm run test -- --coverage` y `sha256sum web-dist.tar.gz > web-dist.sha256`.

**Cómo lo verifico**
- `git ls-files 'sga-principal/sga-frontend/src/*.tsx' | wc -l` debe dar ≥30.
- `grep -n '"strict": true' sga-principal/sga-frontend/tsconfig.json` debe encontrar la opción.
- `cd sga-principal/sga-frontend && npm ci && npx tsc --noEmit && npx eslint . && npx vitest run --coverage` debe terminar con código 0.
- `grep -n "thresholds" sga-principal/sga-frontend/vite.config.*` debe encontrar la configuración.
- `grep -c "^FROM" sga-principal/sga-frontend/Dockerfile` debe dar ≥2.
- `grep -n "eslint\|vitest" .github/workflows/ci-cd.yml` debe encontrar ambos pasos.

**Estimación.** P3 · C3 · A4 · T4
- P3: exige conocer TypeScript y pruebas de componentes.
- C3: la migración de tipos toca todo el código.
- A4: unos 40 archivos, Dockerfile, compose y CI.
- T4: entre 15 y 30 horas.

---

### §8 Aplicación móvil funcional

**Qué encontré.** Rutas bajo `app-movil-docente/app/src/main/java/ec/edu/uteq/sga/representante/`.

*Lo que cumple:*
- Login restringido al rol REPRESENTANTE.
- Listado de representados, detalle (resumen, calificaciones y asistencia) y comunicados (`ui/navigation/NavGraph.kt:28-82`, `RepresentanteScreens.kt:31-40`).
- Modo sin conexión con caché Room (`RepresentanteRepositoryImpl.kt:20-82`, `isOffline=true`) y `SyncWorker`.
- JWT en `EncryptedSharedPreferences` con `MasterKey` AES256_GCM (`core/SessionManager.kt:20-30`).
- `BiometricPrompt` en una pantalla navegable (`SecurityScreens.kt:34`, `NavGraph.kt:35-57`).
- `SgaFirebaseMessagingService` registrado (`AndroidManifest.xml:23-29`).

*Lo que no cumple:*
- **No hay pull-to-refresh** (`grep -rn "pullRefresh|PullToRefresh|SwipeRefresh" app/src` da 0; solo un botón «Reintentar» en `CommonUi.kt:256`).
- **Push FCM no operativo con el repositorio tal cual:** `google-services.json` no está versionado (el plugin se aplica condicionalmente en `build.gradle.kts:12-14`) y el backend tiene `app.firebase.enabled:false`.
- URL base fija en `http://16.59.242.157:8080/api/` (`Constants.kt:5`) con `usesCleartextTraffic="true"` (`AndroidManifest.xml:20`).

**Cómo debe quedar.** Pull-to-refresh en el listado y en el detalle. Push demostrable, con instrucciones para suministrar `google-services.json` fuera del repositorio y evidencia de recepción (captura y log del backend con `firebase.enabled=true`). URL base por `BuildConfig` y HTTPS o `network_security_config` limitado a desarrollo.

**Qué deben hacer**
1. Envolver las listas en `PullToRefreshBox` (Material3) llamando a `viewModel.refresh()`.
2. `buildConfigField("String","BASE_URL", …)` por *flavor*.
3. Documentar en `docs/notificaciones-fcm.md` cómo se configura y adjuntar evidencia fechada de un push recibido.

**Cómo lo verifico**
- `grep -rn "PullToRefresh" app-movil-docente/app/src/main | wc -l` debe dar ≥1.
- `grep -rn "16.59.242.157" app-movil-docente/app/src/main | wc -l` debe dar 0.
- `grep -n "usesCleartextTraffic" app-movil-docente/app/src/main/AndroidManifest.xml` debe dar 0 o limitarse a debug.

**Estimación.** P2 · C2 · A2 · T2
- P2 y C2: son patrones estándar de Compose.
- A2: unos 5 archivos.
- T2: entre 2 y 6 horas.

---

### §9 Calidad de la aplicación móvil

**Qué encontré**
- **Pruebas de ViewModel:** hay 62 `@Test` en `app/src/test` (10 archivos), pero solo `RepresentanteViewModelTest.kt` (10 pruebas) prueba un ViewModel, frente a 13 clases ViewModel. `LoginViewModel` no se prueba.
- **Prueba instrumentada:** `app/src/androidTest/.../RepresentanteUiTest.kt` es una sola prueba Compose que renderiza `HomeRepresentante`. No es E2E (no hay login, red ni navegación), y CI no ejecuta `connectedAndroidTest`.
- **APK versionado** `release/apk/app-representante-debug.apk`:
  - 19 992 081 B, commit `03216202` del 04/09.
  - Firmado con la clave de depuración: el bloque de firma v2/v3 contiene «Android Debug» y no hay `META-INF/*.RSA|EC`.
  - **Está desactualizado:** los 17 `classes*.dex` tienen 0 apariciones de `com/google/firebase/messaging` y de `SgaFirebaseMessagingService`, que entraron el 09/09.
- **Firma de release:** `build.gradle.kts:16-60` define `signingConfigs.release` condicionado a variables `SGA_RELEASE_*`. Al corte no había ningún release firmado (ADR-006:121 dice «PENDIENTE»). El release firmado es del 15/09 y no cuenta.
- **CI:** `build-mobile-apk` (`ci-cd.yml:520-552`) solo hace `assembleDebug` y lo sube como artefacto temporal (14 días).

**Cómo debe quedar.** Pruebas unitarias de al menos los ViewModels de login, listado, detalle y comunicados. Al menos una prueba instrumentada E2E (login → listado → detalle con `MockWebServer`) ejecutada en CI con un emulador (`reactivecircus/android-emulator-runner`). APK **release firmado** con una keystore guardada en secretos de CI, generado y publicado por CI (artefacto o Release de GitHub) con su SHA-256, y el mismo hash en `release/apk/`.

**Qué deben hacer**
1. Escribir `LoginViewModelTest`, `DetalleViewModelTest` y `ComunicadosViewModelTest` con `kotlinx-coroutines-test` y repositorios falsos.
2. Escribir `LoginFlowTest` en `androidTest` con `MockWebServer` y `createAndroidComposeRule`.
3. En CI: job `test-mobile-instrumented` con emulador, y `build-mobile-apk` con `assembleRelease` usando `SGA_RELEASE_*` desde secretos, `apksigner verify --print-certs` y `sha256sum` publicado.
4. Retirar el APK debug de `release/apk/`.

**Cómo lo verifico**
- `grep -rl "ViewModel" app-movil-docente/app/src/test | wc -l` debe dar ≥4.
- `grep -n "connectedAndroidTest\|android-emulator-runner" .github/workflows/ci-cd.yml` debe encontrar el paso.
- `apksigner verify --print-certs release/apk/*.apk | grep -v "Android Debug"` debe mostrar un certificado.
- `grep -n "assembleRelease" .github/workflows/ci-cd.yml` debe encontrar el paso.

**Estimación.** P3 · C3 · A3 · T3
- P3: pruebas instrumentadas y firma en CI.
- C3: configurar el emulador en Actions.
- A3: unos 8 archivos y el workflow.
- T3: entre 6 y 15 horas.

---

### §10 Integración y contratos

**Qué encontré**
- **Un único contrato Pact** en `microservicio-docente/tests/contract/test_docente_contract.py` (pact-python 3.4.0, especificación V4):
  - Tiene **1 sola interacción** (`GET /api/docente/calificaciones/?id_actividad=9`).
  - El «consumidor» `portal-docente` está escrito en Python dentro del propio proveedor, no en el código de la SPA.
  - La verificación del proveedor levanta la app Django real en un hilo, pero con `patch.object(CalificacionViewSet, "get_queryset", return_value=[calificacion])` (línea 56): sin base de datos y sin *provider states*.
  - Se ejecuta en `ci-docente` y en `test-backend` y estaba en verde al corte.
- **No hay contrato del cliente móvil** (`grep -rn pact app-movil-docente` da 0) ni de ninguna SPA JavaScript (`@pact-foundation/pact` no figura en ningún `package.json`). Tampoco hay contratos contra Principal ni Secretaría, que son las API que consume la app de representantes, ni broker.
- **`tests/contract/test_contracts.py`** (raíz) son comprobaciones estáticas con regex sobre `.proto` y `openapi.yaml`: no ejecutan ninguna interacción y no están en CI.
- **La misma API sirve a ambos clientes solo en parte:** la app móvil consume `http://16.59.242.157:8080/api/` (Principal) y `:8081/api/docente/` (`Constants.kt:5,8`), y la web sga-frontend usa Principal. Pero ningún contrato fija esas rutas.
- **Hallazgo relacionado de seguridad:** `CalificacionViewSet` (`docentes/views.py:217`) es un `ModelViewSet` **sin `permission_classes`**, y `settings.py` no define `DEFAULT_PERMISSION_CLASSES`. La API de calificaciones de Docente no exige autenticación y HAProxy la expone en :8081.

**Cómo debe quedar**
- Contratos generados por los **consumidores reales**: pruebas Pact-JS en sga-frontend sobre su módulo `services/api` y Pact-JVM (o un equivalente con `MockWebServer` que publique el JSON del pacto) en la app Kotlin sobre `RepresentanteApi`.
- Cubrir al menos login, listado de representados, calificaciones y asistencia.
- Verificación contra los proveedores reales (Principal y Docente) con *provider states* que siembren la base de datos de prueba (Testcontainers), no con `get_queryset` parcheado.
- Todo ejecutado en CI y en verde, con los pactos publicados como artefacto.

**Qué deben hacer**
1. sga-frontend: `npm i -D @pact-foundation/pact` y `src/services/__pact__/auth.pact.test.ts`, que genere `pacts/sga-frontend-sga-principal.json`.
2. Móvil: prueba en `app/src/test` con `au.com.dius.pact.consumer:junit5` sobre `RepresentanteApi`, que genere `pacts/app-representante-sga-principal.json`.
3. Principal: `PactVerificationSpringProviderTest` con `@PactFolder("pacts")`, `@State` que inserte datos vía repositorios y Testcontainers PostgreSQL con Flyway.
4. Docente: sustituir el `patch.object` por un `provider_states` que cree la actividad y la calificación en la base de datos de prueba.
5. Añadir `permission_classes = [IsAuthenticated]` (o la autenticación JWT interna) a `CalificacionViewSet`, y un pacto que cubra el 401.
6. Crear el job `contract-tests` en CI dentro de los `needs` de `build-images`.

**Cómo lo verifico**
- `ls pacts/*.json` debe listar ≥3 archivos (web→principal, móvil→principal, portal→docente).
- `grep -rn "patch.object" microservicio-docente/tests/contract | wc -l` debe dar 0.
- `grep -n "contract" .github/workflows/ci-cd.yml` debe aparecer dentro de `needs` de `build-images`.
- `cd sga-principal && mvn -q test -Dtest=*Pact*` debe pasar.
- `curl -s -o /dev/null -w "%{http_code}" http://<host>:8081/api/docente/calificaciones/` sin token debe dar 401.

**Estimación.** P3 · C4 · A4 · T4
- P3: exige conocer contratos dirigidos por el consumidor.
- C4: Pact en tres ecosistemas (JS, Kotlin y Java) con *provider states*.
- A4: 3 módulos más CI.
- T4: entre 15 y 30 horas.

---

### §11 Persistencia distribuida

**Qué encontré**
- **No hay clúster de base de datos en el repositorio.** `docker-compose.yml` (301 líneas) define 15 servicios y ninguno es de base de datos, con 0 `healthcheck`. Todos los servicios apuntan a un único PostgreSQL externo, `${DB_HOST:-3.23.195.43}:5433`. `sga-principal/docker-compose.yml` es un solo `postgres:17`.
- «cockroach» solo aparece en ADR-003:10, `referencias.bib` y un título de panel. El manuscrito afirma «tres instancias redundantes… Raft» (`.tex:322`) y particionado por rango (`.tex:325`), pero `grep -rn "PARTITION BY"` da 0.
- **La evidencia de tolerancia a fallos** (`Informe-E4_BCEL/evidencias/tolerancia/evidencia_tolerancia_20260811_081422.log`, 11/08) parece auténtica: 97 OK y 3 FAIL, coherente con `haproxy.cfg:59` `inter 3s fall 2`. Pero mide la conmutación de réplicas de **sga-principal detrás de HAProxy**, no la replicación ni la caída de un nodo de base de datos.
- **Migraciones:**
  - Flyway habilitado en Principal (`application.properties:19-24`, `baseline-version=8`), pero `docker-compose.yml:27` fija `SPRING_FLYWAY_VALIDATE_ON_MIGRATE=false` (desde `2c7aa196`, 12/09).
  - V13 se modificó después de aplicarse (`b0e7ef1c` 10/09 → `1a705faa` 12/09), lo que cambia el checksum.
  - Hay un hueco en V11 y dos `V5__` en `sga-principal/sql/`.
  - Secretaría no ejecuta Flyway y conserva una copia `007_trigger_auditoria_inmutable.sql` que nunca se aplica.
- **E6 (rol sin privilegios):** V18 crea `sga_app` con SELECT e INSERT sobre `auditoria` y REVOKE de UPDATE/DELETE/TRUNCATE. Pero:
  - Todos los servicios siguen conectándose como `postgres`: `docker-compose.yml:17,71,121,147`, `application.properties:9`, `settings.py:61`, `.env.example:13`, `ci-cd.yml:205`. `grep -rn sga_app` fuera de migraciones y pruebas da 0, así que la revocación no tiene efecto en ejecución.
  - V18:37 concede `DELETE ON ALL TABLES`, incluida `estado_cadena_auditoria`: se puede borrar la cabeza de la cadena.
- **E4 (disparador):** hay una prueba ejecutable real, `AuditoriaFlywayMigrationContainerTest` (`6e5be1d3`, 13/09), que aplica `classpath:db/migration` V9–V18 sobre `postgres:16-alpine` y comprueba el rechazo de UPDATE y DELETE. Tiene tres debilidades:
  - La base V1–V8 es un esquema de 64 líneas escrito a mano (`test/resources/db/init/baseline_flyway_v8.sql`).
  - Se omite sin fallar si no hay Docker (`disabledWithoutDocker=true`).
  - Depende del orden de ejecución de JUnit.

  `AuditoriaInmutabilidadTest:21` sigue condicionada a `RUN_DB_INTEGRATION_TESTS`, que no se define en ningún sitio. `SecretariaContainerIntegrationTest` desactiva Flyway (`:46`, `:102`) y traga los errores de `migrate()` en un `catch (Exception fe) {}` vacío (`:286-296`).

Figuraba como Hecho («Persistencia distribuida operando») el 12/09. Al re-verificar no hay evidencia versionada de replicación de la base de datos.

**Cómo debe quedar**
- Clúster reproducible en `docker-compose.yml`: 3 nodos CockroachDB con `cockroach init`, o PostgreSQL primario con réplica por *streaming* o Patroni. Con `healthcheck` en cada nodo y `depends_on: condition: service_healthy`.
- Migraciones Flyway aplicadas sobre el clúster con validación activa.
- Un guion de caída de nodo (`docker compose stop db2`) con verificación de continuidad de escrituras y de integridad de la cadena, y su log fechado versionado.
- Servicios conectados con un usuario de ejecución sin privilegios (`sga_app`), separado del usuario de migración.

**Qué deben hacer**
1. Añadir `db1`, `db2` y `db3` a compose con healthchecks, y `DB_HOST=haproxy-db` o el balanceador del clúster.
2. Eliminar `SPRING_FLYWAY_VALIDATE_ON_MIGRATE=false`. Recuperar el V13 original o crear V19 con el cambio, y ejecutar `flyway repair` documentado en la base desplegada.
3. Usar `spring.flyway.user=postgres` para migrar y `spring.datasource.username=sga_app` para ejecutar. Lo mismo en Django y Secretaría. En V18: `REVOKE DELETE ON estado_cadena_auditoria, flyway_schema_history FROM sga_app` y `ALTER DEFAULT PRIVILEGES`.
4. Crear `scripts/tolerancia_db.sh` y dejar el log en `evidencias/tolerancia/`.
5. Hacer que `AuditoriaFlywayMigrationContainerTest` falle si no hay Docker en CI (`disabledWithoutDocker=false`) y no dependa del orden (`@TestMethodOrder`). Eliminar o reparar `AuditoriaInmutabilidadTest` y quitar el `catch` vacío de Secretaría.

**Cómo lo verifico**
- `docker compose config --services | grep -cE "^db|cockroach"` debe dar ≥3.
- `grep -c healthcheck docker-compose.yml` debe dar ≥3.
- `grep -rn "VALIDATE_ON_MIGRATE=false" docker-compose.yml` debe dar 0.
- `grep -rn "DB_USER.*postgres" docker-compose.yml */**/application.properties .env.example` debe dar 0.
- `grep -rn "catch (Exception fe) {}" microservicio-secretaria` debe dar 0.
- `ls evidencias/tolerancia/*db*.log` con fecha anterior al commit que lo registra.

**Estimación.** P4 · C4 · A3 · T4
- P4: exige conocer replicación y consistencia de bases de datos.
- C4: coordinar el clúster, Flyway y los permisos es delicado.
- A3: compose, 3 archivos de propiedades, migraciones, un guion y pruebas.
- T4: entre 15 y 30 horas.

---

### §12 Pirámide de pruebas

#### §12a Coherencia de la auditoría encadenada (E3) y pruebas de concurrencia

**Qué encontré**

*Lo que mejoró desde el 12/09* (commits `36ac78a7`, `4042bfbd`, PR #101):
- Hay una cabeza de cadena única (`estado_cadena_auditoria`, V16) con bloqueo real en los tres escritores: `EstadoCadenaAuditoriaRepository.java:17` `@Lock(PESSIMISTIC_WRITE)`, Secretaría `AuditoriaService.java:219-227` `FOR UPDATE` y `central_ledger.py:47-58` `FOR UPDATE`. El 12/09 había 0 apariciones.
- El reloj de Lamport se lee de la fila bloqueada, así que un reinicio ya no lo devuelve a 1.
- Las tres implementaciones de la forma canónica usan los mismos 11 campos en el mismo orden y la misma fórmula `SHA256(prev+JSON)`. Un caso base da el mismo hash (`4d440be1…`) en Java y Python.
- Al generar 4 eslabones en Java y verificarlos con `verificar_cadena_global` de Python obtuve `valido=True`, y la manipulación se detecta (`HASH_ACTUAL_INVALIDO`).

*Lo que sigue abierto:*
- **Siguen siendo tres implementaciones** (dos `AuditHashService.java` copiados y `hashing.py`), y en casos límite difieren:
  - La clave `contraseña` se escribe como `"contrase?a"` en Java (byte 0x3F en la fuente), así que no se excluye y el valor entra en el JSON.
  - `BigDecimal 9.50` da `9.50` en Java y `"9.50"` en Python.
  - `1e20` da `1.0E20` frente a `1e+20`.
  - Las marcas de tiempo usan `Instant.toString()` frente a `isoformat()`.
- **Ninguna prueba del repositorio verifica filas escritas por Java con el verificador de Python.** `test_verificador_global_e3.py` construye todos los eslabones en Python.
- **El reloj vectorial sigue sin efecto:** ningún código de producción pasa `reloj_vectorial_recibido`, Java escribe siempre `"APLICADO"`, y los nombres de nodo no coinciden (`docente` en Java, `docente-{id}` en `server.py:85`).
- **No hay restricción UNIQUE** sobre `hash_anterior` ni `reloj_lamport`: solo el bloqueo impide la bifurcación.
- **Las pruebas de concurrencia no ejercitan el sistema real:** `AuditoriaPostgresContainerTest` desactiva Flyway, `AuditoriaCadenaConcurrencyE3Test` repite el SQL a mano y la de Python usa mocks sobre SQLite.
- `guardar` atrapa `Exception` y solo registra un log (Principal `:214-236`, Secretaría `:460-480`): **un fallo de auditoría pierde el evento en silencio**.
- **Los documentos contradicen el código:**
  - ADR-007:17 da la fórmula `H‖payload‖L_k`, ADR-007:20-34 un formato con `trace_id`, y ADR-007:11 incluye a Soporte, que no audita.
  - `docs/arquitectura/alineacion_bitacora_auditoria.md:30` dice que «Secretaría NO mantiene cadena», lo cual es falso.

**Cómo debe quedar**
- Una especificación canónica v1 con vectores de prueba compartidos (JSON en `docs/auditoria/vectores_v1.json`) que cubran ñ/tildes, decimales, flotantes, fechas, null y claves excluidas. Las tres implementaciones deben pasarlos en CI.
- Una prueba de integración (Testcontainers con migraciones reales) que escriba eventos concurrentes desde Principal, Secretaría y Docente y verifique la cadena global.
- Restricción UNIQUE que haga imposible la bifurcación.
- Fallo de auditoría que aborte la transacción de negocio o quede en una cola persistente.
- ADR-007 y el documento de alineación reescritos según el código.
- M3 con vector recibido real, o eliminado del diseño.

**Qué deben hacer**
1. Crear `docs/auditoria/vectores_v1.json`, más `AuditHashVectorsTest` en ambos Java y `test_vectores_v1.py`.
2. Corregir la codificación de la fuente (`-Dfile.encoding=UTF-8` en el compilador de Maven y la clave como `"contraseña"`).
3. Normalizar `BigDecimal` y `Decimal` a cadena y las marcas de tiempo a ISO-8601 UTC con microsegundos en las tres implementaciones.
4. Migración V19: `CREATE UNIQUE INDEX ux_auditoria_hash_anterior ON auditoria(hash_anterior) WHERE version_canonica='v1'`.
5. Reemplazar `catch (Exception e) { log }` por relanzar la excepción o usar un *outbox*.
6. Escribir `CadenaGlobalMultiServicioIT` y reescribir ADR-007.

**Cómo lo verifico**
- `mvn -q -pl sga-principal test -Dtest=AuditHashVectorsTest && (cd microservicio-secretaria/backend && mvn -q test -Dtest=AuditHashVectorsTest) && (cd microservicio-docente && pytest -q docentes/tests/test_vectores_v1.py)` debe pasar.
- `grep -rn "contrase?a" --include=*.java . | wc -l` debe dar 0.
- `grep -rn "UNIQUE.*hash_anterior" sga-principal/src/main/resources/db/migration` debe encontrar la restricción.
- `grep -n "PESSIMISTIC\|FOR UPDATE" docs/adr/ADR-007-auditoria-unificada.md` debe corresponderse con el código.

**Estimación.** P5 · C4 · A4 · T4
- P5: es el núcleo conceptual del experimento (consistencia, relojes, no repudio).
- C4: tres lenguajes y concurrencia.
- A4: unos 15 archivos entre tres servicios, migraciones y ADR.
- T4: entre 15 y 30 horas.

#### §12b Cobertura, E2E y Testcontainers (E8, E10, E13)

**Qué encontré**

*Cobertura (E8).* Medida en copias con `mvn test jacoco:report` (Java 25; fue necesario forzar Lombok 1.18.46 y byte-buddy 1.18.10) y sumando `jacoco.csv`:

| Módulo | Con la configuración del pom al corte | Antes de #118 | Todo el código escrito a mano (sin exclusiones) |
|---|---|---|---|
| sga-principal (98 pruebas; 2 errores por falta de Docker; 4 saltadas) | INSTR 30,92 % (4394/14210) | INSTR 28,26 % | **INSTR 24,98 % (4499/18008), LINE 25,23 %** |
| microservicio-secretaria (94 pruebas) | INSTR 71,28 %, LINE 70,46 % | INSTR 71,04 %, **LINE 69,76 %** | igual |
| microservicio-soporte (73 pruebas) | INSTR 73,03 %, LINE 71,16 % | — | igual |
| Agregado Java | 53,98 % | — | **49,02 % (18320/37375)** |

- **Las compuertas del 70 % siguen aplicándose a clases elegidas a mano**, igual que el 12/09:
  - `sga-principal/pom.xml:294-303` usa `<element>CLASS</element>` con `<includes>` de 6 clases (EstudianteService, MatriculaService, AnoLectivoService, AsignaturaService, UsuarioService, LamportClock).
  - `microservicio-secretaria/backend/pom.xml:279-285` hace lo mismo con 7 clases. El agregado de esas 7 clases da **90,87 %**, origen probable del «90,7 %» que sigue en `.tex:878`.
  - Solo Soporte usa `BUNDLE`.
- **El PR #118 (`2139c6dd`, Castro), «excluir boilerplate y dtos de jacoco para alcanzar meta de cobertura del 70%», añade exclusiones de `dto`, `config`, `exception`, `payload` y `entity`.**
  - No cambia la compuerta: las clases incluidas no están en esos paquetes.
  - Sí infla las cifras del informe.
  - Excluye lógica real: `SecurityConfig`, `GlobalExceptionHandler`, `DataSeedRunner` y `WebConfig`, con 1440 instrucciones al 0 %.
  - En Secretaría sube LINE de 69,76 % a 70,46 % justo por encima del umbral.
  - `**/grpc/**` excluye además `PrincipalGrpcService` (482 líneas escritas a mano) y los interceptores: 2292 instrucciones al 2,6 %.
- **Docente (Python):** `pytest --cov=docentes` incluye en el denominador los 13 archivos de prueba dentro de `docentes/`, unas 730 sentencias. El HTML versionado da 78 %; sin los archivos de prueba se estima ≈64 %. No lo pude ejecutar: Django 6.0.6 requiere Python ≥3.12.
- **Cifras documentadas incoherentes:**
  - `docs/cobertura/README.md:8-9` da sga-principal 30,31 % y Secretaría 34,53 % «histórico», cuando la real es 71,28 %.
  - `:20` dice que se excluye `infrastructure/election/**`, que no existe en el pom.
  - `.tex:603` habla de «70 % LINE» cuando la regla es INSTRUCTION por clase.
  - `.tex:878` mantiene el 90,7 %.
  - Otras: `docs/bitacora.md:78` 88 %; `ADR-006:51,117` 79,28 %.
  - Los 823 HTML de `docs/cobertura` son del 1 al 7/09 y no corresponden al código del corte (faltan 19 clases, incluida `AuditHashService`). `36ac78a7` (13/09) **editó a mano** `JwtService.java.html` y `HmacService.java.html` para ocultar el secreto, en vez de regenerarlos.

*E2E en navegador (E10).*
- `microservicio-docente/frontend/e2e/docente.spec.js` tiene 6 pruebas contra el entorno real (`vars.E2E_BASE_URL`). Fallan si faltan las variables (`ci-cd.yml:369-374`, `test -n`) y tienen aserciones estrictas de POST/PATCH y restauración. **Bien diseñadas.**
- Los commits del 13/09 (`bc9c5e68` … `f9e010db`, +882/−127 líneas, el último a las 17:57) reescribieron el spec, y **el job E10 quedó en rojo en `78b0d175`**. Según la API de GitHub (run 34788334697): 16 de 17 jobs en verde y «E10 - Playwright Frontend Docente» fallido. Como `e2e-docente` no está en `needs` de `build-images` ni de `integration`, el despliegue terminó en verde igualmente.
- La prueba **modifica calificaciones reales** del entorno desplegado (y las restaura).
- Las evidencias versionadas (`evidencias/Bedon/…/04-E10-e2e-navegador/*.png`, «6 passed») son del 12/09, anteriores a la reescritura. No hay reportes, trazas ni vídeos de Playwright del código del corte.
- `tests/e2e/test_e2e_lifecycle.py` sigue siendo una simulación (`_simular_navegacion`), versionada y referenciada en `README.md:135`.
- Móvil: 1 prueba Compose sin ejecución en CI (§9).

*Testcontainers (E13).* Hay 4 suites, todas Java; Docente y Soporte no tienen ninguna.
- Solo `AuditoriaFlywayMigrationContainerTest` aplica las migraciones reales (V9–V18), y lo hace sobre una base V1–V8 escrita a mano (64 líneas).
- `AuditoriaPostgresContainerTest` desactiva Flyway y usa `ddl-auto=create`.
- `AuditoriaCadenaConcurrencyE3Test` usa tablas y SQL escritos a mano.
- `SecretariaContainerIntegrationTest` desactiva Flyway, escribe el esquema a mano y traga los errores de `migrate()`.
- Todas usan `disabledWithoutDocker=true` o `Assumptions`, así que se omiten sin fallar. No hay informes surefire versionados ni publicados como artefacto.
- Las pruebas Python de auditoría usan SQLite con mocks del `FOR UPDATE`.

*Pruebas de integración entre servicios:* `tests/integration/test_cross_service_integration.py` no se ejecuta en CI. El job `integration` es un despliegue, no una prueba.

**Cómo debe quedar**
- Cobertura ≥70 % por módulo con regla `BUNDLE` sin `includes` y sin excluir código escrito a mano (solo código generado: protobuf y `*_pb2`). Docente medido sin sus archivos de prueba en el denominador.
- Un único número por módulo, con fecha y comando, idéntico en README, `docs/cobertura/README.md` y `.tex`.
- E2E en verde en el commit de cierre, dentro de los `needs` del despliegue, con el reporte HTML de Playwright publicado como artefacto, y sin modificar datos reales (entorno de *staging* o datos semilla).
- Testcontainers con Flyway real completo (V1 incluida) en Principal y Secretaría, y una suite PostgreSQL para Docente, que falle (no se omita) en CI.

**Qué deben hacer**
1. Sustituir en ambos pom `<element>CLASS</element><includes>…` por `<element>BUNDLE</element>` con `LINE` e `INSTRUCTION` ≥0.70. Dejar en `<excludes>` solo `**/grpc/*Grpc.class`, `**/*Proto*.class` y `**/*OuterClass*`.
2. Escribir pruebas para `infrastructure/grpc/PrincipalGrpcService`, `SecurityConfig`, `GlobalExceptionHandler` y los servicios de aplicación de sga-principal hasta ≥70 %. Es lo más costoso: de 25 % a 70 % hay unas 8 000 instrucciones.
3. En `microservicio-docente/.coveragerc`, `omit = docentes/test_*.py, docentes/tests/*, docentes/tests_*.py`.
4. `git rm -r --cached docs/cobertura` y publicar los informes como artefacto de CI. Borrar el 90,7 % y las cifras históricas.
5. Arreglar el spec E10 hasta que esté verde, añadir `e2e-docente` a `needs` de `integration`, subir `playwright-report/` con `if: always()` y ejecutar contra un entorno de pruebas.
6. Convertir el baseline V1–V8 en migraciones Flyway reales, poner `disabledWithoutDocker=false` en CI y publicar `target/surefire-reports`.
7. Borrar `tests/e2e/test_e2e_lifecycle.py` o renombrarlo como simulación, y añadir `tests/integration` a CI.

**Cómo lo verifico**
- `grep -n "<element>CLASS</element>\|<includes>" sga-principal/pom.xml microservicio-secretaria/backend/pom.xml` debe dar 0 dentro de `<rules>`.
- `(cd sga-principal && mvn -q verify) && python - <<<'import csv;r=list(csv.DictReader(open("sga-principal/target/site/jacoco/jacoco.csv")));c=sum(int(x["INSTRUCTION_COVERED"]) for x in r);m=sum(int(x["INSTRUCTION_MISSED"]) for x in r);print(c/(c+m))'` debe dar ≥0,70.
- `grep -rn "90.7\|34,5\|30,3" README.md docs/cobertura/README.md Informe-E4_BCEL/TA-PFC-E4_BCEL.tex` debe dar 0.
- `grep -n "e2e-docente" .github/workflows/ci-cd.yml` debe aparecer dentro de `needs:` de `integration`.
- `grep -rn "disabledWithoutDocker = true\|flyway.enabled=false\|catch (Exception fe) {}" sga-principal/src/test microservicio-secretaria/backend/src/test` debe dar 0.
- En el run de CI del commit de cierre, todos los jobs deben estar en verde, E10 incluido.

**Estimación.** P3 · C4 · A5 · T5
- P3: exige criterio de medición honesta.
- C4: escribir pruebas para gRPC, seguridad y Testcontainers con Flyway completo.
- A5: 3 módulos Java, Python, E2E y CI.
- T5: más de 30 horas; subir sga-principal de 25 % a 70 % domina el esfuerzo.

#### §12c Pruebas de carga (E5) y comandos del README (E16)

**Qué encontré**

*Juegos de resultados de carga.* Los recalculé desde la fila Aggregated y `stats_history` de cada CSV:

| Juego | Archivo | Peticiones / fallos | P50 / P95 / P99 (ms) | Duración | Usuarios máx. |
|---|---|---|---|---|---|
| A («oficial») | `microservicio-soporte/locust_esc1_stats.csv` | 12 994 / 0 | 6 / 440 / 850 | 299 s | 50 |
| B | `experimentos/resultados/locust_esc1_stats.csv` | 12 236 / 0 | 110 / 370 / 460 | 299 s | 50 |
| C | `docs/locust/escenario1_nominal_stats.csv` | 13 606 / 0 | 6 / 340 / 450 | 298 s | 50 |
| D (estrés) | `docs/locust/escenario2_estres_stats.csv` | 106 735 / 26 (0,024 %) | 7 / 230 / 370 | 599 s | 200 **a los 40 s** |
| E | `experimentos/resultados/locust_esc3_stats.csv` | 717 / 565 (78,8 %) | — | 599 s | **1** |
| F | `docs/locust/resultados_carga_stats.csv` | 2 419 / 0 | — | 59 s | 50 |

*Lo que mejoró desde el 12/09:* `experimentos/resultados/corridas-e5.md` clasifica los juegos A–F y declara A como oficial. El README, los protocolos y el cuerpo del `.tex` usan 12 994.

*Lo que sigue abierto:*
- **No hay una rampa válida de 0 a 200 en 10 min:** D alcanza 200 usuarios en 40 s y E se quedó en 1 usuario.
- **La contradicción del 12/09 sigue en el manuscrito.** `.tex:800-808` tiene las filas «Disponibilidad» y «Fiabilidad» **duplicadas**. La fila antigua dice «0 fallos en 12{,}265 reqs» y «100 % fallos… 12{,}735 peticiones». 12 265 no aparece en ningún CSV de ningún commit.
- **El PDF versionado** (`e71a7781`, 12/09) es anterior al `.tex` (`00468eda`, 13/09) y todavía contiene 12,265 (4 veces), 40.96 RPS y 30.31 %.
- `.tex:692` y `corridas-e5.md` citan commits que no existen: `git cat-file -t 956cafcb` devuelve «Not a valid object name». Lo mismo ocurre con `c5c0e6f5`, `df0112d3`, `683cc17f`, `6a239c99`, `46d8a897`, `2928d596` y `2d125061`.
- `sha256sum -c` en `microservicio-soporte/` da **0 OK y 4 FAILED**, porque la normalización a LF cambió los bytes certificados. Los hashes de `docs/locust/entorno_medicion.md` dan 2 FAILED.
- `experimentos/resultados/reporte_escenario1.html` (18 479 peticiones) no corresponde al CSV de la misma carpeta (12 236).

*Comandos del README (E16).* El mapa de carpetas existe (`README.md:31-43`) y `f4dbf04c` corrigió las rutas `backend/`, añadió `scripts/start.sh` y el `main()` del verificador. Aun así, probando cada comando en una copia limpia, **8 están rotos y 1 es condicional**:

| Comando | Fallo |
|---|---|
| `README.md:41` `npm run build` | «vite no se reconoce»; falta el paso de instalación |
| `:44` `python experimentos/verificador_cadena.py` | Requiere Django y `StrEnum` (Python ≥3.11), no declarados |
| `:135` `pytest tests/contract tests/integration tests/e2e` | La recolección aborta con `ModuleNotFoundError: rest_framework` |
| `:139` `python experimentos/run_experimentos.py` | Mismo error: `experimentos/requirements.txt` solo declara matplotlib |
| `:243-250` `pdflatex TA_PFC_E4_Soporte.tex` | El archivo no existe |
| `:67` `./scripts/start.sh` | Modo 100644, así que da Permission denied; además el bloque de código de :58-68 no está cerrado |
| `:38` `microservicio-secretaria/backend && ./mvnw test` | `mvnw` con modo 100644 |
| `:40` `app-movil-docente && ./gradlew test` | `gradlew` con modo 100644 |
| `:36` `sga-principal && ./mvnw test` | Condicional: sin Docker da BUILD FAILURE (2 errores Testcontainers), aunque `:218` dice «Docker opcional» |

Otras inexactitudes:
- `:16` dice Java 21; el pom declara 17.
- `:41` dice «React + TypeScript».
- `:37` dice Django 5; el requirements tiene 6.0.6.
- `:222` tiene una línea suelta «Juliana-Emanuel» de un merge.
- `:304` enlaza una imagen inexistente.

**Cómo debe quedar**
- Un único juego canónico por escenario en una sola carpeta:
  - Escenario 1: 50 usuarios durante 5 min, confirmado por `stats_history`.
  - Escenario 2: rampa de 0 a 200 en 10 min, con un máximo de 200 alcanzado alrededor de t≈600 s.
- Los demás juegos movidos a `experimentos/descartados/` con el motivo documentado.
- El manuscrito y el PDF sin 12 265 ni 12 735, con los hashes de commit reales y un manifiesto de Soporte que verifique.
- Todos los comandos del README ejecutables desde un clon limpio.

**Qué deben hacer**
1. Repetir el escenario 2 con `LoadTestShape` (0→200 lineal en 600 s) y guardar CSV, HTML y `stats_history`.
2. `git mv` de B, C, E y F a `experimentos/descartados/`.
3. Borrar las filas duplicadas de `.tex:800-808`, corregir los 8 hashes de commit y recompilar y versionar el PDF.
4. Regenerar `microservicio-soporte/REPRODUCIBILIDAD.txt` sobre los bytes LF.
5. README:
   - `git update-index --chmod=+x scripts/start.sh microservicio-*/backend/mvnw sga-principal/mvnw app-movil-docente/gradlew`.
   - Añadir `npm ci &&` antes de `npm run build`.
   - Declarar en `experimentos/requirements.txt` las dependencias reales (`Django`, `djangorestframework`, `matplotlib`) y `python>=3.12`.
   - Borrar la sección de `TA_PFC_E4_Soporte.tex`, cerrar el bloque de código y marcar las suites que requieren Docker.

**Cómo lo verifico**
- `python -c "import csv;r=[x for x in csv.DictReader(open('docs/locust/escenario2_estres_stats_history.csv'))];print(max(int(x['User Count']) for x in r), r[-1]['Timestamp'])"`: el máximo debe ser 200 con una subida gradual (usuarios en t=300 s ≈ 100).
- `grep -c "12{,}265\|12{,}735" Informe-E4_BCEL/TA-PFC-E4_BCEL.tex` debe dar 0.
- `pdftotext Informe-E4_BCEL/TA-PFC-E4_BCEL.pdf - | grep -c "12,265"` debe dar 0.
- `(cd microservicio-soporte && sha256sum -c REPRODUCIBILIDAD.txt)` debe dar todo OK.
- `for h in $(grep -ohE "\b[0-9a-f]{8}\b" experimentos/resultados/corridas-e5.md); do git cat-file -t $h >/dev/null || echo FALTA $h; done` no debe imprimir nada.
- `git ls-files -s scripts/start.sh sga-principal/mvnw microservicio-secretaria/backend/mvnw app-movil-docente/gradlew | awk '{print $1}' | sort -u` debe dar `100755`.
- En un contenedor `python:3.12` con un clon limpio: `pip install -r experimentos/requirements.txt && python experimentos/verificador_cadena.py && python -m pytest tests/contract tests/integration -q` debe terminar con código 0.

**Estimación.** P3 · C2 · A3 · T3
- P3: exige diseñar una rampa válida y separar poblaciones.
- C2: Locust y edición de documentos.
- A3: CSV, `.tex`, PDF, README y certificado.
- T3: entre 6 y 15 horas, incluidas las corridas.

---

### §13 Pipeline CI/CD

**Qué encontré**

*Estado al corte según la API de GitHub.* En el run 34788334697 sobre `78b0d175` corrieron 17 jobs: 16 en verde y «E10 - Playwright Frontend Docente» en **rojo**. «7. Integración y Despliegue» terminó en verde a las 23:11Z.

*Grafo de dependencias* (`.github/workflows/ci-cd.yml`):
- Sin `needs`: `secret-scan`, `ci-docente`, `ci-movil-representante`, `e2e-docente` y `lint`.
- Dependen de `lint`: `test-backend`, `test-soporte-backend`, `test-secretaria-backend`, `test-web` y `test-mobile`.
- `build-images` depende de esas 5 pruebas más `lint`, `ci-docente` y `ci-movil-representante`.
- `build-mobile-apk` depende de `test-mobile`.
- `integration` depende de `build-images` y `build-mobile-apk`.

*Lo que está bien:*
- No hay `continue-on-error` ni `|| true` que afecten al resultado; el único es `docker compose down` en `:577`.
- **E15 cerrado:** `check_health … || exit 1` (`:583-605`) con 30 intentos cada 5 s sobre 4 servicios; `appleboy/ssh-action` propaga el código de salida.
- **E14 casi cerrado:** la matriz (`:451-469`) construye las 5 imágenes con Dockerfile propio en cada push y PR, y las publica en main con etiqueta `<SHA>` y `latest`. `ghcr.io/leo23as/{sga-principal, microservicio-docente, microservicio-secretaria, microservicio-soporte, microservicio-ia}:78b0d175…` responden HTTP 200.
- **E12 cerrado:** hay `npm ci` en las 4 interfaces.
- E7 y E17 se verifican en `lint` y pueden fallar.

*Defectos al corte:*
1. **Compuertas fuera del camino de despliegue.** `secret-scan` y `e2e-docente` no están en ningún `needs`: al corte E10 estaba en rojo y se desplegó igual. Además, `build-images` (`:445-450`) construye en ramas distintas de main aunque fallen las pruebas.
2. **Los jobs no hacen lo que dicen sus nombres:**
   - `lint` no ejecuta el linter de ninguna SPA (solo `flake8 --select=E9,F63,F7,F82`), y ESLint de sga-frontend da 54 errores.
   - `test-web` no ejecuta pruebas (solo `npm run build`).
   - `integration` es un despliegue SSH sin pruebas de integración; `tests/integration` no se ejecuta.
   - `build-mobile-apk` genera solo `assembleDebug`.
3. **Publicación duplicada que volvió.** `48740f3d` (Emanuel) eliminó el paso «Construir y Etiquetar Imagen Microservicio Secretaría (E14 GHCR)», pero el merge `efaebf70` lo reintrodujo (`:511-517`). Dentro de la matriz se ejecuta 5 veces por push a main y publica en otra ruta, `ghcr.io/leo23as/acadtrace/microservicio-secretaria:<SHA>` (HTTP 200).
4. **El despliegue no usa las imágenes publicadas:** hace `git reset --hard origin/main && docker compose up -d --build` en EC2 (`:575-578`), clonando `LEO23as/acadtrace`. La etiqueta por SHA no es lo que se despliega.
5. **CI contra producción:** `test-backend` (`:201-206`) inyecta `DB_HOST: 3.23.195.43`, `DB_USER: postgres` y `DB_PASSWORD` real en pruebas que en local pasan sin base de datos.
6. Las SPA sga-frontend y docente-frontend no tienen imagen (§7).

**Cómo debe quedar**
- DAG donde `integration` dependa de `secret-scan`, `e2e-docente`, las pruebas de contrato y todas las pruebas, y donde `build-images` dependa de las pruebas en todas las ramas (o no se ejecute si fallan).
- `lint` con ESLint/tsc de las SPA, ktlint y flake8 completo; `test-web` con vitest y cobertura; `integration` que levante el stack con compose en el runner, espere salud y ejecute `tests/integration` y los contratos.
- Una sola publicación por imagen, incluidas las SPA; el despliegue hace `docker compose pull` de `ghcr.io/…:<SHA>`.
- Ningún secreto de producción en jobs de prueba.
- Commit de cierre con todos los jobs en verde.

**Qué deben hacer**
1. Añadir `secret-scan` y `e2e-docente` a `needs` de `build-images` o `integration`, y cambiar el `if` de `build-images` a `!contains(needs.*.result, 'failure')` para todas las ramas.
2. Borrar `:511-517`.
3. Crear `docker-compose.prod.yml` con `image: ghcr.io/gleiston-guerrero/<svc>:${GIT_SHA}` y en el despliegue usar `docker compose -f docker-compose.prod.yml pull && up -d`.
4. Quitar `DB_HOST`, `DB_USER` y `DB_PASSWORD` de `test-backend` y usar Testcontainers.
5. Extender `lint` y `test-web` (ver §7) y añadir un paso previo al despliegue en `integration`: `docker compose up -d && ./scripts/wait-healthy.sh && pytest tests/integration tests/contract`.
6. Añadir `build-images` para `sga-frontend` y `docente-frontend`.

**Cómo lo verifico**
- `python -c "import yaml;w=yaml.safe_load(open('.github/workflows/ci-cd.yml'));n=w['jobs']['integration']['needs'];print(n)"` debe mostrar `build-images`, `build-mobile-apk` y la cadena que incluya `secret-scan` y `e2e-docente`.
- `grep -c "Construir y Etiquetar Imagen Microservicio Secretaría" .github/workflows/ci-cd.yml` debe dar 0.
- `grep -n "3.23.195.43" .github/workflows/ci-cd.yml` debe dar 0.
- `grep -n "compose.*pull\|ghcr.io.*GIT_SHA" .github/workflows/ci-cd.yml docker-compose.prod.yml` debe encontrar ambos.
- `curl -s https://api.github.com/repos/gleiston-guerrero/acadtrace/commits/<sha_cierre>/check-runs | python -c "import json,sys;r=json.load(sys.stdin)['check_runs'];print(len(r),{c['conclusion'] for c in r})"` debe dar `{'success'}`.

**Estimación.** P3 · C3 · A2 · T3
- P3: exige diseñar el DAG y el despliegue por imagen.
- C3: integración con compose en el runner.
- A2: workflow, un compose de producción y un script.
- T3: entre 6 y 15 horas.

---

### §14 Observabilidad

**Qué encontré**
- **Métricas:**
  - `sga-principal/.../infrastructure/metrics/SgaBusinessMetrics.java` define 6 métricas `sga_*`, pero **no tiene ningún llamador** (`grep -rl SgaBusinessMetrics` fuera del archivo da 0), y el gauge `sga_estudiantes_activos_total` está fijo en `AtomicInteger(344)`.
  - Docente sí incrementa `docente_calificaciones_total`, `docente_asistencias_total` y `docente_active_requests` (`server.py:92`, `asistencia_service.py:245`).
  - No hay `crdb_*` porque la base es PostgreSQL; `pg_up` y etcd no sustituyen las métricas de un clúster.
- **Logs JSON con `trace_id`:** existen en Secretaría (`JsonStructuredLayout`, `TraceIdFilter.java:32`) y Docente (`middleware.py`). **No existen en SGA Principal** (no hay `logback-spring.xml`) ni en Soporte (consola estándar).
- **Trazas:** no hay OpenTelemetry (`grep -rni "otel\|opentelemetry"` da 0) ni Collector en compose. Solo Soporte envía a Zipkin (Brave). El propio `.tex:856` deja el Collector como «trabajo futuro».
- **Dashboards:**
  - `infra/grafana/dashboards/pfc-dashboard.json` tiene 14 paneles (RPS, P50/P95/P99, 4xx/5xx, etcd, Hikari, CPU/RAM) y ninguno usa `sga_*` ni `docente_*`.
  - `ops/grafana/pfc-dashboard.json` (10 paneles) es otro archivo distinto y no se provisiona.
- `infra/prometheus/prometheus.yml` contiene `remote_write` con la URL de plantilla `https://<TU-PROMETHEUS-URL>.grafana.net`.
- **Evidencia bajo carga:** `Informe-E4_BCEL/grafana_bajo_carga.png` (`4a09c67a`, 31/08) es el dashboard **anterior**, con un único pico de unos 40 RPS de soporte, huecos y la marca de agua «Activar Windows». Es anterior a la corrida oficial del 11/09.

**Cómo debe quedar**
- 4 métricas de negocio nuevas que se incrementen en flujos reales (nota registrada, matrícula confirmada, notificación enviada, evento de auditoría encadenado) más las métricas del motor de base de datos del clúster.
- Logs JSON con `trace_id` en los 4 servicios.
- OTel SDK/agent → OTel Collector → backend de trazas (Jaeger, Tempo o Zipkin) para al menos Principal, Docente y Secretaría.
- Un único dashboard versionado con los 6 paneles de la guía, que use esas métricas.
- Captura fechada del dashboard y de una traza distribuida durante la corrida canónica de Locust.

**Qué deben hacer**
1. Inyectar `SgaBusinessMetrics` en los servicios de calificaciones, matrícula y notificaciones, y sustituir el gauge fijo por una consulta real.
2. Crear `sga-principal/src/main/resources/logback-spring.xml` con `logstash-logback-encoder` y MDC `trace_id`; lo mismo en Soporte.
3. Añadir `otel-collector` (`otel/opentelemetry-collector-contrib`) a compose con `ops/otel/collector.yaml`, `-javaagent:opentelemetry-javaagent.jar` en los Dockerfile Java y `opentelemetry-instrumentation-django` en Docente.
4. Dejar un solo `ops/grafana/pfc-dashboard.json` provisionado, con paneles `sga_*`.
5. Quitar el `remote_write` de plantilla.
6. Capturar el dashboard y una traza durante el escenario 1 canónico.

**Cómo lo verifico**
- `grep -rl "SgaBusinessMetrics" sga-principal/src/main/java | grep -vc SgaBusinessMetrics.java` debe dar ≥2.
- `grep -n "otel-collector" docker-compose.yml` debe encontrar el servicio.
- `test -f sga-principal/src/main/resources/logback-spring.xml`.
- `python -c "import json;d=json.load(open('ops/grafana/pfc-dashboard.json'));print(len(d['panels']), sum('sga_' in json.dumps(p) for p in d['panels']))"` debe dar ≥6 paneles y ≥2 con `sga_`.
- `grep -n "TU-PROMETHEUS-URL" infra/prometheus/prometheus.yml` debe dar 0.

**Estimación.** P3 · C3 · A4 · T4
- P3: exige conocer OTel y Micrometer.
- C3: instrumentar Java y Python y configurar el Collector.
- A4: 4 servicios, compose, dashboard y evidencias.
- T4: entre 15 y 30 horas.

---

### §15 Protocolo y campaña experimental

**Qué encontré**
- **Dos protocolos casi idénticos:** `docs/experimentos/protocolo-e4.md` y `experimentos/protocolo-e4.md` solo difieren en un enlace (línea 93).
- **El protocolo no cumple lo mínimo:**
  - No declara hipótesis H0/H1 ni variables dependientes e independientes.
  - Su diseño es de 30 réplicas, no r=10 con descarte.
  - Afirma «30 × 4 × 5 = 120 corridas» cuando el producto es 600, que es lo que tiene `deteccion.csv`.
  - `.tex:828` afirma que se descartaron la primera y la última repetición, pero `grep -n "descart\|warm\|discard" experimentos/run_experimentos.py` da 0.
- **Umbrales fijados después de medir:** `deteccion.csv` e `iso25010.csv` entraron el 31/08 21:55 (`2235fdd8`); los protocolos nacieron el 01/09 12:29 (`60494fb7`) ya con «Métricas obtenidas» dentro. El único umbral anterior es el SLA de `docs/bitacora.md` (26/08, `8bb36672`).
- **Datos sintéticos y en parte fabricados por fórmula.** En el código del corte, `run_experimentos.py` (modo `local`, en proceso, sin base de datos ni HTTP) genera las latencias del experimento 1 con `base_net = 1.25 + 0.35·conc` más constantes por mecanismo (0 / 2,15 / 4,85 / 7,30) y ruido gaussiano. Además fija `detectado = False` para M0 y M1 por código. Esto contradice `REPRODUCIBILIDAD.md` («No se sustituyen por latencias ficticias»).
- **Réplicas degeneradas:**
  - `exp1_concurrencia.csv`: 47 filas idénticas salvo el número de réplica, 60 con DE 0, y throughput 20000 = 20/0,001.
  - `exp3_reconciliacion.csv`: solo 2 filas distintas en 60.
  - `deteccion.csv`: tasas 0 % y 100 % constantes con DE 0.
- **No hay marcas de tiempo** de ejecución en los CSV del banco (solo en los de Locust).
- Relacionado con la hipótesis de E3 (consistencia de la bitácora encadenada): ninguna campaña se ejecutó contra los servicios desplegados con la base de datos real y concurrencia real.

**Cómo debe quedar**
- Un único `protocolo-e4.md` versionado **antes** de los datos (el commit del protocolo debe preceder al de los CSV), con H0/H1, variables, umbrales numéricos, r=10 por escenario, descarte declarado de la primera y la última réplica, y un procedimiento de manipulación sobre la base de datos real.
- Una campaña ejecutada en modo `http` o sobre la base de datos del clúster, con marca de tiempo por réplica, latencias medidas (no una fórmula) y cada réplica guardada como archivo crudo.

**Qué deben hacer**
1. Borrar `docs/experimentos/protocolo-e4.md` y dejar `experimentos/protocolo-e4.md` como único protocolo.
2. Reescribir el protocolo (H0/H1, variables, umbrales, r=10 más descarte) en un commit propio.
3. Eliminar de `run_experimentos.py` la fórmula `base_net` y el `detectado=False` forzado; medir con `time.perf_counter_ns()` alrededor de la escritura real (HTTP a Docente, Principal y Secretaría) y del verificador sobre filas leídas de PostgreSQL.
4. Ejecutar 12 réplicas por escenario, descartar 2 y guardar `raw/<escenario>/rep_XX.csv` con timestamp ISO.

**Cómo lo verifico**
- `git log --format=%ct -1 -- experimentos/protocolo-e4.md` debe ser menor que `git log --format=%ct --diff-filter=A -1 -- experimentos/resultados/raw`.
- `grep -n "base_net\|detectado = False" experimentos/run_experimentos.py` debe dar 0.
- `python -c "import pandas as p;d=p.read_csv('experimentos/resultados/exp1_concurrencia.csv');print(d.drop(columns='replica').duplicated().sum(), d.groupby(['mecanismo','concurrencia']).size().unique())"` debe dar 0 duplicados y tamaño [10].
- `grep -c "H0\|H1" experimentos/protocolo-e4.md` debe dar ≥2.

**Estimación.** P4 · C3 · A3 · T4
- P4: diseño experimental riguroso.
- C3: instrumentar la medición real.
- A3: protocolo, guion, datos crudos y manuscrito.
- T4: entre 15 y 30 horas.

---

### §16 Paquete de datos y reproducibilidad

**Qué encontré**

*Lo que mejoró desde el 12/09* (`d8955c32`, `7f24eeb6`, `7057fde0`):
- `sha256sum -c REPRODUCIBILIDAD.txt` da **6 OK / 0 FAILED** tanto en `experimentos/resultados` como en `docs/experimentos/resultados`, y `cmp` de las 8 copias entre carpetas da iguales. El 12/09 era 3/12 y había copias distintas.
- `test_reproducibilidad.py`: 10 pruebas OK, y la verificación puede fallar (rechaza manipulación, ausencia, CRLF y formato).
- CI (`lint`) ejecuta `verificar_reproducibilidad.py` y `reproducibilidad.sh`.

*Lo que sigue abierto:*
- **El certificado verifica bytes, no reproducibilidad.** Regeneré dos veces con el código del corte (`run_experimentos.py --mode local --output-dir regen/run{1,2}`, en venv con Python 3.10 y Django 5.2):
  - `deteccion`, `manipulaciones`, `exp1` y el PNG cambian de hash **entre corridas**: no es determinista.
  - Salvo `iso25010.csv`, **ningún archivo coincide con el certificado**.
  - En el código del corte M3 da `reconciliacion_automatica=False`, mientras el CSV versionado dice `True`.
  - **La detección de M2 y M3 baja del 100 % al 60 %:** T2 (payload) y T5 (timestamp) dan 0 %, porque `verifier.py` solo hashea `contenido_canonico` y esas manipulaciones alteran campos que quedan fuera. El cambio entró en `66e2f769` (13/09 08:41), después de los CSV (00:53) y del certificado (`a08d6660`, 01:12).

  Los datos publicados no salen del código publicado, y podría haber una brecha real en el verificador.
- La ejecución sobrescribe `docs/experimentos/resultados/falsos_positivos.csv` aunque se pase `--output-dir`, y lo escribe con CRLF.
- **El manifiesto cubre 6 archivos.** Quedan fuera los CSV de Locust, `falsos_positivos.csv`, los HTML, el PNG del informe (distinto del certificado) y el certificado de Soporte (0/4 OK).
- No hay diccionario de datos ni metadatos.
- CI **nunca regenera** los datos para compararlos.
- `experimentos/requirements.txt` declara solo `matplotlib==3.10.6`, que requiere Python ≥3.10, y omite Django, que el guion importa. El README no indica la versión de Python.
- `REPRODUCIBILIDAD.md` reconoce «E7 sigue PARCIAL», mientras el manuscrito lo presenta como cerrado.

**Cómo debe quedar**
- `run_experimentos.py` determinista con semilla: dos ejecuciones dan hashes idénticos, incluido el PNG (`metadata={'Software':None}` y fuente fija), y escribe solo en `--output-dir`.
- Un único juego canónico en `experimentos/resultados/`.
- `SHA256SUMS` que cubra **todos** los crudos (banco y Locust) y verifique.
- `DICCIONARIO_DATOS.md` con columnas, unidades y origen.
- `requirements.txt` completo con la versión de Python.
- Un job de CI que regenere en un directorio temporal y haga `diff` de hashes contra el manifiesto.

**Qué deben hacer**
1. Corregir el verificador para incluir `payload` y `timestamp` en el contenido hasheado, o documentar por qué T2 y T5 no aplican, y regenerar.
2. Fijar la semilla en todas las fuentes aleatorias y `savefig(..., metadata={"Software": None})`.
3. Hacer que `falsos_positivos` respete `output_dir` y use `lineterminator="\n"`.
4. `sha256sum $(git ls-files 'experimentos/resultados/**' 'docs/locust/*.csv') > experimentos/SHA256SUMS`.
5. Job de CI: `python run_experimentos.py --mode local --output-dir /tmp/r && (cd /tmp/r && sha256sum -c $GITHUB_WORKSPACE/experimentos/SHA256SUMS_regen)`.
6. Eliminar el duplicado `docs/experimentos/resultados`.

**Cómo lo verifico**
- `python experimentos/run_experimentos.py --mode local --output-dir /tmp/a && python experimentos/run_experimentos.py --mode local --output-dir /tmp/b && diff <(cd /tmp/a && sha256sum *) <(cd /tmp/b && sha256sum *)` no debe mostrar diferencias.
- `(cd /tmp/a && sha256sum *) | diff - <(cd experimentos/resultados && sha256sum <mismos>)` no debe mostrar diferencias.
- `sha256sum -c experimentos/SHA256SUMS` debe dar todo OK.
- `test -f experimentos/DICCIONARIO_DATOS.md`.
- `git status --porcelain docs/` debe quedar vacío tras ejecutar el guion.

**Estimación.** P4 · C3 · A3 · T3
- P4: exige entender reproducibilidad y detectar el fallo del verificador.
- C3: determinismo de las figuras y regeneración en CI.
- A3: guion, verificador, manifiestos y CI.
- T3: entre 6 y 15 horas.

---

### §17 Evaluación ISO/IEC 25010

**Qué encontré**
- **La tabla del `.tex` (líneas 800-808) no cumple:**
  - No tiene media, DE ni IC95 %.
  - «Disponibilidad» y «Fiabilidad» están duplicadas con cifras contradictorias.
  - Omite **Compatibilidad** y añade «Disponibilidad».
  - Fiabilidad debería medirse como tasa de 5xx durante una hora continua, y esa medición no existe.
- **`iso25010.csv` no contiene réplicas:** son 20 ventanas de dos corridas no canónicas.
  - 10 ventanas salen del juego B: P95 medio 420,7 ms, DE 159,8, IC95 [306,4; 535,0]; fallos 0 con DE 0, es decir, degenerado.
  - 10 ventanas salen del juego E, con 1 usuario y 79,1 % de fallos.
  - La cobertura es constante, 30,31 % (849/2801 de JaCoCo antiguo).
  - La tabla usa el juego A y el CSV deriva de B: son fuentes distintas.
- **IC sin respaldo:** los intervalos de detección [96,4 %; 100 %] corresponden a n=100, pero el CSV tiene n=150 (daría ≈97,6 %). Además la detección real regenerada es del 60 % (§16).

**Cómo debe quedar.** Cinco características (las de la guía, Compatibilidad incluida), cada una con:
- Métrica objetiva.
- Umbral declarado en el protocolo previo.
- n = 10 réplicas reales tras el descarte.
- Media, DE, IC95 % (t de Student o bootstrap con semilla).
- Contraste explícito con el umbral («cumple / no cumple»).

Todo generado por un guion desde los crudos de §15 y §16, y reproducido literalmente en el `.tex`.

**Qué deben hacer**
1. Definir en el protocolo métrica y umbral por característica (p. ej. Eficiencia: P95 < 500 ms; Fiabilidad: 5xx < 0,1 % en 60 min; Seguridad: tasa de detección ≥ 99 %; Compatibilidad: los contratos pasan con web y móvil; Mantenibilidad: cobertura ≥ 70 %).
2. Crear `experimentos/iso25010.py` que lea `raw/`, calcule y escriba `iso25010.csv` y `tabla_iso.tex`.
3. Incluir `\input{tabla_iso.tex}` en el manuscrito.

**Cómo lo verifico**
- `python experimentos/iso25010.py && git diff --exit-code experimentos/resultados/iso25010.csv Informe-E4_BCEL/tabla_iso.tex` no debe mostrar diferencias.
- `python -c "import csv;r=list(csv.DictReader(open('experimentos/resultados/iso25010.csv')));print(len({x['caracteristica'] for x in r}), all(float(x['de'])>0 for x in r if x['metrica']!='binaria'))"` debe dar 5 y True.

**Estimación.** P4 · C2 · A2 · T3
- P4: exige estadística y marco ISO.
- C2: el guion es sencillo una vez existan los crudos.
- A2: guion, CSV y tabla.
- T3: entre 6 y 15 horas, dependiente de §15.

---

### §18 Manuscrito, bibliografía y trazabilidad

**Qué encontré**

*Compilación.* Desde una copia limpia (`latexmk -pdf`): 0 errores, 0 citas o referencias indefinidas y **29 páginas**. Hay 204 Overfull (máximo 89,6 pt) y un «X Columns too narrow».

*El PDF versionado no corresponde al fuente.* El PDF es `e71a7781` (12/09 15:29, 28 páginas); el `.tex` es `00468eda` (13/09 16:52), con 3 commits posteriores. `pdftotext` del versionado frente al compilado:

| Cifra | Versionado | Compilado |
|---|---|---|
| «12,265» | 4 | 1 |
| «12,994» | 0 | 7 |
| «30.31» | 5 | 0 |
| «40.96» | 2 | 0 |

*Afirmaciones falsas respecto al código:*
- «React + TypeScript» (`:511`).
- Sin localStorage y con cookies HttpOnly (`:541-543`).
- Patrones GoF en flujo real (§5).
- «tres instancias redundantes… Raft» y particionado por rango (`:322-325`).
- Tabla de revisión cruzada con autores y validadores inventados (`:901-925`, §3).
- Flujo por issues (`:887-893`), cuando no hay ningún issue.
- «JaCoCo (90.7 %)» en la declaración de IA, frente a «cobertura no consolidada» en la tabla.
- El resumen describe Soporte como «Node.js Express», pero es Spring Boot.
- El anexo cita «1.6 ms por evento» y luego calcula «50 × 4.8 ms».

*Incoherencias internas:*
- Filas ISO duplicadas (`:800-808`).
- Secciones 3 y 4 duplicadas («Fundamentos Teóricos…» y «Fundamento Teórico y ADRs»).
- Cifras inferenciales (medianas 1,49/4,31/7,10/9,62 ms, U, A12) que no salen de ningún archivo y son incompatibles con los CSV (§16).
- Hashes de commit citados que no existen (§12c).

*Bibliografía* (`referencias.bib`):
- 43 entradas, de las que **solo 14 se citan**.
- De las citadas, 8 tienen DOI y 0 tienen ISBN, por debajo de las ≥12 exigidas con DOI o ISBN.
- Hay duplicados con el mismo DOI: `abadi2012consistency`/`abadi2012pacelc` y `newman2021building`/`newman2021microservices`.
- `fidge1988timestamps` tiene un título incorrecto.
- `provos1999bcrypt` se cita para IDOR (`:181`), una atribución indebida.

*Trazabilidad E1–E4:* la matriz (`.tex:329`, `docs/TRAZABILIDAD.md`) cruza temas del curso con archivos, no la evolución E1→E4. Además `docs/TRAZABILIDAD.md` cita rutas inexistentes, por ejemplo `sga-principal/sql/V9__trigger_auditoria_append_only.sql`, `.../LamportClock.java` (solo existe su informe HTML) y `HmacService.java` (solo en `docs/cobertura`).

*Estado efectivo:* Por culminar, porque depende de §15, §16 y §17.

**Cómo debe quedar**
- PDF versionado compilado desde el `.tex` del mismo commit.
- Ninguna afirmación que el código no respalde.
- Cifras idénticas a los resultados canónicos (idealmente con `\input` de tablas generadas).
- ≥12 referencias citadas con DOI o ISBN, sin duplicados.
- Sección de trazabilidad E1→E2→E3→E4 que indique qué se cambió en cada entrega, con commit y ruta.

**Qué deben hacer**
1. Eliminar las filas y secciones duplicadas, y corregir `:511`, `:541-543`, `:322-325`, `:887-925` y el resumen.
2. Sustituir las cifras manuales por `\input{}` de tablas generadas (§16, §17).
3. Depurar el `.bib`: eliminar las 29 entradas sin citar o citarlas donde corresponda; quitar duplicados y añadir DOI o ISBN hasta ≥12 citadas.
4. Corregir `docs/TRAZABILIDAD.md`.
5. `latexmk -pdf` y versionar el PDF en el mismo commit que el `.tex`.

**Cómo lo verifico**
- `cd Informe-E4_BCEL && latexmk -pdf -interaction=nonstopmode TA-PFC-E4_BCEL.tex && grep -c "undefined" TA-PFC-E4_BCEL.log` debe dar 0.
- `git log -1 --format=%H -- Informe-E4_BCEL/TA-PFC-E4_BCEL.pdf` debe ser igual a `git log -1 --format=%H -- Informe-E4_BCEL/TA-PFC-E4_BCEL.tex`.
- `pdftotext TA-PFC-E4_BCEL.pdf - | grep -cE "TypeScript|HttpOnly|12,265"` debe dar 0.
- `grep -c "^\\\\bibitem" TA-PFC-E4_BCEL.bbl` debe dar ≥12.
- `for p in $(grep -oE "(sga-principal|microservicio-[a-z]+|docs|experimentos)/[^\` <]+\.(java|py|sql|json|md)" docs/TRAZABILIDAD.md); do test -e "$p" || echo FALTA $p; done` no debe imprimir nada.

**Estimación.** P3 · C2 · A3 · T3
- P3: exige coherencia y trazabilidad entre documento y código.
- C2: trabajo de LaTeX y bibliografía.
- A3: `.tex`, `.bib`, `TRAZABILIDAD.md` y PDF.
- T3: entre 6 y 15 horas.

---

### §19 Amenazas a la validez y reflexión ética

**Qué encontré**
- **Amenazas** (`.tex:822-840`): 3 internas y 2 externas.
  - La mitigación «descarte de primera y última repetición» no existe en el código.
  - La de «contención de CPU < 75 % con cAdvisor» no tiene evidencia.
  - Solo la semilla está verificada (`SEED = 20260831`, `run_experimentos.py:85`).
  - Las 2 externas describen el problema **sin mitigación concreta**.
  - No se trata la amenaza principal: datos sintéticos y latencias generadas por fórmula (§15).
- **Ética** (`.tex:842-852`):
  - Unas 85 palabras en 3 viñetas, **menos de media página**.
  - Cita el código ACM/IEEE-CS de Ingeniería de Software de **1999** (`acmieee1999code`), no el ACM Code of Ethics (2018).
  - No trata problemas éticos presentes en el propio sistema: notas de menores enviadas por HTTP y sin autenticación a un servicio de IA externo (`Calificaciones.jsx:118`), el respaldo SQL con posibles datos personales (§2a) y las credenciales publicadas.

**Cómo debe quedar.** ≥3 amenazas internas y ≥2 externas, cada una con una mitigación concreta y verificable en el repositorio. Reflexión ética de al menos media página que cite el ACM Code of Ethics 2018 (principios 1.6 privacidad, 2.9 seguridad y 1.3 honestidad) aplicado a las decisiones concretas de AcadTrace.

**Qué deben hacer**
1. Reescribir las amenazas con una mitigación por cada una, apuntando a archivos (p. ej. «descarte implementado en `run_experimentos.py:NN`»). Añadir la validez de constructo por el uso de datos sintéticos.
2. Añadir `@misc{acm2018code, …, url=https://www.acm.org/code-of-ethics}` y redactar ≥½ página sobre privacidad de menores, envío a IA externa, gestión de secretos y honestidad en el reporte de resultados.

**Cómo lo verifico**
- `sed -n '/Amenazas a la Validez/,/Reflexi/p' TA-PFC-E4_BCEL.tex | grep -ci "mitigaci"` debe dar ≥5.
- `sed -n '/Reflexi.n .tica/,/section/p' TA-PFC-E4_BCEL.tex | wc -w` debe dar ≥300.
- `grep -n "acm2018\|Code of Ethics" referencias.bib` debe encontrar la entrada.

**Estimación.** P2 · C1 · A1 · T2
- P2: exige juicio ético aplicado.
- C1: solo redacción.
- A1: `.tex` y `.bib`.
- T2: entre 2 y 6 horas.

---

### §20 Evidencia de trabajo en equipo y autoría

**Qué encontré**
- **Actas retroactivas.** `docs/actas/acta-01/02/03.md` llevan fechas del 18/08, 28/08 y 03/09, pero las **tres se añadieron en un único commit**, `a9e280ac` (04/09 19:40, Juliana Emanuel). Contienen anacronismos:
  - La acta-01 (18/08) cita `pfc-dashboard.json`, creado el 01/09 (`7496036e`).
  - La acta-02 (28/08) cita métricas `sga_*` creadas el 31/08 (`683583fe`) y una «mediana de 6 ms» que corresponde a la corrida del 11/09, posterior incluso al commit de las actas.
  - La acta-03 afirma haber «auditado y validado» los PR #48, #55, #54 y #56, que tienen 0 revisiones.
  - No hay ningún acta del periodo de correcciones (10–13/09).
- **Revisión cruzada:** 0 revisiones en todos los PR comprobados. La tabla del manuscrito es falsa (§3).
- **Declaración de IA en tres versiones incompatibles:**
  - `README.md:223-233`: una sola fila y la nota «Los demás integrantes deben completar…».
  - `README.md:256-264`: solo menciona Gemini.
  - `.tex:869-881`: los cuatro integrantes.
- **Aporte por integrante hasta el corte** (sin merges; líneas añadidas/eliminadas excluyendo `venv/`, `docs/cobertura`, lockfiles, CSV, HTML, JSON, PDF y logs):

| Integrante | Commits totales | Commits 12/09 15:36 → corte | Líneas totales (+/−) | Áreas principales desde el 01/09 |
|---|---|---|---|---|
| Castro | 171 | 7 (todos squash de PR propios: #106, #108, #109, #114–#116, #118) | +48 603 / −8 998 | experimentos, informe, docs; al corte: allowlist de gitleaks, sondas de salud, exclusiones JaCoCo, restauración de properties con secretos de reserva |
| Luna | 144 | 2 (`f8ee2d0c` rol `sga_app`, `f4dbf04c` README) | +38 829 / −9 208 | informe (29,5 k líneas modificadas), secretaría |
| Bedón | 114 | 22 (E2, E3, E4/E13, E7, E10, E11, E12, E17, CI GHCR) | +40 402 / −6 905 | docente, app móvil, experimentos, sga-principal |
| Emanuel | 121 (+22 con identidad mixta) | 11 (E7, E14, E17) | +17 525 / −4 297 (+1 053 mixta) | experimentos, informe, soporte, ops |

  Entre la evaluación del 12/09 y el corte, **Bedón** hizo el trabajo técnico de más peso (unificación E3, prueba Flyway, E2E y CI). **Luna** tuvo 2 commits y **Castro** 7 squash pequeños (+119/−49 líneas), uno de los cuales introdujo secretos de reserva (§2a).
- Merge `62933d72` de Emanuel: dejó vacío el `application.properties` de Secretaría sin que nadie lo revisara (§3).

**Cómo debe quedar**
- Actas creadas en la fecha de la reunión (un commit por acta, cercano a esa fecha), sin anacronismos, incluida una del periodo de correcciones.
- PR con aprobación de otro integrante.
- Una única declaración de uso de IA coherente entre README y manuscrito.
- Aporte técnico verificable de cada integrante en los ítems pendientes, con commits bajo su propia identidad.

**Qué deben hacer**
1. Añadir en `acta-01..03` una nota que reconozca que se redactaron el 04/09 y corregir los anacronismos. Registrar las actas nuevas el mismo día de cada reunión.
2. Unificar la declaración de IA (una tabla en el `.tex` y un enlace desde el README).
3. Repartir los ítems §2–§19 con responsable nominal, cada PR revisado por otro integrante.
4. Configurar `git config user.name/user.email` correctos en cada equipo y documentar la identidad mixta (§7 Notas).

**Cómo lo verifico**
- `for f in docs/actas/*.md; do git log --diff-filter=A --format="%h %ad" --date=short -- $f; grep -m1 Fecha $f; done`: la fecha del commit debe ser igual a la del acta o como máximo 2 días después.
- `curl -s …/pulls/<n>/reviews` debe mostrar un APPROVED de alguien distinto del autor.
- `grep -c "Los demás integrantes deben completar" README.md` debe dar 0.
- `git shortlog -sne <corte_anterior>..<tag>`: cada integrante debe tener ≥N commits propios en ítems pendientes.

**Estimación.** P2 · C1 · A2 · T2
- P2 y C1: es trabajo de proceso y documentación.
- A2: actas, README y `.tex`.
- T2: entre 2 y 6 horas, más la revisión continua.

---

## 4. Lo que está Hecho

Ningún entregable de la lista común llega completo a Hecho. Estos componentes, sin embargo, se verificaron correctos y no deberían recalificarse:
- **Finales de línea (E17):** 38 CSV versionados y 0 con CR en `78b0d175`; `.gitattributes` con `* text=auto eol=lf` y `*.csv text eol=lf`; `scripts/verificar_finales_linea.py` revisa 766 archivos con CRLF=0 y CI lo ejecuta con salida ≠0 si falla.
- **Integración de ramas (E9):** los 29 commits sin fusionar del 12/09 están en `main`; los 6 restantes son duplicados de squash con contenido idéntico al corte.
- **Copias y verificación de bytes (E7):** `sha256sum -c` da 6/6 OK en ambas carpetas de resultados, las 8 copias son idénticas y `test_reproducibilidad.py` da 10 pruebas OK y puede fallar.
- **Bloqueo real de la cabeza de cadena:** `@Lock(PESSIMISTIC_WRITE)` y `FOR UPDATE` en los tres escritores, con Lamport persistido en `estado_cadena_auditoria`.
- **Compatibilidad de hash:** mismo hash de caso base en Java y Python; una cadena generada en Java se verifica en Python.
- **Configuración de gitleaks:** `useDefault=true` sin allowlist.
- **Sonda de salud del despliegue:** `ci-cd.yml:583-605`, 4 servicios, 30 intentos y `|| exit 1`.
- **Locust fijado:** `microservicio-soporte/requirements-load.txt: locust==2.46.4`, aunque no lo referencian las instrucciones ni CI.
- **App móvil:** JWT en `EncryptedSharedPreferences`, biometría navegable y caché Room sin conexión.
- **Manuscrito:** compila sin errores ni referencias indefinidas en 29 páginas.
- **Actividad de todos:** los cuatro integrantes tienen commits propios en septiembre.

En CI al corte (run 34788334697, 17 jobs, 16 en verde) hay además estos componentes correctos:
- **Imágenes:** GHCR publica las 5 imágenes de backend con etiqueta `<SHA>` (`ghcr.io/leo23as/<svc>:78b0d175…` responde HTTP 200).
- **Instalación reproducible:** `npm ci` con los 4 lockfiles sincronizados.
- **Cobertura con compuerta de módulo:** Soporte alcanza 73,03 % de instrucciones y 71,16 % de líneas con regla `BUNDLE`; Secretaría mide 71,28 % de instrucciones sobre todo el módulo.
- **Contrato:** el Pact de Docente se verifica contra la app Django real, aunque con queryset simulado.
- **Pruebas de navegador:** el diseño de las 6 pruebas Playwright es correcto (fallan sin entorno y verifican escritura y restauración), aunque el job estaba en rojo al corte.

## 5. Orden de ejecución recomendado

1. **§2a Secretos y datos personales.** Es urgente e independiente: retirar el PDF y el respaldo SQL, rotar credenciales, quitar valores de reserva y purgar el historial. Conviene hacerlo antes que cualquier otra reescritura, porque `filter-repo` invalida los hashes.
2. **§3 Proceso:** protección de rama y revisión obligatoria. Debe estar activo antes del resto del trabajo para que cada PR cuente como revisión cruzada.
3. **§11 y §12a Base de datos y cadena de auditoría:** clúster, usuario `sga_app`, Flyway con validación, vectores canónicos, UNIQUE y prueba multiservicio. Es la base del experimento.
4. **§4 y §5 Capas y patrones reales.** Pueden ir en paralelo con el punto 3 (otro integrante); §5 depende parcialmente de §4 para Principal.
5. **§6, §8 y §9 Clientes** (en paralelo): token fuera de localStorage, `/main`, pull-to-refresh y APK release en CI.
6. **§12b, §10 y §13 Pruebas y CI:** cobertura real, contratos, E2E y compuertas. Dependen de 3 a 5.
7. **§14 Observabilidad.** Necesita los servicios estables (3 y 4) antes de la campaña.
8. **§15 → §16 → §17 Protocolo, campaña, paquete de datos e ISO 25010**, en ese orden estricto: umbrales antes de medir, luego las mediciones, luego los guiones que generan tablas. Incluye §12c (rampa de Locust).
9. **§18 y §19 Manuscrito, amenazas y ética**, con las cifras finales; PDF compilado en el mismo commit.
10. **§1, §2b, §2c y §20 Limpieza, URL, CHANGELOG y actas**, y al final la **etiqueta anotada** (§3).

## 6. Lista de verificación final

```bash
# 1. Etiqueta anotada de cierre sobre main y CHANGELOG
git cat-file -t v4.0.0 && test "$(git rev-parse v4.0.0^{commit})" = "$(git rev-parse origin/main)" && test -f CHANGELOG.md

# 2. Sin secretos ni credenciales (texto, PDF e historial)
gitleaks detect --source . --log-opts="--all" ; git grep -nI -E "PASSWORD '[^$]|:\*\*\*REMOVED|dev-token-secretaria" ; \
  for f in $(git ls-files '*.pdf'); do pdftotext "$f" - | grep -HiE "pass:|\.pem" ; done

# 3. Patrones GoF invocados desde flujos reales
for c in PortalAcademicoFacade ReporteNotasPeriodoPDF CalculoPromedioStrategy NotaPublicadaEvent; do echo $c $(grep -rl $c sga-principal/src/main/java | grep -vc "/$c.java"); done

# 4. Cadena de auditoría: vectores canónicos compartidos y UNIQUE
(cd sga-principal && mvn -q test -Dtest='AuditHashVectorsTest,AuditoriaFlywayMigrationContainerTest') && (cd microservicio-docente && pytest -q docentes/tests) && grep -rn "UNIQUE.*hash_anterior" sga-principal/src/main/resources/db/migration

# 5. Reproducibilidad real: regenerar dos veces y comparar con el manifiesto
python experimentos/run_experimentos.py --mode local --output-dir /tmp/a && python experimentos/run_experimentos.py --mode local --output-dir /tmp/b && diff <(cd /tmp/a && sha256sum *) <(cd /tmp/b && sha256sum *) && sha256sum -c experimentos/SHA256SUMS

# 6. Un solo juego de carga, con rampa real, y manuscrito coherente
grep -c "12{,}265\|12{,}735" Informe-E4_BCEL/TA-PFC-E4_BCEL.tex ; (cd Informe-E4_BCEL && latexmk -pdf TA-PFC-E4_BCEL.tex) && pdftotext Informe-E4_BCEL/TA-PFC-E4_BCEL.pdf - | grep -cE "TypeScript|HttpOnly|12,265"

# 7. Cobertura real por módulo (sin includes/excludes a conveniencia)
grep -n "<element>CLASS</element>\|<include>" sga-principal/pom.xml microservicio-secretaria/backend/pom.xml ; (cd sga-principal && mvn -q verify) ; python -c "import csv;r=list(csv.DictReader(open('sga-principal/target/site/jacoco/jacoco.csv')));c=sum(int(x['INSTRUCTION_COVERED']) for x in r);m=sum(int(x['INSTRUCTION_MISSED']) for x in r);print(round(100*c/(c+m),2))"

# 8. Revisión cruzada real en los PR posteriores
for n in $(seq 130 160); do curl -s https://api.github.com/repos/gleiston-guerrero/acadtrace/pulls/$n/reviews | python -c "import json,sys;r=json.load(sys.stdin);print($n,[x['user']['login']+':'+x['state'] for x in r])"; done
```

## 7. Notas para el docente (no van a la guía)

- **Evidencia retrofechada o fabricada:**
  - Las tres actas se escribieron el 04/09 con fechas del 18/08 al 03/09 y contienen datos posteriores a su fecha (§20).
  - La tabla `tab:peer-review` del `.tex` inventa validadores y autores. El PR #58 figura como de Bedón validado por Castro, cuando lo abrió y fusionó Ernesto835.
  - El manuscrito describe un flujo por issues que nunca existió (0 issues).
  - `.tex:692` y `corridas-e5.md` citan 8 hashes de commit inexistentes.
  - Las latencias del experimento 1 se generan con una fórmula determinista más ruido, aunque `REPRODUCIBILIDAD.md` afirma lo contrario.
- **Identidad mixta:** 23 commits firmados «Juliana Emanuel <elunam4@uteq.edu.ec>» (el correo de Luna), entre ellos 16 creados en 37 segundos (10/09 11:02:25–11:03:02). Están en la primera línea de la rama `Ernesto-Luna` (`76214736^1 = 7ec5b741`) y entraron por el PR #66 de Ernesto835. Pudieron hacerse en el equipo de Luna con el nombre de Emanuel, o ser aporte de Emanuel desde el equipo de Luna. No es atribuible con certeza; conviene preguntarlo en la defensa. Excluyéndolos, Emanuel tiene 121 commits propios. Hay además 1 commit «Asosanta Lucia <pcastrol@iteq.edu.ec>» (Initial commit del 25/05), con el correo de Castro mal escrito.
- **Aportes desiguales en el tramo final (12/09 15:36 → corte):** Bedón 22 commits de corrección sustantiva; Emanuel 11; Castro 7 squash pequeños (+119/−49), uno de los cuales introdujo secretos de reserva y otro exclusiones JaCoCo para «alcanzar la meta del 70 %»; Luna 2 commits (V18 con contraseña literal y README). En volumen histórico Castro y Luna lideran, pero una parte grande es del manuscrito (Luna: 29,5 k líneas en `Informe-E4_BCEL`) y de borrar un `venv` que Bedón había versionado (±978 k líneas, excluidas de las cifras).
- **Riesgo de privacidad:** `scripts/backups/backup_pre_seed_20260806_135036.sql` tiene 677 estudiantes con cédulas que en un 92 % superan el dígito verificador ecuatoriano, con distribución provincial plausible. No pude confirmar si son reales. Si lo son, es una exposición de datos de menores en un repositorio público. Recomiendo retirarlo de inmediato, sin esperar a la evaluación. Lo mismo vale para el PDF con la contraseña de BD, la IP y el nombre de la clave SSH, y usuarios con contraseña.
- **CI contra producción:** `ci-cd.yml:201-206` ejecuta las pruebas de sga-principal con `DB_HOST: 3.23.195.43` y `DB_USER: postgres`, es decir, la base de datos real desplegada con superusuario desde GitHub Actions.
- **No verificado:**
  - Ejecución real de Testcontainers y de las suites Maven con Docker (no hay Docker).
  - Detalle de los logs de GitHub Actions: no hay `gh`. El estado por job del run 34788334697 (16/17 en verde, E10 en rojo) se obtuvo de la API pública, pero no se revisaron los logs internos (por ejemplo, si Testcontainers llegó a ejecutarse o se omitió en el runner). Tampoco pude listar los Releases porque la API anónima agotó la cuota.
  - Cobertura de Docente: Django 6.0.6 requiere Python ≥3.12, que no está disponible; las cifras son estimaciones sobre el HTML versionado.
  - Firma del APK con `apksigner`/`keytool` (inferida de la cadena «Android Debug» en el bloque de firma).
  - Si los datos del respaldo SQL son reales.
  - Estado real de la base de datos desplegada (`flyway_schema_history`, existencia de `sga_app`).
- **Cambios posteriores al corte que no cuentan pero conviene conocer:** `0a56cf74` (16/09, Castro) elimina `SPRING_FLYWAY_VALIDATE_ON_MIGRATE=false`; `9941f993`/`e65d6958` (15/09, Bedón) crean el release móvil firmado y la etiqueta ligera `v1.0.0`; `e096b8d9`/`2d6ea6d6` (15/09) añaden el análisis estadístico con tamaño de efecto. Los 25 commits posteriores al corte en `main` son de Bedón (24) y Castro (1).
