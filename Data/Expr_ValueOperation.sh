#!/bin/sh

#-------------------------
# 테스트 쉘 : 값 연산
#-------------------------
function ValueOperation(){
    echo 
    echo "## 값 연산 시작 ##"
    echo " 명령어  : expr"
    echo " 사용방법 : expr "
    echo " 기본설명 : 두 값에 대해서 연산이 가능하다(산술, 논리, 관계, 동치). 연산자는 \' 또는 \"로 감싸 주는 거나 \로 이스케이프 시킨다."
    echo
    echo " 산술연산 : 연산자는 \' 또는 \"로 감싸 주는 거나 \로 이스케이프 시킨다. 연산자와 피연산자 사이에는 공백( )을 주어 하나의 문자열로 인식되지 않도록한다.  "
    echo " 예시1) expr 4 '+' 3"
    expr 4 '+' 3
    echo " 예시2) expr 4 '-' 3"
    expr 4 '-' 3
    echo " 예시3) expr 4 '*' 3"
    expr 4 '*' 3
    echo " 예시4) expr 4 '/' 3"
    expr 4 '/' 3
    echo " 예시5) expr 4 '%' 3"
    expr 4 '%' 3
    echo 
    echo " 논리연산 : 두 값에 값이 존재 하는지를 판별."
    echo " | : 한 쪽값이 ''(빈문자열) 또는 0 인경우 다른 값을 출력, 둘 다 아닌 경우 앞의 값이 출력."
    echo " & : 한 쪽값이 ''(빈문자열) 또는 0 인경우 0을 출력, 둘 다 아닌 경우 앞의 값이 출력."
    echo " 예시6) expr '' '|' '3'"
    expr '' '|' '3'
    echo " 예시7) expr '0' '|' '3'"
    expr '0' '|' '3'
    echo " 예시8) expr '1' '|' '3'"
    expr '1' '|' '3'
    echo " 예시9) expr '2' '|' '3'"
    expr '2' '|' '3'
    echo
    echo " 예시10) expr '' '&' '3'"
    expr '' '&' '3'
    echo " 예시11) expr '0' '&' '3'"
    expr '0' '&' '3'
    echo " 예시12) expr '1' '&' '3'"
    expr '1' '&' '3'
    echo " 예시13) expr '2' '&' '3'"
    expr '2' '&' '3'
    echo
    echo " 관계연산 : 두 값에 크기 비교. 참일 경우 1, 거짓일 경우 0 출력"
    echo " 예시14) expr '3' '=' '3'"
    expr '3' '=' '3'
    echo " 예시15) expr '0' '>' '3'"
    expr '0' '>' '3'
    echo " 예시16) expr '1' '>=' '3'"
    expr '1' '>=' '3'
    echo " 예시17) expr '2' '<' '3'"
    expr '2' '<' '3'
    echo " 예시18) expr '2' '<=' '3'"
    expr '2' '<=' '3'
    echo " 예시19) expr '2' '!=' '3'"
    expr '2' '!=' '3'
    echo
    echo " 동치연산 : 우측값이 좌측값의 앞에서부터 일치하는 경우 일치하는 문자열 길이 출력, 거짓일 경우 0 출력"
    echo " 예시20) expr 'ASD123' ':' 'ASD'"
    expr 'ASD123' ':' 'ASD'
    echo " 예시21) expr 'ASD' ':' 'ASD123'"
    expr 'ASD' ':' 'ASD123'
    echo
    echo "## 값 연산 종료 ##"
    echo 
}

ValueOperation