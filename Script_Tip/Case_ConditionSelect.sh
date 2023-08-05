#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Case]_[ConditionSelect]
#------------------------------------------------------------
function case_ConditionSelect(){
    echo
    echo "## Case Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : Case"
    echo " HowToUse : Case [Argument1] in [Var1]) ;; *) esac "
    echo "            [Var]1 ) : condition "
    echo "                 * ) : default condition "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    echo " insert : kr jp us "
    echo " read caseVar "
    read caseVar
    echo 
    case "$caseVar" in
        kr)
            echo " $caseVar is kr "
            ;;
        jp)
            echo " $caseVar is jp "
            ;;
        us)
            echo " $caseVar is us "
            ;;
        *) echo " caseVar ? " # default
    esac
    echo
    # Example 02
    echo
    echo " insert : kr jp us "
    echo " read caseVar "
    read caseVar
    case "$caseVar" in kr) echo " $caseVar is kr2 ";; jp) echo " $caseVar is jp2 ";; us) echo " $caseVar is us ";; *) echo " caseVar2 ? "; esac
    echo
    # Example End
    echo
    echo "## Case End ##"
    echo
}

case_ConditionSelect