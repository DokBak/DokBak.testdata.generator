#!/bin/sh

#-------------------------
# 테스트 쉘 : 데이터 컨트롤(awk)
#-------------------------
function DataControlAwk(){
    echo 
    echo "## 데이터 컨트롤(awk) 시작 ##"
    echo " 명령어  : awk"
    echo " 사용방법 : awk [옵션] ['pattern' or {action}]"
    echo " 기본설명 : 데이터를 컨트롤 pattern 의 경우 if문의 조건과 같은 역할을 하고, action의 경우 {}로 감싸여진 문자으로 내부적으론 ;(세미콜론)으로 구분된다. "
    echo
    echo " 사전실행) awk 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir -p awk_CMD_TestFolder/"
    mkdir -p awk_CMD_TestFolder/
    echo "    echo 'Kr Korea 3324 5/11/96 50354' > awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo "    echo 'Jp Japan 5246 15/9/66 287650' >> awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo "    echo 'Us USA 7654 6/20/58 60000' >> awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo "    echo 'Cn China 8683 9/40/48 465000' >> awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo 'Kr Korea 3324 5/11/96 50354' > awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo 'Jp Japan 5246 15/9/66 287650' >> awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo 'Us USA 7654 6/20/58 60000' >> awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo 'Cn China 8683 9/40/48 465000' >> awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo "    echo '{print \"Country : \" \$1, \$2 }' > awk_CMD_TestFolder/awk_CMD_Command.txt"
    echo "    echo '{print \$1, \$2, \$3, \$4, \$5 }' >> awk_CMD_TestFolder/awk_CMD_Command.txt"
    echo '{print "Country : " $1, $2 }' > awk_CMD_TestFolder/awk_CMD_Command.txt
    echo '{print $1, $2, $3, $4, $5 }' >> awk_CMD_TestFolder/awk_CMD_Command.txt
    echo "    echo 'Kr Korea :3324 5/11/96 :50354' > awk_CMD_TestFolder/awk_CMD_TestFile2.txt"
    echo "    echo 'Jp Japan :5246 15/9/66 :287650' >> awk_CMD_TestFolder/awk_CMD_TestFile2.txt"
    echo "    echo 'Us USA :7654 6/20/58 :60000' >> awk_CMD_TestFolder/awk_CMD_TestFile2.txt"
    echo "    echo 'Cn China :8683 9/40/48 :465000' >> awk_CMD_TestFolder/awk_CMD_TestFile2.txt"
    echo 'Kr    Korea   :3324    :5/11/96    :50354' > awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo 'Jp    Japan    :5246    :15/9/66    :287650' >> awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo 'Us    USA    :7654    :6/20/58    :60000' >> awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo 'Cn    China    :8683    :9/40/48    :465000' >> awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo
    echo " 예시1) awk '/Korea/' awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo " 부가설명) [ awk 'pattern' filename ] file에서 'pattern'이 일치하는 데이터를 출력한다."
    awk '/Korea/' awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " 예시2) awk '{print \$2}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo " 부가설명) [ awk '{action}' filename ] file에서 '{action}'과 일치하는 데이터(2번 항목에 해당하는 데이터)를 출력한다."
    echo "         {action}에 \$0을 지정하면 모든 레코드를 대상으로 한다. \$0을 생략해도 디폴트로 모든 레코드를 대상으로 한다."
    awk '{print $2}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo "모든 레코드를 대상 \$0 지정 -> awk '{print \$0}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    awk '{print $0}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo "모든 레코드를 대상 \$0 미지정 -> awk '{print}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    awk '{print}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " 예시3) awk '/Japan/{print \$3, \$4}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo " 부가설명) [ awk 'pattern {action}' filename ] file에서 'pattern'이 일치하는 데이터중 3번째 4번째 항목 데이터를 출력한다."
    awk '/Japan/{print $3, $4}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " 예시4) awk '{print NR, \$4}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo " 부가설명) NR 변수는 각 레코드의 행번호를 출력해준다."
    awk '{print NR, $4}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " 예시5) awk '{print NF, \$0}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo " 부가설명) NF 변수는 공백 또는 탭으로 구분된 분리된 필드의 수(컬럼수)를 출력해준다."
    awk '{print NF, $0}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " 예시6) cat awk_CMD_TestFolder/awk_CMD_TestFile1.txt | awk '\$3 > 7000'"
    echo " 부가설명) 명령 뒤에 |(파이프)와 함께 조건을 검색해 볼수 있다."
    cat awk_CMD_TestFolder/awk_CMD_TestFile1.txt | awk '$3 > 7000'
    echo
    echo " 옵션 -f : awk 명령이 입력되어 있는 파일을 사용하여 다른파일을 처리할 경우 사용"
    echo " 예시7) awk -f awk_CMD_TestFolder/awk_CMD_Command.txt awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    awk -f awk_CMD_TestFolder/awk_CMD_Command.txt awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " 옵션 -F : 필드 구분자는 기본적으로 공백과 탭이 사용되나 -F옵션은 임의의 필드구분자를 지정할 수 있다."
    echo " 예시8) awk -F: '/Kr/{print \$1, \$2}' awk_CMD_TestFolder/awk_CMD_TestFile2.txt"
    echo " 부가설명) -F뒤에 필드구분자로 사용할 [ : ] 를 지정하여 필드를 구분한다."
    awk -F: '/Kr/{print $1, $2}' awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo " 예시9) awk -F'[:\t]' '/Kr/{print \$1, \$2, \$3, \$12}' awk_CMD_TestFolder/awk_CMD_TestFile2.txt"
    echo " 부가설명) -F뒤에 []를 사용하여 필드구분자를 여러개 지정할 수도 있다."
    awk -F'[:\t]' '/Kr/{print $1, $2, $3, $12}' awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo
    echo " 예시10) awk '\$3 > 7000' awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo " 부가설명) 'pattern'에서는 비교연산자(<,<=,==,!=,>=,>,~,!~), 조건표현식(조건펴현식1 ? 표현식2 : 표현식3), 산술연산자(+,-,*,/,%,^), 논리연산자(&&, ||, !)등을 사용할 수 있다."
    echo " 부가설명) 비교연산자(~ : 정규식표현과 매칭,!~ : 정규식표현과 비매칭), 산술연산자(^ : 멱수)"
    awk '$3 > 7000' awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " 예시11) awk 'BEGIN{FS=\":\"; OFS=\"\\t\"; ORS=\"\\n\\n\"}{print \$1, \$2, \$3}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo " 부가설명) BEGIN{}은 awk명령어 바로 뒤에서 선언하며 FS:필드구분자, OFS:출력필드구분자, ORS:출력레코드분리자"
    awk 'BEGIN{FS=":"; OFS="\t"; ORS="\n\n"}{print $1, $2, $3}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " 예시12) awk 'END{print \"Test Number \" NR}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    echo " 부가설명) END{}은 awk명령을 모두 출력한뒤 맨 마지막에 출력된다."
    awk 'END{print "Test Number " NR}' awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo "## 데이터 컨트롤(awk) 종료 ##"
    echo 
}

DataControlAwk