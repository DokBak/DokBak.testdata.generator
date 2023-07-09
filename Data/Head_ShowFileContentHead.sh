#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Head]_[ShowFileContentHead]
#------------------------------------------------------------
function head_ShowFileContentHead(){
    echo
    echo "## head Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : head"
    echo " HowToUse : head [Option] [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -c] : Output bytes specified from behind [newline = 1byte] "
    echo "            [Option : -n] : Output lines specified from behind "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/head_CMD_TestFolder/ "
    mkdir -p `pwd`/head_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/head_CMD_TestFolder/head_CMD_TestFile1.txt"
    echo 'TestFile1' > `pwd`/head_CMD_TestFolder/Head_CMD_TestFile1.txt
    for n in {2..100};
    do
        echo " echo 'TestFile${n}' >> `pwd`/head_CMD_TestFolder/Head_CMD_TestFile1.txt"
        echo 'TestFile${n}' >> `pwd`/head_CMD_TestFolder/Head_CMD_TestFile1.txt
    done 
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Default 10 Lines )
    echo
    echo " Not Option : Default 10 Lines "
    echo " head `pwd`/head_CMD_TestFolder/Head_CMD_TestFile1.txt"
    head `pwd`/head_CMD_TestFolder/Head_CMD_TestFile1.txt
    echo
    # Example 02 (Option -c : Output bytes specified from behind [newline = 1byte] )
    echo
    echo " Option -c : Output bytes specified from behind [newline = 1byte] "
    echo " head -c 17 `pwd`/head_CMD_TestFolder/Head_CMD_TestFile1.txt"
    head -c 17 `pwd`/head_CMD_TestFolder/Head_CMD_TestFile1.txt
    echo
    # Example 03 (Option -n : Output lines specified from behind )
    echo
    echo " Option -n : Output lines specified from behind "
    echo " head -n 17 `pwd`/head_CMD_TestFolder/Head_CMD_TestFile1.txt"
    head -n 17 `pwd`/head_CMD_TestFolder/Head_CMD_TestFile1.txt
    echo
    # Example End
    echo
    echo "## head End ##"
    echo
}

head_ShowFileContentHead