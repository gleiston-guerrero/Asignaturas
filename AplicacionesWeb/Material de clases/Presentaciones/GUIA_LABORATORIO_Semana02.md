# GUÍA DE LABORATORIO — SEMANA 02

## Construcción de un formulario HTML5 accesible y semántico

---

### Datos del laboratorio

| Campo | Valor |
|-------|-------|
| **Asignatura** | Aplicaciones Web |
| **Carrera** | Ingeniería de Software |
| **Período** | 5° — Mayo 2026 |
| **Semana** | 02 |
| **Capítulo del libro** | Capítulo 2 — HTML y HTML5 |
| **Duración** | 60 minutos en aula + trabajo autónomo en casa |
| **Modalidad** | Práctica individual con seguimiento del docente |
| **Entregable** | Archivo `inscripcion.html` validado en W3C |
| **Peso evaluativo** | GA02 — 2 % del corte 1 |

---

### 1. Objetivo del laboratorio

Al concluir esta práctica, el estudiante será capaz de:

1. Crear un documento HTML5 con la estructura mínima obligatoria.
2. Utilizar al menos **6 tipos diferentes** de `<input>` modernos.
3. Aplicar **validación nativa del navegador** mediante atributos.
4. Asociar correctamente `<label>` con `<input>` para accesibilidad.
5. Validar el documento ante el W3C sin errores ni advertencias.

---

### 2. Materiales y herramientas

**Software necesario:**
- Visual Studio Code (o cualquier editor de texto).
- Navegador moderno: Chrome 119+, Firefox 119+, Edge 119+ o Safari 17+.
- Conexión a Internet para usar el validador del W3C.

**Extensiones recomendadas para VS Code:**
- `Live Server` — recarga automática al guardar.
- `Prettier - Code formatter` — auto-formato.
- `HTML CSS Support` — autocompletado mejorado.

**Recursos en línea:**
- 🔗 Validador W3C: <https://validator.w3.org/nu/>
- 🔗 MDN — Elementos de formulario: <https://developer.mozilla.org/es/docs/Web/HTML/Element/input>
- 🔗 Can I Use: <https://caniuse.com>

---

### 3. Contexto del ejercicio

> La Facultad de Ciencias de la Ingeniería de la UTEQ organizará el **20 de junio de 2026** la **Jornada de Aplicaciones Web 2026**. Necesita un formulario en línea para que estudiantes y profesionales se registren. Te han encargado construir el front-end del formulario aprovechando todo lo que HTML5 ofrece para validación nativa, sin escribir aún JavaScript.

---

### 4. Paso a paso

#### 🔹 Paso 1 — Preparar el entorno (5 min)

1. Crea una carpeta llamada `lab-semana02` en tu escritorio.
2. Ábrela en Visual Studio Code (`File → Open Folder…`).
3. Crea dentro un archivo llamado **exactamente** `inscripcion.html`.
4. Asegúrate de tener instalada la extensión Live Server.

> ✅ **Tip:** Nombra los archivos en minúsculas, sin tildes ni espacios. Usa guiones (`-`) en lugar de espacios.

---

#### 🔹 Paso 2 — Estructura mínima HTML5 (5 min)

Escribe en `inscripcion.html` la siguiente estructura. Puedes usar el atajo `!` + `Tab` en VS Code si tienes Emmet (viene de fábrica):

```html
<!DOCTYPE html>
<html lang="es-EC">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscripción Jornada Aplicaciones Web 2026 | UTEQ</title>
</head>
<body>

</body>
</html>
```

**Verificación:** Abre la página con Live Server (`Alt + L`, `Alt + O`). Deberías ver una pestaña con el título correcto y la página en blanco.

> ⚠️ **Atención:** Si en el título aparecen caracteres raros como "Inscripci�n", el problema es que tu editor guardó el archivo en otra codificación. En VS Code, mira la esquina inferior derecha: debe decir **UTF-8**.

---

#### 🔹 Paso 3 — Cabecera del sitio (5 min)

Dentro de `<body>`, añade la cabecera y el título principal:

```html
<header>
    <h1>Jornada de Aplicaciones Web 2026</h1>
    <p>Facultad de Ciencias de la Ingeniería — UTEQ</p>
    <p>
        <time datetime="2026-06-20">20 de junio de 2026</time>
    </p>
</header>

<main>
    <h2>Formulario de inscripción</h2>
    <p>Completa todos los campos marcados con (*). Cierre de inscripciones: 15 de junio.</p>
</main>
```

**Concepto clave:** El elemento `<time>` con su atributo `datetime` permite que motores de búsqueda y asistentes virtuales entiendan la fecha de manera no ambigua.

---

#### 🔹 Paso 4 — Bloque 1: Datos personales (15 min)

Dentro de `<main>`, abre el formulario y agrupa los datos personales con `<fieldset>`:

