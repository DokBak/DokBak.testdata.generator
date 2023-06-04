#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Gzip]_[gzipCompress]
#------------------------------------------------------------
function Gzip_GzipCompress(){
    echo 
    echo "## gzip Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : gzip"
    echo " HowToUse : gzip [Option] [Argument1] "
    echo "            [Argument1] : gzipFile_Path "
    echo "            [Option : -d] : Uncompress "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p  `pwd`/Gzip_CMD_TestFolder"
    mkdir -p `pwd`/Gzip_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/Gzip_CMD_TestFolder/Gzip_CMD_TestFile1.txt "
    echo " TstFile1" > `pwd`/Gzip_CMD_TestFolder/Gzip_CMD_TestFile1.txt
    echo " echo 'TestFile2' > `pwd`/Gzip_CMD_TestFolder/Gzip_CMD_TestFile2.txt "
    echo " TestFile2" > `pwd`/Gzip_CMD_TestFolder/Gzip_CMD_TestFile2.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " gzip `pwd`/Gzip_CMD_TestFolder/Gzip_CMD_TestFile1.txt; gzip `pwd`/Gzip_CMD_TestFolder/Gzip_CMD_TestFile2.txt "
    gzip `pwd`/Gzip_CMD_TestFolder/Gzip_CMD_TestFile1.txt; gzip `pwd`/Gzip_CMD_TestFolder/Gzip_CMD_TestFile2.txt
    echo
    # Example 02 (Option -d : UnCompress)
    echo
    echo " gzip -d `pwd`/Gzip_CMD_TestFolder/Gzip_CMD_TestFile2.txt "
    gzip -d `pwd`/Gzip_CMD_TestFolder/Gzip_CMD_TestFile2.txt
    echo
    # Example End
    echo
    echo "## gzip End ##"
    echo 
}

Gzip_GzipCompress