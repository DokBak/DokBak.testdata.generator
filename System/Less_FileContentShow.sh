#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Less]_[FileContentShow]
#------------------------------------------------------------
function less_FileContentShow(){
    echo 
    echo "## less Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : less "
    echo " HowToUse : less [Option] [Argument1] "  
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/less_CMD_TestFolder/ "
    mkdir -p `pwd`/less_CMD_TestFolder/
    # Preparation : Create File
    echo ' ### less Command  ### ' > `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '  ' > `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' Exit '
    echo ' less Mode exit : q, Q, :q, :Q, ZZ ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '  ' > `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' Help '
    echo ' less Help : h H ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '  ' > `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' Move '
    echo ' 1line down : [downkey], e, j, [enter] ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' 1line up : [upkey], y, k ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' 1page down : f, [space] ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' 1page up : b ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' 0.5page down : d ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' 0.5page up : u ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '  ' > `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' Search '
    echo ' Search to Next page : /[Search_Word] ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' Search to Previous page : ?[Search_Word] ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '  ' > `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' Jump '
    echo ' first line : g ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo ' last line : G ' >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo 
    LINENUM=1
    echo "less start $LINENUM" >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    for n in {1..1000} 
    do 
        LINENUM=$(( LINENUM + 1 ))
        echo "less start $LINENUM" >> `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    done
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : like vim, Can't modify )
    echo
    echo " Not Option : like vim, Can't modify "
    echo " less `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt"
    less `pwd`/less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo
    # Example End
    echo
    echo "## less End ##"
    echo 
}

less_FileContentShow