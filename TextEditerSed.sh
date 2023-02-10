#!/bin/sh

#-------------------------
# 테스트 쉘 : 비대화형 모드의 텍스트 파일 에디터
#-------------------------
function TextEditerSed(){
    echo 
    echo "## 비대화형 모드의 텍스트 파일 에디터 시작 ##"
    echo " 명령어  : sed"
    echo " 사용방법 : sed [옵션] [연산자] [검색대상]"
    echo " 기본설명 : sed 스트림 에디터는 한 번에 하나의 입력 또는 파일으로부터 한 줄만 처리하고 출력한다. 처리할 라인을 sed임시 버퍼에 저장후 임시 버퍼에서 처리후 출력된다."
    echo
    echo " 사전실행) sed 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir -p sed_CMD_TestFolder/"
    mkdir -p sed_CMD_TestFolder/
    echo "    echo 'TestFile1' > sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'Test,bash,zsh,sh' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'TestFile2' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'iphone,ipad,imac,Test,ipod,ipodtouch' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'iphone,ipod,ipodtouch,Test,ipad,imac' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'galaxyS7,Note7,ZFilp,S7,Test' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'TestFile3' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'Korea,Test,Japan,China' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'Seoul,Tokyo,hongkong' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo '0102,12310,asdas' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'TestFile4' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'ps1,ps2,ps3,ps4' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'psa,psa,psa,psa' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo "    echo 'Nintendo,NDSL,DSL,wii' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt"    
    echo 'TestFile1' > sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'Test,bash,zsh,sh' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'TestFile2' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'iphone,ipad,imac,Test,ipod,ipodtouch' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'iphone,ipod,ipodtouch,Test,ipad,imac' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'galaxyS7,Note7,ZFilp,S7,Test' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'TestFile3' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'Korea,Test,Japan,China' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'Seoul,Tokyo,hongkong' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo '0102,12310,asdas' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'TestFile4' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'ps1,ps2,ps3,ps4' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'psa,psa,psa,psa' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo 'Nintendo,NDSL,DSL,wii' >> sed_CMD_TestFolder/sed_CMD_TestFile1.txt   
    echo
    cat sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    echo " ###sed 연산자 종류###"
    echo " [주소 범위]/p : print : [주어진 주소 범위]를 출력한다."
    echo " [주소 범위]/d : delete : [주어진 주소 범위]를 삭제한다." 
    echo " s/pattern1/pattern2/ : substitute : 한 라인에서 처음 나타나는 patttern1을 pattern2로 치환한다." 
    echo " [주소 범위]/s/pattern1/pattern2/ : substitute : 주소 범위에 대해서 한 라인에 처음 나타나는 pattern1을 pattern2로 치환한다." 
    echo " [주소 범위]/y/pattern1/pattern2/ : transform : 주소 범위에 대해서 pattern1에 나타나는 어떤 문자라도 pattern2에 나타나는 문자로 변경한다. (tr과 동일)" 
    echo " g : global : 모든 라인에서 입력과 일치하는 패턴에 대해 동작한다." 
    echo " ###sed 연산자 종류###"
    echo
    echo " 예시1) sed -n '2,6p' sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo " 옵션 -n : 옵션을 사용하면 패턴이 일치하는 라인만 출력한다. 이 옵션이 없다면 모든 입력이 출력된다. (-n을 사용시 /p도 같이 사용한다.)"
    echo " 부가설명) sed_CMD_TestFolder/sed_CMD_TestFile1.txt파일에서 2번째줄부터 6번째줄까지 출력(p)한다."
    sed -n '2,6p' sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    echo " 예시2) sed '2,6d' sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo " 부가설명) sed_CMD_TestFolder/sed_CMD_TestFile1.txt파일에서 2번째줄부터 6번째줄까지 삭제(d)한다."
    sed '2,6d' sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    echo " 예시3) sed -n 's/ip/sam/p' sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo " 부가설명) sed_CMD_TestFolder/sed_CMD_TestFile1.txt파일에서 각 라인에서 가장 빠르게 검색되는 'ip'를 'sam'으로 변경하여 출력한다,"
    sed -n 's/ip/sam/p' sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    echo " 예시4) sed 's/ip/sam/g' sed_CMD_TestFolder/sed_CMD_TestFile1.txt"
    echo " 부가설명) sed_CMD_TestFolder/sed_CMD_TestFile1.txt파일에서 각 라인에 존재하는 모든 'ip'를 'sam'으로 변경하여 출력한다,"
    sed 's/ip/sam/g' sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    echo "## 특정 비대화형 모드의 텍스트 파일 에디터 종료 ##"
    echo 
}

TextEditerSed