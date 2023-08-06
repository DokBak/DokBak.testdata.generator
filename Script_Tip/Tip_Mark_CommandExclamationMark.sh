#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tip]_[Mark_CommandExclamationMark]
#------------------------------------------------------------
function Tip_Mark_CommandExclamationMark(){
    echo
    echo "## mark Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : !"
    echo " HowToUse : ! "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " Preparation "
    # Preparation : Create File
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " !!   : Execute previous command "
    echo
    echo " !3   : Execute the 3th command "
    echo
    echo " !-3  : Execute the 3th command "
    echo
    echo " !p   : Recently executed commands that begin with p "
    echo 
    echo " !?at : Execute the most recently used command containing at "
    echo
    echo " !:2  : Get the 2th argument from the previously used command "
    echo
    echo " !^   : Get the 1th argument from the previously used command "
    echo
    echo " !$   : Gets the last argument from the previously used command "
    echo
    echo " !*   : Get the all argument from the previously used command "
    echo
    # Example End
    echo
    echo "## mark End ##"
    echo
}

Tip_Mark_CommandExclamationMark