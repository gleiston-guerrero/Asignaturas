# 📖 NOTAS DEL AUTOR — SEMANA 02 (PARTE 2)
## HTML y HTML5 para el desarrollo web

> **Continuación de:** `NOTAS_AUTOR_Semana02_parte1.md`
> **Cubre:** Slides 19–28 + Apéndice A (banco de preguntas) + Apéndice B (frases de transición)
> **Duración estimada de este bloque:** ~110 minutos de exposición + cierre

---

## 📑 Índice de esta PARTE 2

- [Slide 19 — XML y su lugar en 2026](#slide-19)
- [Slide 20 — XML vs JSON vs YAML](#slide-20)
- [Slide 21 — 15 buenas prácticas](#slide-21)
- [Slide 22 — Actividad práctica en aula (Ej. 2.1)](#slide-22)
- [Slide 23 — Tarea autónoma: portafolio (Ej. 2.2)](#slide-23)
- [Slide 24 — Herramientas de validación](#slide-24)
- [Slide 25 — Errores frecuentes](#slide-25)
- [Slide 26 — Mini-quiz de cierre](#slide-26)
- [Slide 27 — Bibliografía y recursos](#slide-27)
- [Slide 28 — Cierre y puente a Semana 03](#slide-28)
- [Apéndice A — Banco de preguntas frecuentes del estudiante](#apendice-a)
- [Apéndice B — Frases de transición entre bloques](#apendice-b)

---

<a id="slide-19"></a>
## 🟢 Slide 19 — XML y su lugar en 2026

### Lo que muestra el slide

Bloque titulado "¿Por qué hablar de XML en 2026?". Lista de cuatro usos vigentes y una afirmación grande: *"XML no murió. Cambió de barrio."*

### Lo que tienes que decir (5-7 minutos)

> *"Vamos a cambiar de tema completamente. Quiero hablarles unos minutos de XML. Y sé que algunos de ustedes estarán pensando: 'profesor, ¿XML? ¿Eso no era de los 2000?'. Y mi respuesta es: XML está más vivo de lo que creen. Solo que ya no lo ven."*

(Pausa.)

> *"En 1998, el W3C estandarizó XML. La idea era brillante: un lenguaje de marcado donde **vos** podías inventar tus propias etiquetas. No estabas atado a `<p>` o `<div>`. Podías escribir `<factura>`, `<producto>`, `<precio>`. Y un parser estándar entendía la estructura."*

> *"Durante una década, XML fue **el** formato de intercambio. SOAP, RSS, configuración de Java, Office (los archivos `.docx` siguen siendo XML comprimido, ¿lo sabían?), SVG, MathML. Todo era XML."*

> *"Luego llegó JSON, más ligero, más rápido de parsear en navegadores, y XML perdió el trono del intercambio de datos en APIs web. Pero no desapareció: se concentró en nichos donde su rigor estructural sigue siendo insustituible."*

### Los cuatro usos vigentes de XML en 2026

**1. Facturación electrónica (Ecuador, México, Brasil, España)**

> *"Esto es lo más importante para ustedes como ingenieros ecuatorianos. El **SRI** —Servicio de Rentas Internas— exige que toda factura electrónica se emita en un esquema XML específico, firmado digitalmente con un certificado XAdES. Si trabajan en cualquier sistema contable, ERP o e-commerce en Ecuador, van a tocar XML. Sí o sí."*

> *"El esquema lo define el SRI en un XSD —XML Schema Definition—. Si su XML no cumple ese esquema al milímetro, la factura es rechazada. Es estricto. Es validado automáticamente por el sistema del SRI."*

**2. SVG — el gráfico vectorial de la web**

> *"Los íconos modernos, los logos, los gráficos de su dashboard, casi todo es SVG. Y SVG es **un dialecto de XML**. Cuando abren un archivo `.svg` con un editor de texto, ven etiquetas: `<svg>`, `<path>`, `<circle>`. Es XML estricto. Bien formado, validable."*

**3. Office Open XML (`.docx`, `.xlsx`, `.pptx`)**

> *"Esos archivos de Word y Excel que abren todos los días son **archivos ZIP** que contienen XML adentro. Cambien la extensión de un `.docx` a `.zip`, ábranlo, y van a ver `document.xml`. Toda la estructura del documento es XML."*

(Si tienes proyector, demuéstralo: renombra un `.docx` y muéstralo.)

**4. Configuración Java/Android (Maven, Spring, AndroidManifest)**

> *"El `pom.xml` de Maven, los `applicationContext.xml` de Spring, el `AndroidManifest.xml` de toda app Android. Java sigue siendo en gran parte XML para configuración."*

### XML estricto: las 5 reglas

> *"Si van a escribir XML, recuerden cinco reglas que no admiten excepción:"*

1. Una sola raíz.
2. Toda etiqueta abierta se cierra.
3. Anidamiento correcto: lo último abierto, lo primero cerrado.
4. Mayúsculas y minúsculas importan (case-sensitive).
5. Los atributos siempre entre comillas.

> *"HTML es tolerante. XML no. Si rompen una sola regla, el parser falla con un error fatal. **Cero** tolerancia. Por eso es bueno para sistemas críticos como facturación: si pasa el parser, está bien formado."*

#### Comentario al margen

> *"Hay una frase que me gusta sobre XML: 'XML es como cuñado: pesado, pero te ayuda a sacar las cosas adelante'. Ríanse, pero está vivo."*

---

<a id="slide-20"></a>
## 🟢 Slide 20 — XML vs JSON vs YAML

### Lo que muestra el slide

Tres bloques de código mostrando los mismos datos (información de un estudiante) en los tres formatos. Tabla comparativa abajo.

### Lo que tienes que decir (4-6 minutos)

> *"Veamos los tres formatos lado a lado. Vamos a representar el mismo objeto: un estudiante con su nombre, edad y dos cursos."*

**XML:**
```xml
<estudiante>
    <nombre>María Pérez</nombre>
    <edad>21</edad>
    <cursos>
        <curso>Aplicaciones Web</curso>
        <curso>Base de Datos</curso>
    </cursos>
</estudiante>
```

**JSON:**
```json
{
    "nombre": "María Pérez",
    "edad": 21,
    "cursos": ["Aplicaciones Web", "Base de Datos"]
}
```

**YAML:**
```yaml
nombre: María Pérez
edad: 21
cursos:
  - Aplicaciones Web
  - Base de Datos
```

> *"Tres formas de decir lo mismo. ¿Cuál es mejor? Depende del contexto."*

### Cuándo usar cada uno

| Formato | Cuándo usarlo | Cuándo NO |
|---------|--------------|-----------|
| **XML** | Documentos con esquema estricto, facturación SRI, SVG, configuración Java legacy | APIs web modernas (sobre-pesado) |
| **JSON** | APIs REST, JavaScript nativo, datos estructurados, intercambio web | Configuración legible por humanos con comentarios |
| **YAML** | Archivos de configuración (Docker, Kubernetes, GitHub Actions, CI/CD) | Datos que se envían por red (es propenso a errores de indentación) |

> *"Una regla rápida: JSON para máquina-a-máquina por la red. YAML para humano configurando un sistema. XML para sistemas legacy o cuando el esquema debe ser inviolable."*

#### Frase para fijar

> *"XML es exhaustivo. JSON es eficiente. YAML es legible. Cada uno gana en su contexto."*

---

<a id="slide-21"></a>
## 🟢 Slide 21 — 15 buenas prácticas

### Lo que muestra el slide

Lista numerada de 15 buenas prácticas profesionales, agrupadas visualmente en cuatro bloques: estructura, accesibilidad, semántica, rendimiento.

### Lo que tienes que decir (10-12 minutos)

> *"Estas 15 prácticas no son opcionales. Son lo que separa el HTML de un estudiante de primer año del HTML de un desarrollador profesional. Las vamos a recorrer rápido pero cada una vale la pena memorizar. Tomen nota."*

#### 🏗️ Estructura

**1. Siempre declarar `<!DOCTYPE html>` como primera línea.**

> *"Sin esta línea, el navegador entra en 'modo quirks' —modo extraño— y va a renderizar de forma impredecible. Lo vimos al inicio. Primera línea, sin excepciones."*

**2. Especificar el idioma del documento con `lang`.**

> *"`<html lang='es'>`. Para Ecuador, podríamos ser más específicos: `lang='es-EC'`. Esto le dice al lector de pantalla en qué idioma leer, al navegador qué corrector ortográfico usar, a Google qué público destinatario es."*

**3. Charset UTF-8 como primer meta en `<head>`.**

> *"`<meta charset='UTF-8'>`. Si lo ponen después de un título con tildes, el navegador puede haber empezado a parsear en latín-1 y luego tener que reinterpretar. Primero. Siempre."*

**4. Viewport responsivo obligatorio.**

> *"`<meta name='viewport' content='width=device-width, initial-scale=1.0'>`. Sin esto, en móvil ven el sitio diminuto. Es la línea que enciende el responsive."*

**5. Título único y descriptivo (`<title>`).**

> *"50-60 caracteres. Es lo que aparece en la pestaña del navegador, en los resultados de Google, en los marcadores. No 'Inicio' a secas. 'UTEQ — Carrera de Software | Inicio'."*

#### ♿ Accesibilidad

**6. Imágenes con `alt` siempre.**

> *"Toda imagen lleva `alt`. Si la imagen es decorativa —no aporta información—, `alt=''` (vacío). Si aporta información, `alt='Descripción concisa de lo que se ve'`. **Jamás** omitan el atributo."*

**7. Labels asociados a inputs.**

> *"Ya lo vimos en formularios. `<label for='nombre'>` y `<input id='nombre'>`. Sin label, el lector de pantalla dice 'campo de texto', y el usuario no sabe qué escribir."*

**8. Contraste de color suficiente (WCAG AA: 4.5:1 mínimo).**

> *"Texto gris claro sobre fondo blanco es elegante para ustedes, pero invisible para quien tiene baja visión. WebAIM tiene un contrast checker gratuito. Úsenlo antes de entregar."*

**9. Navegación accesible por teclado.**

> *"Prueba: desconecten el mouse y naveguen su sitio solo con Tab y Enter. Si no pueden completar un formulario, hay un problema."*

#### 🧠 Semántica

**10. Una sola `<h1>` por página.**

> *"Hay debate en HTML5 sobre si pueden tener varias `<h1>` dentro de `<article>`. La regla práctica: **una sola `<h1>`** por documento. Las demás secciones usan `<h2>`."*

**11. Jerarquía de encabezados sin saltos (h1 → h2 → h3, sin saltar a h4).**

> *"No usen `<h4>` solo porque 'se ve más pequeñito'. El estilo lo da CSS. La jerarquía es semántica."*

**12. Usar elementos semánticos, no `<div>` para todo.**

> *"Ya lo discutimos. `<nav>` para navegación, `<main>` para contenido principal, `<article>` para piezas independientes."*

#### ⚡ Rendimiento

**13. Optimizar imágenes (`<picture>`, `srcset`, formatos modernos como WebP/AVIF).**

> *"Una imagen de 4MB en una página de móvil 3G mata la experiencia. Usen `srcset` para servir distintos tamaños según pantalla. Conviertan a WebP, que pesa la mitad que JPEG."*

**14. Lazy-loading de imágenes fuera de pantalla.**

> *"`<img loading='lazy'>`. El navegador no descarga la imagen hasta que el usuario hace scroll y se acerca a ella. Una línea, gran ganancia."*

**15. Minificar HTML, CSS y JS en producción.**

> *"En desarrollo, código formateado y legible. En producción, el build comprime todo: quita espacios, comentarios, renombra variables. Bundlers como Vite o Webpack lo hacen automáticamente."*

#### Frase para fijar (después de la lista)

> *"Quince prácticas. Si aplican estas quince, su HTML ya es de nivel profesional. Si fallan en cinco, son aún estudiantes. Si fallan en diez, son cualquier cosa menos desarrolladores."*

(Sonríe pero hablas en serio.)

---

<a id="slide-22"></a>
## 🟢 Slide 22 — Actividad práctica en aula (Ej. 2.1)

### Lo que muestra el slide

Título: "Actividad en aula — Formulario de Inscripción UTEQ". Tiempo estimado, requisitos, criterios de evaluación (GA02 = 2%).

### Lo que tienes que decir (3-4 minutos de explicación)

> *"Cierren cuadernos, abran el editor. Vamos a hacer el ejercicio 2.1 del libro. Lo tienen también en el laboratorio en PDF. Saquen el archivo `03_formulario_inscripcion_UTEQ.html` del paquete que les compartí en el aula virtual —se los voy a proyectar mientras trabajan."*

> *"Van a construir un formulario de inscripción para una jornada UTEQ. El formulario tiene cuatro secciones —fieldsets— y debe usar los tipos de input que vimos."*

### Las cuatro secciones del formulario

**Fieldset 1 — Datos personales:**
- Cédula (text + pattern de 10 dígitos)
- Nombres y apellidos
- Fecha de nacimiento (`type='date'`)
- Email (`type='email'`)
- Teléfono (`type='tel'`)

**Fieldset 2 — Información académica:**
- Carrera (select)
- Período académico (select)
- Promedio actual (`type='number'`, step='0.01', min='0', max='10')

**Fieldset 3 — Preferencias de la jornada:**
- Talleres (checkboxes múltiples)
- Modalidad (radio: presencial/virtual)
- Talla de camiseta (select)
- Restricciones alimentarias (textarea)

**Fieldset 4 — Confirmación:**
- Aceptación de términos (checkbox required)
- Botón submit

### Reglas no negociables

> *"Cuatro reglas mientras trabajan:"*

1. **Validación nativa HTML5 únicamente.** Nada de JavaScript hoy. Quiero que sientan qué pueden hacer solo con HTML.
2. **Etiquetado correcto.** Todo `<input>` con `<label for>`.
3. **Documento debe validar W3C.** Cuando crean que terminaron, lo pasan por `validator.w3.org/nu/`. Cero errores.
4. **Atributo `required` donde corresponda.** No en todos, solo donde tenga sentido.

### Tiempo y entrega

> *"Tienen 50 minutos de trabajo guiado en clase. Trabajan individualmente. Cuando terminan, validan W3C, hacen captura de pantalla, suben archivo `.html` al aula virtual con el nombre `apellidos_nombre_GA02.html`. Subir antes de las [hora de cierre]. Vale el 2% del primer corte."*

### Criterios de evaluación (proyectar en pantalla)

| Criterio | Puntos |
|----------|--------|
| Estructura HTML5 válida (doctype, lang, charset, viewport) | 2 |
| Uso de los 13 tipos de input apropiados | 3 |
| Labels asociados correctamente a inputs | 2 |
| Validación nativa (required, pattern, min/max) | 2 |
| Validación W3C sin errores | 1 |
| **Total** | **10** |

> *"Yo voy a estar circulando por el aula. Si se traban, llamen. Pero antes de llamarme, intenten dos cosas. Lean el mensaje de error. Búsquenlo en MDN. Luego me llaman."*

#### Mientras los estudiantes trabajan

(Notas para ti, no para decir.)

- Pasa por los puestos cada 10 minutos.
- Los errores más comunes en este ejercicio: olvidar `for/id`, usar `name` cuando se necesita `id`, escribir `pattern="[0-9]{10}"` correctamente vs el "intuitivo" `pattern="10 dígitos"`.
- Premia con un comentario público al primero que valide W3C sin errores: "Miren, [nombre] ya validó. Si quieren ver cómo lo organizó, vayan a verlo."
- Si nadie termina en 40 minutos, escribe en la pizarra: *"¿Olvidaron `<!DOCTYPE html>`?"* — suele ser el error invisible.

---

<a id="slide-23"></a>
## 🟢 Slide 23 — Tarea autónoma: portafolio (Ej. 2.2)

### Lo que muestra el slide

Título: "Tarea autónoma — Mi Portafolio HTML5". Especificaciones, fecha de entrega, peso (TA02 = 5%).

### Lo que tienes que decir (4-5 minutos)

> *"Esta es la tarea de la semana. Vale 5% del corte. Cuatro horas autónomas de trabajo. Se entrega en una semana, antes de la próxima clase."*

> *"Ya tienen una plantilla base: `06_portafolio_template.html`. La pueden usar como punto de partida. Pero ojo: si entregan la plantilla sin cambios sustanciales, calificación cero. Quiero **su** portafolio."*

### Requisitos del portafolio

> *"El portafolio debe ser un único archivo HTML —sin CSS externo todavía, lo veremos la próxima semana—. Tiene que contener seis secciones:"*

1. **Encabezado** con su nombre y rol que aspiran (ej. "Estudiante de Ingeniería de Software | UTEQ").
2. **Navegación** con anclajes internos a cada sección.
3. **Sobre mí** — párrafo personal de 100-150 palabras.
4. **Habilidades técnicas** — lista categorizada (lenguajes, herramientas, idiomas).
5. **Proyectos** — al menos 3 proyectos, cada uno como `<article>`. Cada uno con título, descripción, tecnologías usadas, fecha.
6. **Educación** — `<section>` con su trayectoria académica.
7. **Contacto** — un mini-formulario (email + mensaje + submit).
8. **Footer** con derechos y año.

> *"Y dos requisitos transversales:"*
> *"A — Todas las secciones usan elementos semánticos. Cero `<div>` excepto donde sea estrictamente necesario."*
> *"B — Valida W3C sin errores. Captura de pantalla de la validación va incluida en la entrega."*

### Entregable

> *"Suben al aula virtual:"*
- Archivo `apellidos_nombre_TA02_portafolio.html`
- Captura de pantalla del validador W3C mostrando 0 errores.
- Documento breve (1 página) explicando: qué elementos semánticos usaron y por qué.

### Rúbrica

| Criterio | Excelente (10) | Bueno (7) | Regular (4) | Insuficiente (1) |
|----------|---------------|-----------|-------------|-------------------|
| Estructura semántica | Todas las secciones usan elementos semánticos correctos | Mayoría correctas, alguna confusión `article`/`section` | Mezcla `<div>` con semánticos sin criterio | Solo `<div>` |
| Validación W3C | 0 errores, 0 warnings | 0 errores, ≤2 warnings | 1-3 errores | 4+ errores |
| Accesibilidad | Todas las imágenes con `alt`, todos los inputs con `<label>`, contraste correcto | 1-2 omisiones menores | Varias omisiones | Sin accesibilidad |
| Originalidad/contenido | Contenido propio, 3+ proyectos descritos con detalle | Contenido propio, 3 proyectos básicos | Contenido genérico, plantilla apenas modificada | Plantilla sin cambios |
| Reflexión | Documento de reflexión claro, identifica decisiones de diseño | Reflexión correcta pero superficial | Reflexión vaga | Sin reflexión |

### Pista que les das ahora

> *"Un consejo: empiecen ahora, en frío, lo que se les ocurra de su perfil. Aunque no lo terminen hoy. Lo dejan reposar. Mañana lo ven con otros ojos y le ven errores. Ese es el momento de mejorar. Quien deja la tarea para la noche anterior, entrega plantilla con un nombre cambiado y calificación 4."*

---

<a id="slide-24"></a>
## 🟢 Slide 24 — Herramientas de validación

### Lo que muestra el slide

Cuatro tarjetas con icono y URL: W3C Validator, WAVE, Lighthouse, Can I Use.

### Lo que tienes que decir (4-5 minutos)

> *"Estas son cuatro herramientas que van a usar **siempre** mientras desarrollen web. Las anotan."*

#### 1. validator.w3.org/nu/

> *"El validador oficial del W3C. Le pasan un archivo o una URL y les dice cada error de sintaxis. Esta es la verdad oficial sobre si su HTML está bien o no. Cuando una entrevista técnica les pregunte si validaron, esta es la respuesta. 'Pasé por el Nu HTML Checker'."*

#### 2. wave.webaim.org

> *"El Web Accessibility Evaluation Tool. WAVE. Le pasan una URL y les marca con íconos cada problema de accesibilidad: imagen sin alt, contraste bajo, label faltante. Es la herramienta de cabecera de los auditores de accesibilidad."*

#### 3. Lighthouse (integrado en Chrome DevTools)

> *"Abren Chrome DevTools (F12), pestaña Lighthouse. Generan reporte. Les da puntuación 0-100 en cuatro categorías: Performance, Accessibility, Best Practices, SEO. Es lo que Google considera 'un buen sitio'. Si quieren posicionar en Google, Lighthouse tiene que dar verde."*

#### 4. caniuse.com

> *"¿Esa propiedad CSS funciona en Safari de iPhone? ¿`<dialog>` está soportado en Firefox? Antes de usar cualquier característica nueva, **chequeen Can I Use**. Tablas de soporte de navegadores actualizadas diariamente."*

### Costumbre profesional que les inculco

> *"Antes de entregar cualquier sitio en su carrera, hagan tres cosas: validar HTML con W3C, pasar WAVE, correr Lighthouse. Tres minutos de trabajo, mejora la calidad de su entrega un 50%."*

> *"Si entregan sin pasar por estas tres herramientas, su HTML es como el café sin colar: el sabor está ahí, pero el resultado es horrible."*

---

<a id="slide-25"></a>
## 🟢 Slide 25 — Errores frecuentes

### Lo que muestra el slide

Lista de 8 errores con icono ⚠️ y la corrección al lado. Diseñado tipo "check-list autocrítico".

### Lo que tienes que decir (6-8 minutos)

> *"Estos son los ocho errores que voy a encontrar en sus tareas. Lo sé porque los he encontrado todos los semestres. Vamos a anticiparlos."*

#### Error 1: Olvidar el DOCTYPE

```html
<html>     ❌ Modo quirks
```
```html
<!DOCTYPE html>
<html>     ✅ Modo estándar
```

> *"Sin DOCTYPE, el navegador renderiza distinto. Sus márgenes, paddings, todo cambia. Lo van a notar al hacer CSS la próxima semana."*

#### Error 2: Confundir `id` con `name`

```html
<label for="email">Email</label>
<input name="email">     ❌ Label no se asocia
```
```html
<label for="email">Email</label>
<input id="email" name="email">     ✅
```

> *"`for` del label apunta a `id` del input, no a `name`. `name` es el nombre que viaja al servidor cuando se envía el formulario. Ambos son necesarios pero son cosas distintas."*

#### Error 3: Usar `<br>` para crear espacio

```html
<p>Hola</p>
<br><br><br>    ❌ Espacio con <br>
<p>Mundo</p>
```
```html
<p style="margin-bottom: 2em;">Hola</p>    ✅ Espacio con CSS
<p>Mundo</p>
```

> *"El `<br>` es para saltos de línea dentro de un poema, una dirección postal, lugares donde la línea tiene significado. Para espacio entre bloques se usa CSS, no `<br>` apilados."*

#### Error 4: Atributos sin comillas

```html
<input type=text required>     ❌ Funciona pero es frágil
```
```html
<input type="text" required>   ✅ Convención
```

> *"HTML5 técnicamente permite atributos sin comillas si no tienen espacios. Pero la convención profesional es siempre con comillas dobles. Sus linters van a marcarles si no las usan."*

#### Error 5: `alt` faltante o vacío con propósito

```html
<img src="logo.png">                              ❌ Falta alt
<img src="logo.png" alt="">                        ⚠️ Solo si decorativa
<img src="logo.png" alt="Logo UTEQ">              ✅ Descriptivo
```

#### Error 6: Anidar elementos mal

```html
<p>Hola <div>Mundo</div></p>     ❌ <div> no puede ir dentro de <p>
```
```html
<p>Hola</p>
<div>Mundo</div>                  ✅
```

> *"Hay reglas de qué puede contener qué. Un `<p>` (contenedor inline) no puede tener un `<div>` (contenedor de bloque) adentro. Si lo escriben así, el navegador 'arregla' el HTML cerrando el `<p>` antes del `<div>`, y luego abre otro `<p>` después. Renderizado impredecible."*

#### Error 7: Confiar en la validación HTML como seguridad

```html
<input type="email" required>
```

> *"Tercera vez que lo digo. Esto no es seguridad. Un usuario malicioso desactiva JavaScript, abre DevTools, modifica el HTML, manda lo que quiera al servidor. La validación que importa es la del servidor."*

#### Error 8: `<section>` sin encabezado

```html
<section>           ❌ Section sin encabezado
    <p>Contenido suelto</p>
</section>
```
```html
<section>
    <h2>Habilidades técnicas</h2>     ✅
    <p>Contenido</p>
</section>
```

> *"Toda `<section>` debe tener un encabezado. Es la regla. Si no le pueden poner un `<h2>` que tenga sentido, lo que tienen no es una `<section>`, es un `<div>`."*

### Cierre del slide

> *"Ocho errores. Los voy a revisar en sus tareas. Si encuentro tres de estos en una sola entrega, es indicio de que no leyeron las notas. Lean las notas."*

---

<a id="slide-26"></a>
## 🟢 Slide 26 — Mini-quiz de cierre

### Lo que muestra el slide

Cinco preguntas, opción múltiple. Diseñado como evaluación formativa, **no sumativa**.

### Lo que tienes que decir (5-8 minutos, dinámico)

> *"Vamos a hacer un mini-quiz. No es para nota. Es para que ustedes sepan qué les quedó claro y qué no. Levanten la mano con la opción que crean correcta. Las respondemos juntos."*

#### Pregunta 1

> *"¿Cuál es la primera línea obligatoria de todo documento HTML5?"*
>
> A) `<html>`
> B) `<!DOCTYPE html>`
> C) `<meta charset='UTF-8'>`
> D) `<head>`

(Espera 5 segundos para manos.)

> *"La respuesta es **B**. DOCTYPE primero, antes incluso de `<html>`."*

#### Pregunta 2

> *"¿Cuándo uso `<article>` y cuándo `<section>`?"*
>
> A) Son intercambiables
> B) `<article>` cuando el contenido es independiente y reutilizable; `<section>` para subdividir un tema con encabezado
> C) `<section>` para títulos grandes, `<article>` para textos
> D) Lo que se vea mejor en mi diseño

> *"La respuesta es **B**. Recuerden la prueba RSS: si publicarían eso solo en un feed, es `<article>`."*

#### Pregunta 3

> *"¿Qué hace `<input type='email' required>` en cuanto a seguridad?"*
>
> A) Protege contra inyección SQL
> B) Garantiza que el email es válido antes de enviar al servidor
> C) Mejora la experiencia de usuario pero **no** es una garantía de seguridad
> D) Encripta el campo

