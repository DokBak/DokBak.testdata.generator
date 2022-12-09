#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일의 갱신 일자 수정 처리
#-------------------------
function UpdateFileModificationDate(){
    echo 
    echo "## 파일의 갱신 일자 수정 처리 시작 ##"
    echo " 명령어  : touch"
    echo " 사용방법 : touch [파일명]"
    echo " 기본설명 : 파일의 날짜 및 시간을 수정, 파일이 없는 경우 0 바이트 파일을 생성"
    echo " 예시1) touch Touch_CMD_TestFile1.txt Touch_CMD_TestFile2.txt"
    touch Touch_CMD_TestFile1.txt Touch_CMD_TestFile2.txt
    echo " 갱신일자 확인법 : ls -lt Touch_CMD_TestFile1.txt"
    ls -al Touch_CMD_TestFile1.txt Touch_CMD_TestFile2.txt
    echo
    echo " 옵션 -t : 지정된 날짜 및 시간[[CC]YY]MMDDhhmm[.SS]으로 수정한다."
    echo " 예시2) touch -t 202101031409 Touch_CMD_TestFile1.txt"
    touch -t 202101031409 Touch_CMD_TestFile1.txt
    ls -al Touch_CMD_TestFile1.txt  Touch_CMD_TestFile2.txt
    echo
    echo " 옵션 -r : 파라미터(앞)의 수정 날짜 정보를 파라미터(뒤)의 수정날짜 정보로 수정한다.."
    echo " 예시3) touch -r Touch_CMD_TestFile1.txt Touch_CMD_TestFile2.txt"
    touch -r Touch_CMD_TestFile1.txt Touch_CMD_TestFile2.txt
    ls -al Touch_CMD_TestFile1.txt Touch_CMD_TestFile2.txt
    echo
    echo " 옵션 -c : 수정 날짜 정보를 현재 시간으로 갱신"
    echo " 예시4) touch -c Touch_CMD_TestFile1.txt Touch_CMD_TestFile2.txt"
    touch -c Touch_CMD_TestFile1.txt
    ls -al Touch_CMD_TestFile1.txt Touch_CMD_TestFile2.txt
    echo
    echo " 옵션 -a : 파일의 엑세스 시간을 갱신(-m 과같이 사용하여야 수정된다.)"
    echo " 예시5) touch -am Touch_CMD_TestFile1.txt"
    touch -am Touch_CMD_TestFile1.txt
    ls -al Touch_CMD_TestFile1.txt Touch_CMD_TestFile2.txt
    echo
    echo " 옵션 -m : 파일의 수정 시간을 갱신(-a 과같이 사용하여야 수정된다.)"
    echo " 예시6) touch -am Touch_CMD_TestFile1.txt"
    touch -am Touch_CMD_TestFile1.txt
    ls -al Touch_CMD_TestFile1.txt Touch_CMD_TestFile2.txt
    echo
    echo " 옵션 -h : 심볼릭 파일의 경우 링크가 가르키는 원본 파일의 시간을 수정한다."
    echo " 예시7 touch -h Touch_CMD_TestFile1.txt"
    touch -h Touch_CMD_TestFile1.txt
    ls -al Touch_CMD_TestFile1.txt Touch_CMD_TestFile2.txt
    echo
    echo "## 파일의 갱신 일자 수정 처리 시작 ##"
    echo 
}

UpdateFileModificationDate