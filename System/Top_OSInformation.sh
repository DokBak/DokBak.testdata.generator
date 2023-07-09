#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [top]_[OSInformation]
#------------------------------------------------------------
function top_OSInformation(){
    echo 
    echo "## top Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : top "
    echo " HowToUse : top [Option] "  
    echo "            [Option : -n] : Line number "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : All Process Monitor )
    echo
    echo " top "
    top
    echo
    # Example 02 (Option -n : 10 Line )
    echo
    echo " top -n 10"
    top -n 10
    echo
    # Example End
    echo
    echo "## top End ##"
    echo 
}

top_OSInformation