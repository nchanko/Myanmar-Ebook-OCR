# For Windows Users

## Prerequisites

Ensure Calibre is installed for EPUB to text conversion.
Ensure Python 3 is installed for Zawgyi to Unicode conversion.

## Usage

Open the folder containing the batch scripts.
Right-click on an empty space and choose 'Open in Terminal' or 'Open Command Line Here'.
Run the scripts with the following commands:
### Convert EPUB to Text: 
Place EPUB files in the epub folder and run 
``
./epub_to_text.bat
``
### Convert Zawgyi to Unicode Font: 
Put text files in files_to_convert_font folder and run 
``
./zu_converter.bat
``


# For Mac and Linux Users
## Prerequisites
Ensure Calibre is installed for EPUB to text conversion (use homebrew to install calibre).
Ensure Python 3 is installed for Zawgyi to Unicode conversion.

## Usage
Open the Terminal.
Navigate to the directory containing the scripts using the cd command. For example, if your scripts are in a folder named Scripts on your Desktop, you would type: cd ~/Desktop/Scripts
Run the scripts with the following commands:

### Convert EPUB to Text: 
Place EPUB files in the epub folder and run ``./epub_to_text.sh``.
### Convert Zawgyi to Unicode Font: 
Put text files in files_to_convert_font folder and run ``./zu_converter.sh``

##Notes
Ensure you have execution permissions for the .sh scripts. You can set this with ``chmod +x zu_converter.sh`` and ``chmod +x epub_to_text.bat`` .

