#!/bin/sh

#-------------------------
# 테스트 쉘 : zip 압축 처리
#-------------------------
function ZipCompress(){
    echo 
    echo "## zip 압축 처리 시작 ##"
    echo " 명령어  : zip(unzip)"
    echo " 사용방법 : zip [압축된 파일의 이름] [압축대상의 이름] (unzip [압축된 파일의 이름])"
    echo " 기본설명 : zip 압축의 경우 보통 1/10 사이트로 압축하고, 압축 대상 파일의 맨 뒤에 .zip확장자가 추가된다." 
    echo 
    echo " 사전실행) zip 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir zip_CMD_TestFolder"
    mkdir -p zip_CMD_TestFolder/zip_CMD_TestFolder2
    echo "    echo 'TestFile1' > zip_CMD_TestFolder/zip_CMD_TestFile1.txt"
    echo "TestFile1" > zip_CMD_TestFolder/zip_CMD_TestFile1.txt
    echo "    echo 'TestFile2' > zip_CMD_TestFolder/zip_CMD_TestFile2.txt"
    echo "TestFile2" > zip_CMD_TestFolder/zip_CMD_TestFile2.txt
    echo "    echo 'TestFile3' > zip_CMD_TestFolder/zip_CMD_TestFolder2/zip_CMD_TestFile3.txt"
    echo "TestFile3" > zip_CMD_TestFolder/zip_CMD_TestFolder2/zip_CMD_TestFile3.txt
    cd zip_CMD_TestFolder
    echo 
    echo " 예시1) zip zip_CMD_TestFile1.zip zip_CMD_TestFile1.txt "
    echo "       zip zip_CMD_TestFile2.z zip_CMD_TestFile2.txt"
    zip zip_CMD_TestFile1.zip zip_CMD_TestFile1.txt 
    zip zip_CMD_TestFile2.z zip_CMD_TestFile2.txt
    echo
    echo " 예시2) zip zip_CMD_TestFileGroup.zip zip_CMD_TestFile1.txt zip_CMD_TestFile2.txt"
    echo " 부가설명) [압축대상의 이름]을 여러개 나열하면 한 번에 압축이 된다."
    zip zip_CMD_TestFileGroup.zip zip_CMD_TestFile1.txt zip_CMD_TestFile2.txt
    echo
    echo " 예시3) zip zip_CMD_TestFileFolder.zip ./*"
    echo " 부가설명) 지정된 폴더의 모든 파일을 압축한다."
    zip zip_CMD_TestFileFolder.zip zip_CMD_TestFolder2/*
    echo
    echo " 옵션 -r : 하위 폴더까지 포함해서 압축한다는 의미" 
    echo " 예시4) zip zip_CMD_TestFileFolder2.zip ./*"
    echo " 부가설명) 현재 폴더의 하위 모든 파일까지 압축한다."
    zip -r zip_CMD_TestFileFolder2.zip ./*
    echo
    echo " 예시5) unzip zip_CMD_TestFile1.zip"
    echo " 부가설명) 지정된 폴더의 모든 파일을 압축한다."
    unzip zip_CMD_TestFileFolder2.zip
    echo
    echo "## zip 압축 처리 종료 ##"
    echo 
}

ZipCompress