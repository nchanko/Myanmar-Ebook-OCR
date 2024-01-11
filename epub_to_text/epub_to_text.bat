@echo off
setlocal EnableDelayedExpansion

cd epub

for %%F in (*.epub) do (
    set "TXT_FILE=%%~nF.txt"
    ebook-convert "%%F" "!TXT_FILE!" --txt-output-encoding=utf8
    if exist "!TXT_FILE!" (
        echo Converted: !TXT_FILE!
    ) else (
        echo Conversion failed for: %%F
    )
)

echo All conversions complete.
pause
