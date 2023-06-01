#!/bin/sh

#-------------------------
# 테스트 쉘 : 기본 출력 처리
#-------------------------
function PrintLine(){
    echo 
    echo "## 기본 출력 처리 시작 ##"
    echo " 명령어 : echo"
    echo " 사용방법 : echo \"[출력할 내용]\""
    echo " 기본설명 : 문자열을 출력시 echo 명령어를 사용. 빈 줄을 출력할 경우 echo 만 작성, echo \"\"또는 \'\' 추가하여도 좋다."
    echo " 예시1) 기본 사용법 : echo \"출력 내용\""
    echo "    옵션 -n : 후행문자를 출력하지 않는다."
    echo
    echo " 예시2) 옵션 -n 사용법 echo -n \"출력 내용\""
    echo -n "   예시1 출력문"
    echo
    echo " 예시3) echo \"\""
    echo ""
    echo
    echo " 예시4) echo ''"
    echo ''
    echo
    echo "## 기본 출력 처리 종료 ##"
    echo 
}

PrintLine 