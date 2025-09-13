#!/usr/bin/env bash
set -euo pipefail

# Fetch exact CDPM font binaries into static/fonts/
# - Source Serif 4 (variable upright + italic)
# - Source Sans 3 (variable upright + italic)
# - Source Code Pro (variable upright + italic)

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
FONT_DIR="$ROOT_DIR/static/fonts"
mkdir -p "$FONT_DIR"

download() {
  local url="$1"
  local out="$2"
  if [ -f "$out" ]; then
    echo "Already present: $(basename "$out")"
    return 0
  fi
  echo "Downloading $(basename "$out") ..."
  # --globoff prevents curl from interpreting [wght] as a range pattern
  curl -L --globoff --fail --retry 3 --connect-timeout 10 "$url" -o "$out"
}

# Try multiple candidate URLs and save to canonical output name
download_try() {
  local out="$1"; shift
  local tmp
  tmp="${out}.part"
  for url in "$@"; do
    echo "Trying $url"
    if curl -L --globoff --fail --retry 3 --connect-timeout 10 "$url" -o "$tmp"; then
      mv "$tmp" "$out"
      echo "Saved $(basename "$out")"
      return 0
    else
      echo "  -> failed"
    fi
  done
  rm -f "$tmp" 2>/dev/null || true
  echo "All sources failed for $(basename "$out")" >&2
  return 1
}

# Google Fonts raw URLs
# Source Serif 4 (upright + italic)
download_try "$FONT_DIR/SourceSerif4[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourceserif4/SourceSerif4[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourceserif4/SourceSerif4-VariableFont_opsz,wght.ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourceserif4/SourceSerif4-VariableFont_wght.ttf"

download_try "$FONT_DIR/SourceSerif4-Italic[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourceserif4/SourceSerif4-Italic[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourceserif4/SourceSerif4-Italic-VariableFont_opsz,wght.ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourceserif4/SourceSerif4-Italic-VariableFont_wght.ttf"

# Source Sans 3 (upright + italic)
download_try "$FONT_DIR/SourceSans3[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourcesans3/SourceSans3[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourcesans3/SourceSans3-VariableFont_wght.ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourcesans3/SourceSans3-VariableFont_wdth,wght.ttf"

download_try "$FONT_DIR/SourceSans3-Italic[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourcesans3/SourceSans3-Italic[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourcesans3/SourceSans3-Italic-VariableFont_wght.ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourcesans3/SourceSans3-Italic-VariableFont_wdth,wght.ttf"

# Source Code Pro (upright + italic)
download_try "$FONT_DIR/SourceCodePro[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourcecodepro/SourceCodePro[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourcecodepro/SourceCodePro-VariableFont_wght.ttf"

download_try "$FONT_DIR/SourceCodePro-Italic[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourcecodepro/SourceCodePro-Italic[wght].ttf" \
  "https://github.com/google/fonts/raw/main/ofl/sourcecodepro/SourceCodePro-Italic-VariableFont_wght.ttf"

echo "Fonts are ready in: $FONT_DIR"
