#!/bin/sh


#-------------------------
# 테스트 쉘 : 쉘 스크립트 함수
#-------------------------
function ShellScriptFunction(){
    echo 
    echo "## 쉘 스크립트 함수 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 함수를 선언하고 사용하는 방법을 확인"
    echo
    echo " 부가설명) 함수뒤에 작성되는 값들은 모두 파라미터로 적용된다."
    TestFunc1 TestParam1
    echo
    echo " 부가설명) 함수1 함수2 파라미터를 작성하여도 함수1의 파라미터가 2개인것으로 인식되어 실행된다."
    TestFunc1 TestFunc2 TestParam2
    echo 
    echo " 부가설명) 함수 선언시 function을 생략하여 작성하는 방법으로 함수를 선언하여도 된다."
    TestFunc3
    echo 
    echo " 부가설명) 함수명뒤의 () 소괄호를 작성하지 않아도 함수로 인식하여 실행된다."
    TestFunc4
    echo
    echo "## 쉘 스크립트 함수 종료 ##"
    echo 
}

function TestFunc1(){
    echo "TestFunc1 함수 시작"
    echo "TestFunc1, Param1 : $1"
    echo "TestFunc1 함수 종료"
}

function TestFunc2(){
    echo "TestFunc2 함수 시작"
    echo "TestFunc2, Param1 : $1"
    echo "TestFunc2 함수 종료"
}

TestFunc3() { echo "TestFunc3 print1"; echo "TestFunc3 print2"; }

function TestFunc4 { echo "TestFunc4 print1"; echo "TestFunc4 print2"; }

ShellScriptFunction