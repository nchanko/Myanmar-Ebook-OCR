@echo off
SETLOCAL

cd input_images

rem Process only image files
for %%F in (*.png *.jpg *.jpeg *.bmp *.tif *.tiff) do (
    echo Processing image: %%F
    ..\Tesseract-OCR\tesseract.exe "%%F" "%%~nF" -l mya+eng --psm 6 --dpi 100 
)

echo "Done!"
pause
ENDLOCAL
