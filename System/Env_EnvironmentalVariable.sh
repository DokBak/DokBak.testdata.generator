#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Env]_[EnvironmentalVariable]
#------------------------------------------------------------
function Env_EnvironmentalVariable(){
    echo 
    echo "## Env Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : Env"
    echo " HowToUse : Env [Option] "
    echo "            [Option : -0] : Not NewLine "
    echo "            [Option : -u] : Not include "
    echo
    # Registration Variable #
    echo " zsh Variable Registration  : vi ~/.zshrc "
    echo " zsh Variable Apply         : source ~/.zshrc "
    echo " bash Variable Registration : vi ~/bash_profile "
    echo " bash Variable Apply        : source ~/bash_profile "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo " export TESTenv='TESTenvV' "
    export TESTenv='TESTenvV'
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : All Environment variable output )
    echo
    echo " Not Option : All Environment variable output "
    echo " env "
    env
    echo 
    # Example 02 (Option -0 : Not NewLine )
    echo
    echo " Option -0 : Not NewLine "
    echo " env -0 "
    env -0
    echo
    # Example 03 (Option -u : Not include )
    echo
    echo " Option -u : Not include "
    echo " env -u TESTenv "
    env -u TESTenv
    echo
    # Example End
    echo
    echo "## Env End ##"
    echo 
}

Env_EnvironmentalVariable