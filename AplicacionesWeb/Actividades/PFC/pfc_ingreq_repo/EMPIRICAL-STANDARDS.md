# ACM SIGSOFT Empirical Standards Checklist — PFC de Ingeniería de Requisitos

**Referencia autoritativa**: Ralph, P., bin Ali, N., Baltes, S., Bianculli, D., Diaz, J., Dittrich, Y., Ernst, N., Felderer, M., Feldt, R., Filieri, A., et al. (2021). *Empirical Standards for Software Engineering Research*. ACM SIGSOFT Software Engineering Notes, 46(3), 19–20. DOI: 10.1145/3468248.3468256.

Los estándares están disponibles públicamente en <https://acmsigsoft.github.io/EmpiricalStandards/>.

**Uso**: cada equipo copia este archivo y marca su cumplimiento con evidencia explícita en cada ítem. El archivo se archiva como `EMPIRICAL-STANDARDS.md` en la raíz del repositorio.

---

## Sección I — General Standard (aplica a todo trabajo empírico)

Los ítems marcados con "**Esencial**" son de cumplimiento obligatorio; los "**Deseables**" contribuyen a la excelencia del PFC.

| ID | Ítem | Nivel | Cumple | Evidencia |
|----|------|-------|--------|-----------|
| G1 | El manuscrito explica el propósito del estudio | Esencial | ☐ | Sección 1 (Introducción) del documento académico |
| G2 | El manuscrito describe el contexto del estudio | Esencial | ☐ | Sección 1.1 (Contexto institucional) y `PLANTEAMIENTO.md` |
| G3 | El manuscrito describe los objetivos de investigación o preguntas de investigación | Esencial | ☐ | Sección 1.3 (Objetivos general y específicos) |
| G4 | El manuscrito describe el enfoque metodológico | Esencial | ☐ | Sección 4 (Metodología) y `METODOLOGIA.md` |
| G5 | El manuscrito describe los métodos de recolección de datos | Esencial | ☐ | Sección 4.3 (Elicitación); Anexos B y C |
| G6 | El manuscrito describe los métodos de análisis de datos | Esencial | ☐ | Sección 5.1 (Análisis) + `scripts/analisis-encuesta.py` |
| G7 | El manuscrito presenta los resultados de forma clara | Esencial | ☐ | Sección 5 (Resultados y Discusión) |
| G8 | El manuscrito discute las implicaciones de los resultados | Esencial | ☐ | Sección 5.7 (Discusión) |
| G9 | El manuscrito discute las amenazas a la validez | Esencial | ☐ | Ver sección específica al final de este checklist |
| G10 | El manuscrito extrae conclusiones basadas en la evidencia | Esencial | ☐ | Sección 6 (Conclusiones y trabajo futuro) |
| G11 | El manuscrito reconoce el financiamiento y los conflictos de interés | Deseable | ☐ | Sección de agradecimientos |
| G12 | El manuscrito hace disponibles los datos y los materiales | Deseable | ☐ | DOI Zenodo del dataset; enlace en `CITATION.cff` |

---

## Sección II — Interview Study Standard (aplica si se realizaron entrevistas)

| ID | Ítem | Nivel | Cumple | Evidencia |
|----|------|-------|--------|-----------|
| IV1 | Se justifica el uso de entrevistas como método | Esencial | ☐ | Sección 4.3 y referencia a Hove & Anda (2005) |
| IV2 | Se describe el proceso de selección de participantes | Esencial | ☐ | Sección 4.3 + `docs/requisitos/elicitacion/entrevistas/INDICE.md` |
| IV3 | Se reportan características demográficas relevantes de los participantes | Esencial | ☐ | Tabla en el Anexo C.1, anonimizada |
| IV4 | Se describe el instrumento (guion de entrevista) | Esencial | ☐ | `docs/requisitos/elicitacion/ENTREVISTA-*.md` |
| IV5 | Se describe el procedimiento de análisis (codificación abierta, temática) | Esencial | ☐ | Sección 4.3 y notas en cada resumen `ENT-##-*.md` |
| IV6 | Se reporta el tamaño de la muestra y su justificación | Esencial | ☐ | Sección 4.3: N entrevistas ≥ 5, justificado por saturación temática |
| IV7 | Se preserva la confidencialidad de los participantes | Esencial | ☐ | Consentimiento informado firmado; transcripciones no públicas |
| IV8 | Se citan las palabras exactas o resúmenes fieles de los participantes | Deseable | ☐ | Resúmenes temáticos en `ENT-##-*.md` |

