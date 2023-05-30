#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 내용 합치기
#-------------------------
function FileContentAdd(){
    echo 
    echo "## 파일 내용 합치기 시작 ##"
    echo
    echo " 명령어  : paste"
    echo " 사용방법 : paste [파일명1] [파일명2] "
    echo " 기본설명 : 두 파일의 값이 가로로 합쳐져서 출력된다."
    echo
    echo " 사전실행) paste 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir paste_CMD_TestFolder/"
    mkdir -p paste_CMD_TestFolder
    echo 'test apple' > paste_CMD_TestFolder/paste_CMD_TestFile1.txt
    echo 'test banana' >> paste_CMD_TestFolder/paste_CMD_TestFile1.txt
    echo 'test melon' >> paste_CMD_TestFolder/paste_CMD_TestFile1.txt
    echo 'test pear' >> paste_CMD_TestFolder/paste_CMD_TestFile1.txt
    echo 'test peach' >> paste_CMD_TestFolder/paste_CMD_TestFile1.txt
    echo 
    echo 'test 300' > paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo 'test 350' >> paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo 'test 120' >> paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo 'test 270' >> paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo 'test 410' >> paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo 
    echo " 예시1) paste paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt"
    paste paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo 
    echo " 옵션 -s : 데이터가 가로가 아닌 세로로 합쳐져 출력된다."
    echo " 예시2) paste -s paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt"
    paste -s paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo 
    echo " 옵션 -d [구분자]: 두 파일의 경계값은 기본 탭(\t)이지만 -d 뒤의 [구분자] 값으로 변경하여 출력 할 수 있다. "
    echo " 예시2) paste -d '\\\\' paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt"
    echo " 부가설명) [구분자]문자를 역슬래시(\ \)으로 지정하여 두 파일의 데이터 경계값이 역슬래시(\ \)으로 출력된다."
    paste -d '\\' paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo 
    echo " 예시3) paste -d '\ n' paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt"
    echo " 부가설명) [구분자]문자를 줄바꿈문자(\ n)로 지정하여 두 파일의 데이터 경계값이 줄바꿈(\ n)으로 출력된다."
    paste -d '\n' paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo 
    echo " 예시4) paste -d '\ 0' paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt"
    echo " 부가설명) [구분자]문자를 빈문자열(\ 0)로 지정하여 두 파일의 데이터 경계값이 빈문자열(\ 0)으로 출력된다."
    paste -d '\0' paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo 
    echo " 예시5) paste -d 'Z' paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt"
    echo " 부가설명) [구분자]문자를 문자열(Z)로 지정하여 두 파일의 데이터 경계값이 문자열(Z)으로 출력된다."
    paste -d 'Z' paste_CMD_TestFolder/paste_CMD_TestFile1.txt paste_CMD_TestFolder/paste_CMD_TestFile2.txt
    echo 
    echo "## 파일 내용 합치기 종료 ##"
    echo 
}

FileContentAdd