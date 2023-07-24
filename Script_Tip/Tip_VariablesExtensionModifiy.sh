#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tip]_[VariablesExtensionModifiy]
#------------------------------------------------------------
function Tip_VariablesExtensionModifiy(){
    echo
    echo "## VariablesExtensionModifiy Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : VariablesExtensionModifiy"
    echo " HowToUse : VariablesExtensionModifiy "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : Create Variable
    echo " TestVariableNotNull=TestVariableNotNull "
    TestVariableNotNull=TestVariableNotNull
    echo " TestVariableNull= "
    TestVariableNull=
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    echo " [:-Word] : If the variable is not null, use the value of the variable as it is "
    echo " [:-Word] : if the variable is null, replace it with [Word] "
    echo " temporary "
    echo " \${TestVariableNotNull:-Test1} : ${TestVariableNotNull:-Test1} "
    echo " \${TestVariableNull:-Test1} : ${TestVariableNull:-Test1} "
    echo
    echo " \${TestVariableNotNull} : ${TestVariableNotNull} "
    echo " \${TestVariableNull} : ${TestVariableNull} "
    echo
    # Example 02
    echo
    echo " [:=Word] : If the variable is not null, use the value of the variable as it is "
    echo " [:=Word] : if the variable is null, replace it with [Word] "
    echo " permanent "
    echo " \${TestVariableNotNull:=Test1} : ${TestVariableNotNull:=Test1} "
    echo " \${TestVariableNull:=Test1} : ${TestVariableNull:=Test1} "
    echo 
    echo " \${TestVariableNotNull} : ${TestVariableNotNull} "
    echo " \${TestVariableNull} : ${TestVariableNull} "
    echo
    # Example 03
    echo
    echo " TestVariableNotNull=TestVariableNotNull "
    TestVariableNotNull=TestVariableNotNull
    echo " TestVariableNull= "
    TestVariableNull=
    echo " [:+Word] : eplace with [Word] if the variable is not null "
    echo " [:+Word] : do nothing if the variable is null "
    echo " temporary "
    echo " \${TestVariableNotNull:+Test1} : ${TestVariableNotNull:+Test1} "
    echo " \${TestVariableNull:+Test1} : ${TestVariableNull:+Test1} "
    echo 
    echo " \${TestVariableNotNull} : ${TestVariableNotNull} "
    echo " \${TestVariableNull} : ${TestVariableNull} "
    echo
    # Example 04
    echo
    echo " [:offset] : Output by offsetting the variable value by the [offset] number from the left "
    echo " temporary "
    echo " \${TestVariableNotNull:6} : ${TestVariableNotNull:6} "
    echo " \${TestVariableNull:6} : ${TestVariableNull:6} "
    echo 
    echo " \${TestVariableNotNull} : ${TestVariableNotNull} "
    echo " \${TestVariableNull} : ${TestVariableNull} "
    echo
    # Example 05
    echo
    echo " [:offset:length] : Set variable value offset by [offset] number from the left and output by [length] "
    echo " temporary "
    echo " \${TestVariableNotNull:6:2} : ${TestVariableNotNull:6:3} "
    echo " \${TestVariableNull:6:2} : ${TestVariableNull:6:3} "
    echo 
    echo " \${TestVariableNotNull} : ${TestVariableNotNull} "
    echo " \${TestVariableNull} : ${TestVariableNull} "
    echo
    # Example 06
    echo
    echo " [:?Word] : If the variable is not null, the variable value is used, and if the variable is null "
    echo " [:?Word] : the shell is terminated after the error output "
    echo " \${TestVariableNotNull:?Test1} : ${TestVariableNotNull:?Test1} "
    echo " \${TestVariableNull:?Test1} : ${TestVariableNull:?Test1} "
    echo
    # Example End
    echo
    echo "## VariablesExtensionModifiy End ##"
    echo
}

Tip_VariablesExtensionModifiy