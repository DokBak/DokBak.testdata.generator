#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [While]_[WhileLoop]
#------------------------------------------------------------
function while_WhileLoop(){
    echo
    echo "## while Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : while"
    echo " HowToUse : While [ loop_condition ]; do [ content ]; done "
    echo "           [ loop_condition ] true is run "
    echo
    # Basic Information End
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    number=0
    while [ $number -lt 10 ] 
    do
    echo "$number"
    number=`expr $number + 1`
    done
    echo 
    # Example 02
    echo
    while [ $number -lt 20 ]; do echo "$number"; number=`expr $number + 1`; done
    echo
    # Example End
    echo
    echo "## while End ##"
    echo
}

while_WhileLoop