#!/bin/sh

#-------------------------
# 테스트 쉘 : 디렉토리 이동
#-------------------------
function DirectoryMove(){
    echo 
    echo "## 디렉토리 이동 시작 ##"
    echo " 명령어  : cd"
    echo " 사용방법 : cd [디렉토리]"
    echo " 기본설명 : 지정된 디렉토리로 이동"
    echo
    echo " 예시1) cd Cd_CMD_TestFolder"
    echo " 부가설명 : 지정된 폴더로 이동"
    pwd
    mkdir Cd_CMD_TestFolder
    cd Cd_CMD_TestFolder
    pwd
    echo
    echo " 예시2) cd ../ "
    echo " 부가설명 : 하나 상위 폴더로 이동"
    pwd
    cd ../
    pwd
    echo
    echo " 예시3) cd "
    echo " 부가설명 : 환경변수 home 디렉토리로 이동"
    echo ${HOME}
    pwd
    cd
    pwd
    echo
    echo "## 디렉토리 이동 종료 ##"
    echo 
}


DirectoryMove