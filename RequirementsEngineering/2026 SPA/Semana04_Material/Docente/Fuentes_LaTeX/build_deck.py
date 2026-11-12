"""Diapositivas semana 4 ISR-401 (alineadas al sílabo SPA 2026-2027)."""
from pptx import Presentation
from pptx.util import Emu, Pt, Inches
from pptx.dml.color import RGBColor
from pptx.enum.shapes import MSO_SHAPE
from pptx.enum.text import PP_ALIGN, MSO_ANCHOR

NAVY = RGBColor(0x0D, 0x3B, 0x72)
BLUE = RGBColor(0x15, 0x65, 0xC0)
GOLD = RGBColor(0xC8, 0x96, 0x0C)
INK = RGBColor(0x1A, 0x1A, 0x2E)
GRAY = RGBColor(0x5F, 0x6B, 0x7A)
LIGHT = RGBColor(0xEE, 0xF2, 0xF7)
WHITE = RGBColor(0xFF, 0xFF, 0xFF)
PALE_GOLD = RGBColor(0xFB, 0xF3, 0xDC)
RED = RGBColor(0xB0, 0x3A, 0x2E)
GREEN = RGBColor(0x2E, 0x7D, 0x32)
TITLE_FONT = "Cambria"
BODY_FONT = "Calibri"

prs = Presentation()
prs.slide_width = Emu(12192000)
prs.slide_height = Emu(6858000)
W, H = prs.slide_width, prs.slide_height
BLANK = prs.slide_layouts[6]
counter = {"n": 0}


def box(slide, x, y, w, h, fill=None, line=None, shape=MSO_SHAPE.RECTANGLE):
	s = slide.shapes.add_shape(shape, x, y, w, h)
	if fill is None:
		s.fill.background()
	else:
		s.fill.solid()
		s.fill.fore_color.rgb = fill
	if line is None:
		s.line.fill.background()
	else:
		s.line.color.rgb = line
		s.line.width = Pt(1)
	s.shadow.inherit = False
	return s


def text(slide, x, y, w, h, paras, size=18, color=INK, font=BODY_FONT, bold=False, align=PP_ALIGN.LEFT, anchor=MSO_ANCHOR.TOP, spacing=6):
	"""paras: str o lista de str / (str, dict)."""
	tb = slide.shapes.add_textbox(x, y, w, h)
	tf = tb.text_frame
	tf.word_wrap = True
	tf.vertical_anchor = anchor
	tf.margin_left = tf.margin_right = Inches(0.08)
	tf.margin_top = tf.margin_bottom = Inches(0.04)
	if isinstance(paras, str):
		paras = [paras]
	for i, p in enumerate(paras):
		opts = {}
		if isinstance(p, tuple):
			p, opts = p
		para = tf.paragraphs[0] if i == 0 else tf.add_paragraph()
		para.alignment = opts.get("align", align)
		para.space_after = Pt(opts.get("spacing", spacing))
		r = para.add_run()
		r.text = p
		r.font.name = opts.get("font", font)
		r.font.size = Pt(opts.get("size", size))
		r.font.bold = opts.get("bold", bold)
		r.font.italic = opts.get("italic", False)
		r.font.color.rgb = opts.get("color", color)
	return tb


def page_no(slide):
	counter["n"] += 1
	text(slide, Emu(11650000), Emu(6460000), Emu(420000), Emu(300000), str(counter["n"]), size=12, color=GOLD, bold=True, align=PP_ALIGN.RIGHT)


def notes(slide, t):
	slide.notes_slide.notes_text_frame.text = t


def content_slide(title, kicker=None):
	s = prs.slides.add_slide(BLANK)
	box(s, 0, 0, W, Emu(1060000), fill=NAVY)
	box(s, 0, 0, Emu(164592), H, fill=GOLD)
	if kicker:
		text(s, Emu(347472), Emu(90000), Emu(11000000), Emu(300000), kicker.upper(), size=11, color=GOLD, bold=True)
		text(s, Emu(347472), Emu(330000), Emu(11400000), Emu(700000), title, size=28, color=WHITE, font=TITLE_FONT, bold=True)
	else:
		text(s, Emu(347472), Emu(170000), Emu(11400000), Emu(800000), title, size=28, color=WHITE, font=TITLE_FONT, bold=True, anchor=MSO_ANCHOR.MIDDLE)
	text(s, Emu(347472), Emu(6460000), Emu(8000000), Emu(300000), "ISR-401 · Ingeniería de Requerimientos · UTEQ · Semana 4", size=10, color=GRAY)
	page_no(s)
	return s


def card(s, x, y, w, h, head, body, head_fill=NAVY, body_size=15, head_size=16, fill=LIGHT):
	box(s, x, y, w, h, fill=fill)
	box(s, x, y, w, Emu(470000), fill=head_fill)
	text(s, x, y, w, Emu(470000), head, size=head_size, color=WHITE, bold=True, anchor=MSO_ANCHOR.MIDDLE)
	text(s, x + Emu(40000), y + Emu(520000), w - Emu(80000), h - Emu(560000), body, size=body_size)


def callout(s, x, y, w, h, label, msg, fill=PALE_GOLD, color=GOLD, size=15):
	box(s, x, y, w, h, fill=fill)
	box(s, x, y, Emu(90000), h, fill=color)
	text(s, x + Emu(150000), y, w - Emu(200000), h, [(label, {"bold": True, "color": color, "size": size, "spacing": 2}), (msg, {"size": size})], anchor=MSO_ANCHOR.MIDDLE, spacing=2)


