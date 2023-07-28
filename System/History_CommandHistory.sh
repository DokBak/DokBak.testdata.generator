#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [History]_[CommandHistory]
#------------------------------------------------------------
function history_CommandHistory(){
    echo
    echo "## history Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : history"
    echo " HowToUse : history "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/history_CMD_TestFolder/ "
    mkdir -p `pwd`/history_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'TestFile1 Testing1' > `pwd`/history_CMD_TestFolder/history_CMD_TestFile1.txt "
    echo 'TestFile1 Testing1' > `pwd`/history_CMD_TestFolder/history_CMD_TestFile1.txt
    echo " echo 'TestFile2 Testing2' > `pwd`/history_CMD_TestFolder/history_CMD_TestFile2.txt "
    echo 'TestFile2 Testing2' > `pwd`/history_CMD_TestFolder/history_CMD_TestFile2.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " history "
    history
    echo
    # Example End
    echo
    echo "## history End ##"
    echo
}

history_CommandHistory