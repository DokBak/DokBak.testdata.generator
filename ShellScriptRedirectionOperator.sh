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
    echo " 기본설명 : 명령의 결과를 리다이렉션, 결과를 파일에 출력하거나 명령의 결과를 다시 명령에 입력값으로 시작한다."
    echo
    echo " 기능1) [ < ] 사용할 경우, < 좌측의 명령을  < 우측 입력값을 대입하여 실행한다." 
    echo "   date < ReadFile.txt"
    date < ReadFile.txt
    echo "   작성된 파일 내용 확인 : cat ReadFile.txt"
    cat ReadFile.txt
    echo
    echo " 기능2) [ > ] 사용할 경우, > 좌측의 내용을 > 우측 파일에 작성한다. 같은 파일에 작성시 마지막 내용으로 덮어쓰여진다. 1> 과 같은 의미" 
    echo "   date > CreateWriteRedirectFile.txt"
    date > CreateWriteRedirectFile.txt
    echo "   pwd > CreateWriteRedirectFile.txt"
    pwd > CreateWriteRedirectFile.txt
    echo "   작성된 파일 내용 확인 : cat CreateWriteRedirectFile.txt"
    cat CreateWriteRedirectFile.txt
    echo
    echo " 기능3) [ >> ] 사용할 경우, >> 좌측의 내용을 >> 우측 파일에 작성한다. 기존파일이 있는 경우 기존 내용에 이어서 작성한다. 1>> 과 같은 의미" 
    echo "   date >> AddWriteRedirectFile.txt"
    date >> AddWriteRedirectFile.txt
    echo "   pwd >> AddWriteRedirectFile.txt"
    pwd >> AddWriteRedirectFile.txt
    echo "   작성된 파일 내용 확인 : cat AddWriteRedirectFile.txt"
    cat AddWriteRedirectFile.txt
    echo
    echo " 기능4) [ 2>> ] 사용할 경우, 2>> 좌측의 에러를 2>> 우측 파일에 작성한다.(에러 출력만 작성)" 
    echo "   cat NoFile.txt 2>> ErrWriteRedirectFile.txt"
    cat NoFile.txt 2>> ErrWriteRedirectFile.txt
    echo "   pwd 2>> ErrWriteRedirectFile.txt"
    pwd 2>> ErrWriteRedirectFile.txt
    echo "   작성된 파일 내용 확인 : cat ErrWriteRedirectFile.txt"
    cat ErrWriteRedirectFile.txt
    echo
    echo " 기능5) [ &> ] 또는 [ >& ] 사용할 경우, &> 좌측내용을 &> 우측 파일에 작성한다.(하나의 내용만 출력가능 이어 출력이 불가능하다.)" 
    echo "   cat NoFile.txt &> OutputRedirectAndErr1.txt"
    cat NoFile.txt &> OutputRedirectAndErr1.txt
    echo "   pwd &> OutputRedirectAndErr2.txt"
    pwd &> OutputRedirectAndErr2.txt
    echo "   작성된 파일 내용 확인 : cat OutputRedirectAndErr1.txt"
    cat OutputRedirectAndErr1.txt
    echo "   작성된 파일 내용 확인 : cat OutputRedirectAndErr2.txt"
    cat OutputRedirectAndErr2.txt
    echo 
    echo " 기능6) [ 2>&1 ] 사용할 경우, 2>&1 좌측내용중 에러를 표준출력으로 보낸다."
    echo " 부가설명) 아래의 순서로 2>&1에 대해서 자세히 알아보자." 
    echo
    echo "   cat ReadFile.txt > OutputRedirectTest.txt : ReadFile.txt 파일이 존재하기에 정상처리되며 OutputRedirectTest.txt에 출력"
    cat ReadFile.txt > OutputRedirectTest.txt
    echo "   cat NoFile.txt 2> OutputRedirectTest.txt : NoFile.txt 파일이 존재하지 않기에 에러처리되며 OutputRedirectTest.txt에 출력"
    cat NoFile.txt 2> OutputRedirectTest.txt
    echo "   cat ReadFile.txt > OutputRedirectTest.txt 2> OutputRedirectTest.txt : ReadFile.txt 파일이 존재하기에 정상처리되며 OutputRedirectTest.txt에 출력"
    cat ReadFile.txt > OutputRedirectTest.txt 2> OutputRedirectTest.txt
    echo "   cat NoFile.txt > OutputRedirectTest.txt 2> OutputRedirectTest.txt : NoFile.txt 파일이 존재하지 않기에 에러처리되며 OutputRedirectTest.txt에 출력"
    cat NoFile.txt > OutputRedirectTest.txt 2> OutputRedirectTest.txt
    echo "   cat ReadFile.txt > OutputRedirectTest.txt 2>&1 : ReadFile.txt 파일이 존재하기에 정상처리되며 OutputRedirectTest.txt에 출력"
    cat ReadFile.txt > OutputRedirectTest.txt 2>&1 
    echo "   cat NoFile.txt > OutputRedirectTest.txt 2>&1  : NoFile.txt 파일이 존재하지 않기에 에러처리되며 OutputRedirectTest.txt에 출력"
    cat NoFile.txt > OutputRedirectTest.txt 2>&1
    echo "   /dev/null은 휴지통과 같은 곳으로 이 경로로 보내지는 경우 모든파일과 데이터는 삭제된다."
    echo "   cat ReadFile.txt > /dev/null 2>&1 : ReadFile.txt 파일이 존재하기에 정상처리되나 /dev/null 화면 및 출력파일에 기록하지 않는다."
    cat ReadFile.txt > /dev/null 2>&1 
    echo "   cat NoFile.txt > /dev/null 2>&1  : NoFile.txt 파일이 존재하지 않기에 에러처리되나 /dev/null 화면 및 출력파일에 기록하지 않는다."
    cat NoFile.txt > /dev/null 2>&1 
    echo
    echo "## 쉘 스크립트 리다이렉션 연산자 종료 ##"
    echo 
}

ShellScriptRedirectionOperator