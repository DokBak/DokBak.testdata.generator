#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 명령 내용 변수에 담기
#-------------------------
function ShellScriptPrintCommand(){
    echo 
    echo "## 쉘 스크립트 명령 내용 변수에 담기 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 명령 내용을 변수에 담에 활용하는 방법을 확인"
    echo
    echo " 사용법) 명령어를 실행한 값(내용)을 변수에 담는 방법(\`\`)"
    echo
    nV1=pwd 
    echo "값을 감싸지 않고 선언 : nV1= $nV1"
    nV2="pwd"
    echo "값을 \"\"로 감싸고 선언 : nV2= $nV2"
    nV3='pwd'
    echo "값을 ''로 감싸고 선언 : nV3= $nV3"
    nV4=`pwd`
    echo "값을 \`\`로 감싸고 선언 : nV4= $nV4"
    nV5=`echo "test echo"`
    echo "샘플 nV5 : $nV5"
    echo 
    echo "## 쉘 스크립트 명령 내용 변수에 담기종료 ##"
    echo 
}

ShellScriptPrintCommand