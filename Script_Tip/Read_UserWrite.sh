#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Read]_[UserWrite]
#------------------------------------------------------------
function read_UserWrite(){
    echo
    echo "## read Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : read"
    echo " HowToUse : read [Option] [Argument1] "
    echo "            [Argument1] : Variable "
    echo "            [Option : -p] : Set the value to output before receiving input from the user "
    echo "            [Option : -n] : Set the number of characters to be entered "
    echo "            [Option : -t] : Set the time to wait for input "
    echo "            [Option : -s] : Enables you to receive input in a hidden form [Like the password] "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Receiving Inputs from Users )
    echo
    echo " name : "
    read name
    echo " name : $name "
    echo
    # Example 02 (Option -p : Set the value to output before receiving input from the user )
    echo
    echo " tel : "
    read -p " input your number : " tel
    echo " tel : $tel "
    echo
    # Example 03 (Option -n : Set the number of characters to be entered )
    echo
    echo " nickName : "
    read -n 4 nickName
    echo " nickName : $nickName "
    echo
    # Example 04 (Option -t : Set the time to wait for input )
    echo
    echo " waittime : "
    read -t 3 waittime
    echo " waittime : $waittime "
    echo
    # Example 05 (Option -s : Enables you to receive input in a hidden form [Like the password] )
    echo
    echo " hideString : "
    read -s hideString
    echo " hideString : $hideString "
    echo
    # Example End
    echo
    echo "## read End ##"
    echo
}

read_UserWrite