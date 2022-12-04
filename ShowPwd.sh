#!/bin/sh

#-------------------------
# 테스트 쉘 : 작업 디렉토리 출력 처리
#-------------------------
function ShowPwd(){
    echo 
    echo "## 작업 디렉토리 출력 시작 ##"
    echo " 명령어  : pwd"
    echo " 사용방법 : pwd [파라미터없음]"
    echo " 기본설명 : 현재 작업 디렉토리를 출력"
    echo " 예시1) pwd"
    pwd
    echo
    echo " 옵션 -L : pwd만 입력하였을때 적용되는 옵션(디폴트값)"
    echo " 예시2) pwd -L"
    pwd -L
    echo
    echo " 옵션 -P : 심볼릭 링크 경로의 경우. 심볼릭 링크 경로의 절대 경로가 출력된다."
    echo " 예시3) pwd -P"
    pwd -P
    echo
    echo "## 작업 디렉토리 출력 종료 ##"
    echo 
}

ShowPwd