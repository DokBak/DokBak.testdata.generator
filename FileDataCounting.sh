#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 내의 데이터 수 조회 처리
#-------------------------
function FileDataCounting(){
    echo 
    echo "## 파일내의 데이터 수 조회 처리 시작 ##"
    echo " 명령어  : wc"
    echo " 사용방법 : wc [조회할 파일명]"
    echo " 기본설명 : 조회하여 출력되는 종류에는 [행의 수] [단어의 수] [바이트의 수]를 출력가능하다."
    echo "          [행의 수]: 엔터를 기준으로 조회, [단어의 수]: 스페이스를 기준으로 조회, [바이트의 수]: 스페이스와 엔터 모두 1바이트로 취급"
    echo
    echo " 사전실행) wc 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir wc_CMD_TestFolder/"
    mkdir wc_CMD_TestFolder
    echo "    echo 'TestFile1' > wc_CMD_TestFolder/wc_CMD_TestFile1.txt"
    echo 'TestFile1' > wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "apple,banana,cream,dust,Test,txt,TestFile1,gui" >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "Test,bash,zsh,sh" >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "Test,java,Javascript,C,C#,C++,python,ruby" >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo 'TestFile2' >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "iphone,ipad,imac,Test,ipod,ipodtouch" >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "" >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "galaxyS7,Note7,ZFilp,S7,Test" >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo 'TestFile3' >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "Korea,Test,Japan,China" >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "Seoul,Tokyo,hongkong" >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo 'TestFile4' >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "ps1,ps2,ps3,ps4" >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "psa,psa,psa,psa" >>  wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "Nintendo,NDSL, DSL,wii" >>  wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo "" >> wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo
    echo " 예시1) wc wc_CMD_TestFolder/wc_CMD_TestFile1.txt"
    echo " 부가설명) wc wc_CMD_TestFolder/wc_CMD_TestFile1.txt 파일의 [전체 행의 수] [전체 단어의 수] [전체 바이트의 수]를 검색한다."
    wc wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo
    echo " 옵션 -c : 파일의 내용을 바이트 단위로 조회하여 몇 바이트의 파일인지를 출력"
    echo " 예시2) wc -c wc_CMD_TestFolder/wc_CMD_TestFile1.txt"
    wc -c wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo
    echo " 옵션 -l : 파일의 내용을 행의수 단위로 조회하여 몇 줄의 파일인지를 출력"
    echo " 예시2) wc -l wc_CMD_TestFolder/wc_CMD_TestFile1.txt"
    wc -l wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo
    echo " 옵션 -w : 파일의 내용을 단어 단위로 조회하여 몇 단어의 파일인지를 출력"
    echo " 예시2) wc -w wc_CMD_TestFolder/wc_CMD_TestFile1.txt"
    wc -w wc_CMD_TestFolder/wc_CMD_TestFile1.txt
    echo
    echo "## 파일내의 데이터 수 조회 처리 종료 ##"
    echo 
}

FileDataCounting