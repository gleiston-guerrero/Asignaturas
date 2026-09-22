#!/usr/bin/env bash
# =====================================================================
#  verificar-citas.sh
#  Verifica que todas las citas usadas en los .tex resuelvan a entradas
#  existentes en la bibliografia IngReq.bib.
#
#  Uso:
#      bash scripts/verificar-citas.sh
#
#  Salidas:
#      docs/entregas/citas-usadas.txt   - lista de claves \cite{...} usadas
#      docs/entregas/entradas-bib.txt   - lista de claves @tipo{clave,...} en el .bib
#      docs/entregas/sin-entrada.txt    - citas sin entrada en el .bib (deben ser 0)
#      docs/entregas/no-citadas.txt     - entradas del .bib no usadas (advertencia)
#
#  Codigo de salida:
#      0  -> todas las citas resuelven
#      1  -> hay citas sin entrada en el .bib (fallo del build)
# =====================================================================

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENTREGAS_DIR="${REPO_ROOT}/docs/entregas"
BIB_FILE="${ENTREGAS_DIR}/IngReq.bib"

cd "${ENTREGAS_DIR}"

if [ ! -f "${BIB_FILE}" ]; then
    echo "ERROR: no se encuentra ${BIB_FILE}"
    exit 1
fi

# Extrae todas las claves \cite{...} de los .tex
grep -h -oE '\\cite\{[^}]+\}' *.tex 2>/dev/null \
    | grep -oE '\{[^}]+\}' \
    | tr -d '{}' \
    | tr ',' '\n' \
    | sed 's/^ *//;s/ *$//' \
    | sort -u > citas-usadas.txt

# Extrae todas las claves de las entradas del .bib
grep -E '^@[a-zA-Z]+\{' "${BIB_FILE}" \
    | sed -E 's/^@[a-zA-Z]+\{([^,]+),.*/\1/' \
    | sort -u > entradas-bib.txt

# Encuentra citas sin entrada
comm -23 citas-usadas.txt entradas-bib.txt > sin-entrada.txt

# Encuentra entradas no citadas (advertencia)
comm -13 citas-usadas.txt entradas-bib.txt > no-citadas.txt

n_citas=$(wc -l < citas-usadas.txt)
n_entradas=$(wc -l < entradas-bib.txt)
n_sin_entrada=$(wc -l < sin-entrada.txt)
n_no_citadas=$(wc -l < no-citadas.txt)

echo "==========================================="
echo "  Verificacion de bibliografia"
echo "==========================================="
echo "  Citas usadas en .tex        : ${n_citas}"
echo "  Entradas en IngReq.bib      : ${n_entradas}"
echo "  Citas sin entrada           : ${n_sin_entrada}"
echo "  Entradas no citadas         : ${n_no_citadas}"
echo "==========================================="

if [ "${n_sin_entrada}" -gt 0 ]; then
    echo ""
    echo "ERROR: existen citas sin entrada en la bibliografia:"
    cat sin-entrada.txt | sed 's/^/  - /'
    echo ""
    echo "Corrija anadiendo las entradas correspondientes a IngReq.bib."
    exit 1
fi

if [ "${n_no_citadas}" -gt 0 ]; then
    echo ""
    echo "AVISO: hay ${n_no_citadas} entradas en el .bib no citadas (no bloqueante):"
    cat no-citadas.txt | sed 's/^/  * /' | head -20
fi

echo ""
echo "OK: todas las citas resuelven correctamente."
exit 0
