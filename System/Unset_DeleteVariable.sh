#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [unset]_[DeleteVariable]
#------------------------------------------------------------
function unset_DeleteVariable(){
    echo 
    echo "## unset Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : unset "
    echo " HowToUse : unset "  
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : export
    echo " export GLOBALVAR=GLOBALDATA "
    export GLOBALVAR=GLOBALDATA
    echo " env | grep GLOBALVAR "
    env | grep GLOBALVAR
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " unset GLOBALVAR"
    unset GLOBALVAR
    echo " env | grep GLOBALVAR"
    env | grep GLOBALVAR
    echo
    # Example End
    echo
    echo "## unset End ##"
    echo 
}

unset_DeleteVariable 