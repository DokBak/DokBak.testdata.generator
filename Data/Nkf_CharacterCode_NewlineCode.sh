#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Nkf]_[CharacterCode_NewlineCode]
#------------------------------------------------------------
function nkf_CharacterCode_NewlineCode(){
    echo
    echo "## nkf Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : nkf"
    echo " HowToUse : nkf [Option] [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -g             ] : Show encoding "
    echo "            [Option : --guess        ] : Show encoding and newline "
    echo "            [Option : -e             ] : Convert encoding EUC "
    echo "            [Option : -j             ] : Convert encoding JIS "
    echo "            [Option : -s             ] : Convert encoding SJIS "
    echo "            [Option : -w             ] : Convert encoding UTF-8 "
    echo "            [Option : -Lw            ] : Convert newline CRLF "
    echo "            [Option : -Lm            ] : Convert newline LF "
    echo "            [Option : -Lu            ] : Convert newline CR "
    echo "            [Option : --oc=[codeset] ] : Convert encoding codeset [ Shift_JIS, Windows-31J, UTF-8, UTF-8-BOM... ] "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/nkf_CMD_TestFolder/ "
    mkdir -p `pwd`/nkf_CMD_TestFolder/
    # Preparation : Create File
    echo 'English' > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt
    echo '한글' >> `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt
    echo '日本語漢字' >> `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt
    echo 'にほんご' >> `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt
    echo 'ニホンゴ' >> `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " nkf `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt "
    nkf `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt
    echo
    # Example 02 (Option -g : Show encoding )
    echo
    echo " nkf -g `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt "
    nkf -g `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt
    echo
    # Example 03 (Option --guess : Show encoding and newline )
    echo
    echo " nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt "
    nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt
    echo
    # Example 04 (Option -e : Convert encoding EUC )
    echo
    echo " nkf -e `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_EUC.txt "
    nkf -e `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_EUC.txt
    echo " nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_EUC.txt "
    nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_EUC.txt
    echo
    # Example 05 (Option -j : Convert encoding JIS )
    echo
    echo " nkf -j `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_JIS.txt "
    nkf -j `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_JIS.txt
    echo " nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_JIS.txt "
    nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_JIS.txt
    echo
    # Example 06 (Option -s : Convert encoding SJIS )
    echo
    echo " nkf -s `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_SJIS.txt "
    nkf -s `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_SJIS.txt
    echo " nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_SJIS.txt "
    nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_SJIS.txt
    echo
    # Example 07 (Option -w : Convert encoding UTF-8 )
    echo
    echo " nkf -w `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_UTF-8.txt "
    nkf -w `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_UTF-8.txt
    echo " nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_UTF-8.txt "
    nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_UTF-8.txt
    echo
    # Example 08 (Option -Lw : Convert newline CRLF )
    echo
    echo " nkf -Lw `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_CRLF.txt "
    nkf -Lw `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_CRLF.txt
    echo " nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_CRLF.txt "
    nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_CRLF.txt
    echo
    # Example 09 (Option -Lm : Convert newline LF )
    echo
    echo " nkf -Lm `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_LF.txt "
    nkf -Lm `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_LF.txt
    echo " nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_LF.txt "
    nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_LF.txt
    echo
    # Example 10 (Option -Lu : Convert newline CR )
    echo
    echo " nkf -Lu `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_CR.txt "
    nkf -Lu `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_CR.txt
    echo " nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_CR.txt "
    nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_CR.txt
    echo
    # Example 11 (Option --oc=[codeset] : Convert encoding codeset [ Shift_JIS, Windows-31J, UTF-8, UTF-8-BOM... ] )
    echo
    echo " nkf --oc=UTF-8-BOM `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_BOM.txt "
    nkf --oc=UTF-8-BOM `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_BOM.txt
    echo " nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_BOM.txt "
    nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_BOM.txt
    echo
    # Example End
    echo
    echo "## nkf End ##"
    echo
}

nkf_CharacterCode_NewlineCode