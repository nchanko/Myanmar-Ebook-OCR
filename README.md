# Myanmar-Ebook-OCR

This repository contains a script utilizing Tesseract OCR to digitize PDF ebooks into text format.

## Description

- This OCR tool uses the open-source Tesseract.
- It can convert PNG images and PDF files into TXT files.
- Currently supports OCR for English and Myanmar-based text.
- Files must be placed in the respective folder (Input PDF and input images for OCR).
- The original script, found on the internet and created by an unknown user, works for Windows. (Kudos to original author). I modified the script for MAC compatibility and other additional functions like epu converter, zawgyi unicode converter.

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

For the image cropping

```
brew install ImageMagick
```

The original Myanmar language file has poor quality. According to my research, this one has better accuracy. https://github.com/pndaza/tesseract-myanmar
So, we need to replace the original language file mya.traineddata with new one. As you see, original has less than 10 MB size. Newer version has around 24.1MB.

The location of langauge files could be in   `/opt/homebrew/Cellar/tesseract/5.3.3/share/tessdata/`


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


### OCR with crop image

```
./pdf_to_text.sh -c 80,80,1145,1430
```

For the Crop need to use with `-c` parameter. Parameter is `x,y,width,heigh`. In this example,

   - x 80
   - y 80
   - width 1145
   - height 1430

To know the x,y,w,h , recommend to extract the PDF to image with following command.

```
pdftoppm -gray -f 2 -l 2 input.pdf 'myfile' -png
```

when you get the myfile.png file, you can open with photoshop or any image editor. After that, you can point the x,y,w,h in that editor.


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
- Add this language file to the Tesseract-OCR directory on your computer, typically under `C:\Program Files (x86)\Tesseract OCR\tessdata` or `C:\Program Files\Tesseract OCR\tessdata`
- If you have previously downloaded language files, you might see additional languages. Replace them with this new language file for higher accuracy and more font support.

### Running the Script

Once the setup is complete:

1. Open the terminal or command line in your work directory (Myanmar-Ebook-OCR).
2. Run the following commands as needed:
   - For PDFs: `./pdf_to_text.bat`
   - For images: `./images_to_text.bat`



ADDITIONAL TIP: If your book contains both English and Burmese and you wanna recognize English words, you need to adjust the script file alittle bit. 1. You need to have english languge file in your tessdata. 2. You need to find the word called mya in the script and change to mya+eng. For additional language, you can add with + and language code.

