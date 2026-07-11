# PFC de Ingeniería de Requisitos — Repositorio de referencia

Este es el repositorio de referencia del **Proyecto Fin de Curso** de la asignatura *Ingeniería de Requisitos* (cuarto nivel, PPA 2026-2027) de la Carrera de Ingeniería de Software, Facultad de Ciencias de la Computación y Diseño Digital, **Universidad Técnica Estatal de Quevedo** (Ecuador).

Sirve dos funciones simultáneas:

1. **Plantilla operativa** que los equipos de estudiantes deben clonar (o replicar en su estructura) al iniciar el PFC.
2. **Ejemplo trabajado** basado en el proyecto modelo `IngReq-Modelo.pdf` (Sistema de Gestión de Tutorías Académicas en la UTEQ, autoras Belinda Toaquiza, Bryan Lombeida, Melanie Muñoz y Mario Zambrano, PPA 2025-2026), que se usa como referencia de calidad.

---

## Docente responsable

**Dr. Gleiston Cicerón Guerrero Ulloa, Ph.D.**
Carrera de Ingeniería de Software · UTEQ · Quevedo · Ecuador
✉ `gguerrero@uteq.edu.ec`

---

## Cronograma general y etiquetas de entrega

| Entrega   | Fecha (calendario académico) | Tag           | Guía LaTeX                     |
|-----------|------------------------------|---------------|--------------------------------|
| Entrega 1 | Viernes de la semana 4       | `v0.2.0`      | `docs/entregas/Guia_Entrega1_IngReq.tex` |
| Entrega 2 | Viernes de la semana 8       | `v0.5.0`      | `docs/entregas/Guia_Entrega2_IngReq.tex` |
| Entrega 3 | Viernes de la semana 12      | `v0.8.0-rc`   | `docs/entregas/Guia_Entrega3_IngReq.tex` |
| Entrega Final | Viernes de la semana 16  | `v1.0.0`      | `docs/entregas/Guia_Entrega4_IngReq.tex` |

Cada guía debe leerse íntegramente **antes** de comenzar la entrega correspondiente. Las guías son autoritativas: definen los requisitos ineludibles, los entregables, la rúbrica y el procedimiento de defensa.

---

## Estructura del repositorio

```
docs/
├── entregas/                 Guías LaTeX de las 4 entregas + bibliografía compartida
│   ├── Guia_Entrega1_IngReq.tex
│   ├── Guia_Entrega2_IngReq.tex
│   ├── Guia_Entrega3_IngReq.tex
│   ├── Guia_Entrega4_IngReq.tex
│   ├── preamble_ingreq.tex   Preámbulo LaTeX compartido
│   └── IngReq.bib            Bibliografía compartida (referencias verificadas)
├── requisitos/               Elicitación, especificación Volere, matrices, priorizaciones
│   ├── elicitacion/          Instrumentos y datos recolectados
│   ├── especificacion/       Requisitos formales en Volere
│   ├── priorizacion/         MoSCoW y Kano
│   └── validacion/           Revisiones formales con stakeholders
├── arquitectura/             Diagramas UML y de análisis (Entrega 3+)
│   ├── uml/
│   └── analisis/
├── plantillas/               Plantillas reutilizables (Volere, Cockburn, PRISMA, ADR, CFF)
├── adr/                      Architecture Decision Records
└── observaciones/            Registro perpetuo de observaciones docentes

assets/
├── figuras/                  Imágenes exportadas (vista conceptual, diagramas UML PNG)
├── tablas/                   Tablas independientes (si aplica)
├── uml/                      Fuentes nativas de Visual Paradigm o draw.io
└── prototipos/               Wireframes de baja fidelidad (Figma, Excalidraw)

scripts/                      Scripts reproducibles de análisis y verificación
tests/                        (Opcional) Pruebas automáticas de artefactos
.github/workflows/            CI: compila las guías, verifica citas, calcula métricas
```

---

## Instrucciones rápidas para el equipo

1. **Constitúyanse formalmente en la semana 1**. Envíen a `gguerrero@uteq.edu.ec` los nombres, cédulas, correos institucionales, roles asumidos y URL del repositorio en GitHub.
2. **Compilen las guías localmente**. Requieren `texlive-full` (o al menos `texlive-latex-extra`, `texlive-lang-spanish`, `lmodern`, `texlive-bibtex-extra`). El comando canónico es:
   ```bash
   cd docs/entregas
   pdflatex Guia_Entrega1_IngReq.tex
   bibtex   Guia_Entrega1_IngReq
   pdflatex Guia_Entrega1_IngReq.tex
   pdflatex Guia_Entrega1_IngReq.tex
   ```
3. **Sigan la disciplina de commits**. Cada integrante realiza sus commits con su cuenta personal de GitHub autenticada con su correo institucional. La autoría se audita con:
   ```bash
   git log --pretty=format:'%an <%ae>' | sort | uniq -c | sort -rn
   ```
4. **Aplique las etiquetas de entrega** en el commit de cierre exacto:
   ```bash
   git tag -a v0.2.0 -m "Entrega 1 - YYYY-MM-DD - <Apellidos>"
   git push origin v0.2.0
   ```
5. **Registre toda observación docente** en `docs/observaciones/OBSERVACIONES.md` con código `OBS-NN`, texto íntegro, decisión, commit de resolución y estado.

---

## Estándares aplicables (referencia rápida)

- **ISO/IEC/IEEE 29148:2018** — Procesos de ingeniería de requisitos.
- **INCOSE Guide to Writing Requirements v4 (2023)** — 41 reglas de redacción, 15 características de calidad.
- **PRISMA 2020** — Reporte de revisiones sistemáticas.
- **FAIR (Wilkinson et al., 2016)** — Gestión de datos de investigación.
- **ACM SIGSOFT Empirical Standards (Ralph et al., 2021)** — Investigación empírica en ingeniería del software.
- **Citation File Format v1.2.0** — Formato del `CITATION.cff`.

---

## Licencia

Este repositorio está publicado bajo licencia **MIT** (ver `LICENSE`). Los estudiantes pueden hacer fork y adaptar libremente, respetando la atribución al docente responsable.
