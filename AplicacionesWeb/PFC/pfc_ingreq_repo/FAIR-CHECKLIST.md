# FAIR Checklist — PFC de Ingeniería de Requisitos

**Referencia autoritativa**: Wilkinson, M. D., Dumontier, M., Aalbersberg, I. J., et al. (2016). *The FAIR Guiding Principles for Scientific Data Management and Stewardship*. Scientific Data, 3, 160018. DOI: 10.1038/sdata.2016.18.

**Uso**: cada equipo copia este archivo y marca su cumplimiento con evidencia explícita. El archivo se archiva como `FAIR-CHECKLIST.md` en la raíz del repositorio.

---

## Findable (F) — Ser encontrable

| ID | Principio | Cumple | Evidencia |
|----|-----------|--------|-----------|
| **F1** | Los (meta)datos tienen un identificador único y persistente globalmente | ☐ Sí ☐ No | DOI Zenodo: `10.5281/zenodo.XXXXXXX` (software) y `10.5281/zenodo.YYYYYYY` (dataset) |
| **F2** | Los datos están descritos con metadatos ricos | ☐ Sí ☐ No | `CITATION.cff` v1.2.0 con autores, ORCID, keywords, licencia, referencias cruzadas |
| **F3** | Los metadatos incluyen clara y explícitamente el identificador del dato que describen | ☐ Sí ☐ No | Ambos DOI están referenciados en `CITATION.cff` y en el `CHANGELOG.md` |
| **F4** | Los (meta)datos están registrados o indexados en un recurso de búsqueda | ☐ Sí ☐ No | Zenodo indexa automáticamente en OpenAIRE y DataCite |

## Accessible (A) — Ser accesible

| ID | Principio | Cumple | Evidencia |
|----|-----------|--------|-----------|
| **A1** | Los (meta)datos son recuperables por su identificador usando un protocolo estándar | ☐ Sí ☐ No | HTTPS estándar; DOI resuelve a URL Zenodo permanente |
| **A1.1** | El protocolo es abierto, libre y universalmente implementable | ☐ Sí ☐ No | HTTPS es RFC 2818, libre y abierto |
| **A1.2** | El protocolo soporta autenticación y autorización cuando es necesario | ☐ Sí ☐ No | No requiere autenticación (repositorio público) |
| **A2** | Los metadatos son accesibles incluso cuando los datos ya no lo están | ☐ Sí ☐ No | Zenodo garantiza persistencia de metadatos aunque el archivo sea retirado |

## Interoperable (I) — Ser interoperable

| ID | Principio | Cumple | Evidencia |
|----|-----------|--------|-----------|
| **I1** | Los (meta)datos usan un lenguaje formal, accesible, compartido y ampliamente aplicable para la representación de conocimiento | ☐ Sí ☐ No | Metadatos en YAML (CITATION.cff), CSV para datos tabulares, PDF/A para el documento académico |
| **I2** | Los (meta)datos usan vocabularios que siguen los principios FAIR | ☐ Sí ☐ No | `CITATION.cff` es un vocabulario W3C-compliant; DataCite metadata schema |
| **I3** | Los (meta)datos incluyen referencias cualificadas a otros (meta)datos | ☐ Sí ☐ No | Referencias entre el DOI del software y el DOI del dataset están explícitas |

## Reusable (R) — Ser reutilizable

| ID | Principio | Cumple | Evidencia |
|----|-----------|--------|-----------|
| **R1** | Los (meta)datos están ricamente descritos con una pluralidad de atributos precisos y relevantes | ☐ Sí ☐ No | Metadatos en `CITATION.cff` con: título, autores + ORCID, versión, fecha, licencia, keywords, DOI relacionados |
| **R1.1** | Los (meta)datos se liberan con una licencia de uso clara y accesible | ☐ Sí ☐ No | Licencia MIT en archivo `LICENSE` (o CC BY 4.0 para el dataset) |
| **R1.2** | Los (meta)datos están asociados a una procedencia detallada | ☐ Sí ☐ No | `CHANGELOG.md` documenta la procedencia de cada versión; historial de Git preserva la trazabilidad |
| **R1.3** | Los (meta)datos cumplen con estándares comunitarios relevantes del dominio | ☐ Sí ☐ No | Documento académico en estructura IMRaD; Volere; ISO/IEC/IEEE 29148:2018; INCOSE GtWR v4; PRISMA 2020 |

---

## Autoevaluación agregada

- **Categoría F**: __ / 4 principios cumplidos
- **Categoría A**: __ / 4 principios cumplidos
- **Categoría I**: __ / 3 principios cumplidos
- **Categoría R**: __ / 4 principios cumplidos
- **Total FAIR**: __ / 15 principios cumplidos (mínimo requerido para la Entrega Final: 12/15; excelente: 15/15)

## Firma del equipo

Este checklist ha sido revisado colectivamente por el equipo del PFC y firmado por consenso en la fecha `YYYY-MM-DD`:

- [Coordinador(a) del equipo]
- [Arquitecto(a) de Requisitos]
- [Analista Funcional]
- [Documentador(a) Técnico(a)]
