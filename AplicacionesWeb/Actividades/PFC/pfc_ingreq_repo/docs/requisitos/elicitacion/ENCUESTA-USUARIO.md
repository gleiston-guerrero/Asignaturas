# Encuesta al usuario final masivo (estudiantes o clientes)

**Ejemplo trabajado**: basado en la encuesta del Anexo B.7.2.3 del proyecto modelo (Sistema de Gestión de Tutorías Académicas en la UTEQ, encuesta a estudiantes). El equipo del PFC debe adaptar la encuesta al dominio y al rol usuario final masivo del suyo.

**Herramienta recomendada**: Google Forms (para facilidad de análisis con `scripts/analisis-encuesta.py`).

---

## Título de la encuesta

Encuesta sobre necesidades y preferencias en la gestión de [el proceso] — Proyecto Fin de Curso, Ingeniería de Requisitos, UTEQ 2026-2027.

## Objetivo declarado al inicio del formulario

> Estimado/a participante: somos un equipo de estudiantes del cuarto nivel de Ingeniería de Software de la UTEQ. Estamos desarrollando un proyecto académico para analizar las necesidades de [el proceso al que se dirige el sistema]. Su participación es totalmente voluntaria y anónima. Sus respuestas serán utilizadas únicamente para fines académicos. La encuesta toma aproximadamente 5-8 minutos.

## Preguntas

### Sección 1 — Frecuencia y contexto

**P1.** ¿Con qué frecuencia [realiza la acción del proceso]?

- Nunca
- Rara vez (1-2 veces por [período])
- Ocasionalmente (3-5 veces por [período])
- Frecuentemente (más de 5 veces por [período])

*[Adaptar el período: por ejemplo "por semestre" en el modelo original]*

**P2.** ¿Qué tipo de apoyo/servicio espera obtener de [el proceso]? (selección múltiple)

- [Categoría 1: ej. resolución de dudas específicas]
- [Categoría 2: ej. retroalimentación sobre trabajos]
- [Categoría 3: ej. revisión de avances]
- [Categoría 4: ej. orientación metodológica]
- [Categoría 5: ej. preparación para evaluación]
- Otras (indique cuáles): __________

### Sección 2 — Información esencial

**P3.** ¿Qué información considera esencial incluir al [solicitar/iniciar el proceso]? (selección múltiple)

- [Campo 1: ej. asignatura]
- [Campo 2: ej. tema o actividad específica]
- [Campo 3: ej. horario preferido]
- [Campo 4: ej. archivo adjunto]
- Otras (indique cuáles): __________

**P4.** ¿Cuáles son los principales desafíos que enfrenta al [realizar el proceso] en la actualidad? (pregunta abierta, obligatoria)

_[Texto libre; se codificará posteriormente con codificación abierta]_

### Sección 3 — Notificaciones y coordinación

**P5.** ¿Qué tan útil sería recibir notificaciones automáticas sobre [los cambios de estado]? *(escala Likert 1-5)*

- 1 (nada útil) — 2 — 3 — 4 — 5 (muy útil)

**P6.** ¿Qué tan importante es que el sistema facilite [la coordinación con otros actores]? *(escala Likert 1-5)*

- 1 (nada importante) — 2 — 3 — 4 — 5 (muy importante)

**P7.** ¿Qué canales prefiere para recibir notificaciones? (selección múltiple)

- Correo institucional
- Notificaciones en la propia plataforma
- WhatsApp
- SMS
- Otras (indique cuáles): __________

**P8.** ¿Qué tan importante es recibir actualizaciones sobre el estado de sus solicitudes (por ejemplo, si fueron recibidas, están en proceso o confirmadas)? *(escala Likert 1-5)*

- 1 (nada importante) — 2 — 3 — 4 — 5 (muy importante)

### Sección 4 — Preferencias de modalidad

**P9.** ¿Qué formato prefiere para [las sesiones u operaciones del proceso]?

- Individuales (solo usted y [la contraparte])
- Grupales (con otros usuarios)
- Posibilidad de elegir entre individuales y grupales según la necesidad

**P10.** Si el sistema incluyera la posibilidad de [modalidad alternativa, por ejemplo presencial], ¿qué tan importante sería para usted poder elegir esa modalidad? *(escala Likert 1-5)*

- 1 (nada importante) — 2 — 3 — 4 — 5 (muy importante)

### Sección 5 — Expectativas abiertas

**P11.** ¿Qué funcionalidades o características espera que incluya una plataforma para facilitar [el proceso]? (pregunta abierta, obligatoria)

_[Texto libre]_

### Sección 6 — Datos demográficos anonimizados (opcional)

**P12.** [Nivel académico / franja de edad / semestre]

- [Opción 1]
- [Opción 2]
- [Opción 3]
- Prefiero no responder

**P13.** [Modalidad de estudios / rol dentro de la organización]

- [Opción 1]
- [Opción 2]

## Notas metodológicas

- Meta de respuestas: **al menos 30 respuestas válidas** o el 10 % del universo, lo que sea menor, con piso absoluto de 20.
- Difusión: por canales institucionales acordados con el docente (correo masivo, grupos oficiales, tablero institucional). No difundir por canales no institucionales que puedan sesgar la muestra.
- Análisis: usar `scripts/analisis-encuesta.py` para producir gráficos vectoriales reproducibles. Codificar las preguntas abiertas con codificación abierta (dos revisores del equipo, en paralelo, para verificar la coincidencia).
- Anonimato: exportar las respuestas crudas eliminando cualquier campo de identificación (correo institucional, IP, cuenta de Google). El archivo con datos identificables no debe subirse al repositorio público.

Referencia autoritativa: Kitchenham, B. A. & Pfleeger, S. L. (2008). *Personal Opinion Surveys*, in Guide to Advanced Empirical Software Engineering, Springer.
