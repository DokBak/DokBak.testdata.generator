#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 정규식표현
#-------------------------
function ShellScriptRegularExpression(){
    echo 
    echo "## 쉘 스크립트 정규식표현 시작 ##"
    echo
    echo " 기본설명 : 검색에서 사용할 매칭되는 같은 문자들의 패턴을 정규식표현이라고 한다. 정규표현식의 메타문자를 사용하기 위해 egrep을 사용한다."
    echo
    echo " 사전실행) 리다이렉션 실행에 필요한 샘플 폴더 작성"
    echo "    mkdir -p RegularExpression_CMD_TestFolder/"
    mkdir -p RegularExpression_CMD_TestFolder/
    echo "   date > RegularExpression_CMD_TestFolder/ReadFile.txt"
    date > RegularExpression_CMD_TestFolder/ReadFile.txt
    echo "   pwd >> RegularExpression_CMD_TestFolder/ReadFile.txt"
    pwd >> RegularExpression_CMD_TestFolder/ReadFile.txt
    echo "Testing_Date_999930212312-Print.log" >> RegularExpression_CMD_TestFolder/ReadFile.txt
    echo "Testing_Date_493124212312-Print.log" >> RegularExpression_CMD_TestFolder/ReadFile.txt
    echo "Testing_aDte_111930212312-Print.log" >> RegularExpression_CMD_TestFolder/ReadFile.txt
    echo "Testing_Date_997730212333-Print.log" >> RegularExpression_CMD_TestFolder/ReadFile.txt
    echo "Testing_Date_995944477744-Print.log" >> RegularExpression_CMD_TestFolder/ReadFile.txt
    echo "Date_Testing_333244777744-Print.log" >> RegularExpression_CMD_TestFolder/ReadFile.txt
    echo
    echo " 파일 내용 확인" 
    cat RegularExpression_CMD_TestFolder/ReadFile.txt
    echo
    echo " 표현1) [ . ] : newline을 제외한 오직 하나의 문자와 일치"
    echo " cat RegularExpression_CMD_TestFolder/ReadFile.txt  | egrep _...._"
    cat RegularExpression_CMD_TestFolder/ReadFile.txt  | egrep _...._
    echo
    echo " 표현2) [ ? ] : 자신 앞에 나오는 정규표현식이 0개이거나 1개인 것과 일치 "
    echo " cat RegularExpression_CMD_TestFolder/ReadFile.txt  | egrep _D?ate_"
    cat RegularExpression_CMD_TestFolder/ReadFile.txt  | egrep _D?ate_
    echo
    echo " 표현3) [ * ] : 문자열이나 정규표현식에서 0개 이상 반복되는 문자를 의미"
    echo " cat RegularExpression_CMD_TestFolder/ReadFile.txt  | egrep _*_"
    cat RegularExpression_CMD_TestFolder/ReadFile.txt  | egrep _*_
    echo
    echo " 표현4) [ {N} ] : 정확히 {N}번 일치한다."
    echo " cat RegularExpression_CMD_TestFolder/ReadFile.txt  | egrep 7{3}"
    cat RegularExpression_CMD_TestFolder/ReadFile.txt  | egrep 7{3}
    echo
    echo "## 쉘 스크립트 정규식표현 종료 ##"
    echo 
}

ShellScriptRegularExpression