#!/usr/bin/env python3
"""
analisis-encuesta.py

Analiza las respuestas crudas de la encuesta a usuarios finales del PFC.
Genera graficos vectoriales reproducibles (PNG y SVG) y un resumen ejecutivo
en Markdown.

Uso:
    python3 analisis-encuesta.py \
        --input docs/requisitos/elicitacion/encuestas/respuestas-crudas.csv \
        --output docs/requisitos/elicitacion/encuestas/graficos/

Requisitos:
    pip install pandas matplotlib

Autor: <equipo del PFC>
Basado en: metodologia del proyecto modelo (Toaquiza et al., 2025).
Referencia: Kitchenham & Pfleeger (2008), Personal Opinion Surveys.
"""

import argparse
import csv
import os
import sys
from collections import Counter

try:
    import pandas as pd
    import matplotlib.pyplot as plt
except ImportError:
    print("ERROR: se requieren pandas y matplotlib. Instale con:")
    print("    pip install pandas matplotlib")
    sys.exit(1)


def load_data(csv_path):
    """Carga las respuestas crudas y anonimiza en memoria."""
    if not os.path.exists(csv_path):
        raise FileNotFoundError(f"No se encontro {csv_path}")
    df = pd.read_csv(csv_path)
    columnas_pii = [c for c in df.columns
                    if any(k in c.lower() for k in ["email", "correo", "nombre", "cedula", "ip"])]
    df = df.drop(columns=columnas_pii, errors="ignore")
    print(f"Cargadas {len(df)} respuestas, {len(df.columns)} columnas (PII eliminada: {columnas_pii})")
    return df


def graficar_categorica(df, columna, titulo, output_dir, tipo="barra"):
    """Grafica una pregunta categorica como barra o pastel."""
    conteo = df[columna].value_counts()
    fig, ax = plt.subplots(figsize=(8, 5))
    if tipo == "pastel":
        ax.pie(conteo.values, labels=conteo.index, autopct="%1.1f%%", startangle=90)
        ax.axis("equal")
    else:
        conteo.plot(kind="bar", ax=ax, color="#006633")
        ax.set_ylabel("Numero de respuestas")
        ax.set_xlabel("")
        plt.xticks(rotation=30, ha="right")
    ax.set_title(titulo)
    fig.tight_layout()
    slug = columna.lower().replace(" ", "_").replace("?", "").replace("¿", "")[:40]
    fig.savefig(os.path.join(output_dir, f"{slug}.png"), dpi=150)
    fig.savefig(os.path.join(output_dir, f"{slug}.svg"))
    plt.close(fig)
    return conteo


def graficar_multiple(df, columna, titulo, output_dir, separador=";"):
    """Grafica preguntas de seleccion multiple, separadas por ';'."""
    todas = []
    for respuesta in df[columna].dropna():
        opciones = [o.strip() for o in str(respuesta).split(separador)]
        todas.extend(opciones)
    conteo = Counter(todas)
    fig, ax = plt.subplots(figsize=(9, 5))
    labels = list(conteo.keys())
    values = list(conteo.values())
    ax.barh(labels, values, color="#CC9900")
    ax.set_xlabel("Numero de respuestas (n multiple)")
    ax.set_title(titulo)
    fig.tight_layout()
    slug = columna.lower().replace(" ", "_").replace("?", "").replace("¿", "")[:40]
    fig.savefig(os.path.join(output_dir, f"{slug}.png"), dpi=150)
    fig.savefig(os.path.join(output_dir, f"{slug}.svg"))
    plt.close(fig)
    return conteo


def generar_resumen_ejecutivo(df, resultados, output_path):
    """Genera un RESUMEN-ENCUESTA.md con los hallazgos principales."""
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("# RESUMEN EJECUTIVO — Encuesta a usuarios finales\n\n")
        f.write(f"- **Fecha de análisis**: {pd.Timestamp.today().date()}\n")
        f.write(f"- **Total de respuestas válidas**: {len(df)}\n")
        f.write("- **Fuente**: `respuestas-crudas.csv`\n")
        f.write("- **Script de análisis**: `scripts/analisis-encuesta.py` (reproducible)\n\n")
        f.write("## Hallazgos por pregunta\n\n")
        for pregunta, conteo in resultados.items():
            f.write(f"### {pregunta}\n\n")
            total = sum(conteo.values())
            for opcion, n in conteo.most_common():
                pct = (n / total) * 100 if total else 0
                f.write(f"- **{opcion}**: {n} ({pct:.1f}%)\n")
            f.write("\n")
        f.write("## Notas metodológicas\n\n")
        f.write("- Toda información personalmente identificable (correo, nombre, cédula, IP) fue eliminada antes del análisis.\n")
        f.write("- Las preguntas abiertas requieren codificación abierta manual y no aparecen en este resumen automático.\n")
        f.write("- Los gráficos generados están en la carpeta `graficos/` en formato PNG y SVG.\n")
    print(f"Resumen ejecutivo escrito en {output_path}")


def main():
    parser = argparse.ArgumentParser(description="Analisis de encuesta del PFC")
    parser.add_argument("--input", required=True, help="Ruta al CSV de respuestas crudas")
    parser.add_argument("--output", required=True, help="Carpeta de salida para graficos")
    args = parser.parse_args()

    os.makedirs(args.output, exist_ok=True)
    df = load_data(args.input)

    # Analisis automatico: cada columna categorica se grafica.
    # Adaptar segun las columnas reales de la encuesta.
    resultados = {}
    for columna in df.columns:
        if df[columna].dtype == "object":
            if df[columna].str.contains(";", na=False).any():
                resultados[columna] = graficar_multiple(df, columna, columna, args.output)
            else:
                if df[columna].nunique() <= 6:
                    resultados[columna] = graficar_categorica(df, columna, columna, args.output)

    resumen_path = os.path.join(os.path.dirname(args.output.rstrip("/")), "RESUMEN-ENCUESTA.md")
    generar_resumen_ejecutivo(df, resultados, resumen_path)


if __name__ == "__main__":
    main()
