# ADR-XXX: <Título de la decisión, corto y descriptivo>

## Estado

`Propuesta` | `Aprobada` | `Rechazada` | `Superada por ADR-YYY` | `Diferida`

## Contexto

<Describir el problema o la situación que motiva la decisión. Explicar por qué es necesario decidir *ahora* y qué restricciones aplican (temporales, tecnológicas, institucionales, éticas).>

<Referenciar los ADR previos con los que se relaciona, si aplica.>

## Decisión

<Describir la decisión tomada con claridad y sin ambigüedad. Usar voz activa.>

## Consecuencias

<Listar las consecuencias esperadas de la decisión, tanto positivas como negativas. Ser honesto: cada decisión tiene compensaciones.>

### Positivas

- <Consecuencia positiva 1>
- <Consecuencia positiva 2>

### Negativas

- <Consecuencia negativa 1>
- <Consecuencia negativa 2>

### Riesgos residuales

- <Riesgo 1 que la decisión no elimina y cómo se mitigará>

## Alternativas consideradas

### Alternativa A: <nombre>

<Descripción breve. Razón por la que se descartó.>

### Alternativa B: <nombre>

<Descripción breve. Razón por la que se descartó.>

## Fecha de la decisión

`YYYY-MM-DD`

## Autores

- <Nombre y rol>
- <Nombre y rol>

## Referencias

- <Fuente bibliográfica que sustenta la decisión, si aplica>
- <Enlace a la entrevista o encuesta que motivó la decisión, si aplica>

---

**Notas para el uso de esta plantilla:**

1. Cada archivo ADR se guarda en `docs/adr/ADR-###-slug-corto.md` con numeración secuencial.
2. **Nunca modifique** un ADR aprobado. Si la decisión cambia, cree un nuevo ADR con estado `Aprobada` que refiera al anterior como `Superada por ADR-###`.
3. Los ADR son **irrevocables** en el sentido de que no se borran; forman parte del histórico del proyecto.
4. Un ADR bien escrito debería caber en una a dos páginas.
5. Referencia autoritativa: Nygard, M. (2011), *Documenting Architecture Decisions*.
