#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Sh]_[ShellStart]
#------------------------------------------------------------
function sh_ShellStart(){
    echo
    echo "## sh Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : sh"
    echo " HowToUse : sh [Option] [Argument1] "
    echo "            [Argument1] : ScriptFile_Path "
    echo "            [Option : -x] : Debug mode Start "
    echo "            [Option : -v] : Command Show And Run Start "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " sh `pwd`/Test_Sample/Test_ShellStart.sh "
    sh `pwd`/Test_Sample/Test_ShellStart.sh
    echo
    # Example 02 (Option -x : Debug mode Start )
    echo
    echo " sh -x `pwd`/Test_Sample/Test_ShellStart.sh "
    sh -x `pwd`/Test_Sample/Test_ShellStart.sh
    echo 
    # Example 03 (Option -x : Command Show And Run Start )
    echo
    echo " sh -v `pwd`/Test_Sample/Test_ShellStart.sh "
    sh -v `pwd`/Test_Sample/Test_ShellStart.sh
    echo
    # Example End
    echo
    echo "## sh End ##"
    echo
}

sh_ShellStart