#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 변수 문자열 자르기
#-------------------------
function ShellScriptVariablesCut(){
    echo 
    echo "## 쉘 스크립트 변수 문자열 자르기 시작 ##"
    echo
    echo " 기본설명 : 변수의 특정 패턴부분을 잘라내기 할 경우 사용"
    echo "          특수문자 % 또는 #을 한개씩 사용하는 경우 가장 짧게 매칭되는 패턴을 삭제, %% 또는 ## 처럼 2개씩 사용하는 경우 길게 매칭되는 패턴을 삭제"
    echo "          %pattern(%%pattern)의 패턴은 끝지점을 포함하여 검색하기에 변수의 제일 끝 값이 포함될수 있도록 *로 끝나는 패턴을 작성하거나 변수값의 마지막값을 작성해 주어야한다."
    echo "          #pattern(##pattern)의 패턴은 시작지점을 포함하여 검색하기에 변수의 제일 선두 값이 포함될수 있도록 *로 시작하는 패턴을 작성하거나 변수값의 시작값을 작성해 주어야한다."
    TestVariablePattern=AAABBBCCCBBBDDDAAA
    TestVariablePattern2=TestingDataCutTestingDataCut
    echo " 초기 설정값 확인"
    echo "   \${TestVariablePattern} : ${TestVariablePattern}"
    echo
    echo " 기능1) [#변수명] : 변수값의 길이로 사용가능하다."
    echo "   \${#TestVariablePattern} : ${#TestVariablePattern}"
    echo "   \${#TestVariablePattern2} : ${#TestVariablePattern2}"
    echo " 원본 데이터 확인: \${TestVariablePattern} : ${TestVariablePattern}"
    echo
    echo " 기능2) [%pattern] : 끝지점을 포함하여 가장 짧게 매칭되는 패턴 삭제"
    echo "   \${TestVariablePattern%B*A} : ${TestVariablePattern%B*A}"
    echo "   \${TestVariablePattern%B*} : ${TestVariablePattern%B*}"
    echo "   \${TestVariablePattern2%i*t} : ${TestVariablePattern2%i*t}"
    echo "   \${TestVariablePattern2%i*} : ${TestVariablePattern2%i*}"
    echo " 원본 데이터 확인 : \${TestVariablePattern} : ${TestVariablePattern}"
    echo
    echo " 기능3) [%%pattern] : 끝지점을 포함하여 가장 길게 매칭되는 패턴 삭제"
    echo "   \${TestVariablePattern%%B*A} : ${TestVariablePattern%%B*A}"
    echo "   \${TestVariablePattern%%B*} : ${TestVariablePattern%%B*}"
    echo "   \${TestVariablePattern2%%i*t} : ${TestVariablePattern2%%i*t}"
    echo "   \${TestVariablePattern2%%i*} : ${TestVariablePattern2%%i*}"
    echo " 원본 데이터 확인 : \${TestVariablePattern} : ${TestVariablePattern}"
    echo
    echo " 기능4) [#pattern] : 시작지점을 포함하여 가장 짧게 매칭되는 패턴 삭제"
    echo "   \${TestVariablePattern#A*B} : ${TestVariablePattern#A*B}"
    echo "   \${TestVariablePattern#*B} : ${TestVariablePattern#*B}"
    echo "   \${TestVariablePattern2#T*i} : ${TestVariablePattern2#T*i}"
    echo "   \${TestVariablePattern2#*i} : ${TestVariablePattern2#*i}"
    echo " 원본 데이터 확인 : \${TestVariablePattern} : ${TestVariablePattern}"
    echo
    echo " 기능5) [##pattern] : 시작지점을 포함하여 가장 길게 매칭되는 패턴 삭제"
    echo "   \${TestVariablePattern##A*B} : ${TesㅋㅈtVariablePattern##A*B}"
    echo "   \${TestVariablePattern##A*B} : ${TestVariablePattern##*B}"
    echo "   \${TestVariablePattern2##T*i} : ${TestVariablePattern2##T*i}"
    echo "   \${TestVariablePattern2##T*i} : ${TestVariablePattern2##*i}"
    echo " 원본 데이터 확인 : \${TestVariablePattern} : ${TestVariablePattern}"
    echo 
    echo "## 쉘 스크립트 변수 문자열 자르기 종료 ##"
    echo 
}

ShellScriptVariablesCut