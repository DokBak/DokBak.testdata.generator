#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 내용 출력 처리(less)
#-------------------------
function FileContentShow_Less(){
    echo 
    echo "## 파일 내용 출력 처리(less) 시작 ##"
    echo
    echo " 명령어  : less"
    echo " 사용방법 : less "
    echo " 기본설명 : 파일의 내용을 출력하는 명령어, cat은 실행과 동시에 모든 라인을 출력하지만 less의 경우 화면에 맞는 라인만 출력하며 사용자의 조작하여 파일을 읽을 수 있다.(vi와 명령어가 대부분 일치하나 파일 수정은 불가능하다.)"
    echo
    echo " 사전실행) less 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir less_CMD_TestFolder/"
    mkdir -p less_CMD_TestFolder
    echo '###less Text Mod Command###' > less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo 'less 텍스트모드 종료 : q, Q, :q, :Q, ZZ ' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo 'less 도움말 : h H' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo 
    echo '이동 명령'
    echo '1행 아래로 이동 : 아래방향키, e, j, 엔터키' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '1행 위로 이동 : 위방향키, y, k ' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '1페이지 아래로 이동 : f, 스페이스키' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '1페이지 위로 이동 : b' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '0.5페이지 아래로 이동 : d' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '0.5페이지 위로 이동 : u' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo 
    echo '검색 명령'
    echo '[검색어]가 출력되는 행을 제일 위에 출력(현재 페이지에 없는 경우 다음페이지로 검색): /[검색어]' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '[검색어]가 출력되는 행을 제일 위에 출력(현재 페이지에 없는 경우 이전페이지로 검색): ?[검색어]' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo 
    echo '점프 명령'
    echo '제일 첫 줄로 이동 : g' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo '제일 마지막 줄로 이동 : G' >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    echo 
    LINENUM=1
    echo "less start $LINENUM" >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    for n in {1..1000} 
    do 
        LINENUM=$(( LINENUM + 1 ))
        echo "less start $LINENUM" >> less_CMD_TestFolder/less_CMD_TestFile1.txt
    done
    echo
    echo " 예시1) less less_CMD_TestFolder/less_CMD_TestFile1.txt"
    less less_CMD_TestFolder/less_CMD_TestFile1.txt

    echo "## 파일 내용 출력 처리(less) 종료 ##"
    echo 
}

FileContentShow_Less