# Planteamiento del problema

**Ejemplo trabajado**: reconstruido a partir de la Introducción y del Sistema Propuesto del proyecto modelo (Análisis de Requisitos para un Sistema de Gestión de Tutorías Académicas en la UTEQ, Toaquiza et al., 2025). El equipo del PFC debe reemplazar el ejemplo por el planteamiento propio del dominio elegido.

---

## 1. Contexto institucional u organizacional

La Universidad Técnica Estatal de Quevedo (UTEQ) es una institución de educación superior pública ubicada en el cantón Quevedo, provincia de Los Ríos, Ecuador. La Carrera de Ingeniería de Software forma parte de la Facultad de Ciencias de la Computación y Diseño Digital, cuenta con aproximadamente [N] estudiantes distribuidos en niveles del primero al octavo semestre, y opera bajo la normativa académica de la propia UTEQ y del Reglamento del Consejo de Educación Superior de Ecuador (RPC-SO-44-No.586-2015).

Uno de los procesos que la carrera realiza como acompañamiento pedagógico al estudiantado es la **tutoría académica**, entendida como sesiones de refuerzo, revisión de trabajos y orientación individual o grupal ofrecidas por los docentes fuera del tiempo de clase regular. En la práctica, la carrera dispone de un Sistema de Gestión Académica (SGA) que cubre notas, asistencias y tareas, pero **no** cuenta con funcionalidades específicas para gestionar el proceso tutorial.

## 2. Problema identificado

Las tutorías académicas de la UTEQ se gestionan de manera **informal**, lo que genera múltiples problemas operativos:

- Las solicitudes de tutoría se canalizan a través de plataformas no institucionales como WhatsApp y correos electrónicos, lo que da lugar a duplicación de horarios, falta de registros centralizados y dificultades para reprogramar.
- El SGA no ofrece funcionalidades específicas para tutorías, lo que impide realizar seguimiento adecuado y generar estadísticas confiables sobre cobertura y efectividad.
- Los estudiantes no tienen un canal formal para solicitar tutorías; los docentes carecen de una plataforma para gestionar su disponibilidad y registrar las sesiones realizadas; los coordinadores académicos no pueden hacer un seguimiento eficiente de la actividad tutorial.

La evidencia inicial de estas afirmaciones proviene de la revisión del reglamento CES RPC-SO-44-No.586-2015 [1] y de la literatura académica que documenta el impacto positivo de sistemas institucionales de gestión de tutorías: Merli et al. (2017) [2] reportan que estudiantes que participaron en programas formales de tutoría en la UDES (Bucaramanga, Colombia) tuvieron entre 1,88 y 2,75 veces más probabilidades de aprobar una asignatura que los que no accedieron.

## 3. Objetivo general y objetivos específicos

### Objetivo general

Analizar y documentar los requisitos fundamentales de un sistema web institucional para la gestión de tutorías académicas en la UTEQ, siguiendo la norma ISO/IEC/IEEE 29148:2018 y las reglas del INCOSE Guide to Writing Requirements v4.

### Objetivos específicos

1. Caracterizar las prácticas actuales de gestión tutorial en la Carrera de Ingeniería de Software mediante entrevistas semi-estructuradas a docentes y coordinación académica, y encuesta a estudiantes.
2. Revisar el estado del arte sobre sistemas institucionales de gestión de tutorías, identificando funciones, requisitos y limitaciones recurrentes.
3. Especificar los requisitos funcionales, no funcionales, de interfaz, usabilidad y proceso del sistema propuesto, aplicando la plantilla Volere.
4. Producir los diagramas UML y de análisis de requisitos (contexto, i* SD, SysML) que representen el sistema propuesto.
5. Validar los requisitos con los *stakeholders* mediante revisiones formales, prototipos de baja fidelidad y aplicación del modelo Kano.

## 4. Alcance del proyecto

### Inclusiones

