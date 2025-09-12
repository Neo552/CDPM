#!/bin/bash

# CDPM Documentation Build Script
# Generates PDF files from Markdown sources

echo "Building CDPM documentation..."

# Create build directory if it doesn't exist
mkdir -p build

# Build CDPM Whitepaper
echo "- Building CDPM Whitepaper PDF..."
pandoc docs/CDPM-Whitepaper.md \
  -o build/CDPM-Whitepaper.pdf \
  --pdf-engine=xelatex \
  --toc \
  --toc-depth=3 \
  -V geometry:margin=1in \
  -V documentclass=report \
  -V colorlinks=true \
  -V linkcolor=blue \
  -V urlcolor=blue

# Build CDPM Glossar
echo "- Building CDPM Glossar PDF..."
pandoc docs/CDPM-Glossar.md \
  -o build/CDPM-Glossar.pdf \
  --pdf-engine=xelatex \
  -V geometry:margin=1in \
  -V colorlinks=true

# Build CDPM Toolkit
echo "- Building CDPM Toolkit PDF..."
pandoc docs/CDPM-Toolkit.md \
  -o build/CDPM-Toolkit.pdf \
  --pdf-engine=xelatex \
  -V geometry:margin=1in \
  -V colorlinks=true

echo "Build complete! PDFs are in the build/ directory."