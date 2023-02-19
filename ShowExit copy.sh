#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 디버그
#-------------------------
function ShellScriptDebug(){
    echo 
    echo "## 쉘 스크립트 디버그 시작 ##"
    echo
    echo " 기본설명 : 쉘 스크립트 디버그를 진행하기위한 옵션을 확인"
    echo
    echo " 디버그모드 테스트 명령)"
    echo "    mkdir -p debug_CMD_TestFolder/"
    mkdir -p debug_CMD_TestFolder/
    echo "    echo 'Kr Korea 3324 5/11/96 50354' > debug_CMD_TestFolder/debug_CMD_TestFile1.txt"
    echo "    echo 'Jp Japan 5246 15/9/66 287650' >> debug_CMD_TestFolder/debug_CMD_TestFile1.txt"
    echo "    echo 'Us USA 7654 6/20/58 60000' >> debug_CMD_TestFolder/debug_CMD_TestFile1.txt"
    echo "    echo 'Cn China 8683 9/40/48 465000' >> debug_CMD_TestFolder/debug_CMD_TestFile1.txt"
    echo 'Kr Korea 3324 5/11/96 50354' > debug_CMD_TestFolder/debug_CMD_TestFile1.txt
    echo 'Jp Japan 5246 15/9/66 287650' >> debug_CMD_TestFolder/debug_CMD_TestFile1.txt
    echo 'Us USA 7654 6/20/58 60000' >> debug_CMD_TestFolder/debug_CMD_TestFile1.txt
    echo 'Cn China 8683 9/40/48 465000' >> debug_CMD_TestFolder/debug_CMD_TestFile1.txt
    echo "    echo '{print \"Country : \" \$1, \$2 }' > debug_CMD_TestFolder/debug_CMD_Command.txt"
    echo "    echo '{print \$1, \$2, \$3, \$4, \$5 }' >> debug_CMD_TestFolder/debug_CMD_Command.txt"
    echo '{print "Country : " $1, $2 }' > debug_CMD_TestFolder/debug_CMD_Command.txt
    echo '{print $1, $2, $3, $4, $5 }' >> debug_CMD_TestFolder/debug_CMD_Command.txt
    echo "    echo 'Kr Korea :3324 5/11/96 :50354' > debug_CMD_TestFolder/debug_CMD_TestFile2.txt"
    echo "    echo 'Jp Japan :5246 15/9/66 :287650' >> debug_CMD_TestFolder/debug_CMD_TestFile2.txt"
    echo "    echo 'Us USA :7654 6/20/58 :60000' >> debug_CMD_TestFolder/debug_CMD_TestFile2.txt"
    echo "    echo 'Cn China :8683 9/40/48 :465000' >> debug_CMD_TestFolder/debug_CMD_TestFile2.txt"
    echo 'Kr    Korea   :3324    :5/11/96    :50354' > debug_CMD_TestFolder/debug_CMD_TestFile2.txt
    echo 'Jp    Japan    :5246    :15/9/66    :287650' >> debug_CMD_TestFolder/debug_CMD_TestFile2.txt
    echo 'Us    USA    :7654    :6/20/58    :60000' >> debug_CMD_TestFolder/debug_CMD_TestFile2.txt
    echo 'Cn    China    :8683    :9/40/48    :465000' >> debug_CMD_TestFolder/debug_CMD_TestFile2.txt
    echo
    debugValue=Test
    echo "$debugValue"
    echo 
    echo " 옵션 -x : 변수 치환 후 실행 이전에 스크립트의 각 라인을 출력한다. 처리 과정을 확인할 수 있다."
    echo " 예시1) sh -x ShellScriptDebug.sh"
    echo 
    echo " 옵션 -v : 실행 이전에 스크립트의 각 라인을 출력한다. 스크립트에 작성된 내용 그대로를 확인할 수 있다."
    echo " 예시2) sh -v ShellScriptDebug.sh"
    echo 
    echo "## 쉘 스크립트 디버그 종료 ##"
    echo 
}

ShellScriptDebug