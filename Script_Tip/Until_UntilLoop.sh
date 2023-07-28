#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Until]_[UntilLoop]
#------------------------------------------------------------
function until_UntilLoop(){
    echo
    echo "## until Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : until"
    echo " HowToUse : until [ loop_condition ]; do [ content ]; done "
    echo "           [ loop_condition ] false is run "
    echo
    # Basic Information End
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    number=0
    until [ $number -gt 10 ] 
    do
    echo "$number"
    number=`expr $number + 1`
    done
    echo 
    # Example 02
    echo
    until [ $number -gt 20 ]; do echo "$number"; number=`expr $number + 1`; done
    echo
    # Example End
    echo
    echo "## until End ##"
    echo
}

until_UntilLoop