#!/bin/sh

#-------------------------
# 테스트 쉘 : 명령어 히스토리 리스트 처리 (fc)
#-------------------------
function CommandFc(){
    echo 
    echo "## 명령어 히스토리 리스트 처리 (fc) 시작 ##"
    echo " 명령어  : fc"
    echo " 사용방법 : fc"
    echo " 기본설명 : 이전에 사용하였던 커맨드를 수정하고 재실행한다. (스크립트 상에서는 출력되지 않는다.)"
    echo
    echo " 사전실행) fc 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir fc_CMD_TestFolder/"
    mkdir -p fc_CMD_TestFolder
    echo "    echo 'TestFile1 Testing1' > fc_CMD_TestFolder/fc_CMD_TestFile1.txt"
    echo 'TestFile1 Testing1' > fc_CMD_TestFolder/fc_CMD_TestFile1.txt
    echo "    echo 'TestFile2 Testing2' > fc_CMD_TestFolder/fc_CMD_TestFile2.txt"
    echo 'TestFile2 Testing2' > fc_CMD_TestFolder/fc_CMD_TestFile2.txt
    echo
    echo " 예시1) fc -l"
    echo " 부가설명) -l : 이전 명령어 15줄이 출력된다.(이전에 사용한 명령중 가장 오래된 명령어부터 출력)"
    fc -l
    echo
    echo " 예시2) fc -l -r"
    echo " 부가설명) -r : 역순으로 출력된다.(가장 최근 사용한 명령어부터 출력)"
    fc -l -r
    echo
    echo " 예시3) fc -l -r -n"
    echo " 부가설명) -n : 숫자로 넣은 아규먼트 값만큼의 이력이 출력된다."
    fc -l -r -3
    echo
    echo " 예시4) fc -l -r -n -m"
    echo " 부가설명) -n -m : n번째부터 m번째까지 명령어 리스트를 출력한다."
    fc -l -r -3 -5
    echo
    echo " 예시5) fc -e editor"
    echo " 부가설명) -e editor : 지정한 에디터로 이전에 사용한 명령어를 수정한다."
    fc -e vim
    echo
    echo "## 명령어 히스토리 리스트 처리 (fc) 종료 ##"
    echo 
}

CommandFc