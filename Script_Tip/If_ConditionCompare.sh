#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [If]_[ConditionCompare]
#------------------------------------------------------------
function if_ConditionCompare(){
    echo
    echo "## if Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : if"
    echo " HowToUse : if [ condition ]; [ content ]; then elif [ condition ]; [ content ]; else [ content ]; fi "
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
    # Example 01
    echo
    if [ $Var1 = "Seoul" ]
    then 
        echo " (=) "
        echo " Ture : [ "Seoul" = "Seoul" ] " 
    fi
    echo
    if [ $Var1 != "SEOUL" ]
    then 
        echo " (!=) "
        echo " False : [ "Seoul" != "SEOUL" ] " 
    fi
    echo
    if [ $Var2 -eq 10 ]
    then 
        echo " (=) "
        echo " Ture : [ 10 -eq 10 ] " 
    fi
    echo
    if [ $Var2 -ne 11 ]
    then 
        echo " (!=) "
        echo " Ture : [ 10 -ne 11 ] " 
    fi
    echo
    if [ 10 -eq 10 -a 11 -eq 12 ] 
    then
        echo " (and) "
        echo " False : [ 10 -eq 10 -a 11 -eq 12 ] " 
    fi
    echo
    if [ 10 -eq 10 -a 11 -eq 11 ] 
    then 
        echo " (and) "
        echo " Ture : [ 10 -eq 10 -a 11 -eq 11 ]" 
    fi
    echo
    if [ 10 -eq 11 -o 11 -eq 12 ] 
    then 
        echo " (or) "
        echo " False : [ 10 -eq 11 -o 11 -eq 12 ]" 
    fi
    echo
    if [ 10 -eq 10 -o 11 -eq 12 ] 
    then 
        echo " (or) "
        echo " Ture : [ 10 -eq 10 -o 11 -eq 12 ]" 
    fi
    echo
    if [ ! 10 -eq 10 ] 
    then 
        echo " False : [ ! 10 -eq 10  ]" 
    fi
    echo
    if [ ! 10 -eq 11 ]
    then 
        echo " Ture : [ ! 10 -eq 11 ]" 
    fi
    echo
    if [ 10 -gt 10 ] 
    then 
        echo " (>) "
        echo " False : [ 10 -gt 10  ]" 
    fi
    echo
    if [ 10 -gt 11 ]
    then 
        echo " (>) "
        echo " False : [ 10 -gt 11 ]" 
    fi
    echo
    if [ 10 -gt 9 ]
    then 
        echo " (>) "
        echo " Ture : [ 10 -gt 9 ]" 
    fi
    echo
    if [ 10 -ge 11 ]
    then 
        echo " (>=) "
        echo " False : [ 10 -ge 11 ]" 
    fi
    echo
    if [ 10 -ge 10 ]
    then 
        echo " (>=) "
        echo " Ture : [ 10 -ge 10 ]" 
    fi
    echo
    if [ 10 -lt 10 ] 
    then 
        echo " (<) "
        echo " False : [ 10 -lt 10  ]" 
    fi
    echo
    if [ 10 -lt 9 ]
    then 
        echo " (<) "
        echo " False : [ 10 -lt 9 ]" 
    fi
    echo
    if [ 10 -lt 11 ]
    then 
        echo " (<) "
        echo " Ture : [ 10 -lt 11 ]" 
    fi
    echo
    if [ 10 -le 9 ] 
    then 
        echo " (<=) "
        echo " False : [ 10 -le 9  ]" 
    fi
    echo
    if [ 10 -le 10 ]
    then 
        echo " (<=) "
        echo " Ture : [ 10 -le 10 ]" 
    fi
    echo
    # Example 02
    echo
    if [ $Var2 = 11 ]; then echo " if_Data : $Var2 "; elif [ $Var2 = 9 ]; then echo " elif_Data : $Var2 "; else echo " else_Data : $Var2 "; fi
    echo
    # Example End
    echo
    echo "## if End ##"
    echo
}

if_ConditionCompare