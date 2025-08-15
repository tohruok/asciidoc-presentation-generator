# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an AsciiDoc presentation generator that creates interactive Reveal.js slides, PDF handouts, and HTML documents from a single AsciiDoc source file.

## Development Commands

### Slide Generation
```bash
# Generate all formats (slides, PDF handout, HTML document)
./build.sh

# Generate only Reveal.js slides
npm run build:slides

# Quick development - generate slides and show instructions
npm run dev
```

### Individual Format Generation
```bash
# Generate PDF handout
npm run build:pdf

# Generate HTML document
npm run build:html

# Clean output directory
npm run clean
```

### Manual Commands
```bash
# Manual slide generation
/opt/homebrew/Cellar/ruby/3.4.5/bin/asciidoctor -r asciidoctor-revealjs -b revealjs sample.adoc -o output/slides.html

# Manual PDF generation
/opt/homebrew/Cellar/ruby/3.4.5/bin/asciidoctor-pdf sample.adoc -o output/handout.pdf
```

## Dependencies

- **Ruby 3.4.5** (via Homebrew): `/opt/homebrew/Cellar/ruby/3.4.5/bin/ruby`
- **asciidoctor**: Core AsciiDoc processor
- **asciidoctor-pdf**: PDF generation from AsciiDoc
- **asciidoctor-revealjs**: Reveal.js slide generation from AsciiDoc

## File Structure

- `sample.adoc` - Presentation source file (Reveal.js format with Japanese content)
- `build.sh` - Build script for generating slides, PDF handout, and HTML document
- `output/` - Generated files
  - `slides.html` - Interactive Reveal.js presentation
  - `handout.pdf` - PDF handout version
  - `document.html` - Standard HTML document
- `package.json` - npm configuration with build scripts

## AsciiDoc Slide Features Used

- **Reveal.js backend** with `:backend: revealjs`
- **Slide transitions** and themes
- **Fragment animations** with `[.fragment]` and `[%step]`
- **Speaker notes** with `[.notes]` blocks
- **Code highlighting** with syntax highlighting
- **Tables and lists** optimized for presentation
- **Images and multimedia** support
- **Styling classes** like `[.text-center]`

## Setup Instructions

### Prerequisites
- Ruby 3.4.5+ (via Homebrew recommended)
- Node.js (for Mermaid CLI)

### Installation
```bash
# Install Ruby gems
/opt/homebrew/Cellar/ruby/3.4.5/bin/gem install asciidoctor asciidoctor-pdf asciidoctor-revealjs asciidoctor-diagram asciidoctor-diagram-plantuml asciidoctor-diagram-ditaamini

# Install Mermaid CLI
npm install -g @mermaid-js/mermaid-cli
```

### Quick Start
```bash
# Generate all formats
./build.sh

# Generate only slides
npm run build:slides

# Generate only PDF
npm run build:pdf
```

## Repository Structure

This is a complete AsciiDoc presentation system that generates:
- Interactive Reveal.js slides with diagrams
- PDF handouts with Japanese fonts
- Standard HTML documentation

All from a single `sample.adoc` source file.

## Ruby Path Configuration

The project uses Homebrew Ruby to avoid system Ruby permission issues. The build script automatically sets the correct PATH to use `/opt/homebrew/Cellar/ruby/3.4.5/bin/ruby`.