- Elicitación con al menos cinco docentes, una coordinadora académica y treinta estudiantes de la Carrera de Ingeniería de Software.
- Análisis de la normativa institucional aplicable (Reglamento Interno UTEQ, RPC-SO-44-No.586-2015).
- Modelado UML completo del sistema propuesto.
- Diagramas de análisis (contexto, dependencia estratégica i*, requisitos SysML).
- Validación con al menos una ronda de revisión formal.

### Exclusiones

- **Implementación** del sistema: el PFC se limita al análisis y modelado de requisitos, no incluye código funcional.
- **Diseño visual definitivo** de la interfaz: los prototipos son de baja fidelidad (wireframes), no de alta fidelidad.
- **Pruebas de aceptación** con usuarios reales de la implementación: quedan como trabajo futuro.
- **Integración funcional** con el SGA existente: se declara como requisito de interfaz (RI-09) pero no se implementa.

## 5. Beneficiarios

### Directos

- Estudiantes de la Carrera de Ingeniería de Software de la UTEQ.
- Docentes de la Carrera de Ingeniería de Software de la UTEQ.
- Coordinación académica de la Carrera.

### Indirectos

- Autoridades académicas de la Facultad y de la UTEQ (para toma de decisiones basadas en datos).
- Otras carreras de la UTEQ que podrían replicar el sistema en el futuro.
- Comunidad de investigación en ingeniería de requisitos y en tecnología educativa.

## 6. Justificación

### Científica

El PFC contribuye a la línea de investigación sobre sistemas institucionales de gestión de tutorías, un tema documentado en la literatura pero con vacíos identificables en contextos latinoamericanos de universidades públicas. Los hallazgos del equipo se comparan con los sistemas europeos (Copaci & Rusu, 2015), latinoamericanos (Bellodi & Dolhnikoff, 2021), norteamericanos (Pugatch & Wilson, 2018), africanos (Maré & Mutezo, 2021) y asiáticos (Zhang et al., 2023), aportando evidencia adicional para el estado del arte.

### Técnica

Se aplica la disciplina de ingeniería de requisitos conforme a la norma internacional ISO/IEC/IEEE 29148:2018 y a las reglas del INCOSE Guide to Writing Requirements v4 (2023), produciendo un artefacto de calidad publicable.

### Social

Un sistema institucional de gestión de tutorías puede contribuir a mejorar los indicadores de retención y aprobación de la Carrera y de la UTEQ en su conjunto, con impacto directo sobre estudiantes de niveles socioeconómicos diversos que dependen del acompañamiento académico formal.

## 7. Limitaciones metodológicas y éticas asumidas

- La muestra de entrevistados se limita a la Carrera de Ingeniería de Software; los hallazgos pueden no generalizarse a otras carreras sin adaptación.
- Los datos de la encuesta se recolectan al final del semestre, cuando los estudiantes están más disponibles pero pueden estar bajo estrés académico que sesgue sus respuestas.
- Todo participante firma consentimiento informado. Los datos personales se anonimizan antes de subir cualquier análisis al repositorio público.
- El proyecto no implementa el sistema; por tanto, no se prueban los requisitos con usuarios finales sobre una versión funcional.

## Referencias iniciales

[1] Consejo de Educación Superior. *Reglamento para Carreras y Programas Académicos en Modalidades en Línea, a Distancia y Semipresencial o de Convergencia de Medios* (RPC-SO-44-No.586-2015). Quito, Ecuador, 2015.

[2] G. O. Merli et al., "¿Puede un Programa de Tutorías Mejorar el Rendimiento Académico De los Estudiantes Universitarios? El Programa de Tutorías de la UDES, Bucaramanga, Colombia," *Innovaciencia*, vol. 5, n.º 1, pp. 4–16, 2017. DOI: 10.15649/2346075x.446.

*(Nota: la bibliografía completa está en `docs/entregas/IngReq.bib`. Este archivo solo cita las referencias mínimas necesarias para el planteamiento inicial.)*
