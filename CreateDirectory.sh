#!/bin/sh

#-------------------------
# 테스트 쉘 : 디렉토리 생성 처리
#-------------------------
function CreateDirectory(){
    echo 
    echo "## 디렉토리 생성 시작 ##"
    echo " 명령어  : mkdir"
    echo " 사용방법 : mkdir [생성할 디렉토리명]"
    echo " 기본설명 : 현재 작업중인 디렉토리에 [생성할 디렉토리명]에 해당하는 새 폴더를 생성"
    echo " 예시1) mkdir testdir"
    mkdir testdir
    echo
    echo " 옵션 -p : 상위 디렉토리가 없는 경우, 상위 디렉토리까지 전부 생성"
    echo " 예시2) mkdir -p testdir2/underTestdir"
    mkdir -p testdir2/underTestdir
    echo
    echo " 옵션 -m : 디렉토리의 권한을 설정하는 옵션"
    echo " 예시3) mkdir -m 700 testdir3"
    mkdir -m 700 testdir3
    echo
    echo " 옵션 -v : 디렉토리 생성시 메시지 출력 (p옵션과 조합하면 상위 디렉토리부터 생성한 메시지를 출력한다.)"
    echo " 예시4) mkdir -v testdir4"
    mkdir -v testdir4
    echo
    echo "## 디렉토리 생성 종료 ##"
    echo 
}

CreateDirectory