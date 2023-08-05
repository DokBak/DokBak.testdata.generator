#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [expr]_[Calculate]
#------------------------------------------------------------
function expr_Calculate(){
    echo
    echo "## expr Start ##"
    echo
    # Basic Information Start
    echo
    echo " HowToUse : expr Var1 + Var2 "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo " NumVar1=8 "
    NumVar1=8
    echo " NumVar1 : $NumVar1 "
    echo
    echo " NumVar2=5 "
    NumVar2=5
    echo " NumVar2 : $NumVar2 "
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    ADDVar=` expr $NumVar1 '+' $NumVar2 `
    echo " ADDVar : $NumVar1 + $NumVar2 = ` expr $NumVar1 '+' $NumVar2 ` "
    SUBVar=` expr $NumVar1 '-' $NumVar2 `
    echo " SUBVar : $NumVar1 - $NumVar2 = ` expr $NumVar1 '-' $NumVar2 ` "
    MULVar=` expr $NumVar1 '*' $NumVar2 `
    echo " MULVar : $NumVar1 * $NumVar2 = ` expr $NumVar1 '*' $NumVar2 ` "
    DIVVar=` expr $NumVar1 '/' $NumVar2 `
    echo " DIVVar : $NumVar1 / $NumVar2 = ` expr $NumVar1 '/' $NumVar2 ` "
    MODVar=` expr $NumVar1 '%' $NumVar2 `
    echo " MODVar : $NumVar1 % $NumVar2 = ` expr $NumVar1 '%' $NumVar2 ` "
    echo
    # Example End
    echo
    echo "## expr End ##"
    echo
}

expr_Calculate