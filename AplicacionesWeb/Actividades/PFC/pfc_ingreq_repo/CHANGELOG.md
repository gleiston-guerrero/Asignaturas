# CHANGELOG

Registro cronológico de cambios sustantivos del repositorio.
Formato basado en [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) y con versionado [SemVer 2.0.0](https://semver.org/).

---

## [v1.0.0] — 2026-10-25 (Entrega Final)

### Añadido
- Matriz de métricas INCOSE v4 sobre requisitos individuales (`docs/requisitos/metricas/INCOSE-INDIVIDUAL.tex` y PDF).
- Matriz de métricas INCOSE v4 sobre conjunto de requisitos (`docs/requisitos/metricas/INCOSE-CONJUNTO.tex` y PDF).
- Checklist FAIR completo (`FAIR-CHECKLIST.md`) con las 15 categorías evaluadas y con evidencia.
- Checklist ACM SIGSOFT Empirical Standards aplicado (`EMPIRICAL-STANDARDS.md`) con declaración explícita de amenazas a la validez.
- CITATION.cff v1.2.0 con ORCID de todos los autores y con DOI Zenodo separados para software y dataset.
- Documento académico integrado v1.0.0 (`DocumentoAcademico-v1.0.0.pdf`), estable, 70-120 páginas.
- Conclusiones y trabajo futuro añadidos al documento académico.
- ADR-006 con las decisiones finales del proyecto.
- Scripts de verificación de citas y cálculo de métricas INCOSE (`scripts/verificar-citas.sh`, `scripts/generar-metricas-incose.py`).

### Cambiado
- Todas las observaciones abiertas o diferidas de Entregas 1 a 3 han sido resueltas o cerradas con justificación explícita.
- Bibliografía verificada al 100 % contra fuente primaria (paso en CI).

---

## [v0.8.0-rc] — 2026-08-15 (Entrega 3)

### Añadido
- Diagramas UML: casos de uso general + por módulo (`assets/uml/casos-uso/`).
- Diagrama de clases nivel análisis (`assets/uml/clases/`).
- Diagramas de actividad: general + por módulo, con swimlanes.
- Diagramas de secuencia para los flujos críticos.
- Diagramas de componentes y despliegue.
- Diagrama de contexto, diagrama i* SD, diagrama SysML de requisitos.
- Fichas Cockburn detalladas de al menos 12 casos de uso (`docs/arquitectura/uml/CASOS-USO-DETALLADOS.tex`).
- Documento académico integrado en estado `release candidate` (`DocumentoAcademico-v0.8.0-rc.pdf`).
- Validación con stakeholders: acta de revisión formal, hallazgos consolidados, prototipos wireframe (`assets/prototipos/`), priorización Kano actualizada.
- ADR-004 (decisiones UML) y ADR-005 (decisiones de validación).

---

## [v0.5.0] — 2026-05-30 (Entrega 2)

### Añadido
- Especificación Volere completa: RF (≥ 20), RNF (≥ 6), RI (≥ 8), RU (≥ 4), RP (≥ 5) en `docs/requisitos/especificacion/`.
- Matriz de trazabilidad por categoría (`MATRIZ-TRAZABILIDAD.tex`).
- Historias de usuario en Connextra + Gherkin (`HISTORIAS-USUARIO.md`).
- Priorizaciones MoSCoW y Kano (`docs/requisitos/priorizacion/`).
- Resúmenes de entrevistas aplicadas (`docs/requisitos/elicitacion/entrevistas/`).
- Análisis de encuestas con script reproducible (`scripts/analisis-encuesta.py`).
- ADR-002 (canales de notificación) y ADR-003 (metodología de priorización).

---

## [v0.2.0] — 2026-04-03 (Entrega 1)

### Añadido
- Planteamiento del problema y objetivo del PFC (`docs/requisitos/PLANTEAMIENTO.md`).
- Estado del arte estructurado con PRISMA 2020 y tabla comparativa (`docs/requisitos/estado_arte/`).
- Descripción del sistema propuesto con vista conceptual (`docs/requisitos/SISTEMA-PROPUESTO.md`).
- Metodología híbrida declarada: Scrum + Kanban + Volere (`docs/requisitos/METODOLOGIA.md`).
- Instrumentos de elicitación aprobados (entrevista coordinación, entrevista operativo, encuesta usuario) en `docs/requisitos/elicitacion/`.
- Consentimiento informado (`CONSENTIMIENTO-INFORMADO.md`).
- ADR-001 con la justificación del dominio y del alcance.
- Estructura inicial del repositorio: `docs/`, `assets/`, `scripts/`, `tests/`, `.github/workflows/ci-latex.yml`.
- CITATION.cff en versión provisional.

### Cambiado
- `README.md` inicial con el nombre del equipo, correos institucionales, roles asumidos y URL del repositorio.

---

## [v0.0.0] — 2026-03-06 (Constitución del equipo)

### Añadido
- Repositorio creado en GitHub bajo la organización pública del equipo.
- Correo de constitución enviado al docente responsable (Dr. Gleiston Guerrero Ulloa).
- README y LICENSE (MIT) iniciales.
