# GUÍA DIDÁCTICA DEL DOCENTE — SEMANA 02
## HTML y HTML5 para el desarrollo web

> **Asignatura:** Aplicaciones Web
> **Carrera:** Ingeniería de Software · Quinto período
> **Institución:** Universidad Técnica Estatal de Quevedo (UTEQ)
> **Período:** 2026

---

## 1. Datos generales de la sesión

| Campo | Valor |
|-------|-------|
| **Semana** | 02 |
| **Unidad** | I — Cliente: HTML5 + CSS3 + JavaScript |
| **Duración total** | 8 horas (4 h presenciales + 4 h trabajo autónomo) |
| **Modalidad** | Presencial con apoyo virtual |
| **Prerrequisitos de la semana** | Semana 01 (encuadre + primera página HTML5 introductoria) |

---

## 2. Resultado de aprendizaje específico

Al concluir la semana 02, el estudiante **construye documentos HTML5 estructuralmente correctos, semánticamente significativos y validables ante el W3C**, integrando formularios con validación nativa, contenido multimedia accesible, APIs nativas del lenguaje y entendiendo el lugar de XML en el ecosistema de marcado.

### Articulación con el Resultado de Aprendizaje Unitario (RAU)

| Nivel | Resultado |
|-------|-----------|
| RAU 1 | Construir interfaces web semánticas, accesibles y responsivas con HTML5, CSS3 y JavaScript siguiendo W3C y WCAG 2.1. |
| Indicador específico semana 02 | Documento HTML5 válido en `validator.w3.org/nu/` con cero errores y cero violaciones críticas en axe DevTools. |

### Articulación con el SWEBOK v4.0
- **KA03** — Diseño de software (estructura semántica de la interfaz)
- **KA04** — Construcción de software (escritura del código)
- **KA10** — Calidad del software (validación, accesibilidad)

---

## 3. Distribución del tiempo presencial (240 minutos)

| Bloque | Contenido | Tiempo | Recursos |
|--------|-----------|--------|----------|
| 1 | Apertura y conexión con semana 01 | 10 min | Slides 1–3 |
| 2 | Historia y evolución de HTML | 20 min | Slides 4–5 |
| 3 | Estructura y anatomía de un documento HTML5 | 30 min | Slides 6–7 |
| 4 | Elementos semánticos en profundidad | 35 min | Slides 8–10 |
| **BREAK** | Descanso | 15 min | — |
| 5 | Formularios HTML5 y validación nativa | 45 min | Slides 11–14 |
| 6 | Multimedia y APIs nativas | 30 min | Slides 15–18 |
| 7 | XML y formatos de datos modernos | 15 min | Slides 19–20 |
| 8 | Buenas prácticas y errores frecuentes | 10 min | Slides 21, 25 |
| **PRÁCTICA** | Laboratorio guiado: formulario UTEQ | 60 min | Slide 22 + guía de laboratorio |
| 9 | Asignación de tarea autónoma y cierre | 10 min | Slides 23, 27, 28 |

---

## 4. Metodología

### 4.1 Enfoque pedagógico
Combinación de **clase magistral activa** (exposición con preguntas dirigidas) con **aprendizaje basado en proyectos** (laboratorio práctico) y **flipped classroom parcial** (lectura previa del capítulo 2 del libro de cátedra).

### 4.2 Estrategias didácticas por bloque

| Estrategia | Cuándo aplicarla |
|------------|------------------|
| **Demostración en vivo** | Cada vez que se introduce un nuevo elemento HTML: abrir IntelliJ y mostrar el efecto inmediato. |
| **Pregunta dirigida** | Antes de cada slide nuevo: "¿alguien recuerda qué hace `<meta charset>`?". Activa los conocimientos previos. |
| **Comparación caso correcto vs incorrecto** | Especialmente al explicar `<article>` vs `<section>`. |
| **Resolución colaborativa de errores** | En el laboratorio: proyectar el código de un estudiante y dejar que la clase encuentre el error. |
| **Cierre con mini-quiz** | Slide 26: las 6 preguntas se responden oralmente en cadena. |

