#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 변수의 확장 변경자
#-------------------------
function ShellScriptVariablesExtensionModifiy(){
    echo 
    echo "## 쉘 스크립트 변수의 확장 변경자 시작 ##"
    echo
    echo " 기본설명 : 콜론[ : ]과 특수문자[ - = + ?  ]의 조합으로 변수값을 일시적 변경하거나 사용할 수도 있고, 변수값이 null경우에는 영구적으로 지정하여 사용할 수도 있다."
    echo
    TestVariableNotNull=TestVariableNotNull
    TestVariableNull=
    echo "   \${TestVariableNotNull} : ${TestVariableNotNull}"
    echo "   \${TestVariableNull} : ${TestVariableNull}"
    echo
    echo " 기능1) [:-Word] : 변수가 null이 아니라면 변수의 값을 그대로 사용하고, 변수가 null이라면 [Word]로 치환한다.(일시적)"
    echo "   \${TestVariableNotNull:-Test1} : ${TestVariableNotNull:-Test1}"
    echo "   \${TestVariableNull:-Test1} : ${TestVariableNull:-Test1}"
    echo 
    echo "  확장 변경자 사용하지 않고 변수값 확인 : 초기 설정값이 출력"
    echo "   \${TestVariableNotNull} : ${TestVariableNotNull}"
    echo "   \${TestVariableNull} : ${TestVariableNull}"
    echo
    echo " 기능2) [:=Word] : 변수가 null이 아니라면 변수의 값을 그대로 사용하고, 변수가 null이라면 [Word]로 치환한다.(영구적)"
    echo "   \${TestVariableNotNull:=Test1} : ${TestVariableNotNull:=Test1}"
    echo "   \${TestVariableNull:=Test1} : ${TestVariableNull:=Test1}"
    echo 
    echo "  확장 변경자 사용하지 않고 변수값 확인 : null이엇던 값은 변수 값이 수정되었다."
    echo "   \${TestVariableNotNull} : ${TestVariableNotNull}"
    echo "   \${TestVariableNull} : ${TestVariableNull}"
    echo
    TestVariableNotNull=TestVariableNotNull
    TestVariableNull=
    echo " 기능3) [:+Word] : 변수가 null이 아니라면 [Word]로 치환하고, 변수가 null이라면 아무것도 하지 않는다.(일시적)"
    echo "   \${TestVariableNotNull:+Test1} : ${TestVariableNotNull:+Test1}"
    echo "   \${TestVariableNull:+Test1} : ${TestVariableNull:+Test1}"
    echo 
    echo "  확장 변경자 사용하지 않고 변수값 확인 : 초기 설정값이 출력"
    echo "   \${TestVariableNotNull} : ${TestVariableNotNull}"
    echo "   \${TestVariableNull} : ${TestVariableNull}"
    echo
    echo " 기능4) [:offset] : 변수값 좌측부터 [offset] 숫자만큼 소거(offset)하여 출력. [offset]은 양수만 입력.(일시적)"
    echo "   \${TestVariableNotNull:6} : ${TestVariableNotNull:6}"
    echo "   \${TestVariableNull:6} : ${TestVariableNull:6}"
    echo 
    echo "  확장 변경자 사용하지 않고 변수값 확인 : 초기 설정값이 출력"
    echo "   \${TestVariableNotNull} : ${TestVariableNotNull}"
    echo "   \${TestVariableNull} : ${TestVariableNull}"
    echo
    echo " 기능5) [:offset:length] : 변수값 좌측부터 [offset] 숫자만큼 소거(offset)하고 [length] 만큼 출력. [offset][length]는 양수만 입력.(일시적)"
    echo "   \${TestVariableNotNull:6:2} : ${TestVariableNotNull:6:3}"
    echo "   \${TestVariableNull:6:2} : ${TestVariableNull:6:3}"
    echo 
    echo "  확장 변경자 사용하지 않고 변수값 확인 : 초기 설정값이 출력"
    echo "   \${TestVariableNotNull} : ${TestVariableNotNull}"
    echo "   \${TestVariableNull} : ${TestVariableNull}"
    echo
    echo " 기능6) [:?Word] : 변수가 null이 아니라면 변수값을 사용하고, 변수가 null이라면 에러 출력후 쉘이 종료된다."
    echo "   \${TestVariableNotNull:?Test1} : ${TestVariableNotNull:?Test1}"
    echo "   \${TestVariableNull:?Test1} : ${TestVariableNull:?Test1}"
    echo " 쉘이 종료되기 때문에 이 메시지는 출력되지 않는다."
    echo 
    echo "## 쉘 스크립트 변수의 확장 변경자 종료 ##"
    echo 
}

ShellScriptVariablesExtensionModifiy