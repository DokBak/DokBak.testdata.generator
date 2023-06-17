#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [ps]_[CheckProcess]
#------------------------------------------------------------
function ps_CheckProcess(){
    echo 
    echo "## ps Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : ps "
    echo " HowToUse : ps [Option] "  
    echo "            [Option : -f] : Process Info "
    echo "            [Option : -e] : All User Process List "
    echo "            [Option : -l] : Process Info + resource, runtime "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " ps "
    ps
    echo
    # Example 02 (Option -f : Process Info)
    echo
    echo " ps -f "
    ps -f
    echo
    # Example 03 (Option -e : All User Process List)
    echo
    echo " ps -e "
    ps -e
    echo
    # Example 04 (Option -l : Process Info + resource, runtime)
    echo
    echo " ps -l "
    ps -l
    echo
    # Example End
    echo
    echo "## ps End ##"
    echo 
}

ps_CheckProcess