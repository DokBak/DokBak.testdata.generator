#!/bin/sh

#-------------------------
# 테스트 쉘 : 네트워크 연결 확인
#-------------------------
function NetworkConnecting(){
    echo 
    echo "## 네트워크 연결 확인 시작 ##"
    echo
    echo " 명령어  : ping"
    echo " 사용방법 : ping [옵션] [IP주소 or 도메인주소]"
    echo " 기본설명 : 파라미터로 지정되어있는 [IP주소 or 도메인주소]과의 통신이 잘 이루어 지는지를 확인가능하다."
    echo
    echo " 예시1) ping google.com"
    ping google.com
    echo
    echo "## 네트워크 연결 확인 종료 ##"
    echo 
}

NetworkConnecting