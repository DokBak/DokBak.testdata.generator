#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [IFS]_[DataSeparator]
#------------------------------------------------------------
function IFS_DataSeparator(){
    echo
    echo "## IFS Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : IFS"
    echo " HowToUse : IFS=[Argument1] "
    echo "            [Argument1] : DataSeparator "
    echo
    # Basic Information End
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    echo ' nation=Korea Japan:China:USA '
    nation="Korea Japan:China:USA"
    NumValue=0
    echo " IFS Defualt : Space "
    for country in $nation
    do  
        NumValue=$(( NumValue + 1 ))
        echo " Defualt : Space -> No. $NumValue : $country"
    done
    echo
    # Example 02
    echo
    echo ' nation=Korea Japan:China:USA '
    nation="Korea Japan:China:USA"
    NumValue=0
    oldifs="$IFS"
    IFS=":"
    echo " IFS : " : " "
    for country in $nation
    do  
        NumValue=$(( NumValue + 1 ))
        echo " IFS : Space -> No. $NumValue : $country"
    done
    echo
    # Example End
    echo
    echo "## IFS End ##"
    echo
}

IFS_DataSeparator