
markdown
Copy code
# Myanmar-Ebook-OCR

This repository contains a script utilizing Tesseract OCR to digitize PDF ebooks into text format.

## Description

- This OCR tool uses the open-source Tesseract.
- It can convert PNG images and PDF files into TXT files.
- Currently supports OCR for English and Myanmar-based text.
- Files must be placed in the respective folder (Input PDF and input images for OCR).
- The original script, found on the internet and created by an unknown user, works only for Windows.
- Nyein Chan Ko Ko added the script for MAC compatibility.

## Installation for MAC

Install Tesseract and Poppler.

### In the Terminal

Set directory:
```
cd /Users/arthur/Downloads/Myanmar_OCR
```
Install Poppler and Tesseract:

```
brew install poppler
brew install tesseract
```
From Finder
Move the mya.traineddata to /opt/homebrew/share/tessdata/. This Myanmar model file is necessary for OCR.

Script Permissions
Run this to give permission to the script (only one time):

```

chmod +x pdf_to_text.sh
chmod +x images_to_text.sh
```

### Usage
### OCR PDF Files
Place PDF file in the input_pdf folder.
In the terminal, set the directory and run:
```
./pdf_to_text.sh
```
### OCR Image Files
Place image files in the input_images folder.
In the terminal, set the directory and run:
```
./images_to_text.sh
```




