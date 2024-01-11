@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

cd files_to_convert_font

for %%F in (*.txt) do (
    SET "output_file=%%~nF_unicode.txt"

    python ..\rabbit.py "%%F" "!output_file!"

    echo Converted: !output_file!
)

echo All conversions complete.
pause
ENDLOCAL
