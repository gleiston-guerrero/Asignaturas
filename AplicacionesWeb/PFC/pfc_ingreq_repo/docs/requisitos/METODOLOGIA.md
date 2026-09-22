# Metodología del PFC

**Ejemplo trabajado**: reconstruido a partir de la Sección 4 del proyecto modelo (Toaquiza et al., 2025). El enfoque metodológico es **no negociable** para todos los equipos: garantiza homogeneidad y facilita la evaluación comparada.

---

## 1. Enfoque metodológico híbrido

Se adopta una metodología híbrida que integra tres marcos complementarios, aplicados en paralelo durante todo el ciclo del PFC:

- **Scrum** — estructura iterativa e incremental mediante sprints cortos y revisión continua de avances.
- **Kanban** — herramienta visual para gestionar el flujo de trabajo, mostrar el estado de cada tarea y permitir que los integrantes trabajen en paralelo sin bloqueos.
- **Volere** — marco documental para especificar cada requisito con formato estandarizado, categorización conforme a ISO/IEC/IEEE 29148:2018 y trazabilidad directa a fuentes y casos de uso.

## 2. Roles traspolados

Los cinco roles Scrum se traspolan al contexto académico así:

| Rol Scrum         | Rol traspolado al PFC              | Responsabilidades principales                                                                                              |
|-------------------|------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| Product Owner     | Product Owner institucional (docente) | Validar avances, corregir con retroalimentación estratégica.                                                              |
| Scrum Master      | Coordinador(a) del equipo          | Facilitar coordinación, organizar Scrum y Kanban, asegurar entregables y trazabilidad.                                    |
| Development Team  | Arquitecto(a) de Requisitos        | Evaluar viabilidad técnica, modelar diagramas UML, garantizar coherencia requisitos-diseño.                               |
| Development Team  | Analista Funcional                 | Liderar elicitación (entrevistas y encuestas), interpretar necesidades, redactar RF y RNF en Volere.                      |
| Development Team  | Documentador(a) Técnico(a)         | Sistematizar hallazgos, elaborar matrices, mantener conformidad con ISO/IEC/IEEE 29148, preparar artefactos de validación. |

## 3. Sprints previstos

El PFC se organiza en **ocho sprints temáticos** que se ejecutan en paralelo con las cuatro entregas:

| Sprint | Título                                                     | Fase de la entrega |
|--------|------------------------------------------------------------|--------------------|
| S1     | Recolección y clasificación de información preliminar     | Entrega 1 |
| S2     | Análisis y depuración de información                       | Entrega 1 |
| S3     | Documentación estructurada de requisitos (Volere)          | Entrega 2 |
| S4     | Matriz de trazabilidad y priorización (MoSCoW y Kano)      | Entrega 2 |
| S5     | Modelado funcional UML (casos de uso, clases, actividad)   | Entrega 3 |
| S6     | Diagramas de análisis de requisitos (contexto, i*, SysML)  | Entrega 3 |
| S7     | Validación y retroalimentación con *stakeholders*          | Entrega 3 |
| S8     | Consolidación estable, métricas INCOSE, FAIR, defensa      | Entrega Final |

Cada sprint dura aproximadamente **dos semanas** y aplica el ciclo de planificación, ejecución, revisión y retrospectiva. El detalle de tareas, objetivos y entregables por sprint se registra en el tablero Kanban del equipo (Trello o Jira).

## 4. Técnicas de elicitación

Tres técnicas se combinan para triangular la información recolectada:

| Técnica | Fundamentación | Procedimiento | Tratamiento de datos |
|---------|----------------|---------------|-----------------------|
| Entrevistas semi-estructuradas | Permiten captar información contextual y descubrir requisitos que no se identifican con métodos rígidos [Hove & Anda, 2005]. | Realizar entre 5 y 7 entrevistas con actores clave: coordinación y rol operativo principal. Grabar con consentimiento firmado. | Transcripción íntegra en Drive privado; resumen temático anónimo en `docs/requisitos/elicitacion/entrevistas/`. |
| Encuestas en línea | Proporcionan visión estadística representativa de las necesidades de los usuarios [Kitchenham & Pfleeger, 2008]. | Aplicar la encuesta a ≥ 30 usuarios finales masivos (por ejemplo estudiantes o clientes). | Exportación de respuestas, cálculo de porcentajes, gráficos vectoriales reproducibles con `scripts/analisis-encuesta.py`. |
| Revisión documental | Aporta requisitos normativos y buenas prácticas desde reglamentos y literatura especializada [ISO/IEC/IEEE 29148:2018]. | Analizar normativa institucional aplicable (por ejemplo RPC-SO-44-No.586-2015) y estudios previos. | Identificación de requisitos obligatorios y contrastación con hallazgos de entrevistas y encuestas. |

## 5. Validación con *stakeholders*

La validación se realiza aplicando tres técnicas complementarias:

- **Revisión formal de requisitos** con los *stakeholders* previamente entrevistados, para verificar completitud, consistencia y claridad de los enunciados.
- **Prototipos de baja fidelidad** (wireframes) de las pantallas críticas, para discutir viabilidad y pertinencia con los *stakeholders*.
- **Modelo Kano** aplicado en conversación durante la validación, clasificando los requisitos en Imprescindibles (insatisfactores), Satisfactorios (unidimensionales) y Atractivos (delighters).

## 6. Justificación del enfoque

- **Adaptabilidad al entorno universitario**, donde el equipo tiene disponibilidad parcial y los *stakeholders* participan de forma intermitente.
- **Capacidad para registrar, clasificar y revisar requisitos** de forma ordenada con herramientas accesibles (Trello, Google Drive, Visual Paradigm, Google Forms).
- **Enfoque participativo**, que permite validar requerimientos con los interesados durante el mismo proceso de análisis.
- **Balance entre estructura y flexibilidad**, combinando la estandarización de Volere con la agilidad operativa de Scrum y la visualización de Kanban.
- **Priorización con base en valor percibido** mediante el modelo Kano, complementaria a MoSCoW.
- **Trazabilidad completa** desde la fuente (entrevista, encuesta, normativa) hasta el caso de uso, la historia de usuario y la métrica de calidad INCOSE.

## Referencias

Ver `docs/entregas/IngReq.bib`. Fuentes principales usadas en la metodología:

- Schwaber & Sutherland (2020) — Scrum Guide.
- Kniberg & Skarin (2010) — Kanban and Scrum.
- Porter, Letier & Sasse (2014) — Volere (RE 2014).
- Robertson & Robertson (2012) — Mastering the Requirements Process.
- Hove & Anda (2005) — Semi-structured interviews (METRICS 2005).
- Kitchenham & Pfleeger (2008) — Personal Opinion Surveys.
- ISO/IEC/IEEE 29148:2018 — Requirements Engineering.
- INCOSE (2023) — Guide to Writing Requirements v4.
- Kano et al. (1984) — Attractive Quality and Must-Be Quality.
