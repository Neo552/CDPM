CDPM bundled fonts directory
============================

This folder holds the exact font binaries used for PDF builds to ensure byte-identical styling across local and CI builds.

Included by the build script via `templates/cdpm-template.tex` (LaTeX) and `templates/cdpm.css` (HTML fallback):
- Source Serif 4 (variable upright + italic)
- Source Sans 3 (variable upright + italic)
- Source Code Pro (variable upright + italic)

How to populate
- Automatically: `./build.sh` calls `scripts/fetch-fonts.sh` which downloads the above from the Google Fonts repo.
- Manually: place the files with the exact names below:
  - `SourceSerif4[wght].ttf`, `SourceSerif4-Italic[wght].ttf`
  - `SourceSans3[wght].ttf`, `SourceSans3-Italic[wght].ttf`
  - `SourceCodePro[wght].ttf`, `SourceCodePro-Italic[wght].ttf`

License
The fonts are licensed under the SIL Open Font License (OFL). See the upstream font repositories for details.

