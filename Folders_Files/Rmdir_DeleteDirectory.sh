#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Rmdir]_[DeleteDirectory]
#------------------------------------------------------------
function rmdir_DeleteDirectory(){
    echo
    echo "## rmdir Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : rmdir"
    echo " HowToUse : rmdir [Option] [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -p] : Create all intermediate directories, even if the directory does not exist "
    echo "            [Option : -v] : Output detailed information " 
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/rmdir_CMD_TestFolder/rmdir_CMD_TestFolder2/rmdir_CMD_TestFolder3/rmdir_CMD_TestFolder4/ "
    mkdir -p `pwd`/rmdir_CMD_TestFolder/rmdir_CMD_TestFolder2/rmdir_CMD_TestFolder3/rmdir_CMD_TestFolder4/
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : directory delete )
    echo
    echo " Not Option : directory delete "
    echo " rmdir `pwd`/rmdir_CMD_TestFolder/rmdir_CMD_TestFolder2/rmdir_CMD_TestFolder3/rmdir_CMD_TestFolder4/ "
    rmdir `pwd`/rmdir_CMD_TestFolder/rmdir_CMD_TestFolder2/rmdir_CMD_TestFolder3/rmdir_CMD_TestFolder4/
    echo
    # Example 02 (Option -p : with subdirectory delete )
    echo
    echo " Option -p : with subdirectory delete "
    echo " rmdir -p `pwd`/rmdir_CMD_TestFolder/rmdir_CMD_TestFolder2/ "
    rmdir -p `pwd`/rmdir_CMD_TestFolder/rmdir_CMD_TestFolder2/
    echo
    # Example 03 (Option -v : Output detailed information )
    echo
    echo " Option -v : Output detailed information "
    echo " rmdir -v `pwd`/rmdir_CMD_TestFolder/ "
    rmdir -v `pwd`/rmdir_CMD_TestFolder/
    echo
    # Example End
    echo
    echo "## rmdir End ##"
    echo
}

rmdir_DeleteDirectory 