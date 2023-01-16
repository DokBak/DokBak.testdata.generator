#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 반복문(while)
#-------------------------
function ShellScriptLoopWhile(){
    echo 
    echo "## 쉘 스크립트 반복문 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 반복문을 사용하는 방법을 확인"
    echo
    echo " 사용법) while [ 종료 조건 ]; do [ 실행문 ]; done "
    echo " 부가설명) 종료 조건이 달성되기 전까지 do 와 done 사이의 처리가 무한 반복한다."
    echo 
    number=0
    while [ $number -lt 10 ] 
    do
    echo "$number"
    number=`expr $number + 1`
    done
    echo 
    echo " 한 줄 사용법 : while, do, done 이외에는 ;를 추가하여 한줄이 종료되었다는 것을 알린다."
    while [ $number -lt 20 ]; do echo "$number"; number=`expr $number + 1`; done
    echo 
    echo "## 쉘 스크립트 반복문 종료 ##"
    echo 
}

ShellScriptLoopWhile