> *"La respuesta es **C**. Lo dije tres veces hoy. Validación de cliente = experiencia. Validación de servidor = seguridad."*

#### Pregunta 4

> *"¿Dónde guardo un token JWT después del login?"*
>
> A) localStorage
> B) sessionStorage
> C) Variable global de JavaScript
> D) Cookie con flags HttpOnly + Secure + SameSite=Strict

> *"La respuesta es **D**. Lo veremos en detalle la semana 10, pero la regla ya la saben."*

#### Pregunta 5

> *"¿Cuál es la forma correcta de hacer una imagen accesible?"*
>
> A) `<img src='foto.jpg'>`
> B) `<img src='foto.jpg' alt='foto'>`
> C) `<img src='foto.jpg' alt=''>`
> D) `<img src='foto.jpg' alt='Estudiantes de la UTEQ trabajando en laboratorio'>`

> *"La respuesta correcta es **D**. Descripción significativa. `alt='foto'` no aporta nada. `alt=''` solo si es decorativa y no añade información."*

### Cierre del quiz

> *"Levanten la mano quienes respondieron las cinco bien. [Cuenta.] Quienes respondieron mínimo cuatro. [Cuenta.] Quienes menos de tres. [Cuenta.] Los que tuvieron menos de tres, repasen estas notas antes del próximo viernes. Es importante."*

