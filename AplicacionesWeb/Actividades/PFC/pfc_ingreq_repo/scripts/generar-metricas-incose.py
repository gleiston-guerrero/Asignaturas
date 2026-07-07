#!/usr/bin/env python3
"""
generar-metricas-incose.py

Calcula la matriz de conformidad de los requisitos frente a las 15
caracteristicas de calidad de requisitos individuales del INCOSE Guide to
Writing Requirements v4 (2023), y las 9 caracteristicas del conjunto.

Entrada:
    docs/requisitos/metricas/INCOSE-EVALUACION.csv
    (una fila por requisito, columnas por caracteristica, valores 0/1 o vacio)

Salidas:
    docs/requisitos/metricas/INCOSE-INDIVIDUAL.tex   (tabla LaTeX)
    docs/requisitos/metricas/INCOSE-INDIVIDUAL.csv   (resumen por requisito)
    docs/requisitos/metricas/RESUMEN.md              (informe ejecutivo)

Referencia autoritativa:
    INCOSE (2023). Guide to Writing Requirements, INCOSE-TP-2010-006-04, v4.
"""

import argparse
import csv
import os
import sys
from statistics import mean

CARACTERISTICAS_INDIVIDUAL = [
    "necesario",
    "apropiado",
    "no_ambiguo",
    "completo",
    "singular",
    "factible",
    "verificable",
    "correcto",
    "conforme",
    "positivamente_expresado",
    "abstraccion_apta",
    "consistente",
    "comparable",
    "modificable",
    "permitido",
]

CARACTERISTICAS_CONJUNTO = [
    "completo_como_conjunto",
    "consistente_como_conjunto",
    "factible_como_conjunto",
    "comprensible",
    "cubierto_por_pruebas",
    "modificable_como_conjunto",
    "conforme_como_conjunto",
    "sin_duplicacion",
    "sin_conflicto",
]

UMBRAL_INDIVIDUAL_TECHO = 13   # minimo de caracteristicas cumplidas para "excelente"
UMBRAL_INDIVIDUAL_PISO = 10    # minimo absoluto: por debajo, el requisito se rechaza
UMBRAL_PORCENTAJE_TECHO = 80   # >= 80% de requisitos deben cumplir el techo


