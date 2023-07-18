#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tip]_[ConditionalCommand]
#------------------------------------------------------------
function Tip_ConditionalCommand(){
    echo
    echo "## ConditionalCommand Start ##"
    echo
    # Basic Information Start
    echo
    echo " HowToUse : Command1 && Command2 "
    echo "            && ) : If Command1 is not executed, Command2 is not executed "
    echo " HowToUse : Command1 || Command2 "
    echo "            || ) : If Command1 is not executed, Command2 is executed "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    echo " pwd && date "
    pwd && date
    echo 
    # Example 02
    echo
    echo " pwdd && date "
    pwdd && date
    echo
    # Example 02
    echo
    echo " pwd || date "
    pwd || date
    echo 
    # Example 02
    echo
    echo " pwdd || date "
    pwdd || date
    echo
    # Example End
    echo
    echo "## ConditionalCommand End ##"
    echo
}

Tip_ConditionalCommand