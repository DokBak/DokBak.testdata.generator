#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 조건문(case)
#-------------------------
function ShellScriptCase(){
    echo 
    echo "## 쉘 스크립트 조건문 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 조건문 사용할때의 방법을 확인"
    echo
    echo " 사용법) case '변수명' in [값1]) [실행문] ;; [값2]) [실행문] ;; *) [디폴트 실행문] esac"
    echo
    echo "kr, jp, us 중에서 입력"
    read caseVar
    echo 
    case "$caseVar" in
        kr)
            echo "$caseVar is kr"
            ;;
        jp)
            echo "$caseVar is jp"
            ;;
        us)
            echo "$caseVar is us"
            ;;
        *) echo "caseVar ? " # default
    esac
    echo
    echo " 한 줄 사용법 : [값1] 뒤에는 ;; 으로 작성하고, 디폴트 값이 작성되는 *) 뒤의 [실행문] 뒤에는 ; 를 입력하여 한줄이 종료되었다는 것을 알린다."
    case "$caseVar" in kr) echo "$caseVar is kr2";; jp) echo "$caseVar is jp2";; us) echo "$caseVar is us";; *) echo "caseVar2 ? "; esac
    echo 
    echo "## 쉘 스크립트 조건문 종료 ##"
    echo 
}

ShellScriptCase