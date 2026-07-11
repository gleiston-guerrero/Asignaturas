# Síntesis crítica del estado del arte

Documento acompañante de `BUSQUEDA.md` y `TABLA-COMPARATIVA.tex`. Presenta la lectura sintética de los ocho estudios incluidos y declara explícitamente la **brecha identificada** que motiva el PFC.

---

## 1. Patrones comunes identificados

De la revisión de los ocho estudios (Copaci & Rusu, 2015; Bellodi & Dolhnikoff, 2021; Pugatch & Wilson, 2018; Chemin & Schneider, 2025; Maré & Mutezo, 2021; Rojas et al., 2023; Zhang et al., 2023; Merli et al., 2017) emergen cinco patrones recurrentes:

1. **La institucionalización mejora el impacto de la tutoría**. Los estudios de Merli et al. (2017) en la UDES-Bucaramanga cuantifican un aumento entre 1.88 y 2.75 veces en la probabilidad de aprobar la asignatura para estudiantes que participaron en tutorías formales. Este dato converge con el reporte cualitativo de UNISA (Maré & Mutezo, 2021).

2. **La trazabilidad y los reportes son requisitos transversales**. Todos los sistemas revisados incorporan alguna forma de bitácora y de reporte, aun cuando el nivel de detalle varía.

3. **Los canales de notificación son un factor crítico de adopción**. Pugatch & Wilson (2018) documentan que la ausencia de recordatorios reduce la participación estudiantil aun cuando el servicio es gratuito.

4. **La integración con el SGA es deseable pero infrecuente**. Solo dos de los ocho estudios reportan integración explícita con sistemas académicos existentes (Rojas et al., 2023, en Perú; y Maré & Mutezo, 2021, en Sudáfrica).

5. **La carga administrativa emerge como principal limitación**. Cinco de los ocho estudios mencionan explícitamente esta limitación como amenaza a la sostenibilidad.

## 2. Limitaciones recurrentes de los sistemas revisados

Contrastando los ocho estudios, se identifican las siguientes limitaciones sistemáticas:

- **Falta de integración con las plataformas académicas existentes** (6/8 estudios).
- **Escasa flexibilidad para adaptarse a distintos perfiles de usuario** (5/8).
- **Dependencia de la iniciativa individual de docentes** (4/8).
- **Barreras técnicas para la adopción y sostenibilidad** (7/8).
- **Ausencia de mecanismos automatizados de notificación y recordatorio** (5/8).

## 3. Brecha identificada

De la síntesis anterior emerge la siguiente brecha, que el PFC busca cerrar:

> **Ausencia de un sistema institucional de gestión de tutorías académicas para la UTEQ que integre**: (a) elicitación exhaustiva de requisitos de los tres actores centrales del proceso (estudiantes, docentes y coordinación académica), (b) integración con el SGA existente para actualización de disponibilidad de espacios físicos y validación de asignaturas activas, (c) notificaciones automáticas multicanal (correo institucional, notificación in-app, WhatsApp) con configuración de frecuencia, y (d) trazabilidad completa auditable de todas las acciones críticas para uso de la coordinación académica.

## 4. Cómo aborda el PFC esta brecha

El sistema propuesto en este PFC busca cerrar la brecha identificada a través de los siguientes elementos concretos:

- **Elicitación exhaustiva**: al menos cinco entrevistas semi-estructuradas (una a coordinación, cuatro a docentes) y encuesta a más de treinta estudiantes, siguiendo Hove & Anda (2005) y Kitchenham & Pfleeger (2008).
- **Integración SGA declarada como requisito RF-10 y RI-09**: no se implementa la integración, pero se especifica con el nivel de detalle suficiente para su implementación futura.
- **Notificaciones multicanal formalizadas como RF-13, RF-14 y RF-15**: correo institucional como canal por defecto, WhatsApp como canal opcional y frecuencia configurable.
- **Trazabilidad y auditoría como RNF-02**: se registra quién, qué y cuándo para todas las acciones críticas (cambios de estado, accesos, reprogramaciones, generación de reportes).

## 5. Contribución esperada

El PFC contribuye al conocimiento con:

1. Un análisis de requisitos completo, verificable y trazable de un sistema institucional de gestión de tutorías para una universidad pública ecuatoriana, aplicable como línea base para universidades similares en la región andina.
2. Aplicación replicable de la disciplina de ingeniería de requisitos según ISO/IEC/IEEE 29148:2018 e INCOSE GtWR v4 en un contexto latinoamericano.
3. Dataset abierto con las respuestas de encuesta anonimizadas y los resúmenes temáticos de entrevistas, disponible por Zenodo bajo licencia CC BY 4.0.

## 6. Referencias

Ver `docs/entregas/IngReq.bib`. Todas las referencias citadas en esta síntesis se encuentran ahí con entrada BibTeX completa.
