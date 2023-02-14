#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 연관 배열(Map)
#-------------------------
function ShellScriptVariableMap(){
    echo 
    echo "## 쉘 스크립트 연관 배열(Map) 시작 ##"
    echo
    echo " 기본설명 : 맵변수[키값]=[벨류값]의 형태로 선언가능하다."
    echo "           일반 변수를 맵에 넣어 사용할 수도 있다."
    MapVariable[MapVari1]='TestData1'
    MapVariable[MapVari2]='TestData2'
    echo "MapVariable[MapVari1]=$MapVariable[MapVari1]"
    echo "MapVariable[MapVari2]=$MapVariable[MapVari2]"
    echo
    echo " 일반 변수를 맵 변수에 넣어 사용할수 있다."
    keyTest=ValueTest
    MapVariable[keyTest]=${keyTest}
    echo "MapVariable[keyTest]=$MapVariable[keyTest]"
    echo
    echo "all=${MapVariable[@]}"
    echo "keys=${!MapVariable[@]}"
    echo "length=${#MapVariable[@]}"
    echo
    echo "## 쉘 스크립트 연관 배열(Map) 종료 ##"
    echo 
}

ShellScriptVariableMap