---

## Sección III — Survey Standard (aplica si se aplicó encuesta)

| ID | Ítem | Nivel | Cumple | Evidencia |
|----|------|-------|--------|-----------|
| SV1 | Se justifica el uso de encuesta como método | Esencial | ☐ | Sección 4.3 y referencia a Kitchenham & Pfleeger (2008) |
| SV2 | Se describe el diseño del cuestionario (tipos de preguntas, longitud) | Esencial | ☐ | `docs/requisitos/elicitacion/ENCUESTA-USUARIO.md` |
| SV3 | Se reporta el tamaño de la muestra y la tasa de respuesta | Esencial | ☐ | `RESUMEN-ENCUESTA.md`: n = 30+ respuestas válidas de un universo estimado |
| SV4 | Se describe el reclutamiento y la representatividad | Esencial | ☐ | Sección 4.3.2; difusión por canales institucionales acordados |
| SV5 | Se reportan las respuestas de forma agregada | Esencial | ☐ | `RESUMEN-ENCUESTA.md` + gráficos vectoriales |
| SV6 | Se reportan las preguntas abiertas con codificación reproducible | Esencial | ☐ | Codificación abierta con dos revisores; disponible en `docs/requisitos/elicitacion/encuestas/codificacion.md` |
| SV7 | Se anonimizan los datos crudos disponibles | Esencial | ☐ | CSV de respuestas sin campos PII |
| SV8 | El instrumento se libera con licencia abierta | Deseable | ☐ | Instrumento incluido en el dataset Zenodo bajo licencia CC BY 4.0 |

---

## Amenazas a la validez (sección obligatoria para todo PFC)

### Validez de constructo

*¿En qué medida los instrumentos de elicitación midieron lo que se pretendía medir?*

_[Redactar la evaluación del equipo. Ejemplo del proyecto modelo]_:

> Los instrumentos de entrevista y encuesta fueron diseñados a partir de los objetivos específicos del PFC y revisados por el Product Owner institucional antes de su aplicación. Sin embargo, algunas preguntas abiertas de la encuesta pueden haber sido interpretadas de forma distinta por los participantes debido a la diversidad de niveles académicos. Para mitigar, se realizó codificación abierta con dos revisores independientes del equipo y se descartaron las respuestas ambiguas.

### Validez interna

*¿En qué medida las relaciones causales inferidas están libres de sesgo?*

_[Redactar la evaluación]_:

> La selección de los participantes fue por conveniencia (docentes disponibles en los horarios de los estudiantes del equipo). Esto puede introducir sesgo hacia los docentes más colaborativos. Para mitigar, se contactó a docentes de diferentes áreas (programación, bases de datos, gestión, matemáticas) para diversificar los perfiles.

### Validez externa

*¿En qué medida los hallazgos son generalizables?*

_[Redactar la evaluación]_:

> Los hallazgos se refieren específicamente a la Carrera de Ingeniería de Software de la UTEQ y a su contexto institucional. La generalización a otras carreras o instituciones requeriría replicar el estudio con muestras locales. El estado del arte comparado incluyó casos de universidades europeas, latinoamericanas, norteamericanas, africanas y asiáticas para contextualizar los hallazgos.

### Validez de conclusión

*¿En qué medida las conclusiones se derivan válidamente de los datos?*

_[Redactar la evaluación]_:

> Las conclusiones se soportan en tres fuentes triangulables (entrevistas + encuesta + revisión documental). Los requisitos derivados están trazados a la fuente original en la matriz de trazabilidad. Las priorizaciones MoSCoW y Kano se validaron en la sesión formal con stakeholders de la Entrega 3.

---

## Autoevaluación agregada

- **General Standard**: __ / 12 (esenciales cumplidos: __ / 10)
- **Interview Study Standard**: __ / 8 (esenciales cumplidos: __ / 7)
- **Survey Standard**: __ / 8 (esenciales cumplidos: __ / 7)
- **Amenazas a la validez**: 4/4 declaradas con evidencia

Para superar el criterio C5 de la rúbrica de la Entrega Final se requiere:
- ≥ 80 % del **General Standard** cumplido (10/12 mínimo).
- ≥ 70 % de al menos uno de los estándares específicos aplicables.
- Las cuatro dimensiones de amenazas a la validez declaradas con evidencia.
