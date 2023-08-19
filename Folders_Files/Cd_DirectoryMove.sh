#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Cd]_[DirectoryMove]
#------------------------------------------------------------
function cd_DirectoryMove(){
    echo
    echo "## cd Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : cd"
    echo " HowToUse : cd [Argument1] "
    echo "            [Argument1] : tarFolder_Path "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/cd_CMD_TestFolder/ "
    mkdir -p `pwd`/cd_CMD_TestFolder/
    # Preparation : Create File
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option )
    echo
    pwd
    echo " cd `pwd`/cd_CMD_TestFolder/ "
    cd `pwd`/cd_CMD_TestFolder/
    pwd
    echo
    # Example 02 (Not Option )
    echo
    pwd
    echo " cd .. "
    cd ..
    pwd
    echo
    # Example 03 (Not Option : Home Directory Move )
    echo
    echo " Home Directory Move "
    pwd
    echo " cd `pwd`/cd_CMD_TestFolder/ "
    cd `pwd`/cd_CMD_TestFolder/
    pwd
    echo " cd  "
    cd 
    pwd
    echo
    # Example End
    echo
    echo "## cd End ##"
    echo
}

cd_DirectoryMove