# Context-Driven Project Management (CDPM)

Transform projects context-centrically with Artificial Intelligence

## What is CDPM?

CDPM is a meta-framework for modern project management that establishes the **project context as the Single Source of Truth**. It makes projects AI-ready and combines classic predictability with agile adaptability.

## Core Principle

```
Context → Analysis → Guidance → Updates → Context*
```

*Rolling, SSOT-driven cycle

## Key Features

- **Living Project Context**: Complete, current project truth with goals, scope, budget, timeline, risks, and action items
- **AI-Native Design**: Structured data foundation that maximizes AI value in project management
- **Holistic Project Triad**: Time-Budget-Scope effects visible in every decision
- **Atomic Distillation**: Complex updates broken down into individually validatable effects

## Quick Start

1. Create base context (Goals, Scope, Timeline, Budget)
2. Implement AI connection
3. Run first analysis
4. Establish distillation channels
5. Introduce Daily Distillation Window

## Documentation

- German (DE)
  - [CDPM Whitepaper](docs/DE/CDPM-Whitepaper.md) – Vollständige Framework-Beschreibung
  - [CDPM Glossar](docs/DE/CDPM-Glossar.md) – Begriffe und Konzepte
  - [CDPM Toolkit](docs/DE/CDPM-Toolkit.md) – Checklisten & Vorlagen

- English (EN)
  - [CDPM Whitepaper](docs/EN/CDPM-Whitepaper.md) – Complete framework description
  - [CDPM Glossary](docs/EN/CDPM-Glossary.md) – Term definitions
  - [CDPM Toolkit](docs/EN/CDPM-Toolkit.md) – Checklists & templates

## Community & Contributors

- Website: [contextdrivenpm.org](https://contextdrivenpm.org)
- Contact: contact@contextdrivenpm.org
- Authors & Contributors: See [AUTHORS.md](AUTHORS.md)

## Development

### Prerequisites

To build the documentation locally, you need:

- **Pandoc**: Document converter
  ```bash
  brew install pandoc
  ```

- **LaTeX** (for PDF generation with proper fonts):
  ```bash
  # Option 1: BasicTeX (smaller, ~100MB)
  brew install --cask basictex
  
  # Option 2: Full MacTeX (complete, ~4GB)
  brew install --cask mactex
  ```

After installing LaTeX, restart your terminal or run:
```bash
eval "$(/usr/libexec/path_helper)"
```

- **Fonts**: Install Source Sans 3 and Source Serif 4 (used for headings and body text)
  ```bash
  brew tap homebrew/cask-fonts
  brew install --cask font-source-sans-3
  brew install --cask font-source-serif-4
  ```
  And for code blocks (matching Source family):
  ```bash
  brew install --cask font-source-code-pro
  ```

Notes:
- The LaTeX build uses XeLaTeX/LuaLaTeX to load system fonts via `fontspec`. If only `pdflatex` is available, font loading will fail — install XeLaTeX (via MacTeX/BasicTeX) for best results.
- If LaTeX engines are unavailable, the build falls back to an HTML→PDF path (`wkhtmltopdf` if installed) with a CSS stylesheet that requests the same fonts from your system. Embedding depends on local font availability.

### Building Documentation

Generate PDFs from Markdown sources:
```bash
./build.sh
```

The PDFs will be created in the `build/` directory.

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## License

This work is licensed under CC BY 4.0 - see [LICENSE](LICENSE) for details.

© 2025 Simon Schwer

## Trademarks

"CDPM" and "Guardian of Context" are trademarks of Simon Schwer (protection pending in Germany).
Usage according to CDPM usage guidelines: contextdrivenpm.org/license
