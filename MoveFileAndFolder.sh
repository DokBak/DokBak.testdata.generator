#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일(디렉토리) 이동 처리
#-------------------------
function MoveFileAndFolder(){
    echo 
    echo "## 파일(디렉토리) 이동 처리 시작 ##"
    echo " 명령어  : mv"
    echo " 사용방법 : mv [이동할 파일/디렉토리] [목적지 디렉토리]"
    echo " 기본설명 : 파일 "
    echo
    echo " 사전실행) mv 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFolder3/"
    mkdir -p mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFolder3/
    echo "    echo 'TestFile1' > mv_CMD_TestFolder/mv_CMD_TestFile1.txt"
    echo "TestFile1" > mv_CMD_TestFolder/mv_CMD_TestFile1.txt
    echo "    echo 'TestFile2' > mv_CMD_TestFolder/mv_CMD_TestFile2.txt"
    echo "TestFile2" > mv_CMD_TestFolder/mv_CMD_TestFile2.txt
    echo "    echo 'TestFile3' > mv_CMD_TestFolder/mv_CMD_TestFile3.txt"
    echo "TestFile3" > mv_CMD_TestFolder/mv_CMD_TestFile3.txt
    echo "    echo 'TestFile4' > mv_CMD_TestFolder/mv_CMD_TestFile4.txt"
    echo "TestFile4" > mv_CMD_TestFolder/mv_CMD_TestFile4.txt
    echo "    echo 'TestFile5' > mv_CMD_TestFolder/mv_CMD_TestFile5.txt"
    echo "TestFile5" > mv_CMD_TestFolder/mv_CMD_TestFile5.txt
    echo "    echo 'TestFile6' > mv_CMD_TestFolder/mv_CMD_TestFile6.txt"
    echo "TestFile6" > mv_CMD_TestFolder/mv_CMD_TestFile6.txt
    echo "    echo 'TestFile8' > mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile3.txt"
    echo "TestFile8" > mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile3.txt
    echo "    echo 'TestFile9' > mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile4.txt"
    echo "TestFile9" > mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile4.txt
    echo "    echo 'TestFile10' > mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile5.txt"
    echo "TestFile10" > mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile5.txt
    echo "    echo 'TestFile11' > mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile6.txt"
    echo "TestFile11" > mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile6.txt
    ls -lR
    echo
    echo " 예시1) mv mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile3.txt mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFolder3"
    mv mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile3.txt mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFolder3
    ls -lR
    echo
    echo " 예시2) mv mv_CMD_TestFolder/mv_CMD_TestFile1.txt mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile2.txt"
    echo " [목적지 디렉토리]에 파일명까지 지정할 경우 이름이 변경되어 이동한다."
    mv mv_CMD_TestFolder/mv_CMD_TestFile1.txt mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile2.txt
    echo
    echo " 옵션 -f : [목적지 디렉토리]에 파일이 존재하여 파일을 덮어쓸 상황에 확인을 하지 않고 덮어쓴다./ 디폴트 옵션으로 생각된다.."
    echo " 예시3) mv -f mv_CMD_TestFolder/mv_CMD_TestFile5.txt mv_CMD_TestFolder/mv_CMD_TestFolder2"
    mv -f mv_CMD_TestFolder/mv_CMD_TestFile5.txt mv_CMD_TestFolder/mv_CMD_TestFolder2
    echo
    echo " 옵션 -i : [목적지 디렉토리]에 동일한 파일명이 있을 경우 이동하여 덮어쓰기를 진행할 것인지 질문을 한다."
    echo " 예시4) mv -i mv_CMD_TestFolder/mv_CMD_TestFile2.txt mv_CMD_TestFolder/mv_CMD_TestFolder2"
    mv -i mv_CMD_TestFolder/mv_CMD_TestFile2.txt mv_CMD_TestFolder/mv_CMD_TestFolder2
    echo
    echo " 옵션 -n : [목적지 디렉토리]에 동일한 파일명이 있을 경우 이동하지 않아 덮어쓰기를 진행하지 않는다."
    echo " 예시5) mv -n mv_CMD_TestFolder/mv_CMD_TestFile4.txt mv_CMD_TestFolder/mv_CMD_TestFolder2"
    mv -n mv_CMD_TestFolder/mv_CMD_TestFile4.txt mv_CMD_TestFolder/mv_CMD_TestFolder2
    echo
    echo " 옵션 -v : mv 명령어 실행과정을 출력해준다."
    echo " 예시6) mv -v mv_CMD_TestFolder/mv_CMD_TestFile4.txt mv_CMD_TestFolder/mv_CMD_TestFolder2"
    mv -v mv_CMD_TestFolder/mv_CMD_TestFile4.txt mv_CMD_TestFolder/mv_CMD_TestFolder2
    echo
    echo "## 파일(디렉토리) 이동 처리 종료 ##"
    echo 
}


MoveFileAndFolder