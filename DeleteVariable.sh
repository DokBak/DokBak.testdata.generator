#!/bin/sh

#-------------------------
# 테스트 쉘 : 환경 변수 삭제
#-------------------------
function DeleteVariable(){
    echo 
    echo "## 환경 변수 삭제 시작 ##"
    echo " 명령어  : unset"
    echo " 사용방법 : unset [변수명]"
    echo " 기본설명 : unset 이후 작성된 변수(전역변수)를 삭제한다. 영구적으로 삭제 되는 것이 아닌 프로세스가 종료되기 전까지 삭제. 영구적으로 삭제하려면 환경설정파일을 수정하여 삭제하여야한다."
    echo
    echo " 사전실행) export GLOBALVAR=GLOBALDATA"
    export GLOBALVAR=GLOBALDATA
    echo "         env | grep GLOBALVAR"
    env | grep GLOBALVAR
    echo
    echo " 예시1) unset GLOBALVAR"
    unset GLOBALVAR
    echo "       env | grep GLOBALVAR"
    env | grep GLOBALVAR
    echo
    echo "## 환경 변수 삭제 종료 ##"
    echo 
}

DeleteVariable