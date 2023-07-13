#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Echo]_[PrintLine]
#------------------------------------------------------------
function echo_PrintLine(){
    echo
    echo "## echo Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : echo"
    echo " HowToUse : echo [Option] [Argument1] [Argument2] ..."
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -n] : Keep output in one line without printing open characters "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " echo ' Test ' "
    echo ' Test '
    echo
    # Example 02 (Option -n : Keep output in one line without printing open characters )
    echo
    echo " echo -n ' Test ' "
    echo -n ' Test '
    echo
    # Example End
    echo
    echo "## echo End ##"
    echo
}

echo_PrintLine 