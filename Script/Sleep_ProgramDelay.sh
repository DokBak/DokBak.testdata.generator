#!/bin/sh

#-------------------------
# 테스트 쉘 : 작업 간 중간 딜레이 부여
#-------------------------
function ProgramDelay(){
    echo 
    echo "## 작업 간 중간 딜레이 부여 시작 ##"
    echo " 명령어  : sleep"
    echo " 사용방법 : sleep [delayTime(s)]"
    echo " 기본설명 : 프로그램이 순차적으로 작성되어 있는 경우에는 문제가 없는 경우가 많지만, 병렬처리로 작성되어 있는 경우에는 강제적으로 순차적 진행하도록 딜레이를 부여할 수 있다."
    echo
    echo " 예시1) echo 'Test print step1'"
    echo "       sleep 1"
    echo "       echo 'Test print step2'"
    echo "       sleep 1"
    echo "       echo 'Test print step3'"
    echo "       sleep 1"
    echo "       echo 'Test print step4'"
    echo "       sleep 3"
    echo
    echo 'Test print step1'
    sleep 1
    echo 'Test print step2'
    sleep 1
    echo 'Test print step3'
    sleep 1
    echo 'Test print step4'
    sleep 3
    echo
    echo "## 작업 간 중간 딜레이 부여 종료 ##"
    echo 
}

ProgramDelay