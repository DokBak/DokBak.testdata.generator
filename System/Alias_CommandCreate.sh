#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Alias]_[CommandCreate]
#------------------------------------------------------------
function Alias_CommandCreate(){
    echo 
    echo "## Alias Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : Alias"
    echo " HowToUse : Alias [Argument1]='[Argument2]' "
    echo "            [Argument2] : Variable Name "
    echo "            [Argument2] : Value "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo "alias ll='ls -l'"
    alias ll='ls -l'
    echo 
    # Example End
    echo
    echo "## Alias End ##"
    echo 
}

Alias_CommandCreate