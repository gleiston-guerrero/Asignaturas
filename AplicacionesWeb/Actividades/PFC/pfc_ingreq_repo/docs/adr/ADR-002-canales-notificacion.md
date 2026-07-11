# ADR-002: Canales de notificación soportados por el sistema propuesto

## Estado

`Aprobada`

## Contexto

Durante la Entrega 2, las entrevistas con docentes revelaron que el canal preferido para notificaciones es WhatsApp, seguido de una aplicación móvil dedicada. La coordinadora académica sugiere la posibilidad de correo institucional. Los estudiantes, según la encuesta, prefieren notificaciones en la propia plataforma o WhatsApp (52.4 % cada uno).

Debe decidirse qué canales soporta la plataforma y con qué prioridad. La decisión afecta:

- El requisito RF-13 (Configurar preferencias de usuario).
- El requisito RF-14 (Notificación de solicitudes de tutoría).
- El requisito RF-15 (Configurar frecuencia de recordatorio).
- La arquitectura del sistema (interfaces con APIs externas).

## Decisión

El sistema soportará los siguientes canales de notificación, en este orden de prioridad:

1. **Correo institucional** (canal por defecto para todos los usuarios).
2. **Notificación en la plataforma** (badge y buzón interno).
3. **WhatsApp** (canal opcional, previa configuración de número por el usuario).
4. **SMS** (declarado como fuera de alcance para v1.0.0; se abre como trabajo futuro).

El correo institucional se elige como canal por defecto porque:
- Su infraestructura (Google Workspace UTEQ) ya está desplegada y estable.
- No introduce dependencia de plataforma comercial externa (Meta/WhatsApp).
- Cumple con el requisito de auditoría y trazabilidad (RNF-02).

WhatsApp se soporta como canal opcional porque:
- Es el canal más pedido por docentes y estudiantes.
- La API de WhatsApp Business permite envío programado con verificación.

SMS se difiere porque requiere contratación con proveedor y no fue mayoritariamente demandado en las encuestas (aparece por debajo del 20 % de preferencias).

## Consecuencias

### Positivas

- El sistema puede desplegarse sin depender de contratos con terceros comerciales para el canal por defecto.
- El usuario tiene flexibilidad para elegir su canal preferido.
- Auditoría y trazabilidad quedan cubiertas por defecto (correo institucional deja rastro en el servidor SMTP institucional).

### Negativas

- La integración con WhatsApp Business requiere aprobación de Meta y potencialmente costos operativos.
- La disponibilidad de WhatsApp depende de que el usuario mantenga su cuenta activa.

### Riesgos residuales

- **Riesgo**: WhatsApp Business API cambia sus términos y bloquea el uso institucional. **Mitigación**: mantener el correo institucional como canal por defecto, sin depender exclusivamente de WhatsApp.

## Alternativas consideradas

### Alternativa A: solo correo institucional

Se descartó porque el 90.5 % de los estudiantes considera útil o muy útil recibir notificaciones automáticas y el 52.4 % prefiere WhatsApp explícitamente.

### Alternativa B: WhatsApp como canal por defecto

Se descartó por dependencia comercial de Meta y por dificultades de auditoría (los mensajes se envían fuera del control institucional).

## Fecha de la decisión

`2026-05-20` (semana 7 del período académico)

## Autores

- Equipo del PFC
- Dr. Gleiston Guerrero Ulloa (Product Owner institucional)

## Referencias

- Resúmenes de entrevistas ENT-01 (Ing. Jessica Ponce), ENT-02 (Ing. Efraín Díaz), ENT-03 (Ing. Angelita Bosquez), ENT-04 (Ing. Márquez de la Plata), ENT-05 (Ing. Daisy Nata).
- `docs/requisitos/elicitacion/encuestas/RESUMEN-ENCUESTA.md` (n = 40 respuestas).
- ISO/IEC/IEEE 29148:2018, cláusula 6.4.4 (Interface Requirements).
