#!/bin/sh

#-------------------------
# 테스트 쉘 : 터미널 화면 초기화
#-------------------------
function TerminalClear(){
    echo 
    echo "## 터미널 화면 초기화 시작 ##"
    echo " 명령어  : clear"
    echo " 사용방법 : clear"
    echo " 기본설명 : 터미널 화면의 내용을 초기화 시킨다. 기존 내용을 엔터로 올리는 것보다 깔끔하게 정리되며, 연속적인 작업후 새로이 작업을 진행할때 사용하면 좋은 명령어"
    echo
    echo " 예시1) clear"
    clear
    echo
    echo "## 터미널 화면 초기화 종료 ##"
    echo 
}

TerminalClear 