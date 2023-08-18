#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Chmod]_[AccessAuthorityEdit]
#------------------------------------------------------------
function chmod_AccessAuthorityEdit(){
    echo
    echo "## chmod Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : chmod"
    echo " HowToUse : chmod [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : owner group "
    echo "            [Argument2] : tarFile_Path "
    echo "            [Option : -R] : Apply to subfolders and files as well "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/chmod_CMD_TestFolder/ "
    mkdir -p `pwd`/chmod_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'test apple' > `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    echo 'test apple' > `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : [r(4), w(2), x(1)] )
    echo
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo " chmod 777 `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod 777 `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo
    # Example 02 (Not Option : [u : user] )
    echo
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo " chmod u-w `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod u-w `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo
    # Example 03 (Not Option : [g : group] )
    echo
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo " chmod g-w `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod g-w `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo
    # Example 04 (Not Option : [o : others] )
    echo
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo " chmod o-w `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod o-w `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo
    # Example 05 (Not Option : [a : all] )
    echo
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo " chmod a+w `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod a+w `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo
    # Example 06 (Not Option : [a : all] )
    echo
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo " chmod a-x `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod a-x `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo
    # Example 07 (Option -R : Apply to subfolders and files as well )
    echo
    echo " Option -R : Apply to subfolders and files as well "
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo " ls -l `pwd`/ "
    ls -l `pwd`/
    echo " chmod -R 777 `pwd`/chmod_CMD_TestFolder/"
    chmod -R 777 `pwd`/chmod_CMD_TestFolder/
    echo " ls -l `pwd`/chmod_CMD_TestFolder/ "
    ls -l `pwd`/chmod_CMD_TestFolder/
    echo " ls -l `pwd`/ "
    ls -l `pwd`/
    echo
    # Example End
    echo
    echo "## chmod End ##"
    echo
}

chmod_AccessAuthorityEdit