#!/bin/sh

#-------------------------
# 테스트 쉘 : 특정 문자열 검색 처리
#-------------------------
function StringSearch(){
    echo 
    echo "## 특정 문자열 검색 처리 시작 ##"
    echo " 명령어  : grep"
    echo " 사용방법 : grep [검색어] [검색대상]"
    echo " 기본설명 : 파일에 작성된 내용중 원하는 검색어가 존재하는지를 확인할 때 사용한다."
    echo
    echo " 확장명령어 : egrep "
    echo " 추가설명 : grep의 확장(Extended grep) 명령어, 정규식표현 메타문자를 사용가능하다."
    echo " 추가된 메타문자 1) ^ : 라인의 시작. ex) '^linux' 설명) linux로 시작하는 모든 라인 검색 "
    echo " 추가된 메타문자 2) $ : 라인의 끝. ex) 'linux$' 설명) linux로 끝나는 모든 라인 검색 "
    echo " 추가된 메타문자 3) . : 하나의 문자 매칭. ex) 'l...x' 설명) l이후에 3개의 문자가 있고 x가 있는 라인을 검색 "
    echo " 추가된 메타문자 4) * : 문자가 없거나 그 이상의 문자들이 매칭. ex) '*linux' 설명) linux문자 앞에 아무것도 없거나 공백이 존재하는 라인 검색 "
    echo " 추가된 메타문자 5) [ ] : []안의 문자 중 하나라도 매칭되는 문자. ex) '[Li]inux' 설명) Linux 또는 linux를 포함하는 모든 라인 검색 "
    echo " 추가된 메타문자 6) [^ ] : []안의 문자 중 하나라도 매칭되지 않는 문자. ex) '[^A-KM-Z]inux' 설명) inux앞에 A부터 K까지의 문자와 M부터 Z까지의 문자가 아닌 모든 라인 검색 "
    echo " 추가된 메타문자 7) + : + 앞의 문자 중 하나 이상이 매칭되는 문자. ex) '[a-z] + linux' 설명) inux앞에 하나 이상의 소문자를 포함하고 있는 라인 검색(linux, mylinux, centoslinux 등)"
    echo " 추가된 메타문자 8) ? : ? 바로 앞의 문자가 있거나 없는 문자. ex) 'lo?ve' 설명) love 또는 lve인 라인 검색"
    echo " 추가된 메타문자 9) a|b : |의 좌측 또는 우측 문자 ex) 'love|hate' 설명) love 또는 hate를 포함하는 라인 검색"
    echo " 추가된 메타문자 10) () : ()안의 문자는 하나의 묶음으로 하는 문자. ex) 'love(able|ly)' 설명) loveable 또는 lovely를 포함하는 라인 검색"
    echo
    echo " 확장명령어 : fgrep "
    echo " 추가설명 : grep의 확장(fixed grep) 명령어, 정규식표현 메타문자를 사용불가하다. 특수문자 및 $문자를 사용할수 없다."
    echo
    echo " 사전실행) grep 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir -p grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/"
    mkdir -p grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/
    echo "    echo 'TestFile1' > grep_CMD_TestFolder/grep_CMD_TestFile1.txt"
    echo "    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> grep_CMD_TestFolder/grep_CMD_TestFile1.txt"
    echo "    echo 'Test,bash,zsh,sh' >> grep_CMD_TestFolder/grep_CMD_TestFile1.txt"
    echo "    echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> grep_CMD_TestFolder/grep_CMD_TestFile1.txt"
    echo "    echo 'TestFile2' > grep_CMD_TestFolder/grep_CMD_TestFile2.txt"
    echo "    echo 'iphone,ipad,imac,Test,ipod,ipodtouch' >> grep_CMD_TestFolder/grep_CMD_TestFile2.txt"
    echo "    echo 'galaxyS7,Note7,ZFilp,S7,Test' >> grep_CMD_TestFolder/grep_CMD_TestFile2.txt"
    echo "    echo 'TestFile3' > grep_CMD_TestFolder/grep_CMD_TestFile3.t"
    echo "    echo 'Korea,Test,Japan,China' >> grep_CMD_TestFolder/grep_CMD_TestFile3.t"
    echo "    echo 'Seoul,Tokyo,hongkong' >> grep_CMD_TestFolder/grep_CMD_TestFile3.t"
    echo "    echo 'TestFile4' > grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFile4.log"
    echo "    echo 'ps1,ps2,ps3,ps4' >> grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFile4.log"
    echo "    echo 'psa,psa,psa,psa' > grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile5.log"
    echo "    echo 'Nintendo,NDSL,DSL,wii' >> grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile5.log"    
    echo 'TestFile1' > grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo "apple,banana,cream,dust,Test,txt,TestFile1,gui" >> grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo "Test,bash,zsh,sh" >> grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo "Test,java,Javascript,C,C#,C++,python,ruby" >> grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo 'TestFile2' > grep_CMD_TestFolder/grep_CMD_TestFile2.txt
    echo "iphone,ipad,imac,Test,ipod,ipodtouch" >> grep_CMD_TestFolder/grep_CMD_TestFile2.txt
    echo "galaxyS7,Note7,ZFilp,S7,Test" >> grep_CMD_TestFolder/grep_CMD_TestFile2.txt
    echo 'TestFile3' > grep_CMD_TestFolder/grep_CMD_TestFile3.t
    echo "Korea,Test,Japan,China" >> grep_CMD_TestFolder/grep_CMD_TestFile3.t
    echo "Seoul,Tokyo,hongkong" >> grep_CMD_TestFolder/grep_CMD_TestFile3.t
    echo 'TestFile4' > grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFile4.log
    echo "ps1,ps2,ps3,ps4" >> grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFile4.log
    echo "psa,psa,psa,psa" > grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile5.log
    echo "Nintendo,NDSL,DSL,wii" >> grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile5.log
    echo
    echo " 예시1) grep 'Test' grep_CMD_TestFolder/grep_CMD_TestFile1.txt"
    echo " 부가설명) grep_CMD_TestFolder/grep_CMD_TestFile1.txt파일에 'Test' 내용이 포함되어있는 라인의 데이터를 출력한다."
    grep 'Test' grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo
    echo " 예시2) grep 'Test' grep_CMD_TestFolder/*"
    echo " 부가설명) 지정된 폴더에 있는 모든 파일에서 'Test' 내용이 포함되어있는 라인의 데이터를 출력한다.(지정폴더내의 폴더 안의 파일까지는 확인할 수 없다.)"
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
    echo " 옵션 -v 사용함"
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
    echo " 옵션 -l : 패턴에 의해 매칭된 라인이 하나라도 있는 파일의 이름을 출력한다."
    echo " 예시8) grep 'Test' grep_CMD_TestFolder/*"
    echo "       grep -l 'Test' grep_CMD_TestFolder/*"
    echo " 옵션 사용하지 않음"
    grep 'Test' grep_CMD_TestFolder/*
    echo " 옵션 -l 사용함"
    grep -l 'Test' grep_CMD_TestFolder/*
    echo
    echo " 옵션 -s : 에러가 있더라도 출력하지 않는다. 디렉토리를 지정하였을때 나오는 [Is a directory] 등의 메시지가 생략된다."
    echo " 예시9) grep 'ipod' grep_CMD_TestFolder/*"
    echo "       grep -s 'ipod' grep_CMD_TestFolder/*"
    echo " 옵션 사용하지 않음"
    grep 'ipod' grep_CMD_TestFolder/*
    echo " 옵션 -s 사용함"
    grep -s 'ipod' grep_CMD_TestFolder/*
    echo
    echo "## 특정 문자열 검색 처리 종료 ##"
    echo 
}

StringSearch