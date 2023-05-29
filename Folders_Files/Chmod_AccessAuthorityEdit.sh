#!/bin/sh

#-------------------------
# 테스트 쉘 : 접근 권한 변경
#-------------------------
function AccessAuthorityEdit(){
    echo 
    echo "## 접근 권한 변경 시작 ##"
    echo
    echo " 명령어  : chmod"
    echo " 사용방법 : chmod [옵션] [접근권한] [인자2]"
    echo " 기본설명 : 파일 또는 디렉토리[인자2]의 [접근권한]으로 변경한다."
    echo
    echo " 사전실행) chmod 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir chmod_CMD_TestFolder/"
    mkdir -p chmod_CMD_TestFolder
    echo 'test apple' > chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    ls -l chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    echo
    echo " 예시1) chmod u-w chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod u-w chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    ls -l chmod_CMD_TestFolder
    echo
    echo " 예시2) chmod g-w chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod g-w chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    ls -l chmod_CMD_TestFolder
    echo
    echo " 예시3) chmod o-w chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod o-w chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    ls -l chmod_CMD_TestFolder
    echo
    echo " 예시4) chmod a+w chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod a+w chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    ls -l chmod_CMD_TestFolder
    echo
    echo " 예시5) chmod a+x chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod a+x chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    ls -l chmod_CMD_TestFolder
    echo
    echo " 예시6) chmod 763 chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt "
    chmod 763 chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt
    ls -l chmod_CMD_TestFolder
    echo
    echo " 옵션 -R : 디렉토리를 지정할 경우 하위 내용까지 모두 동일한 권한을 부여한다."
    echo " 예시7) chmod -R 777 chmod_CMD_TestFolder"
    chmod -R 777 chmod_CMD_TestFolder
    ls -lR
    echo
    echo "## 접근 권한 변경 종료 ##"
    echo 
}

AccessAuthorityEdit