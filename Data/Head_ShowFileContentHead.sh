#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 내용의 선두 부분 출력 처리
#-------------------------
function ShowFileContentHead(){
    echo 
    echo "## 파일 내용의 선두 부분 출력 처리 시작 ##"
    echo " 명령어  : head"
    echo " 사용방법 : head [옵션] [바이트수 or 라인수] [파일명]"
    echo " 기본설명 : [파일]의 내용을 출력해준다. 옵션을 지정하지 않는 경우, 파일의 상단에서부터 10줄 출력한다. (디폴트 : 10줄)"
    echo
    echo " 사전실행) head 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir head_CMD_TestFolder"
    mkdir head_CMD_TestFolder
    echo "    echo 'TestFile1' > head_CMD_TestFolder/head_CMD_TestFile1.txt"
    echo "TestFile1" > Head_CMD_TestFolder/Head_CMD_TestFile1.txt
    for n in {2..100};
    do
        echo "    echo 'TestFile${n}' >> Head_CMD_TestFolder/Head_CMD_TestFile1.txt"
        echo "TestFile${n}" >> Head_CMD_TestFolder/Head_CMD_TestFile1.txt
    done 
    echo
    echo " 예시1) head Head_CMD_TestFolder/Head_CMD_TestFile1.txt"
    head Head_CMD_TestFolder/Head_CMD_TestFile1.txt
    echo
    echo " 옵션 -c : 앞에서 부터 지정한 바이트(byte) 수 만큼 출력한다.(줄바꿈도 1byte)"
    echo " 예시2) head -c 17 Head_CMD_TestFolder/Head_CMD_TestFile1.txt"
    head -c 17 Head_CMD_TestFolder/Head_CMD_TestFile1.txt
    echo
    echo " 옵션 -n : 위에서 부터 지정한 라인(line) 수 만큼 출력한다."
    echo " 예시3) head -n 17 Head_CMD_TestFolder/Head_CMD_TestFile1.txt"y
    head -n 17 Head_CMD_TestFolder/Head_CMD_TestFile1.txt
    echo
    echo "## 파일 내용의 선두 부분 출력 처리 종료 ##"
    echo 
}

ShowFileContentHead