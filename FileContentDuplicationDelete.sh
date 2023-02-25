#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 내용 중복 제거
#-------------------------
function FileContentDuplicationDelete(){
    echo 
    echo "## 파일 내용 중복 제거 시작 ##"
    echo
    echo " 명령어  : uniq"
    echo " 사용방법 : uniq [패턴1] [패턴2] "
    echo " 기본설명 : 연속된 중복값중 선행하는 라인만 남기고 나머지는 모두 제거하여 출력한다."
    echo
    echo " 사전실행) uniq 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir uniq_CMD_TestFolder/"
    mkdir -p uniq_CMD_TestFolder
    echo 'test apple' > uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test apple' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test apple' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test apple' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test banana' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test Banana' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test banana' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test melon' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test banana' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test Peach' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test peach' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test peach' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test pear' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test apple' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test Peach' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test peach' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 'test peach' >> uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    cat uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo 
    echo " 예시1) uniq uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt"
    uniq uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo
    echo " 예시2) uniq -c uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt"
    echo " 부가설명) 중복된 데이터수 만큼을 데이터 앞에 출력"
    uniq -c uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo
    echo " 예시3) uniq -i uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt"
    echo " 부가설명) 대소문자를 구분하지 않고 "
    uniq -i uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo
    echo "## 파일 내용 중복 제거 종료 ##"
    echo 
}

FileContentDuplicationDelete