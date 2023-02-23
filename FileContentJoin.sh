#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 내용 조인
#-------------------------
function FileContentJoin(){
    echo 
    echo "## 파일 내용 조인 시작 ##"
    echo
    echo " 명령어  : join"
    echo " 사용방법 : join [파일명1] [파일명2] "
    echo " 기본설명 : 두 파일의 값중 같은값을 가지는 필드의 쌍이 발견되면 그 필드를 하나로 합치고 나머지 필드는 가로로 합쳐져서 출력된다.(디폴트 : 크로스조인)"
    echo
    echo " 사전실행) join 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir join_CMD_TestFolder/"
    mkdir -p join_CMD_TestFolder
    echo 'test apple' > join_CMD_TestFolder/join_CMD_TestFile1.txt
    echo 'test banana' >> join_CMD_TestFolder/join_CMD_TestFile1.txt
    echo 'test melon' >> join_CMD_TestFolder/join_CMD_TestFile1.txt
    echo 'test pear' >> join_CMD_TestFolder/join_CMD_TestFile1.txt
    echo 'test peach' >> join_CMD_TestFolder/join_CMD_TestFile1.txt
    echo 
    echo 'test 300' > join_CMD_TestFolder/join_CMD_TestFile2.txt
    echo 'test 350' >> join_CMD_TestFolder/join_CMD_TestFile2.txt
    echo 'test 120' >> join_CMD_TestFolder/join_CMD_TestFile2.txt
    echo 'test 270' >> join_CMD_TestFolder/join_CMD_TestFile2.txt
    echo 'test 410' >> join_CMD_TestFolder/join_CMD_TestFile2.txt
    echo 
    echo " 예시1) join join_CMD_TestFolder/join_CMD_TestFile1.txt join_CMD_TestFolder/join_CMD_TestFile2.txt"
    join join_CMD_TestFolder/join_CMD_TestFile1.txt join_CMD_TestFolder/join_CMD_TestFile2.txt
    echo 
    echo "## 파일 내용 조인 종료 ##"
    echo 
}

FileContentJoin