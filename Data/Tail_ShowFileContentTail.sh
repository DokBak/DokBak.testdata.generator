#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tail]_[ShowFileContentTail]
#------------------------------------------------------------
function tail_ShowFileContentTail(){
    echo
    echo "## tail Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : tail"
    echo " HowToUse : tail [Option] [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -c] : Output bytes specified from behind [newline = 1byte] "
    echo "            [Option : -n] : Output lines specified from behind "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/tail_CMD_TestFolder/ "
    mkdir -p `pwd`/tail_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt "
    echo 'TestFile1' > `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt
    for n in {2..100};
    do
        echo ' echo "TestFile${n}" >> `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt '
        echo "TestFile${n}" >> `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt
    done 
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " tail `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt "
    tail `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt
    echo
    # Example 02 (Option -c : Output bytes specified from behind [newline = 1byte])
    echo
    echo " tail -c 17 `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt "
    tail -c 17 `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt
    echo
    # Example 03 (Option -n : Output lines specified from behind)
    echo
    echo " tail -n 17 `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt "
    tail -n 17 `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt
    echo
    # Example End
    echo
    echo "## tail End ##"
    echo
}

tail_ShowFileContentTail