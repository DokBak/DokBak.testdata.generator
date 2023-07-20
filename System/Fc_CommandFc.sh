#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Fc]_[CommandFc]
#------------------------------------------------------------
function fc_CommandFc(){
    echo
    echo "## fc Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : fc"
    echo " HowToUse : fc [Option] "
    echo "            [Option : -l] : 15 lines of previous command output / Output from oldest command "
    echo "            [Option : -r] : Output from the most recent used command "
    echo "            [Option : -n] : A history corresponding to an argument value is output "
    echo "            [Option : -m] : A history corresponding to an argument value is output [n to m] "
    echo "            [Option : -e] : Use the specified editor "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/fc_CMD_TestFolder/ "
    mkdir -p `pwd`/fc_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'TestFile1 Testing1' > `pwd`/fc_CMD_TestFolder/fc_CMD_TestFile1.txt "
    echo 'TestFile1 Testing1' > `pwd`/fc_CMD_TestFolder/fc_CMD_TestFile1.txt
    echo " echo 'TestFile2 Testing2' > `pwd`/fc_CMD_TestFolder/fc_CMD_TestFile2.txt "
    echo 'TestFile2 Testing2' > `pwd`/fc_CMD_TestFolder/fc_CMD_TestFile2.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Edit and enable previous commands )
    echo
    echo " fc "
    fc 
    echo
    # Example 02 (Option -l : 15 lines of previous command output / Output from oldest command )
    echo
    echo " fc -l "
    fc -l
    echo
    # Example 03 (Option -r : Output from the most recent used command )
    echo
    echo " fc -l -r "
    fc -l -r
    echo
    # Example 04 (Option -n : A history corresponding to an argument value is output )
    echo
    echo " fc -l -r -3 "
    fc -l -r -3
    echo
    # Example 05 (Option -n -m : A history corresponding to an argument value is output [n to m] )
    echo
    echo " fc -l -r -3 -5 "
    fc -l -r -3 -5
    echo
    # Example 06 (Option -e : Use the specified editor )
    echo
    echo " fc -e vim "
    fc -e vim
    echo
    # Example End
    echo
    echo "## fc End ##"
    echo
}

fc_CommandFc