---

<a id="slide-27"></a>
## 🟢 Slide 27 — Bibliografía y recursos

### Lo que muestra el slide

Lista de recursos en cuatro bloques: documentación oficial, libros, cursos, comunidades.

### Lo que tienes que decir (3-4 minutos)

> *"Recursos para que profundicen por su cuenta. Voy a destacar tres que son obligatorios y el resto opcionales."*

#### 📘 Obligatorios

**1. MDN Web Docs — developer.mozilla.org**

> *"Esta es la biblia. Cuando tengan duda sobre cualquier elemento HTML, propiedad CSS, función JavaScript: MDN primero. Es mantenida por Mozilla con la comunidad. Es gratuita. Está en español parcialmente. El contenido en inglés siempre está más actualizado."*

> *"Costumbre que les voy a inculcar: si Stack Overflow les contradice MDN, **MDN tiene razón**. Stack Overflow tiene respuestas viejas, sin validar. MDN se actualiza."*

**2. W3C HTML Living Standard — html.spec.whatwg.org**

> *"La especificación oficial. Cuando MDN no es suficiente y necesitan el comportamiento exacto de un elemento, van a la spec. Es densa, técnica. No es para leer de corrido sino para consultar."*

**3. Sílabo y libro de cátedra de la asignatura**

> *"En el aula virtual está el PDF del libro. Tiene 18 capítulos. Cada semana corresponde a uno. Lean el capítulo de la semana **antes** de venir a clase. Lo que yo explico aquí complementa el libro, no lo reemplaza."*

