#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Export]_[CreateGlobalVariable]
#------------------------------------------------------------
function export_CreateGlobalVariable(){
    echo 
    echo "## export Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : export"
    echo " HowToUse : export [Option] [Argument1]=[Argument2] "
    echo "            [Argument1] : Variable "
    echo "            [Argument2] : Value "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    export GLOBALVAR=GLOBALDATA
    echo " env | grep GLOBALVAR "
    env | grep GLOBALVAR
    echo 
    # Example End
    echo 
    echo "## export End ##"
    echo 
}

export_CreateGlobalVariable