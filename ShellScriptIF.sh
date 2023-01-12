#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 조건문
#-------------------------
function ShellScriptIF(){
    echo 
    echo "## 쉘 스크립트 조건문 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 조건문 사용할때의 방법을 확인"
    echo
    echo " 입력받은 파라미터 수 : $#"
    echo " 입력받은 파라미터 : $*"
    echo
    if [ $1 = "Seoul" ]
    then
        echo "문자열 비교(두 문자열이 동일) : ="
        echo "참 조건 : [ Seoul = Seoul ]"
        echo 
    fi
    if [ $1 != "seoul" ]
    then
        echo "문자열 비교(두 문자열이 다름) : !="
        echo "참 조건 : [ Seoul != seoul ]" 
        echo
    fi
    if [ $2 -eq 10 ]
    then 
        echo "숫자 비교(두 숫자가 동일) : -eq"
        echo "참 조건 : [ 10 -eq 10 ]" 
        echo
    fi
    if [ $2 -ne 11 ]
    then 
        echo "숫자 비교(두 숫자가 다름) : -ne"
        echo "참 조건 : [ 10 -ne 11 ]" 
        echo
    fi
    if [ 10 -eq 10 -a 11 -eq 12 ] 
    then 
        echo "bool 비교(두 조건문이 모두 참[AND]) : -a"
        echo "거짓 조건 : [ 10 -eq 10 -a 11 -eq 12 ]" 
        echo
    elif [ 10 -eq 10 -a 11 -eq 11 ] 
    then 
        echo "bool 비교(두 조건문이 모두 참[AND]) : -a"
        echo "참 조건 : [ 10 -eq 10 -a 11 -eq 11 ]" 
        echo
    fi
    if [ 10 -eq 11 -o 11 -eq 12 ] 
    then 
        echo "bool 비교(두 조건문중 하나는 참[OR]) : -o"
        echo "거짓 조건 : [ 10 -eq 11 -o 11 -eq 12 ]" 
        echo
    elif [ 10 -eq 10 -o 11 -eq 12 ] 
    then 
        echo "bool 비교(두 조건문중 하나는 참[OR]) : -o"
        echo "참 조건 : [ 10 -eq 10 -o 11 -eq 12 ]" 
        echo
    fi
    if [ ! 10 -eq 10 ] 
    then 
        echo "bool 비교(조건문 값의 역) : !"
        echo "거짓 조건 : [ ! 10 -eq 10  ]" 
        echo
    elif [ ! 10 -eq 11 ]
    then 
        echo "bool 비교(조건문 값의 역) : !"
        echo "참 조건 : [ ! 10 -eq 11 ]" 
        echo
    fi
    if [ 10 -gt 10 ] 
    then 
        echo "숫자 비교(>) : -gt"
        echo "거짓 조건 : [ 10 -gt 10  ]" 
        echo
    elif [ 10 -gt 11 ]
    then 
        echo "숫자 비교(>) : -gt"
        echo "거짓 조건 : [ 10 -gt 11 ]" 
        echo
    elif [ 10 -gt 9 ]
    then 
        echo "숫자 비교(>) : -gt"
        echo "참 조건 : [ 10 -gt 9 ]" 
        echo
    fi
    if [ 10 -ge 11 ]
    then 
        echo "숫자 비교(>=) : -ge"
        echo "거짓 조건 : [ 10 -ge 11 ]" 
        echo
    elif [ 10 -ge 10 ]
    then 
        echo "숫자 비교(>=) : -ge"
        echo "참 조건 : [ 10 -ge 10 ]" 
        echo
    fi
    if [ 10 -lt 10 ] 
    then 
        echo "숫자 비교(<) : -lt"
        echo "거짓 조건 : [ 10 -lt 10  ]" 
        echo
    elif [ 10 -lt 9 ]
    then 
        echo "숫자 비교(<) : -lt"
        echo "거짓 조건 : [ 10 -lt 9 ]" 
        echo
    elif [ 10 -lt 11 ]
    then 
        echo "숫자 비교(<) : -lt"
        echo "참 조건 : [ 10 -lt 11 ]" 
        echo
    fi
    if [ 10 -le 9 ] 
    then 
        echo "숫자 비교(<=) : -le"
        echo "거짓 조건 : [ 10 -le 9  ]" 
        echo
    elif [ 10 -le 10 ]
    then 
        echo "숫자 비교(<=) : -le"
        echo "참 조건 : [ 10 -le 10 ]" 
        echo
    fi
    echo 
    echo "## 쉘 스크립트 조건문 종료 ##"
    echo 
}

ShellScriptIF Seoul 10