#!/bin/sh

#-------------------------
# 테스트 쉘 : 여래 개의 파일을 하나의 파일로 묶거나 푸는 처리
#-------------------------
function TapeARchiver(){
    echo 
    echo "## 여래 개의 파일을 하나의 파일로 묶거나 푸는 처리 시작 ##"
    echo " 명령어  : tar"
    echo " 사용방법 : tar [옵션] [파일명] [대상]"
    echo " 기본설명 : 데이터의 크기를 줄이기 위한 파일 압축 작업이 없이 파일을 하나로 묶는데 사용된다."
    echo
    echo " 사전실행) tar 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir Tar_CMD_TestFolder"
    mkdir -p Tar_CMD_TestFolder/Tar_CMD_TestFolder2
    echo "    echo 'TestFile1' > Tar_CMD_TestFolder/Tar_CMD_TestFile1.txt"
    echo "TestFile1" > Tar_CMD_TestFolder/Tar_CMD_TestFile1.txt
    echo "    echo 'TestFile2' > Tar_CMD_TestFolder/Tar_CMD_TestFile2.txt"
    echo "TestFile2" > Tar_CMD_TestFolder/Tar_CMD_TestFile2.txt
    echo "    echo 'TestFile3' > Tar_CMD_TestFolder/Tar_CMD_TestFile3.txt"
    echo "TestFile3" > Tar_CMD_TestFolder/Tar_CMD_TestFile3.txt
    echo "    cd Tar_CMD_TestFolder"
    cd Tar_CMD_TestFolder
    echo
    echo " 기능 -c : tar 아카이브 생성, 기존 아카이브 덮어 쓰기 -> create"
    echo " 기능 -v : 처리되는 파일을 자세히 나열"
    echo " 기능 -f : 대상 tar 아카이브 지정(기본 옵션)"
    echo " 현재 디렉토리의 모든 파일과 디렉토리를 TestTar1.tar로 묶기"
    echo " 예시1) tar cvf TestTar1.tar * "
    tar cvf TestTar1.tar *
    echo
    echo " 기능 -c : tar 아카이브 생성, 기존 아카이브 덮어 쓰기 -> create"
    echo " 기능 -v : 처리되는 파일을 자세히 나열"
    echo " 기능 -f : 대상 tar 아카이브 지정(기본 옵션)"
    echo " 지정한 파일을 TestTar2.tar로 묶기"
    echo " 예시2) tar cvf TestTar2.tar Tar_CMD_TestFile1.txt Tar_CMD_TestFile2.txt "
    tar cvf TestTar2.tar Tar_CMD_TestFile1.txt Tar_CMD_TestFile2.txt
    echo
    echo " 기능 -t : tar 아카이브에 포함된 내용 확인 -> list"
    echo " 기능 -v : 처리되는 파일을 자세히 나열"
    echo " 기능 -f : 대상 tar 아카이브 지정(기본 옵션)"
    echo " TestTar1.tar를 현재 디렉토리에 풀기"
    echo " 예시3) tar tvf TestTar1.tar"
    tar tvf TestTar1.tar
    echo "       tar tvf TestTar2.tar"
    tar tvf TestTar2.tar
    echo
    echo " 기능 -x : tar 아카이브 현재 디렉토리에 풀기 -> extract"
    echo " 기능 -v : 처리되는 파일을 자세히 나열"
    echo " 기능 -f : 대상 tar 아카이브 지정(기본 옵션)"
    echo " TestTar1.tar를 현재 디렉토리에 풀기"
    echo " 예시4) tar xvf TestTar1.tar"
    tar xvf TestTar1.tar
    echo
    echo " 기능 -x : tar 아카이브 현재 디렉토리에 풀기 -> extract"
    echo " 기능 -v : 처리되는 파일을 자세히 나열"
    echo " 기능 -f : 대상 tar 아카이브 지정(기본 옵션)"
    echo " 옵션 -C : -C 이후 작성된 디렉토리에서 작업이 수행"    
    echo " TestTar2.tar를 지정된 디렉토리에 풀기"
    echo " 예시5) tar xvf TestTar2.tar -C Tar_CMD_TestFolder2"
    tar xvf TestTar2.tar -C Tar_CMD_TestFolder2
    echo
    echo " 기능 -r : tar 아카이브에 파일 추가 -> append"
    echo " 기능 -v : 처리되는 파일을 자세히 나열"
    echo " 기능 -f : 대상 tar 아카이브 지정(기본 옵션)"
    echo " 지정한 파일을 TestTar3.tar에 추가하기"
    echo " 예시2) tar rvf TestTar3.tar Tar_CMD_TestFile3.txt"
    cp TestTar2.tar TestTar3.tar
    tar tvf TestTar3.tar
    tar rvf TestTar3.tar Tar_CMD_TestFile3.txt
    echo "       tar tvf TestTar3.tar"
    tar tvf TestTar3.tar 
    echo
    echo " 기능 -u : tar 아카이브에 파일 추가 (아카이브의 해당 항목보다 새로운 수정날짜가 있는 경우 업데이트) -> update"
    echo " 기능 -v : 처리되는 파일을 자세히 나열"
    echo " 기능 -f : 대상 tar 아카이브 지정(기본 옵션)"
    echo " 지정한 파일을 TestTar3.tar에 추가하기"
    echo " 예시2) tar uvf TestTar4.tar Tar_CMD_TestFile3.txt"
    cp TestTar2.tar TestTar4.tar
    tar tvf TestTar4.tar
    tar uvf TestTar4.tar Tar_CMD_TestFile3.txt
    echo "       tar tvf TestTar4.tar"
    tar tvf TestTar4.tar 
    echo
    echo "## 여래 개의 파일을 하나의 파일로 묶거나 푸는 처리 종료 ##"
    echo 
}

TapeARchiver 