def leer_evaluacion(csv_path):
    """Lee el CSV con evaluaciones. Formato esperado:
       id_requisito, necesario, apropiado, no_ambiguo, ..., permitido
    """
    filas = []
    with open(csv_path, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for fila in reader:
            filas.append(fila)
    return filas


def calcular_metricas(filas):
    """Devuelve dict con estadisticas por requisito y agregadas."""
    por_requisito = []
    for fila in filas:
        rid = fila.get("id_requisito", "?")
        cumplidas = 0
        no_cumplidas_list = []
        for car in CARACTERISTICAS_INDIVIDUAL:
            valor = fila.get(car, "0").strip()
            if valor in ("1", "si", "SI", "true", "TRUE"):
                cumplidas += 1
            else:
                no_cumplidas_list.append(car)
        porcentaje = (cumplidas / len(CARACTERISTICAS_INDIVIDUAL)) * 100
        por_requisito.append({
            "id": rid,
            "cumplidas": cumplidas,
            "porcentaje": porcentaje,
            "no_cumplidas": no_cumplidas_list,
        })

    total = len(por_requisito)
    cumplen_techo = sum(1 for r in por_requisito if r["cumplidas"] >= UMBRAL_INDIVIDUAL_TECHO)
    bajo_piso = [r for r in por_requisito if r["cumplidas"] < UMBRAL_INDIVIDUAL_PISO]
    porcentaje_techo = (cumplen_techo / total * 100) if total else 0
    promedio = mean(r["cumplidas"] for r in por_requisito) if por_requisito else 0

    return {
        "por_requisito": por_requisito,
        "total": total,
        "cumplen_techo": cumplen_techo,
        "porcentaje_techo": porcentaje_techo,
        "bajo_piso": bajo_piso,
        "promedio_cumplidas": promedio,
    }


def escribir_latex(metricas, output_path):
    """Genera la tabla LaTeX de conformidad individual."""
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("% Tabla generada por generar-metricas-incose.py\n")
        f.write("\\begin{longtable}{|l|c|c|l|}\n")
        f.write("\\hline\n")
        f.write("\\rowcolor{uteqverde!25}\n")
        f.write("\\textbf{ID} & \\textbf{Cumplidas /15} & \\textbf{\\%} & \\textbf{Caracter\\'isticas incumplidas}\\\\ \\hline\n")
        f.write("\\endhead\n")
        for r in metricas["por_requisito"]:
            incumplidas = ", ".join(r["no_cumplidas"]) if r["no_cumplidas"] else "---"
            f.write(f"{r['id']} & {r['cumplidas']} & {r['porcentaje']:.1f} & {incumplidas}\\\\ \\hline\n")
        f.write("\\end{longtable}\n")


def escribir_resumen(metricas, output_path):
    """Genera un RESUMEN.md ejecutivo."""
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("# RESUMEN — Métricas INCOSE v4 de calidad de requisitos\n\n")
        f.write(f"- **Total de requisitos evaluados**: {metricas['total']}\n")
        f.write(f"- **Cumplen techo (≥ {UMBRAL_INDIVIDUAL_TECHO}/15 características)**: {metricas['cumplen_techo']} ({metricas['porcentaje_techo']:.1f} %)\n")
        f.write(f"- **Bajo piso (< {UMBRAL_INDIVIDUAL_PISO}/15)**: {len(metricas['bajo_piso'])}\n")
        f.write(f"- **Promedio de características cumplidas**: {metricas['promedio_cumplidas']:.2f}/15\n\n")
        if metricas["porcentaje_techo"] >= UMBRAL_PORCENTAJE_TECHO and not metricas["bajo_piso"]:
            f.write("## Estado: **CUMPLE**\n\n")
            f.write(f"El PFC cumple con el criterio C2 de la Entrega Final: al menos el {UMBRAL_PORCENTAJE_TECHO} % de los requisitos alcanza el techo y ninguno queda bajo el piso.\n")
        else:
            f.write("## Estado: **NO CUMPLE** — se requiere corrección antes del cierre\n\n")
            if metricas["porcentaje_techo"] < UMBRAL_PORCENTAJE_TECHO:
                f.write(f"- Solo el {metricas['porcentaje_techo']:.1f} % de los requisitos cumple con ≥ {UMBRAL_INDIVIDUAL_TECHO} características. Requerido: ≥ {UMBRAL_PORCENTAJE_TECHO} %.\n")
            if metricas["bajo_piso"]:
                f.write(f"- Los siguientes requisitos están por debajo del piso ({UMBRAL_INDIVIDUAL_PISO} características):\n")
                for r in metricas["bajo_piso"]:
                    f.write(f"    - **{r['id']}**: solo {r['cumplidas']} cumplidas. Incumplidas: {', '.join(r['no_cumplidas'])}\n")
        f.write("\n---\n\n")
        f.write("## Referencia autoritativa\n\n")
        f.write("INCOSE (2023). *Guide to Writing Requirements*, INCOSE-TP-2010-006-04, v4.0. International Council on Systems Engineering.\n")


def main():
    parser = argparse.ArgumentParser(description="Metricas INCOSE v4 del PFC")
    parser.add_argument("--input", default="docs/requisitos/metricas/INCOSE-EVALUACION.csv")
    parser.add_argument("--output-dir", default="docs/requisitos/metricas/")
    args = parser.parse_args()

    if not os.path.exists(args.input):
        print(f"ERROR: no se encuentra {args.input}")
        print("Cree ese CSV con columnas: id_requisito, " + ", ".join(CARACTERISTICAS_INDIVIDUAL))
        sys.exit(1)

    os.makedirs(args.output_dir, exist_ok=True)
    filas = leer_evaluacion(args.input)
    metricas = calcular_metricas(filas)

    escribir_latex(metricas, os.path.join(args.output_dir, "INCOSE-INDIVIDUAL.tex"))
    escribir_resumen(metricas, os.path.join(args.output_dir, "RESUMEN.md"))
    print(f"Metricas calculadas para {metricas['total']} requisitos.")
    print(f"Cumplen techo: {metricas['cumplen_techo']} ({metricas['porcentaje_techo']:.1f} %)")
    print(f"Bajo piso: {len(metricas['bajo_piso'])}")


if __name__ == "__main__":
    main()