def table(s, x, y, w, rows, col_w, header_fill=NAVY, size=14, row_h=Emu(520000)):
	nr, nc = len(rows), len(rows[0])
	gt = s.shapes.add_table(nr, nc, x, y, w, row_h * nr).table
	for j, cw in enumerate(col_w):
		gt.columns[j].width = cw
	for i, row in enumerate(rows):
		for j, val in enumerate(row):
			c = gt.cell(i, j)
			c.text = ""
			p = c.text_frame.paragraphs[0]
			r = p.add_run()
			r.text = val
			r.font.name = BODY_FONT
			r.font.size = Pt(size)
			c.margin_left = c.margin_right = Inches(0.08)
			c.margin_top = c.margin_bottom = Inches(0.04)
			c.fill.solid()
			if i == 0:
				r.font.bold = True
				r.font.color.rgb = WHITE
				c.fill.fore_color.rgb = header_fill
			else:
				r.font.color.rgb = INK
				c.fill.fore_color.rgb = LIGHT if i % 2 else WHITE
	return gt


L = Emu(457200)
CW = Emu(11277600)
TOP = Emu(1290000)

# 1 Portada ---------------------------------------------------------------
s = prs.slides.add_slide(BLANK)
box(s, 0, 0, W, H, fill=NAVY)
box(s, 0, 0, Emu(164592), H, fill=GOLD)
text(s, Emu(500000), Emu(900000), Emu(10500000), Emu(400000), "Semana 4 · 16 al 22 de noviembre de 2026", size=18, color=GOLD, bold=True)
text(s, Emu(500000), Emu(1400000), Emu(10800000), Emu(1500000), "Elicitación de requisitos: fuentes y técnicas", size=44, color=WHITE, font=TITLE_FONT, bold=True)
text(s, Emu(500000), Emu(3300000), Emu(10800000), Emu(900000), ["Unidad 2: Elicitación y Análisis de Requisitos · Tema 1", ("Fuentes · entrevista, taller, focus group, observación, etnografía · cuestionario, lectura basada en perspectivas, design thinking · técnicas de apoyo", {"size": 16, "color": RGBColor(0xC9, 0xD6, 0xE8)})], size=20, color=WHITE)
text(s, Emu(500000), Emu(5600000), Emu(10800000), Emu(600000), ["ISR-401 · Ingeniería de Requerimientos · Cuarto nivel, paralelo A", "Prof. Gleiston C. Guerrero-Ulloa, PhD · SPA 2026–2027"], size=14, color=RGBColor(0xC9, 0xD6, 0xE8), spacing=2)
page_no(s)
notes(s, "Presentación de la semana 4. Recordar que el material de lectura se publicó en el SGA con el cuestionario de aula invertida. Esta semana cierra TA-PFC-E1 (sumativa, 1.75 puntos) y GA-TL-02 (formativa), ambas el sábado 21 de noviembre a las 23:59.")

# 2 Agenda -----------------------------------------------------------------
s = content_slide("¿Qué haremos esta semana?", "Planificación de la clase")
items1 = [("1", "Cuestionario de la lectura (15 min)", "Revisión de respuestas y dudas"),
	("2", "Por qué es difícil elicitar y fuentes (30 min)", "Conocimiento tácito · partes interesadas · documentos, sistemas, normas"),
	("3", "Técnicas de recolección (55 min)", "Entrevista · cuestionario · taller · focus group · observación · etnografía · lectura por perspectivas"),
	("4", "Design thinking y técnicas de apoyo (40 min)", "Mapa de empatía · «¿Cómo podríamos…?» · KJ · mapas mentales · checklists"),
	("5", "Selección, IA y ética (20 min)", "Qué técnica para qué fuente · evidencias reales")]
items2 = [("6", "Taller GA-TL-02 (120 min)", "Guion · ensayo en juego de roles · mapa de empatía · ajustes")]
text(s, L, TOP - Emu(60000), Emu(7400000), Emu(380000), "Sesión de contacto con el docente (3 h)", size=15, color=NAVY, bold=True)
text(s, Emu(8100000), TOP - Emu(60000), Emu(3600000), Emu(380000), "Sesión práctico-experimental (2 h)", size=15, color=NAVY, bold=True)
y = TOP + Emu(340000)
for n, h1, b1 in items1:
	box(s, L, y, Emu(7400000), Emu(880000), fill=BLUE)
	text(s, L + Emu(60000), y, Emu(500000), Emu(880000), n, size=24, color=GOLD, bold=True, anchor=MSO_ANCHOR.MIDDLE)
	text(s, L + Emu(560000), y + Emu(40000), Emu(6800000), Emu(820000), [(h1, {"bold": True, "size": 16, "color": WHITE, "spacing": 2}), (b1, {"size": 13, "color": RGBColor(0xDC, 0xE6, 0xF2)})], anchor=MSO_ANCHOR.MIDDLE, spacing=2)
	y += Emu(960000)
n, h1, b1 = items2[0]
box(s, Emu(8100000), TOP + Emu(340000), Emu(3630000), Emu(4720000), fill=NAVY)
text(s, Emu(8160000), TOP + Emu(420000), Emu(3500000), Emu(4500000), [(n, {"size": 28, "color": GOLD, "bold": True}), (h1, {"bold": True, "size": 18, "color": WHITE}), (b1, {"size": 15, "color": RGBColor(0xDC, 0xE6, 0xF2)}), ("Producto en FORM/TL-02/ del repositorio del equipo", {"size": 14, "color": GOLD, "bold": True}), ("Cierre GA-TL-02 y TA-PFC-E1: sábado 21 de noviembre, 23:59", {"size": 14, "color": WHITE})])
notes(s, "Los tiempos suman 160 minutos en la sesión de contacto (3 h con 20 min de margen y receso) y 120 minutos en la práctico-experimental. Ajustar al horario real del paralelo.")

