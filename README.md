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
- **Atomic Destillation**: Complex updates broken down into individually validatable effects

## Quick Start

1. Create base context (Goals, Scope, Timeline, Budget)
2. Implement AI connection
3. Run first analysis
4. Establish destillation channels
5. Introduce Daily Destillation Window

## Documentation

- [CDPM Whitepaper](docs/CDPM-Whitepaper.md) - Complete framework description
- [CDPM Glossary](docs/CDPM-Glossar.md) - Term definitions (German)
- [CDPM Toolkit](docs/CDPM-Toolkit.md) - Practical tools (German)

## Community

- Website: [contextdrivenpm.org](https://contextdrivenpm.org)
- Contact: contact@contextdrivenpm.org

## Development

### Prerequisites

To build the documentation locally, you need:

- **Pandoc**: Document converter
  ```bash
  brew install pandoc
  ```

- **LaTeX** (for PDF generation):
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