### 4.3 Recursos didácticos disponibles
1. **Presentación PowerPoint** — `SEMANA_02_HTML5_Presentacion_Docente.pptx` (28 slides)
2. **Notas del autor** — `NOTAS_AUTOR_Semana02.md` (este paquete)
3. **Guía de laboratorio** — `GUIA_LABORATORIO_Semana02.md`
4. **Código de ejemplos** — Archivos HTML completos en carpeta `codigo/`
5. **Capítulo 2 del libro** — `LibroAplicacionesWeb_Completo_v3.pdf` (lectura previa obligatoria)
6. **Gráficos didácticos** — Diagramas SVG/PNG en carpeta `graficos/`

---

## 5. Bloque a bloque: guion detallado del docente

### Bloque 1 — Apertura (10 min) · slides 1–3
> **Objetivo:** conectar con la semana 01 y motivar el aprendizaje de la semana.

**Apertura sugerida:**
> "La semana pasada construimos nuestra primera página HTML5 sin entender en detalle por qué cada etiqueta estaba ahí. Hoy vamos a entender el porqué. Al terminar la sesión, ustedes podrán construir un documento HTML5 que pase validación profesional, con formularios que se validan solos y con multimedia accesible para personas con discapacidad. Todo lo que aprenderemos hoy es lo que distingue al desarrollador junior del semi-senior en el mercado laboral 2026."

**Frase de cierre del bloque:** mostrar el slide 3 (resultado de aprendizaje) y leerlo enfáticamente.

---

### Bloque 2 — Historia (20 min) · slides 4–5
> **Objetivo:** dar contexto para que el estudiante entienda por qué HTML es como es hoy.

**Hilo narrativo recomendado:**
1. **SGML (1986)**: era una norma ISO compleja del gobierno y ejército. Berners-Lee la simplificó.
2. **HTML 4.01 (1999)**: el "HTML clásico" — sirvió 15 años.
3. **XHTML (2000–2008)**: el intento de "limpiar" HTML usando XML estricto. ¿Por qué fracasó? Aquí pause y pregunte a la clase. La respuesta:
   - La web tenía miles de millones de páginas mal escritas pero funcionales.
   - Los navegadores debían seguir tolerándolas.
   - XHTML exigía perfección. La web real es imperfecta. **Lección histórica:** los estándares exitosos respetan la realidad existente.
4. **HTML5 (2008–presente)**: pragmatismo. Hoy es un *Living Standard*: se actualiza sin saltos de versión.

**Pregunta de cierre:** "Si trabajas en una empresa y tu jefe te pide migrar a XHTML estricto en 2026, ¿qué le dirías?" (Respuesta esperada: que XHTML no es el estándar actual; el estándar vigente es HTML Living Standard.)

---

### Bloque 3 — Estructura (30 min) · slides 6–7
> **Objetivo:** que el estudiante pueda escribir desde cero la plantilla mínima de un documento HTML5.

**Demostración en vivo recomendada:**
1. Abrir IntelliJ con un archivo `demo.html` vacío.
2. Escribir línea por línea la plantilla del slide 6, **preguntando** por qué cada línea es necesaria.
3. Guardar el archivo y abrirlo en el navegador.
4. **Quitar deliberadamente** el `<meta charset>` y agregar un texto con tilde ("Año"). Mostrar cómo se rompe.
5. Quitar el `<meta viewport>` y abrir DevTools en modo móvil. Mostrar cómo se ve la página minúscula.
6. Volver a poner ambos. Mostrar que ahora todo funciona.

**Punto pedagógico clave en slide 7 (anatomía):** insistir en que `<img>` es void (no necesita `</img>`). Es uno de los errores más comunes.

---

### Bloque 4 — Semántica (35 min) · slides 8–10
> **Objetivo:** que el estudiante pueda elegir el elemento semántico correcto en cada situación.

