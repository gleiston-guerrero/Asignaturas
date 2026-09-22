# ADR-001: Dominio, alcance y sistema propuesto del PFC

## Estado

`Aprobada`

## Contexto

En la semana 1 del período académico, el equipo debe elegir un problema real dentro del dominio de la UTEQ o de una organización pública o privada del cantón Quevedo con la cual pueda concertar acceso legítimo a *stakeholders*. Esta decisión determina todo el trabajo posterior de las cuatro entregas del PFC, por lo que debe estar sólidamente justificada y documentada desde el inicio.

La Guía de la Primera Entrega exige que el problema sea real, no hipotético, y que exista evidencia de que el equipo tendrá acceso a las personas relevantes durante las semanas 5-8 (elicitación) y 11-12 (validación).

## Decisión

**Ejemplo trabajado (proyecto modelo)**: el equipo del proyecto modelo eligió el dominio de **gestión de tutorías académicas en la UTEQ**, con foco en la Carrera de Ingeniería de Software y sus tres actores principales (estudiantes, docentes y coordinación académica).

El sistema propuesto es una **plataforma web institucional** que permite formalizar las solicitudes de tutoría, gestionar la disponibilidad docente, registrar sesiones realizadas, generar reportes institucionales y notificar automáticamente los cambios de estado.

**Instrucciones para el equipo real (a personalizar)**:
- Reemplace el ejemplo de tutorías por su dominio elegido.
- Justifique la elección con al menos dos fuentes: una académica (referencia bibliográfica) y una institucional (constancia de acceso a los *stakeholders*).
- Declare las inclusiones y exclusiones del alcance de forma explícita.

## Consecuencias

### Positivas

- El equipo tiene acceso demostrable a *stakeholders* reales.
- El dominio permite aplicar todas las técnicas exigidas por la asignatura (entrevistas, encuestas, revisión documental, modelado UML, i*, SysML).
- Existe normativa institucional (RPC-SO-44-No.586-2015 del CES) que sustenta requisitos de proceso.

### Negativas

- La disponibilidad de los *stakeholders* depende de sus obligaciones docentes o administrativas, con potencial demora en la agenda de entrevistas.
- Ciertos actores (por ejemplo la Vicerrectoría Académica) pueden requerir autorización institucional previa que ralentice el proceso.

### Riesgos residuales

- **Riesgo**: un *stakeholder* clave se ausente durante todo el período académico. **Mitigación**: identificar al menos dos *stakeholders* alternativos por cada rol.
- **Riesgo**: el docente responsable rechace el dominio elegido durante la revisión de la Entrega 1. **Mitigación**: consultar con el docente antes de la semana 2, informalmente por correo, con una descripción de dos párrafos del dominio propuesto.

## Alternativas consideradas

### Alternativa A: sistema hipotético inspirado en la Ley de Educación Ecuatoriana

Se descartó porque la Guía de la Primera Entrega prohíbe explícitamente el uso de datos ficticios y exige interacción demostrable con personas reales.

### Alternativa B: sistema para una organización externa del sector privado

Se descartó porque el acceso a los *stakeholders* no estaba asegurado por la vía institucional, y porque el período académico es corto (16 semanas). Esta alternativa se retomaría si el equipo tuviera una relación laboral previa con la organización.

## Fecha de la decisión

`2026-03-13` (semana 2 del período académico)

## Autores

- Equipo del PFC (los cuatro estudiantes)
- Dr. Gleiston Guerrero Ulloa (Product Owner institucional, aval de la decisión)

## Referencias

- Consejo de Educación Superior. *Reglamento para Carreras y Programas Académicos en Modalidades en Línea, a Distancia y Semipresencial o de Convergencia de Medios* (RPC-SO-44-No.586-2015). Quito, Ecuador, 2015.
- ISO/IEC/IEEE 29148:2018, cláusula 6.2.1 (Business or Mission Analysis).
- Correo del docente responsable de fecha `2026-03-12`, aval preliminar del dominio.
