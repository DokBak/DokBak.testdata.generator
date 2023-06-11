#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [zip]_[zipCompress]
#------------------------------------------------------------
function zip_zipCompress(){
    echo 
    echo "## zip Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : zip"
    echo " HowToUse : zip [Option] [Argument1] [Argument2] [Argument3] ..."
    echo "            [Argument1] : zipFile_Path "
    echo "            [Argument2] : TargetFile1_Path "
    echo "            [Argument3] : TargetFile2_Path "
    echo "            [Option : -r] : Preserve directory structure "
    echo "            [Option : -r] : Folder and Files (All Tree)) "
    echo "            [Option : -q] : Compress Process Not Printing) "
    echo "            [Option : -9] : High Level Compress) "
    echo "            [Option : -j] : No tree, Only Files) "
    echo "            [Option : -d] : delete File from zip file) "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/zip_CMD_TestFolder/zip_CMD_TestFolder2 "
    mkdir -p `pwd`/zip_CMD_TestFolder/zip_CMD_TestFolder2
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile1.txt "
    echo " TestFile1 " > `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile1.txt
    echo " echo 'TestFile2' > `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile2.txt "
    echo " TestFile2 " > `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile2.txt
    echo " echo 'TestFile3' > `pwd`/zip_CMD_TestFolder/zip_CMD_TestFolder2/zip_CMD_TestFile3.txt "
    echo " TestFile3 " > `pwd`/zip_CMD_TestFolder/zip_CMD_TestFolder2/zip_CMD_TestFile3.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Single File Compress)
    echo
    echo " zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile1.zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile1.txt "
    zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile1.zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile1.txt 
    echo " zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile2.z `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile2.txt "
    zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile2.z `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile2.txt
    echo
    # Example 02 (Not Option : Multi File Compress1)
    echo
    echo " zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileGroup.zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile1.txt `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile2.txt "
    zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileGroup.zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile1.txt `pwd`/zip_CMD_TestFolder/zip_CMD_TestFile2.txt
    echo    
    # Example 03 (Not Option : Folder and Files (1 Tree))
    echo
    echo " zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder.zip `pwd`/zip_CMD_TestFolder/* "
    zip `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder.zip `pwd`/zip_CMD_TestFolder/*
    echo
    # Example 04 (Option -r : Folder and Files (All Tree))
    echo
    echo " zip -r `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_r.zip `pwd`/zip_CMD_TestFolder/*"
    zip -r `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_r.zip `pwd`/zip_CMD_TestFolder/
    echo
    # Example 05 (Option -q : Compress Process Not Printing)
    echo
    echo " zip -q `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_q.zip `pwd`/zip_CMD_TestFolder/*"
    zip -q `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_q.zip `pwd`/zip_CMD_TestFolder/*
    echo
    # Example 06 (Option -9 : High Level Compress)
    echo
    echo " zip -9 `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_9.zip `pwd`/zip_CMD_TestFolder/*"
    zip -9 `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_9.zip `pwd`/zip_CMD_TestFolder/*
    echo
    # Example 07 (Option -j : No tree, Only Files)
    echo
    echo " zip -j `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_j.zip `pwd`/zip_CMD_TestFolder/*"
    zip -j `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_j.zip `pwd`/zip_CMD_TestFolder/*
    echo
    # Example 08 (Option -d : delete File from zip file)
    echo
    echo " zip -d `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_j.zip zip_CMD_TestFile1.txt"
    zip -d `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_j.zip zip_CMD_TestFile1.txt
    echo
    # Example End
    echo
    echo "## zip End ##"
    echo 
}

zip_zipCompress