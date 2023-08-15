#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Cp]_[CopyFileFolder]
#------------------------------------------------------------
function cp_CopyFileFolder(){
    echo
    echo "## cp Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : cp"
    echo " HowToUse : cp [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : tarFile_Path1 "
    echo "            [Argument2] : copyFile_Path2 "
    echo "            [Option : -i] : If the file exists, check if it is overwritten "
    echo "            [Option : -r] : Recursively copy files in the directory "
    echo "            [Option : -a] : Copy the properties and link information of the original file "
    echo "            [Option : -p] : Copy information such as owner group, permission, etc. of the original file "
    echo "            [Option : -v] : Show progress "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/cp_CMD_TestFolder1/ "
    mkdir -p `pwd`/cp_CMD_TestFolder1/
    echo " mkdir -p `pwd`/cp_CMD_TestFolder2/ "
    mkdir -p `pwd`/cp_CMD_TestFolder2/
    echo " mkdir -p `pwd`/cp_CMD_TestFolder3/ "
    mkdir -p `pwd`/cp_CMD_TestFolder3/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/cp_CMD_TestFolder1/cp_CMD_TestFile1.txt "
    echo 'TestFile1' > `pwd`/cp_CMD_TestFolder1/cp_CMD_TestFile1.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : file copy )
    echo
    echo " Not Option : file copy "
    echo " cp `pwd`/cp_CMD_TestFolder1/cp_CMD_TestFile1.txt `pwd`/cp_CMD_TestFolder2/ "
    cp `pwd`/cp_CMD_TestFolder1/cp_CMD_TestFile1.txt `pwd`/cp_CMD_TestFolder2/
    echo
    # Example 02 (Not Option : file copy and rename )
    echo
    echo " Not Option : file copy and rename "
    echo " cp `pwd`/cp_CMD_TestFolder1/cp_CMD_TestFile1.txt `pwd`/cp_CMD_TestFolder2/cp_CMD_TestFile2.txt "
    cp `pwd`/cp_CMD_TestFolder1/cp_CMD_TestFile1.txt `pwd`/cp_CMD_TestFolder2/cp_CMD_TestFile2.txt
    echo
    # Example 03 (Option -i : If the file exists, check if it is overwritten )
    echo
    echo " Option -i : If the file exists, check if it is overwritten "
    echo " cp -i `pwd`/cp_CMD_TestFolder1/cp_CMD_TestFile1.txt `pwd`/cp_CMD_TestFolder2/cp_CMD_TestFile2.txt "
    cp -i `pwd`/cp_CMD_TestFolder1/cp_CMD_TestFile1.txt `pwd`/cp_CMD_TestFolder2/cp_CMD_TestFile2.txt
    echo
    # Example 04 (Option -r : Recursively copy files in the directory )
    echo
    echo " Option -r : Recursively copy files in the directory "
    echo " cp -r `pwd`/cp_CMD_TestFolder2/ `pwd`/cp_CMD_TestFolder3/ "
    cp -r `pwd`/cp_CMD_TestFolder2/ `pwd`/cp_CMD_TestFolder3/
    echo
    # Example 05 (Option -a : Copy the properties and link information of the original file )
    echo
    echo " Option -a : Copy the properties and link information of the original file " 
    echo " cp -a `pwd`/cp_CMD_TestFolder2/cp_CMD_TestFile1.txt `pwd`/cp_CMD_TestFolder3/ "
    cp -a `pwd`/cp_CMD_TestFolder2/cp_CMD_TestFile1.txt `pwd`/cp_CMD_TestFolder3/
    echo
    # Example 06 (Option -p : Copy information such as owner group, permission, etc. of the original file )
    echo
    echo " Option -p : Copy information such as owner group, permission, etc. of the original file "
    echo " cp -p `pwd`/cp_CMD_TestFolder2/cp_CMD_TestFile2.txt `pwd`/cp_CMD_TestFolder3/ "
    cp -p `pwd`/cp_CMD_TestFolder2/cp_CMD_TestFile2.txt `pwd`/cp_CMD_TestFolder3/
    echo
    # Example 07 (Option -v : Show progress )
    echo
    echo " Option -v : Show progress "
    echo " cp -rv `pwd`/cp_CMD_TestFolder3/ `pwd`/cp_CMD_TestFolder4/ "
    cp -rv `pwd`/cp_CMD_TestFolder3/ `pwd`/cp_CMD_TestFolder4/
    echo
    # Example End
    echo
    echo "## cp End ##"
    echo
}

cp_CopyFileFolder