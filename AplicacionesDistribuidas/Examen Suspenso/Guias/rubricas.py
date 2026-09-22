"""Genera las filas de rúbrica (pesos por P+C+A+T normalizados a 100) y la nota provisional de cada equipo.

Uso: python rubricas.py  -> escribe rubrica_<EQUIPO>.tex y resumen.tex junto a este archivo.
"""
from pathlib import Path

COEF = {"H": 1.00, "PM": 0.40, "PC": 0.20, "PI": 0.00}
MACRO = {"H": r"\hecho", "PM": r"\pmodif", "PC": r"\pculm", "PI": r"\pini"}

# (§, ítem, P, C, A, T, estado al 13/09)
EQUIPOS = {}

# Completitud: % efectivo de los 20 entregables
COMPLETITUD = {}


def pesos(items):
    pts = [p + c + a + t for _, _, p, c, a, t, _ in items]
    total = sum(pts)
    w = [round(x * 100 / total, 1) for x in pts]
    # ajusta el redondeo sobre el ítem de mayor peso para que sumen 100,0
    diff = round(100 - sum(w), 1)
    i = max(range(len(w)), key=lambda k: w[k])
    w[i] = round(w[i] + diff, 1)
    return pts, w


def fmt(x, d=1):
    return f"{x:.{d}f}".replace(".", "{,}")


def genera(equipo):
    items = EQUIPOS[equipo]
    pts, w = pesos(items)
    filas, nota = [], 0.0
    for (sec, txt, p, c, a, t, est), pt, wi in zip(items, pts, w):
        puntos = wi * COEF[est]
        nota += puntos
        filas.append(
            rf"\ri{{{sec}}}{{{txt}}}{{{p}}}{{{c}}}{{{a}}}{{{t}}}{{{pt}}}{{{fmt(wi)}}}{{{MACRO[est]}}}\rp{{{fmt(puntos, 2)}}}"
        )
    # sin líneas en blanco: un \par entre filas rompe el \rowcolor final de longtable
    return "\\begin{rubrica}\n" + "\n".join(filas) + "\n\\end{rubrica}%", nota / 10


if __name__ == "__main__":
    import importlib.util, sys

    here = Path(__file__).parent
    for datos in sorted(here.glob("datos_*.py")):
        spec = importlib.util.spec_from_file_location(datos.stem, datos)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        EQUIPOS[mod.EQUIPO] = mod.ITEMS
        COMPLETITUD[mod.EQUIPO] = mod.PORCENTAJES
    resumen = []
    for eq in EQUIPOS:
        filas, nota = genera(eq)
        comp = sum(COMPLETITUD[eq]) / len(COMPLETITUD[eq])
        (here / f"rubrica_{eq}.tex").write_text(filas + "\n", encoding="utf-8")
        (here / f"nota_{eq}.tex").write_text(
            rf"\newcommand{{\notaprov}}{{{fmt(nota, 2)}}}\newcommand{{\completitud}}{{{round(comp)}\,\%}}" + "\n",
            encoding="utf-8",
        )
        resumen.append((eq, round(comp), nota))
        print(f"{eq}: {len(EQUIPOS[eq])} ítems, completitud {comp:.1f} %, nota provisional {nota:.2f}")
