#!/bin/sh

#-------------------------
# 테스트 쉘 : OS상태 정보 확인
#-------------------------
function OSInformation(){
    echo 
    echo "## OS상태 정보 확인 시작 ##"
    echo " 명령어  : top"
    echo " 사용방법 : top [옵션] [디렉토리]"
    echo " 기본설명 : 현재 OS의 상태를 출력해준다."
    echo
    echo " 예시1) top"
    echo " 부가설명) 현재 OS의 상태 모든 정보를 출력한다."
    top
    echo " 예시2) top | grep Load"
    echo " 부가설명) 현재 시스템이 얼마나 작업하는지 출력 1분간, 5분간, 15분간의 평균 실행/대기 프로세스 수가 출력된다. CPU코어수보다 적으면 문제가 없다."
    top | grep Load
    top | head -n 3
    echo
    echo " 예시3) top | grep 'CPU usage'"
    echo " 부가설명) 유저 레벨에서 사용중인 CPU(user), 시스템 레벨에서 사용중인 CPU(sys), 대기상태인 CPU(idle)"
    top | grep 'CPU usage'
    top | head -n 4
    echo
    echo " 예시4) top | grep 'Mem'"
    echo " 부가설명) 현재 시스템의 메모리 사용량을 출력 총용량, 사용되는 용량, 여유용량, 버퍼된 용량을 출력"
    top | grep 'Mem'
    top | head -n 6
    echo
    echo "## OS상태 정보 확인 종료 ##"
    echo 
}

OSInformation