#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [unzip]_[FileUnzip]
#------------------------------------------------------------
function unzip_FileUnzip(){
    echo 
    echo "## unzip Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : unzip"
    echo " HowToUse : unzip [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : unzipFile_Path "
    echo "            [Argument2] : unzipFile_Directory(-d Option) "
    echo "            [Option : -l] : zip File List Show) "
    echo "            [Option : -q] : No Message) "
    echo "            [Option : -d] : Unzip Directory Select) "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFolder2 "
    mkdir -p `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFolder2
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.txt "
    echo " TestFile1 " > `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.txt
    # Preparation : Create unzip File
    echo " zip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.txt "
    zip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.txt 
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Current Folder Unzip)
    echo
    echo " unzip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip "
    unzip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip
    echo
    # Example 02 (Option -l : zip File List Show)
    echo
    echo " unzip -l `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip "
    unzip -l `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip 
    echo
    # Example 03 (Option -q : No Message)
    echo
    echo " unzip -q `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip "
    unzip -q `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip 
    echo
    # Example 04 (Option -d : Unzip Directory Select)
    echo
    echo " unzip -d `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFolder2/ "
    unzip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip -d `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFolder2/
    echo
    # Example End
    echo
    echo "## unzip End ##"
    echo 
}

unzip_FileUnzip