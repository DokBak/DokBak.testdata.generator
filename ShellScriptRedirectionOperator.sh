#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 리다이렉션 연산자
#-------------------------
function ShellScriptRedirectionOperator(){
    echo 
    echo "## 쉘 스크립트 리다이렉션 연산자 시작 ##"
    echo 
    echo " 사전실행) 리다이렉션 실행에 필요한 샘플 폴더 작성"
    echo "    mkdir -p RedirectionOperator_CMD_TestFolder/"
    mkdir -p RedirectionOperator_CMD_TestFolder/
    echo "   date > RedirectionOperator_CMD_TestFolder/ReadFile.txt"
    date > RedirectionOperator_CMD_TestFolder/ReadFile.txt
    echo "   pwd >> RedirectionOperator_CMD_TestFolder/ReadFile.txt"
    pwd >> RedirectionOperator_CMD_TestFolder/ReadFile.txt
    cd RedirectionOperator_CMD_TestFolder
    echo 
    echo " 기본설명 : 변수의 특정 패턴부분을 잘라내기 할 경우 사용"
    echo
    echo " 기능1) [ < ] 사용할 경우, < 좌측의 명령에 < 우측 입력값을 대입하여 실행한다." 
    echo "   cat < ReadingRedirectFile.txt"
    cat < ReadingRedirectFile.txt
    echo "   작성된 파일 내용 확인 : cat ReadingRedirectFile.txt"
    cat ReadingRedirectFile.txt
    echo
    echo " 기능2) [ > ] 사용할 경우, > 좌측의 내용을 > 우측 파일에 작성한다. 같은 파일에 작성시 마지막 내용으로 덮어쓰여진다. " 
    echo "   date > CreateWriteRedirectFile.txt"
    date > CreateWriteRedirectFile.txt
    echo "   pwd > CreateWriteRedirectFile.txt"
    pwd > CreateWriteRedirectFile.txt
    echo "   작성된 파일 내용 확인 : cat CreateWriteRedirectFile.txt"
    cat CreateWriteRedirectFile.txt
    echo
    echo " 기능3) [ >> ] 사용할 경우, >> 좌측의 내용을 >> 우측 파일에 작성한다. 기존파일이 있는 경우 기존 내용에 이어서 작성한다." 
    echo "   date >> AddWriteRedirectFile.txt"
    date >> AddWriteRedirectFile.txt
    echo "   pwd >> AddWriteRedirectFile.txt"
    pwd >> AddWriteRedirectFile.txt
    echo "   작성된 파일 내용 확인 : cat AddWriteRedirectFile.txt"
    cat AddWriteRedirectFile.txt
    echo
    echo " 기능4) [ 2>> ] 사용할 경우, 2>> 좌측의 에러를 2>> 우측 파일에 작성한다.(에러 출력만 작성)" 
    echo "   cat AddWriteFile.txt 2>> ErrWriteRedirectFile.txt"
    cat AddWriteFile.txt 2>> ErrWriteRedirectFile.txt
    echo "   cat AddWriteFile2.txt 2>> ErrWriteRedirectFile.txt"
    cat AddWriteFile2.txt 2>> ErrWriteRedirectFile.txt
    echo "   pwd 2>> ErrWriteRedirectFile.txt"
    pwd 2>> ErrWriteRedirectFile.txt
    echo "   작성된 파일 내용 확인 : cat ErrWriteRedirectFile.txt"
    cat ErrWriteRedirectFile.txt
    echo
    echo " 기능5) [ &> ] 또는 [ >& ] 사용할 경우, &> 좌측내용을 &> 우측 파일에 작성한다.(하나의 내용만 출력가능 이어 출력이 불가능하다.)" 
    echo "   cat AddWriteFile.txt &> OutputRedirectAndErr1.txt"
    cat AddWriteFile.txt &> OutputRedirectAndErr1.txt
    echo "   cat AddWriteFile2.txt &> OutputRedirectAndErr2.txt"
    cat AddWriteFile2.txt &> OutputRedirectAndErr2.txt
    echo "   pwd &> OutputRedirectAndErr3.txt"
    pwd &> OutputRedirectAndErr3.txt
    echo "   작성된 파일 내용 확인 : cat OutputRedirectAndErr1.txt"
    echo "   작성된 파일 내용 확인 : cat OutputRedirectAndErr2.txt"
    echo "   작성된 파일 내용 확인 : cat OutputRedirectAndErr3.txt"
    cat OutputRedirectAndErr1.txt
    cat OutputRedirectAndErr2.txt
    cat OutputRedirectAndErr3.txt
    echo
    echo "## 쉘 스크립트 리다이렉션 연산자 종료 ##"
    echo 
}

ShellScriptRedirectionOperator