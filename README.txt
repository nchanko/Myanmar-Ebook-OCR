Description

- This OCR tool use open source tesseract .
- Can convert png images and pdf files to txt file.
- Currently can OCR English and Myanmar based text. 
- You have to put the files in respective folder (Input pdf and input images to OCR)
- Original script is found on internet, created by unknown user, work only for window.
- Nyein Chan Ko Ko added the script for MAC. 


FOR MAC, Install tesseract and poppler.



In the terminal 


Set directory : cd /Users/arthur/Downloads/Myanmar_OCR

brew install poppler
brew install tesseract

From Fidnder. 
Move the mya.traineddata to /opt/homebrew/share/tessdata/ . This Myanmar model file is necessary to do OCR.

Run this to give permission to the script(only one time) 

chmod +x pdf_to_text.sh
chmod +x images_to_text.sh

When OCR the pdf. Put pdf file in input_pdf folder.
In terminal, set directory and run this.

./pdf_to_text.sh

To OCR image files, put image in input_images folder.
In terminal ,set directory and run this.
./images_to_text.sh
