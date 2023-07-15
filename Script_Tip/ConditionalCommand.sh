#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 조건명령
#-------------------------
function ShellScriptConditionalCommand(){
    echo 
    echo "## 쉘 스크립트 조건명령 시작 ##"
    echo
    echo " 기본설명 : 쉘 스크립트에서 이전 명령의 실행 여부에 따라 실행하는 방법"
    echo
    echo " 사용법) 명령1 && 명령2 : 명령1이 실행되지 않으면 명령2도 실행되지 않는다."
    echo "       명령1 || 명령2 : 명령1이 실행되면 명령2는 실행되지 않는다."
    echo 
    echo " 예시1) pwd && date"
    echo
    pwd && date
    echo 
    echo " 예시2) pwdd && date"
    echo
    pwdd && date
    echo 
    echo " 예시3) pwd || date"
    echo
    pwd || date
    echo 
    echo " 예시4) pwdd || date"
    echo
    pwdd || date
    echo 
    echo "## 쉘 스크립트 조건명령 종료 ##"
    echo 
}

ShellScriptConditionalCommand