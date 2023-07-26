#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Pwd]_[ShowPwd]
#------------------------------------------------------------
function pwd_ShowPwd(){
    echo
    echo "## pwd Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : pwd"
    echo " HowToUse : pwd [Option] "
    echo "            [Option : -L : Current Working Directory [Default Option] "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/pwd_CMD_TestFolder/ "
    mkdir -p `pwd`/pwd_CMD_TestFolder/
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " pwd "
    pwd
    echo
    # Example 02 (Option -L : Current Working Directory [Default Option] )
    echo
    echo " Option -L : Current Working Directory [Default Option] "
    echo " pwd -L "
    pwd -L
    echo
    # Example End
    echo
    echo "## pwd End ##"
    echo
}

pwd_ShowPwd