#!/bin/sh

#-------------------------
# 테스트 쉘 : 데이터 정렬
#-------------------------
function FileSort(){
    echo 
    echo "## 데이터 정렬 시작 ##"
    echo " 명령어  : sort "
    echo " 사용방법 : sort [정렬할대상]"
    echo " 기본설명 : [정렬할대상]의 데이터를 내림차순/오름차순으로 정렬한다.(오름차순이 디폴트)"
    echo
    echo " 사전실행) sort 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir -p sort_CMD_TestFolder/sort_CMD_TestFolder2/sort_CMD_TestFolder3/"
    mkdir -p sort_CMD_TestFolder/sort_CMD_TestFolder2/sort_CMD_TestFolder3/
    echo "    echo 'TestFile1' > sort_CMD_TestFolder/sort_CMD_TestFile1.txt"
    echo 'TestFile1' > sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "apple,banana,cream,dust,Test,txt,TestFile1,gui" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "  Test,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "zTest,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "tTest,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "xTest,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "cdTest,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "Test,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "   vvTest,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "gTest,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "Test,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "oTest,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "iTest,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "pTest,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "vvTest,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "qlTest,bash,zsh,sh" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo "sTest,java,Javascript,C,C#,C++,python,ruby" >> sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo
    echo " 예시1) sort sort_CMD_TestFolder/sort_CMD_TestFile1.txt"
    sort sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo
    echo
    echo " 옵션 -r : 내림차순으로 정렬하여 출력한다."
    echo " 예시1) sort -r sort_CMD_TestFolder/sort_CMD_TestFile1.txt"
    sort -r sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo
    echo " 옵션 -f : 대소문자를 구분하지 않고 정렬하여 출력한다.([--ignore-case]로도 가능하다.)"
    echo " 예시2-1) sort -f sort_CMD_TestFolder/sort_CMD_TestFile1.txt"
    sort -f sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " 예시2-2) sort --ignore-case sort_CMD_TestFolder/sort_CMD_TestFile1.txt"
    sort --ignore-case sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo
    echo " 옵션 -b : 선두의 공백은 무시하고 정렬하여 출력한다."
    echo " 예시3) sort -b sort_CMD_TestFolder/sort_CMD_TestFile1.txt"
    sort -b sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo
    echo "## 데이터 정렬 종료 ##"
    echo 
}

FileSort 