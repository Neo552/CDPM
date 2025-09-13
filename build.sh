#!/bin/bash
set -euo pipefail

# CDPM Documentation Build Script
# Generates PDF files from Markdown sources

echo "Building CDPM documentation..."

# Create build directory if it doesn't exist
mkdir -p build

# Check for available PDF engines (prefer modern engines for fontspec)
if command -v lualatex &> /dev/null; then
    PDF_ENGINE="lualatex"
elif command -v xelatex &> /dev/null; then
    PDF_ENGINE="xelatex"
elif command -v wkhtmltopdf &> /dev/null; then
    # HTML path using wkhtmltopdf with CSS fallback
    PDF_ENGINE="html-wkhtml"
else
    # Basic HTML-to-PDF fallback (may not embed fonts reliably)
    PDF_ENGINE="html"
fi

echo "Using PDF engine: $PDF_ENGINE"

# Document meta defaults
LINE_SPACING=${LINE_SPACING:-1.4}  # 1.4 by default
VERSION=${VERSION:-v1.0}
DOC_LANG=${DOC_LANG:-DE}  # Changed from LANG to DOC_LANG to avoid conflict
DOC_DATE=${DOC_DATE:-$(date +%Y-%m-%d)}

# Ensure exact fonts are present (optional; skipped if curl missing)
if command -v curl &> /dev/null; then
  echo "Fetching precise CDPM fonts (if missing)..."
  bash ./scripts/fetch-fonts.sh || echo "Font fetch skipped/failed; using system fonts if available."
else
  echo "curl not found; skipping font fetch. Assuming fonts exist in static/fonts or system."
fi

build_with_engine() {
  local input_md=$1
  local output_pdf=$2
  shift 2
  local extra_args=("$@")

  case "$PDF_ENGINE" in
    xelatex|lualatex)
      # Direct PDF generation via pandoc with LaTeX engine
      pandoc -f markdown+yaml_metadata_block+smart "$input_md" \
        -o "$output_pdf" \
        --pdf-engine="$PDF_ENGINE" \
        --template=templates/cdpm-template.tex \
        --lua-filter=templates/icons.lua \
        --lua-filter=templates/unicode-fallback.lua \
        --resource-path=.:docs:static:static/media \
        -V author="Simon Schwer" \
        -V date="$DOC_DATE" \
        -V version="$VERSION" \
        -V lang="$DOC_LANG" \
        -V linestretch=$LINE_SPACING \
        "${extra_args[@]}"
      ;;
    html-wkhtml)
      pandoc -f markdown+yaml_metadata_block+smart "$input_md" \
        -o "$output_pdf" \
        --pdf-engine=wkhtmltopdf \
        --toc \
        --toc-depth=2 \
        --css=templates/cdpm.css \
        --lua-filter=templates/icons.lua \
        --lua-filter=templates/unicode-fallback.lua \
        --resource-path=.:docs:static:static/media \
        -V margin-left=1.3in \
        -V margin-right=1.3in \
        -V margin-top=1in \
        -V margin-bottom=1in \
        "${extra_args[@]}"
      ;;
    html)
      echo "Warning: No LaTeX engine or wkhtmltopdf found. Falling back to basic HTML PDF. Fonts may not embed; install XeLaTeX for best results." >&2
      pandoc -f markdown+yaml_metadata_block+smart "$input_md" \
        -o "$output_pdf" \
        --toc \
        --toc-depth=2 \
        --lua-filter=templates/icons.lua \
        --lua-filter=templates/unicode-fallback.lua \
        --resource-path=.:docs:static:static/media \
        --css=templates/cdpm.css \
        "${extra_args[@]}"
      ;;
  esac
}

# Build CDPM Whitepaper
echo "- Building CDPM PDFs for DE and EN..."

# Build German (DE)
DOC_LANG=DE
echo "  · DE: Whitepaper"
build_with_engine docs/DE/CDPM-Whitepaper.md build/CDPM-Whitepaper-DE.pdf \
  -V docname="CDPM-Whitepaper" \
  -V coverimage="image1.png" \
  -V cover_height=0.35\\paperheight \
  -V title_top=2.0cm \
  -V after_cover_space=0.5cm \
  -V title_metadata_gap=0.6cm

echo "  · DE: Glossar"
build_with_engine docs/DE/CDPM-Glossar.md build/CDPM-Glossar-DE.pdf \
  -V docname="CDPM-Glossar"

echo "  · DE: Toolkit"
build_with_engine docs/DE/CDPM-Toolkit.md build/CDPM-Toolkit-DE.pdf \
  -V docname="CDPM-Toolkit"

# Build English (EN)
DOC_LANG=EN
echo "  · EN: Whitepaper"
build_with_engine docs/EN/CDPM-Whitepaper.md build/CDPM-Whitepaper-EN.pdf \
  -V docname="CDPM-Whitepaper" \
  -V coverimage="image1.png" \
  -V cover_height=0.35\\paperheight \
  -V title_top=2.0cm \
  -V after_cover_space=0.5cm \
  -V title_metadata_gap=0.6cm

echo "  · EN: Glossary"
build_with_engine docs/EN/CDPM-Glossary.md build/CDPM-Glossary-EN.pdf \
  -V docname="CDPM-Glossary"

echo "  · EN: Toolkit"
build_with_engine docs/EN/CDPM-Toolkit.md build/CDPM-Toolkit-EN.pdf \
  -V docname="CDPM-Toolkit"

echo "Build complete! PDFs are in the build/ directory."
