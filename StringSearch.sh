#!/bin/sh

#-------------------------
# 테스트 쉘 : 특정 문자열 검색 처리
#-------------------------
function StringSearch(){
    echo 
    echo "## 특정 문자열 검색 처리 시작 ##"
    echo " 명령어  : grep"
    echo " 사용방법 : grep [검색어] [검색대상]"
    echo " 기본설명 : "
    echo
    echo " 사전실행) grep 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/"
    mkdir grep_CMD_TestFolder
    echo "    echo 'TestFile1' > grep_CMD_TestFolder/grep_CMD_TestFile1.txt"
    echo 'TestFile1' > grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo "apple,banana,cream,dust,Test,txt,TestFile1,gui" >> grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo "Test,bash,zsh,sh" >> grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo "Test,java,Javascript,C,C#,C++,python,ruby" >> grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo "    echo 'TestFile2' > grep_CMD_TestFolder/grep_CMD_TestFile2.txt"
    echo 'TestFile2' > grep_CMD_TestFolder/grep_CMD_TestFile2.txt
    echo "iphone,ipad,imac,Test,ipod,ipodtouch" >> grep_CMD_TestFolder/grep_CMD_TestFile2.txt
    echo "" >> grep_CMD_TestFolder/grep_CMD_TestFile2.txt
    echo "galaxyS7,Note7,ZFilp,S7,Test" >> grep_CMD_TestFolder/grep_CMD_TestFile2.txt
    echo "    echo 'TestFile3' > grep_CMD_TestFolder/grep_CMD_TestFile3.t"
    echo 'TestFile3' > grep_CMD_TestFolder/grep_CMD_TestFile3.t
    echo "Korea,Test,Japan,China" >> grep_CMD_TestFolder/grep_CMD_TestFile3.t
    echo "Seoul,Tokyo,hongkong" >> grep_CMD_TestFolder/grep_CMD_TestFile3.t
    echo "    echo 'TestFile3' > grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile4.log"
    echo 'TestFile4' > grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile4.log
    echo "ps1,ps2,ps3,ps4" >> grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile4.log
    echo "psa,psa,psa,psa" >> grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile4.log
    echo "Nintendo,NDSL,DSL,wii" >> grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile4.log
    echo
    echo " 예시1) grep 'Test' grep_CMD_TestFolder/grep_CMD_TestFile1.txt"
    echo " 부가설명) grep_CMD_TestFolder/grep_CMD_TestFile1.txt파일에 'Test' 내용이 포함되어있는 라인의 데이터를 출력한다."
    grep 'Test' grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo
    echo " 예시2) grep 'Test' grep_CMD_TestFolder/*"
    echo " 부가설명) 지정된 폴더에 있는 모든 파일에서 'Test' 내용이 포함되어있는 라인의 데이터를 출력한다."
    grep 'Test' grep_CMD_TestFolder/*
    echo
    echo " 예시3) grep 'Test' grep_CMD_TestFolder/*.t"
    echo " 부가설명) 지정된 폴더에 있는 확장자가 .t인 파일에서 'Test' 내용이 포함되어있는 라인의 데이터를 출력한다."
    grep 'Test' grep_CMD_TestFolder/*.t
    echo
    echo " 옵션 -i : 대소문자를 구분짓지 않고 검색하는 옵션"
    echo " 예시4) grep 'test' grep_CMD_TestFolder/*"
    echo "       grep -i 'test' grep_CMD_TestFolder/*"
    echo " 옵션 사용하지 않음"
    grep 'test' grep_CMD_TestFolder/*
    echo " 옵션 -i 사용함"
    grep -i 'test' grep_CMD_TestFolder/*
    echo
    echo " 옵션 -v : [검색어]가 포함되어 있지 않은 라인을 출력하는 옵션(디폴트 grep 와 반대 결과를 출력)"
    echo " 예시5) grep 'iphone' grep_CMD_TestFolder/*"
    echo "       grep -v 'iphone' grep_CMD_TestFolder/*"
    echo " 옵션 사용하지 않음"
    grep 'iphone' grep_CMD_TestFolder/*
    echo " 옵션 -i 사용함"
    grep -v 'iphone' grep_CMD_TestFolder/*
    echo
    echo " 옵션 -w : [검색어]를 단어 단위로 구분하여 검색한다. 예를 들어 '홍길동'을 찾고 싶은데 성씨를 알지 못하여 '길동'으로만 검색하여 검색결과에서 '홍길동'을 묵시적으로 찾지만 -w 옵션을 사용하면 '길동'으로 검색시 결과값이 나오지 않는다."
    echo " 예시6) grep 'phone' grep_CMD_TestFolder/*"
    echo "       grep -w 'phone' grep_CMD_TestFolder/*"
    echo " 옵션 사용하지 않음"
    grep 'phone' grep_CMD_TestFolder/*
    echo " 옵션 -w 사용함"
    grep -w 'phone' grep_CMD_TestFolder/*
    echo
    echo " 옵션 -n : [검색어]가 포함된 라인번호를 선두에 표시한다."
    echo " 예시7) grep 'Note7' grep_CMD_TestFolder/*"
    echo "       grep -n 'Note7' grep_CMD_TestFolder/*"
    echo " 옵션 사용하지 않음"
    grep 'Note7' grep_CMD_TestFolder/*
    echo " 옵션 -n 사용함"
    grep -n 'Note7' grep_CMD_TestFolder/*
    echo
    echo "## 특정 문자열 검색 처리 종료 ##"
    echo 
}

StringSearch