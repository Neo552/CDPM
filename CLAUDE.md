# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

CDPM (Context-Driven Project Management) is a meta-framework for modern project management that establishes the project context as the Single Source of Truth. It makes projects AI-ready and combines classic predictability with agile adaptability.

## Key Commands

### Build Documentation
Generate PDFs from Markdown documentation:
```bash
./build.sh
```
The PDFs will be created in the `build/` directory.

### Prerequisites Installation
Before building, ensure you have the necessary tools:
```bash
# Install Pandoc
brew install pandoc

# Install LaTeX (choose one)
brew install --cask basictex  # Smaller (~100MB)
brew install --cask mactex    # Full (~4GB)

# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-source-sans-3
brew install --cask font-source-serif-4
brew install --cask font-source-code-pro
```

## Architecture & Structure

### Documentation Organization
The project uses a bilingual documentation structure:
- `docs/DE/` - German documentation (primary language)
- `docs/EN/` - English documentation 
- Main documents: CDPM-Whitepaper, CDPM-Glossar/Glossary, CDPM-Toolkit

### Build System
- **Primary Script**: `build.sh` - Intelligent PDF generation with fallback options
- **Engines**: Prefers LuaLaTeX/XeLaTeX for proper font handling, falls back to HTML-based generation
- **Templates**: Located in `templates/` directory
  - `cdpm-template.tex` - LaTeX template for PDF generation
  - `cdpm.css` - CSS for HTML fallback
  - `icons.lua`, `unicode-fallback.lua` - Lua filters for Pandoc processing

### GitHub Actions
Automated PDF building on push/PR to main branch and releases (`/.github/workflows/build-pdfs.yml`)

## Important Context

### Document Processing
- The build system uses Pandoc with custom templates for professional PDF output
- Documents support YAML metadata blocks for title, author, version info
- Resource path includes `.:docs:static:static/media` for images and assets
- Line spacing defaults to 1.4 for readability

### Trademarks
"CDPM" and "Guardian of Context" are trademarks of Simon Schwer (protection pending in Germany)

### Contribution Guidelines
- Framework development focuses on methodology enhancements and real-world patterns
- Case studies and experience reports are highly valued
- Documentation should maintain consistent terminology (refer to CDPM-Glossar)
- All contributions fall under CC BY 4.0 license