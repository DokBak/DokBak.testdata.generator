#!/bin/sh

#-------------------------
# 테스트 쉘 : 심볼릭 링크
#-------------------------
function SymbolicLink(){
    echo 
    echo "## 심볼릭 링크 시작 ##"
    echo
    echo " 명령어  : ln"
    echo " 사용방법 : ln [옵션] [인자1] [인자2]"
    echo " 기본설명 : 원본 파일[인자1]에 대한 하드 링크 파일[인자2]를 생성"
    echo
    echo " 사전실행) ln 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir ln_CMD_TestFolder/"
    mkdir -p ln_CMD_TestFolder
    echo 'test apple' > ln_CMD_TestFolder/ln_CMD_TestFile1.txt
    echo
    echo " 예시1) ln ln_CMD_TestFolder/ln_CMD_TestFile1.txt ln_CMD_TestFolder/ln_CMD_TestFile1_ln.txt"
    echo " 부가설명) 파일이름은 다르나 커널내에서는 같은 파일로 취급한다. 내부적으로는 같은 파일이기에 한 쪽의 내용이 바뀌면 같이 변경된다."
    ln ln_CMD_TestFolder/ln_CMD_TestFile1.txt ln_CMD_TestFolder/ln_CMD_TestFile1_ln.txt
    ls -il ln_CMD_TestFolder
    echo
    echo " 옵션 -s : 윈도우즈의 바로가기 파일처럼 원본 파일을 가리키는 새로운 파일을 생성한다."
    echo " 예시2) ln -s ln_CMD_TestFolder/ln_CMD_TestFile1.txt ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt"
    ln -s ln_CMD_TestFolder/ln_CMD_TestFile1.txt ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt
    ls -il ln_CMD_TestFolder
    echo
    cat ln_CMD_TestFolder/ln_CMD_TestFile1.txt
    cat ln_CMD_TestFolder/ln_CMD_TestFile1_ln.txt
    cat ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt
    echo 'test apple Test' > ln_CMD_TestFolder/ln_CMD_TestFile1.txt
    cat ln_CMD_TestFolder/ln_CMD_TestFile1.txt
    cat ln_CMD_TestFolder/ln_CMD_TestFile1_ln.txt
    cat ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt
    echo
    echo "## 심볼릭 링크 종료 ##"
    echo 
}

SymbolicLink