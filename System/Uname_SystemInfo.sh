#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [uname]_[SystemInfo]
#------------------------------------------------------------
function uname_SystemInfo(){
    echo 
    echo "## uname Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : uname "
    echo " HowToUse : uname "  
    echo "            [Option : -s] : Kernel Name "
    echo "            [Option : -n] : Network Host Name "
    echo "            [Option : -r] : Kernel Release Version "
    echo "            [Option : -v] : Kernel Version "
    echo "            [Option : -m] : System Hardware Type Info "
    echo "            [Option : -p] : Processor Type "
    echo "            [Option : -a] : All Info (-s -n -r -v -m) "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " uname "
    uname
    echo
    # Example 02 (Option -s : Kernel Name )
    echo
    echo " uname -s "
    uname -s
    echo
    # Example 03 (Option -n : Network Host Name )
    echo    
    echo " uname -n "
    uname -n
    echo    
    # Example 04 (Option -r : Kernel Release Version )
    echo
    echo " uname -r "
    uname -r
    echo    
    # Example 05 (Option -v : Kernel Version )
    echo
    echo " uname -v "
    uname -v
    echo    
    # Example 06 (Option -m : System Hardware Type Info )
    echo
    echo " uname -m "
    uname -m
    echo    
    # Example 07 (Option -p : Processor Type )
    echo
    echo " uname -p "
    uname -p
    echo    
    # Example 08 (Option -a : All Info (-s -n -r -v -m) )
    echo    
    echo " uname -a "
    uname -a
    uname -snrvm
    echo
    # Example End
    echo
    echo "## uname End ##"
    echo 
}

uname_SystemInfo