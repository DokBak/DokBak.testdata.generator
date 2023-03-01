#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 파일 속성 판별 연산자
#-------------------------
function ShellScriptIFFileProperties(){
    echo 
    echo "## 쉘 스크립트 파일 속성 판별 연산자 시작 ##"
    echo " 기본설명 : 쉘 스크립트에서 파일 속성 판별 연산자 사용"
    echo
    echo " 사전실행) 파일 속성 판별 연산자 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir -p ShellScriptFIleProperties"
    mkdir -p ShellScriptFIleProperties
    echo 'test apple' > ShellScriptFIleProperties/ShellScriptFIleProperties.txt
    echo 'test apple' > ShellScriptFIleProperties/ShellScriptFIleProperties1.txt
    chmod 777 ShellScriptFIleProperties/ShellScriptFIleProperties.txt
    chmod 000 ShellScriptFIleProperties/ShellScriptFIleProperties1.txt
    ls -l ShellScriptFIleProperties/ShellScriptFIleProperties.txt
    ls -l ShellScriptFIleProperties/ShellScriptFIleProperties1.txt
    echo
    echo " 연산자 -e : 파일이 존재하면 참"
    echo " if [ -e ShellScriptFIleProperties/ShellScriptFIleProperties_not.txt  ]"
    if [ -e ShellScriptFIleProperties/ShellScriptFIleProperties_not.txt  ]
    then
        echo "  파일이 존재"
    fi
    echo " if [ -e ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]"
    if [ -e ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]
    then
        echo "  파일이 존재"
    fi
    echo 
    echo " 연산자 -f : 파일이 일반 파일이면 참"
    echo " if [ -f ShellScriptFIleProperties/ShellScriptFIleProperties_not.txt  ]"
    if [ -f ShellScriptFIleProperties/ShellScriptFIleProperties_not.txt  ]
    then
        echo "  파일이 일반 파일"
    fi
    echo " if [ -f ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]"
    if [ -f ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]
    then
        echo "  파일이 일반 파일"
    fi
    echo 
    echo " 연산자 -d : 파일이 디렉토리이면 참"
    echo " if [ -d ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]"
    if [ -d ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]
    then
        echo "  파일이 디렉토리"
    fi
    echo " if [ -d ShellScriptFIleProperties  ]"
    if [ -d ShellScriptFIleProperties  ]
    then
        echo "  파일이 디렉토리"
    fi
    echo 
    echo " 연산자 -r : 파일의 읽기 권한이 있으면 참"
    echo " if [ -r ShellScriptFIleProperties/ShellScriptFIleProperties1.txt  ]"
    if [ -r ShellScriptFIleProperties/ShellScriptFIleProperties1.txt  ]
    then
        echo "  파일의 읽기 권한이 있음"
    fi
    echo " if [ -r ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]"
    if [ -r ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]
    then
        echo "  파일의 읽기 권한이 있음"
    fi
    echo 
    echo " 연산자 -w : 파일의 쓰기 권한이 있으면 참"
    echo " if [ -w ShellScriptFIleProperties/ShellScriptFIleProperties1.txt  ]"
    if [ -w ShellScriptFIleProperties/ShellScriptFIleProperties1.txt  ]
    then
        echo "  파일의 쓰기 권한이 있음"
    fi
    echo " if [ -w ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]"
    if [ -w ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]
    then
        echo "  파일의 쓰기 권한이 있음"
    fi
    echo 
    echo " 연산자 -x : 파일의 실행 권한이 있으면 참"
    echo " if [ -x ShellScriptFIleProperties/ShellScriptFIleProperties1.txt  ]"
    if [ -x ShellScriptFIleProperties/ShellScriptFIleProperties1.txt  ]
    then
    echo "  파일의 실행 권한이 있음"
    fi
    echo " if [ -x ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]"
    if [ -x ShellScriptFIleProperties/ShellScriptFIleProperties.txt  ]
    then
        echo "  파일의 실행 권한이 있음"
    fi
    echo 
    echo "## 쉘 스크립트 파일 속성 판별 연산자 종료 ##"
    echo 
}

ShellScriptIFFileProperties