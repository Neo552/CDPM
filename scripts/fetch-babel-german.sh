#!/usr/bin/env bash
set -euo pipefail

# Fetch German babel support if missing
# This is a fallback for systems without texlive-lang-german

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TEXMF_DIR="$ROOT_DIR/texmf-local"
BABEL_DIR="$TEXMF_DIR/tex/generic/babel-german"

# Check if ngerman.ldf already exists in system
if kpsewhich ngerman.ldf >/dev/null 2>&1; then
  echo "German babel support already installed in system"
  exit 0
fi

# Create local texmf directory
mkdir -p "$BABEL_DIR"

echo "Downloading German babel support..."

# Download babel-german package from CTAN
echo "Downloading complete babel-german package..."

# Download the entire babel-german zip package
BABEL_ZIP="$TEXMF_DIR/babel-german.zip"
curl -L --fail --retry 3 \
  "https://www.ctan.org/tex-archive/macros/latex/contrib/babel-contrib/german.zip" \
  -o "$BABEL_ZIP" 2>/dev/null || \
curl -L --fail --retry 3 \
  "https://mirror.ctan.org/macros/latex/contrib/babel-contrib/german.zip" \
  -o "$BABEL_ZIP" 2>/dev/null || {
  echo "Trying alternative: downloading from GitHub mirror..."
  # Alternative: Get files from TeX Live repository
  for file in ngerman.ldf naustrian.ldf german.ldf germanb.ldf; do
    curl -L --fail \
      "https://raw.githubusercontent.com/TeX-Live/texlive-source/trunk/texmf-dist/tex/generic/babel-german/$file" \
      -o "$BABEL_DIR/$file" 2>/dev/null || \
    curl -L --fail \
      "https://raw.githubusercontent.com/latex3/babel/master/locale/de/babel-de.ini" \
      -o "$BABEL_DIR/german.ldf" 2>/dev/null || {
        echo "Warning: Could not download $file"
      }
  done
  exit 0
}

# Extract if zip was downloaded
if [ -f "$BABEL_ZIP" ]; then
  unzip -q -o "$BABEL_ZIP" -d "$BABEL_DIR" 2>/dev/null || {
    echo "Failed to extract babel-german.zip"
    exit 1
  }
  rm "$BABEL_ZIP"
  echo "German babel support extracted successfully"
fi

# Set TEXMFHOME environment variable for the build
export TEXMFHOME="$TEXMF_DIR"
echo "German babel support downloaded to: $BABEL_DIR"
echo "Set TEXMFHOME=$TEXMF_DIR before building"