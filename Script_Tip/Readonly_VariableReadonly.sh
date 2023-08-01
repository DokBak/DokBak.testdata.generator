#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Readonly]_[VariableReadonly]
#------------------------------------------------------------
function readonly_VariableReadonly(){
    echo
    echo "## readonly Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : readonly"
    echo " HowToUse : readonly [Variable]=[Value] "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : Create Variable
    echo " readonly ReadonlyVariString=VariString "
    readonly ReadonlyVariString=VariString
    echo 
    # Preparation End
    # Example Start
    # Example 01
    echo
    echo " Variable reset not possible " 
    echo " ReadonlyVariString=Testing "
    ReadonlyVariString=Testing
    echo
    # Example End
    echo
    echo "## readonly End ##"
    echo
}

readonly_VariableReadonly