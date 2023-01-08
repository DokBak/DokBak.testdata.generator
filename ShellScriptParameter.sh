#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 파라미터
#-------------------------
function ShellScriptParameter(){
    echo 
    echo "## 쉘 스크립트 파라미터 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 파라미터를 전달받는 방법을 확인"
    echo
    echo " 변수는 영문자로 시작하거나 _로 시작하여야 한다."
    _20230108=$1
    Param1=$2
    Param2=$3
    Param3=$4
    echo
    echo "첫 번째 파라미터(쉘 파라미터 \$1) : $1"
    echo "두 번째 파라미터(쉘 파라미터 \$2) : $2"
    echo "세 번째 파라미터(쉘 파라미터 \$3) : $3"
    echo "네 번째 파라미터(쉘 파라미터 \$3) : $4"
    echo
    echo "첫 번째 파라미터(로컬 변수 \$_20230108) : $_20230108"
    echo "두 번째 파라미터(로컬 변수 \$Param1) : $Param1"
    echo "세 번째 파라미터(로컬 변수 \$Param2) : $Param2"
    echo "네 번째 파라미터(로컬 변수 \$Param3) : $Param3"
    echo
    echo "입력받은 파라미터 갯수(\$#) : $#"
    echo "입력받은 파라미터의 값들(\$@) : $@"
    echo "## 쉘 스크립트 실행 종료 ##"
    echo 
}

ShellScriptParameter 20230108 seoul tokyo 