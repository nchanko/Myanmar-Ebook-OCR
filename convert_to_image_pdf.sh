#!/bin/bash

# Function to check if ImageMagick is installed
check_imagemagick() {
    if ! command -v convert &> /dev/null; then
        echo "ImageMagick is not installed. Trying to install..."
        install_imagemagick
    fi
}

# Function to install ImageMagick
install_imagemagick() {
    # Detect the platform (similar to $OSTYPE)
    OS="$(uname)"
    case $OS in
      'Linux')
        if [ -f /etc/debian_version ]; then
            # Assume Debian-based system
            sudo apt-get update
            sudo apt-get install imagemagick
        elif [ -f /etc/redhat-release ]; then
            # Assume Red Hat-based system
            sudo yum install imagemagick
        else
            echo "Unsupported Linux distribution for automatic installation. Please install ImageMagick manually."
            exit 1
        fi
        ;;
      'Darwin')
        # macOS
        if ! command -v brew &> /dev/null; then
            echo "Homebrew is not installed. Please install Homebrew and ImageMagick manually."
            exit 1
        fi
        brew install imagemagick
        ;;
      *)
        echo "Unsupported operating system. Please install ImageMagick manually."
        exit 1
        ;;
    esac
}

# Check and install ImageMagick if necessary
check_imagemagick

# Directory containing the PDF files
input_directory="convert_to_image_pdf"

# Change to the directory with your PDFs
cd "$input_directory" || exit

echo "Converting PDF files in $input_directory to image-based PDFs..."

# Process each PDF file
for pdf_file in *.pdf; do
    # Output file name
    output_file="${pdf_file%.pdf}_image.pdf"

    echo "Converting $pdf_file to $output_file..."

    # Convert typed PDF to image-based PDF
    convert -density 300 "$pdf_file" -quality 90 "$output_file"

    echo "$pdf_file conversion completed."
done

echo "All conversions completed."

# Wait for a user input before closing the script
read -p "Press any key to continue..." -n1 -s
