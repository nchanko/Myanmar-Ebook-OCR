# Myanmar-Ebook-OCR

This repository contains a script utilizing Tesseract OCR to digitize PDF ebooks into text format.

## Description

- This OCR tool uses the open-source Tesseract.
- It can convert PNG images and PDF files into TXT files.
- Currently supports OCR for English and Myanmar-based text.
- Files must be placed in the respective folder (Input PDF and input images for OCR).
- The original script, found on the internet and created by an unknown user, works for Windows. (Kudos to original author). I modified the script for MAC compatibility and other additional functions like epu converter, zawgyi unicode converter.

### FOR WINDOW USER: First Download [Tesseract-OCR](https://drive.google.com/file/d/1WHKjXXdljtIq3EU6CtXWNCtUVfbR8444/view?usp=sharing) from this link. Unzip Tesseract-OCR.zip file. Otherwise, you will encounter error.

## For Windows

### Installation


For window, 64 version, the standalone OCR software is already in this project folder, Tesseract-OCR .
- `pdftopng` is already included in the Tesseract-OCR folder. You can find it here: [Tesseract-OCR/pdf_tools](https://github.com/NChanko/Myanmar-Ebook-OCR/tree/main/Tesseract-OCR/pdf_tools).


#### Language File

- Obtain the language file from `tessdata`. The Myanmar language file should be `mya.traineddata`.
- If you have better Myanmar language file, replace the mya.traineddata located in Myanmar-Ebook-OCR/Tesseract-OCR/tessdata. 
- If you want to add additional language files,place them in tessdata.

### Running the Script

Once the setup is complete:

1. Open the terminal or command line in your work directory (Myanmar-Ebook-OCR).
2. Run the following commands as needed:
   - For PDFs: `./pdf_to_text.bat`
   - For images: `./images_to_text.bat`


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
You can replace the original language file mya.traineddata with new one.The file is located in Tesseract-OCR/tessdata .


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

ADDITIONAL TIP: If your book contains both English and Burmese and you wanna recognize English words, you need to adjust the script file alittle bit. 1. You need to have english languge file in your tessdata. 2. You need to find the word called mya in the script and change to mya+eng. For additional language, you can add with + and language code.


# မြန်မာဗားရှင်း
ဒီ Repo ထဲမှာ PDF EBook တွေကို Tesseract OCR ကိုအသုံးပြု ပြီး Digital text ဖိုင်တွေ အဖြစ် ပြောင်းတဲ့ script တွေပါဝင်ပါတယ်။

## ရှင်းလင်းချက်
-ဒီ OCR က Opensource ပေးထားတဲ့ Tesseract OCR software ကိုသုံးထားပါတယ်။
- PDF file နှင့် PNF ဓာတ်ပုံဖိုင်တွေကို Text file အဖြစ်ပြောင်းလဲနိုင်ပါတယ်။
- ဒီထဲမှာတော့ အင်္ဂလိပ်နှင့် မြန်မာစာ တွေကို OCR လုပ်လို့ရပါတယ်။ အခြားဘာသာစကားတွေအတွက် သက်ဆိုင်ရာ Language ဖိုင်တွေ လိုအပ်ပါတယ်။
- ပြောင်းလဲလိုတဲ့ ဖိုင်တွေကို (input pdf နှင့် input images) ဆိုတဲ့ ဖိုဒါတွေထဲကိုထည့်ဖို့လိုပါတယ်။
- မူရင်း script က အင်တာနက်မှာရှာတွေ့ခဲ့တဲ့ နည်းလမ်းတစ်ခုပါ။ ( မူရင်းဖန်တီးသူကို ကျေးဇူးတင်ပါတယ်)။ ဒီ script ထဲမှာ နောက်ထပ် function များနှင့် Mac နှင့် Linux အတွက် ထပ်ဆင့် ဖန်တီးထားခြင်းဖြစ်ပါတယ်။

### Window အသုံးပြုသူများအတွက်၊ [Tesseract-OCR](https://drive.google.com/file/d/1WHKjXXdljtIq3EU6CtXWNCtUVfbR8444/view?usp=sharing) ဒီဖိုင်ကို Download ပြုလုပ်ပြီး အခု Project folder ထဲမှာ Unzip ပြုလုပ်ဖို့လိုပါတယ်။ ရှိပြီးသားဖိုင်တွေကို overwrite လုပ်နိုင်ပါတယ်။ 

## Window အသုံးပြုသူများအတွက်
### Installation ပြုလုပ်ခြင်း

Window 64 version များအတွက် tesseract software file ကို အပေါ်က ထပ်ဆင့်ဆွဲရတဲ့ Link ထဲမှာ ထည့်ပေးထားပြီးသားဖြစ်ပါတယ်။ အဲဒီ ဖိုင်ကို unzip လုပ်ပြီးရင် အသုံးပြုနိုင်ပါပြီ။
- `pdftopng` ဆိုတဲ့ software လေးက Tesseract-OCR ဖိုဒါထဲမှာပါရှိပါတယ်။ ဒီလင့်မှာလည်းရှာတွေ့နိုင်တယ်။ [Tesseract-OCR/pdf_tools](https://github.com/NChanko/Myanmar-Ebook-OCR/tree/main/Tesseract-OCR/pdf_tools).

### Language File
- `tessdata` မှဘာသာစကားဖိုင်ကိုရယူပါ။ မြန်မာဘာသာစကားဖိုင်သည် `mya.traineddata` ဖြစ်သင့်သည်။
- ပိုမိုကောင်းမွန်သော မြန်မာဘာသာစကားဖိုင်ရှိပါက၊ Myanmar-Ebook-OCR/Tesseract-OCR/tessdata တွင်ရှိသော mya.traineddata ကိုအစားထိုးပါ။
- ဘာသာစကားဖိုင်များကို ထပ်ထည့်လိုပါက tessdata ထဲတွင် ထားပေးပါ။

### Running the Script
စတင် အသုံးပြုဖို့အတွက် 
1. ကိုယ်ပြောင်းလဲလိုသည့် File များ ဓာတ်ပုံများကို သက်ဆိုင်ရာ ဖိုဒါထဲတွင် ထည့်ပါ။
2. လိုအပ်သလို အောက်ပါ command များကို Double Click နှိပ်ပြီး Run ပါ။ 
    - PDF များအတွက်- `./pdf_to_text.bat`
    - ပုံများအတွက်- `./images_to_text.bat`

## Mac အတွက် Install ပြုလုပ်ခြင်း
### Terminal ထဲတွင်
1. ပထမဆုံး Directory ကိုသတ်မှတ်ပါ။ cd ဟုရိုက်၍ Myanmar-Ebook-OCR ပါသည့် ဖိုဒါကို Drag ဆွဲထည့်လိုက်ရင်လည်းဖြစ်ပါသည်။ နမူနာအားဖြင့် ဤသို့ဖြစ်နိုင်သည်။
```
cd /Users/arthur/Downloads/Myanmar-Ebook-OCR
```
2. Poppler နှင့် Tesseract ကို Install မလုပ်ရသေးလျင် Brew မှတဆင့် Install လုပ်ပါ။ စက်ထဲတွင် Homebrew ရှိထားရန်လိုသည်။
```
brew install poppler
brew install tesseract
```
3.Image cropping လုပ်လိုလျင် Imagemagick ကိုသွင်းရန်လိုသည်။
```
brew install ImageMagick
```
မူရင်းမြန်မာဘာသာစကားဖိုင်သည် အရည်အသွေးညံ့ဖျင်းသည်။ လက်ရှိတွင် ဤ ဖိုင်သည် quality အကောင်းဆုံးဖြစ်သည်။ https://github.com/pndaza/tesseract-myanmar
ပိုကောင်းသည့် မော်ဒယ်ရှိပါက မူရင်းဘာသာစကားဖိုင် mya.traineddata ကို အသစ်တစ်ခုဖြင့် အစားထိုးနိုင်ပါသည်။ အဆိုပါဖိုင်သည် Tesseract-OCR/tessdata တွင် ရှိသည်။

4.Script Permissions
script များကို Run ဖို့အတွက် အောက်ပါ command ဖြင့် run လိုသော script များကို permission ပေးဖို့လိုသည်။ (ပထမဆုံး တစ်ကြိမ်သာ)

```
chmod +x pdf_to_text.sh
chmod +x images_to_text.sh
```

### အသုံးပြုရန်
### PDF ဖိုင်များကို OCR ပြုလုပ်ရန်

1. PDF ဖိုင်များကို input_pdf ဖိုဒါထဲတွင်ထည့်ပါ။
2. Terminal ထဲတွင် directory သတ်မှတ်ပြီး ၊ အောက်ပါ script ကို run ပါ။
```
./pdf_to_text.sh
```
### Image ကို Crop လုပ်ပြီး OCR လုပ်ပုံ။
အောက်ပါ script ကို နောက်တွင် image dimension ထည့်၍ run ပါ။

```
./pdf_to_text.sh -c 80,80,1145,1430
```

Crop အတွက် `-c` parameter ဖြင့် အသုံးပြုရန် လိုအပ်သည်။ parameter သည် `x၊y၊အကျယ်၊အမြင့်` ဖြစ်သည်။ ဤဥပမာတွင်၊

    - x 80
    - y 80
    အကျယ် - 1145
    အရပ်- 1430

x,y,w,h ကိုသိရန် အောက်ပါ command ဖြင့် PDF ကို ပုံသို့ ပြောင်းလဲကြည့်ရန် အကြံပြုပါသည်။

```
pdftoppm -gray -f 2 -l 2 input.pdf 'myfile' -png
```

myfile.png ဖိုင်ကိုရသောအခါ၊ photoshop သို့မဟုတ် မည်သည့်ရုပ်ပုံတည်းဖြတ်မှုဖြင့်မဆို ဖွင့်နိုင်သည်။ ထို့နောက်၊ သင်သည် ထိုအယ်ဒီတာတွင် x,y,w,h ကိုညွှန်နိုင်သည်။


### OCR Image Files
input_images ဖိုဒါထဲတွင် image file ကိုထည့်ပါ။
Terminal ထဲမှာ အောက်ပါ script ကို run ပါ။

```
./images_to_text.sh
```


သတိထားရန်: သင့်စာအုပ်ထဲတွင် အင်္ဂလိပ်ကော မြန်မာကော ပါဝင်ပြီး အင်္ဂလိပ်စာလုံးကိုပါ OCR ပြုလုပ်လိုပါက ပေးထားသော script ဖိုင်ကို အနည်းငယ် ပြုပြင်ရန်လိုသည်။ 
1. သင့် tessdata ဖိုင်ထဲတွင် language file ရှိဖို့လိုသည်။
2. script ထဲတွင် mya ဆိုသည့် နေရာကို ရှာပါ။ mya တစ်ခုတည်းပါလျင် မြန်မာစာ တစ်မျိုးတည်းကိုသာ OCR လုပ်မည်ဖြစ်သည်။ မြန်မာကော အင်္ဂလိပ်ကော OCR လုပ်ချင်လျင် mya+eng ဟု ပြင်ရေးရန်လိုသည်။
3. ထို့နောက် save လုပ်ပြီး run ပါ။
4. အခြားဘာသာစကားများပါလျင် + sign ဖြင့် language code ထပ်ဖြည့်နိုင်သည်။ 
