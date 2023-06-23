#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Du]_[DirectoryUsageCheck]
#------------------------------------------------------------
function du_DirectoryUsageCheck(){
    echo 
    echo "## du Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : du"
    echo " HowToUse : du [Option] [Argument1] "
    echo "            [Argument1] : Directory "
    echo "            [Option : -a] : Check up to Sub Directories) "
    echo "            [Option : -h] : “Human-readable” output) "
    echo "            [Option : -s] : Total Usage Sum Directory) "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " du "
    du
    echo 
    # Example 02 (Option)
    echo
    echo " du `pwd`/ "
    du `pwd`/
    echo
    # Example 03 (Option -a : Check up to Sub Directories)
    echo
    echo " du -a `pwd`/ "
    du -a `pwd`/
    echo
    # Example 04 (Option -h : Human-readable output)
    echo
    echo " du -h `pwd`/ "
    du -h `pwd`/
    echo
    # Example 05 (Option -s : Total Usage Sum Directory)
    echo
    echo " du -s `pwd`/ "
    du -s `pwd`/
    echo
    # Example End
    echo
    echo "## du End ##"
    echo 
}

du_DirectoryUsageCheck