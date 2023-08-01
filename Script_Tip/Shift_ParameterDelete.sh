#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Shift]_[ParameterDelete]
#------------------------------------------------------------
function shift_ParameterDelete(){
    echo
    echo "## shift Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : shift"
    echo " HowToUse : shift [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo
    # Basic Information End
    echo
    echo " set Kor Jap Usa Eng "
    set Kor Jap Usa Eng
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    echo "Current number of parameters : $# , Parameter output : $* "
    shift
    echo "Current number of parameters : $# , Parameter output : $* "
    shift 2
    echo "Current number of parameters : $# , Parameter output : $* "
    shift 
    echo "Current number of parameters : $# , Parameter output : $* "
    shift
    echo
    # Example 02
    echo
    echo " date : " `date`
    set $(date)
    while (( $# > 0 ))
    do
        echo $1
        shift
    done
    echo
    # Example End
    echo
    echo "## shift End ##"
    echo
}

shift_ParameterDelete 