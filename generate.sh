#!/bin/bash

# Generate PDF from resume.tex using MacTeX
echo "🚀 Compiling resume.tex to PDF..."

# Check if pdflatex is available
if ! command -v pdflatex &> /dev/null; then
    echo "❌ pdflatex not found. Please install MacTeX first:"
    echo "   brew install --cask mactex"
    exit 1
fi

# Compile the LaTeX document
pdflatex -interaction=nonstopmode resume.tex

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "✅ PDF generated successfully: resume.pdf"
    
    # Clean up auxiliary files
    echo "🧹 Cleaning up auxiliary files..."
    rm -f *.aux *.log *.out *.fdb_latexmk *.fls *.synctex.gz
    
    # Open the PDF if on macOS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "📖 Opening PDF..."
        open resume.pdf
    fi
else
    echo "❌ Compilation failed. Check the LaTeX errors above."
    exit 1
fi 