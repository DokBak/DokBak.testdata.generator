#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 변수 선언(declare/typeset)
#-------------------------
function ShellScriptVariableDeclareTypeset(){
    echo 
    echo "## 쉘 스크립트 변수 선언(declare/typeset) 시작 ##"
    echo
    echo " 기본설명 : 쉘 스크립트 변수 선언하는 방법(declare/typeset)"
    echo
    echo " 사용법) declare 뒤에 아규먼트가 없다면 등록된 전역변수 값들이 출력된다. declare대신typeset을 사용해도 된다.같은 역할"
    echo " declare "
    declare
    echo
    echo " 옵션) -x : export까지 진행하여 전역변수로도 선언되는 옵션"
    echo " 전역 변수 선언 전 전역변수들 출력(env)"
    env
    declare -x DeclareVariExport=VariExport
    echo " 전역 변수 선언 후 전역변수들 출력(env)"
    env
    echo
    echo " 옵션) -r : 읽기 전용 변수로 등록, 재등록은 불가"
    declare -r DeclareVariReadOnly=VariReadOnly
    echo "declare DeclareVariReadOnly : $DeclareVariReadOnly"
    #DeclareVariReadOnly=TestingRename
    #declare -r DeclareVariReadOnly=VariReadOnlyRename
    #echo "DeclareVariReadOnly : $DeclareVariReadOnly"
    echo
    echo " 옵션) -a : 배열로 정의"
    echo "declare -a DeclareVariArray=(Text1 Text2)"
    declare -a DeclareVariArray=(Text1 Text2)
    echo "declare DeclareVariArray : Arrayitem1=${DeclareVariArray[0]}, Arrayitem2=${DeclareVariArray[1]}"
    echo
    echo " 옵션) -i : 숫자형으로 정의 -> 숫자가 아닌 문자를 값으로 지정하면 0값이 들어간다."
    echo "declare -i DeclareVariInt=152"
    declare -i DeclareVariInt=152
    echo "declare DeclareVariInt : $DeclareVariInt"
    echo
    echo " 옵션) -f : 현재 정의된 모든 함수 표시[내용 포함] (아규먼트로 함수명을 지정하면 해당 함수만 출력된다.)"
    echo "declare -f"
    declare -f 
    echo "declare -f ShellScriptVariableDeclare"
    declare -f ShellScriptVariableDeclare
    echo
    echo " 옵션) -F: 현재 정의된 모든 함수 이름 표시"
    echo "declare -F"
    declare -F 
    echo
    echo " 옵션) -p: 현재 정의된 변수를 모두 표시"
    echo "declare -p"
    declare -p 
    echo
    #echo " 옵션) -l : 변수값을 소문자로 선언하는 옵션"
    #declare -l DeclareVariLower=VariLower
    #echo "DeclareVariLower : $DeclareVariLower"
    #echo " 옵션) -u : 변수값을 대문자로 선언하는 옵션"
    #declare -u DeclareVariUpper=VariUpper
    #echo "DeclareVariUpper : $DeclareVariUpper"
    echo
    echo "## 쉘 스크립트 변수 선언(declare/typeset) 종료 ##"
    echo 
}

ShellScriptVariableDeclareTypeset