# 3 Resultado de aprendizaje ---------------------------------------------
s = content_slide("Qué debe lograr al terminar la semana")
callout(s, L, TOP, CW, Emu(820000), "Resultado de aprendizaje de la unidad 2", "Aplica técnicas de elicitación y análisis de requisitos para identificar, clasificar y modelar requisitos.", fill=LIGHT, color=NAVY, size=16)
objs = ["Identificar las fuentes de requisitos de un sistema real: partes interesadas, documentos, sistemas existentes, normas y leyes.",
	"Explicar cada técnica del sílabo y cuándo conviene usarla.",
	"Diseñar un guion de entrevista estructurada con preguntas abiertas, neutrales y simples.",
	"Aplicar la fase de empatía del design thinking: mapa de empatía y pregunta «¿Cómo podríamos…?».",
	"Seleccionar y combinar técnicas para el plan de elicitación del PFC."]
y = TOP + Emu(1000000)
for i, o in enumerate(objs, 1):
	box(s, L, y, Emu(520000), Emu(560000), fill=GOLD)
	text(s, L, y, Emu(520000), Emu(560000), str(i), size=20, color=WHITE, bold=True, align=PP_ALIGN.CENTER, anchor=MSO_ANCHOR.MIDDLE)
	text(s, L + Emu(640000), y, Emu(10600000), Emu(560000), o, size=17, anchor=MSO_ANCHOR.MIDDLE)
	y += Emu(700000)
notes(s, "Leer el resultado de aprendizaje y conectar cada objetivo con lo que se entrega el sábado: los objetivos 3 y 4 son GA-TL-02; los objetivos 1 y 5 son TA-PFC-E1.")

# 4 Por qué es difícil -----------------------------------------------------
s = content_slide("¿Por qué es difícil elicitar?")
text(s, L, TOP, Emu(6600000), Emu(3300000), [
	("Elicitar es sacar a la luz, de forma activa, lo que personas y documentos saben sobre el problema y lo que el sistema debe hacer.", {"size": 18, "spacing": 12}),
	("ISO/IEC/IEEE 29148, 6.3.3.3: identificar necesidades incluye obtenerlas de las personas y descubrir las necesidades implícitas del dominio y el contexto.", {"size": 16, "spacing": 12}),
	("Conocimiento tácito (o implícito): lo que la persona sabe y usa, pero no dice porque le parece obvio.", {"size": 16, "spacing": 12}),
	("Las ambigüedades que detecta el analista, si se repreguntan, revelan conocimiento tácito (Ferrari et al., 2016).", {"size": 16})])
card(s, Emu(7300000), TOP, Emu(4430000), Emu(2800000), "Ejemplo: cajero de una cooperativa", "«Los lunes la fila se triplica y nos saltamos la verificación de firma.»\n\nNunca lo dirá si no se le pregunta por los lunes.", body_size=16)
callout(s, L, Emu(4800000), CW, Emu(1250000), "Cómo se hace en la práctica", "Ante «lo normal», «como siempre» o «rápido», pida un ejemplo concreto («¿me cuenta la última vez que pasó?») o una cifra («¿cuánto es rápido para usted?»).")
notes(s, "Pregunta al grupo: ¿qué conocimiento tácito tiene un estudiante sobre la matrícula en el SGA que un analista externo no conocería? Dejar 3 respuestas.")

# 5 Fuentes -----------------------------------------------------------------
s = content_slide("Fuentes de requisitos")
fuentes = [("Partes interesadas", "Necesidades, problemas, prioridades.\n\nGerente, técnico de acopio, socio productor, contador, auditor."),
	("Documentos", "Reglas de negocio, datos, formatos y flujos.\n\nReglamento, formularios, actas, manual de procesos."),
	("Sistemas existentes", "Funciones en uso, datos, problemas e interfaces.\n\nHoja de cálculo, sistema contable, portal del SRI."),
	("Normas y leyes", "Restricciones obligatorias y calidad no negociable.\n\nLOPDP (2021), normativa tributaria, ISO/IEC 25010.")]
x = L
cw = Emu(2700000)
for h1, b1 in fuentes:
	card(s, x, TOP, cw, Emu(3500000), h1, b1, body_size=15)
	x += cw + Emu(159200)
callout(s, L, Emu(5000000), CW, Emu(1050000), "Fuente: IREB CPRE FL v3.3.0, 4.1 · SWEBOK v4.0, área de Requisitos de Software", "Las fuentes que no son personas se consultan con técnicas basadas en artefactos; ahorran tiempo del cliente.", fill=LIGHT, color=NAVY)
notes(s, "Pedir a cada equipo que nombre en voz alta una fuente de cada tipo para su PFC. Esto alimenta la sección de partes interesadas y contexto de TA-PFC-E1.")

# 6 Partes interesadas ------------------------------------------------------
s = content_slide("Partes interesadas: ¿a quiénes consultar?")
text(s, L, TOP, Emu(5700000), Emu(3500000), [
	("ISO/IEC/IEEE 29148, 6.3.3.2", {"bold": True, "color": NAVY, "size": 17}),
	("Identifique a las partes interesadas de todo el ciclo de vida, no solo a los usuarios.", {"size": 16}),
	("Información de una sola clase o de un solo nivel de la organización está sesgada.", {"size": 16}),
	("Consulte una muestra representativa de cada clase y de varios niveles.", {"size": 16})])
