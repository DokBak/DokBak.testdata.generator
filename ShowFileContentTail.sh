#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 내용의 끝 부분 출력 처리
#-------------------------
function ShowFileContentTail(){
    echo 
    echo "## 파일 내용의 끝 부분 출력 처리 시작 ##"
    echo " 명령어  : tail"
    echo " 사용방법 : tail [옵션] [바이트수 or 라인수] [파일명]"
    echo " 기본설명 : [파일]의 내용을 출력해준다. 옵션을 지정하지 않는 경우, 파일의 끝에서부터 10줄 출력한다. (디폴트 : 10줄)"
    echo
    echo " 사전실행) tail 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir tail_CMD_TestFolder/tail_CMD_TestFolder2/tail_CMD_TestFolder3/"
    mkdir tail_CMD_TestFolder
    echo "    echo 'TestFile1' > tail_CMD_TestFolder/tail_CMD_TestFile1.txt"
    echo "TestFile1" > tail_CMD_TestFolder/tail_CMD_TestFile1.txt
    for n in {2..100};
    do
        echo "    echo 'TestFile${n}' >> tail_CMD_TestFolder/tail_CMD_TestFile1.txt"
        echo "TestFile${n}" >> tail_CMD_TestFolder/tail_CMD_TestFile1.txt
    done 
    echo
    echo " 예시1) tail tail_CMD_TestFolder/tail_CMD_TestFile1.txt"
    tail tail_CMD_TestFolder/tail_CMD_TestFile1.txt
    echo
    echo " 옵션 -c : 뒤에서 부터 지정한 바이트(byte) 수 만큼 출력한다.(줄바꿈도 1byte)"
    echo " 예시2) tail -c 17 tail_CMD_TestFolder/tail_CMD_TestFile1.txt"
    tail -c 17 tail_CMD_TestFolder/tail_CMD_TestFile1.txt
    echo
    echo " 옵션 -n : 끝에서 부터 지정한 라인(line) 수 만큼 출력한다."
    echo " 예시3) tail -n 17 tail_CMD_TestFolder/tail_CMD_TestFile1.txt"y
    tail -n 17 tail_CMD_TestFolder/tail_CMD_TestFile1.txt
    echo
    echo "## 파일 내용의 끝 부분 출력 처리 종료 ##"
    echo 
}

ShowFileContentTail