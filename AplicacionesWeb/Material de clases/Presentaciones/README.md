# 📦 Paquete Didáctico — Semana 02
## HTML y HTML5 para el desarrollo web

**Asignatura:** Aplicaciones Web
**Carrera:** Ingeniería de Software · UTEQ · 5º período
**Año académico:** 2026
**Duración:** 4 h presenciales + 4 h autónomas
**Resultado de aprendizaje:** Construir documentos HTML5 estructuralmente correctos, semánticamente significativos y validables ante el W3C.

---

## 🗂️ Contenido del paquete

```
Semana02_HTML5/
├── presentacion/      ← Material proyectable en aula
├── guias/             ← Guion docente y guía de laboratorio
├── codigo/            ← Archivos de demostración y plantillas
├── graficos/          ← Diagramas SVG didácticos
└── notas_autor/       ← Guion completo bloque-por-bloque
```

---

## 📑 Cómo usar cada recurso

### 1. `presentacion/`
| Archivo | Uso |
|---------|-----|
| `SEMANA_02_HTML5_Presentacion_Docente.pptx` | **Archivo principal** — 28 diapositivas para proyectar. Editable en PowerPoint / Keynote / LibreOffice. |
| `SEMANA_02_HTML5_Presentacion_Docente.pdf` | Versión PDF para distribuir a estudiantes o usar como respaldo si falla PPTX. |

### 2. `guias/`
| Archivo | Audiencia | Uso |
|---------|-----------|-----|
| `GUIA_DIDACTICA_DOCENTE_Semana02.md` | Docente | Planeación completa: objetivos, distribución 240 min en 9 bloques, metodología, rúbricas, indicadores. |
| `GUIA_LABORATORIO_Semana02.md` | Estudiantes | Paso a paso de 7 pasos para el ejercicio práctico GA02 (formulario de inscripción UTEQ). |

### 3. `codigo/`
Archivos HTML/VTT listos para proyectar, ejecutar y modificar en vivo. Todos con comentarios pedagógicos extensos.

| Archivo | Para qué |
|---------|----------|
| `01_plantilla_minima.html` | Estructura mínima HTML5 anotada (las 5 líneas críticas). |
| `02_blog_semantico.html` | Blog que demuestra `header/nav/main/article/section/aside/footer` + "prueba RSS". |
| `03_formulario_inscripcion_UTEQ.html` | **Ej. 2.1 resuelto.** 4 fieldsets, 12+ tipos de input, validación nativa. |
| `04_video_accesible.html` | Demo `<video>` con 5 tipos de `<track>` (subtitles, captions, descriptions, chapters). |
| `05_subtitulos_ejemplo.vtt` | Archivo WebVTT con 8 cues y etiquetas `<v>`, `<b>`, `<i>`. |
| `06_portafolio_template.html` | Plantilla base para **Ej. 2.2 (Tarea TA02)** del estudiante. |

### 4. `graficos/`
Diagramas SVG vectoriales (alta resolución, escalables sin pérdida).

| Archivo | Contenido |
|---------|-----------|
| `01_layout_semantico_html5.svg` | Anatomía visual del layout HTML5. |
| `02_timeline_historia_html.svg` | 8 hitos clave de 1991 a 2026. |
| `03_apis_html5_mapa.svg` | Mapa conceptual de 5 APIs nativas. |
| `04_anatomia_elemento.svg` | Descomposición del elemento `<a href="...">`. |

### 5. `notas_autor/`
**El recurso más extenso del paquete.** Guion frase-por-frase para 240 minutos de clase.

| Archivo | Cubre |
|---------|-------|
| `NOTAS_AUTOR_Semana02_parte1.md` | Apertura + slides 1–18 (~115 min de exposición). |
| `NOTAS_AUTOR_Semana02_parte2.md` | Slides 19–28 + Apéndice A (15 preguntas frecuentes) + Apéndice B (frases de transición). |

Incluye anécdotas concretas (CERN, Steve Jobs/Flash, Ley de Discapacidades Ecuador, SRI/facturación), pausas estratégicas, advertencias críticas y demostraciones en vivo.

---

## 🎯 Flujo sugerido para preparar la clase

1. **Lee primero** `guias/GUIA_DIDACTICA_DOCENTE_Semana02.md` para entender la planeación general.
2. **Repasa** `notas_autor/NOTAS_AUTOR_Semana02_parte1.md` y `parte2.md` marcando con resaltador las frases que adoptes en tu voz.
3. **Practica** abriendo `codigo/03_formulario_inscripcion_UTEQ.html` en el editor para tener listo el material de demostración.
4. **Proyecta** `presentacion/SEMANA_02_HTML5_Presentacion_Docente.pptx` en aula. Combínalo con demos en vivo del código.
5. **Reparte** la guía de laboratorio a estudiantes al inicio del bloque práctico (minuto 180).
6. **Evalúa** con las rúbricas incluidas en la guía didáctica (GA02 = 2 % + TA02 = 5 %).

---

## ✅ Cumplimiento curricular

| Marco | Cobertura |
|-------|-----------|
| **Sílabo UTEQ 2026** | Resultado de aprendizaje 1 (RAU 1) — interfaces semánticas, accesibles, responsivas. |
| **SWEBOK v4.0** | KA02 (Diseño), KA03 (Construcción), KA04 (Pruebas), KA10 (Profesional), KA15 (Calidad). |
| **WCAG 2.1** | Nivel AA — contraste, navegación por teclado, alt en imágenes, subtítulos. |
| **W3C HTML Living Standard** | Validación obligatoria de cada artefacto vía `validator.w3.org/nu/`. |
| **Ley Orgánica de Discapacidades (Ecuador)** | Accesibilidad como requisito legal, no opcional. |

---

## 📊 Evaluación de la semana

| Componente | Código | Peso | Cuándo |
|------------|--------|------|--------|
| Actividad práctica en aula (formulario inscripción) | **GA02** | 2 % | Durante clase, último bloque |
| Tarea autónoma (portafolio HTML5) | **TA02** | 5 % | Entrega antes de la próxima clase |

---

## 🔗 Puente a la Semana 03

La próxima semana se introduce **CSS3 y diseño responsivo**. El portafolio HTML construido como tarea TA02 servirá como base para aplicar estilos profesionales en la sesión siguiente. Los estudiantes deben llegar con su portafolio terminado y validado.

---

✍️ **Material preparado como apoyo docente integral.**
📅 Última actualización: mayo 2026
🎓 Aplicaciones Web · UTEQ
