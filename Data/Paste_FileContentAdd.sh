#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Paste]_[FileContentAdd]
#------------------------------------------------------------
function paste_FileContentAdd(){
    echo
    echo "## paste Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : paste"
    echo " HowToUse : paste [Option] [Argument1] [Argument2] ..."
    echo "            [Argument1] : tarFile_Path1 "
    echo "            [Argument2] : tarFile_Path2 "
    echo "            [Option : -d] : Set the delimiters and combine "
    echo "            [Option : -s] : Matrix Transition "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/paste_CMD_TestFolder/ "
    mkdir -p `pwd`/paste_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'test apple' > `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt "
    echo 'test apple' > `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt
    echo " echo 'test banana' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt "
    echo 'test banana' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt
    echo " echo 'test melon' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt "
    echo 'test melon' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt
    echo " echo 'test pear' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt "
    echo 'test pear' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt
    echo " echo 'test peach' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt "
    echo 'test peach' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt
    echo 
    echo " echo 'test 300' > `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt "
    echo 'test 300' > `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo " echo 'test 350' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt "
    echo 'test 350' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo " echo 'test 120' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt "
    echo 'test 120' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo " echo 'test 270' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt "
    echo 'test 270' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo " echo 'test 410' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt "
    echo 'test 410' >> `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Merge the contents of a file horizontally )
    echo
    echo " Not Option : Merge the contents of a file horizontally "
    echo " paste `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt "
    paste `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo
    # Example 02 (Option -d : Set the delimiters and combine )
    echo
    echo " Option -d : Set the delimiters and combine "
    echo " paste -d ',' `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt "
    paste -d ',' `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo
    # Example 03 (Option -s : Matrix Transition )
    echo
    echo " Option -s : Matrix Transition "
    echo " paste -s `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt "
    paste -s `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo
    # Example End
    echo
    echo "## paste End ##"
    echo
}

paste_FileContentAdd