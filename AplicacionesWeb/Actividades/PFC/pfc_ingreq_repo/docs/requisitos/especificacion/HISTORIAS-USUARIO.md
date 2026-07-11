# Historias de usuario (Connextra + Gherkin)

**Ejemplo trabajado**: reconstruido a partir de la Tabla 14 del proyecto modelo (11 historias de usuario). Se muestran las 11 con criterios de aceptación Gherkin explícitos, sirviendo como patrón de calidad para las historias de usuario propias del equipo del PFC.

**Formato Connextra**: `Como <rol>, quiero <funcionalidad>, para <beneficio>`.
**Criterios INVEST**: cada historia debe ser Independiente, Negociable, Valiosa, Estimable, Small, Testable.

---

## HU-01 — Consultar estado de solicitudes

**Como** estudiante, **quiero** poder consultar el estado de mis solicitudes de tutoría (pendiente, aceptada, rechazada, realizada), **para** saber en qué situación se encuentra cada solicitud y cuándo debo esperar la respuesta.

**Requisitos asociados**: RF-06

**Criterios de aceptación (Gherkin)**:

- **Dado que** soy un estudiante autenticado con al menos una solicitud registrada, **cuando** accedo a la vista "Mis solicitudes", **entonces** el sistema muestra la lista de solicitudes con su estado actualizado.
- **Dado que** el docente cambia el estado de una solicitud, **cuando** el cambio se guarda, **entonces** el estado actualizado se refleja en la vista del estudiante en menos de 30 segundos.

---

## HU-02 — Registrar tutoría realizada

**Como** docente, **quiero** poder registrar las tutorías realizadas con información como duración y observaciones, **para** llevar un control adecuado de las sesiones y tener un historial accesible para futuras referencias.

**Requisitos asociados**: RF-04, RF-11, RF-17

**Criterios de aceptación (Gherkin)**:

- **Dado que** soy un docente con una tutoría en estado "aceptada" y su hora ya pasó, **cuando** accedo a la vista "Registrar sesión realizada", **entonces** el sistema me permite ingresar duración real, asistentes y observaciones.
- **Dado que** intento registrar una sesión sin haber completado los campos obligatorios, **cuando** presiono "Guardar", **entonces** el sistema muestra los campos faltantes con asterisco rojo y no permite el guardado.

---

## HU-03 — Generar reportes institucionales

**Como** coordinador académico, **quiero** poder generar reportes filtrables por carrera, asignatura, docente y estudiante, **para** analizar de manera efectiva la distribución y el impacto de las tutorías en cada área.

**Requisitos asociados**: RF-07, RF-24

**Criterios de aceptación (Gherkin)**:

- **Dado que** soy un coordinador autenticado, **cuando** accedo al panel de reportes y aplico filtros por carrera y período académico, **entonces** el sistema genera un reporte con los datos actualizados en menos de 5 segundos.
- **Dado que** genero un reporte, **cuando** presiono "Exportar PDF" o "Exportar Excel", **entonces** el sistema entrega un archivo válido con el mismo contenido visible en pantalla.

---

## HU-04 — Elegir modalidad de tutoría

**Como** estudiante, **quiero** poder elegir si prefiero una tutoría individual o grupal, **para** seleccionar el tipo que mejor se ajuste a mis necesidades y horarios.

**Requisitos asociados**: RF-09, RF-12

**Criterios de aceptación (Gherkin)**:

- **Dado que** estoy registrando una nueva solicitud de tutoría, **cuando** el docente elegido tiene ambas modalidades habilitadas, **entonces** el sistema muestra las opciones "Individual" y "Grupal" seleccionables.
- **Dado que** el docente solo tiene habilitada la modalidad "Grupal", **cuando** intento seleccionar "Individual", **entonces** el sistema muestra un mensaje explicativo y bloquea la opción.

---

## HU-05 — Configurar disponibilidad del docente

**Como** docente, **quiero** poder configurar mi disponibilidad de tutoría en el sistema, **para** que los estudiantes puedan ver mis horarios disponibles y solicitar tutorías de acuerdo con mi tiempo libre.

**Requisitos asociados**: RF-02, RF-20

**Criterios de aceptación (Gherkin)**:

- **Dado que** soy un docente autenticado, **cuando** accedo a la vista "Mi disponibilidad", **entonces** el sistema me permite añadir, modificar o eliminar franjas horarias en formato semanal.
- **Dado que** intento crear una franja horaria que se solapa con otra ya registrada, **cuando** guardo el cambio, **entonces** el sistema rechaza el guardado y muestra un mensaje "Franja solapada con otra existente".

---

## HU-06 — Registrar solicitud de tutoría

**Como** estudiante, **quiero** poder registrar una solicitud de tutoría indicando asignatura, tema, modalidad y tipo de sesión, **para** que el sistema notifique al docente y quede registrada en el historial.

