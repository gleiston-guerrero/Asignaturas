# Plantilla Volere para especificación de requisitos

**Uso**: copiar este bloque cada vez que se especifica un requisito nuevo.
Los campos obligatorios están marcados con `[OBLIGATORIO]`.
Los campos opcionales aparecen sin marca, pero se recomienda completarlos siempre.

---

```
ID del Requisito                   : [OBLIGATORIO] <PREFIJO-##>  (por ejemplo RF-01, RNF-01, RI-01, RU-01, RP-01)
Nombre                             : [OBLIGATORIO] <Frase nominal corta que identifica el requisito>
Tipo                               : [OBLIGATORIO] Funcional | No Funcional | Interfaz | Usabilidad | Proceso
Descripción                        : [OBLIGATORIO] <Redacción completa siguiendo el patrón 29148:
                                     [Condición], el <sujeto> deberá <acción> <objeto> <restricción>.
                                     Ejemplo: Al recibir la señal x, el sistema deberá establecer el bit
                                     "señal x recibida" en un plazo máximo de 2 segundos.>
Rationale (Justificación)          : [OBLIGATORIO] <Por qué este requisito es necesario para el proyecto>
Criterios de aceptación            : [OBLIGATORIO] <Condiciones verificables. Idealmente en Gherkin:
                                     - Dado que <precondición>
                                     - Cuando <acción>
                                     - Entonces <resultado esperado>>
Prioridad                          : [OBLIGATORIO] Alta | Media | Baja  (se cruza luego con MoSCoW y Kano)
Fuente                             : [OBLIGATORIO] Entrevista a <rol> | Encuesta estudiantil | Normativa <cita> | Análisis funcional
Restricciones                      : <Condiciones límite bajo las que aplica el requisito>
Responsable / Actor principal      : [OBLIGATORIO] Estudiante | Docente | Coordinación | Sistema | ...
Interesados secundarios            : <Otros roles impactados por el requisito>
```

---

## Ejemplo aplicado (tomado del proyecto modelo, Tabla D1.1)

```
ID del Requisito                   : RF-01
Nombre                             : Registro de solicitud de tutoría
Tipo                               : Funcional
Descripción                        : El estudiante deberá registrar una solicitud de tutoría
                                     seleccionando la asignatura, el tema o motivo, la hora de
                                     disponibilidad, su preferencia para el tipo (individual o grupal),
                                     la modalidad (presencial o virtual), y cargar un archivo cuando
                                     sea necesario.
Rationale (Justificación)          : Es la funcionalidad central para formalizar las solicitudes de
                                     tutoría y garantizar trazabilidad.
Criterios de aceptación            : - El formulario valida campos obligatorios.
                                     - La solicitud queda registrada en la base de datos.
                                     - Se genera notificación al docente correspondiente.
Prioridad                          : Alta
Fuente                             : Encuesta estudiantil (n=40, junio 2025)
Restricciones                      : Solo se pueden solicitar tutorías de asignaturas activas en el
                                     ciclo académico vigente.
Responsable / Actor principal      : Estudiante
Interesados secundarios            : Docente, Coordinación académica
```

---

## Reglas de redacción (INCOSE GtWR v4, cinco críticas)

1. **R1 — Patrón estructurado**: use la forma `[Condición], <sujeto> deberá <acción> <objeto> <restricción>`.
2. **R2 — Voz activa**: identifique al sujeto responsable de la acción, no use voz pasiva.
3. **R6 — Verbo modal**: use `deberá` únicamente. No use `debe`, `debería`, `puede`, `podría`.
4. **R7 — Evitar términos vagos**: `rápido`, `eficiente`, `adecuado`, `apropiado`, `amigable`, `intuitivo`, `fácil de usar` **no** son aceptables sin una métrica.
5. **R16 — No use "no"**: replantee la afirmación en positivo.

## Características de calidad esperadas (mínimo 13 de 15)

Cada requisito debe ser: *necesario, apropiado, no ambiguo, completo, singular, factible, verificable, correcto, conforme, expresado positivamente, apto para la abstracción, consistente, comparable, modificable, permitido.*

En la Entrega Final se auditará que al menos el 80 % de los requisitos cumpla con 13 o más de estas 15 características.
