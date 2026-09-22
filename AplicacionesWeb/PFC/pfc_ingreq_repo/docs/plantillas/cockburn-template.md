# Plantilla Cockburn para casos de uso detallados

**Uso**: copiar este bloque cada vez que se detalla un caso de uso.
Nivel de detalle: nivel completo (fully-dressed), no casual.
Referencia autoritativa: Cockburn, A. (2001) *Writing Effective Use Cases*, Addison-Wesley.

---

```
Nombre del caso de uso        : <Verbo en infinitivo + objeto. Ejemplo: "Registrar solicitud de tutoría">
Identificador                 : CU-<##>
Actor principal               : <Rol del usuario que inicia el caso de uso>
Actores secundarios           : <Otros actores involucrados; puede ser el propio sistema o sistemas externos>
Nivel de objetivo             : Usuario | Resumen | Subfunción
Precondiciones                : <Estado del sistema que debe cumplirse antes de iniciar el caso de uso>
Postcondiciones (éxito)       : <Estado del sistema tras el éxito del caso de uso>
Postcondiciones (fracaso)     : <Estado del sistema tras un fracaso del caso de uso>
Escenario principal (éxito)   :
    1. <Paso 1: actor hace algo, o el sistema responde>
    2. <Paso 2>
    3. <Paso 3>
    ...
    N. El sistema muestra la confirmación del resultado.

Escenarios alternativos       :
    3a. <Condición alternativa en el paso 3>
        1. <Paso alternativo 1>
        2. <Paso alternativo 2>
        3. Retomar el flujo principal en el paso 4.

Escenarios de excepción       :
    2a. <Condición de excepción en el paso 2>
        1. El sistema muestra un mensaje de error <descripción>.
        2. El sistema registra el intento fallido en la bitácora de auditoría.
        3. Fin del caso de uso.

Requisitos funcionales asociados : <Lista de RF que este caso de uso cubre. Ejemplo: RF-01, RF-06, RF-14>
Requisitos no funcionales     : <Lista de RNF que este caso de uso debe respetar. Ejemplo: RNF-01, RNF-02>
Frecuencia esperada de uso    : <Ejemplo: 10-20 veces por día por estudiante en semanas de evaluación>
Notas y aclaraciones          : <Cualquier información adicional relevante para el equipo de desarrollo>
```

---

## Ejemplo aplicado (Registrar solicitud de tutoría)

```
Nombre del caso de uso        : Registrar solicitud de tutoría
Identificador                 : CU-01
Actor principal               : Estudiante
Actores secundarios           : Sistema, Docente (recibe notificación)
Nivel de objetivo             : Usuario
Precondiciones                : - El estudiante está autenticado con credenciales institucionales.
                                - Existen asignaturas activas del estudiante en el ciclo académico vigente.
                                - Existe al menos un docente con disponibilidad configurada para las asignaturas del estudiante.
Postcondiciones (éxito)       : - La solicitud queda registrada en la base de datos con estado "pendiente".
                                - Se envía notificación automática al docente correspondiente.
                                - El estudiante recibe confirmación visual.
Postcondiciones (fracaso)     : - No se crea registro alguno.
                                - Se muestra al estudiante el motivo del fracaso.

Escenario principal (éxito)   :
    1. El estudiante selecciona la opción "Solicitar tutoría" desde su panel principal.
    2. El sistema muestra el formulario de solicitud con los campos: asignatura, tema o motivo,
       disponibilidad horaria, tipo (individual o grupal), modalidad (presencial o virtual)
       y archivo adjunto opcional.
    3. El estudiante completa los campos obligatorios y adjunta un archivo si corresponde.
    4. El estudiante presiona "Enviar solicitud".
    5. El sistema valida que todos los campos obligatorios estén completos.
    6. El sistema valida que la asignatura seleccionada está activa en el ciclo académico vigente.
    7. El sistema valida que la modalidad seleccionada está habilitada por el docente responsable.
    8. El sistema registra la solicitud con estado "pendiente".
    9. El sistema envía una notificación automática al docente por el canal configurado (correo o WhatsApp).
    10. El sistema muestra al estudiante el mensaje "Solicitud registrada correctamente".

Escenarios alternativos       :
    3a. El estudiante no adjunta ningún archivo:
        1. El sistema procede al paso 4 (el archivo es opcional).

Escenarios de excepción       :
    5a. Uno o más campos obligatorios están vacíos:
        1. El sistema resalta los campos faltantes con asterisco rojo.
        2. El sistema muestra el mensaje "Por favor complete los campos obligatorios".
        3. Retomar el paso 3.

    6a. La asignatura seleccionada no está activa:
        1. El sistema muestra el mensaje "La asignatura seleccionada no está activa este ciclo".
        2. El sistema deshabilita el botón "Enviar solicitud".
        3. Retomar el paso 3.

    9a. El envío de la notificación falla (canal WhatsApp o correo caído):
        1. El sistema registra la solicitud igualmente con estado "pendiente".
        2. El sistema registra el intento fallido en la bitácora de auditoría (RNF-02).
        3. El sistema muestra al estudiante el mensaje "Solicitud registrada. Verifique con su docente
           que ha recibido la notificación".

Requisitos funcionales asociados : RF-01, RF-09, RF-12, RF-14, RF-16
Requisitos no funcionales     : RNF-01 (disponibilidad), RNF-02 (trazabilidad), RNF-03 (autenticación)
Frecuencia esperada de uso    : Estimado 5-15 veces por semana por estudiante, con picos en semanas de evaluaciones.
Notas y aclaraciones          : - Si el estudiante intenta enviar dos solicitudes idénticas en menos de 60 segundos,
                                  el sistema debe consolidar en una única solicitud (evitar duplicación por doble click).
                                - El límite de tamaño del archivo adjunto es de 10 MB.
```

---

## Notas metodológicas

- Cada caso de uso completo debe caber en **una a tres páginas**. Si supera cuatro páginas, probablemente se está mezclando varios objetivos: dividir.
- El **escenario principal** debe leerse como una historia natural, sin repetir el nombre del sistema en cada paso.
- Los **escenarios alternativos** son variantes de éxito; los de **excepción** son fallos.
- Numere los pasos con el mismo esquema que el escenario principal (`3a`, `3b`, `6a`, etc.) para referenciar la desviación.
- Cada caso de uso debe estar trazado en la matriz de trazabilidad de la especificación Volere.