**Requisitos asociados**: RF-01, RF-09, RF-12, RF-14, RF-16

**Criterios de aceptación (Gherkin)**:

- **Dado que** soy un estudiante autenticado con asignaturas activas, **cuando** completo el formulario de solicitud y presiono "Enviar", **entonces** el sistema registra la solicitud y notifica automáticamente al docente correspondiente.
- **Dado que** intento enviar una solicitud con una asignatura no activa en el ciclo académico, **cuando** presiono "Enviar", **entonces** el sistema bloquea el envío y muestra un mensaje explicativo.

---

## HU-07 — Recibir notificaciones automáticas

**Como** estudiante o docente, **quiero** recibir notificaciones automáticas sobre el estado de una solicitud de tutoría (aceptada, rechazada, reprogramada), **para** mantenerme informado en tiempo real.

**Requisitos asociados**: RF-14

**Criterios de aceptación (Gherkin)**:

- **Dado que** una solicitud cambia de estado, **cuando** el cambio se confirma, **entonces** el sistema envía notificación automática al canal configurado por el usuario en menos de 30 segundos.
- **Dado que** el canal preferido del usuario no está disponible (por ejemplo WhatsApp caído), **cuando** el sistema intenta enviar la notificación, **entonces** aplica el canal de respaldo (correo institucional) y registra el intento fallido en la bitácora.

---

## HU-08 — Configurar preferencias de notificación

**Como** estudiante o docente, **quiero** configurar mis preferencias de notificación (canal y frecuencia), **para** recibir avisos según mis necesidades.

**Requisitos asociados**: RF-13, RF-15

**Criterios de aceptación (Gherkin)**:

- **Dado que** soy un usuario autenticado, **cuando** accedo a "Preferencias de notificación", **entonces** el sistema me permite elegir canal (correo, plataforma o WhatsApp) y frecuencia de recordatorio.
- **Dado que** guardo mis preferencias, **cuando** el sistema envía la siguiente notificación, **entonces** usa el canal y la frecuencia configurada.

---

## HU-09 — Rechazar o reprogramar tutoría

**Como** docente, **quiero** poder rechazar o reprogramar una tutoría indicando motivos o nuevas fechas, **para** gestionar eficientemente mi tiempo y la disponibilidad de los estudiantes.

**Requisitos asociados**: RF-03, RF-21, RF-22, RF-25

**Criterios de aceptación (Gherkin)**:

- **Dado que** tengo una tutoría en estado "aceptada", **cuando** presiono "Reprogramar" y propongo un nuevo horario, **entonces** el sistema valida compatibilidad con el horario del estudiante y notifica automáticamente.
- **Dado que** presiono "Rechazar" en una tutoría aceptada, **cuando** ingreso el motivo, **entonces** el sistema cambia el estado, notifica al estudiante y registra la acción en la bitácora.

---

## HU-10 — Generar reportes personales del docente

**Como** docente, **quiero** generar reportes de mis tutorías filtrados por asignatura, grupo o fechas, **para** analizar el seguimiento académico de mis estudiantes.

**Requisitos asociados**: RF-23, RF-24

**Criterios de aceptación (Gherkin)**:

- **Dado que** soy un docente autenticado, **cuando** accedo a "Mis reportes" y aplico filtros por asignatura y rango de fechas, **entonces** el sistema entrega un reporte con las tutorías correspondientes.
- **Dado que** presiono "Exportar PDF" o "Exportar Excel", **cuando** el sistema completa la generación, **entonces** entrega un archivo válido descargable.

---

## HU-11 — Consultar historial de tutorías

**Como** estudiante o docente, **quiero** consultar el historial de tutorías realizadas, **para** tener acceso a sesiones pasadas y detalles de cada una.

**Requisitos asociados**: RF-11

**Criterios de aceptación (Gherkin)**:

- **Dado que** soy un usuario autenticado con tutorías finalizadas, **cuando** accedo a "Mi historial", **entonces** el sistema muestra la lista filtrable por fecha, estado, tipo de tutoría y tema.
- **Dado que** selecciono una tutoría del historial, **cuando** presiono "Ver detalles", **entonces** el sistema muestra la información completa (duración real, asistentes, observaciones).

---

## Cumplimiento INVEST

Cada una de las 11 historias anteriores cumple con:

| Criterio | Cumple | Justificación |
|----------|--------|---------------|
| **I**ndependent | Sí | Cada historia puede desarrollarse sin depender del cierre de otras |
| **N**egotiable | Sí | La formulación es breve; los detalles se acuerdan con el stakeholder |
| **V**aluable | Sí | Cada historia entrega valor demostrable al rol correspondiente |
| **E**stimable | Sí | El equipo puede estimar el esfuerzo con la información disponible |
| **S**mall | Sí | Cada historia cabe en un sprint de dos semanas |
| **T**estable | Sí | Los criterios de aceptación Gherkin son verificables |
