# Priorización MoSCoW y Kano — Ejemplo trabajado

**Ejemplo trabajado**: reconstruido a partir de la Tabla 15 del proyecto modelo (Kano) y sintetizado con MoSCoW en cruce coherente. El equipo del PFC debe reemplazar por sus propios requisitos y priorizaciones.

## Priorización MoSCoW

| ID | Nombre | Prioridad Volere | MoSCoW | Justificación |
|----|--------|------------------|--------|---------------|
| RF-01 | Registro de solicitud de tutoría | Alta | **Must** | Sin esta funcionalidad el sistema no cumple su propósito principal. |
| RF-02 | Configurar disponibilidad del docente | Alta | **Must** | Sin agenda docente no hay tutorías gestionables. |
| RF-03 | Gestión de solicitudes | Alta | **Must** | Es el flujo central del docente. |
| RF-04 | Registro de tutoría realizada | Media | **Must** | Sin registro no hay trazabilidad ni reportes. |
| RF-05 | Confirmación de asistencia | Baja | **Should** | Deseable para reportes pero no bloquea el flujo principal. |
| RF-06 | Consultar estado de solicitudes | Media | **Must** | Transparencia mínima para el estudiante. |
| RF-07 | Generación de reportes institucionales | Media | **Should** | Puede diferirse a una segunda iteración. |
| RF-08 | Agrupación de sesiones de tutoría | Baja | **Could** | Mejora la eficiencia docente; no bloquea. |
| RF-09 | Selección de modalidad | Media | **Must** | Necesario para diferenciar tutoría presencial y virtual. |
| RF-10 | Actualización de espacios físicos (SGA) | Alta | **Should** | Ideal, pero depende de la integración con SGA que puede ser diferida. |
| RF-11 | Consulta del historial | Media | **Should** | Deseable, especialmente para trazabilidad. |
| RF-12 | Seleccionar tipo de tutoría | Baja | **Should** | Flexibilidad del estudiante; no bloquea. |
| RF-13 | Configurar preferencias de usuario | Baja | **Could** | Mejora la experiencia; no es crítico. |
| RF-14 | Notificación de solicitudes | Media | **Must** | Sin notificaciones el sistema no ofrece ventaja sobre WhatsApp actual. |
| RF-15 | Configurar frecuencia de recordatorio | Baja | **Could** | Refinamiento opcional. |
| RF-16 | Visualización de horarios disponibles | Alta | **Must** | Necesario para el flujo de solicitud. |
| RF-17 | Registrar duración | Media | **Should** | Necesario para reportes precisos. |
| RF-18 | Seleccionar tipo de espacio físico | Alta | **Should** | Necesario si se implementa integración SGA. |
| RF-19 | Configurar modalidad de trabajo | Media | **Should** | Necesario para diferenciar preferencias docentes. |
| RF-20 | Configurar horario de disponibilidad | Media | **Must** | Igual que RF-02: sin horario no hay agenda. |
| RF-21 | Rechazo de sesiones | Media | **Must** | Necesario para manejar imprevistos. |
| RF-22 | Reprogramación de sesiones | Alta | **Must** | Necesario para gestión realista de agenda. |
| RF-23 | Generación de reportes para docentes | Baja | **Should** | Deseable para el docente. |
| RF-24 | Exportación de reportes en PDF y Excel | Baja | **Should** | Necesario para uso administrativo. |
| RF-25 | Asignación de nuevo horario para grupales | Media | **Should** | Necesario si se implementan sesiones grupales. |
| RF-26 | Visualización de estadísticas rápidas | Baja | **Could** | Mejora la experiencia del coordinador; no bloquea. |

## Priorización Kano

| Imprescindibles (Insatisfactores) | Satisfactorios (Unidimensionales) | Atractivos (Delighters) |
|-----------------------------------|-----------------------------------|-------------------------|
| RF-01 — Registro de solicitud | RF-22 — Reprogramación considerando disponibilidad del estudiante | RF-26 — Visualización de estadísticas rápidas |
| RF-02 — Configurar disponibilidad docente | RF-24 — Exportación PDF y Excel | |
| RF-03 — Gestión de solicitudes | RF-23 — Reportes para docentes | |
| RF-04 — Registro de tutoría realizada | RF-14 — Notificación de solicitudes | |
| RF-05 — Confirmación de asistencia | | |
| RF-06 — Consultar estado de solicitudes | | |
| RF-07 — Generación de reportes institucionales | | |
| RF-10 — Actualización espacios SGA | | |
| RF-11 — Consulta del historial | | |
| RF-12 — Seleccionar tipo de tutoría | | |
| RF-16 — Visualización de horarios disponibles | | |
| RF-20 — Configurar horario | | |
| RF-21 — Rechazo de sesiones | | |
| RF-25 — Asignación nuevo horario grupales | | |

**Evidencia de conversaciones Kano**:

- Ing. Jessica Ponce (Coordinación, ENT-01): confirmó como imprescindibles RF-01, RF-02, RF-07 y RF-10 durante la conversación del `2026-05-28`.
- Ing. Efraín Díaz (Docente, ENT-02): identificó RF-14 como unidimensional (satisfacción crece con mejor notificación) el `2026-05-29`.
- Encuesta a estudiantes: RF-26 emerge como delighter porque el 76.2 % lo considera útil pero ninguno lo pidió espontáneamente, patrón típico del Kano attractive.

## Reglas de resolución de conflictos MoSCoW / Kano

Los requisitos con conflicto entre MoSCoW y Kano se documentan en `CONFLICTOS-RESUELTOS.md`.

Ejemplo: RF-05 (Confirmación de asistencia) tiene prioridad Volere "Baja" pero clasifica como Kano "Imprescindible". Se mantiene como **Should** en MoSCoW (por criterio de viabilidad temporal) y se documenta en el ADR-003 que si el tiempo lo permite, se sube a Must.
