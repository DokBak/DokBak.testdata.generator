#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [set]_[LocalEnvironmentalVariable]
#------------------------------------------------------------
function set_LocalEnvironmentalVariable(){
    echo 
    echo "## set Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : set "
    echo " HowToUse : set "  
    echo "            [Option : -o] : variable Activation "
    echo "            [Option : +o] : variable Deactivation "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Environment variable Set )
    echo
    echo " Not Option : Environment variable output "
    echo " set "
    set
    echo
    # Example 02 (Not Option : grep ENV_PARAM )
    echo
    echo " Not Option : grep ENV_PARAM "
    echo " env | grep ENV_PARAM "
    env | grep ENV_PARAM
    echo " set | grep ENV_PARAM "
    set | grep ENV_PARAM
    echo
    # Example 03 (Not Option : grep ENV_PARAM -> Local_ENV )
    echo
    echo " Not Option : grep ENV_PARAM -> Local_ENV "
    echo " ENV_PARAM=Local_ENV "
    ENV_PARAM=Local_ENV
    echo " env | grep ENV_PARAM "
    env | grep ENV_PARAM
    echo " set | grep ENV_PARAM "
    set | grep ENV_PARAM
    echo
    # Example 04 (Not Option : grep ENV_PARAM -> Global_ENV )
    echo
    echo " Not Option : grep ENV_PARAM -> Global_ENV  "
    echo " export ENV_PARAM=Global_ENV "
    export ENV_PARAM=Global_ENV
    echo " env | grep ENV_PARAM "
    env | grep ENV_PARAM
    echo " set | grep ENV_PARAM "
    set | grep ENV_PARAM
    echo
    # Example 05 (Option -o : variable Activation )
    echo
    echo " Option -o : variable Deactivation "
    echo " set -o vi "
    set -o vi
    echo
    # Example 06 (Option +o : variable Deactivation )
    echo
    echo " Option +o : variable Activation "
    echo " set +o vi "
    set +o vi
    echo
    # Example End
    echo
    echo "## set End ##"
    echo 
}

set_LocalEnvironmentalVariable