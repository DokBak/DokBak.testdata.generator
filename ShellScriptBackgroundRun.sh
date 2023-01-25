#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 백그라운드 실행
#-------------------------
function ShellScriptBackgroundRun(){
    echo 
    echo "## 쉘 스크립트 백그라운드 실행 시작 ##"
    echo
    echo " 기본설명 : 쉘 스크립트를 백그라운드 실행하는 방법"
    echo
    echo " 사용법) 명령 뒤에 & 를 작성하면 쉘 프롬프트는 즉시 출력되고 실행한 명령은 백그라운드로 처리된다."
    echo
    echo "man bash &"
    man bash &
    echo
    echo "실행된 man bash 의 PID : $!"
    echo 
    echo "kill -9 $!"
    kill -9 $!
    echo 
    echo "## 쉘 스크립트 백그라운드 실행 종료 ##"
    echo 
}

ShellScriptBackgroundRun