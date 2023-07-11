#!/bin/sh

#-------------------------
# 테스트 쉘 : 루프문 강제 종료
#-------------------------
function LoopTermination(){
    echo 
    echo "## 루프문 강제 종료 시작 ##"
    echo
    echo " 명령어  : break"
    echo " 사용방법 : break [아규먼트] "
    echo " 기본설명 : 루프문 내에서 break를 사용하면 루프문을 종료할수 있으며 중첩루프문인 경우 숫자로된 [아규먼트]를 지정하면 원하는 루프문을 종료시킬수 있다."
    echo "          3중 중첩 루프문인경우 [아규먼트]가 3인경우 제일 바깥쪽 루프, 2인 경우 그 안쪽 루프, 1인경우 제일 안쪽의 루프가 종료된다. 숫자가 커질수록 바깥쪽 루프"
    echo
    echo " 예시1) 데이터를 입력해주세요. 1:안쪽 루프가 종료, 2:중간 루프가 종료, 3:바깥쪽 루프가 종료"
    read inputbreak
    
    while true
    do
        echo "바깥쪽 루프 시작"
        if [[ $inputbreak == "3" ]]
        then
            echo "바깥쪽 루프에서 종료"
            break 1
        else
            while true
            do
                echo "중간 루프 시작"
                if [[ $inputbreak == "2" ]]
                then
                    echo "중간 루프에서 종료"
                    break 2
                else
                    while true
                    do
                        echo "안쪽 루프 시작"
                        if [[ $inputbreak == "1" ]]
                        then
                            echo "안쪽 루프 종료"
                            break 3
                        else
                            echo "입력값 : $inputbreak"
                            echo "1,2,3 중에서 입력해주세요."
                            break 3
                        fi
                    done
                fi
            done
        fi
    done
    echo
    echo "## 루프문 강제 종료 종료 ##"
    echo 
}

LoopTermination