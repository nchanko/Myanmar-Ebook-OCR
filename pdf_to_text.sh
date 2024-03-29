#!/bin/bash


# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Set the TESSDATA_PREFIX to the tessdata directory within your project
export TESSDATA_PREFIX="$SCRIPT_DIR/Tesseract-OCR/tessdata"

# Now, the rest of your script can rely on TESSDATA_PREFIX being correctly set
# and Tesseract will look for the tessdata directory accordingly


# Function to handle script interruption
cleanup_and_exit() {
    echo "Script interrupted. Cleaning up..."
    
    # Clean up any remaining PNG files
    rm *.png

    # Clean up individual text files, if any were created
    find . -name "*.txt" -not -name "*_all.txt" -delete

    echo "Cleanup done. Exiting."
    exit 1
}


# Trap Ctrl+C (SIGINT) and call cleanup_and_exit()
trap cleanup_and_exit SIGINT

# Directory with your PDFs
pdf_directory="input_pdf"

x=""
while getopts "c:" opt; do
  case ${opt} in
    c)
      IFS=',' read -ra ADDR <<< "${OPTARG}"
      x=${ADDR[0]}
      y=${ADDR[1]}
      width=${ADDR[2]}
      height=${ADDR[3]}
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

# Change to the directory with your PDFs
cd "$pdf_directory" || exit

echo "Processing PDF files in $pdf_directory..."

# Process each PDF file
for pdf_file in *.pdf; do
    echo "Converting $pdf_file to grayscale PNG..."
    pdftoppm -gray "$pdf_file" "${pdf_file%.pdf}" -png

    book_name="${pdf_file%.pdf}"

    # Create an individual _all.txt file for each PDF
    all_text_file="${book_name}_all.txt"
    echo "Initializing OCR results file: $all_text_file"

    # Initialize _all.txt file
    echo "Results for file: $book_name" > "$all_text_file"

    page_number=1

    # OCR the PNG files and append the file name
    for png_file in "${book_name}"*.png; do
        echo "Performing OCR on $png_file..."
        if [[ -n "$x" ]]; then
            convert "$png_file" -crop "${width}x${height}+${x}+${y}" "$png_file"
        fi
        # Append book name and page number before OCR content
        echo "Book: $book_name, Page $page_number:" >> "$all_text_file"
        tesseract "$png_file" stdout -l eng+mya --psm 6 --dpi 300 >> "$all_text_file"
        
        # Increment page number for next iteration
        ((page_number++))

    done

    echo "Cleaning up PNG files for $book_name..."
    rm "${book_name}"*.png

    echo "$book_name processing complete."
done

echo "All PDF files processed."

# Clean up individual text files, if any were created
find . -name "*.txt" -not -name "*_all.txt" -delete

echo "Cleanup of individual text files complete."

# Wait for a user input before closing the script
read -p "Press any key to continue..." -n1 -s
