#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 실행 
#-------------------------
function ShellScriptStart(){
    echo 
    echo "## 쉘 스크립트 실행 시작 ##"
    echo " 명령어  : sh"
    echo " 사용방법 : sh [쉘스크립트파일경로]"
    echo " 기본설명 : 쉘 스크립트를 실행시키기 위해 사용하는 명령어"
    echo
    echo " 사전실행) sh 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir sh_CMD_TestFolder/"
    mkdir -p sh_CMD_TestFolder
    echo "    echo '#!/bin/sh' > sh_CMD_TestFolder/sh_CMD_TestFile1.sh"
    echo "    echo 'shell start' > sh_CMD_TestFolder/sh_CMD_TestFile1.sh"
    echo "#!/bin/sh" > sh_CMD_TestFolder/sh_CMD_TestFile1.sh
    echo 'echo "shell start"' >> sh_CMD_TestFolder/sh_CMD_TestFile1.sh
    echo
    echo " 예시1) sh sh_CMD_TestFolder/sh_CMD_TestFile1.sh"
    sh sh_CMD_TestFolder/sh_CMD_TestFile1.sh
    echo
    echo "## 쉘 스크립트 실행 종료 ##"
    echo 
}

ShellScriptStart