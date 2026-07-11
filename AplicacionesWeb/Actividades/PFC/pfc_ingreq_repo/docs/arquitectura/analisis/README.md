# Diagramas de análisis de requisitos

**Entregable del Bloque B de la Entrega 3**. Esta carpeta documenta los tres diagramas de análisis de requisitos que extienden UML para representar objetivos y dependencias de los actores.

## Estructura esperada al cierre de la Entrega 3

```
docs/arquitectura/analisis/
├── README.md              (este archivo)
├── CONTEXTO.md            (descripción del diagrama de contexto)
├── ISTAR-SD.md            (descripción del diagrama i* de dependencia estratégica)
└── SYSML-REQ.md           (descripción del diagrama SysML de requisitos)
```

Y en `assets/uml/analisis/`:

```
assets/uml/analisis/
├── contexto.drawio + contexto.png
├── istar-sd.drawio + istar-sd.png
└── sysml-req.drawio + sysml-req.png
```

## 1. Diagrama de contexto

El diagrama de contexto define los límites del sistema y lo representa como una entidad única que interactúa con su entorno mediante flujos de datos. Es el primer diagrama que se crea en el proceso de ingeniería de sistemas.

**Referencias autoritativas**:

- Kossiakoff, A., Sweet, W. N., Seymour, S. J., & Biemer, S. M. (2011). *Systems Engineering: Principles and Practice* (2ed). Wiley-Interscience.
- Robertson, S., & Robertson, J. (2012). *Mastering the Requirements Process: Getting Requirements Right* (3ed). Addison-Wesley.

## 2. Diagrama de dependencia estratégica (marco i*)

El diagrama SD del marco i* captura el "porqué" de los requisitos al modelar cómo un actor depende de otro para lograr un objetivo, completar una tarea o acceder a un recurso. Es fundamental para la ingeniería de requisitos orientada a metas en fases tempranas.

**Elementos**:

| Elemento | Símbolo | Descripción |
|----------|---------|-------------|
| Actor | Círculo con nombre | Entidad con intencionalidad |
| Dependencia de objetivo | Óvalo | Actor A depende de B para lograr meta declarativa |
| Dependencia de tarea | Hexágono | Actor A depende de B para ejecutar tarea concreta |
| Dependencia de recurso | Rectángulo | Actor A depende de B para obtener recurso |
| Dependencia de *softgoal* | Óvalo con línea ondulada | Actor A depende de B para objetivo cualitativo |

**Referencias autoritativas**:

- Yu, E. S. K. (1997). *Towards modelling and reasoning support for early-phase requirements engineering*. RE'97.
- Dardenne, A., van Lamsweerde, A., & Fickas, S. (1993). *Goal-directed requirements acquisition*. Science of Computer Programming, 20(1-2), 3-50.

## 3. Diagrama de requisitos SysML

El diagrama de requisitos SysML aborda las deficiencias de UML para modelado explícito de requisitos: permite jerarquizar, relacionar (mediante *derive*, *verify*, *copy*, *trace*, *refine*) y trazar los requisitos hasta sus fuentes y verificaciones.

**Estereotipos usados**:

- `<<requirement>>` — cada requisito representado como caja, con campos `id` y `text`.
- `<<deriveReqt>>` — un requisito se deriva de otro.
- `<<verify>>` — un caso de prueba verifica un requisito.
- `<<satisfy>>` — un elemento de diseño satisface un requisito.
- `<<refine>>` — un requisito refina otro añadiendo detalle.

**Referencias autoritativas**:

- Weilkiens, T. (2011). *Systems Engineering with SysML/UML: Modeling, Analysis, Design*. Morgan Kaufmann/Elsevier.
- Hause, M. (2006). *The SysML Modelling Language*. Fifth European Systems Engineering Conference.

## Guía de calidad para estos tres diagramas

- **Todos los actores** identificados en las entrevistas y encuestas deben aparecer en el diagrama de contexto y en el diagrama i* SD.
- **Todos los requisitos de alta prioridad** (Must según MoSCoW e Imprescindibles según Kano) deben aparecer en el diagrama SysML de requisitos.
- **Cada softgoal** en el diagrama i* SD debe estar trazado a al menos un requisito no funcional (RNF, RU o RP).
- Las relaciones `<<deriveReqt>>` deben documentar de manera explícita la cadena desde el objetivo del actor hasta el requisito concreto.
