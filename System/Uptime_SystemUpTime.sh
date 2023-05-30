#!/bin/sh

#-------------------------
# 테스트 쉘 : 시스템 실행 시간정보
#-------------------------
function SystemUpTime(){
    echo 
    echo "## 시스템 실행 시간정보 시작 ##"
    echo
    echo " 명령어  : uptime"
    echo " 사용방법 : uptime [옵션] "
    echo " 기본설명 : 시스템 실행 시간 정보를 출려"
    echo
    echo " 예시1) uptime"
    echo " 부가설명) 옵션없이 실행하는 경우 [현재시각], [실행시간], [사용자 수], [시스템 부하 평균(1분,5분,15분]"
    uptime
    echo 
    echo "## 시스템 실행 시간정보 종료 ##"
    echo 
}

SystemUpTime