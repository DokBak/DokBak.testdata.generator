#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 및 디렉토리 검색
#-------------------------
function FileSearch(){
    echo 
    echo "## 파일 및 디렉토리 검색 시작 ##"
    echo " 명령어  : find"
    echo " 사용방법 : find [검색 기준] [검색 타입] [패턴]"
    echo " 기본설명 : "
    echo
    echo " 사전실행) find 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir -p find_CMD_TestFolder1/find_CMD_TestFolder2"
    mkdir -p find_CMD_TestFolder1/find_CMD_TestFolder2
    echo "    mkdir -p find_CMD_TestFolder3/find_CMD_TestFolder4"
    mkdir -p find_CMD_TestFolder3/find_CMD_TestFolder4
    echo "    mkdir -p find_CMD_TestFolder5/find_CMD_TestFolder6"
    mkdir -p find_CMD_TestFolder5/find_CMD_TestFolder6
    echo "    echo 'TestFile100' > find_CMD_TestFolder1/find_CMD_TestFile100.txt"
    echo 'TestFile100' > find_CMD_TestFolder1/find_CMD_TestFile100.txt
    echo "    echo 'TestFile200' > find_CMD_TestFolder1/find_CMD_TestFolder2/find_CMD_TestFile200.txt"
    echo 'TestFile200' > find_CMD_TestFolder1/find_CMD_TestFolder2/find_CMD_TestFile200.txt
    echo "    echo 'TestFile300' > find_CMD_TestFolder3/find_CMD_TestFile300.txt"
    echo 'TestFile300' > find_CMD_TestFolder3/find_CMD_TestFile300.txt
    echo "    touch find_CMD_TestFolder3/find_CMD_TestFolder4/find_CMD_TestFile400.txt"
    touch find_CMD_TestFolder5/find_CMD_TestFolder4/find_CMD_TestFile400.txt
    echo "    touch find_CMD_TestFolder5/find_CMD_TestFile500.tt"
    touch find_CMD_TestFolder5/find_CMD_TestFile500.tt
    echo "    touch find_CMD_TestFolder5/find_CMD_TestFile501.log"
    touch find_CMD_TestFolder5/find_CMD_TestFile501.log
    echo
    echo " 예시1) find find_CMD_TestFolder1/find_CMD_TestFile100.txt"
    echo " 부가설명) 존재하는 파일명을 파라미터로 검색해서 존재 할 경우 파일명이 출력된다."
    find find_CMD_TestFolder1/find_CMD_TestFile100.txt
    echo
    echo " 예시2) find find_CMD_TestFolder1"
    echo " 부가설명) 존재하는 디렉토리명을 파라미터로 검색해서 존재 할 경우 디렉토리명 및 내부의 파일, 폴더를 모두 출력한다."
    find find_CMD_TestFolder1
    echo
    echo " 예시3) find . -name find_CMD_TestFile100.txt"
    echo " 부가설명) . : 현재 디렉토리( / : 전체 디렉토리 ), -name : 이름으로 검색, 파일 또는 디렉토리명 검색 "
    find . -name find_CMD_TestFile100.txt
    echo
    echo " 예시3) find . -name find_CMD_TestFile100.txt"
    echo " 부가설명) . : 현재 디렉토리, -name : 이름으로 검색, 파일 또는 디렉토리명 검색 "
    find . -name find_CMD_TestFile100.txt
    echo
    echo " 예시4) find . -name '*find*'"
    echo " 부가설명) . : 현재 디렉토리, -name : 이름으로 검색, 파일명에 find이 포함된 파일 및 디렉토리를 검색  "
    find . -name '*find*'
    echo
    echo " 예시5) find . -empty"
    echo " 부가설명) . : 현재 디렉토리, -empty : 빈 디렉토리 또는 크기가 0인 파일 검색 "
    find . -empty
    echo
    echo " 예시6) find . -name '*.tt' -delete"
    echo " 부가설명) . : 현재 디렉토리, -name : 이름으로 검색, '.tt'확장자를 검색, 검색된 파일을 삭제"
    find . -name '*.tt' -delete
    echo
    echo " 예시7) find . -name '*find*' -print0"
    echo " 부가설명) . : 현재 디렉토리, -name : 이름으로 검색, find이름이 있는 파일 및 폴더, 검색된 파일리스트를 줄바꿈 없이 출력"
    find . -name '*find*' -print0
    echo
    echo " 예시8) find . -maxdepth 1 -name '*.tt'"
    echo " 부가설명) . : 현재 디렉토리, -maxdepth 1 : 깊이는 현재 디렉토리 까지만, -name : '.tt'확장자를 검색 출력"
    find . -maxdepth 1 -name '*.tt'
    echo
    echo "## 파일 및 디렉토리 검색  종료 ##"
    echo 
}

FileSearch