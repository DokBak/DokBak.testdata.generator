#!/bin/sh

#-------------------------
# 테스트 쉘 : 리눅스 명령어 사용법 확인
#-------------------------
function HowToUseCommand(){
    echo 
    echo "## 리눅스 명령어 사용법 확인 시작 ##"
    echo " 명령어  : man"
    echo " 사용방법 : man [명령어]"
    echo " 기본설명 : [명령어]의 사용법, 혹은 옵션의 상세 내용을 출력해준다. 편집기로 열리는데 사용법 확인후 q 입력후 엔터로 종료한다."
    echo
    echo " 예시1) man cd"
    man cd 
    echo
    echo "## 리눅스 명령어 사용법 확인 종료 ##"
    echo 
}

HowToUseCommand