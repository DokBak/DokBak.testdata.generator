#!/bin/sh

#-------------------------
# 테스트 쉘 : 디렉토리 삭제 처리
#-------------------------
function DeleteDirectory(){
    echo 
    echo "## 디렉토리 삭제 시작 ##"
    echo " 명령어  : rmdir"
    echo " 사용방법 : rmdir [삭제할 디렉토리명]"
    echo " 기본설명 : 명령어뒤 [삭제할 디렉토리명]에 해당하는 폴더를 삭제. 단, 내부에 파일이 존재한다면 삭제하지 않는다."
    echo " 예시1) rmdir testdir"
    rmdir testdir
    echo
    echo " 옵션 -p : 디렉토리 삭제시 상위 디렉토리까지 모두 삭제. 단, 내부에 파일이 존재하는 디렉토리는 삭제하지 않는다."
    echo " 예시2) rmdir -p testdir2/underTestdir"
    rmdir -p testdir2/underTestdir
    echo
    echo " 옵션 -v : 디렉토리 삭제시 메시지 출력. 단, 내부에 파일이 존재하는 디렉토리는 삭제하지 않는다."
    echo " 예시2) rmdir -p testdir4"
    rmdir -v testdir3
    rmdir -v testdir4
    echo
    echo "## 디렉토리 삭제 종료 ##"
    echo 
}

DeleteDirectory 