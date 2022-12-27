#!/bin/sh

#-------------------------
# 테스트 쉘 : 명령어 선언
#-------------------------
function CommandCreate(){
    echo 
    echo "## 명령어 선언 시작 ##"
    echo " 명령어  : alias"
    echo " 사용방법 : alias [명령어]=[사용할명령어내용]"
    echo " 기본설명 : 자주 사용하는 명령어를 좀 더 간략하게 사용하기 위해 선언하는 변수라고 생각할 수 있다. 예 ll -> ls -l"
    echo
    echo " 예시1) alias"
    echo " 부가설명) 설정되어 있는 alias 명령어들을 출력한다."
    echo "         -> 쉘 내부에 작성한 경우에는 출력되지 않는 것처럼 보인다."
    alias 
    echo
    echo " 예시2) alias md='mkdir alias_CMD_TestFolder'"
    echo " 부가설명) md 명령어를 입력하면 [mkdir aliasFolder]가 실행되는 명령어를 만든다."
    echo "         -> 쉘 내부에 작성한 경우에는 출력되지 않는 것처럼 보인다."
    alias md="mkdir alias_CMD_TestFolder"
    ls
    md
    ls
    echo
    echo "## 명령어 선언 종료 ##"
    echo 
}

CommandCreate