rows = [["Pregunta", "Rol de ejemplo"], ["¿Quién decide?", "Gerente"], ["¿Quién lo usa a diario?", "Técnico, cajero"], ["¿Quién recibe sus resultados?", "Socio, cliente"], ["¿Quién lo mantiene?", "Soporte de TI"], ["¿Quién lo controla desde fuera?", "Auditor, regulador"]]
table(s, Emu(6400000), TOP, Emu(5330000), rows, [Emu(3000000), Emu(2330000)], size=15, row_h=Emu(500000))
callout(s, L, Emu(4800000), CW, Emu(1250000), "Error frecuente", "Pensar que «el cliente» es una sola persona. Las contradicciones entre partes interesadas son información: se resuelven en la semana 5 con análisis y negociación.", fill=PALE_GOLD, color=GOLD)
notes(s, "Para TA-PFC-E1 se piden al menos 8 partes interesadas (roles, no nombres), con interés, influencia y disponibilidad, y la matriz poder-interés.")

# 7 Mapa de técnicas --------------------------------------------------------
s = content_slide("Mapa de las técnicas del sílabo", "IREB CPRE FL v3.3.0, sección 4.2")
box(s, L, TOP, Emu(8900000), Emu(520000), fill=NAVY)
text(s, L, TOP, Emu(8900000), Emu(520000), "Técnicas de recolección", size=17, color=WHITE, bold=True, align=PP_ALIGN.CENTER, anchor=MSO_ANCHOR.MIDDLE)
box(s, Emu(9500000), TOP, Emu(2230000), Emu(520000), fill=GOLD)
text(s, Emu(9500000), TOP, Emu(2230000), Emu(520000), "Diseño y generación de ideas", size=14, color=WHITE, bold=True, align=PP_ALIGN.CENTER, anchor=MSO_ANCHOR.MIDDLE)
cols = [("Interrogatorio", "Entrevista\nCuestionario"), ("Colaboración", "Taller (workshop)\nGrupo focal (focus group)"), ("Observación", "Observación de campo\nEtnografía\nAprendiz"), ("Basadas en artefactos", "Lectura de documentos\nLectura basada en perspectivas\nSistemas existentes"), ("Creatividad y prototipos", "Lluvia de ideas\nPrototipado\nDesign thinking")]
x = L
cw = Emu(2100000)
gap = Emu(166000)
for i, (h1, b1) in enumerate(cols):
	if i == 4:
		x = Emu(9500000)
		cw = Emu(2230000)
	card(s, x, TOP + Emu(700000), cw, Emu(2650000), h1, b1, head_fill=BLUE if i < 4 else GOLD, body_size=15, head_size=14)
	x += cw + gap
callout(s, L, Emu(4850000), CW, Emu(1200000), "Técnicas de apoyo (sílabo)", "Ordenan y comprueban lo obtenido con cualquier técnica: método KJ, mapas mentales y listas de verificación (checklists).", fill=PALE_GOLD, color=GOLD)
notes(s, "La clasificación es la del temario IREB 3.3.0 (sección 4.2): técnicas de recolección (interrogatorio, colaboración, observación, basadas en artefactos) y técnicas de diseño y generación de ideas. El grupo de técnicas de apoyo es el del sílabo.")

# 8 Entrevista --------------------------------------------------------------
s = content_slide("La entrevista: tipos y guion")
rows = [["Tipo", "Qué se fija", "Cuándo"], ["Estructurada", "Preguntas y orden fijos", "Comparar varias personas del mismo rol"], ["Semiestructurada", "Temas; se puede repreguntar", "La más usada: orden y flexibilidad"], ["No estructurada", "Solo el tema", "Explorar al inicio"]]
table(s, L, TOP, Emu(6000000), rows, [Emu(1800000), Emu(2000000), Emu(2200000)], size=14, row_h=Emu(600000))
steps = [("Apertura · 5 min", "Propósito, tiempo, consentimiento, permiso para grabar."), ("Bloques · 30 min", "Del general al particular: trabajo actual, problemas, excepciones, datos, calidad, expectativas."), ("Cierre · 5 min", "Resumen para confirmar, «¿qué no le pregunté?», a quién más entrevistar.")]
y = TOP
for h1, b1 in steps:
	box(s, Emu(6700000), y, Emu(5030000), Emu(1150000), fill=LIGHT)
	box(s, Emu(6700000), y, Emu(90000), Emu(1150000), fill=NAVY)
	text(s, Emu(6850000), y, Emu(4850000), Emu(1150000), [(h1, {"bold": True, "color": NAVY, "size": 16, "spacing": 2}), (b1, {"size": 15})], anchor=MSO_ANCHOR.MIDDLE, spacing=2)
	y += Emu(1250000)
text(s, L, Emu(3900000), Emu(6000000), Emu(1600000), [("Tipos de preguntas", {"bold": True, "color": NAVY, "size": 16}), ("Abierta: «¿Cómo registra hoy una entrega?»", {"size": 15}), ("Cerrada: «¿En papel o en el computador?»", {"size": 15}), ("Sondeo: «¿Por qué?», «¿me da un ejemplo?»", {"size": 15})], spacing=4)
text(s, L, Emu(5700000), CW, Emu(500000), "Una persona pregunta y otra registra. Audio solo con consentimiento; minuta con citas textuales.", size=15, color=GRAY)
notes(s, "En GA-TL-02 se diseña una entrevista estructurada de 12 a 15 preguntas con espacio controlado para repreguntas (Wiegers y Beatty, 2013; Zowghi y Coulin, 2005).")

