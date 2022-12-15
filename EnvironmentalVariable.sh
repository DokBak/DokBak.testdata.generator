#!/bin/sh

#-------------------------
# 테스트 쉘 : 전역 변수 조회
#-------------------------
function EnvironmentalVariable(){
    echo 
    echo "## 전역 변수 조회 시작 ##"
    echo " 명령어  : env"
    echo " 사용방법 : env"
    echo " 기본설명 : 전역 변수 조회, export 명령어로 일시적으로 전역 변수를 선언 할 수 있다."
    echo "          모든 사용자가 사용가능하도록 등록하고 싶을 경우에는 쉘 환경 설정 파일을 수정한다."
    echo " zsh쉘 변경 시작 : vi ~/.zshrc, zsh쉘 수정 내용 반영 : source ~/.zshrc"
    echo " bash쉘 변경 시작 : vi ~/bash_profile, bahs쉘 수정 내용 반영 : source ~/bash_profile"
    echo
    echo " 예시1) env"
    env
    echo
    echo " 옵션 -0 : 환경 변수들이 새줄로 표시되지 않고 NUL로 표시되어 모든 전역 변수들이 한 줄에 출력된다."
    echo " 예시2) env -0"
    env -0
    echo
    echo " 옵션 -u : 해당 환경 변수를 출력하지 않고 실행시킨다."
    echo " 예시3) env -u TESTenv"
    export TESTenv="TESTenvV"
    echo "새로 등록한 변수 확인 TESTenv : ${TESTenv}"
    env -u TESTenv
    echo
    echo " 옵션 -i : 설정된 환경 변수를 출력하지 않고 지정한 임의의 값으로 출력시킨다.(환경변수 자체가 수정되는 것은 아니다.)"
    echo " 예시4) env -i TESTenv=TESTenvVV"
    env -i TESTenv=TESTenvVV
    echo
    echo "## 전역 변수 조회 종료 ##"
    echo 
}

EnvironmentalVariable