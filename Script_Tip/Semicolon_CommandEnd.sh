#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 다중명령
#-------------------------
function ShellScriptMultiCommand(){
    echo 
    echo "## 쉘 스크립트 다중명령 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 한 줄에 여러 명령을 수행하는 방법"
    echo
    echo " 사용법) 한 줄에 여러 명령을 실행하는 방법. 하나의 명령 뒤에 ;로 명령어 종료를 알려주면된다."
    echo 
    echo " 예시1) cal; pwd; date;"
    echo
    cal; pwd; date;
    echo 
    echo "## 쉘 스크립트 다중명령 종료 ##"
    echo 
}

ShellScriptMultiCommand