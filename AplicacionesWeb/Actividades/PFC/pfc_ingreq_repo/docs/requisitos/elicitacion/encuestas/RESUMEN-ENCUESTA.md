# RESUMEN EJECUTIVO — Encuesta a estudiantes

**Ejemplo trabajado**: reconstruido a partir del Anexo C.7.3.2 del proyecto modelo. El equipo del PFC debe adaptar con sus propios datos.

---

## Metadatos

- **Fecha de aplicación**: `2025-06-16` a `2025-07-01`
- **Población objetivo**: estudiantes de la Carrera de Ingeniería de Software (aproximadamente 400 activos en el semestre)
- **Muestra alcanzada**: 40 respuestas válidas
- **Tasa de respuesta**: 10 % del universo estimado
- **Canal de difusión**: correo institucional + grupo oficial de Telegram
- **Herramienta**: Google Forms
- **Anonimización**: se eliminaron correos, IPs y timestamps de identificación antes de subir el CSV al repositorio

## Hallazgos por pregunta

### P1 — Frecuencia de sesiones académicas

| Frecuencia | Respuestas | Porcentaje |
|------------|------------|------------|
| Nunca | 3 | 14.3 % |
| Rara vez (1-2 por semestre) | 8 | 38.1 % |
| Ocasionalmente (3-5 por semestre) | 8 | 38.1 % |
| Frecuentemente (más de 5 por semestre) | 2 | 9.5 % |

**Lectura**: 76.2 % de los estudiantes necesita sesiones al menos ocasionalmente. Existe demanda significativa para un sistema formal.

### P2 — Tipo de apoyo esperado (selección múltiple)

| Tipo | Respuestas | Porcentaje |
|------|------------|------------|
| Resolución de dudas específicas | 14 | 66.7 % |
| Retroalimentación sobre trabajos/proyectos | 13 | 61.9 % |
| Preparación para evaluaciones | 11 | 52.4 % |
| Orientación sobre métodos de estudio | 8 | 38.1 % |
| Revisión de avances | 7 | 33.3 % |

### P3 — Información esencial al solicitar sesión

| Campo | Respuestas | Porcentaje |
|-------|------------|------------|
| Tema o actividad específica | 14 | 66.7 % |
| Horario de preferencia | 13 | 61.9 % |
| Asignatura | 7 | 33.3 % |
| Opción de adjuntar archivo | 6 | 28.6 % |

### P4 — Principales desafíos (codificación abierta)

| Categoría emergente | Menciones | Porcentaje |
|---------------------|-----------|------------|
| Disponibilidad de horarios | 10 | 47.6 % |
| Conexión a internet inestable | 5 | 23.8 % |
| Gestión del tiempo | 4 | 19.0 % |
| Falta de compromiso/respuesta rápida docentes | 2 | 9.5 % |

### P5 — Utilidad de notificaciones automáticas (Likert 1-5)

- Puntaje 4-5 (útil o muy útil): 19 respuestas (90.5 %)
- Puntaje 3: 1 respuesta
- Puntaje 1-2: 1 respuesta

### P6 — Importancia de coordinación de horarios (Likert 1-5)

- Puntaje 4-5 (importante o muy importante): 20 respuestas (95.2 %)

### P7 — Canales preferidos para notificaciones

| Canal | Respuestas | Porcentaje |
|-------|------------|------------|
| WhatsApp | 11 | 52.4 % |
| Notificaciones en la plataforma | 11 | 52.4 % |
| Correo institucional | 10 | 47.6 % |
| SMS | 4 | 19.0 % |

### P8 — Importancia de actualizaciones de estado (Likert 1-5)

- Puntaje 4-5: 20 respuestas (95.2 %)

### P9 — Formato preferido de sesiones

| Formato | Respuestas | Porcentaje |
|---------|------------|------------|
| Elegir entre individual y grupal según necesidad | 12 | 57.1 % |
| Sesiones grupales | 8 | 38.1 % |
| Sesiones individuales | 1 | 4.8 % |

### P10 — Importancia de opción presencial (Likert 1-5)

- Puntaje 4-5: 16 respuestas (76.2 %)

### P11 — Funcionalidades esperadas (codificación abierta)

Categorías emergentes:
- Recordatorios visuales antes de la sesión.
- Integración con Google Calendar / calendario personal.
- Historial de tutorías realizadas y del docente.
- Sistema de evaluación del docente al final de la sesión.
- Chat de duda rápida antes de la sesión.

## Requisitos derivados

De esta encuesta emergieron los siguientes requisitos tentativos:

- RF-01, RF-06, RF-09, RF-12, RF-14, RF-16 (flujos directos del estudiante).
- RF-13, RF-15 (preferencias).
- RI-01, RI-08 (interfaz de solicitud y consulta de estado).
- RU-01, RU-02 (usabilidad: navegación fluida, claridad de información).

## Amenazas a la validez

- **Tamaño de muestra**: 40 respuestas es adecuado para un PFC pero limitado para generalización estadística; los porcentajes tienen intervalos de confianza amplios.
- **Sesgo de autoselección**: quienes respondieron pueden ser los más motivados por la temática; se compensa parcialmente con las entrevistas.
- **Temporalidad**: la aplicación coincidió con periodo de exámenes finales, lo que puede haber sesgado las respuestas hacia la preparación para evaluaciones.

## Enlaces

- Cuestionario en Google Forms: `[enlace restringido, solo para docente]`
- Respuestas crudas anonimizadas: `respuestas-crudas.csv`
- Script de análisis: `../../../../scripts/analisis-encuesta.py`
- Gráficos vectoriales: `graficos/`
