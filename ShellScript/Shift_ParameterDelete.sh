#!/bin/sh

#-------------------------
# 테스트 쉘 : 파라미터 리스트중 한 개 삭제
#-------------------------
function ParameterDelete(){
    echo 
    echo "## 파라미터 리스트중 한 개 삭제 시작 ##"
    echo
    echo " 명령어  : shift"
    echo " 사용방법 : shift "
    echo " 기본설명 : shift 뒤에 아규먼트가 없는경우 파라미터 목록에서 가장 좌측의 파라미터가 영구삭제된다. "
    echo
    set Kor Jap Usa Eng
    echo " 예시1) set Kor Jap Usa Eng 를 이용하여 파라미터 확인"
    echo "현재 파라미터 갯수 : $# 개, 파라미터 출력 : $* "
    shift
    echo "현재 파라미터 갯수 : $# 개, 파라미터 출력 : $* "
    shift 2
    echo "현재 파라미터 갯수 : $# 개, 파라미터 출력 : $* "
    shift 
    echo "현재 파라미터 갯수 : $# 개, 파라미터 출력 : $* "
    shift
    echo
    echo " 예시2) 반복문에서 사용"
    set $(date)
    while (( $# > 0 ))
    do
        echo $1
        shift
    done
    echo "## 파라미터 리스트중 한 개 삭제 종료 ##"
    echo 
}

ParameterDelete 