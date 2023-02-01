#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 읽기 전용 변수 선언(readonly)
#-------------------------
function ShellScriptVariableReadonly(){
    echo 
    echo "## 쉘 스크립트 읽기 전용 변수 선언(readonly) 시작 ##"
    echo
    echo " 기본설명 : 쉘 스크립트 읽기 전용 변수 사용 방법(readonly)"
    echo
    echo " 사용법) 변수 선언시 readonly를 붙여서 읽기 전용 변수로 지정해준다."
    readonly ReadonlyVariString=VariString
    echo "ReadonlyVariString : $ReadonlyVariString"
    echo 
    echo " 재선언은 불가능하다."
    echo " ReadonlyVariString=Testing 실행시 에러가 발생한다."
    ReadonlyVariString=Testing
    echo "ReadonlyVariString : $ReadonlyVariString"
    echo
    echo "## 쉘 스크립트 읽기 전용 변수 선언(readonly) 종료 ##"
    echo 
}

ShellScriptVariableReadonly