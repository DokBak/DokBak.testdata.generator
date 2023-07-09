#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [gzip]_[gzipCompress]
#------------------------------------------------------------
function gzip_gzipCompress(){
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
    echo " mkdir -p  `pwd`/gzip_CMD_TestFolder/ "
    mkdir -p `pwd`/gzip_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile1.txt "
    echo " TstFile1" > `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile1.txt
    echo " echo 'TestFile2' > `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile2.txt "
    echo " TestFile2" > `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile2.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : gz Compress )
    echo
    echo " Not Option : gz Compress "
    echo " gzip `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile1.txt; gzip `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile2.txt "
    gzip `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile1.txt; gzip `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile2.txt
    echo
    # Example 02 (Option -d : UnCompress )
    echo
    echo " Option -d : UnCompress "
    echo " gzip -d `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile2.txt "
    gzip -d `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile2.txt
    echo
    # Example End
    echo
    echo "## gzip End ##"
    echo 
}

gzip_gzipCompress