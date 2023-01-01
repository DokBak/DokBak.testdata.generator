#!/bin/sh

#-------------------------
# 테스트 쉘 : 실행중인 프로세스 출력
#-------------------------
function CheckProcess(){
    echo 
    echo "## 실행중인 프로세스 출력 시작 ##"
    echo " 명령어  : ps "
    echo " 사용방법 : ps "
    echo " 기본설명 : 현재 실행중인 프로세스를 표시해준다. PID : 프로세스번호, TTY : 프로세스가 연결된 터미널, Time : 총 CPU 사용시간, COMMAND : 프로세스의 실행 명령행"
    echo
    echo " 예시1) ps"
    ps
    echo
    echo " 옵션 -A : 다른 사용자에 대한 모든 프로세스까지 표시한다.(-e 도 동일하다.)"
    echo " 예시2) ps -A"
    ps -A
    echo
    echo " 옵션 -a : 사용자가 소유하고 있는 모든 프로세스를 표시한다."
    echo " 예시2) ps -a"
    ps -a
    echo
    echo " 옵션 -f : 풀 포멧으로 정보를 출력해준다. UID, PID, PPID 등도 출력한다."
    echo " 예시2) ps -f"
    ps -f
    echo
    echo "## 실행중인 프로세스 출력 종료 ##"
    echo 
}

CheckProcess