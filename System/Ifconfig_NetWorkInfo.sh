#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Ifconfig]_[NetWorkInfo]
#------------------------------------------------------------
function ifconfig_NetWorkInfo(){
    echo
    echo "## ifconfig Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : ifconfig"
    echo " HowToUse : ifconfig [Option] [Argument1] "
    echo "            [Argument1] : InterfaceName "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    ifconfig
    echo
    # Example 02 (Not Option)
    echo
    ifconfig en0
    echo
    # Example End
    # Sample Start
    echo
    echo " MAC address Search "
    echo " ifconfig en0 | grep ether "
    ifconfig en0 | grep ether
    echo
    # Sample End
    echo
    echo "## ifconfig End ##"
    echo
}

ifconfig_NetWorkInfo