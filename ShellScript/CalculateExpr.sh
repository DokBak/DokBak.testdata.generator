#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 산술 계산(expr)
#-------------------------
function ShellScriptCalculateExpr(){
    echo 
    echo "## 쉘 스크립트 산술 계산(expr) 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 산술 계산을 하는 방법을 확인(expr)"
    echo
    echo " 사용법) expr의 산술연산을 이용한다. + : 덧셈, - : 뺼셈, * : 곱셈, / : 나눗셈(몫), % : 나눗셈(나머지)"
    echo 
    NumVar1=8
    echo "NumVar1 : $NumVar1"
    NumVar2=5
    echo "NumVar2 : $NumVar2"
    ADDVar=`expr $NumVar1 '+' $NumVar2 `
    echo "ADDVar : $NumVar1 + $NumVar2 = `expr $NumVar1 '+' $NumVar2 `"
    SUBVar=`expr $NumVar1 '-' $NumVar2 `
    echo "SUBVar : $NumVar1 - $NumVar2 = `expr $NumVar1 '-' $NumVar2 `"
    MULVar=`expr $NumVar1 '*' $NumVar2 `
    echo "MULVar : $NumVar1 * $NumVar2 = `expr $NumVar1 '*' $NumVar2 `"
    DIVVar=`expr $NumVar1 '/' $NumVar2 `
    echo "DIVVar : $NumVar1 / $NumVar2 = `expr $NumVar1 '/' $NumVar2 `"
    MODVar=`expr $NumVar1 '%' $NumVar2 `
    echo "MODVar : $NumVar1 % $NumVar2 = `expr $NumVar1 '%' $NumVar2 `"
    echo 
    echo "## 쉘 스크립트 산술 계산(expr) 종료 ##"
    echo 
}

ShellScriptCalculateExpr