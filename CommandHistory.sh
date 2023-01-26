#!/bin/sh

#-------------------------
# 테스트 쉘 : 명령어 히스토리 확인 (history)
#-------------------------
function CommandHistory(){
    echo 
    echo "## 명령어 히스토리 확인 (history) 시작 ##"
    echo " 명령어  : history"
    echo " 사용방법 : history"
    echo " 기본설명 : 이전에 사용하였던 커맨드를 출력한다. (스크립트 상에서는 출력되지 않는다.)"
    echo
    echo " 사전실행) history 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir history_CMD_TestFolder/"
    mkdir -p history_CMD_TestFolder
    echo "    echo 'TestFile1 Testing1' > history_CMD_TestFolder/history_CMD_TestFile1.txt"
    echo 'TestFile1 Testing1' > history_CMD_TestFolder/history_CMD_TestFile1.txt
    echo "    echo 'TestFile2 Testing2' > history_CMD_TestFolder/history_CMD_TestFile2.txt"
    echo 'TestFile2 Testing2' > history_CMD_TestFolder/history_CMD_TestFile2.txt
    echo
    echo " 예시1) history"
    echo " 부가설명) 이전 명령어 15줄이 출력된다."
    history
    echo
    echo " 예시2) history 1"
    echo " 부가설명) 아규먼트로 숫자를 넣게되면 첫번째 명령부터 사용했던 모든 이력이 출력된다."
    echo " 부가설명) 또는 숫자로 넣은 아규먼트 값만큼의 이력이 출력된다."
    history 1
    echo
    echo "## 명령어 히스토리 확인 (history) 종료 ##"
    echo 
}

CommandHistory