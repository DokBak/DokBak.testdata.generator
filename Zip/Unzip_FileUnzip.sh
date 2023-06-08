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
    echo " HowToUse : unzip [Option] [Argument1] "
    echo "            [Argument1] : unzipFile_Path "
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
    echo " zip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.unzip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.txt "
    zip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.unzip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.txt 
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Current Folder Unzip)
    echo
    echo " unzip unzip_CMD_TestFolder/unzip_CMD_TestFile1.unzip "
    unzip unzip_CMD_TestFolder/unzip_CMD_TestFile1.unzip
    echo
    # Example End
    echo
    echo "## unzip End ##"
    echo 
}

unzip_FileUnzip