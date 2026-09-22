# Sistema propuesto

**Ejemplo trabajado**: reconstruido a partir de la Sección 3 del proyecto modelo. El equipo del PFC debe reemplazar este ejemplo por la descripción de su sistema propuesto.

---

## 1. Título del sistema

Sistema Web Institucional para la Gestión de Tutorías Académicas en la UTEQ.

## 2. Descripción general

Como resultado del análisis del contexto institucional y de las deficiencias identificadas en los modelos revisados en el estado del arte, se plantea un sistema web institucional para la gestión integral de tutorías académicas en la UTEQ. Este sistema estará orientado a optimizar el proceso de atención académica entre docentes y estudiantes, facilitando la organización, solicitud, seguimiento y evaluación de sesiones de refuerzo, revisión de trabajos y orientación académica.

La propuesta busca superar las limitaciones recurrentes en experiencias previas:

- Ausencia de un registro formal.
- Baja trazabilidad de las acciones.
- Falta de coordinación entre actores.
- Escasa integración con las plataformas académicas existentes.

## 3. Actores principales

| Actor | Descripción |
|-------|-------------|
| **Estudiante** | Usuario final que solicita tutorías, indicando asignatura, tema, disponibilidad y modalidad preferida. Consulta el estado de sus solicitudes y su historial. |
| **Docente** | Configura su disponibilidad, gestiona solicitudes (acepta, rechaza, propone nueva fecha), registra tutorías realizadas y sus asistentes, genera reportes personales. |
| **Coordinación académica** | Monitorea actividad tutorial, genera reportes consolidados por carrera o asignatura, obtiene indicadores clave para toma de decisiones. |
| **Sistema (agente automático)** | Envía notificaciones, valida reglas de negocio, integra con el SGA, mantiene bitácora de auditoría. |
| **SGA (sistema externo)** | Provee información sobre asignaturas activas del ciclo académico, disponibilidad de aulas y laboratorios. |

## 4. Módulos funcionales identificados en primera aproximación

1. **Módulo de gestión de solicitud de tutoría** — el estudiante inicia el proceso registrando la solicitud con todos sus datos.
2. **Módulo de gestión de disponibilidad y preferencias** — el docente registra sus horarios y modalidades, y ambos actores configuran preferencias de notificación.
3. **Módulo de registro y seguimiento de tutorías** — el docente registra las sesiones realizadas y la asistencia, ambos actores consultan el historial.
4. **Módulo de reportes** — la coordinación y los docentes generan reportes filtrables y los exportan en PDF y Excel.
5. **Módulo de integración institucional** — el sistema se conecta con el SGA para validar disponibilidad de espacios físicos y actualizar en tiempo real.

## 5. Vista conceptual

*(Insertar aquí la vista conceptual del sistema como `assets/figuras/vista-conceptual.png`, referenciada desde el documento académico como Figura 1.)*

La vista conceptual muestra los tres actores humanos (Estudiante, Docente, Coordinación) rodeando al sistema, con los módulos funcionales en el interior, y con la conexión hacia el SGA como sistema externo.

## 6. Beneficios esperados

### Para los estudiantes

- Canal formal y trazable para solicitar tutorías.
- Notificaciones automáticas del estado de sus solicitudes.
- Acceso a historial de tutorías realizadas.
- Flexibilidad para elegir modalidad y tipo de sesión.

### Para los docentes

- Agenda organizada de disponibilidad.
- Panel unificado de solicitudes recibidas con filtros.
- Reportes personales de tutorías realizadas.
- Reducción del uso de canales no institucionales (WhatsApp, correos personales).

### Para la coordinación académica

- Reportes consolidados con indicadores clave.
- Detección de patrones y necesidades recurrentes.
- Toma de decisiones basadas en datos reales.
- Cumplimiento de trazabilidad exigida por normativa.

### Para la institución (UTEQ)

- Consolidación de un entorno tecnológico de apoyo a las tutorías.
- Mejora de la eficiencia, la transparencia y la calidad educativa.
- Modelo replicable a otras carreras.

## 7. No incluidos en el sistema (fuera de alcance)

Explícitamente, el sistema propuesto **no** incluye:

- Videoconferencia integrada: el sistema orquesta las tutorías pero delega la comunicación audiovisual en plataformas externas (Zoom, Meet, Teams).
- Sistema de calificación o evaluación académica: eso corresponde al SGA.
- Facturación o cobros por tutorías: las tutorías son parte del servicio institucional gratuito.
- Módulo de aprendizaje autónomo (recursos educativos): eso corresponde a otras plataformas (Moodle, por ejemplo).

## 8. Notas sobre decisiones tecnológicas

En esta descripción del sistema propuesto **no se toman** decisiones tecnológicas (framework, base de datos, patrón arquitectónico). Esas decisiones corresponden a fases posteriores del proceso de ingeniería, típicamente al PFC de asignaturas de nivel superior (por ejemplo Aplicaciones Web en quinto nivel).
