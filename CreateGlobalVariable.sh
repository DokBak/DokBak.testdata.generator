#!/bin/sh

#-------------------------
# 테스트 쉘 : 전역 변수 생성
#-------------------------
function CreateGlobalVariable(){
    echo 
    echo "## 전역 변수 생성 시작 ##"
    echo " 명령어  : export"
    echo " 사용방법 : export [변수명]=[변수값]"
    echo " 기본설명 : export 이후 작성된 변수명에 변수값을 넣어서 전역변수로 등록한다. "
    echo
    echo " 예시1) export GLOBALVAR=GLOBALDATA"
    export GLOBALVAR=GLOBALDATA
    echo " 등록된 변수 확인 : env | grep GLOBALVAR"
    env | grep GLOBALVAR
    echo
    echo "## 전역 변수 생성 종료 ##"
    echo 
}

CreateGlobalVariable 