#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [If]_[ConditionExtensionsCompare]
#------------------------------------------------------------
function if_ConditionExtensionsCompare(){
    echo
    echo "## if Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : if"
    echo " HowToUse : if [[ condition ]]; [ content ]; then elif [[ condition ]]; [ content ]; else [ content ]; fi "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : Create Variable
    Var1="Seoul"
    Var2=10
    echo
    # Preparation End
    # Example Start
    # Example 01 ( Comparison of regular expressions )
    echo
    if [[ $Var1 =~ S...l  ]]; then echo " if_Data1 : $Var1 "; fi
    echo
    # Example 02 ( Compare logical expressions (||, &&) possible )
    echo
    if [[ $Var1 == "SEOUL" || $Var1 == "Seoul" ]]; then echo " if_Data2 : $Var1 "; fi
    echo
    # Example 03 ( <,> comparison >=, <= not possible )
    echo
    if [[ $Var2 < 11 ]]; then echo " if_Data3 : $Var2 "; fi
    echo
    # Example End
    echo
    echo "## if End ##"
    echo
}

if_ConditionExtensionsCompare