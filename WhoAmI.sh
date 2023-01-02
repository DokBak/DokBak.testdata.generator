#!/bin/sh

#-------------------------
# 테스트 쉘 : 작업중인 사용자 출력
#-------------------------
function WhoAmI(){
    echo 
    echo "## 작업중인 사용자 출력 시작 ##"
    echo " 명령어  : whoami"
    echo " 사용방법 : whoami"
    echo " 기본설명 : 현재 작업중인 사용자를 출력한다."
    echo
    echo " 예시1) whoami"
    whoami
    echo
    echo "## 작업중인 사용자 출력 종료 ##"
    echo 
}

WhoAmI