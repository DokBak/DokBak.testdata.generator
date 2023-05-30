#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 그룹 변경
#-------------------------
function FileGroupEdit(){
    echo 
    echo "## 파일 그룹 변경 시작 ##"
    echo
    echo " 명령어  : chgrp"
    echo " 사용방법 : chgrp [옵션] [소유자명] [파일명]"
    echo " 기본설명 : 파일의 소유자명을 [소유자명]으로 변경"
    echo
    echo " 사전실행) chgrp 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir chgrp_CMD_TestFolder/"
    mkdir -p chgrp_CMD_TestFolder
    echo 'test apple' > chgrp_CMD_TestFolder/chgrp_CMD_TestFile1.txt
    ls -l chgrp_CMD_TestFolder/chgrp_CMD_TestFile1.txt
    echo
    echo " 예시1) sudo chgrp dokg chgrp_CMD_TestFolder/chgrp_CMD_TestFile1.txt"
    sudo chgrp dokg chgrp_CMD_TestFolder/chgrp_CMD_TestFile1.txt
    ls -l chgrp_CMD_TestFolder/chgrp_CMD_TestFile1.txt
    echo
    echo " 옵션 -R : 디렉토리를 지정할 경우 하위 내용까지 모두 동일한 권한을 부여한다."
    echo " 예시2) sudo chgrp -R staff chgrp_CMD_TestFolder"
    sudo chgrp -R staff chgrp_CMD_TestFolder
    ls -lR
    echo
    echo "## 파일 그룹 변경 종료 ##"
    echo 
}

FileGroupEdit