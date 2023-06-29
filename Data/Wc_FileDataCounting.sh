#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Wc]_[FileDataCounting]
#------------------------------------------------------------
function wc_FileDataCounting(){
    echo
    echo "## wc Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : wc"
    echo " HowToUse : wc [Option] [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -l] : line count check "
    echo "            [Option : -w] : word count check "
    echo "            [Option : -c] : byte count check "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/wc_CMD_TestFolder/ "
    mkdir -p `pwd`/wc_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'TestFile1' > `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'Test,bash,zsh,sh' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'Test,bash,zsh,sh' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'TestFile2' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'TestFile2' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'iphone,ipad,imac,Test,ipod,ipodtouch' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'iphone,ipad,imac,Test,ipod,ipodtouch' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo '' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo '' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'galaxyS7,Note7,ZFilp,S7,Test' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'galaxyS7,Note7,ZFilp,S7,Test' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'TestFile3' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'TestFile3' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'Korea,Test,Japan,China' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'Korea,Test,Japan,China' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'Seoul,Tokyo,hongkong' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'Seoul,Tokyo,hongkong' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'TestFile4' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'TestFile4' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'ps1,ps2,ps3,ps4' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'ps1,ps2,ps3,ps4' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'psa,psa,psa,psa' >>  `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'psa,psa,psa,psa' >>  `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo 'Nintendo,NDSL, DSL,wii' >>  `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo 'Nintendo,NDSL, DSL,wii' >>  `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo " echo '' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    echo '' >> `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " `pwd`/wc wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    wc `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo
    # Example 02 (Option -l : line count check)
    echo
    echo " wc -l `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    wc -l `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo
    # Example 03 (Option -w : word count check)
    echo
    echo " wc -w `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    wc -w `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo
    # Example 04 (Option -c : byte count check)
    echo
    echo " wc -c `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt "
    wc -c `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo
    # Example End
    echo
    echo "## wc End ##"
    echo
}

wc_FileDataCounting