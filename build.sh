#!/bin/bash

# CDPM Documentation Build Script
# Generates PDF files from Markdown sources

echo "Building CDPM documentation..."

# Create build directory if it doesn't exist
mkdir -p build

# Check for available PDF engines
if command -v xelatex &> /dev/null; then
    PDF_ENGINE="xelatex"
elif command -v pdflatex &> /dev/null; then
    PDF_ENGINE="pdflatex"
else
    # Use HTML intermediate with wkhtmltopdf or default engine
    PDF_ENGINE="html"
fi

echo "Using PDF engine: $PDF_ENGINE"

# Build CDPM Whitepaper
echo "- Building CDPM Whitepaper PDF..."
if [ "$PDF_ENGINE" = "html" ]; then
    pandoc docs/CDPM-Whitepaper.md \
      -o build/CDPM-Whitepaper.pdf \
      --toc \
      --toc-depth=3 \
      -V geometry:margin=1in \
      -V colorlinks=true
else
    pandoc docs/CDPM-Whitepaper.md \
      -o build/CDPM-Whitepaper.pdf \
      --pdf-engine=$PDF_ENGINE \
      --template=templates/cdpm-template.tex \
      --toc \
      --toc-depth=3 \
      -V title="Context-Driven Project Management (CDPM)" \
      -V author="Simon Schwer" \
      -V date="$(date +%Y-%m-%d)"
fi

# Build CDPM Glossar
echo "- Building CDPM Glossar PDF..."
if [ "$PDF_ENGINE" = "html" ]; then
    pandoc docs/CDPM-Glossar.md \
      -o build/CDPM-Glossar.pdf \
      -V geometry:margin=1in \
      -V colorlinks=true
else
    pandoc docs/CDPM-Glossar.md \
      -o build/CDPM-Glossar.pdf \
      --pdf-engine=$PDF_ENGINE \
      --template=templates/cdpm-template.tex \
      -V title="CDPM Glossar" \
      -V author="Simon Schwer" \
      -V date="$(date +%Y-%m-%d)"
fi

# Build CDPM Toolkit
echo "- Building CDPM Toolkit PDF..."
if [ "$PDF_ENGINE" = "html" ]; then
    pandoc docs/CDPM-Toolkit.md \
      -o build/CDPM-Toolkit.pdf \
      -V geometry:margin=1in \
      -V colorlinks=true
else
    pandoc docs/CDPM-Toolkit.md \
      -o build/CDPM-Toolkit.pdf \
      --pdf-engine=$PDF_ENGINE \
      --template=templates/cdpm-template.tex \
      -V title="CDPM Toolkit" \
      -V author="Simon Schwer" \
      -V date="$(date +%Y-%m-%d)"
fi

echo "Build complete! PDFs are in the build/ directory."