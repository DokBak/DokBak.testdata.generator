#!/bin/sh

#-------------------------
# 테스트 쉘 : 루프문 하위 처리 무시
#-------------------------
function LoopContinue(){
    echo 
    echo "## 루프문 하위 처리 무시 시작 ##"
    echo
    echo " 명령어  : continue"
    echo " 사용방법 : continue [아규먼트] "
    echo " 기본설명 : 루프문 내에서 continue를 사용하면 루프문 진행중 하위 처리를 진행하지 않고 루프문 처음부터 시작한다. 중첩루프문인 경우 숫자로된 [아규먼트]를 지정하면 원하는 루프문에서 시작할 수 있다."
    echo "          3중 중첩 루프문인경우 [아규먼트]가 3인경우 제일 바깥쪽 루프, 2인 경우 그 안쪽 루프, 1인경우 제일 안쪽의 루프가 재시작된다. 숫자가 커질수록 바깥쪽 루프"
    echo
    echo " 예시1) 데이터를 입력해주세요. 1:안쪽 루프가 실행, 2:중간 루프가 실행, 3:바깥쪽 루프가 실행"
    loopNum=0
    echo "1,2,3 출력 시작"
    while true
    do
        loopNum=$(( loopNum + 1))
        echo $loopNum
        if [[ $loopNum == "3" ]]
        then
            echo "O 또는 o 입력시 1,2,3 재출력"
            read inputbreak
            if [[ $inputbreak == [Oo] ]]
            then
                loopNum=0
                echo "1,2,3 출력 재시작"
                continue 1
            else
                echo "1,2,3,4,5,6 출력 시작"
                while true
                do 
                    loopNum=$(( loopNum + 1))
                    echo $loopNum
                    if [[ $loopNum == "6" ]]
                    then
                        echo "O 또는 o 입력시 1,2,3,4,5,6 재출력"
                        read inputbreak
                        if [[ $inputbreak == [Oo] ]]
                        then
                            loopNum=0
                            echo "1,2,3 재출력 시작"
                            continue 2
                        else
                            echo "1,2,3,4,5,6,7,8,9 출력 시작"
                            while true
                            do 
                                loopNum=$(( loopNum + 1))
                                echo $loopNum
                                if [[ $loopNum == "9" ]]
                                then
                                    echo "O 또는 o 입력시 1,2,3,4,5,6,7,8,9 재출력"
                                    read inputbreak
                                    if [[ $inputbreak == [Oo] ]]
                                    then
                                        loopNum=0
                                        echo "1,2,3 재출력 시작"
                                        continue 3 
                                    else    
                                        break 3
                                    fi
                                fi
                            done
                        fi
                    fi
                done 
            fi
        fi
    done
    echo
    echo "## 루프문 하위 처리 무시 종료 ##"
    echo 
}

LoopContinue 