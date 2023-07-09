#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [More]_[FileContentShow]
#------------------------------------------------------------
function more_FileContentShow(){
    echo 
    echo "## more Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : more "
    echo " HowToUse : more [Option] [Argument1] "  
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/more_CMD_TestFolder/ "
    mkdir -p `pwd`/more_CMD_TestFolder/
    # Preparation : Create File
    echo ' ### more Command  ### ' > `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo '  ' > `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' Exit '
    echo ' more Mode exit : q, Q, :q, :Q, ZZ ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo '  ' > `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' Help '
    echo ' more Help : h H ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo '  ' > `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' Move '
    echo ' 1line down : [downkey], e, j, [enter] ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' 1line up : [upkey], y, k ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' 1page down : f, [space] ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' 1page up : b ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' 0.5page down : d ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' 0.5page up : u ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo '  ' > `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' Search '
    echo ' Search to Next page : /[Search_Word] ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' Search to Previous page : ?[Search_Word] ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo '  ' > `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' Jump '
    echo ' first line : g ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo ' last line : G ' >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo 
    LINENUM=1
    echo "more start $LINENUM" >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    for n in {1..1000} 
    do 
        LINENUM=$(( LINENUM + 1 ))
        echo "more start $LINENUM" >> `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    done
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : like vim, Can't modify )
    echo
    echo " Not Option : like vim, Can't modify "
    echo " more `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt"
    more `pwd`/more_CMD_TestFolder/more_CMD_TestFile1.txt
    echo
    # Example End
    echo
    echo "## more End ##"
    echo 
}

more_FileContentShow