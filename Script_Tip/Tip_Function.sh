#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tip]_[Function]
#------------------------------------------------------------
function Tip_Function(){
    echo
    echo "## Function Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : Function"
    echo " HowToUse : Function [Argument1] [Argument2] ..."
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    TestFunc1 TestParam1
    echo
    # Example 02
    echo
    TestFunc1 TestFunc2 TestParam2
    echo
    # Example 03
    echo
    TestFunc3
    echo
    # Example 04
    echo
    TestFunc3
    echo
    # Example End
    echo
    echo "## Function End ##"
    echo
}

function TestFunc1(){
    echo "TestFunc1 Start "
    echo "TestFunc1, Param1 : $1"
    echo "TestFunc1 End "
}

function TestFunc2(){
    echo "TestFunc2 Start "
    echo "TestFunc2, Param1 : $1"
    echo "TestFunc2 End "
}

TestFunc3() { echo "TestFunc3 print1"; echo "TestFunc3 print2"; }

function TestFunc4 { echo "TestFunc4 print1"; echo "TestFunc4 print2"; }

Tip_Function