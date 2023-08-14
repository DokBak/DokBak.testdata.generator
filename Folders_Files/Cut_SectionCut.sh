#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Cut]_[SectionCut]
#------------------------------------------------------------
function cut_SectionCut(){
    echo
    echo "## cut Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : cut"
    echo " HowToUse : cut [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : data Separater "
    echo "            [Argument2] : tarFile_Path "
    echo "            [Option : -b] : byte unit Print "
    echo "            [Option : -c] : character unit Print "
    echo "            [Option : -d] : Separater unit Print "
    echo "            [Option : -f] : column Print "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/cut_CMD_TestFolder/ "
    mkdir -p `pwd`/cut_CMD_TestFolder/
    # Preparation : Create File
    echo " echo '2byteString1,2byteString2,2byteString3' > `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt "
    echo '2byteString1,2byteString2,2byteString3' > `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo " echo '2byteString12byteString2,2byteString3' >> `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt "
    echo '2byteString12byteString2,2byteString3' >> `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo " echo '3TestFile1,3Testing2,3Testing3' >> `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt "
    echo '3TestFile1,3Testing2,3Testing3' >> `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo " echo '4TestFile14Testing2,4Testing3' >> `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt "
    echo '4TestFile14Testing2,4Testing3' >> `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Option -b : byte unit Print )
    echo
    echo " Option -b : byte unit Print "
    echo " cut -b 5 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt "
    cut -b 5 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo
    echo " cut -b 2-9 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt "
    cut -b 2-9 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo
    # Example 02 (Option -c : character unit Print )
    echo
    echo " Option -c : character unit Print "
    echo " cut -c 5 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt "
    cut -c 5 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo
    echo " cut -c 2-9 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt "
    cut -c 2-9 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo
    # Example 03 (Option -d : Separater unit Print, Option -f : column Print )
    echo
    echo " Option -d : Separater unit Print, Option -f : column Print "
    echo " cut -d , -f 3 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt "
    cut -d , -f 3 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo
    # Example End
    echo
    echo "## cut End ##"
    echo
}

cut_SectionCut