# 9 Preguntas defectuosas ---------------------------------------------------
s = content_slide("Preguntas que fallan y cómo corregirlas")
rows = [["Pregunta defectuosa", "Defecto", "Versión corregida"],
	["¿Verdad que sería mejor una app móvil?", "Inductiva y propone solución", "¿Cómo registra hoy una entrega, desde que llega el socio hasta que se le paga?"],
	["¿Cuánto tarda el pesaje y quién revisa la humedad?", "Doble", "Dos preguntas separadas"],
	["¿El sistema actual es lento?", "Cerrada y vaga", "¿En qué momentos del día el registro le toma más tiempo? ¿Cuánto?"],
	["¿Necesita un dashboard con exportación a Excel?", "Técnica, habla de solución", "¿Qué información le pide la gerencia cada mes y cómo la prepara?"]]
table(s, L, TOP, CW, rows, [Emu(3700000), Emu(2400000), Emu(5177600)], size=14, row_h=Emu(640000))
callout(s, L, Emu(4950000), CW, Emu(1150000), "Evidencia: Bano et al. (2019)", "34 errores de estudiantes en entrevistas, en 7 temas; los más difíciles: formular las preguntas, omitir preguntas y el orden de la entrevista. Sin práctica explícita no mejoraron.", fill=LIGHT, color=NAVY)
notes(s, "Ejercicio rápido (5 min): cada equipo escribe una pregunta defectuosa sobre su PFC y el equipo vecino la corrige. Esto prepara el paso 4 de GA-TL-02.")

# 10 Cuestionario, taller y focus group ------------------------------------
s = content_slide("Cuestionario, taller y grupo focal")
cards3 = [("Cuestionario", "Muchas personas dispersas; mide cuántas comparten algo ya identificado.\n\nNo descubre lo desconocido: va después de las entrevistas.\n\nPrueba piloto con 2–3 personas."),
	("Taller (workshop)", "Varias partes interesadas acuerdan requisitos en poco tiempo.\n\nFacilitador neutral, agenda, reglas.\n\nCierra con acuerdos y pendientes con responsable."),
	("Grupo focal (focus group)", "6 a 10 personas del mismo perfil y un moderador.\n\nConoce percepciones; no decide.\n\nÚtil con usuarios finales numerosos.")]
x = L
cw = Emu(3650000)
for h1, b1 in cards3:
	card(s, x, TOP, cw, Emu(3600000), h1, b1, body_size=15)
	x += cw + Emu(163800)
callout(s, L, Emu(5050000), CW, Emu(1000000), "Error frecuente", "Reemplazar la entrevista por un formulario en línea: se obtienen cifras sin contexto.", fill=PALE_GOLD, color=GOLD)
notes(s, "SWEBOK v4.0 (sección 2.2 del área de Requisitos) incluye focus groups, cuestionarios y talleres facilitados entre las técnicas comunes. Preguntar: ¿cuál conviene para los socios de una cooperativa que solo vienen el día de acopio?")

# 11 Observación y etnografía ----------------------------------------------
s = content_slide("Observación y etnografía")
card(s, L, TOP, Emu(5500000), Emu(2700000), "Observación", "Mirar el trabajo real en su lugar: pasos que se saltan, atajos, papeles pegados al monitor.\n\nPasiva o participativa; aprendiz (apprenticing): aprender a hacer el trabajo (Robertson et al., 2025).", body_size=15)
card(s, Emu(6230000), TOP, Emu(5500000), Emu(2700000), "Etnografía", "Observación prolongada para entender la cultura de trabajo y las reglas no escritas.\n\nEn el PFC: observación de campo de varias horas con enfoque etnográfico.", body_size=15)
text(s, L, Emu(4180000), CW, Emu(450000), "Guía de observación: qué registrar", size=16, color=NAVY, bold=True)
chips = ["Actividad", "Quién", "Herramienta o documento", "Tiempo", "Interrupciones", "Improvisaciones"]
x = L
for c in chips:
	wc = Emu(1780000)
	box(s, x, Emu(4650000), wc, Emu(520000), fill=BLUE, shape=MSO_SHAPE.ROUNDED_RECTANGLE)
	text(s, x, Emu(4650000), wc, Emu(520000), c, size=14, color=WHITE, bold=True, align=PP_ALIGN.CENTER, anchor=MSO_ANCHOR.MIDDLE)
	x += wc + Emu(119000)
text(s, L, Emu(5400000), CW, Emu(700000), "Pida permiso, explique que observa el trabajo y no evalúa a las personas. Fotografíe objetos y documentos, nunca rostros sin consentimiento.", size=15, color=GRAY)
notes(s, "La observación es la técnica indicada cuando el trabajo es rutinario o manual y las personas no saben explicarlo.")

# 12 Lectura basada en perspectivas ----------------------------------------
s = content_slide("Lectura basada en perspectivas")
text(s, L, TOP, CW, Emu(900000), "Leer el mismo documento desde el punto de vista de distintos usuarios, cada uno con sus preguntas (Basili et al., 1996). En elicitación: leer reglamentos, manuales y formularios de la organización sin quedarse en la superficie.", size=17)
rows = [["Perspectiva", "Preguntas al leer el reglamento de acopio"], ["Usuario (técnico de acopio)", "¿Qué pasos sigo? ¿Qué datos registro? ¿Qué hago si el cacao llega húmedo?"], ["Diseñador del sistema", "¿Qué datos aparecen y cómo se relacionan? ¿Qué reglas de cálculo hay?"], ["Probador (tester)", "¿Cómo compruebo cada regla? ¿Qué umbrales concretos da el reglamento? ¿Qué casos límite hay?"]]
table(s, L, Emu(2300000), CW, rows, [Emu(3200000), Emu(8077600)], size=15, row_h=Emu(640000))
callout(s, L, Emu(5050000), CW, Emu(1000000), "En el equipo", "Cada integrante lee con una perspectiva distinta y luego comparan hallazgos.", fill=LIGHT, color=NAVY)
notes(s, "Basili et al. (1996) propusieron y evaluaron experimentalmente esta técnica para revisar documentos de requisitos. Aquí se aplica a los documentos fuente de la organización.")

