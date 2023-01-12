#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 사용자 입력
#-------------------------
function ShellScriptUserWrite(){
    echo 
    echo "## 쉘 스크립트 사용자 입력 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 유저로부터 입력값을 받아 사용할때의 방법을 확인"
    echo
    echo "name : "
    read name
    echo "sex : "
    read sex
    echo "tel : "
    read tel
    echo 
    echo "입력 값 출력 name : $name, sex : $sex, tel : $tel"
    echo 
    echo "## 쉘 스크립트 사용자 입력 종료 ##"
    echo 
}

ShellScriptUserWrite