#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 내용 수정
#-------------------------
function FileContentEdit(){
    echo 
    echo "## 파일 내용 수정 시작 ##"
    echo
    echo " 명령어  : tr"
    echo " 사용방법 : tr [패턴1] [패턴2] "
    echo " 기본설명 : 표준입력으로부터 문자들을 변경하거나 삭제하고 표준출력으로 출력한다."
    echo
    echo " 사전실행) tr 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir tr_CMD_TestFolder/"
    mkdir -p tr_CMD_TestFolder
    echo 'test apple' > tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo 'test banana' >> tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo 'test melon' >> tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo 'test pear' >> tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo 'test peach' >> tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo 
    echo " 예시1) tr 'es' 'xy' < tr_CMD_TestFolder/tr_CMD_TestFile1.txt"
    tr 'es' 'xy' < tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo
    echo " 예시2) tr '[a-z]' '[A-Z]' < tr_CMD_TestFolder/tr_CMD_TestFile1.txt"
    tr '[a-z]' '[A-Z]' < tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo
    echo " 예시3) tr -d 'es' < tr_CMD_TestFolder/tr_CMD_TestFile1.txt"
    tr -d 'es' < tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo
    echo "## 파일 내용 수정 종료 ##"
    echo 
}

FileContentEdit