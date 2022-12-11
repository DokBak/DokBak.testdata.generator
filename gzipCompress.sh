#!/bin/sh

#-------------------------
# 테스트 쉘 : gzip 압축 처리 시작
#-------------------------
function gzipCompress(){
    echo 
    echo "## gzip 압축 처리 시작 ##"
    echo " 명령어  : gzip"
    echo " 사용방법 : gzip [옵션] [파일이름]"
    echo " 기본설명 : gzip 압축의 경우 보통 1/10 사이트로 압축하고, 압축 대상 파일의 맨 뒤에 .gz확장자가 추가된다."
    echo 
    echo " 사전실행) gzip 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir Gzip_CMD_TestFolder"
    mkdir -p Gzip_CMD_TestFolder/Gzip_CMD_TestFolder2
    echo "    echo 'TestFile1' > Gzip_CMD_TestFolder/Gzip_CMD_TestFile1.txt"
    echo "TestFile1" > Gzip_CMD_TestFolder/Gzip_CMD_TestFile1.txt
    echo "    echo 'TestFile2' > Gzip_CMD_TestFolder/Gzip_CMD_TestFile2.txt"
    echo "TestFile2" > Gzip_CMD_TestFolder/Gzip_CMD_TestFile2.txt
    cd Gzip_CMD_TestFolder
    echo 
    echo " 예시1) gzip Gzip_CMD_TestFile1.txt"
    echo " 예시1) gzip Gzip_CMD_TestFile2.txt"
    gzip Gzip_CMD_TestFile1.txt
    gzip Gzip_CMD_TestFile2.txt
    echo
    echo " 옵션 -d : gzip 압축 파일을 압축해제 한다. (.gz 확장자 삭제)"
    echo " 예시2) gzip -d Gzip_CMD_TestFile2.txt.gz"
    gzip -d Gzip_CMD_TestFile2.txt.gz
    echo
    echo "## gzip 압축 처리 종료 ##"
    echo 
}

gzipCompress