```html
<form action="/api/inscripcion" method="post" autocomplete="on">

    <fieldset>
        <legend>1. Datos personales</legend>

        <p>
            <label for="nombres">Nombres completos *</label><br>
            <input type="text" id="nombres" name="nombres"
                   required minlength="2" maxlength="80"
                   placeholder="Ej.: María Fernanda"
                   autocomplete="given-name">
        </p>

        <p>
            <label for="apellidos">Apellidos *</label><br>
            <input type="text" id="apellidos" name="apellidos"
                   required minlength="2" maxlength="80"
                   autocomplete="family-name">
        </p>

        <p>
            <label for="cedula">Cédula de identidad *</label><br>
            <input type="text" id="cedula" name="cedula"
                   required pattern="[0-9]{10}"
                   title="Debe contener 10 dígitos numéricos"
                   inputmode="numeric" maxlength="10"
                   placeholder="0123456789">
        </p>

        <p>
            <label for="email">Correo electrónico *</label><br>
            <input type="email" id="email" name="email"
                   required
                   placeholder="estudiante@uteq.edu.ec"
                   autocomplete="email">
        </p>

        <p>
            <label for="telefono">Teléfono celular *</label><br>
            <input type="tel" id="telefono" name="telefono"
                   required pattern="0[0-9]{9}"
                   title="10 dígitos comenzando por 0"
                   autocomplete="tel">
        </p>

        <p>
            <label for="nacimiento">Fecha de nacimiento *</label><br>
            <input type="date" id="nacimiento" name="nacimiento"
                   required min="1950-01-01" max="2010-12-31">
        </p>
    </fieldset>

</form>
```

> 🧪 **Prueba ahora mismo:** Guarda y abre la página. Intenta enviar el formulario vacío. ¿Qué pasa? Deberías ver mensajes de error en español sin haber escrito JavaScript. Esa es la **validación nativa de HTML5**.

**Conceptos demostrados:**
- Atributo `required` → obliga al campo.
- Atributo `pattern` → exige formato exacto (regex).
- Atributo `title` → mensaje de error personalizado.
- Atributo `autocomplete` → el navegador sugiere datos previos.
- Atributo `inputmode` → muestra el teclado adecuado en móvil.

---

#### 🔹 Paso 5 — Bloque 2: Información académica (10 min)

Después del primer `</fieldset>` y antes de `</form>`, añade:

```html
<fieldset>
    <legend>2. Información académica</legend>

    <p>
        <label for="carrera">Carrera *</label><br>
        <select id="carrera" name="carrera" required>
            <option value="">— Selecciona —</option>
            <option value="ing-software">Ingeniería de Software</option>
            <option value="ing-telematica">Ingeniería en Telemática</option>
            <option value="ing-electrica">Ingeniería Eléctrica</option>
            <option value="otra">Otra</option>
        </select>
    </p>

    <p>
        <label for="periodo">Período académico actual *</label><br>
        <input type="number" id="periodo" name="periodo"
               min="1" max="10" step="1" value="5" required>
    </p>

    <p>
        <label for="portafolio">Tu portafolio web (opcional)</label><br>
        <input type="url" id="portafolio" name="portafolio"
               placeholder="https://github.com/tu-usuario">
    </p>
</fieldset>
```

**Conceptos demostrados:**
- `type="number"` con `min`, `max`, `step` → control numérico con rango.
- `type="url"` → valida que sea una URL bien formada (debe iniciar con `http://` o `https://`).

---

#### 🔹 Paso 6 — Bloque 3: Preferencias (10 min)

```html
<fieldset>
    <legend>3. Preferencias del evento</legend>

    <p>
        <label for="hora">Hora de llegada estimada</label><br>
        <input type="time" id="hora" name="hora_llegada"
               min="07:00" max="18:00" value="08:00">
    </p>

    <p>
        <label for="color">Color preferido para tu credencial</label><br>
        <input type="color" id="color" name="color_credencial"
               value="#2C5F2D">
    </p>

    <p>
        <label for="experiencia">
            Tu nivel de experiencia (1 = principiante, 5 = experto)
        </label><br>
        <input type="range" id="experiencia" name="experiencia"
               min="1" max="5" step="1" value="3">
    </p>

    <fieldset>
        <legend>Talleres de interés</legend>
        <label><input type="checkbox" name="talleres" value="html"> HTML5 avanzado</label><br>
        <label><input type="checkbox" name="talleres" value="css"> CSS3 moderno</label><br>
        <label><input type="checkbox" name="talleres" value="js"> JavaScript ES2026</label><br>
        <label><input type="checkbox" name="talleres" value="node"> Node.js</label>
    </fieldset>

    <p>
        <label for="comentarios">Comentarios o accesibilidad</label><br>
        <textarea id="comentarios" name="comentarios"
                  rows="4" cols="50" maxlength="500"
                  placeholder="Si necesitas rampa, intérprete LSE, dieta especial…"></textarea>
    </p>
</fieldset>
```

---

#### 🔹 Paso 7 — Bloque 4: Consentimientos y envío (5 min)

```html
<fieldset>
    <legend>4. Consentimientos</legend>

    <p>
        <label>
            <input type="checkbox" name="terminos" required>
            Acepto los términos y condiciones del evento. *
        </label>
    </p>

    <p>
        <label>
            <input type="checkbox" name="datos" required>
            Autorizo el tratamiento de mis datos personales. *
        </label>
    </p>
</fieldset>

<p>
    <button type="submit">Enviar inscripción</button>
    <button type="reset">Limpiar</button>
</p>
```