**Pregunta-trampa para diagnosticar:**
> "Si estoy construyendo el área lateral del blog donde aparecen enlaces a artículos relacionados, ¿qué elemento uso: `<aside>` o `<section>`?"

Discutir las dos posibilidades en clase:
- `<aside>` si es contenido relacionado-pero-secundario respecto del artículo actual.
- `<section>` si es una agrupación temática dentro del flujo principal.

**No hay una sola respuesta correcta absoluta**; lo importante es que el estudiante justifique la elección.

**Sobre `<article>` vs `<section>`:** la "prueba RSS" del slide 9 es el atajo mental más útil. Insistir en memorizarla.

**Sobre el slide 10 (ejemplo blog):** proyecte el código y pida que un voluntario identifique cuántos `<article>` y cuántos `<section>` hay, y justifique cada uno.

---

### Bloque 5 — Formularios (45 min) · slides 11–14
> **Objetivo:** que el estudiante construya formularios con validación nativa.

**Frase de oro para repetir varias veces:**
> "La validación HTML5 es para usabilidad, NO para seguridad. **TODA** entrada del usuario debe revalidarse en el servidor (semanas 5–9). Si solo validas en el cliente, un atacante con DevTools la salta en 5 segundos."

**Demostración en vivo:**
1. Escribir el formulario del slide 14 en IntelliJ.
2. Abrir en navegador y mostrar:
   - Si dejas la cédula vacía: el navegador muestra "Por favor, completa este campo".
   - Si escribes "1234" en cédula: muestra "Coincide con el formato solicitado" rojo.
   - Si escribes un email con dominio ajeno: error.
3. **Abrir DevTools → pestaña Elements → eliminar el atributo `required`** del campo. Mostrar que ahora se envía vacío. **ESA es la razón por la que el servidor debe revalidar.**

---

### Bloque 6 — Multimedia (30 min) · slides 15–18
> **Objetivo:** entender que las cinco APIs de HTML5 eliminaron la era de los plugins propietarios.

**Anécdota histórica recomendada (slide 16):**
> "En 2010, Steve Jobs publicó la carta abierta *Thoughts on Flash* declarando que iOS nunca soportaría Flash. La industria entera se vio obligada a adoptar HTML5 nativo. En 2020, Adobe descontinuó Flash. Hoy lo que vemos en la web — videos, juegos, mapas interactivos — es HTML5 nativo, sin un solo plugin instalado."

**Punto crítico de accesibilidad (slide 17):**
- WCAG 1.2.2 — subtítulos para videos pre-grabados es de cumplimiento **AA** y **exigible legalmente** en muchas jurisdicciones (incluida la Ley Ecuatoriana de Discapacidades).
- Mostrar el atributo `kind="captions"` y enfatizar que un video sin subtítulos es discriminación.

**Sobre Web Storage (slide 18):** advertencia repetida — **NUNCA guardar JWT en localStorage**. Volveremos en semana 10.

---

### Bloque 7 — XML (15 min) · slides 19–20
> **Objetivo:** entender el ecosistema de formatos de datos sin confundirse.

**Mensaje principal:** XML no está muerto, está especializado. Los estudiantes lo verán a lo largo del curso:
- **SVG**: gráficos (lo veremos en CSS y JS).
- **SOAP**: en semana 15 (servicios web).
- **Maven `pom.xml`**: en semana 7 (Java).
- **AndroidManifest**: si toman desarrollo móvil.

**Comparativa práctica (slide 20):** el mismo dato representado en XML, JSON y YAML. La elección depende del contexto:
- JSON gana en APIs REST.
- YAML gana en configuración DevOps (Docker, Kubernetes).
- XML sigue presente en SOAP y Java empresarial.

---

### Bloque 8 — Buenas prácticas y errores (10 min) · slides 21, 25
> **Objetivo:** consolidar lo aprendido como una lista accionable.

**Estrategia:** leer rápido las 15 buenas prácticas del slide 21, luego mostrar el slide 25 (errores frecuentes) y pedir que cada estudiante identifique al menos UN error que probablemente comete a menudo.

