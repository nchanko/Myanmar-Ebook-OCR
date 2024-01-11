@echo off
SETLOCAL

cd input_images

rem Clear or initialize the _all.txt file
echo. > _all.txt

rem Process only image files
for %%F in (*.png *.jpg *.jpeg *.bmp *.tif *.tiff) do (
    echo Processing image: %%F
    ..\Tesseract-OCR\tesseract.exe "%%F" "%%~nF" -l mya+eng --psm 6 --dpi 100 >nul 2>nul
    if exist "%%~nF.txt" (
        type "%%~nF.txt" >> _all.txt
        del "%%~nF.txt"
    )
)

echo "Done!"
pause
ENDLOCAL
