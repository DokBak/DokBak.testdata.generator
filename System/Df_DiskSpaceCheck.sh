#!/bin/sh

#-------------------------
# 테스트 쉘 : 디스크 사용량 체크
#-------------------------
function DiskSpaceCheck(){
    echo 
    echo "## 디스크 사용량 체크 시작 ##"
    echo " 명령어  : df"
    echo " 사용방법 : df [옵션]"
    echo " 기본설명 : 리눅스 시스템 전체의 마운트 된 디스크 사용량을 확인할 수 있다."
    echo
    echo " 예시1) df"
    echo " 부가설명) 파일 시스템, 디스크 크기, 사용량, 여유공간, 사용률, 마운트지점 순으로 출력된다. 옵션이 없는 경우 kB(킬로바이트) 단위로 출력"
    df
    echo " 옵션 -h : 사람이 읽을 수 있는 단위중 읽기 쉬운 단위로 출력 (1024단위로 용량 표기)"
    echo " 예시2) df -h"
    df -h
    echo
    echo " 옵션 -H : 사람이 읽을 수 있는 단위중 읽기 쉬운 단위로 출력 (1000단위로 용량 표기)"
    echo " 예시2) df -H"
    df -H
    echo
    echo " 옵션 -l : 로컬 파일 시스템만 출력(외장 메모리등은 제외)"
    echo " 예시2) df -l"
    df -l
    echo
    echo " 옵션 -p : 파일 시스템 경로가 긴 경우 2줄로 출력되는 경우가 있으나, -P 옵션으로 한줄로 출력"
    echo " 예시2) df -P"
    df -P
    echo
    echo "## 디스크 사용량 체크 종료 ##"
    echo 
}

DiskSpaceCheck

#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Df]_[DiskSpaceCheck]
#------------------------------------------------------------
function df_DiskSpaceCheck(){
    echo 
    echo "## df Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : df"
    echo " HowToUse : df [Option] [Argument1] [Argument2] ..."
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -h] : Human-readable output /1024) "
    echo "            [Option : -H] : Human-readable output /1000) "
    echo "            [Option : -l] : Only display information about locally-mounted) "
    echo "            [Option : -P] : Path Line 2 -> 1) "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " df "
    df
    echo 
    # Example 02 (Option -h : Human-readable output /1024 )
    echo
    echo " df -h "
    df -h 
    echo
    # Example 03 (Option -H : Human-readable output /1000 )
    echo
    echo " df -H "
    df -H 
    echo
    # Example 04 (Option -l : Only display information about locally-mounted)
    echo
    echo " df -l "
    df -l 
    echo
    # Example 05 (Option -P : Path Line 2 -> 1)
    echo
    echo " df -P "
    df -P 
    echo
    # Example End
    echo
    echo "## df End ##"
    echo 
}

df_DiskSpaceCheck