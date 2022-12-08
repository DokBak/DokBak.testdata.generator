#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 내용 출력 처리
#-------------------------
function FileContentPrint(){
    echo 
    echo "## 파일 내용 출력 처리 시작 ##"
    echo " 명령어  : cat"
    echo " 사용방법 : cat [파일명]"
    echo " 기본설명 : 명령어 뒤 [파일명]에 해당하는 파일을 순차적으로 읽고 출력한다. 파일이 존재 하지 않는 경우에는 더미파일을 생성한다."
    echo
    echo " 사전실행) echo 명령어 실행에 필요한 작성 방법"
    echo "    echo '' > test1.txt"
    echo "" > test1.txt
    echo "    echo 'testfile1' >> test1.txt"
    echo "testfile1" >> test1.txt
    echo "    echo '' >> test1.txt"
    echo "" >> test1.txt
    echo "    echo '' >> test1.txt"
    echo "" >> test1.txt
    echo "    echo 'testfile2' >> test1.txt"
    echo "testfile2" >> test1.txt
    echo "    echo 'testfile3' >> test1.txt"
    echo "testfile3" >> test1.txt
    echo "    echo '' >> test1.txt"
    echo "" >> test1.txt
    echo "    echo 'testfile4\t' >> test1.txt"
    echo "testfile4\t" >> test1.txt
    echo 
    echo " 예시1) cat test1.txt"
    cat test1.txt
    echo
    echo " 옵션 -b : 공백이 아닌 라인의 앞에 줄 번호를 붙여서 출력한다."
    echo " 예시1) cat -b test1.txt"
    cat -b test1.txt
    echo
    echo " 옵션 -e : 모든 라인의 끝에 $마크를 출력한다."
    echo " 예시2) cat -e test1.txt"
    cat -e test1.txt
    echo
    echo " 옵션 -n : 모든 라인의 앞에 줄 번호를 붙여서 출력한다."
    echo " 예시3) cat -n test1.txt"
    cat -n test1.txt
    echo
    echo " 옵션 -s : 연속된 공백 줄을 압축하여 한 줄로 출력한다."
    echo " 예시4) cat -s test1.txt"
    cat -s test1.txt
    echo
    echo " 옵션 -t : 탭 문자열(\t)을 「^I」 문자열로 치환하여 출력한다."
    echo " 예시4) cat -t test1.txt"
    cat -t test1.txt
    echo
    echo "## 파일 내용 출력 처리 종료 ##"
    echo 
}

FileContentPrint 