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
    echo "현재 쉘의 프로세스 ID를 갖는다.(\$$) : $$ "
    echo "가장 최근에 백그라운드로 실행된 프로세스의 ID (\$!) : $!"
    echo "가장 최근에 실행된 포그라운드 파이프라인의 종료상태를 가지고 있다. (\$?) : $?"
    echo "쉘 또는 쉘 스크립트의 이름 (\$0) : $0"
    echo "쉘이 시작되면 설정되는데 실행된 쉘의 절대 경로를 갖는다. (\$_) : $_"
    echo 
    echo "모든 파라미터(\$*) : $*"
    echo "첫 번째 파라미터(쉘 파라미터 \$1) : $1"
    echo "두 번째 파라미터(쉘 파라미터 \$2) : $2"
    echo "세 번째 파라미터(쉘 파라미터 \$3) : $3"
    echo "네 번째 파라미터(쉘 파라미터 \$3) : $4"
    echo "열 번째 파라미터와 같이 두자리수의 파라미터를 받는 경우에는 중괄호{}를 사용해야한다.(쉘 파라미터 \${10}) : ${10}"
    echo
    echo "첫 번째 파라미터(로컬 변수 \$_20230108) : $_20230108"
    echo "두 번째 파라미터(로컬 변수 \$Param1) : $Param1"
    echo "세 번째 파라미터(로컬 변수 \$Param2) : $Param2"
    echo "네 번째 파라미터(로컬 변수 \$Param3) : $Param3"
    echo
    echo "입력받은 파라미터 갯수(\$#) : $#"
    echo "입력받은 파라미터의 값들(\$@) : $@"
    echo
    echo "모든 파라미터를 출력하는 \$* \$@ 차이 확인"
    echo ' 부가설명) ""로 \\* \\@ 감싸기 전까지는 공백으로 데이터를 구분하여 사용하는 같은 역할을 수행한다.'
    echo '         ""로 감싸면 \\*는 모든 단어를 하나의 문자열로 인식, \\@는 따옴표로 감싸진 데이터를 하나의 데이터 인식한다.'
    echo "set 'week Sunday' Monday Tuesday"
    set 'week Sunday' Monday Tuesday
    echo "\$* 출력로 내용 확인"
    for i in $*; do echo $i; done
    echo "\$@ 출력로 내용 확인"
    for i in $@; do echo $i; done
    echo \""\$*\" 출력로 내용 확인"
    for i in "$*"; do echo $i; done
    echo \""\$@\" 출력로 내용 확인"
    for i in "$@"; do echo $i; done
    echo 
    echo "## 쉘 스크립트 파라미터 종료 ##"
    echo 
}

ShellScriptParameter 20230108 seoul tokyo 