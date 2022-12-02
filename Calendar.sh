#!/bin/sh

#-------------------------
# 테스트 쉘 : 달력 출력 처리
#-------------------------
function Calendar(){
    echo 
    echo "## 달력 출력 처리 시작 ##"
    echo " 명령어 : cal"
    echo " 사용방법 : cal [파라미터없음]"
    echo " 기본설명 : 달력 출력시 사용, 기본적으로 명령어를 입력한 날짜의 달력을 출력"
    echo " 예시1) cal"
    cal
    echo
    echo " 옵션 -h : 오늘 날짜 하이라이트를 off.(기본 옵션 : on)"
    echo " 예시2) cal -h"
    cal -h
    echo
    echo " 옵션 -j : 줄리안 날짜를 표시(1월1일부터 1씩 더해서 표시하는 방법)"
    echo " 예시3) cal -j"
    cal -j
    echo
    echo " 옵션 -y : 올해의 모든 달력을 출력"
    echo " 예시4) cal -y"
    cal -y
    echo
    echo " 옵션 -3 : 오늘의 달력과 같이 출력할 이전 달 달력과 다음 달 달력을 출력"
    echo " 예시5) cal -3"
    cal -3
    echo
    echo " 옵션 -A [number] : A는 After로 오늘의 달력과 같이 출력할 다음 달 달력의 수[number]를 지정"
    echo " 예시6) cal -A 4 : number는 1이상의 값으로 지정"
    cal -A 4
    echo
    echo " 옵션 -B [number] : B는 Before로 오늘의 달력과 같이 출력할 이전 달 달력의 수[number]를 지정"
    echo " 예시7) cal -B 4 : number는 1이상의 값으로 지정"
    cal -B 4
    echo
    echo " 옵션 -C : cal 명령어로 실행한 것과 동일한 옵션, ncal을 사용한 경우 -C로 cal로 실행한 것과 같은 효과가 나온다."
    echo " 예시8) ncal -C"
    ncal -C
    echo
    echo " 옵션 -N : ncal 명령어로 실행한 것과 동일한 옵션, ncal을 사용한 경우 -C로 cal로 실행한 것과 같은 효과가 나온다."
    echo " 예시9) cal -N"
    cal -N
    echo
    echo " 옵션 -d [yyyy-mm] : 지정한 yyyy-mm의 달력을 출력"
    echo " 예시10) cal -d 2022-04 : 04에서 0은 제외하고 4만작성하여도 된다."
    cal -d 2022-04
    echo
    echo " 옵션 -H [yyyy-mm-dd] : 지정한 yyyy-mm의 달력에서 지정한 dd을 하이라이트"
    echo " 예시11) cal -H 2022-04-11"
    cal -H 2022-04-11
    echo
    echo "## 달력 출력 처리 종료 ##"
    echo 
}

Calendar 