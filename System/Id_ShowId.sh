#!/bin/sh

#-------------------------
# 테스트 쉘 : 사용자 정보 출력
#-------------------------
function ShowId(){
    echo 
    echo "## 사용자 정보 출력 시작 ##"
    echo " 명령어  : id"
    echo " 사용방법 : id "
    echo " 기본설명 : 사용자 및 그룹 이름과 숫자 ID"
    echo
    echo " 예시1) id"
    id
    echo
    echo " 옵션 -F : 사용자의 풀네임이 출력"
    echo " 예시2) id -F"
    id -F
    echo
    echo " 옵션 -u : 유효한 사용자 아이디를 숫자로 표기한다."
    echo " 예시3) id -u"
    id -u
    echo
    echo " 옵션 -un : whoami와 같은 출력"
    echo " 예시4) id -un"
    id -un
    echo
    echo "## 사용자 정보 출력 종료 ##"
    echo 
}


ShowId