#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Id]_[ShowId]
#------------------------------------------------------------
function id_ShowId(){
    echo 
    echo "## id Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : id"
    echo " HowToUse : id [Option] "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " id "
    id 
    echo 
    # Example 02 (Option -u : Current User UID)
    echo
    echo " id -u "
    id -u
    echo
    # Example 03 (Option -g : Current User GID)
    echo
    echo " id -g "
    id -g
    echo
    # Example 04 (Option -G : Current User All Group ID)
    echo
    echo " id -G "
    id -G
    echo
    # Example 05 (Option -F : Group Name(,))
    echo
    echo " id -F "
    id -F
    echo
    # Example End
    echo 
    echo "## id End ##"
    echo 
}

id_ShowId