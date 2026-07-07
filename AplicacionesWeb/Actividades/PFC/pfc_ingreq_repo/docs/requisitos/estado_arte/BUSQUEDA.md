# Búsqueda estructurada — Estado del arte

**Ejemplo trabajado**: reconstruido a partir de la Sección 2 del proyecto modelo. Sirve como patrón de calidad; el equipo del PFC debe adaptar con su propia estrategia de búsqueda para su dominio.

**Fecha de ejecución**: `2025-06-20`

**Ejecutado por**: Analista Funcional del equipo, con revisión del Documentador(a) Técnico(a).

---

## 1. Pregunta de investigación

**PI**: ¿Qué funciones, requisitos y limitaciones se han documentado en la literatura para sistemas institucionales de gestión de tutorías académicas en educación superior?

## 2. Cadena de búsqueda

Se aplicó la siguiente cadena de búsqueda booleana, con adaptaciones sintácticas menores por base de datos:

```
("tutoring system" OR "tutoring platform" OR "e-tutoring" OR "academic tutoring")
    AND
("higher education" OR "university" OR "college")
    AND
("requirements" OR "system requirements" OR "user needs")
```

## 3. Bases consultadas

| Base de datos | URL | Fecha de consulta | Ventana temporal |
|---------------|-----|-------------------|------------------|
| IEEE Xplore | https://ieeexplore.ieee.org | 2025-06-20 | 2013-2025 |
| ACM Digital Library | https://dl.acm.org | 2025-06-20 | 2013-2025 |
| Scopus | https://www.scopus.com | 2025-06-21 | 2013-2025 |
| Springer Link | https://link.springer.com | 2025-06-21 | 2013-2025 |
| ScienceDirect | https://www.sciencedirect.com | 2025-06-22 | 2013-2025 |

## 4. Criterios de inclusión

- Estudios sobre sistemas o plataformas institucionales de gestión de tutorías académicas.
- Publicados entre 2013 y 2025.
- Revisión por pares (indexados JCR o Scopus).
- Idiomas: inglés o español.
- Con datos empíricos (cuantitativos, cualitativos o mixtos).

## 5. Criterios de exclusión

- Estudios sobre tutorías informales sin sistema tecnológico.
- Estudios sobre sistemas comerciales sin descripción de requisitos.
- Estudios en dominios diferentes a educación superior.
- Publicaciones anteriores a 2013.
- Idiomas distintos a inglés o español.
- Duplicados.

## 6. Resultados por etapa (PRISMA 2020)

### 6.1 Identificación

| Base | Resultados brutos |
|------|-------------------|
| IEEE Xplore | 45 |
| ACM DL | 32 |
| Scopus | 78 |
| Springer Link | 41 |
| ScienceDirect | 29 |
| **Total identificados** | **225** |

Otros registros identificados desde referencias hacia atrás de estudios seed: 5.

### 6.2 Cribado por eliminación de duplicados

Duplicados eliminados: 47.
Registros tras deduplicación: 178 + 5 = 183.

### 6.3 Cribado por título y resumen

Registros cribados: 183.
Excluidos por título/resumen no pertinente: 152.
Registros elegibles para lectura completa: 31.

### 6.4 Evaluación a texto completo

Registros evaluados a texto completo: 31.
Excluidos por criterios:
- Sin datos empíricos: 8
- Fuera de dominio (educación primaria, secundaria, corporativa): 12
- No cumplen revisión por pares: 3

Registros finalmente incluidos en la síntesis: **8**.

## 7. Estudios incluidos en la síntesis

| # | Cita | Contexto | Foco |
|---|------|----------|------|
| 1 | Copaci & Rusu (2015) | Europa | E-tutoring en universidades europeas, revisión sistemática |
| 2 | Bellodi & Dolhnikoff (2021) | Brasil (USP) | Tutorías disciplinares en Medicina |
| 3 | Pugatch & Wilson (2018) | EE. UU. | Tutorías entre pares en universidad pública |
| 4 | Chemin & Schneider (2025) | Kenia | Tutorías en línea en contextos con brechas tecnológicas |
| 5 | Maré & Mutezo (2021) | Sudáfrica (UNISA) | E-tutoring en educación abierta y a distancia |
| 6 | Rojas et al. (2023) | Perú (EPIS-UNH) | Sistema web para gestión de tutorías |
| 7 | Zhang et al. (2023) | China (SCOOT) | Sistema uno-a-uno online con logs de interacción |
| 8 | Merli et al. (2017) | Colombia (UDES) | Impacto cuantitativo del programa de tutorías |

## 8. Brecha identificada

Tras la síntesis, se identifican tres brechas recurrentes que motivan el PFC:

1. **Falta de integración institucional**: la mayoría de los sistemas revisados no se integran con los Sistemas de Gestión Académica (SGA) existentes, obligando a duplicar entradas o a gestionar el proceso al margen.
2. **Barreras de adopción tecnológica y motivación**: aun cuando los sistemas están disponibles, la participación estudiantil suele ser baja (Pugatch & Wilson, 2018) por falta de notificaciones, incentivos o mecanismos visibles de convocatoria.
3. **Ausencia de trazabilidad institucional**: pocos sistemas registran la trazabilidad de acciones para uso por parte de la coordinación académica, lo que dificulta la generación de reportes consolidados y la toma de decisiones basadas en datos.

## 9. Referencias

Ver `docs/entregas/IngReq.bib`. Las entradas correspondientes a esta revisión son: `copaci2015etutoring`, `bellodi2021medical`, `pugatch2018nudging`, `mare2021etutoring`, `rojas2023sistemaweb`, `zhang2023scoot`, `merli2017udes`.

## 10. Reproducibilidad

Esta búsqueda es reproducible mediante:

1. Aplicar la cadena de búsqueda de la Sección 2 en cada base de datos, con la ventana temporal 2013-2025.
2. Aplicar los criterios de inclusión/exclusión de las Secciones 4 y 5.
3. Comparar los resultados con la Tabla de la Sección 7.

Diferencias esperables por replicación en fecha distinta: se admite hasta un 10 % de variación debido a la incorporación continua de literatura.
