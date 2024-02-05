#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Set the TESSDATA_PREFIX to the tessdata directory within your project
export TESSDATA_PREFIX="$SCRIPT_DIR/Tesseract-OCR/tessdata"

# Change to the input_images directory
cd input_images

# OCR process on each file in the directory
# It assumes all files in the directory are valid for tesseract
for file in *.*; do
    tesseract "$file" "${file%.*}" -l mya --psm 6 --dpi 100
done

# Output a completion message
echo "Done!"

# Wait for a user input before exiting
read -p "Press any key to continue..." -n1 -s