#### 📚 Recomendados

- **CSS-Tricks** (css-tricks.com) — artículos prácticos
- **Smashing Magazine** (smashingmagazine.com) — diseño y desarrollo profesional
- **WebAIM** (webaim.org) — accesibilidad
- **Can I Use** (caniuse.com) — soporte de navegadores

#### 📖 Libros físicos para los muy interesados

- *HTML and CSS: Design and Build Websites* — Jon Duckett (libro visual, ideal para principiantes)
- *Resilient Web Design* — Jeremy Keith (gratuito en resilientwebdesign.com)
- *Web Accessibility for Developers* — W. Hocking

#### 👥 Comunidades

- **Discord de la asignatura UTEQ** (link en aula virtual)
- **Subreddit r/webdev** (en inglés)
- **DEV Community** (dev.to)

### Comentario al margen

> *"Yo personalmente leo Smashing Magazine y CSS-Tricks todas las semanas. Es así como me mantengo al día. La web cambia cada 6 meses. Si ustedes no leen, en dos años están desactualizados."*

---

<a id="slide-28"></a>
## 🟢 Slide 28 — Cierre y puente a Semana 03

### Lo que muestra el slide

Slide de cierre. Resumen de lo aprendido (5 puntos clave). A la derecha: "Próxima semana: CSS3 — Estilos profesionales y diseño responsivo."

