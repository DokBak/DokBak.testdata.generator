#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 반복문(for)
#-------------------------
function ShellScriptLoopFor(){
    echo 
    echo "## 쉘 스크립트 반복문(for) 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 반복문을 사용하는 방법을 확인"
    echo
    echo " 사용법) for [ 루프 인덱스 ]; in [ 인덱스리스트 ]; do [ 실행문 ] done "
    echo " 부가설명) 종료 조건이 달성되기 전까지 do 와 done 사이의 처리가 무한 반복한다."
    echo
    echo " 예1)"
    for indexNum in {0..3}
    do
    echo $indexNum
    done 
    echo
    echo " 예2)"
    for indexString in Kor Jap
    do
    echo $indexString
    done
    echo
    echo " 한 줄 사용법 : for, do, done 이외에는 ;를 추가하여 한줄이 종료되었다는 것을 알린다."
    for indexNum in {4..9}; do echo $indexNum; done 
    echo
    echo "## 쉘 스크립트 반복문(for) 종료 ##"
    echo 
}

ShellScriptLoopFor