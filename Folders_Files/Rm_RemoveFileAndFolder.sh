#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일(폴더) 삭제 처리
#-------------------------
function RemoveFileAndFolder(){
    echo 
    echo "## 파일(폴더) 삭제 처리 시작 ##"
    echo " 명령어  : rm"
    echo " 사용방법 : rm [옵션] [디렉토리명 or 파일명]"
    echo " 기본설명 : 지정한 파일을 삭제 / 폴더만 삭제하는 경우는 rmdir을 사용하며, 폴더 및 파일을 모두 사용시에는 rm명령어를 애용한다."
    echo
    echo " 사전실행) rm 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/"
    mkdir -p Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/
    echo "    echo 'TestFile1' > Rm_CMD_TestFolder/Rm_CMD_TestFile1.txt"
    echo "TestFile1" > Rm_CMD_TestFolder/Rm_CMD_TestFile1.txt
    echo "    echo 'TestFile2' > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt"
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "    echo 'TestFile2' > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt"
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "    echo 'TestFile3' > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFile3.txt"
    echo "TestFile3" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFile3.txt
    echo "    echo 'TestFile4' > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile4.txt"
    echo "TestFile4" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile4.txt
    echo "    echo 'TestFile5' > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile5.txt"
    echo "TestFile5" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile5.txt
    ls -lR
    echo
    echo " 예시1) rm Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile4.txt"
    rm Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile4.txt
    ls -lR
    echo
    echo " 옵션 -i : 파일, 디렉토리를 삭제시 항목 별로 질문하는 옵션(-f보다 우선 순위가 높다 / 파일 및 폴더 하나 하나 질문한다.)"
    echo " 예시2) rm -i Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile5.txt"
    mkdir -p Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/
    echo "TestFile1" > Rm_CMD_TestFolder/Rm_CMD_TestFile1.txt
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "TestFile3" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFile3.txt
    echo "TestFile4" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile4.txt
    echo "TestFile5" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile5.txt
    ls -lR
    rm -i Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile5.txt
    ls -lR
    echo
    echo " 옵션 -r : 디렉토리 지정시 하위 경로까지 삭제하는 옵션"
    echo " 예시3) rm -r Rm_CMD_TestFolder/Rm_CMD_TestFolder2/"
    mkdir -p Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/
    echo "TestFile1" > Rm_CMD_TestFolder/Rm_CMD_TestFile1.txt
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "TestFile3" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFile3.txt
    echo "TestFile4" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile4.txt
    echo "TestFile5" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile5.txt
    ls -lR
    rm -r Rm_CMD_TestFolder/Rm_CMD_TestFolder2/
    ls -lR
    echo
    echo " 옵션 -f : 파일 디렉토리 삭제시 강제로 삭제하는 옵션 (단독으로 사용되지는 않는다.)"
    echo " 예시4) rm -rf Rm_CMD_TestFolder/Rm_CMD_TestFolder2/"
    mkdir -p Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/
    echo "TestFile1" > Rm_CMD_TestFolder/Rm_CMD_TestFile1.txt
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "TestFile3" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFile3.txt
    echo "TestFile4" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile4.txt
    echo "TestFile5" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile5.txt
    ls -lR
    rm -rf Rm_CMD_TestFolder/Rm_CMD_TestFolder2/
    ls -lR
    echo
    echo " 옵션 -I : 파일 3개 이상일 경우 한번만 묻는다."
    echo " 예시5) rm -rfI Rm_CMD_TestFolder/"
    mkdir -p Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/
    echo "TestFile1" > Rm_CMD_TestFolder/Rm_CMD_TestFile1.txt
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "TestFile3" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFile3.txt
    echo "TestFile4" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile4.txt
    echo "TestFile5" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile5.txt
    ls -lR
    rm -rfI Rm_CMD_TestFolder/
    ls -lR
    echo
    echo " 옵션 -v : 파일을 삭제될 파일, 폴더 순으로 출력되며 최종적으로 남는 파일도 표시해준다."
    echo " 예시5) rm -rfv Rm_CMD_TestFolder/"
    mkdir -p Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/
    echo "TestFile1" > Rm_CMD_TestFolder/Rm_CMD_TestFile1.txt
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "TestFile2" > Rm_CMD_TestFolder/Rm_CMD_TestFile2.txt
    echo "TestFile3" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFile3.txt
    echo "TestFile4" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile4.txt
    echo "TestFile5" > Rm_CMD_TestFolder/Rm_CMD_TestFolder2/Rm_CMD_TestFolder3/Rm_CMD_TestFile5.txt
    ls -lR
    rm -rfv Rm_CMD_TestFolder/
    ls -lR
    echo
    echo "## 파일(폴더) 삭제 처리 종료 ##"
    echo 
}

RemoveFileAndFolder