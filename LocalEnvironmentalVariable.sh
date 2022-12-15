#!/bin/sh

#-------------------------
# 테스트 쉘 : 지역 변수 조회
#-------------------------
function LocalEnvironmentalVariable(){
    echo 
    echo "## 지역 변수 조회 시작 ##"
    echo " 명령어  : set"
    echo " 사용방법 : set"
    echo " 기본설명 : 지역 변수 조회, export 명령어를 사용하지 않은 변수 선언시 지역변수로 선언된다."
    echo
    echo " 예시1) set"
    set
    echo
    echo " 예시2) 전역 변수, 지역 변수 차이 확인"
    echo "   1) 변수 선언전, 변수 검색"
    echo "       env | grep ENV_PARAM"
    env | grep ENV_PARAM
    echo "       set | grep ENV_PARAM"
    set | grep ENV_PARAM
    echo 
    echo "   2) 지역 변수만 선언"
    ENV_PARAM=Local_ENV
    echo "       env | grep ENV_PARAM"
    env | grep ENV_PARAM
    echo "       set | grep ENV_PARAM"
    set | grep ENV_PARAM
    echo
    echo "   3) 전역 변수만 선언"
    export ENV_PARAM=Global_ENV
    echo "       env | grep ENV_PARAM"
    env | grep ENV_PARAM
    echo "       set | grep ENV_PARAM"
    set | grep ENV_PARAM
    echo "   4) 다시 지역 변수만 선언 : function 내부에서 변수를 변경하는 것이기에 local_ENV로 변수 값이 변경된다."
    ENV_PARAM=Local_ENV
    echo "       env | grep ENV_PARAM"
    env | grep ENV_PARAM
    echo "       set | grep ENV_PARAM"
    set | grep ENV_PARAM
    echo
    echo "## 지역 변수 조회 종료 ##"
    echo 
}

LocalEnvironmentalVariable