#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Gunzip]_[GzipFileUnZip]
#------------------------------------------------------------
function GzipUnzip(){
    echo 
    echo "## gzip Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : gzip"
    echo " HowToUse : gzip [Option] [Argument1]"
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/Gunzip_CMD_TestFolder "
    mkdir -p `pwd`/Gunzip_CMD_TestFolder
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt"
    echo "TestFile1" > Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt
    echo " echo 'TestFile2' > `pwd`/Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile2.txt"
    echo "TestFile2" > Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile2.txt
    # Preparation : Create gzip File
    echo " gzip `pwd`/Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt; gzip `pwd`/Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile2.txt"
    gzip Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt; gzip Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile2.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " Gunzip `pwd`/Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt.gz"
    gunzip `pwd`/Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt.gz
    echo
    # Example End
    echo
    echo "## gzip End ##"
    echo 
}

GzipUnzip