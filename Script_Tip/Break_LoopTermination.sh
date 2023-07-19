#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Break]_[LoopTermination]
#------------------------------------------------------------
function break_LoopTermination(){
    echo
    echo "## break Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : break"
    echo " HowToUse : break [Argument1] "
    echo "            [Argument1] : break area "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    while true
    do
        echo " read inputbreak "
        read inputbreak
            echo " first loop start "
        if [[ $inputbreak == "1" ]]
        then
            echo " first loop end "
            break 1
        else
            while true
            do
                echo " second loop start "
                if [[ $inputbreak == "2" ]]
                then
                    echo " second loop end "
                    break 2
                else
                    while true
                    do
                        echo " third loop start "
                        if [[ $inputbreak == "3" ]]
                        then
                            echo " third loop end "
                            break 3
                        else
                            echo "please insert [1] or [2] or [3] "
                            break
                        fi
                    done
                    break
                fi
            done
        fi
    done
    echo
    # Example End
    echo
    echo "## break End ##"
    echo
}

break_LoopTermination