### Lo que tienes que decir (5-7 minutos)

> *"Estamos cerrando. Pongan toda su atención por última vez en estos cinco minutos. Esta es la parte más importante: lo que se llevan."*

(Pausa. Mira al grupo.)

### Los cinco puntos que se llevan

> *"Primero. **HTML no es código fuente: es un contrato semántico.** Ian Hickson lo dijo cuando empezamos. Cada etiqueta que escriben significa algo. No se ponen porque sí. `<button>` es un botón, no `<div onclick>`. `<article>` es contenido independiente, no `<div class='post'>`. Lo que significa cada etiqueta es lo que comunica al navegador, al lector de pantalla, al buscador, al desarrollador siguiente."*

> *"Segundo. **Validación HTML5 = experiencia de usuario, no seguridad.** Tercera vez que lo digo hoy. Si solo se acuerdan de una cosa de esta clase, que sea esta. La seguridad se hace en el servidor. Siempre."*

> *"Tercero. **Accesibilidad no es opcional.** Es legal en Ecuador. Es ético en cualquier parte. Es práctica profesional. Imágenes con alt. Labels en formularios. Contraste. Subtítulos en videos. Cinco cosas, cinco minutos, gran diferencia."*

> *"Cuarto. **XML no murió, vive en nichos.** Facturación SRI, SVG, .docx, Java. Si trabajan en Ecuador en cualquier sistema que emita facturas, tocarán XML."*

