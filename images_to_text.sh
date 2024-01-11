#!/bin/bash

# Change to the input_images directory
cd input_images

# OCR process on each file in the directory
# It assumes all files in the directory are valid for tesseract
for file in *.*; do
    tesseract "$file" "${file%.*}" -l mya+eng --psm 6 --dpi 100
done

# Combine all text files into one file named _all.txt
cat *.txt > _all.txt

# Output a completion message
echo "Done!"

# Wait for a user input before exiting
read -p "Press any key to continue..." -n1 -s
