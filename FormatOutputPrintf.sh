#!/bin/sh

#-------------------------
# 테스트 쉘 : 포멧 지정 출력
#-------------------------
function FormatOutputPrintf(){
    echo 
    echo "## 포멧 지정 출력 시작 ##"
    echo " 명령어  : printf"
    echo " 사용방법 : printf [포멧] [출력값]"
    echo " 기본설명 : 출력값의 포멧을 지정하여 출력한다. printf 명령의 경우 C언어의 printf함수와 동일한 방법을 사용한다."
    echo
    echo " 예시1) printf '%s %f %d' 'Test Data' 15.1 15"
    echo " 부가설명) [포멧]갯수 = [출력값]으로 작성되어야 한다."
    printf '%s %f %d' 'Test Data' 15.1 15
    echo
    echo
    echo " 포멧 %s : 문자형 데이터 출력"
    echo " 예시2) printf '%s' 'Test Data'"
    printf '%s' 'Test Data'
    echo
    echo 
    echo " 예시3) printf '%15s%d' 'Test Data' 15"
    echo " 부가설명) %와 s 사이에 양수의 숫자(15)를 작성하면 숫자(15)는 총 자리수가 되어 [출력값]문자수 < 숫자인 경우 앞쪽에 차이가 나는 만큼 [ ]공백으로 채워진다."
    printf '%11s%d' 'Test Data' 15
    echo
    echo 
    echo " 예시4) printf '%-15s%d' 'Test Data' 15"
    echo " 부가설명) %와 s 사이에 음의 숫자(-15)를 작성하면 숫자(15)는 총 자리수가 되어 [출력값]문자수 < 숫자인 경우 뒷쪽에 차이가 나는 만큼 [ ]공백으로 채워진다."
    printf '%-15s%d' 'Test Data' 15
    echo
    echo 
    echo " 포멧 %d : 정수형 숫자 데이터 출력, [출력값]을 실수형으로 작성시 에러 발생"
    echo " 예시5) printf '%d' 15"
    printf '%d' 15
    echo
    echo
    echo " 예시6) printf '%03d' 15"
    echo " 부가설명) %d 사이에 앞에 0이 붙인채 정수를 입력하면 해당 정수만큼 자리수가 출력되며 [출력값]의 값이 자리수보다 작다면 앞에 자리수만큼 숫자 0이 붙는다. : 015"
    printf '%03d' 15
    echo
    echo
    echo " 포멧 %f : 실수형 숫자 데이터 출력 [출력값]에 자릿수 설정을 하지 않는다면 %.6f 형식으로 출력된다. 자릿수를 지정할경우에는 반드시 [.]은 작성되어야 한다. [.]을 기준으로 좌측은 총 자리수, 우측은 소수점 자리수이다."
    echo " 예시7) printf '%f' 15.0123456"
    echo " 부가설명) 소수점 6번째까지만 출력하기에 7번째에서 반올림 : 15.012346"
    printf '%f' 15.0123456
    echo
    echo
    echo " 예시8) printf '%.f' 15.54321"
    echo " 부가설명) [.]만 있는 경우와 [.0]인 경우 둘다 소수점 1번째자리에서 반올림하여 정수값만 출력 : 16"
    printf '%.f' 15.54321
    echo
    echo
    echo " 예시9) printf '%.2f' 15.0125456"
    echo " 부가설명) [.2] 소수점 2번째자리까지 출력하기위해 소수점 3번째 자리에서 반올림 : 15.02"
    printf '%.2f' 15.0125456
    echo
    echo
    echo " 예시10) printf '%4.f' 15.0123456"
    echo " 부가설명) [4.] 소수점 위 정수값이 4자리 정수가 아닌경우 빈자리에 [ ]공백을 추가해서 출력한다."
    printf '%4.f' 15.0123456
    echo
    echo
    echo " 예시11) printf '%6.2f' 15.0163456"
    echo " 예시11) printf '%6.2f' 1515.0163456"
    echo " 부가설명) [6.2]에서 소수점 아래 .2 는 출력할 소수점 자리수이며, 6는 총 자리수를 의미한다."
    printf '%6.2f' 5.0163456
    echo
    echo
    printf '%6.2f' 1515.0163456
    echo
    echo
    echo " 부가설명) \를 사용하여 특수 문자를 출력, 특수 기능을 수행한다."
    echo " 예시12) printf 'S\"E' -> \\\" : 쌍따옴표를 출력"
    echo "      ) printf 'S\\E' -> \\\\ : 역슬래시를 출력"
    echo "      ) printf 'S\aE' -> \\\a : 경고 또는 비프음을 출력"
    echo "      ) printf 'S\bE' -> \\\b : 백스페이스를 실행"
    echo "      ) printf 'S\fE' -> \\\f : 한 줄 밑으로 내려서 출력(폼피드)"
    echo "      ) printf 'S\nE' -> \\\n : 개행문자"
    echo "      ) printf 'S\rE' -> \\\r : 앞쪽의 문자열 모두 삭제(캐리지 리턴)"
    echo "      ) printf 'S\tE' -> \\\t : 수평탭 출력"
    echo "      ) printf 'S\vE' -> \\\v : 수직탭 출력"
    echo "      ) printf 'S\cE' -> \\\c : 이후의 문자는 출력하지 않는다."
    echo "      )               -> \\\c : 이후의 문자는 출력하지 않는다."
    echo
    echo "## 포멧 지정 출력 종료 ##"
    echo 
}

FormatOutputPrintf