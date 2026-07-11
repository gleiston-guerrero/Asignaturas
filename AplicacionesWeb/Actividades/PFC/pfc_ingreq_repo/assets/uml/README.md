# Diagramas UML — README

Esta carpeta reúne las fuentes nativas de todos los diagramas UML del PFC. Se organiza en subcarpetas por tipo de diagrama.

## Estructura esperada al cierre de la Entrega 3

```
assets/uml/
├── casos-uso/
│   ├── general.drawio           (o .vpp)
│   ├── general.png              (exportación 300 dpi)
│   ├── modulo-solicitud.drawio
│   ├── modulo-solicitud.png
│   ├── modulo-disponibilidad.drawio
│   ├── modulo-disponibilidad.png
│   ├── modulo-reportes.drawio
│   ├── modulo-reportes.png
│   └── modulo-registro.drawio
│       modulo-registro.png
├── clases/
│   ├── clases-analisis.drawio
│   └── clases-analisis.png
├── actividad/
│   ├── general.drawio + .png
│   ├── modulo-solicitud.drawio + .png
│   ├── modulo-disponibilidad.drawio + .png
│   ├── modulo-reportes.drawio + .png
│   └── modulo-registro.drawio + .png
├── secuencia/
│   ├── flujo-registrar-solicitud.drawio + .png
│   ├── flujo-aceptar-tutoria.drawio + .png
│   ├── flujo-generar-reporte.drawio + .png
│   └── flujo-notificar.drawio + .png
├── componentes/
│   ├── componentes.drawio + .png
├── despliegue/
│   └── despliegue.drawio + .png
```

## Convenciones de nombres

- Los archivos fuente usan el formato nativo `.drawio` (para draw.io) o `.vpp` (para Visual Paradigm).
- Las exportaciones a PNG deben tener resolución mínima de 300 dpi.
- Los nombres de archivos son en `kebab-case` (minúsculas, guiones), sin acentos ni espacios.

## Herramientas recomendadas

- **draw.io Desktop** (https://www.drawio.com): gratuito, offline, exportación a PNG de alta calidad.
- **Visual Paradigm Community Edition** (https://www.visual-paradigm.com/download/community.jsp): gratuito para uso académico, con exportación a formato de imagen.

Ambas herramientas versionan bien en Git porque su formato nativo es XML de texto.

## Referencia autoritativa

- Booch, G., Rumbaugh, J., & Jacobson, I. (2005). *The Unified Modeling Language User Guide* (2ed). Addison-Wesley Professional.
- Fowler, M. (2018). *UML Distilled: A Brief Guide to the Standard Object Modeling Language* (3ed). Addison-Wesley Professional.
- Larman, C. (2003). *UML y Patrones* (2ed). Pearson Educación.
