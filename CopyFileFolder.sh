#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 디렉토리 복사 처리
#-------------------------
function CopyFileFolder(){
    echo 
    echo "## 파일 디렉토리 복사 처리 시작 ##"
    echo " 명령어  : cp "
    echo " 사용방법 : cp [파일명] [디렉토리명]"
    echo " 기본설명 : 첫번째 파라미터 파일을 두번째 파라미터 디렉토리에 복사한다."
    echo
    echo " 사전실행) Cp 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir Cp_CMD_TestFolder1"
    echo "    mkdir Cp_CMD_TestFolder2"
    echo "    mkdir Cp_CMD_TestFolder3"
    mkdir Cp_CMD_TestFolder1
    mkdir Cp_CMD_TestFolder2
    mkdir Cp_CMD_TestFolder3
    echo "    echo 'TestFile1' > Cp_CMD_TestFolder1/Cp_CMD_TestFile1.txt"
    echo "TestFile1" > Cp_CMD_TestFolder1/Cp_CMD_TestFile1.txt
    echo
    echo " 예시1) cp Cp_CMD_TestFolder1/Cp_CMD_TestFile1.txt Cp_CMD_TestFolder2"
    cp Cp_CMD_TestFolder1/Cp_CMD_TestFile1.txt Cp_CMD_TestFolder2
    echo
    echo " 예시2) cp Cp_CMD_TestFolder1/Cp_CMD_TestFile1.txt Cp_CMD_TestFolder2/Cp_CMD_TestFile2.txt"
    echo "부가 설명 : [디렉토리명] 자리에 파일명까지 지정할 경우 해당 파일명으로 이름이 바뀌어 복사된다."
    cp Cp_CMD_TestFolder1/Cp_CMD_TestFile1.txt Cp_CMD_TestFolder2/Cp_CMD_TestFile2.txt
    echo
    echo " 옵션 -i : 복사될 파일이 이름이 이미 존재할 경우, 덮어쓰기 여부를 확인한다.(옵션이 없다면 자동복사, 옵션을 사용해도 이미 존재하지 않는 경우는 그냥 복사)"
    echo " 예시3) cp -i Cp_CMD_TestFolder1/Cp_CMD_TestFile1.txt Cp_CMD_TestFolder2/Cp_CMD_TestFile2.txt"
    cp -i Cp_CMD_TestFolder1/Cp_CMD_TestFile1.txt Cp_CMD_TestFolder2/Cp_CMD_TestFile2.txt
    echo
    echo " 옵션 -r : 하위 디렉토리까지 생성한다."
    echo " 예시4) cp -r Cp_CMD_TestFolder2 Cp_CMD_TestFolder3"
    cp -r Cp_CMD_TestFolder2 Cp_CMD_TestFolder3
    echo
    echo " 옵션 -a : 원본 파일의 속성, 링크정보까지 복사한다."
    echo " 예시5) cp -a Cp_CMD_TestFolder2/Cp_CMD_TestFile1.txt Cp_CMD_TestFolder3"
    cp -a Cp_CMD_TestFolder2/Cp_CMD_TestFile1.txt Cp_CMD_TestFolder3
    echo
    echo " 옵션 -p : 원본 파일의 소유자 그룹, 권한 등의 정보까지 복사한다."
    echo " 예시6) cp -p Cp_CMD_TestFolder2/Cp_CMD_TestFile2.txt Cp_CMD_TestFolder3"
    cp -p Cp_CMD_TestFolder2/Cp_CMD_TestFile2.txt Cp_CMD_TestFolder3
    echo
    echo " 옵션 -v :복사의 진행상태를 표시한다."
    echo " 예시7) cp -rv Cp_CMD_TestFolder3 Cp_CMD_TestFolder4"
    cp -rv Cp_CMD_TestFolder3 Cp_CMD_TestFolder4
    echo
    echo "## 파일 디렉토리 복사 처리 종료 ##"
    echo 
}

CopyFileFolder