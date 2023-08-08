#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Mkdir]_[CreateDirectory]
#------------------------------------------------------------
function mkdir_CreateDirectory(){
    echo
    echo "## mkdir Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : mkdir"
    echo " HowToUse : mkdir [Option] [Argument1] "
    echo "            [Argument1] : createFolder_Path "
    echo "            [Option : -p] : Create all intermediate directories, even if the directory does not exist "
    echo "            [Option : -m] : AccessAuthority Set "
    echo "            [Option : -v] : Output detailed information "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " mkdir `pwd`/mkdir_CMD_TestFolder/ "
    mkdir `pwd`/mkdir_CMD_TestFolder/
    echo
    # Example 02 (Option -p : Create all intermediate directories, even if the directory does not exist )
    echo
    echo " Option -p : Create all intermediate directories, even if the directory does not exist "
    echo " ls -Rl `pwd`/mkdir_CMD_TestFolder/ "
    ls -Rl `pwd`/mkdir_CMD_TestFolder/
    echo " mkdir -p `pwd`/mkdir_CMD_TestFolder/mkdir_CMD_TestFolder1/mkdir_CMD_TestFolder2/ "
    mkdir -p `pwd`/mkdir_CMD_TestFolder/mkdir_CMD_TestFolder1/mkdir_CMD_TestFolder2/
    echo " ls -Rl `pwd`/mkdir_CMD_TestFolder/ "
    ls -Rl `pwd`/mkdir_CMD_TestFolder/
    echo
    # Example 03 (Option -m : AccessAuthority Set )
    echo
    echo " Option -m : AccessAuthority Set "
    echo " ls -Rl `pwd`/mkdir_CMD_TestFolder/ "
    ls -Rl `pwd`/mkdir_CMD_TestFolder/
    echo " mkdir -m 700 `pwd`/mkdir_CMD_TestFolder/mkdir_CMD_TestFolder3/ "
    mkdir -m 700 `pwd`/mkdir_CMD_TestFolder/mkdir_CMD_TestFolder3/
    echo " ls -Rl `pwd`/mkdir_CMD_TestFolder/ "
    ls -Rl `pwd`/mkdir_CMD_TestFolder/
    echo
    # Example 04 (Option -v : Output detailed information )
    echo
    echo " Option -v : Output detailed information "
    echo " ls -Rl `pwd`/mkdir_CMD_TestFolder/ "
    ls -Rl `pwd`/mkdir_CMD_TestFolder/
    echo " mkdir -v `pwd`/mkdir_CMD_TestFolder/mkdir_CMD_TestFolder4/ "
    mkdir -v `pwd`/mkdir_CMD_TestFolder/mkdir_CMD_TestFolder4/
    echo " ls -Rl `pwd`/mkdir_CMD_TestFolder/ "
    ls -Rl `pwd`/mkdir_CMD_TestFolder/
    echo
    # Example End
    echo
    echo "## mkdir End ##"
    echo
}

mkdir_CreateDirectory