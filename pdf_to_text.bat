@echo off
cd input_pdf

for %%I in (*.pdf) do (
    echo Processing file: %%I
    ..\Tesseract-OCR\pdf_tools\pdftopng.exe -gray "%%I" "%%~nI"
    for %%F in (*.png) do (
        echo Converting image: %%F
        ..\Tesseract-OCR\tesseract.exe "%%F" "%%~nF" -l mya+eng --psm 6 --dpi 100 >nul 2>nul
        del "%%F"
    )

    rem Initialize or clear the output file for the current PDF
    echo. > "%%~nI_all.txt"

    rem Check if any .txt files exist for the current PDF
    if exist "%%~nI*.txt" (
        for %%X in ("%%~nI*.txt") do (
            if not "%%X"=="%%~nI_all.txt" (
                echo Appending text file: %%X
                type "%%X" >> "%%~nI_all.txt"
                del "%%X"
            )
        )
    ) else (
        echo No .txt files found for %%I.
    )
)

pause
