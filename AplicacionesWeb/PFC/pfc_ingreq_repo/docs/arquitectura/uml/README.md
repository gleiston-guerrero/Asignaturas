# Documentación de diagramas UML

**Entregable de la Entrega 3**. Esta carpeta documenta cada uno de los diagramas UML producidos en la carpeta `assets/uml/`, con las descripciones textuales que acompañan a cada figura en el documento académico integrado.

## Estructura esperada al cierre de la Entrega 3

```
docs/arquitectura/uml/
├── CASOS-USO.md                Descripción de cada diagrama de casos de uso
├── CASOS-USO-DETALLADOS.tex    Fichas Cockburn detalladas (≥ 12)
├── CLASES.md                   Descripción del diagrama de clases nivel análisis
├── ACTIVIDAD.md                Descripción de los diagramas de actividad
├── SECUENCIA.md                Descripción de los diagramas de secuencia
├── COMPONENTES.md              Descripción del diagrama de componentes
└── DESPLIEGUE.md               Descripción del diagrama de despliegue
```

## Reglas de calidad

- Cada archivo Markdown de descripción debe referenciar el archivo PNG correspondiente en `assets/uml/` mediante enlace relativo.
- Las descripciones deben ser autoexplicativas: un lector externo debe comprender el diagrama solo leyendo el Markdown, sin necesidad de abrir el archivo fuente.
- Cada diagrama debe estar trazado en la matriz de trazabilidad (columna "Caso de uso asociado" de la matriz Volere).

## Ejemplo mínimo de descripción (para CASOS-USO.md)

```markdown
## Diagrama general de casos de uso

![Diagrama general de casos de uso](../../../assets/uml/casos-uso/general.png)

Este diagrama muestra las funcionalidades del sistema desde la perspectiva del usuario. Los tres actores principales (Estudiante, Docente, Coordinación académica) interactúan con los casos de uso agrupados por módulo funcional.

### Casos de uso incluidos

| ID | Nombre | Actor principal | Trazado a RF |
|----|--------|-----------------|--------------|
| CU-01 | Registrar solicitud de tutoría | Estudiante | RF-01, RF-09, RF-12 |
| CU-02 | Consultar estado de solicitudes | Estudiante | RF-06 |
| ... | ... | ... | ... |

### Notas de diseño

- El caso de uso CU-08 (Agrupar sesiones grupales) incluye una relación `<<extend>>` con CU-01 porque se activa solo cuando el docente detecta múltiples solicitudes similares.
- El caso de uso CU-11 (Integrar con SGA) incluye una relación `<<include>>` con CU-04 (Aceptar tutoría presencial) porque siempre se ejecuta al confirmar una sesión presencial.
```
