# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Japanese-language AsciiDoc presentation generator that creates multiple output formats from a single source file:
- Interactive Reveal.js slides with custom CSS theming
- PDF handouts with Japanese font support (landscape A4)
- Diagram integration (Mermaid, PlantUML, Ditaa)

## Development Commands

### Primary Build Commands
```bash
# Generate all formats (recommended)
./build.sh

# Development workflow - slides only with instructions
npm run dev

# Individual formats
npm run build:slides    # Reveal.js slides only
npm run build:pdf       # PDF handout only
npm run clean          # Clean output directory
```

### Manual Ruby Commands
```bash
# Direct asciidoctor commands (when npm scripts fail)
/opt/homebrew/Cellar/ruby/3.4.5/bin/asciidoctor -r asciidoctor-revealjs -r asciidoctor-diagram -b revealjs -a allow-uri-read sample.adoc -o output/slides.html

/opt/homebrew/Cellar/ruby/3.4.5/bin/asciidoctor-pdf -r asciidoctor-diagram -a pdf-theme=japanese -a pdf-themesdir=themes -a allow-uri-read sample.adoc -o output/handout.pdf
```

## Architecture

### Build System
- **build.sh**: Main build orchestrator with error handling and status reporting
- **package.json**: npm wrapper scripts for convenience
- **Path management**: Uses Homebrew Ruby (`/opt/homebrew/Cellar/ruby/3.4.5/bin`) to avoid system Ruby permission issues

### Content Source
- **sample.adoc**: Single source file containing Japanese presentation content
- Uses Reveal.js-specific AsciiDoc syntax with fragment animations and speaker notes
- Configured for both slide and PDF output formats via document attributes

### Theming System
- **themes/custom.css**: Reveal.js slide styling (copied to output/)
- **themes/japanese-theme.yml**: PDF theme with Hiragino font configuration for Japanese text
- **docinfo-footer-revealjs.html**: Custom Reveal.js footer injection

### Output Management
- **output/**: Generated files directory (gitignored)
- CSS files copied during build for proper slide theming
- Diagram cache handled by asciidoctor-diagram extension

## Key Dependencies

- **Ruby 3.4.5** (Homebrew): `/opt/homebrew/Cellar/ruby/3.4.5/bin/ruby`
- **asciidoctor-revealjs**: Slide generation backend
- **asciidoctor-pdf**: PDF generation with Japanese theme support
- **asciidoctor-diagram**: Mermaid, PlantUML, Ditaa diagram support

## Setup Requirements

```bash
# Ruby gems (use Homebrew Ruby path)
/opt/homebrew/Cellar/ruby/3.4.5/bin/gem install asciidoctor asciidoctor-pdf asciidoctor-revealjs asciidoctor-diagram asciidoctor-diagram-plantuml asciidoctor-diagram-ditaamini

# Optional: Mermaid CLI for advanced diagrams
npm install -g @mermaid-js/mermaid-cli
```

## Japanese Font Configuration

The PDF output uses system Hiragino fonts configured in `themes/japanese-theme.yml`:
- **HiraginoKakuGothic**: Primary sans-serif font
- **HiraginoMincho**: Serif font option
- **Landscape A4**: Optimized for handout printing
- **Chapter breaks**: H2 headings trigger page breaks