# 13 Design thinking --------------------------------------------------------
s = content_slide("Design thinking")
fases = [("Empatizar", "Mapa de empatía"), ("Definir", "«¿Cómo podríamos…?»"), ("Idear", "Ideas agrupadas"), ("Prototipar", "Prototipo en papel"), ("Probar", "Retroalimentación")]
x = L
cw = Emu(2100000)
for i, (h1, b1) in enumerate(fases):
	shp = box(s, x, TOP, cw, Emu(1000000), fill=NAVY if i < 2 else BLUE, shape=MSO_SHAPE.CHEVRON if i else MSO_SHAPE.PENTAGON)
	text(s, x + Emu(250000), TOP, cw - Emu(400000), Emu(1000000), [(h1, {"bold": True, "size": 16, "color": WHITE, "spacing": 0}), (b1, {"size": 12, "color": RGBColor(0xDC, 0xE6, 0xF2)})], align=PP_ALIGN.CENTER, anchor=MSO_ANCHOR.MIDDLE, spacing=0)
	x += cw + Emu(194000)
mx, my, mw, mh = L, Emu(2500000), Emu(5600000), Emu(2700000)
quads = [("DICE", 0, 0), ("PIENSA", 1, 0), ("HACE", 0, 1), ("SIENTE", 1, 1)]
for lab, cx, cy in quads:
	box(s, mx + cx * (mw // 2), my + cy * Emu(900000), mw // 2, Emu(900000), fill=LIGHT, line=NAVY)
	text(s, mx + cx * (mw // 2), my + cy * Emu(900000), mw // 2, Emu(400000), lab, size=14, color=NAVY, bold=True)
box(s, mx, my + Emu(1800000), mw // 2, Emu(900000), fill=PALE_GOLD, line=GOLD)
text(s, mx, my + Emu(1800000), mw // 2, Emu(400000), "DOLORES", size=14, color=GOLD, bold=True)
box(s, mx + mw // 2, my + Emu(1800000), mw // 2, Emu(900000), fill=PALE_GOLD, line=GOLD)
text(s, mx + mw // 2, my + Emu(1800000), mw // 2, Emu(400000), "GANANCIAS", size=14, color=GOLD, bold=True)
text(s, Emu(6300000), Emu(2450000), Emu(5430000), Emu(2900000), [
	("Llene el mapa solo con lo dicho u observado, con citas textuales.", {"size": 15}),
	("Bien: «¿Cómo podríamos lograr que el técnico registre una entrega sin hacer esperar al socio más de cinco minutos?»", {"size": 15, "color": GREEN}),
	("Mal: «¿Cómo podríamos hacer una app móvil para el acopio?» (ya decidió la solución).", {"size": 15, "color": RED})], spacing=10)
text(s, L, Emu(5450000), CW, Emu(700000), "SWEBOK v4.0 lo incluye entre las técnicas de elicitación. Mapeo de 127 estudios: se usa sobre todo al inicio, antes de definir requisitos técnicos; reto: documentar y trazar sus resultados (Parizi et al., 2022).", size=13, color=GRAY)
notes(s, "Hehn et al. (2020) proponen tres formas de integrar design thinking e ingeniería de requisitos, que se complementan. Pereira et al. (2021): profesionales reportan que mejoró la obtención y especificación de requisitos.")

# 14 Técnicas de apoyo ------------------------------------------------------
s = content_slide("Técnicas de apoyo")
apoyo = [("Lluvia de ideas", "Muchas ideas, sin criticar; se evalúa después."), ("Prototipado", "Versión barata (papel, maqueta) para reaccionar ante algo concreto; se descarta."), ("Método KJ", "Tarjetas agrupadas por afinidad sin categorías previas; se nombran los grupos (Scupin, 1997)."), ("Mapas mentales", "Tema central y ramas: preparan los bloques del guion."), ("Listas de verificación", "¿Se preguntó por cada característica de calidad de ISO/IEC 25010? (29148, 6.3.3.3)")]
x = L
cw = Emu(2130000)
for h1, b1 in apoyo:
	card(s, x, TOP, cw, Emu(3300000), h1, b1, body_size=15, head_size=15)
	x += cw + Emu(156900)
callout(s, L, Emu(4800000), CW, Emu(1250000), "Cómo se hace en la práctica", "Cada hallazgo en una nota adhesiva (física o en Miro/Excalidraw) → agrupar con KJ → revisar con la lista de calidad. Cada grupo es un área funcional candidata; cada nota suelta pide otra pregunta.", fill=LIGHT, color=NAVY)
notes(s, "Dinámica de 10 minutos: agrupar con KJ las respuestas de la lectura sobre problemas típicos de una cooperativa.")

# 15 Selección --------------------------------------------------------------
s = content_slide("¿Qué técnica para qué situación?")
rows = [["Técnica", "Úsela cuando…", "Complemente cuando…"],
	["Entrevista", "Necesita entender el problema de un rol clave", "El conocimiento es tácito: observe"],
	["Cuestionario", "Necesita saber cuántos comparten algo ya identificado", "Aún no sabe qué preguntar"],
	["Taller", "Varios roles deben acordar un proceso", "Hay mucha diferencia de poder"],
	["Observación", "El trabajo es rutinario o difícil de explicar", "No hay permiso para estar ahí"],
	["Lectura por perspectivas", "Hay reglamentos o manuales", "Los documentos están desactualizados"],
	["Design thinking", "El problema no está claro", "El cliente solo da una reunión corta"]]
table(s, L, TOP, CW, rows, [Emu(2600000), Emu(4500000), Emu(4177600)], size=14, row_h=Emu(500000))
text(s, L, Emu(4950000), CW, Emu(1100000), [("Pacheco et al. (2018), 140 estudios: la eficacia de cada técnica depende del producto, de las partes interesadas y del tipo de información.", {"size": 15, "color": GRAY}), ("Secuencia sugerida para el PFC: documentos → entrevistas → observación → design thinking → cuestionario o taller de confirmación.", {"size": 15, "bold": True, "color": NAVY})])
notes(s, "TA-PFC-E1 exige justificar qué técnica se aplicará a cada parte interesada y por qué. Esta tabla es el criterio.")

# 16 IA y ética -------------------------------------------------------------
s = content_slide("IA en la elicitación y ética de las evidencias")
card(s, L, TOP, Emu(5500000), Emu(3500000), "La IA apoya, no sustituye", "Puede preparar guiones, transcribir y resumir (Siddeshwar et al., 2024).\n\nUn entrevistador con LLM cometió tantos errores como humanos en 33 entrevistas simuladas (Korn et al., 2025).\n\nLímites: poca explicabilidad, control, sesgos y alucinaciones (Cheng et al., 2026).", body_size=14)
card(s, Emu(6230000), TOP, Emu(5500000), Emu(3500000), "Evidencias reales y protegidas", "Consentimiento informado de cada participante (LOPDP, 2021).\n\nAudios y consentimientos: carpeta institucional privada.\n\nRepositorio: solo MANIFIESTO.md con archivo, fecha, duración y SHA-256.\n\nParticipantes con código: P01, P02…", body_size=14)
callout(s, L, Emu(5000000), CW, Emu(1050000), "Indicio grave G4 → calificación CERO", "Entrevistas, transcripciones, participantes o fotografías inventados o sin respaldo original.", fill=RGBColor(0xFB, 0xEA, 0xEA), color=RED)
notes(s, "Mostrar en vivo cómo obtener la huella en PowerShell: Get-FileHash .\\archivo.m4a -Algorithm SHA256. Recordar el modelo de consentimiento informado de la asignatura.")

# 17 GA-TL-02 ---------------------------------------------------------------
s = content_slide("Taller GA-TL-02: entrevista y design thinking", "Formativa · equipo del PFC · cierre sábado 21 de noviembre, 23:59")
pasos = [("1 · Guion", "12 a 15 preguntas para una parte interesada del PFC: apertura, bloques, cierre."), ("2 · Ensayo", "Juego de roles en clase con un compañero; solo audio, con consentimiento."), ("3 · Mapa de empatía", "Con lo escuchado; declaración del problema y «¿Cómo podríamos…?»."), ("4 · Ajustes", "Preguntas inductivas, dobles o cerradas sin necesidad, y su versión corregida.")]
x = L
cw = Emu(2700000)
for h1, b1 in pasos:
	card(s, x, TOP, cw, Emu(2600000), h1, b1, body_size=15)
	x += cw + Emu(159200)
text(s, L, Emu(4050000), CW, Emu(1300000), [("Entregable: FORM/TL-02/main.tex y main.pdf en el repositorio del equipo (use la plantilla del SGA).", {"bold": True, "color": NAVY, "size": 16}), ("En el SGA: solo el PDF de una página con integrantes, tarea, fecha límite y URL del repositorio en una línea.", {"size": 15}), ("Es requisito para presentar GA-PE-02 y TA-PFC-02.", {"size": 15})])
callout(s, L, Emu(5350000), CW, Emu(800000), "Tiempos de la sesión práctica", "Guion 30 min · ensayo 40 min (20 por rol) · mapa y problema 30 min · ajustes y commit 20 min", fill=LIGHT, color=NAVY)
notes(s, "Organización del ensayo: en cada equipo, un integrante entrevista, otro registra y un integrante de otro equipo hace el rol de la parte interesada (así no conoce el guion). Rotar a los 20 minutos.")

# 18 TA-PFC-E1 --------------------------------------------------------------
s = content_slide("TA-PFC-E1: planificación y elicitación", "Sumativa · 1.75 puntos del corte 1 · cierre sábado 21 de noviembre, 23:59")
rows = [["Qué entregar en PFC/E1/", "Mínimo"], ["Carta de aceptación y registro del primer contacto (manifiesto)", "≥ 2 evidencias"], ["Visión, objetivos de negocio medibles, alcance y restricciones", "≥ 3 objetivos"], ["Partes interesadas con matriz poder–interés y estrategia", "≥ 8 roles"], ["Diagrama de contexto y ocho perspectivas", "2 fuentes editables"], ["Plan de elicitación: técnica por parte interesada + instrumentos", "3 instrumentos"], ["Consentimiento, anonimización y plan del proyecto", "—"]]
table(s, L, TOP, Emu(8000000), rows, [Emu(6200000), Emu(1800000)], size=14, row_h=Emu(500000))
card(s, Emu(8650000), TOP, Emu(3080000), Emu(3500000), "Criterios de piso", "P1 PDF de una página con URL\nP2 PDF reproducible desde LaTeX\nP3 Plazo\nP4 Integridad (G1–G6)\n\nCualquiera → CERO", head_fill=RED, body_size=15, fill=RGBColor(0xFB, 0xEA, 0xEA))
text(s, L, Emu(4950000), CW, Emu(1100000), [("El guion corregido de GA-TL-02 es uno de los tres instrumentos.", {"bold": True, "color": NAVY, "size": 16}), ("Trabajo en al menos tres días distintos: más del 50 % en las últimas 24 horas se penaliza.", {"size": 15})])
notes(s, "La guía completa de TA-PFC-E1 está publicada en el SGA desde el 9 de noviembre. Revisar con los equipos que ya tengan la carta de aceptación de la organización.")

# 19 Síntesis ---------------------------------------------------------------
s = prs.slides.add_slide(BLANK)
box(s, 0, 0, W, H, fill=NAVY)
box(s, 0, 0, Emu(164592), H, fill=GOLD)
text(s, Emu(500000), Emu(500000), Emu(10500000), Emu(400000), "Semana 4 — Síntesis", size=16, color=GOLD, bold=True)
text(s, Emu(500000), Emu(1100000), Emu(11000000), Emu(1700000), "Ninguna técnica basta sola: se elige por la fuente y el tipo de conocimiento, se combinan, y toda evidencia debe ser real.", size=30, color=WHITE, font=TITLE_FONT, bold=True)
box(s, Emu(500000), Emu(3600000), Emu(11200000), Emu(1300000), fill=GOLD)
text(s, Emu(650000), Emu(3600000), Emu(11000000), Emu(1300000), [("PRÓXIMO PASO · SEMANA 5", {"size": 13, "bold": True, "color": NAVY, "spacing": 4}), ("Análisis: clasificación, priorización (MoSCoW, Kano), modelado conceptual y negociación · Simulación GA-SIM-01", {"size": 18, "bold": True, "color": WHITE})], anchor=MSO_ANCHOR.MIDDLE)
text(s, Emu(500000), Emu(5400000), Emu(11000000), Emu(700000), "Traiga a la semana 5 los hallazgos de su elicitación: se priorizarán y negociarán.", size=16, color=RGBColor(0xC9, 0xD6, 0xE8))
page_no(s)
notes(s, "Cierre: recordar fechas del sábado 21 y que la retroalimentación de GA-TL-02 se devuelve en el SGA antes de la sesión siguiente.")

# 20 Referencias ------------------------------------------------------------
s = content_slide("Referencias")
refs = [
	"Pohl, K. (2025). Requirements Engineering: Fundamentals, Principles, and Techniques (2.ª ed.). Springer. ISBN 978-3-662-69204-2.",
	"Robertson, J., Robertson, S. y Reed, A. (2025). Mastering the Requirements Process (4.ª ed.). Addison-Wesley. ISBN 978-0-13-796950-0.",
	"ISO/IEC/IEEE 29148:2018. Requirements Engineering. doi:10.1109/IEEESTD.2018.8559686.",
	"Washizaki, H. (ed.) (2024). SWEBOK Guide v4.0. IEEE Computer Society.",
	"Bühne, S., Glinz, M., van Loenhoud, H. y Staal, S. (2026). CPRE Foundation Level Syllabus v3.3.0. IREB.",
	"Cheng, H. et al. (2026). Generative AI for RE: A SLR. Softw. Pract. Exper., 56(2), 141–170. doi:10.1002/spe.70029.",
	"Korn, A., Gorsch, S. y Vogelsang, A. (2025). LLMREI. IEEE RE 2025, 19–30. doi:10.1109/RE63999.2025.00013.",
	"Siddeshwar, V. et al. (2024). AI-Enabled Frameworks in Requirements Elicitation. IEEE Access, 12, 154310–154336. doi:10.1109/ACCESS.2024.3475293.",
	"Parizi, R. et al. (2022). Design thinking in software development: a systematic mapping. JSS, 187, 111217. doi:10.1016/j.jss.2022.111217.",
	"Pereira, L. et al. (2021). Design thinking in RE. ACM SAC '21, 1338–1345. doi:10.1145/3412841.3442008.",
	"Hehn, J. et al. (2020). Integrating Design Thinking for Human-Centered RE. IEEE Software, 37(2), 25–31. doi:10.1109/MS.2019.2957715.",
	"Bano, M. et al. (2019). Teaching requirements elicitation interviews. Requir. Eng., 24(3), 259–289. doi:10.1007/s00766-019-00313-0.",
	"Pacheco, C., García, I. y Reyes, M. (2018). Requirements elicitation techniques: a SLR. IET Softw., 12(4), 365–378. doi:10.1049/iet-sen.2017.0144.",
	"Ferrari, A., Spoletini, P. y Gnesi, S. (2016). Ambiguity and tacit knowledge in elicitation interviews. Requir. Eng., 21(3), 333–355. doi:10.1007/s00766-016-0249-3.",
	"Wiegers, K. y Beatty, J. (2013). Software Requirements (3.ª ed.). Microsoft Press. · Zowghi, D. y Coulin, C. (2005), pp. 19–46. doi:10.1007/3-540-28244-0_2.",
	"Scupin, R. (1997). The KJ Method. Human Organization, 56(2), 233–237. · Basili, V. R. et al. (1996). Perspective-Based Reading. Empir. Softw. Eng., 1(2), 133–164.",
	"Asamblea Nacional del Ecuador (2021). Ley Orgánica de Protección de Datos Personales. R. O. 5.º Supl. 459."]
text(s, L, Emu(1150000), CW, Emu(5280000), refs, size=12, spacing=1)
notes(s, "Las referencias completas, en formato IEEE con BibTeX, están en referencias_semana04.bib y en el material de lectura de la semana.")

prs.save("/home/claude/sem4/diapos/ISR401_Semana04.pptx")
print("slides:", len(prs.slides))
