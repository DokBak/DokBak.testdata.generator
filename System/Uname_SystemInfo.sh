#!/bin/sh

#-------------------------
# 테스트 쉘 : 시스템 정보 확인
#-------------------------
function SystemInfo(){
    echo 
    echo "## 시스템 정보 확인 시작 ##"
    echo
    echo " 명령어  : uname"
    echo " 사용방법 : uname [옵션] "
    echo " 기본설명 : "
    echo
    echo " 예시1) uname"
    echo " 부가설명) 옵션 없이 사용하는 경우 uname -s 와 동일하게 커널의 이름을 출력한다."
    uname
    echo
    echo " 옵션 -s : 커널 이름을 출력"
    echo " 예시2) uname -s "
    uname -s
    echo
    echo " 옵션 -m : 시스템의 하드웨어 타입을 출력"
    echo " 예시3) uname -m "
    uname -m
    echo
    echo " 옵션 -n : 네트워크의 호스트 이름을 출력"
    echo " 예시4) uname -n "
    uname -n
    echo
    echo " 옵션 -p : 프로세서 종류를 출력"
    echo " 예시5) uname -p "
    uname -p
    echo
    echo " 옵션 -r : 커널 릴리스 정보를 출력"
    echo " 예시6) uname -r "
    uname -r
    echo
    echo " 옵션 -v : 커널 버전 및 출시 일자를 출력"
    echo " 예시7) uname -v "
    uname -v
    echo
    echo " 옵션 -a : 시스템의 모든 정보를 출력"
    echo " 예시8) uname -a "
    echo "        uname -snrvm "
    echo " 부가설명) uname -s -n -r -v -m 과 동일한 결과 출력 : [커널이름](s), [네트워크 호스트 이름](n), [커널 릴리스 정보](r), [커널 버전 및 출시일자](v), [시스템 하드웨어 타입](m) 순으로 출력"
    uname -a
    uname -snrvm
    echo
    echo "## 시스템 정보 확인 종료 ##"
    echo 
}

SystemInfo