> *"Quinto. **Las 15 buenas prácticas no son consejos: son estándar.** Si no las aplican, se ve. Si las aplican, su trabajo se distingue."*

### Lo que vamos a hacer la próxima semana

(Cambias tono, hablas con entusiasmo.)

> *"La próxima semana cambiamos de marcha. Hasta hoy hemos hablado de **estructura**: el esqueleto del documento. La próxima semana hablamos de **presentación**: cómo se ve. CSS3. Selectores. Modelo de caja. Flexbox. Grid. Animaciones."*

> *"Vamos a tomar el portafolio que están haciendo —tarea de esta semana— y la próxima semana le ponemos estilos profesionales. Diseño responsivo: que se vea bien en su móvil, en una tablet, en una pantalla de 27 pulgadas. La misma estructura HTML, presentación adaptativa."*

> *"Lleguen con su portafolio HTML terminado. Sin estilos. Lo vamos a 'pintar' juntos en clase."*

### Despedida

> *"Antes de irse, tres preguntas para reflexionar esta semana:"*

(Las dices despacio. Algunos las anotarán.)

> *"Primera: ¿podría una persona ciega navegar mi portafolio?"*
>
> *"Segunda: ¿si Google indexa mi sitio, entiende de qué se trata?"*
>
> *"Tercera: ¿el HTML que entrego representa quién soy o solo cumple el requisito?"*

