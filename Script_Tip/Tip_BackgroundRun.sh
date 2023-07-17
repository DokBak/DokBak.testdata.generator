#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tip]_[BackgroundRun]
#------------------------------------------------------------
function Tip_BackgroundRun(){
    echo
    echo "## BackgroundRun Start ##"
    echo
    # Basic Information Start
    echo
    echo " HowToUse : [Shell to run in the background] & "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    echo " sh `pwd`/Test_Sample/Test_BackgroundRun.sh & "
    sh `pwd`/Test_Sample/Test_BackgroundRun.sh &
    echo 
    echo " ps -ef | grep Test_BackgroundRun.sh "
    ps -ef | grep Test_BackgroundRun.sh
    echo
    echo " $! "
    echo
    echo " kill -9 $! "
    kill -9 $!
    echo
    # Example End
    echo
    echo "## BackgroundRun End ##"
    echo
}

Tip_BackgroundRun