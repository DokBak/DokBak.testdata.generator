#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 명령 결과에 추가 명령
#-------------------------
function ShellScriptPipeCommand(){
    echo 
    echo "## 쉘 스크립트 명령 결과에 추가 명령 시작 ##"
    echo
    echo " 기본설명 : 쉘 스크립트 명령 결과에 추가 명령"
    echo
    echo " 사용법) 파이프 [ | ] 왼쪽 명령이 먼저 실행되고 실행된 결과로 오른쪽 명령이 실행된다."
    echo
    echo " df | wc -l"
    echo " 「df」 명령을 실행 후 실행 결과로 「wc -l」를 실행한다."
    df | wc -l
    echo
    echo "## 쉘 스크립트 명령 결과에 추가 명령 종료 ##"
    echo 
}

ShellScriptPipeCommand