---

### Bloque LABORATORIO (60 min) · slide 22 + guía de laboratorio
> **Objetivo:** construcción guiada del formulario de inscripción UTEQ.

Ver el archivo separado `GUIA_LABORATORIO_Semana02.md` con la guía paso a paso para los estudiantes.

**Rol del docente durante el laboratorio:**
- Caminar por el aula. **NO** dar la solución; hacer preguntas: "¿Qué pasa si pones `type="email"` en lugar de `type="text"`?".
- Cada 15 minutos hacer un check rápido: "Levanten la mano quienes ya tienen el fieldset de datos personales".
- Al final del laboratorio: proyectar 2–3 soluciones de estudiantes y comentarlas (positivo primero, mejora después).

---

### Bloque 9 — Asignación y cierre (10 min) · slides 23, 27, 28
> **Objetivo:** dejar al estudiante con una asignación clara y motivadora.

**Asignación principal:** Ejercicio 2.2 — Portafolio profesional accesible.
- Fecha de entrega: **antes de la sesión de la semana 03**.
- Ponderación: **TA02 (5% de la nota final)**.
- Entrega: repositorio Git con captura del W3C Validator (cero errores) y axe DevTools (cero violaciones).

**Lectura previa para la semana 03:**
- Capítulo 3 del libro de cátedra: "CSS para el diseño y la presentación web".

**Cierre motivacional (slide 28):**
> "Hoy aprendimos a construir el esqueleto de una página. La próxima semana lo vestiremos con CSS — el diseño visual que hace que una página se vea profesional. Pero recuerden: por más bonito que sea el CSS, si el HTML semántico está mal hecho, la página falla en accesibilidad, en SEO y en mantenibilidad. La semántica primero, el diseño después."

---

## 6. Sistema de evaluación de la semana

### 6.1 Actividades evaluadas

| Código | Actividad | Tipo | Ponderación | Cuándo |
|--------|-----------|------|-------------|--------|
| **GA02** | Participación activa en clase y laboratorio | Gestión del aprendizaje | 2% | En la sesión |
| **TA02** | Ejercicio 2.2 — Portafolio profesional accesible | Tarea autónoma | 5% | Antes de la sesión de semana 03 |

### 6.2 Rúbrica del Ejercicio 2.2 (Portafolio)

| Criterio | Excelente (5 pts) | Satisfactorio (3 pts) | Insuficiente (0 pts) |
|----------|-------------------|----------------------|---------------------|
| **Estructura semántica completa** | Todos los elementos requeridos están presentes y se usan correctamente. | Falta 1 elemento o uno se usa incorrectamente. | Faltan 2+ elementos o uso incorrecto generalizado. |
| **Validación W3C** | Cero errores y cero advertencias. | Cero errores, hasta 2 advertencias. | Hay al menos 1 error. |
| **Accesibilidad (axe)** | Cero violaciones críticas o serias. | Hasta 2 violaciones moderadas. | Cualquier violación crítica. |
| **Formulario con 6+ tipos de input** | 6+ tipos correctamente usados con validación. | 5 tipos correctos. | Menos de 5 tipos o validación incorrecta. |
| **Multimedia accesible** | `<video>` con `<track kind="captions">` y archivo `.vtt` real. | `<video>` sin subtítulos. | No hay multimedia. |
| **Tabla semántica** | `<caption>`, `<thead>`, `<tbody>`, `<th scope>` correctos. | Falta algún elemento estructural. | Tabla mal formada o ausente. |
| **Navegación por teclado** | Todo accesible solo con teclado. | Algunos elementos no accesibles. | Navegación por teclado rota. |

**Penalizaciones automáticas:**
- Entregar sin capturas de validadores: −20%
- No subir a repositorio Git: −15%
- Plagio detectado: nota 0 + reporte académico.

---

## 7. Materiales y software requeridos

