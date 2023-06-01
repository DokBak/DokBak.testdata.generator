#!/bin/sh

#-------------------------
# 테스트 쉘 : 세션 구분 출력
#-------------------------
function SectionCut(){
    echo 
    echo "## 세션 구분 출력 시작 ##"
    echo " 명령어  : cut"
    echo " 사용방법 : cut [출력구분방법] [파일명]"
    echo " 기본설명 : [파일명]의 내용을 [출력구분방법]에 따라 출력한다. 출력구분방법을 무조건 추가해야한다."
    echo
    echo " 사전실행) cut 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir Cut_CMD_TestFolder/"
    mkdir -p Cut_CMD_TestFolder
    echo "    echo 'TestFile1 Testing1' > Cut_CMD_TestFolder/Cut_CMD_TestFile1.txt"
    echo '2바이트문자1,2바이트문자2,2바이트문자3' > Cut_CMD_TestFolder/Cut_CMD_TestFile1.txt
    echo '2바이트문자12바이트문자2,2바이트문자3' >> Cut_CMD_TestFolder/Cut_CMD_TestFile1.txt
    echo '3TestFile1,3Testing2,3Testing3' >> Cut_CMD_TestFolder/Cut_CMD_TestFile1.txt
    echo '4TestFile14Testing2,4Testing3' >> Cut_CMD_TestFolder/Cut_CMD_TestFile1.txt
    echo 
    echo " 옵션 -b n : byte 단위로 구분지어서 출력한다. n번째 바이트 값을 출력한다. 2바이트문자일경우 정확한 값이 출력되지 않는다."
    echo " 예시1) cut -b 2 Cut_CMD_TestFolder/cut_CMD_TestFile1.txt"
    cut -b 2 Cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo
    echo " 옵션 -b n-m : byte 단위로 구분지어서 출력한다. n번째 바이트부터 m번째 바이트 값을 출력한다. 2바이트문자일경우 정확한 값이 출력되지 않는다."
    echo " 예시2) cut -b 1-9 Cut_CMD_TestFolder/cut_CMD_TestFile1.txt"
    cut -b 1-9 Cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo
    echo " 옵션 -c n : char 단위로 구분지어서 출력한다. n번째 char 값을 출력한다."
    echo " 예시3) cut -c 2 Cut_CMD_TestFolder/cut_CMD_TestFile1.txt"
    cut -c 2 Cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo
    echo " 옵션 -c n-m : char 단위로 구분지어서 출력한다. n번째 char부터 m번째 char 값을 출력한다."
    echo " 예시4) cut -c 1-9 Cut_CMD_TestFolder/cut_CMD_TestFile1.txt"
    cut -c 1-9 Cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo
    echo " 옵션 -d , -f n : -d뒤의 [,]은 데이터를 나누기위한 구분자, -f뒤의 숫자는 ,로 구분지은 데이터들중에서의 n번째 데이터(n)"
    echo " 예시5) cut -d , -f 3 Cut_CMD_TestFolder/cut_CMD_TestFile1.txt"
    cut -d , -f 3 Cut_CMD_TestFolder/cut_CMD_TestFile1.txt
    echo
    echo "## 세션 구분 출력 종료 ##"
    echo 
}

SectionCut