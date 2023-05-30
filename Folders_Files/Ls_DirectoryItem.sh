#!/bin/sh

#-------------------------
# 테스트 쉘 : 디렉토리내 아이템 출력
#-------------------------
function DirectoryItem(){
    echo 
    echo "## 디렉토리내 아이템 출력 시작 ##"
    echo " 명령어  : ls"
    echo " 사용방법 : ls"
    echo " 기본설명 : 디렉토리에 있는 파일 및 폴더 출력, 출력 순서 기본값은 알파벳순(파일, 폴더순)"
    echo 
    echo " 사전실행) ls 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir -p ls_CMD_TestFolder/ls_CMD_TestFolder2/"
    mkdir -p ls_CMD_TestFolder/ls_CMD_TestFolder2/
    echo "    mkdir -p ls_CMD_TestFolder/ls_CMD_TestFolder3/"
    mkdir -p ls_CMD_TestFolder/.ls_CMD_TestFolder3/
    echo "    echo 'TestFile1' > ls_CMD_TestFolder/ls_CMD_TestFile1.txt"
    echo 'TestFile1' > ls_CMD_TestFolder/ls_CMD_TestFile1.txt
    echo "    echo 'TestFile2' > ls_CMD_TestFolder/.ls_CMD_TestFile2.txt"
    echo 'TestFile2' > ls_CMD_TestFolder/.ls_CMD_TestFile2.txt
    echo "    echo 'TestFile1' > ls_CMD_TestFolder/ls_CMD_TestFile3.txt"
    echo 'TestFile3' > ls_CMD_TestFolder/ls_CMD_TestFile3.txt
    echo "    echo 'TestFile4' > ls_CMD_TestFolder/ls_CMD_TestFile4.txt"
    echo 'TestFile4' > ls_CMD_TestFolder/ls_CMD_TestFile4.txt
    echo "    echo 'TestFile5' > ls_CMD_TestFolder/ls_CMD_TestFile5.txt"
    echo 'TestFile5' > ls_CMD_TestFolder/ls_CMD_TestFile5.txt
    echo "    echo 'TestFile6' > ls_CMD_TestFolder/ls_CMD_TestFile6.txt"
    echo 'TestFile6' > ls_CMD_TestFolder/ls_CMD_TestFile6.txt
    echo "    echo 'TestFile7' > ls_CMD_TestFolder/ls_CMD_TestFile6.txt"
    echo 'TestFile7' > ls_CMD_TestFolder/ls_CMD_TestFile6.txt
    echo "    echo 'TestFile8' > ls_CMD_TestFolder/ls_CMD_TestFile6.txt"
    echo 'TestFile8' > ls_CMD_TestFolder/ls_CMD_TestFile6.txt
    echo "    echo 'TestFile9' > ls_CMD_TestFolder/ls_CMD_TestFile6.txt"
    echo 'TestFile9' > ls_CMD_TestFolder/ls_CMD_TestFile6.txt
    echo "    echo 'TestFile20' > ls_CMD_TestFolder/ls_CMD_TestFolder2/ls_CMD_TestFile20.txt"
    echo 'TestFile20' > ls_CMD_TestFolder/ls_CMD_TestFolder2/ls_CMD_TestFile20.txt
    echo "    echo 'TestFile30' > ls_CMD_TestFolder/ls_CMD_TestFolder3/ls_CMD_TestFile30.txt"
    echo 'TestFile30' > ls_CMD_TestFolder/ls_CMD_TestFolder3/ls_CMD_TestFile30.txt
    echo
    echo " 예시1) ls ls_CMD_TestFolder"
    echo " 부가설명) 옵션없이 실행한다면 실행한 디렉토리 내용만 출력한다."
    ls ls_CMD_TestFolder
    echo
    echo " 옵션 -a : (all) 숨겨진 파일이나 디렉토리 모두 출력, .과 ..도 출력한다."
    echo " 예시2) ls -a ls_CMD_TestFolder"
    ls -a ls_CMD_TestFolder
    echo
    echo " 옵션 -A : (all) 숨겨진 파일이나 디렉토리 모두 출력, .과 ..는 출력하지 않는다."
    echo " 예시2) ls -A ls_CMD_TestFolder"
    ls -A ls_CMD_TestFolder
    echo
    echo " 옵션 -l : 파일이나 디렉토리의 자세한 내용을 출력한다. 내용 : 권한, 파일수, 소유자, 그룹, 파일크기, 수정일자, 파일이름"
    echo " 예시2) ls -l ls_CMD_TestFolder"
    ls -l ls_CMD_TestFolder
    echo
    echo " 옵션 -r : 역순으로 출력한다. 기본값은 알파벳순(파일, 폴더순)"
    echo " 예시2) ls -r ls_CMD_TestFolder"
    ls -r ls_CMD_TestFolder
    echo
    echo " 옵션 -t : 가장 최근에 수정된 파일이 제일 먼저 출력된다."
    echo " 예시2) ls -t ls_CMD_TestFolder"
    ls -t ls_CMD_TestFolder
    echo
    echo " 옵션 -p : 폴더의 경우 폴더명뒤에 /가 붙어서 출력된다."
    echo " 예시2) ls -p ls_CMD_TestFolder"
    ls -p ls_CMD_TestFolder
    echo
    echo " 옵션 -R : 하위 디렉토리까지 모두 출력"
    echo " 예시2) ls -R ls_CMD_TestFolder"
    ls -R ls_CMD_TestFolder
    echo
    echo "## 디렉토리내 아이템 출력 종료 ##"
    echo 
}

DirectoryItem