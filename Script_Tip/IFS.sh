#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 내부 필드 분리자
#-------------------------
function ShellScriptIFS(){
    echo 
    echo "## 쉘 스크립트 내부 필드 분리자 시작 ##"
    echo
    echo " 기본설명 : read, set, for 등 단어목록을 분석하는 명령을 사용시 내부필드분리자값을 지정하여 사용할 수도 있다. 기본적으로는 공백, 탭, newline등의 문자를 평가한다."
    echo
    echo " :로 구분되어진 nation변수를 선언 -> nation=Korea:Japan:China:USA"
    echo
    nation=Korea:Japan:China:USA
    echo " IFS 기본값으로 결과 값을 확인(예시 for문)"
    for country in $nation
    do  
        NumValue=$(( NumValue + 1 ))
        echo " : 로 구분되진 $NumValue 번째 데이터 $country"
    done
    echo
    echo " 기존 IFS값을 백업후 :로 재지정후 결과 값을 확인(예시 for문)"
    oldifs="$IFS"
    IFS=":"
    NumValue=0
    for country in $nation
    do  
        NumValue=$(( NumValue + 1 ))
        echo " : 로 구분되진 $NumValue 번째 데이터 $country"
    done
    echo
    echo "## 쉘 스크립트 내부 필드 분리자 종료 ##"
    echo 
}

ShellScriptIFS