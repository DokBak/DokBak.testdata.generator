#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Continue]_[LoopContinue]
#------------------------------------------------------------
function continue_LoopContinue(){
    echo
    echo "## continue Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : continue"
    echo " HowToUse : continue [Argument1] "
    echo "            [Argument1] : continue area "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    loopNum=0
    while true
    do
        loopNum=` expr $loopNum + 1 `
        if [[ $loopNum -le "3" ]]
        then
            echo " first while loop $loopNum "
        elif [[ $loopNum -le "5" ]]
        then
            continue 
        elif [[ $loopNum -le "8" ]]
        then
            echo " first while loop $loopNum "
        elif [[ $loopNum -le "10" ]]
        then
            continue 1
        elif [[ $loopNum -gt "10" ]]
        then    
            while true
            do 
                if [[ $loopNum -le "13" ]]
                then
                echo " second while loop $loopNum "
                loopNum=$(( loopNum + 1))
                elif  [[ $loopNum -le "15" ]]
                then
                continue 2
                elif  [[ $loopNum -le "18" ]]
                then
                echo " second while loop $loopNum "
                loopNum=$(( loopNum + 1))
                elif  [[ $loopNum -gt "18" ]]
                then
                    while true
                    do 
                        if [[ $loopNum -le "21" ]]
                        then
                            echo " third while loop $loopNum "
                            loopNum=$(( loopNum + 1))
                        elif [[ $loopNum -le "25" ]]
                        then
                            continue 3
                        elif [[ $loopNum -le "30" ]]
                        then
                            echo " third while loop $loopNum "
                            loopNum=$(( loopNum + 1))
                        else
                            break 3
                        fi
                    done
                fi
            done 
        elif [[ $loopNum == "40" ]]
        then
            break
        fi
    done
    echo
    # Example End
    echo
    echo "## continue End ##"
    echo
}

continue_LoopContinue 