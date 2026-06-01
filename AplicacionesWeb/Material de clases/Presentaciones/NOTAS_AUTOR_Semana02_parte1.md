# NOTAS DEL AUTOR — SEMANA 02

## HTML y HTML5 para el desarrollo web

> **Documento maestro de contenido para el docente**
> Contiene la totalidad de la explicación a impartir slide por slide.
> Incluye frases sugeridas, analogías, anécdotas, ejemplos vivos y
> respuestas a las preguntas más frecuentes del estudiantado.

---

### Identificación del documento

| Campo | Valor |
|-------|-------|
| Asignatura | Aplicaciones Web |
| Carrera | Ingeniería de Software, 5° período |
| Capítulo del libro | 2 — HTML y HTML5 para el desarrollo web |
| Sesión semanal | 02 |
| Duración total | 240 minutos presenciales + 240 minutos autónomos |
| Universidad | Técnica Estatal de Quevedo (UTEQ) |
| Período académico | Mayo – Septiembre 2026 |

---

## 📚 Tabla de contenidos del documento

1. [Apertura de la clase: tono y disposición](#apertura)
2. [Slide 1 — Portada y epígrafe de Hickson](#slide-1)
3. [Slide 2 — Hoja de ruta de la sesión](#slide-2)
4. [Slide 3 — Resultado de aprendizaje y SWEBOK](#slide-3)
5. [Slide 4 — Línea de tiempo: 35 años de HTML](#slide-4)
6. [Slide 5 — Por qué fracasó XHTML 2.0](#slide-5)
7. [Slide 6 — Estructura mínima HTML5: las 5 líneas](#slide-6)
8. [Slide 7 — Anatomía de un elemento HTML](#slide-7)
9. [Slide 8 — Elementos semánticos estructurales](#slide-8)
10. [Slide 9 — `<article>` vs `<section>`: la prueba RSS](#slide-9)
11. [Slide 10 — Ejemplo blog completo en vivo](#slide-10)
12. [Slide 11 — Portada bloque formularios](#slide-11)
13. [Slide 12 — Los 13 tipos de input HTML5](#slide-12)
14. [Slide 13 — Atributos de validación nativa](#slide-13)
15. [Slide 14 — Demo formulario UTEQ](#slide-14)
16. [Slide 15 — Portada bloque multimedia](#slide-15)
17. [Slide 16 — Las 5 APIs nativas](#slide-16)
18. [Slide 17 — `<video>` accesible](#slide-17)
19. [Slide 18 — Almacenamiento en el cliente](#slide-18)
20. [Slide 19 — XML y su lugar en 2026](#slide-19)
21. [Slide 20 — XML vs JSON vs YAML](#slide-20)
22. [Slide 21 — 15 buenas prácticas](#slide-21)
23. [Slide 22 — Actividad práctica](#slide-22)
24. [Slide 23 — Tarea autónoma: portafolio](#slide-23)
25. [Slide 24 — Herramientas de validación](#slide-24)
26. [Slide 25 — Errores frecuentes](#slide-25)
27. [Slide 26 — Mini-quiz de cierre](#slide-26)
28. [Slide 27 — Bibliografía](#slide-27)
29. [Slide 28 — Cierre y puente a la semana 3](#slide-28)
30. [Apéndice A — Banco de preguntas frecuentes del estudiantado](#apendice-a)
31. [Apéndice B — Frases de transición entre bloques](#apendice-b)

---

<a id="apertura"></a>
## 🎬 Apertura de la clase: tono y disposición

**Antes de proyectar el primer slide (2-3 minutos):**

Llega al aula 5 minutos antes. Abre el proyector, verifica que la pizarra esté limpia y que VS Code esté listo en la barra de tareas con los archivos del Capítulo 2 cargados. Ten abierta una pestaña de Chrome con `validator.w3.org/nu/` y otra con tu repositorio del curso.

**Saludo inicial sugerido:**

> *"Buenos días. La semana pasada hablamos de qué es la web, cómo conversan navegador y servidor, y vimos un panorama de hacia dónde va el desarrollo en 2026. Hoy bajamos a tierra. Hoy escribimos código. Y vamos a empezar con el ladrillo más fundamental de todo lo que vamos a construir en este semestre y en su vida profesional: HTML."*

**Provocación inicial (opción A — pregunta directa):**

> *"Levanten la mano quienes consideran que HTML es 'fácil'. (Pausa). Bueno, hoy vamos a desafiar esa idea. Voy a defender que HTML es uno de los lenguajes más subestimados del desarrollo y que escribirlo bien separa al estudiante del profesional."*

**Provocación inicial (opción B — anécdota):**

> *"En 2024 Google publicó un estudio interno: el 80 % de los sitios web del mundo tienen al menos un error de HTML que afecta la accesibilidad. El 60 % no son navegables con teclado. El 45 % no pasan el validador W3C. Y la mayoría están programados por gente que cree que 'HTML lo aprende uno solo'. Hoy ustedes empiezan a ser parte del 20 % que lo hace bien."*

**Ejercicio de activación (opcional, 1 minuto):**

Pídeles que abran su teléfono, vayan a la página de la UTEQ (`uteq.edu.ec`) y pulsen `Ver código fuente` (en móvil es complicado, mejor hazlo tú en pantalla). Muéstrales el HTML real de una página institucional. Que vean que no es magia, son etiquetas.

---

<a id="slide-1"></a>
## 🟢 Slide 1 — Portada y epígrafe de Hickson

### Lo que muestra el slide

- Título: **HTML y HTML5 para el desarrollo web**
- Subtítulo: Semana 02 — Aplicaciones Web — UTEQ 2026
- Quote: *"HTML no es código fuente: es un contrato semántico entre tu intención y todos los agentes que leerán tu página: navegadores, lectores de pantalla, motores de búsqueda, scrapers, IAs."* — **Ian Hickson**, editor del HTML Living Standard.

### Lo que tienes que decir (3-4 minutos)

> *"Antes de escribir una sola línea de código quiero que asimilen una idea. Lean conmigo la frase de Ian Hickson en pantalla."*

(Lee la frase en voz alta, sin prisa.)

> *"Hickson no es cualquier persona. Es el editor del HTML Living Standard, la especificación oficial que rige cada navegador del mundo. Lleva 22 años trabajando en HTML. Y elige una palabra muy específica: **contrato**. No 'lenguaje', no 'marcado', no 'código'. **Contrato.**"*

> *"¿Por qué? Porque cuando ustedes escriben un `<button>`, no están dibujando un botón. Están firmando un contrato con el navegador (que sabrá renderizarlo), con el lector de pantalla (que dirá 'botón'), con Google (que sabrá que es interactivo) y con el usuario que usa teclado (que podrá llegar a él con Tab). Si en lugar de `<button>` escriben `<div onclick=...>` rompen ese contrato. El botón se ve igual. Pero el ciego no lo encuentra. El teclado no llega. Google no entiende. El contrato se rompió."*

> *"Esa es la diferencia entre un estudiante que aprende HTML y un ingeniero que entiende HTML."*

**Transición al siguiente slide:**
> *"Para entender por qué llegamos a este 'contrato semántico', tenemos que mirar atrás. ¿De dónde viene HTML?"*

---

<a id="slide-2"></a>
## 🟢 Slide 2 — Hoja de ruta de la sesión

### Lo que muestra el slide

Seis bloques temáticos en grid 2×3:
1. Historia y evolución
2. Fundamentos (estructura)
3. Semántica HTML5
4. Formularios y validación
5. Multimedia y APIs
6. XML y buenas prácticas

### Lo que tienes que decir (2 minutos)

> *"Antes de empezar les muestro el mapa de lo que vamos a recorrer. Cuatro horas de clase parecen mucho, pero vamos a ir rápido. Estos seis bloques son el contenido. Si quieren saber qué les voy a preguntar en el examen, son estos seis bloques."*

(Recorre brevemente cada bloque señalando con el puntero.)

> *"El bloque 1 es historia, dura 15 minutos. Quien no entiende de dónde viene HTML no entiende por qué hoy es como es. Después vamos a fundamentos (45 minutos), semántica (45 minutos), formularios (40 minutos), multimedia (35 minutos) y cerramos con XML y buenas prácticas (40 minutos). En medio haremos un descanso de 15 minutos. ¿Listos? Vamos."*

---

<a id="slide-3"></a>
## 🟢 Slide 3 — Resultado de aprendizaje y SWEBOK

### Lo que muestra el slide

**Resultado de aprendizaje:** "Al concluir la semana 2, el estudiante construye documentos HTML5 estructuralmente correctos, semánticamente significativos y validables ante el W3C, integrando formularios con validación nativa, contenido multimedia accesible, APIs nativas del lenguaje y entendiendo el lugar de XML en el ecosistema de marcado."

**RAU 1:** Construir interfaces web semánticas, accesibles y responsivas con HTML5, CSS3 y JavaScript siguiendo W3C y WCAG 2.1.

**SWEBOK v4.0:** KA02 (Diseño), KA03 (Construcción), KA10 (Calidad), KA15 (Seguridad).

### Lo que tienes que decir (2-3 minutos)

> *"Esto es lo que ustedes tienen que saber hacer al final de la semana. No al final del semestre. Al final de esta semana. Léanlo en silencio."*

(Pausa de 20 segundos para que lean.)

> *"Las palabras clave son: **estructuralmente correctos**, **semánticamente significativos**, **validables ante el W3C**, **accesibles**. Si su HTML cumple esas cuatro, vamos bien. Si falla en una, vamos mal."*

> *"Por qué el SWEBOK importa: el SWEBOK es el cuerpo de conocimientos oficial de la ingeniería de software, lo publican la IEEE Computer Society. Lo que ustedes aprenden aquí no es ocurrencia mía: está alineado con un estándar internacional. KA02 es diseño, KA03 es construcción, KA10 es calidad, KA15 es seguridad. Y todo eso vamos a tocarlo hoy."*

**Conexión con el RAU:**
> *"Este resultado de aprendizaje es la primera pieza del Resultado de Aprendizaje de la Unidad 1, que es construir interfaces web. La semana 1 vimos el panorama, hoy ponemos el esqueleto, la semana 3 le ponemos piel con CSS, y la semana 4 le damos vida con JavaScript."*

---

<a id="slide-4"></a>
## 🟢 Slide 4 — Línea de tiempo: 35 años de HTML

### Lo que muestra el slide

Timeline horizontal con 8 hitos: 1991 (Tim Berners-Lee), 1995 (HTML 2.0), 1999 (HTML 4.01), 2000 (XHTML 1.0), 2008 (HTML5 draft WHATWG), 2014 (HTML5 W3C Recommendation), 2019 (HTML Living Standard), 2026 (Hoy).

### Lo que tienes que decir (10-12 minutos)

> *"35 años. HTML ha estado entre nosotros más tiempo que la mayoría de ustedes. Vamos a recorrerlo brevemente porque cada hito explica algo que veremos en pantalla hoy."*

#### Hito 1991: el origen en CERN

> *"En marzo de 1989, un físico británico llamado Tim Berners-Lee, que trabajaba en el CERN en Suiza, escribió una propuesta titulada 'Information Management: A Proposal'. Su jefe escribió en el margen: 'Vague, but exciting'. Esa nota dio origen a la World Wide Web."*

> *"Berners-Lee tenía un problema concreto: los científicos del CERN escribían documentos, pero no podían enlazarlos entre sí. Inventó tres cosas a la vez: una forma de identificar documentos (URL), un protocolo para transferirlos (HTTP) y un lenguaje para escribirlos con enlaces (HTML). En 1991 publicó la primera versión: tenía 18 etiquetas. Hoy HTML tiene más de 100."*

> *"Curiosidad: el servidor del primer sitio web fue una computadora NeXT con una etiqueta pegada que decía 'Esta máquina es un servidor. NO LA APAGUE'."*

#### Hito 1995-1999: la guerra de los navegadores

> *"En los noventas pasó algo terrible: Netscape y Microsoft empezaron a inventar etiquetas propias para 'mejorar' HTML. Microsoft tenía `<marquee>` para hacer texto deslizante. Netscape tenía `<blink>` para hacerlo parpadear. Y los desarrolladores tenían que escribir dos versiones de cada página: una para cada navegador. Era un caos."*

> *"En 1999 sale HTML 4.01 y por primera vez tenemos un estándar que ambos navegadores deciden respetar. Esta versión gobierna la web durante 15 años."*

#### Hito 2000: XHTML, el camino fallido

> *"Aquí el W3C tomó una decisión muy ingenieril y muy equivocada. Dijeron: 'HTML es desordenado, dejemos que los navegadores no acepten ningún error'. Inventaron XHTML 1.0 que era HTML reformulado como XML estricto. Si te olvidabas de cerrar una etiqueta, la página entera dejaba de funcionar."*

> *"Suena bien, ¿no? Disciplina y orden. ¿Saben qué pasó? Los desarrolladores lo odiaron y los usuarios no entendían por qué la página se rompía por un error tan tonto. XHTML 2.0 entró en desarrollo y nunca llegó. Lo veremos en el siguiente slide."*

#### Hito 2008: la rebelión WHATWG

> *"En 2004, un grupo de ingenieros de Apple, Mozilla y Opera estaban hartos de XHTML. Se reunieron y crearon el **WHATWG** — Web Hypertext Application Technology Working Group. Es decir, formaron su propia organización paralela al W3C y empezaron a especificar lo que sería HTML5. Su filosofía: 'el navegador debe ser tolerante a errores, pero el desarrollador debe escribir bien'."*

> *"En 2008 publican el primer borrador de HTML5 y revoluciona todo. Trae elementos semánticos (`<article>`, `<nav>`, `<header>`), trae `<video>` y `<audio>` (¡por fin sin Flash!), trae APIs nativas (canvas, geolocalización, almacenamiento), trae formularios inteligentes con validación."*

#### Hito 2014: HTML5 oficial

> *"El W3C tarda 6 años en alcanzar al WHATWG. En octubre de 2014 publican HTML5 como 'Recomendación' oficial. Pero en realidad la web llevaba años usándolo."*

#### Hito 2019: HTML Living Standard

> *"Aquí pasa algo histórico. El W3C y el WHATWG firman un acuerdo: el W3C reconoce al WHATWG como el único editor de la especificación HTML. Y se elimina el concepto de versiones. A partir de ese día, HTML ya no se llama 'HTML5' ni 'HTML6'. Se llama **HTML Living Standard**: un estándar vivo que evoluciona constantemente. Lo que ven hoy en `html.spec.whatwg.org` puede cambiar mañana."*

#### Hito 2026: hoy

> *"Hoy HTML tiene más de 100 elementos. Tiene Web Components nativos (con `<template>`, Shadow DOM, Custom Elements). Tiene APIs que en 1991 eran ciencia ficción: WebGPU para gráficos 3D, WebUSB para conectar dispositivos, WebRTC para videollamadas, Service Workers para apps offline, y ya hay propuestas de AI APIs nativas. Y todo eso sin instalar un plugin."*

> *"Lección de la historia: HTML es viejo, pero está vivísimo. Y lección personal: lo que aprendan hoy va a evolucionar. Quien no se mantiene al día con caniuse.com o MDN, queda atrás."*

**Pregunta abierta para la clase:**
> *"¿Por qué creen que HTML sobrevivió a tantas tecnologías que prometieron reemplazarlo? (Flash, Silverlight, Java applets, ActiveX). Una hipótesis: porque es texto plano que cualquier humano puede leer y cualquier máquina puede parsear. La simplicidad gana."*

**Transición:**
> *"Antes de pasar a escribir código, terminemos de cerrar la historia. ¿Por qué exactamente fracasó XHTML 2.0? La respuesta tiene una lección importante."*

---

<a id="slide-5"></a>
## 🟢 Slide 5 — Por qué fracasó XHTML 2.0

### Lo que muestra el slide

Dos columnas comparativas:

**Filosofía XHTML (rígida):**
- Toda etiqueta debe cerrarse: `<br />`, `<img />`
- Atributos siempre con comillas
- Todo en minúsculas obligatorio
- Error en cualquier sitio → página rota
- Pretendía remplazar HTML 4.01 completamente
- XHTML 2.0 ni siquiera era retrocompatible

**Filosofía HTML5 (pragmática):**
- Aprende del HTML real que la gente escribe
- El navegador es tolerante a errores
- Múltiples estilos permitidos: `<br>`, `<br/>`, `<BR>`
- Páginas viejas siguen funcionando
- Foco en APIs y experiencia de usuario
- HTML Living Standard: evoluciona sin romper

### Lo que tienes que decir (5 minutos)

> *"Quiero detenerme aquí porque esta historia tiene una lección que va más allá de HTML. Aplica a cualquier producto de software que ustedes diseñen en su carrera."*

> *"XHTML 2.0 era técnicamente superior. Era más limpio, más estricto, más fácil de procesar para las máquinas. Pero fracasó. ¿Por qué? Por dos razones."*

> *"**Primera razón: no era retrocompatible.** Si una empresa tenía 10 000 páginas en HTML 4.01, para migrar a XHTML 2.0 tenía que reescribirlas todas. Adivinen qué hicieron. Nada. Se quedaron con HTML 4.01."*

> *"**Segunda razón: castigaba al desarrollador novato.** En XHTML estricto, olvidarte de un `</p>` rompe la página entera. El navegador no muestra nada. Solo un mensaje de error técnico. Imagínense que el usuario que entra a su página vea eso. HTML5 dijo: 'somos pragmáticos. El navegador adivinará lo que quisiste decir y mostrará algo. Tu deber como desarrollador es escribir bien, pero el usuario nunca paga por tus errores'."*

> *"Esta es una filosofía que se llama **Robustness Principle** o ley de Postel, del ingeniero Jon Postel que diseñó TCP/IP. Dice: 'Sé conservador en lo que envías, liberal en lo que recibes'. HTML5 lo aplica al pie de la letra."*

> *"Y la lección para ustedes como futuros ingenieros: el mejor diseño no siempre gana. El diseño que abraza la realidad gana."*

> *"¿Significa esto que podemos escribir HTML descuidado? **No.** Significa que aunque el navegador nos perdone, debemos aspirar a la disciplina de XHTML sin la rigidez. Eso es lo que vamos a hacer ahora: escribir HTML5 con la disciplina que los profesionales escriben."*

---

<a id="slide-6"></a>
## 🟢 Slide 6 — Estructura mínima HTML5: las 5 líneas

### Lo que muestra el slide

Código de la estructura mínima con sus 5 elementos críticos:

```html
<!DOCTYPE html>
<html lang="es-EC">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi primera página HTML5</title>
</head>
<body>
    <h1>¡Hola, UTEQ!</h1>
</body>
</html>
```

Más cinco puntos numerados explicando cada línea crítica.

### Lo que tienes que decir (12-15 minutos)

> *"Llegó el momento. Esta es la estructura mínima de un documento HTML5 válido. Son apenas diez líneas, pero cada una tiene una razón de existir. Si memorizan una sola cosa de esta clase, que sean estas diez líneas."*

(Proyecta el código y abre VS Code en paralelo. Escribe en vivo.)

#### Línea 1: `<!DOCTYPE html>`

> *"Pregunta capciosa: ¿esto es HTML?"*

(Espera respuesta. Algunos dirán sí, otros no.)

> *"Truco: no es ni una etiqueta HTML ni un comentario. Es una **declaración** que le dice al navegador 'trata este documento como HTML5'. Es lo único que sobrevive de SGML, el lenguaje del cual HTML descendió."*

> *"¿Qué pasa si lo omiten? El navegador entra en algo que se llama **quirks mode**, modo de rarezas. Es un modo de emergencia donde el navegador intenta renderizar como lo hacía Internet Explorer 5 en 1999. Sus márgenes, paddings y anchos se calculan de manera diferente. Su CSS se rompe sin razón aparente."*

> *"En HTML 4 esto era un horror gigantesco: `<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">`. ¿Quién se acordaba de eso? En HTML5 lo simplificaron a `<!DOCTYPE html>` y punto. Una de las mejores decisiones de la especificación."*

#### Línea 2: `<html lang="es-EC">`

> *"La etiqueta raíz. Todo el documento vive dentro de esta etiqueta. Y aquí viene un atributo que el 80 % de los desarrolladores omite y es un grave error: `lang`."*

> *"¿Por qué importa `lang`?"*

> *"**Primera razón: accesibilidad.** Cuando una persona ciega usa un lector de pantalla, el lector necesita saber en qué idioma leer. Si dice 'es', pronuncia en español. Si dice 'en', pronuncia en inglés. Si no lo dicen, el lector usa un idioma por defecto y suena ridículo."*

> *"**Segunda razón: SEO.** Google muestra resultados según el idioma de la búsqueda. Si tu página no declara su idioma, Google tiene que adivinarlo, y a veces se equivoca."*

> *"**Tercera razón: navegador.** El corrector ortográfico, la opción de traducir automáticamente, el formato de fecha que aparece en `<input type=\"date\">`... todo depende de `lang`."*

> *"Usen `es-EC` para indicar español de Ecuador. Si usan `es` solo, está bien también. Pero `lang=\"es-EC\"` es lo profesional."*

#### Línea 3: `<meta charset="UTF-8">`

> *"Aquí tenemos el invento que evitó una guerra de civilizaciones digitales. Codificación de caracteres."*

> *"Pregunta: si yo escribo 'Quevedo' en mi archivo HTML, ¿qué hay realmente guardado en el disco?"*

(Espera. Probablemente nadie responda bien.)

> *"Bytes. Números. La letra 'Q' es el byte 81 en código ASCII. La letra 'u' es 117. Pero la 'é'... ¿cuántos bytes? Eso depende de la codificación."*

> *"Hace 20 años existían 50 codificaciones diferentes. Latin-1, Windows-1252, ISO-8859-1, etc. Cada una representaba la 'é' con un byte distinto. Si tu archivo estaba en Latin-1 pero el navegador lo leía como UTF-8, veías 'QuÃ©vedo' en lugar de 'Quevedo'. Eso se llama **mojibake**."*

> *"En 2008 el mundo dijo: 'basta'. Adoptamos **UTF-8** universalmente. UTF-8 puede representar cualquier carácter de cualquier idioma del mundo: español, chino, árabe, hebreo, emojis. Es el estándar."*

> *"Una regla crítica: `<meta charset>` debe estar en los **primeros 1024 bytes** del documento. Si lo ponen al final del `<head>`, no funciona. Por eso lo ponemos como **primera línea** del `<head>`."*

**Anécdota:**
> *"Hace dos años un estudiante de quinto vino a mostrarme su proyecto. Página perfecta, pero los acentos aparecían como 'caracteres marcianos'. Buscó dos horas el error. La razón: tenía `<meta charset>` después de `<title>` y su título tenía la palabra 'Universidad'. El navegador empezó a procesar el título antes de saber la codificación. Boom: mojibake."*

#### Línea 4: `<meta name="viewport" ...>`

> *"Esta línea convierte tu página en responsive en móviles. Sin esta línea, los móviles renderizan tu página como si tuvieran 980 píxeles virtuales de ancho y luego hacen zoom-out para que quepa en la pantalla. Resultado: texto ilegible, el usuario tiene que hacer pinch-zoom."*

> *"`width=device-width` le dice: 'usa el ancho real del dispositivo'. `initial-scale=1.0` le dice: 'no hagas zoom inicial'. Cópienla tal cual. No la modifiquen."*

> *"En la semana 3, cuando veamos CSS responsive con media queries y container queries, esta línea es el prerrequisito. Sin ella, sus media queries no funcionan en móviles."*

#### Línea 5: `<title>`

> *"El título tiene cuatro vidas. Aparece en:"*

> *"1. La pestaña del navegador."*
> *"2. Los favoritos cuando alguien guarda tu página."*
> *"3. Los resultados de Google (es lo PRIMERO que ve el usuario en una búsqueda)."*
> *"4. Es lo que LEE un lector de pantalla al abrir tu página."*

> *"Por eso debe ser descriptivo. Nunca 'Documento sin título'. Nunca 'index.html'. Algo como: 'Inscripción Jornada Aplicaciones Web 2026 | UTEQ'. La pipa al final con el nombre del sitio es buena práctica de SEO."*

#### Práctica en vivo (5 minutos)

> *"Vamos a escribir esto en vivo. Abran VS Code, archivo nuevo, guarden como `index.html`. Yo lo hago en pantalla y ustedes lo siguen en su laptop."*

(Escribe en pantalla, lentamente, comentando cada línea. Pídeles que abran el archivo en su navegador con Live Server al terminar.)

> *"Felicidades, acaban de escribir un documento HTML5 válido. Ahora, ¿qué pasa si lo pasan por el validador W3C? Vámonos a `validator.w3.org/nu/`, suban el archivo... (lo haces tú) ... y miren: cero errores. ¿Por qué? Porque cumple las cinco reglas. Si quitamos `<meta charset>`, validator se queja. Si quitamos `lang`, se queja. Vamos a cumplir las cinco. Siempre."*

---

<a id="slide-7"></a>
## 🟢 Slide 7 — Anatomía de un elemento HTML

### Lo que muestra el slide

Diagrama del código `<a href="https://uteq.edu.ec">UTEQ</a>` con flechas etiquetando cada parte:
- Etiqueta de apertura: `<a>`
- Atributo: `href`
- Valor: `"https://uteq.edu.ec"`
- Contenido: `UTEQ`
- Etiqueta de cierre: `</a>`

### Lo que tienes que decir (5-7 minutos)

> *"Antes de seguir, fijemos el vocabulario. Cuando hablemos en clase, necesito que todos llamen a las cosas por su nombre técnico. Si yo digo 'atributo', todos sabemos qué es. Si digo 'etiqueta', también."*

(Muestra el diagrama.)

> *"Un **elemento HTML** tiene cinco partes:"*

> *"**Uno: la etiqueta de apertura.** `<a>` con la `a` en minúsculas, entre corchetes angulares. No usen mayúsculas: `<A>` es válido pero no profesional."*

> *"**Dos: los atributos.** En este caso `href`. Los atributos siempre van DENTRO de la etiqueta de apertura, separados por espacios. Una etiqueta puede tener cero, uno o muchos atributos."*

> *"**Tres: el valor del atributo.** Después del signo igual, entre comillas. **Siempre entre comillas.** HTML5 permite no usar comillas en valores sin espacios, pero ustedes las usan siempre. Es una buena práctica que vale 10 segundos y previene errores."*

> *"**Cuatro: el contenido.** Es lo que el usuario ve. Puede ser texto plano o más elementos HTML anidados."*

> *"**Cinco: la etiqueta de cierre.** `</a>` con barra al inicio. Importante: el orden de cierre debe respetar el anidamiento. Si abres A, B, C, cierras C, B, A. Como las matrioskas rusas."*

#### Elementos vacíos

> *"Hay una excepción importante. Algunos elementos NO tienen contenido ni etiqueta de cierre. Se llaman **elementos vacíos** o **void elements**. Los más usados son:"*

> *"`<img>` para imágenes. `<br>` para salto de línea. `<input>` para campos de formulario. `<meta>` para metadatos. `<link>` para enlazar CSS. `<hr>` para línea horizontal."*

> *"Si alguien les enseña a escribir `<br />` con la barra al final, está aplicando reglas de XHTML, no de HTML5. En HTML5, escriban simplemente `<br>`. Pero los dos son válidos."*

#### Anidamiento correcto

> *"Una última cosa: el anidamiento. Esto está bien:"*

```html
<p>Visita <a href="https://uteq.edu.ec">la <strong>UTEQ</strong></a> para más información.</p>
```

> *"Y esto está mal:"*

```html
<p>Visita <a href="...">la <strong>UTEQ</a> para más información.</strong></p>
```

> *"En el segundo caso, cierro `</a>` antes de cerrar `</strong>`. El navegador 'lo va a arreglar' por mí, pero el HTML no es válido. Y cuando llegue al CSS, van a pasar cosas raras."*

> *"Regla simple: lo último que abro es lo primero que cierro."*

**Pregunta al aire:**
> *"¿Alguien sabe qué nombre técnico tiene cada uno de los corchetes `<` y `>`? Se llaman **corchetes angulares** o **angle brackets**. No son 'corchetes' a secas (esos son `[ ]`) ni 'paréntesis' (esos son `( )`). Hablen bien."*

---

<a id="slide-8"></a>
## 🟢 Slide 8 — Elementos semánticos estructurales

### Lo que muestra el slide

Mockup visual del layout de una página HTML5 con los bloques etiquetados: `<header>`, `<nav>`, `<main>` (con `<article>` y `<aside>` dentro), `<footer>`.

Tabla con 7 elementos: header, nav, main, article, section, aside, footer.

### Lo que tienes que decir (10-12 minutos)

> *"Llegamos al núcleo de HTML5: la semántica. Y aquí está el corazón de lo que hace HTML5 diferente de HTML 4. Si ustedes terminan esta clase entendiendo bien la semántica, ya superaron al 70 % de los desarrolladores autodidactas que hay en el mercado."*

#### El problema que resuelve la semántica

> *"En HTML 4, todo el mundo construía páginas así:"*

```html
<div class="header">...</div>
<div class="menu">...</div>
<div class="contenido">
    <div class="articulo">...</div>
    <div class="sidebar">...</div>
</div>
<div class="pie">...</div>
```

> *"Para el navegador, todos esos `<div>` son lo mismo: cajas genéricas sin significado. Solo el desarrollador, mirando la clase, sabe qué es cada cosa."*

> *"¿Qué problema causaba? Tres cosas:"*

> *"**Uno: accesibilidad.** El lector de pantalla no sabe distinguir el header del contenido principal. Lee todo en orden, sin posibilidad de saltar al contenido. Una persona ciega tarda 5 minutos en escuchar los menús antes de llegar al artículo."*

> *"**Dos: SEO.** Google tenía que adivinar qué parte de la página era el contenido principal."*

> *"**Tres: scraping.** Cualquier programa que quisiera extraer datos automáticamente tenía que inferir la estructura de cada sitio."*

> *"HTML5 dijo: 'inventemos etiquetas que digan QUÉ es cada cosa, no SOLO cómo se ve'."*

#### Los siete elementos esenciales

(Muestra el diagrama del layout y recorre cada bloque.)

> *"**`<header>`** — Es la cabecera. Aparece arriba. Contiene el título del sitio, el logo, posiblemente el menú principal. Importante: puede haber MÁS de un header en una página. Uno para el sitio, y uno dentro de cada artículo."*

> *"**`<nav>`** — La navegación principal. Suele ir DENTRO del `<header>` general, pero puede ir fuera. Aquí va el menú: Inicio, Productos, Contacto."*

> *"**`<main>`** — El contenido único de ESTA página. Si tu página es 'detalle-producto', el `<main>` contiene la información del producto. Regla crítica: **solo puede haber UN `<main>` por documento**. El validador te grita si pones dos."*

> *"**`<article>`** — Un contenido autocontenido. Una entrada de blog, una noticia, un comentario, un tweet. Lo veremos en detalle en el siguiente slide."*

> *"**`<section>`** — Una subdivisión temática. Una sección de un artículo. Un capítulo dentro de un manual. Si ustedes piensan en un libro: `<article>` es el libro completo, `<section>` son los capítulos."*

> *"**`<aside>`** — Contenido tangencialmente relacionado. La barra lateral con anuncios. La caja de 'también te puede interesar'. La biografía del autor al final del artículo. Si lo eliminas, el contenido principal sigue siendo válido."*

> *"**`<footer>`** — El pie. Copyright, enlaces legales, redes sociales. Como con `<header>`, puede haber varios footers: uno del sitio, uno por artículo."*

#### Demostración visual

(Abre el archivo `02_blog_semantico.html` que les vas a compartir. Muéstralo en el navegador y en el código fuente.)

> *"Miren este blog. A simple vista parece HTML normal. Pero abramos las herramientas de desarrollo del navegador, vamos a la pestaña Accessibility / Acceso. ¿Ven el árbol? El navegador entiende que tiene un encabezado de página, una navegación principal, un contenido principal, un artículo dentro... Esto es lo que ve un lector de pantalla."*

> *"Ahora hagamos un experimento: vamos a Lighthouse, ejecutemos un audit de accesibilidad..."*

(Ejecuta Lighthouse en el blog semántico.)

> *"99 sobre 100 en accesibilidad. Y no hicimos nada especial. Solo usamos las etiquetas correctas."*

#### Beneficio adicional: skip links automáticos

> *"En 2026 los navegadores ya tienen una funcionalidad: si tu página tiene `<main>`, el usuario puede saltar directamente a él con un atajo de teclado, sin escuchar el menú. Ese beneficio aparece **gratis** cuando usas la etiqueta correcta."*

---

<a id="slide-9"></a>
## 🟢 Slide 9 — `<article>` vs `<section>`: la prueba RSS

### Lo que muestra el slide

Dos columnas:

**`<article>`:**
- Contenido autocontenido
- Distribuible en RSS
- Tiene sentido por sí solo
- Ejemplos: post de blog, noticia, comentario, widget

**`<section>`:**
- Subdivisión temática
- NO tiene sentido fuera de contexto
- Va casi siempre dentro de algo más
- Ejemplos: introducción de un artículo, capítulo de un manual

**La prueba RSS:** *¿Tendría sentido publicado solo en un feed RSS? Sí → article. No → section.*

### Lo que tienes que decir (5-7 minutos)

> *"Esta es la pregunta que más confusión causa entre los estudiantes de HTML5. La voy a responder de manera quirúrgica."*

> *"Tanto `<article>` como `<section>` son elementos semánticos. La diferencia es que `<article>` representa contenido **autocontenido**, mientras que `<section>` representa **una subdivisión temática**."*

> *"La pregunta que se hacen es: ¿cuándo uso cuál? La respuesta es la **prueba RSS**."*

> *"Imaginen que ustedes son los editores del feed RSS del sitio. Cada cosa que pongan en el feed debe tener sentido en sí misma, sin contexto. Por eso, lo que va en RSS son `<article>`."*

> *"¿Tendría sentido publicar la 'introducción' de un artículo en RSS, sin el artículo? No, ¿verdad? Por eso la introducción es `<section>`."*

> *"¿Tendría sentido publicar 'el comentario de María Pérez' en un feed RSS? Sí, podría. Por eso un comentario es `<article>`. Sí, ¡un comentario en un blog es un `<article>` anidado dentro del `<article>` del post original!"*

#### Ejemplos concretos

> *"Vamos a categorizar cosas reales que ven todos los días:"*

| Cosa | ¿Article o section? | Razón |
|------|---------------------|-------|
| Un tweet | article | Tiene sentido solo |
| Un capítulo de un libro online | article | (sí, podrías publicarlo aparte) |
| Una receta de cocina | article | Tiene sentido sola |
| La parte 'ingredientes' de una receta | section | No tiene sentido sin la receta |
| Un comentario en un blog | article | Tiene sentido solo |
| Un producto en un e-commerce | article | Tiene sentido solo |
| Las 'características' de un producto | section | Subdivisión del producto |
| Toda la sección 'Sobre nosotros' de un sitio | section | No es publicable como tal |

#### Anidamiento permitido

> *"¿Puede un `<article>` contener un `<section>`? Sí. ¿Puede un `<section>` contener un `<article>`? Sí. ¿Puede un `<article>` contener otro `<article>`? Sí, como en el caso de los comentarios."*

> *"La regla pragmática: usa `<article>` siempre que puedas. Solo usa `<section>` cuando lo que tienes es claramente parte de algo más."*

> *"Y si en duda: `<article>`. Si te equivocas con `<article>`, perdiste poco. Si te equivocas con `<section>`, fragmentaste mal tu página."*

#### Anti-patrón común

> *"Lo que NUNCA hagan: usar `<section>` como reemplazo de `<div>` solo porque suena 'más moderno'. `<section>` tiene significado semántico. Si lo usan para envolver un grupo de cosas que no son una subdivisión temática (por ejemplo, para agrupar elementos por motivos de CSS), están mintiendo al navegador. Para agrupación visual usen `<div>`. Para agrupación temática, `<section>`."*

---

<a id="slide-10"></a>
## 🟢 Slide 10 — Ejemplo blog completo en vivo

### Lo que muestra el slide

Código del blog completo con header → nav → main → article (con header, sections, footer) → aside → footer.

### Lo que tienes que decir (8-10 minutos)

> *"Vamos a ver todo lo anterior junto. Abro VS Code con el archivo `02_blog_semantico.html` y lo proyecto."*

(Abre el archivo. Pasa al navegador y muestra el resultado.)

> *"Esta es una página de blog real. Lean el código conmigo."*

(Recorre la estructura señalando con el puntero.)

> *"Arriba tengo `<header>`. Dentro de él, el título del sitio 'TechBlog UTEQ' y el `<nav>` principal con cuatro enlaces."*

> *"Luego abro `<main>`. Y aquí está el corazón: un `<article>` que es la entrada del blog. Aplicación de la prueba RSS: si publicara este artículo solo en RSS, ¿tendría sentido? Sí. Por eso es article."*

> *"Dentro del article, otra vez `<header>`. Pero este es el header DEL ARTÍCULO, no del sitio. Aquí va el título del post (`<h2>`), la firma del autor, la fecha de publicación con `<time datetime>` para que sea procesable por máquinas."*

> *"Después tengo tres `<section>` dentro del article. Cada section es un subtema del post. Si quitara estas secciones, el artículo seguiría siendo válido, pero perdería estructura interna. Una subdivisión temática del article: section."*

> *"Al final del article, el `<footer>` del artículo: etiquetas, enlaces a tags relacionados, link al RSS. Notas que es un footer DENTRO del article, no el del sitio."*

> *"Después del article, fuera de él pero dentro del main, tengo el `<aside>` con artículos relacionados. Si elimino el aside, el artículo principal sigue funcionando."*

> *"Cerramos `</main>` y abrimos `<footer>` del sitio: copyright, enlaces legales, declaración de accesibilidad WCAG."*

> *"Cuenten conmigo cuántos `<header>` hay en este documento. Uno del sitio, uno del article. Dos headers. ¿Cuántos `<footer>`? Uno del article, uno del sitio. Dos. ¿Cuántos `<main>`? Uno. Siempre uno."*

**Demostración con DevTools:**
> *"Vamos a F12, pestaña Elements, expandimos. ¿Ven cómo Chrome muestra los elementos semánticos con un fondo de color diferente? Esa es la pista visual de que estamos usando HTML semántico, no `<div>` genéricos."*

**Ejercicio mental rápido:**
> *"Pregunta: en este blog, donde dice 'María Cevallos', el autor, ¿debería ser un `<article>` aparte? (Espera) No. Es un dato dentro del header del artículo principal. Buena heurística: si dudan, hagan la prueba RSS."*

---

<a id="slide-11"></a>
## 🟢 Slide 11 — Portada bloque 04: Formularios HTML5

### Lo que muestra el slide

Portada de transición. Texto grande: "Formularios HTML5: validación nativa sin escribir JavaScript".

### Lo que tienes que decir (1-2 minutos)

> *"Hicimos un descanso de 15 minutos. ¿Listos para la segunda mitad? Vamos al bloque que les va a transformar: formularios."*

> *"Si HTML 4 era débil en algo, era en formularios. Para validar que un email tuviera arroba, había que escribir 30 líneas de JavaScript. Para validar que la fecha fuera futura, otras 30. Para limitar un número entre 1 y 10, otras 30."*

> *"HTML5 vino a cambiar esto. Trajo 13 nuevos tipos de input y una API de validación nativa que el navegador ejecuta antes de que tu JavaScript se entere. Vamos a verlo."*

---

<a id="slide-12"></a>
## 🟢 Slide 12 — Los 13 tipos de input HTML5

### Lo que muestra el slide

Tabla en dos columnas con los 13 tipos nuevos:

| Tipo | Para qué sirve |
|------|----------------|
| `email` | Valida formato de correo |
| `tel` | Para teléfonos (no valida formato — usa pattern) |
| `url` | Valida URL bien formada |
| `number` | Solo números, con min/max/step |
| `range` | Deslizador visual |
| `date` | Selector de fecha del navegador |
| `time` | Selector de hora |
| `datetime-local` | Fecha + hora juntas |
| `month` | Selector de mes-año |
| `week` | Selector de semana del año |
| `color` | Selector de color (paleta nativa) |
| `search` | Caja de búsqueda con clear button |
| `password` | Oculta caracteres con puntos |

### Lo que tienes que decir (10-12 minutos)

> *"Aquí están los nuevos tipos de input que llegaron con HTML5. Cada uno trae beneficios concretos. Vamos por los más importantes."*

#### `type="email"`

> *"Valida que el contenido tenga el patrón `usuario@dominio.tld`. Si escriben 'maria' sin arroba, el navegador no deja enviar. Si escriben 'maria@', tampoco. Tiene que ser un formato de correo bien formado. ¿Validación perfecta? No. 'fake@fake.com' es 'válido' aunque no exista. Pero es 95 % del problema resuelto sin código."*

> *"Bonus móvil: en celular, abre un teclado especial con la tecla `@` visible."*

#### `type="tel"`

> *"Aquí HTML5 fue inteligente: **no valida el formato**. ¿Por qué? Porque los teléfonos varían enormemente entre países. En Ecuador es '09' + 8 dígitos. En España es '+34' + 9 dígitos. En USA es '+1' + 10 dígitos. Si HTML5 forzara un formato, sería injusto con muchos países."*

> *"¿Para qué sirve entonces? Para el teclado del móvil: abre el teclado numérico telefónico. Para forzar formato, usen el atributo `pattern` que vemos en el siguiente slide."*

#### `type="url"`

> *"Valida que sea una URL bien formada: que tenga esquema (`http://` o `https://`), host, etc. Útil para campos como 'tu portafolio web' o 'tu LinkedIn'."*

#### `type="number"`

> *"Para entrar números. Tres atributos compañeros: `min`, `max`, `step`. Ejemplo: para una calificación del 0 al 10, escriben `min=\"0\" max=\"10\" step=\"0.5\"`. Si el usuario intenta poner 11, el navegador no lo permite."*

> *"También aparecen flechitas arriba/abajo en escritorio, y teclado numérico en móvil."*

#### `type="range"`

> *"Esto es genial. Deslizador visual. Útil para 'volumen', 'nivel de experiencia', 'rango de precio'. Igual que number, acepta min/max/step. Tip pro: combínenlo con `<output>` para mostrar el valor en tiempo real."*

```html
<input type="range" id="exp" min="1" max="5" oninput="salida.value=this.value">
<output id="salida" for="exp">3</output>
```

#### `type="date"`, `type="time"`, `type="datetime-local"`

> *"Selectores nativos del navegador. En Chrome aparece un calendario emergente. En Firefox también. En móvil, abre el selector nativo del sistema operativo: el de iOS si es iPhone, el de Android si es Android."*

> *"`date` solo fecha. `time` solo hora. `datetime-local` ambos juntos."*

> *"Atributos `min` y `max` aceptan formato ISO 8601: `min=\"2026-01-01\" max=\"2026-12-31\"`."*

#### `type="color"`

> *"Selector de color con paleta. El usuario abre un picker visual, elige el color, y tu formulario recibe el código hex: `#2C5F2D`."*

#### `type="search"`

> *"Es visualmente igual a `type=text`, pero en algunos navegadores aparece una 'x' para limpiar el campo. Más importante: si lo combinan con `<form role=search>`, los lectores de pantalla anuncian que es una caja de búsqueda."*

#### `type="password"`

> *"No es nuevo, pero recuerden: oculta los caracteres con puntos. **Tres advertencias críticas:**"*

> *"**Uno:** type=password NO encripta. Solo oculta visualmente. La contraseña viaja en texto plano si tu formulario no usa HTTPS."*

> *"**Dos:** Nunca usen `<input type=text>` con `autocomplete=off` para contraseñas. Usen siempre `<input type=password>`."*

> *"**Tres:** Cuando vean en el código fuente de un sitio que su contraseña tiene 8 caracteres y el `<input>` está visible, no celebren. La contraseña real puede ser muy diferente; la del DOM puede ser una falsa pista."*

#### Demostración

> *"Vamos a probar todos estos tipos. Abro el archivo `03_formulario_inscripcion_UTEQ.html` en el navegador. Miren cómo aparecen distinto cada uno en escritorio, y abro el inspector móvil para que vean que en celular el teclado cambia para cada tipo."*

(Demuestra los teclados móviles con el modo responsive de Chrome DevTools.)

---

<a id="slide-13"></a>
## 🟢 Slide 13 — Atributos de validación nativa

### Lo que muestra el slide

Ocho tarjetas con los atributos clave:
- `required` — obliga el campo
- `pattern="regex"` — formato exacto
- `min` / `max` — rangos
- `minlength` / `maxlength` — longitud
- `step` — incremento
- `placeholder` — texto de ayuda
- `autocomplete` — sugerencias
- `title` — mensaje personalizado

### Lo que tienes que decir (8-10 minutos)

> *"Ahora los atributos. Los tipos de input son las herramientas; los atributos son los ajustes."*

#### `required`

> *"El más simple. Si está presente, el campo es obligatorio. El navegador no permite enviar el formulario sin completarlo."*

```html
<input type="email" required>
```

> *"Bonus: en CSS, pueden estilar con `:required` los campos obligatorios. Por ejemplo, ponerles un asterisco rojo automáticamente."*

#### `pattern`

> *"El más poderoso. Acepta una expresión regular. Si el contenido no cumple, no deja enviar."*

```html
<input type="text" pattern="[0-9]{10}" title="10 dígitos numéricos">
```

> *"En el ejemplo: el campo debe tener exactamente 10 dígitos. La regex `[0-9]{10}` significa 'diez caracteres del 0 al 9'."*

> *"**Importante:** acompañen siempre `pattern` con `title`, que es el mensaje que verá el usuario cuando se equivoque. Sin `title`, ve un mensaje genérico horrible: 'Por favor, ajústate al formato solicitado'. Con title: 'Debe contener 10 dígitos numéricos'. Mejor."*

#### `min` y `max`

> *"Trabajan con number, range, date, time."*

```html
<input type="number" min="1" max="10">
<input type="date" min="2026-01-01" max="2026-12-31">
```

#### `minlength` y `maxlength`

> *"Trabajan con text, textarea, password, email, etc. Limitan número de caracteres."*

```html
<input type="text" minlength="3" maxlength="50">
```

#### `placeholder`

> *"Texto que aparece en gris dentro del campo, como pista de qué escribir. Desaparece al empezar a escribir."*

> *"**Advertencia de accesibilidad:** el placeholder NO reemplaza al label. Algunos diseñadores hacen formularios sin label, solo con placeholder. Eso es horrible para accesibilidad: cuando el usuario empieza a escribir, el placeholder desaparece y se olvida qué iba en ese campo. Siempre usen `<label>` + `placeholder` como complemento."*

#### `autocomplete`

> *"Le dice al navegador que sugiera datos guardados previamente. Acepta valores específicos: `name`, `email`, `tel`, `street-address`, `cc-number`, etc."*

```html
<input type="email" autocomplete="email">
```

> *"Esto trae beneficios enormes:"*

> *"1. El usuario completa el formulario en 5 segundos en lugar de 5 minutos."*
> *"2. Las contraseñas se guardan correctamente en el password manager."*
> *"3. Las tarjetas de crédito se autocompletan de manera segura."*

> *"Si quieren ver la lista completa de valores válidos, búsquenla en MDN: 'HTML autocomplete attribute'."*

#### `title`

> *"Como mencioné con pattern. Es el mensaje de error/ayuda que ve el usuario. Aparece como tooltip al pasar el mouse."*

### Demostración en vivo

> *"Volvamos al formulario. Voy a intentar enviarlo vacío... (intenta) Ven cómo el navegador me grita en el primer campo requerido. Voy a escribir un email mal formado... (escribe 'hola@'). Ven el mensaje. Voy a poner cédula con 5 dígitos... ven el mensaje custom de mi title. ¿Cuánto JavaScript escribí? Cero."*

---

<a id="slide-14"></a>
## 🟢 Slide 14 — Demo formulario UTEQ

### Lo que muestra el slide

Código del formulario de inscripción + lista de validaciones automáticas que ocurren.

### Lo que tienes que decir (5 minutos)

> *"Aquí está nuestro Ejercicio 2.1 resuelto: el formulario de inscripción a la Jornada de Aplicaciones Web. Es el que ustedes van a construir en el laboratorio en una hora."*

(Recorre el código en pantalla, señalando los puntos clave.)

> *"Observen: cuatro `<fieldset>` que agrupan datos por bloque. Cada uno con su `<legend>` que es el título del grupo."*

> *"Cada input tiene su `<label for>` correspondiente. El atributo `for` debe coincidir con el `id` del input. Esa asociación permite:"*

> *"1. Que al hacer click en el label, el cursor salte al input correspondiente."*
> *"2. Que el lector de pantalla lea el label cuando el usuario llega al input."*
> *"3. Que el campo sea más fácil de tocar en móvil (la zona de toque incluye el label)."*

#### ⚠️ Advertencia CRÍTICA de seguridad

(Aquí cambia el tono, sé enfático.)

> *"Atención. Esto que les voy a decir lo van a olvidar todos. Lo voy a decir tres veces."*

> *"**La validación HTML5 es para USABILIDAD, no para SEGURIDAD.**"*

> *"**La validación HTML5 es para USABILIDAD, no para SEGURIDAD.**"*

> *"**La validación HTML5 es para USABILIDAD, no para SEGURIDAD.**"*

> *"¿Qué significa esto? Significa que cualquier usuario malicioso puede:"*

> *"1. Abrir las herramientas de desarrollo (F12)."*
> *"2. Borrar mi atributo `required`."*
> *"3. Enviar el formulario sin completar."*

> *"O puede usar Postman, curl, fetch desde la consola, cualquier herramienta. La validación HTML5 vive en el navegador, y el navegador es del usuario. El usuario controla el navegador."*

> *"¿Entonces para qué sirve la validación HTML5? Para los **usuarios honestos**. La gran mayoría de gente que llena un formulario lo llena bien, y la validación HTML5 les ayuda a corregir errores antes de enviar. Eso es usabilidad."*

> *"Pero la seguridad real va siempre en el servidor. En la semana 11 vamos a ver cómo validar en Node.js. En la semana 14 vamos a hablar de OWASP Top 10. Por ahora, recuerden: HTML5 valida; servidor protege."*

---

<a id="slide-15"></a>
## 🟢 Slide 15 — Portada bloque 05: Multimedia y APIs

### Lo que muestra el slide

Portada de transición. "Multimedia y APIs nativas del navegador".

### Lo que tienes que decir (1-2 minutos)

> *"Tercer bloque grande. Multimedia y APIs. Vamos a ver cómo HTML5 mató a Flash y trajo capacidades que antes eran exclusivas de aplicaciones de escritorio."*

> *"Antes de 2010, para mostrar un video en una página había que instalar Flash Player. Si el usuario no lo tenía, no veía el video. Y Flash era inseguro: hubo años en que era el principal vector de ataques. Steve Jobs publicó en 2010 una carta abierta titulada 'Thoughts on Flash' explicando por qué iOS no lo iba a soportar. Esa carta aceleró su muerte. En 2020 Flash murió oficialmente."*

> *"¿Quién mató a Flash? HTML5 con `<video>` y `<audio>`."*

---

<a id="slide-16"></a>
## 🟢 Slide 16 — Las 5 APIs nativas

### Lo que muestra el slide

Lista de las 5 APIs:
1. Multimedia (`<video>`, `<audio>`)
2. Canvas 2D / WebGL (`<canvas>`)
3. Geolocation API
4. Web Storage (localStorage, sessionStorage)
5. Drag and Drop

### Lo que tienes que decir (3-4 minutos)

> *"HTML5 trajo cinco familias de APIs principales. 'API' significa Application Programming Interface: un conjunto de funciones que el navegador expone para que tu JavaScript las llame. Vamos a verlas brevemente y nos detenemos en las más importantes."*

(Recorre cada una con descripción de 30 segundos.)

> *"**Multimedia.** `<video>` y `<audio>`. Reproducción nativa de video y audio sin Flash, sin Silverlight, sin nada. Soporta múltiples formatos, subtítulos, controles personalizables."*

> *"**Canvas 2D / WebGL.** `<canvas>` es un lienzo donde dibujas con JavaScript. Pueden crear juegos 2D, gráficos dinámicos, visualizaciones de datos. WebGL agrega 3D. Lo veremos brevemente porque es de la semana 4."*

> *"**Geolocation API.** El navegador puede saber dónde está el usuario. Por GPS si es móvil, por Wi-Fi y triangulación, o por IP. Necesita permiso del usuario (popup) y HTTPS obligatorio."*

> *"**Web Storage.** El navegador puede guardar datos en el cliente. localStorage y sessionStorage. Persistentes entre sesiones (local) o solo durante la sesión (session). Lo veremos en detalle."*

> *"**Drag and Drop.** Permite arrastrar elementos con el mouse y soltarlos. Útil para reordenar listas y para que el usuario suba archivos arrastrándolos al navegador."*

> *"Adicionales que no vamos a profundizar hoy pero existen: WebRTC (videollamadas), WebSockets (mensajería tiempo real), Service Workers (PWAs offline), Push Notifications, WebUSB, WebBluetooth, WebGPU."*

---

<a id="slide-17"></a>
## 🟢 Slide 17 — `<video>` accesible

### Lo que muestra el slide

Código de `<video>` con múltiples sources y tracks. Atributos clave explicados.

### Lo que tienes que decir (8-10 minutos)

> *"Vamos a ver el elemento `<video>` en detalle. Es uno de los más usados y más maltratados."*

```html
<video controls preload="metadata" poster="portada.jpg" width="800" height="450">
    <source src="video.webm" type="video/webm">
    <source src="video.mp4" type="video/mp4">
    <track kind="subtitles" src="es.vtt" srclang="es" label="Español" default>
    <track kind="captions" src="captions.vtt" srclang="es" label="Captions">
    <p>Tu navegador no soporta video. <a href="video.mp4">Descárgalo</a>.</p>
</video>
```

#### Atributos críticos

> *"**`controls`** — muestra los controles del navegador. Si no lo ponen, el video se ve pero el usuario no puede pausarlo. Solo omítanlo si construyen controles personalizados con JavaScript Y los hacen accesibles por teclado."*

> *"**`preload`** — controla cuántos bytes descargar antes de que el usuario pulse play. Acepta `none`, `metadata`, `auto`. Mi recomendación: `metadata`. Descarga solo el tamaño y duración (kilobytes), no el video completo (megabytes). Si ponen `auto`, su página puede comer 100 MB de datos del celular del usuario aunque nunca vea el video."*

> *"**`poster`** — imagen que se muestra antes de pulsar play. Sin esto, aparece un rectángulo negro o el primer frame del video (que a veces es un fade in y se ve mal)."*

> *"**`width` y `height`** — siempre defínanlos. Si no, el video aparece de tamaño 0×0 mientras carga, y cuando carga el layout salta. Eso se llama CLS (Cumulative Layout Shift) y es una métrica que Google penaliza en SEO."*

> *"**`autoplay`** — reproduce automáticamente. ⚠ Los navegadores SOLO permiten autoplay si el video va en `muted`. Si quieren video con audio que se reproduzca solo, no van a poder. Los usuarios odian eso. Úsenlo solo en contextos muy justificados, como un video de fondo decorativo silente."*

#### Múltiples `<source>`

> *"El navegador elige el primer `<source>` que sabe reproducir. Por eso ponemos primero WebM (más eficiente, navegadores modernos) y luego MP4 (universal, fallback seguro). Si pones solo MP4, está bien, funciona en todos los navegadores; pero pierdes la oportunidad de ahorrar 30% de bytes en navegadores modernos."*

#### `<track>` para accesibilidad

> *"Aquí está la diferencia entre amateur y profesional. Cinco tipos de `<track>`:"*

> *"**`kind=\"subtitles\"`** — Traducciones para quien habla OTRO idioma. Asume que el espectador OYE el audio original."*

> *"**`kind=\"captions\"`** — Transcripción para personas SORDAS. Incluye descripciones de efectos sonoros: [aplausos], [risa], [música suave]. Identifica quién habla: 'Dr. González: …'. NO es lo mismo que subtitles. La diferencia es crítica."*

> *"**`kind=\"descriptions\"`** — Audio-descripción de lo que pasa visualmente, para personas CIEGAS. 'En pantalla aparece el logo de la UTEQ. El presentador sonríe'."*

> *"**`kind=\"chapters\"`** — Marcadores de capítulos navegables."*

> *"**`kind=\"metadata\"`** — Datos no visibles para el usuario, usados por scripts."*

#### Formato VTT

> *"Los archivos de subtítulos usan formato WebVTT. Es un archivo de texto plano con extensión `.vtt`. Empieza con la palabra exacta `WEBVTT`. Después, bloques con un tiempo y un texto."*

(Muestra el archivo `05_subtitulos_ejemplo.vtt`.)

```
WEBVTT

1
00:00:00.000 --> 00:00:04.500
Bienvenidos a la Jornada
de Aplicaciones Web UTEQ.
```

> *"Atributo `default` en una sola pista: la activa de entrada cuando el video carga."*

#### Ley de Discapacidades de Ecuador

> *"Ecuador tiene la **Ley Orgánica de Discapacidades** que obliga a que los sitios web del Estado y los privados de servicio público sean accesibles. Si ustedes construyen un sitio para una entidad pública sin subtítulos en sus videos, están incumpliendo la ley. Lo que les estoy enseñando no es opcional ni 'lindo de tener'. Es legalmente requerido."*

---

<a id="slide-18"></a>
## 🟢 Slide 18 — Almacenamiento en el cliente

### Lo que muestra el slide

Tabla comparativa: Cookies vs localStorage vs sessionStorage vs IndexedDB vs Cache API.

### Lo que tienes que decir (6-8 minutos)

> *"HTML5 trajo Web Storage, pero antes de él ya existían cookies. Hoy en 2026 hay 5 formas de guardar datos en el cliente. Vamos a verlas comparativamente."*

| Mecanismo | Tamaño | Duración | Acceso desde JS | Usos típicos |
|-----------|--------|----------|-----------------|--------------|
| Cookies | 4 KB | Configurable | Sí | Sesión de servidor |
| localStorage | ~5-10 MB | Hasta que el usuario borre | Sí (síncrono) | Preferencias UI, tema oscuro, idioma |
| sessionStorage | ~5-10 MB | Cierre de pestaña | Sí (síncrono) | Estado temporal del formulario |
| IndexedDB | 50%+ disco | Persistente | Sí (asíncrono) | Apps offline, datos grandes |
| Cache API | Por origen | Persistente | Sí (async) | Service Workers, PWAs |

#### Cookies

> *"Las cookies son las más viejas. Existen desde 1994. Se inventaron para que el servidor pudiera identificar usuarios entre peticiones HTTP. Cada vez que tu navegador hace una petición, manda automáticamente todas las cookies del sitio. Por eso son pequeñas: 4 KB máximo. Y por eso son lentas: cada request lleva cookies."*

> *"Uso típico hoy: cookie de sesión del servidor. Por ejemplo, cuando inician sesión en un sitio, el servidor les manda una cookie con un ID de sesión. Esa cookie identifica que ustedes son los mismos en cada request."*

#### localStorage

> *"`localStorage.setItem('tema', 'oscuro')`. Sintaxis simple. Guarda pares clave/valor (strings). Persiste aunque cierren el navegador, aunque reinicien la PC. Solo se va si el usuario borra datos del sitio."*

> *"Uso típico: preferencias de UI. Tema oscuro, idioma, último filtro usado, posición de scroll. Cosas que no son sensibles."*

#### sessionStorage

> *"Igual que localStorage pero se borra al cerrar la pestaña. Útil para estado temporal: 'el usuario está en el paso 3 de 5 del formulario'."*

#### IndexedDB

> *"Para datos grandes. Base de datos NoSQL completa, con índices, transacciones, todo. Se usa en apps offline que necesitan sincronizar muchos datos con un servidor."*

#### Cache API

> *"La usan los Service Workers. Cachean recursos (HTML, CSS, imágenes) para que la app funcione offline. Es la base de las PWAs (Progressive Web Apps)."*

#### ⚠️ Advertencia crítica de seguridad

(Cambia el tono, énfasis fuerte.)

> *"Atención. Otra cosa que van a olvidar todos. La voy a escribir en la pizarra para que la copien."*

> *"**JAMÁS guarden tokens JWT, contraseñas, datos de tarjetas de crédito o información sensible en localStorage o sessionStorage.**"*

> *"¿Por qué? Porque cualquier script malicioso que se ejecute en su sitio (un ataque XSS) puede leer todo localStorage. `localStorage.getItem('jwt')` y listo, su token está robado."*

> *"¿Dónde van entonces los tokens? En cookies con los flags `HttpOnly`, `Secure`, `SameSite=Strict`. `HttpOnly` impide que JavaScript las lea: solo el servidor las ve. Eso lo veremos en la semana 10 cuando hablemos de autenticación."*

> *"Por ahora: localStorage = preferencias inocuas. Tokens y secretos = cookies HttpOnly. Memorícenlo."*

---

