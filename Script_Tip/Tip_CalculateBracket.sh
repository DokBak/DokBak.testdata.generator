#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tip]_[CalculateBracket]
#------------------------------------------------------------
function Tip_CalculateBracket(){
    echo
    echo "## CalculateBracket Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : CalculateBracket"
    echo " HowToUse : \$(( Var1 + Var2 )) "
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
    ADDVar=$(( $NumVar1 + $NumVar2 ))
    echo " ADDVar : \$(( $NumVar1 + $NumVar2 )) = $(( $NumVar1 + $NumVar2 )) "
    SUBVar=$(( $NumVar1 - $NumVar2 ))
    echo " SUBVar : \$(( $NumVar1 - $NumVar2 )) = $(( $NumVar1 - $NumVar2 )) "
    MULVar=$(( $NumVar1 * $NumVar2 ))
    echo " MULVar : \$(( $NumVar1 * $NumVar2 )) = $(( $NumVar1 * $NumVar2 )) "
    DIVVar=$(( $NumVar1 / $NumVar2 ))
    echo " DIVVar : \$(( $NumVar1 / $NumVar2 )) = $(( $NumVar1 / $NumVar2 )) "
    MODVar=$(( $NumVar1 % $NumVar2 ))
    echo " MODVar : \$(( $NumVar1 % $NumVar2 )) = $(( $NumVar1 % $NumVar2 )) "
    echo
    # Example End
    echo
    echo "## CalculateBracket End ##"
    echo
}

Tip_CalculateBracket