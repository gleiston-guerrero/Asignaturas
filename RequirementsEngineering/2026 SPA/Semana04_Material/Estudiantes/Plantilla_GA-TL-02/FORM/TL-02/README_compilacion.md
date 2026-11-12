# FORM/TL-02 · Instrucciones de compilación

Copie esta sección en el `README.md` de la raíz del repositorio.

- Compilador: pdfLaTeX (MiKTeX o TeX Live) con biber.
- Archivo principal: `FORM/TL-02/main.tex`
- Orden de comandos (desde la carpeta `FORM/TL-02`):
  1. `pdflatex main`
  2. `biber main`
  3. `pdflatex main`
  4. `pdflatex main`
- Dependencias: paquetes `babel` (spanish), `biblatex` con estilo `ieee` (paquete `biblatex-ieee`), `csquotes`, `tikz`, `longtable`, `helvet`, `mathptmx`, `courier`. MiKTeX los instala automáticamente la primera vez.
