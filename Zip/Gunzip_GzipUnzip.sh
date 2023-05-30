#!/bin/sh

#-------------------------
# 테스트 쉘 : gzip 압축 풀기
#-------------------------
function GzipUnzip(){
    echo 
    echo "## gzip 압축 풀기 시작 ##"
    echo " 명령어  : gunzip"
    echo " 사용방법 : gunzip [옵션] [파일이름]"
    echo " 기본설명 : .gz확장자로 압축이 된 파일의 압축을 푼다. .gz확장자가 삭제된다." 
    echo 
    echo " 사전실행) gunzip 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir Gunzip_CMD_TestFolder"
    mkdir -p Gunzip_CMD_TestFolder
    echo "    echo 'TestFile1' > Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt"
    echo "TestFile1" > Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt
    echo "    echo 'TestFile2' > Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile2.txt"
    echo "TestFile2" > Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile2.txt
    echo "    gzip Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt; gzip Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile2.txt"
    gzip Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt; gzip Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile2.txt
    echo
    echo " 예시1) Gunzip Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt.gz"
    gunzip Gunzip_CMD_TestFolder/Gunzip_CMD_TestFile1.txt.gz
    echo
    echo "## gunzip 압축 풀기 종료 ##"
    echo 
}

GzipUnzip