(Pausa.)

> *"Gracias por hoy. Bonita tarde. Recuerden la tarea: portafolio HTML5 validado, sube antes de la próxima clase. Cualquier duda, aula virtual."*

(Apaga el proyector. Camina hacia la puerta para dar señal de fin.)

---

<a id="apendice-a"></a>
## 📚 Apéndice A — Banco de preguntas frecuentes del estudiante

Estas son las preguntas que estudiantes harán durante o después de la clase. Respuestas preparadas.

### P1: "Profesor, ¿no me puedo saltar el DOCTYPE? Igual se ve bien."

> *"Se ve bien hoy, en este navegador, en este monitor. La próxima semana, cuando agreguen CSS, van a notar que los márgenes se comportan distinto. Y cuando prueben en Safari de iPhone va a ser peor. El DOCTYPE no es 'lindo de tener'. Es la primera promesa que su documento hace al navegador. Sin él, todo es impredecible. Una línea, cinco segundos, problemas evitados."*

### P2: "¿Por qué tengo que usar `<article>` si puedo poner un `<div class='article'>`?"

> *"Tres razones. Una, accesibilidad: el lector de pantalla anuncia 'artículo' al usuario ciego. Con `<div>` no. Dos, SEO: Google entiende que ese bloque es contenido principal. Tres, mantenibilidad: el desarrollador que toma su código en seis meses entiende sin leer el class. Cuatro, si me permiten una cuarta: porque eso es lo que hacen los profesionales. ¿O ustedes quieren ser desarrolladores junior toda la vida?"*

### P3: "¿Por qué `<section>` necesita encabezado siempre?"

> *"Porque `<section>` representa una **agrupación temática** de contenido. Una sección **trata de algo**. Ese algo se llama con un encabezado. Si no hay tema, no hay sección: lo que tienen es un agrupamiento visual, y eso es `<div>`. La regla operativa: 'si no le puedo poner `<h2>` con sentido, no es section'."*

### P4: "Mi formulario funciona pero no valida W3C. ¿Pasa algo?"

> *"Pasa mucho. Que funcione visualmente no es que esté correcto. Un código mal escrito que 'funciona' es una bomba de tiempo. La próxima actualización del navegador, una característica nueva de CSS, un cambio en el HTML que añadan, puede tronar todo. Si pasa W3C sin errores, su código tiene cimientos firmes. Si no, está caminando sobre cáscara de huevo."*

### P5: "¿Qué pasa si pongo dos `<main>` en una página?"

> *"Pasa que su HTML deja de ser válido. La especificación dice **una sola `<main>` por documento**. Si quieren dividir el contenido principal, dentro de `<main>` ponen `<section>` y `<article>`. Pero solo un `<main>`."*

### P6: "¿Puedo poner `<header>` dentro de `<article>`?"

> *"Sí. `<header>` no es solo el del documento. Cada `<article>` puede tener su propio `<header>` con título, fecha, autor. Cada `<section>` también. La regla del header es: 'introduce el contenido del padre'. Funciona en cualquier nivel."*

### P7: "¿Necesito todos los meta tags que vimos? Son muchos."

> *"Los obligatorios son tres: charset, viewport, title. Los recomendados —description, theme-color, Open Graph— ayudan a SEO y a cuando comparten el link en WhatsApp o redes sociales. Para una práctica académica, los tres obligatorios bastan. Para un sitio real, los recomendados también."*

### P8: "¿Si pongo `required` en todos los inputs, el formulario es más seguro?"

> *"No. Más estricto, no más seguro. Y peor: forzar `required` en todo molesta al usuario. ¿De verdad necesitan el segundo nombre obligatorio? ¿El número de teléfono fijo? `required` solo donde el dato es **esencial**. Si pueden completar la operación sin ese dato, no lo hagan obligatorio."*

### P9: "¿Cuál es la diferencia entre `<b>` y `<strong>`?"

> *"`<b>` significa 'negrita visual' —razón estilística, sin importancia semántica—. `<strong>` significa 'importancia fuerte' —el contenido es importante—. Visualmente se ven igual. Para un lector de pantalla, `<strong>` se enfatiza vocalmente. La regla: si la importancia importa, `<strong>`. Si es solo decorativo, `<b>` (o mejor, CSS con `font-weight: bold`)."*

### P10: "¿Y entre `<i>` y `<em>`?"

> *"Mismo patrón. `<i>` es itálica visual (nombres científicos, palabras extranjeras: 'in vitro', 'rendez-vous'). `<em>` es énfasis: el lector de pantalla cambia el tono. Si la palabra **suena distinta** en una lectura, `<em>`. Si solo se ve distinta, `<i>` o CSS."*

### P11: "¿Por qué `<button>` y no `<input type='submit'>`?"

> *"Ambos funcionan. `<button>` es más flexible: puede contener HTML adentro, iconos, etc. `<input type='submit'>` solo lleva texto en su atributo `value`. Mi recomendación: `<button>` salvo que estén trabajando con código legacy."*

### P12: "Profesor, copié código de Stack Overflow y no funciona. ¿Por qué?"

> *"Tres razones probables. Una, el código es viejo: HTML5 ya cambió y esa solución es obsoleta. Dos, no entendieron qué hacía y le falta contexto. Tres, lo copiaron mal. Pasos: lean el código y entiéndanlo línea por línea. Comparen con MDN. Si todavía no funciona, vengan a mí o al aula virtual con el código, el error exacto, y qué intentaron. No 'no funciona' a secas."*

### P13: "¿Los formularios con AJAX no necesitan `<form>`?"

