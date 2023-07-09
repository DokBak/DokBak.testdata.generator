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
    echo "            [Option : -a] : Check up to Sub Directories "
    echo "            [Option : -h] : “Human-readable” output "
    echo "            [Option : -s] : Total Usage Sum Directory "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Check the size of all files )
    echo
    echo " Not Option : Check the size of all files "
    echo " du "
    du
    echo 
    # Example 02 (Not Option : Check the size of current directory )
    echo
    echo " Not Option : Check the size of current directory "
    echo " du `pwd`/ "
    du `pwd`/
    echo
    # Example 03 (Option -a : Check up to Sub Directories )
    echo
    echo " Option -a : Check up to Sub Directories "
    echo " du -a `pwd`/ "
    du -a `pwd`/
    echo
    # Example 04 (Option -h : Human-readable output )
    echo
    echo " Option -h : Human-readable output "
    echo " du -h `pwd`/ "
    du -h `pwd`/
    echo
    # Example 05 (Option -s : Total Usage Sum Directory )
    echo
    echo " Option -s : Total Usage Sum Directory "
    echo " du -s `pwd`/ "
    du -s `pwd`/
    echo
    # Example End
    echo
    echo "## du End ##"
    echo 
}

du_DirectoryUsageCheck