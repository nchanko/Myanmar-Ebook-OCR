# Myanmar-Ebook-OCR

This repository contains a script utilizing Tesseract OCR to digitize PDF ebooks into text format.

## Description

- This OCR tool uses the open-source Tesseract.
- It can convert PNG images and PDF files into TXT files.
- Currently supports OCR for English and Myanmar-based text.
- Files must be placed in the respective folder (Input PDF and input images for OCR).
- The original script, found on the internet and created by an unknown user, works only for Windows.
- I modified the script for MAC compatibility and other additional functions like epu converter, zawgyi unicode converter.

## Installation for MAC

### In the Terminal

Set directory - for eg:
```
cd /Users/arthur/Downloads/Myanmar-Ebook-OCR
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


## For Windows

### Installation

Install Tesseract and `pdftopng.exe`.

- `pdftopng` is already included in the Tesseract-OCR folder. You can find it here: [Tesseract-OCR/pdf_tools](https://github.com/NChanko/Myanmar-Ebook-OCR/tree/main/Tesseract-OCR/pdf_tools).
- Place the `pdf_tools` folder in your Tesseract-OCR directory on your computer.

#### Language File

- Obtain the language file from `tessdata`. The Myanmar language file should be `mya.traineddata`.
- Add this language file to the Tesseract-OCR directory on your computer, typically under `C:/Program Files`.
- If you have previously downloaded language files, you might see additional languages. Replace them with this new language file for higher accuracy and more font support.

### Running the Script

Once the setup is complete:

1. Open the terminal or command line in your work directory (Myanmar-Ebook-OCR).
2. Run the following commands as needed:
   - For PDFs: `./pdf_to_text.bat`
   - For images: `./images_to_text.bat`



ADDITIONAL TIP: If your book contains both English and Burmese and you wanna recognize English words, you need to adjust the script file alittle bit. 1. You need to have english languge file in your tessdata. 2. You need to find the word called mya in the script and change to mya+eng. For additional language, you can add with + and language code.

