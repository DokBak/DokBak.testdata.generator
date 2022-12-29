#!/bin/sh

#-------------------------
# 테스트 쉘 : 파일 내용 비교
#-------------------------
function CompareFileContents(){
    echo 
    echo "## 파일 내용 비교 시작 ##"
    echo " 명령어  : diff"
    echo " 사용방법 : diff [비교대상1(수정전)] [비교대상2(수정후)]"
    echo " 기본설명 : [비교대상1(수정전)]과 [비교대상2(수정후)]의 내용을 비교, 파일 내용이 동일하다면 출력되는 내용은 없다."
    echo
    echo " 사전실행) diff 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir -p diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/"
    mkdir -p diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/
    echo "    echo 'TestFile1' > diff_CMD_TestFolder/diff_CMD_TestFile1.txt"
    echo 'TestFile1' > diff_CMD_TestFolder/diff_CMD_TestFile1.txt
    echo "apple,banana,cream,dust,Test,txt,TestFile1,gui" >> diff_CMD_TestFolder/diff_CMD_TestFile1.txt
    echo "Test,bash,zsh,sh" >> diff_CMD_TestFolder/diff_CMD_TestFile1.txt
    echo "Test,java,Javascript,C,C#,C++,python,ruby" >> diff_CMD_TestFolder/diff_CMD_TestFile1.txt
    echo "    echo 'TestFile1' > diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt"
    echo 'TestFile1' > diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo "apple,banana,cream,dust,Test,txt,TestFile1,gui" >> diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo "Test,bash,zsh,sh" >> diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo "Test,java,Javascript,C,C#,C++,python,ruby" >> diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo "    echo 'TestFile1' > diff_CMD_TestFolder/diff_CMD_TestFile3.txt"
    echo 'TestFile1' > diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo "apple,banana,cream,dust,Test,txt,TestFile1,gui" >> diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo "Test,bash,zsh,sh" >> diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo "Test,java,Javascript,C,C#,C++,python,ruby" >> diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo "insert Data" >> diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo "    echo 'TestFile1' > diff_CMD_TestFolder/diff_CMD_TestFile4.txt"
    echo 'TestFile1' > diff_CMD_TestFolder/diff_CMD_TestFile4.txt
    echo "apple,banana,cream,dust,Test,txt,TestFile1,gui" >> diff_CMD_TestFolder/diff_CMD_TestFile4.txt
    echo "Test,bash,zsh,sh" >> diff_CMD_TestFolder/diff_CMD_TestFile4.txt
    echo "    echo 'TestFile5' > diff_CMD_TestFolder/diff_CMD_TestFile5.txt"
    echo 'TestFile5' > diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo "apple,banana,cream,dust,Test,txt,TestFile1,gui" >> diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo "Test,bash,zsh,sh" >> diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo "Test,java,Javascript,C,C#,C++,python,ruby" >> diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo "    echo 'TestFile6' > diff_CMD_TestFolder/diff_CMD_TestFile6.txt"
    echo 'TestFile1    ' > diff_CMD_TestFolder/diff_CMD_TestFile6.txt
    echo "apple,banana,cream,dust,   Test,txt,TestFile1,gui     " >> diff_CMD_TestFolder/diff_CMD_TestFile6.txt
    echo "Test,  bash,zsh,sh      " >> diff_CMD_TestFolder/diff_CMD_TestFile6.txt
    echo "  Test,java,Javascript,C,C#,   C++,python,ruby     " >> diff_CMD_TestFolder/diff_CMD_TestFile6.txt
    echo "    echo 'TestFile7' > diff_CMD_TestFolder/diff_CMD_TestFile7.txt"
    echo 'TestFile1    ' > diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo "apple,banana,cream,dust,  Test,txt,TestFile1,gui     " >> diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo "Test,     bash,zsh,sh    " >> diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo "    Test,java,Javascript,C,C#,          C++,python,ruby     " >> diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo "    echo 'testfile1' > diff_CMD_TestFolder/diff_CMD_TestFile8.txt"
    echo 'testfile1' > diff_CMD_TestFolder/diff_CMD_TestFile8.txt
    echo "apple,banana,cream,dust,Test,txt,TestFile1,gui" >> diff_CMD_TestFolder/diff_CMD_TestFile8.txt
    echo "Test,bash,zsh,sh" >> diff_CMD_TestFolder/diff_CMD_TestFile8.txt
    echo "Test,java,Javascript,C,C#,C++,python,ruby" >> diff_CMD_TestFolder/diff_CMD_TestFile8.txt
    echo
    echo " 예시1) diff diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt"
    echo " 부가설명) 비교 파일간의 차이가 없는 경우에는 아무런 결과가 출력되지 않는다."
    diff diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo
    echo " 예시2) diff diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile3.txt"
    echo " 부가설명) [비교대상1]을 기준으로 [비교대상2]와 비교하였을때 추가된 내용이 있다면 > 이후 추가된 내용이 출력된다."
    diff diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo 
    echo " 예시3) diff diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile4.txt"
    echo " 부가설명) [비교대상1]을 기준으로 [비교대상2]와 비교하였을때 삭제된 내용이 있다면 < 이후 삭제된 내용이 출력된다."
    diff diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile4.txt
    echo
    echo " 예시4) diff diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile5.txt"
    echo " 부가설명) [비교대상1]을 기준으로 [비교대상2]와 비교하였을때 수정된 내용이 존재할 경우, ---을 기준으로 위쪽은 [비교대상1] 아래쪽은 [비교대상2]이 출력된다."
    echo "         [비교대상1]에서 사라진 내용이 나오기때문에 < 이후 삭제된 내용이 ---위에 출력되고 [비교대상2]에서는 추가(변경)된 내용이 나오기 때문에 > 이후 추가된 내용이 --- 아래에 출력된다.  "
    diff diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo 
    echo " 옵션 -q : 두 파일의 내용이 다를 경우, 다른 내용을 출력하는 것이 아닌 파일이 다르다고 출력해준다."
    echo " 예시5) diff -q diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile5.txt"
    diff -q diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo
    echo " 옵션 -b : 연속된 스페이스는 하나로 인식하여 파일들을 비교한다."
    echo " 예시6) diff -b diff_CMD_TestFolder/diff_CMD_TestFile6.txt diff_CMD_TestFolder/diff_CMD_TestFile7.txt"
    diff -b diff_CMD_TestFolder/diff_CMD_TestFile6.txt diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo
    echo " 옵션 -i : 연속된 스페이스는 하나로 인식하여 파일들을 비교한다."
    echo " 예시7) diff -i diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile8.txt"
    diff -i diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile8.txt
    echo
    echo " 옵션 -s : 두 파일의 내용이 같을 경우, 옵션이 없다면 아무런 내용이 출력되지 않으나, 옵션 -s을 사용시 파일이 일치한다고 출력해준다."
    echo " 예시8) diff -s diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt"
    diff -s diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo
    echo " 옵션 -u : 삭제된 내용, 추가된 내용, 동일한 내용등 파일비교 내용을 종합적으로 출력해준다."
    echo " 예시9) diff -u diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile5.txt"
    diff -u diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo
    echo " 옵션 -w : 스페이스와 탭을 무시하여 비교한다."
    echo " 예시10) diff -w diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile7.txt"
    diff -w diff_CMD_TestFolder/diff_CMD_TestFile1.txt diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo
    echo "## 파일 내용 비교 종료 ##"
    echo 
}

CompareFileContents 