> *"Técnicamente pueden funcionar sin `<form>` si manejan todo con JavaScript. Pero pierden mucha funcionalidad nativa: validación HTML5, envío con Enter, accesibilidad, autocompletado del navegador. Siempre envuelvan inputs en `<form>` aunque manejen el submit con JS. Es práctica profesional."*

### P14: "¿`<iframe>` se sigue usando?"

> *"Sí, pero con cuidado. Hoy se usa para incrustar contenido de terceros: YouTube, Google Maps, formularios externos como Google Forms o widgets de pago. Tres recomendaciones: ponle siempre `title` (accesibilidad), `sandbox` cuando puedan (seguridad), y `loading='lazy'` (performance). Y nunca incrustes contenido que pueda transmitir información privada vía iframe sin entender bien la política de cookies cross-origin."*

### P15: "¿Y los frames clásicos como `<frame>` y `<frameset>`?"

> *"Murieron en HTML5. No los usen. Si los ven en código viejo, es una señal de que ese código tiene 20 años de antigüedad."*

---

<a id="apendice-b"></a>
## 🔄 Apéndice B — Frases de transición entre bloques

Para que la clase fluya sin pausas incómodas, aquí frases puente preparadas.

### Bloque 1 → Bloque 2 (de historia a estructura)

> *"Bien. Eso fue de dónde viene HTML. Ahora vamos a lo concreto: cómo se escribe un documento HTML5 hoy, en 2026. Abramos el editor mental."*

### Bloque 2 → Bloque 3 (de estructura a elementos semánticos)

> *"Tenemos la estructura mínima. Ahora le ponemos carne: las etiquetas semánticas que dan significado al contenido. Esta es la parte donde HTML5 brilla."*

### Bloque 3 → Bloque 4 (de semántica a formularios)

> *"Hasta aquí hemos hablado de presentar contenido. Ahora pasamos al otro lado de la web: cómo el usuario nos manda datos. Formularios. Posiblemente lo que más van a construir en sus carreras."*

### Bloque 4 → Bloque 5 (de formularios a multimedia)

> *"Hemos visto formularios y validación. Pasamos a la otra gran capacidad de HTML5: multimedia nativa. Video, audio, gráficos. Sin Flash, sin plugins."*

### Bloque 5 → Bloque 6 (de multimedia a XML)

> *"Cambio de tema. Quiero hablarles unos minutos de algo que parece de hace 20 años pero está más vivo de lo que creen: XML."*

### Bloque 6 → Bloque 7 (de XML a buenas prácticas)

> *"Tenemos los contenidos técnicos cubiertos. Ahora un cambio de marcha: las 15 prácticas profesionales que separan código de estudiante de código de profesional. Ojo aquí."*

### Bloque 7 → Bloque 8 (de teoría a práctica)

> *"Suficiente teoría. Vamos a aplicar. Editor abierto. Concentración."*

### Bloque 8 → Bloque 9 (de práctica a cierre)

> *"Veo que la mayoría ya validó. Hagamos cierre. Pongan atención por última vez en estos minutos finales."*

### Bloque 9 → fin

> *"Tres preguntas para esta semana. Las escribo en pizarra. Las contestan en su cabeza al hacer la tarea."*

### Frases comodín para cuando alguien hace una buena pregunta

- *"Excelente pregunta. La respuesta es..."*
- *"Eso me lo iban a preguntar y no lo iba a contar. Bien."*
- *"Esta pregunta vale más que la clase. Atención."*

### Frases comodín cuando alguien hace una pregunta mal formulada

- *"Eso no es exactamente lo que pasa. Déjenme reformularlo..."*
- *"Veo de dónde viene esa idea pero hay una confusión. Vamos a aclararlo."*
- *"Esa es una idea común y por eso la voy a desarmar..."*

### Frases para reactivar atención cuando notas dispersión

- *"Atentos. Esto va para examen."*
- *"Tres puntos. Anoten."*
- *"Bajen los celulares treinta segundos. Vale la pena."*

### Frases para premiar respuestas correctas

- *"Exacto. Lo dijiste mejor que yo."*
- *"Eso. Aplausos mentales."*
- *"Esto es lo que quería escuchar."*

---

## 📌 Cierre operativo de las notas

Estas notas (Parte 1 + Parte 2) cubren la sesión completa de la Semana 02. Distribución:

- **Parte 1** (slides 1-18): apertura, historia, fundamentos, semántica, formularios, multimedia, almacenamiento. **~115 minutos de exposición.**
- **Parte 2** (slides 19-28): XML, buenas prácticas, actividad, tarea, herramientas, errores, quiz, bibliografía, cierre. **~110 minutos de exposición + actividad de laboratorio.**

Total: **240 minutos de sesión presencial (4 horas)** según el sílabo. Las **4 horas autónomas** quedan para la tarea TA02 (portafolio).

### Recomendación final al docente

> *Imprime las notas. Resaltador en mano. Marca las frases que más resuenan contigo. Reescribe las que no te suenan naturales en tu propia voz. Estas son notas-base; tu personalidad las completa.*

> *Lleva siempre el archivo `03_formulario_inscripcion_UTEQ.html` abierto en un editor proyectable. Es el material vivo de demostración.*

> *Si una sección queda corta de tiempo, prioriza: estructura semántica > formularios > multimedia > XML > buenas prácticas. XML y buenas prácticas pueden recortarse si el grupo va lento. Lo no negociable: validación = UX, no seguridad. Y JWT no va en localStorage.*

---

**Fin del documento.**

📚 Notas del Autor — Semana 02 (Parte 2 de 2)
🎓 Aplicaciones Web — UTEQ 2026
✍️ Material didáctico complementario a la presentación PPTX
