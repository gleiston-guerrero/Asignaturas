# ADR-003: Metodología de priorización de requisitos

## Estado

`Aprobada`

## Contexto

La Guía de la Entrega 2 exige que cada requisito funcional reciba dos priorizaciones complementarias. Debe decidirse qué técnicas usar, cómo aplicarlas y cómo resolver conflictos cuando las dos técnicas producen resultados divergentes para un mismo requisito.

## Decisión

Se adoptan dos técnicas complementarias:

1. **MoSCoW** (Must, Should, Could, Won't) aplicado por el equipo con revisión del docente. Esta técnica captura la perspectiva del análisis interno y la viabilidad temporal.

2. **Modelo Kano** aplicado en conversación con stakeholders durante la validación (Entrega 3). Esta técnica captura la perspectiva del usuario final y su impacto en la satisfacción.

En caso de conflicto entre las dos priorizaciones para un mismo requisito, prevalece la clasificación Kano cuando el requisito impacta directamente al usuario final; prevalece MoSCoW cuando el requisito es de soporte interno o de infraestructura. Los conflictos se documentan en `docs/requisitos/priorizacion/CONFLICTOS-RESUELTOS.md`.

## Consecuencias

### Positivas

- Se combina la perspectiva del equipo con la perspectiva del usuario.
- La duplicación de esfuerzo es baja: MoSCoW se aplica en 30 minutos por el equipo; Kano se aplica en la conversación de validación programada de todos modos.

### Negativas

- Los requisitos con conflicto entre las dos priorizaciones exigen decisión adicional y documentación en un ADR complementario.

## Alternativas consideradas

### Alternativa A: solo MoSCoW

Se descartó porque no captura la percepción del usuario final. Un requisito "Should" para el equipo puede ser un "Delighter" para el usuario, y no debe descartarse en la primera iteración por criterio interno.

### Alternativa B: solo Kano

Se descartó porque no ofrece guía sobre viabilidad temporal (qué se puede y qué no en el ciclo actual).

### Alternativa C: matriz de priorización cuantitativa (por ejemplo AHP)

Se descartó por su complejidad operativa desproporcionada al tamaño del PFC.

## Fecha de la decisión

`2026-05-15` (semana 6 del período académico)

## Autores

- Equipo del PFC
- Dr. Gleiston Guerrero Ulloa

## Referencias

- Wiegers, K. E. & Beatty, J. (2013). *Software Requirements* (3ed). Microsoft Press. Cap. 16 (Prioritization).
- Kano, N., Seraku, N., Takahashi, F. & Tsuji, S. (1984). *Attractive Quality and Must-Be Quality*. Journal of the Japanese Society for Quality Control, 14(2), 147–156.
- Tan, K. C. & Shen, X. X. (2000). *Integrating Kano's model in the planning matrix of quality function deployment*. Total Quality Management, 11(8), 1141–1151.
