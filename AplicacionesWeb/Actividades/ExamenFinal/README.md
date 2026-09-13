# Examen final del PFC — Aplicaciones Web (Quinto nivel)

Resultados del examen final del Proyecto Final de Curso, PPA 2026-2027.

- **Página publicada:** https://gleiston-guerrero.github.io/Asignaturas/AplicacionesWeb/Actividades/ExamenFinal/
- **Corte de evaluación:** 11 de septiembre de 2026, 23:59 (UTC-5), cierre de la semana 19.
- **Docente:** Dr. Gleiston Cicerón Guerrero Ulloa, Ph.D.

## Contenido

| Archivo | Qué es |
|---|---|
| `index.html` | Índice con el resumen de los nueve equipos y los enlaces a cada informe |
| `ARTISYNC.html` | Hoja de cálculo e informes individuales del equipo |
| `ASISTENTE.html` | ídem |
| `BIOPET.html` | ídem |
| `PRESUSTENTACIONES.html` | ídem |
| `SBVIA.html` | ídem |
| `SGB_SAAS.html` | ídem |
| `SGED.html` | ídem |
| `SGROAS.html` | ídem |
| `SIGCB_QR.html` | ídem |
| `Rubrica_ExamenFinal_PFC.pdf` | Rúbrica completa, una por equipo |

## Cómo se calcula la nota

Cada punto de la rúbrica tiene un peso y los pesos suman 10. El nivel de cada punto da **puntos**
(Completo el peso entero, Casi tres cuartos, A medias la mitad, Apenas un cuarto, Nada cero) y un
**factor** que multiplica.

    Nota = (f1 × f2 × … × fn) × (p1 + p2 + … + pn)

Un solo punto en Nada deja el multiplicador en cero, y con él la nota. Por eso, junto a cada nota se
publica también la suma de puntos: es la medida de cuánto trabajo hay hecho.

## Cómo se auditó

Se clonaron los nueve repositorios y se evaluó el último commit dentro del plazo. Se comprobaron los
despliegues en vivo, se recalculó la cobertura desde cada `jacoco.xml`, se contaron identificadores y
Javadoc sobre el código fuente, se verificó que cada informe se regenere sin referencias rotas y se
midió el aporte individual con `git log --no-merges --numstat`.

Los puntos marcados *(prov.)* son aquellos en los que el trabajo se ve en el repositorio pero no se
pudo comprobar cada parte una por una.