Y finalmente, después de `</form>`, antes de `</main>`, cierra con un pie:

```html
</main>

<footer>
    <p>
        &copy; 2026 Universidad Técnica Estatal de Quevedo —
        Facultad de Ciencias de la Ingeniería
    </p>
</footer>
```

---

### 5. Verificación y validación

#### 🔍 Verificación funcional (5 min)

Recarga la página y prueba estos escenarios:

| Escenario | Resultado esperado |
|-----------|---------------------|
| Enviar formulario vacío | Mensaje "Completa este campo" en el primer requerido |
| Email mal formado (`hola@`) | Mensaje "Incluye un signo @" |
| Cédula con menos de 10 dígitos | Mensaje basado en tu `title` |
| Teléfono que no inicia con 0 | Mensaje basado en tu `title` |
| Período = 11 | Mensaje "El valor debe ser menor o igual a 10" |
| Click en email vacío en móvil | Aparece el teclado con `@` visible |

#### 🛡️ Validación con el W3C (5 min)

1. Abre <https://validator.w3.org/nu/>
2. Selecciona la pestaña **"File Upload"** y carga `inscripcion.html`.
3. Haz click en **Check**.

**Resultado objetivo:**

> 🟢 `Document checking completed. No errors or warnings to show.`

Si aparecen errores, léelos cuidadosamente — el validador siempre indica la línea y la columna del problema. Los errores más comunes son:

- ❌ `Element 'X' missing required attribute 'Y'` → falta un atributo obligatorio.
- ❌ `Stray end tag` → cerraste una etiqueta que no estaba abierta.
- ❌ `Duplicate ID 'x'` → repetiste un `id`.

---

### 6. Entrega

**¿Qué entregas?**

Un único archivo `inscripcion.html` con las siguientes características confirmadas:

- ✅ Estructura mínima HTML5 correcta.
- ✅ Al menos 6 tipos diferentes de `<input>` modernos.
- ✅ Uso de `<fieldset>`, `<legend>`, `<label>` correctamente.
- ✅ Validación W3C sin errores.
- ✅ Atributo `autocomplete` en al menos 4 campos.

**¿Dónde y cuándo?**

Sube el archivo a la plataforma del campus virtual (Moodle/EVA) antes de las **23:59 del domingo** de la Semana 02.

---

### 7. Rúbrica de calificación (GA02 — 2 %)

| Criterio | Puntos | Descripción |
|----------|--------|-------------|
| Estructura mínima HTML5 | 1.0 | DOCTYPE, lang, meta charset, viewport, title |
| Uso de `<fieldset>` y `<legend>` | 1.0 | Agrupación lógica de campos |
| Variedad de tipos de `<input>` | 2.0 | Al menos 6 tipos diferentes (email, tel, date, number, url, color, range, time) |
| Validación nativa (`required`, `pattern`, `min`, `max`) | 2.0 | Funciona al enviar vacío y con datos inválidos |
| Asociación `<label for>` ↔ `<input id>` | 1.5 | TODOS los inputs tienen label asociado |
| Atributo `autocomplete` | 0.5 | Al menos 4 campos con autocomplete adecuado |
| Validación W3C sin errores | 1.5 | Captura adjunta con resultado verde |
| Limpieza del código (indentado, sin código muerto) | 0.5 | Legible y bien estructurado |
| **TOTAL** | **10.0** | |

---

### 8. Errores frecuentes que perderán puntos

1. ❌ Olvidar `<!DOCTYPE html>` en la primera línea.
2. ❌ Usar `name` en lugar de `id` en `<label for="">`.
3. ❌ Repetir el mismo `id` en varios elementos.
4. ❌ Poner texto como `<center>` o `<font>` (etiquetas obsoletas).
5. ❌ Olvidar comillas en valores de atributos: `type=text` en lugar de `type="text"`.
6. ❌ Confundir `<button>` con `<input type="button">` (ambos sirven, pero `<button>` permite contenido HTML dentro).
7. ❌ No probar el formulario antes de entregar.

---

### 9. Reto adicional (opcional, +1 punto extra)

Si terminas antes de tiempo, intenta:

- Añadir un `<datalist>` para la universidad de procedencia.
- Añadir un grupo de `<input type="radio">` para preguntar el sexo.
- Conectar un `<output>` al campo `range` para mostrar el valor en vivo (con `oninput`).
- Subir tu HTML a GitHub y compartir el enlace al `raw` en tu entrega.

---

### 10. ¿Y ahora qué?

Este laboratorio es la **base estructural**. En la **Semana 03 (CSS3 moderno)** tomaremos este mismo formulario y le aplicaremos diseño profesional. Conserva el archivo: lo vamos a estilizar la próxima semana.

> **Frase para recordar:** *"Un buen HTML hace que el CSS y el JavaScript sean fáciles. Un mal HTML los convierte en pesadilla."*

---

*Documento elaborado por la cátedra de Aplicaciones Web — UTEQ 2026.*
*Licencia: Uso académico interno.*
