#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 산술 계산(이중 괄호)
#-------------------------
function ShellScriptCalculateBracket(){
    echo 
    echo "## 쉘 스크립트 산술 계산(이중 괄호) 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 산술 계산을 하는 방법을 확인(이중 괄호)"
    echo
    echo " 사용법) \$(( 산술식 )) \$과 이중괄호 사이에 산술식을 넣어 산술 계산을 실시한다. + : 덧셈, - : 뺼셈, * : 곱셈, / : 나눗셈(몫), % : 나눗셈(나머지)"
    echo 
    NumVar1=8
    echo "NumVar1 : $NumVar1"
    NumVar2=5
    echo "NumVar2 : $NumVar2"
    ADDVar=$(( $NumVar1 + $NumVar2 ))
    echo "ADDVar : \$(( $NumVar1 + $NumVar2 )) = $(( $NumVar1 + $NumVar2 ))"
    SUBVar=$(( $NumVar1 - $NumVar2 ))
    echo "SUBVar : \$(( $NumVar1 - $NumVar2 )) = $(( $NumVar1 - $NumVar2 ))"
    MULVar=$(( $NumVar1 * $NumVar2 ))
    echo "MULVar : \$(( $NumVar1 * $NumVar2 )) = $(( $NumVar1 * $NumVar2 ))"
    DIVVar=$(( $NumVar1 / $NumVar2 ))
    echo "DIVVar : \$(( $NumVar1 / $NumVar2 )) = $(( $NumVar1 / $NumVar2 ))"
    MODVar=$(( $NumVar1 % $NumVar2 ))
    echo "MODVar : \$(( $NumVar1 % $NumVar2 )) = $(( $NumVar1 % $NumVar2 ))"
    echo 
    echo "## 쉘 스크립트 산술 계산(이중 괄호) 종료 ##"
    echo 
}

ShellScriptCalculateBracket