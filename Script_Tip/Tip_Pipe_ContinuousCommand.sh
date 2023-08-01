#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tip]_[Pipe_ContinuousCommand]
#------------------------------------------------------------
function Tip_Pipe_ContinuousCommand(){
    echo
    echo "## pipe Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : pipe"
    echo " HowToUse : [Command] | [Command] ..."
    echo
    # Basic Information End
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 
    echo
    echo " ps -ef "
    echo " ps -ef | grep System "
    echo " ps -ef | grep System | head -n 5 "
    echo " ps -ef | grep System | head -n 5 | wc -l "
    ps -ef | grep System | head -n 5 | wc -l
    echo
    # Example End
    echo
    echo "## pipe End ##"
    echo
}

Tip_Pipe_ContinuousCommand