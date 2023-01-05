#!/bin/sh

#-------------------------
# 테스트 쉘 : 블록단위 파일 복사 및 변환
#-------------------------
function BlockFile(){
    echo 
    echo "## 블록 단위 파일 복사 및 변환 시작 ##"
    echo " 명령어  : dd "
    echo " 사용방법 : dd []"
    echo " 기본설명 : 블록 단위로 파일을 복사 하거나 변환하는 명령어, 테스트 파일을 작성시 원하는 용량의 파일을 작성시에도 유용하다."
    echo
    echo " 사전실행) dd 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir -p dd_CMD_TestFolder/dd_CMD_TestFolder2/"
    mkdir -p dd_CMD_TestFolder/dd_CMD_TestFolder2/
    echo "    echo 'TestFile1' > dd_CMD_TestFolder/dd_CMD_TestFile1.txt"
    echo 'TestFile1' > dd_CMD_TestFolder/dd_CMD_TestFile1.txt
    echo "    echo 'TestFile2' > dd_CMD_TestFolder/dd_CMD_TestFile2.txt"
    echo 'TestFile2' > dd_CMD_TestFolder/dd_CMD_TestFile2.txt
    CPWD=$(pwd)
    echo CPWD : ${CPWD}
    echo
    echo " 예시1) dd if='${CPWD}/dd_CMD_TestFolder/dd_CMD_TestFile1.txt' of='${CPWD}/dd_CMD_TestFolder/dd_CMD_TestFile10.txt' bs=1024 count=10"
    diff "${CPWD}/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" "${CPWD}/dd_CMD_TestFolder/dd_CMD_TestFile10.txt"
    dd if="${CPWD}/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="${CPWD}/dd_CMD_TestFolder/dd_CMD_TestFile10.txt" bs=1024 count=10
    echo
    echo "## 블록단위 파일 복사 및 변환 종료 ##"
    echo 
}

BlockFile