### 7.1 Para el docente
- Computador con proyector
- IntelliJ IDEA Ultimate o Community (versión 2024+)
- Navegador Chrome o Firefox con DevTools
- Extensión **axe DevTools** instalada
- Acceso a `validator.w3.org/nu/`

### 7.2 Para los estudiantes
- Computador propio o de laboratorio
- IntelliJ IDEA (ya instalado desde semana 01)
- Navegador moderno con DevTools
- Cuenta de GitHub (para entregas)

---

## 8. Posibles dificultades y cómo abordarlas

| Dificultad esperada | Estrategia de apoyo |
|---------------------|---------------------|
| El estudiante confunde `<article>` y `<section>`. | Insistir en la "prueba RSS" del slide 9. Trabajar 3 ejemplos en cadena en clase. |
| El estudiante no entiende por qué la validación HTML5 no es seguridad. | Demostración en vivo: modificar HTML con DevTools para saltar `required`. |
| El estudiante no comprende qué hace `pattern="[0-9]{10}"`. | Recordar regex básico del prerrequisito Estructura de Datos; si no, dar la regla simple: `[0-9]` = un dígito, `{10}` = exactamente 10 veces. |
| El estudiante intenta validar la página y aparece "No errors" pero hay problemas. | Mostrar que validación W3C ≠ accesibilidad. Por eso usamos también axe DevTools. |
| El estudiante deja el video sin `<track>`. | Recordar que WCAG es exigible por ley en Ecuador (Ley Orgánica de Discapacidades). |

---

## 9. Indicadores de éxito de la sesión

Al terminar la semana 02, observar si la mayoría de estudiantes:

- [ ] Escriben la plantilla HTML5 mínima de memoria.
- [ ] Eligen el elemento semántico correcto sin titubear.
- [ ] Usan al menos 4 tipos de `<input>` en su laboratorio.
- [ ] Validan en W3C antes de pedir ayuda.
- [ ] Suben su tarea al repositorio Git sin problemas.

Si más del 30% de la clase falla en alguno de estos puntos, agendar tutoría adicional antes de la semana 03.

---

## 10. Conexión con las siguientes semanas

| Semana | Conexión con semana 02 |
|--------|------------------------|
| **Semana 03 — CSS** | El HTML semántico de hoy se "viste" con CSS. Los selectores se aplican a `<header>`, `<nav>`, `<main>`. |
| **Semana 04 — JavaScript** | El DOM que se manipula es el HTML semántico. `document.querySelector('article')` solo funciona si hay un `<article>`. |
| **Semana 05 — PHP** | Los formularios HTML envían datos al servidor. La validación servidor revisa LO MISMO que validamos hoy en cliente. |
| **Semana 09 — Seguridad** | El XSS (Cross-Site Scripting) ataca los campos de formulario. Saber HTML es prerrequisito para entender el ataque. |
| **Semana 15 — Servicios web** | SOAP usa XML. Si entendieron XML hoy, no se sorprenderán. |

---

## 11. Bibliografía mínima recomendada al estudiante

1. Robbins, J. N. (2018). *Learning Web Design* (5ª ed.). O'Reilly. **Capítulos 1–6.**
2. Duckett, J. (2014). *HTML & CSS: Design and Build Web Sites.* Wiley. **Capítulos 1–5.**
3. Lawson, B. & Sharp, R. (2011). *Introducing HTML5* (2ª ed.). New Riders.
4. Capítulo 2 del libro de cátedra. **Lectura obligatoria antes de la sesión.**

### Recursos en línea
- MDN Web Docs: `developer.mozilla.org/es/docs/Web/HTML`
- W3C Validator: `validator.w3.org/nu/`
- WCAG 2.1 Quick Reference: `w3.org/WAI/WCAG21/quickref/`
- HTML Living Standard: `html.spec.whatwg.org`

---

> **Documento elaborado para la Carrera de Ingeniería de Software de la Universidad Técnica Estatal de Quevedo, período 2026.**
> Esta guía didáctica acompaña el capítulo 2 del libro de cátedra "Aplicaciones Web".
