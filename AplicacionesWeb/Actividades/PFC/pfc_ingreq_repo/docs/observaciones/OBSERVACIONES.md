# Registro perpetuo de observaciones docentes

Todas las observaciones recibidas del docente responsable durante el ciclo académico se registran aquí, con código, texto íntegro, decisión adoptada, commit de resolución y estado.

**Regla crítica**: una observación con estado `ABIERTA` que no aparezca resuelta o diferida antes del cierre de la siguiente entrega reduce automáticamente un nivel el criterio C0 (Continuidad y observaciones) de la rúbrica.

**Estados válidos**:
- `ABIERTA` — recibida y aún no atendida.
- `EN CURSO` — el equipo está trabajando en la observación.
- `RESUELTA` — la observación se atendió y el commit está referenciado.
- `DIFERIDA` — el equipo justifica postergar la observación a una entrega posterior. Requiere ADR asociado.
- `RECHAZADA` — el equipo justifica no atender la observación. Requiere ADR asociado y aval del docente.

---

## OBS-000 — Ejemplo de entrada (para plantilla)

- **Fecha de recepción**: `YYYY-MM-DD`
- **Entrega en la que se recibió**: `Entrega N`
- **Recibida en**: `defensa oral | revisión escrita | comentario en repositorio`
- **Texto íntegro (docente)**: 
  > "<Copiar aquí el texto exacto de la observación del docente, sin editarlo.>"
- **Categoría**: `metodológica | bibliográfica | de contenido | de forma | de repositorio`
- **Impacto**: `crítica | importante | menor`
- **Decisión del equipo**:
  <Descripción de la acción tomada.>
- **Commit de resolución**: `<hash corto>` (`<enlace al commit>`)
- **ADR asociado**: `<ADR-###>` (si aplica)
- **Estado**: `ABIERTA | EN CURSO | RESUELTA | DIFERIDA | RECHAZADA`
- **Fecha de resolución**: `YYYY-MM-DD` (si aplica)

---

<!-- Nuevas observaciones se añaden aquí, encima de esta línea, con formato similar al OBS-000. -->
