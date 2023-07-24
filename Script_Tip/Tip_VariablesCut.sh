#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tip]_[VariablesCut]
#------------------------------------------------------------
function Tip_VariablesCut(){
    echo
    echo "## VariablesCut Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : VariablesCut"
    echo " HowToUse : VariablesCut "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : Create Variable
    echo " TestVariablePattern=AAABBBCCCBBBDDDAAA "
    TestVariablePattern=AAABBBCCCBBBDDDAAA
    echo " TestVariablePattern2=TestingDataCutTestingDataCut "
    TestVariablePattern2=TestingDataCutTestingDataCut
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    echo " [#Variable] : Variable length "
    echo " \${#TestVariablePattern} : ${#TestVariablePattern} "
    echo " \${#TestVariablePattern2} : ${#TestVariablePattern2} "
    echo
    # Example 02
    echo
    echo " [%pattern] : Delete the shortest matched pattern, including end points "
    echo " \${TestVariablePattern%B*A} : ${TestVariablePattern%B*A} "
    echo " \${TestVariablePattern%B*} : ${TestVariablePattern%B*} "
    echo " \${TestVariablePattern2%i*t} : ${TestVariablePattern2%i*t} "
    echo " \${TestVariablePattern2%i*} : ${TestVariablePattern2%i*} "
    echo " \${TestVariablePattern} : ${TestVariablePattern} "
    echo
    # Example 03
    echo
    echo " [%%pattern] : Delete the longest matched pattern, including end points "
    echo " \${TestVariablePattern%%B*A} : ${TestVariablePattern%%B*A} "
    echo " \${TestVariablePattern%%B*} : ${TestVariablePattern%%B*} "
    echo " \${TestVariablePattern2%%i*t} : ${TestVariablePattern2%%i*t} "
    echo " \${TestVariablePattern2%%i*} : ${TestVariablePattern2%%i*} "
    echo " \${TestVariablePattern} : ${TestVariablePattern} "
    echo
    # Example 04
    echo
    echo " [#pattern] : Delete the shortest matched pattern, including the starting point "
    echo " \${TestVariablePattern#A*B} : ${TestVariablePattern#A*B}"
    echo " \${TestVariablePattern#*B} : ${TestVariablePattern#*B}"
    echo " \${TestVariablePattern2#T*i} : ${TestVariablePattern2#T*i}"
    echo " \${TestVariablePattern2#*i} : ${TestVariablePattern2#*i}"
    echo " \${TestVariablePattern} : ${TestVariablePattern}"
    echo
    # Example 05
    echo
    echo " [##pattern] : Delete the longest matched pattern, including the starting point "
    echo " \${TestVariablePattern##A*B} : ${TestVariablePattern##A*B}"
    echo " \${TestVariablePattern##A*B} : ${TestVariablePattern##*B}"
    echo " \${TestVariablePattern2##T*i} : ${TestVariablePattern2##T*i}"
    echo " \${TestVariablePattern2##T*i} : ${TestVariablePattern2##*i}"
    echo " \${TestVariablePattern} : ${TestVariablePattern}"
    echo
    # Example End
    echo
    echo "## VariablesCut End ##"
    echo
}

Tip_VariablesCut