#!/bin/sh

#-------------------------
# 테스트 쉘 : 접근 권한 기본 설정
#-------------------------
function AccessAuthoritySet(){
    echo 
    echo "## 접근 권한 기본 설정 시작 ##"
    echo
    echo " 명령어  : umask"
    echo " 사용방법 : umask [옵션] [마스크값]"
    echo " 기본설명 : 파일 혹은 디렉토리가 생성될때 기본적으로 설정되는 접근모드를 지정하는데 마스크값은 해당 접근권한을 부여하지 않겠다는 의미이다. (관리자의 경우 기본 마스크 값:022)"
    echo
    echo " 사전실행) umask 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir -p umask_CMD_TestFolder1"
    mkdir -p umask_CMD_TestFolder1
    cd umask_CMD_TestFolder1
    echo 'test apple' > umask_CMD_TestFile1.txt
    echo 
    echo "ls -l umask_CMD_TestFile1.txt"
    ls -l umask_CMD_TestFile1.txt
    echo "현재 내 피시의 일반 파일의 기본 접근모드는 644(-rw-r--r--)"
    echo
    mkdir -p umask_CMD_TestFolder1
    echo "ls -ld umask_CMD_TestFolder1"
    ls -ld umask_CMD_TestFolder1
    echo "현재 내 피시의 폴더의 기본 접근모드는 755(drwxr-xr-x)"
    echo
    echo " 예시1) umask"
    echo " 부가설명) 현재 마스크 값은 022"
    umask
    echo
    echo " 옵션 -s : 기본 접근 권한을 문자로 출력"
    echo " 예시2) umask -S"
    umask -S
    echo
    echo "마스크 값 변경 : umask 000"
    umask 000
    umask
    umask -S
    echo
    echo " 마스크값 변경 후 실행) umask 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir -p umask_CMD_TestFolder2"
    cd ..
    mkdir -p umask_CMD_TestFolder2
    cd umask_CMD_TestFolder2
    echo 'test apple' > umask_CMD_TestFile2.txt
    echo 
    echo "ls -l umask_CMD_TestFile2.txt"
    ls -l umask_CMD_TestFile2.txt
    echo "마스크값을 000으로 하였기 때문에 일반 파일의 기본 접근모드는 모든 권한이 있는 666(-rw-rw-rw-)"
    echo
    mkdir -p umask_CMD_TestFolder2
    echo "ls -ld umask_CMD_TestFolder2"
    ls -ld umask_CMD_TestFolder2
    echo "마스크값을 000으로 하였기 때문에 폴더의 기본 접근모드는 모든 권한이 있는 777(drwxrwxrwx)"
    echo
    cd ..
    echo "## 접근 권한 기본 설정 종료 ##"
    echo 
}

AccessAuthoritySet