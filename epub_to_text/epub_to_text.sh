#!/bin/bash

# Directory containing EPUB files
EPUB_DIR="epub"  # replace with your EPUB folder path

# Function to check if Homebrew is installed
check_homebrew() {
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Please install Homebrew."
        exit 1
    fi
}

# Check if Calibre's ebook-convert command is available
if ! command -v ebook-convert &> /dev/null; then
    echo "ebook-convert could not be found. Attempting to install Calibre using Homebrew..."
    check_homebrew
    brew install calibre
fi

# Loop through all EPUB files in the directory
for epub_file in "$EPUB_DIR"/*.epub; do
    # Skip if directory is empty
    [ -e "$epub_file" ] || continue

    # Output TXT file name
    txt_file="${epub_file%.*}.txt"

    # Convert EPUB to TXT
    ebook-convert "$epub_file" "$txt_file" --txt-output-encoding=utf8

    echo "Converted: $txt_file"
done

echo "All conversions complete."
