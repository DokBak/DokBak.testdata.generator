#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [For]_[ForLoop]
#------------------------------------------------------------
function for_ForLoop(){
    echo
    echo "## for Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : for"
    echo " HowToUse : for [ loop_index ] in [ index_list ]; do [ content ] done "
    echo
    # Basic Information End
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    for indexNum in {0..3}
    do
        echo $indexNum
    done 
    echo
    # Example 02
    echo
    for indexString in Kor Jap
    do
        echo $indexString
    done
    echo
    # Example 03
    echo
    for indexNum in {4..9}; do echo $indexNum; done 
    echo
    # Example End
    echo
    echo "## for End ##"
    echo
}

for_ForLoop