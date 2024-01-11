#!/bin/bash

# Directory containing text files
TEXT_DIR="files_to_convert_font"  # replace with your folder path

# Loop through all text files in the directory
for file in "$TEXT_DIR"/*.txt; do
    # Skip if directory is empty
    [ -e "$file" ] || continue

    # Output file name (appending '_unicode' to the filename)
    output_file="${file%.txt}_unicode.txt"

    # Convert file from Zawgyi to Unicode using Python 3
    python3 rabbit.py "$file" "$output_file"

    echo "Converted: $output_file"
done

echo "All conversions complete."
