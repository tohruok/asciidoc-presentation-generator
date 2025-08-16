#!/bin/bash

# AsciiDoc Slide Build Script

# Create output directory if it doesn't exist
mkdir -p output

# Set Ruby path to use Homebrew Ruby
export PATH="/opt/homebrew/Cellar/ruby/3.4.5/bin:$PATH"

# Check if asciidoctor-revealjs is available
if ! command -v asciidoctor &> /dev/null; then
    echo "Error: asciidoctor not found. Please install it first."
    echo "Run: /opt/homebrew/Cellar/ruby/3.4.5/bin/gem install asciidoctor asciidoctor-revealjs"
    exit 1
fi

# Generate Reveal.js slides from AsciiDoc
echo "Generating Reveal.js slides from sample.adoc..."
cp -p themes/*.css output
cp -p logo.svg output
asciidoctor -r asciidoctor-revealjs -r asciidoctor-diagram -b revealjs -a allow-uri-read sample.adoc -o output/slides.html

if [ $? -eq 0 ]; then
    echo "✅ Slides generated successfully: output/slides.html"
    echo "   Open in browser to view the presentation"
else
    echo "❌ Slide generation failed"
    exit 1
fi

# Generate PDF from AsciiDoc (for handouts)
echo "Generating PDF handout from sample.adoc..."
asciidoctor-pdf -r asciidoctor-diagram -a pdf-theme=japanese -a pdf-themesdir=themes -a allow-uri-read sample.adoc -o output/handout.pdf

if [ $? -eq 0 ]; then
    echo "✅ PDF handout generated successfully: output/handout.pdf"
else
    echo "⚠️  PDF handout generation failed"
fi


echo "Build complete!"
echo ""
echo "Generated files:"
echo "  📊 output/slides.html    - Reveal.js presentation (open in browser)"
echo "  📄 output/handout.pdf    - PDF handout"
