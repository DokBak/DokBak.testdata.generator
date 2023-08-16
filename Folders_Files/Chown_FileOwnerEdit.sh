#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Chown]_[FileOwnerEdit]
#------------------------------------------------------------
function chown_FileOwnerEdit(){
    echo
    echo "## chown Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : chown"
    echo " HowToUse : chown [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : owner group "
    echo "            [Argument2] : tarFile_Path "
    echo "            [Option : -R] : Apply to subfolders and files as well "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/chown_CMD_TestFolder/ "
    mkdir -p `pwd`/chown_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'test apple' > `pwd`/chown_CMD_TestFolder/chown_CMD_TestFile1.txt "
    echo 'test apple' > `pwd`/chown_CMD_TestFolder/chown_CMD_TestFile1.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option )
    echo
    echo " ls -l `pwd`/chown_CMD_TestFolder/ "
    ls -l `pwd`/chown_CMD_TestFolder/
    echo " sudo chown Dok `pwd`/chown_CMD_TestFolder/chown_CMD_TestFile1.txt "
    sudo chown Dok `pwd`/chown_CMD_TestFolder/chown_CMD_TestFile1.txt
    echo " ls -l `pwd`/chown_CMD_TestFolder/ "
    ls -l `pwd`/chown_CMD_TestFolder/
    echo
    # Example 02 (Option -R : Apply to subfolders and files as well )
    echo
    echo " Option -R : Apply to subfolders and files as well "
    echo " ls -l `pwd`/ "
    ls -l `pwd`/
    echo " ls -l `pwd`/chown_CMD_TestFolder/ "
    ls -l `pwd`/chown_CMD_TestFolder/
    echo " sudo chown -R jonmingi `pwd`/chown_CMD_TestFolder/ "
    sudo chown -R jonmingi `pwd`/chown_CMD_TestFolder/
    echo " ls -l `pwd`/ "
    ls -l `pwd`/
    echo " ls -l `pwd`/chown_CMD_TestFolder/ "
    ls -l `pwd`/chown_CMD_TestFolder/
    echo
    # Example End
    echo
    echo "## chown End ##"
    echo
}

chown_FileOwnerEdit