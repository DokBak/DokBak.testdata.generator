#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Diff]_[CompareFileContents]
#------------------------------------------------------------
function diff_CompareFileContents(){
    echo
    echo "## diff Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : diff"
    echo " HowToUse : diff [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : tarFile_Path1 "
    echo "            [Argument2] : tarFile_Path2 "
    echo "            [Option : -q] : If exists in the difference -> print File differ ( <> Option -s ) "
    echo "            [Option : -b] : Continuous spaces are recognized as one and files are compared "
    echo "            [Option : -i] : Case-sensitive Comparison "
    echo "            [Option : -s] : NO difference -> print File identical ( <> Option -q ) "
    echo "            [Option : -u] : Delete Content, Add Content Info Print "
    echo "            [Option : -w] : Ignore spaces and tabs "
    echo "            [Option : -r] : Compare SubDirectories "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/ "
    mkdir -p `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt "
    echo 'TestFile1' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt
    echo " echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt "
    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt
    echo " echo 'Test,bash,zsh,sh' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt "
    echo 'Test,bash,zsh,sh' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt
    echo " echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt "
    echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt
    echo
    echo " echo 'TestFile1' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt "
    echo 'TestFile1' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo " echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt "
    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo " echo 'Test,bash,zsh,sh' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt "
    echo 'Test,bash,zsh,sh' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo " echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt "
    echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo
    echo " echo 'TestFile1' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt "
    echo 'TestFile1' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo " echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt "
    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo " echo 'Test,bash,zsh,sh' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt "
    echo 'Test,bash,zsh,sh' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo " echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt "
    echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo " echo 'insert Data' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt "
    echo 'insert Data' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo 
    echo " echo 'TestFile1' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile4.txt "
    echo 'TestFile1' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile4.txt
    echo " echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile4.txt "
    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile4.txt
    echo " echo 'Test,bash,zsh,sh' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile4.txt "
    echo 'Test,bash,zsh,sh' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile4.txt
    echo 
    echo " echo 'TestFile5' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt "
    echo 'TestFile5' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo " echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt "
    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo " echo 'Test,bash,zsh,sh' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt "
    echo 'Test,bash,zsh,sh' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo " echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt "
    echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo
    echo " echo 'TestFile6' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile6.txt "
    echo 'TestFile6' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile6.txt
    echo " echo 'apple,banana,cream,dust,   Test,txt,TestFile1,gui     ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile6.txt "
    echo 'apple,banana,cream,dust,   Test,txt,TestFile1,gui     ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile6.txt
    echo " echo 'Test,  bash,zsh,sh      ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile6.txt "
    echo 'Test,  bash,zsh,sh      ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile6.txt
    echo " echo '  Test,java,Javascript,C,C#,   C++,python,ruby     ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile6.txt "
    echo '  Test,java,Javascript,C,C#,   C++,python,ruby     ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile6.txt
    echo
    echo " echo 'TestFile7' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt "
    echo 'TestFile7' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo " echo 'TestFile1    ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt "
    echo 'TestFile1    ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo " echo 'apple,banana,cream,dust,  Test,txt,TestFile1,gui     ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt "
    echo 'apple,banana,cream,dust,  Test,txt,TestFile1,gui     ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo " echo 'Test,     bash,zsh,sh    ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt "
    echo 'Test,     bash,zsh,sh    ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo " echo '    Test,java,Javascript,C,C#,          C++,python,ruby     ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt "
    echo '    Test,java,Javascript,C,C#,          C++,python,ruby     ' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo
    echo " echo 'TESTFILE1' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile8.txt "
    echo 'TESTFILE1' > `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile8.txt
    echo " echo 'APPLE,BANANA,CREAM,DUST,TEST,TXT,TESTFILE1,GUI' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile8.txt "
    echo 'APPLE,BANANA,CREAM,DUST,TEST,TXT,TESTFILE1,GUI' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile8.txt
    echo " echo 'TEST,BASH,ZSH,SH' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile8.txt "
    echo 'TEST,BASH,ZSH,SH' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile8.txt
    echo " echo 'TEST,JAVA,JAVASCRIPT,C,C#,C++,PYTHON,RUBY' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile8.txt "
    echo 'TEST,JAVA,JAVASCRIPT,C,C#,C++,PYTHON,RUBY' >> `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile8.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : No difference -> No output message )
    echo
    echo " No difference -> No output message "
    echo " diff `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt "
    diff `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo
    # Example 02 (Not Option : Data Only Right File -> [ > diff Data ] )
    echo
    echo " Data Only Right File -> [ > diff Data ] "
    echo " diff `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt "
    diff `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt
    echo 
    # Example 03 (Not Option : Data Only Left File -> [ < diff Data ] )
    echo
    echo " Data Only Left File -> [ < diff Data ] "
    echo " diff `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile4.txt "
    diff `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile4.txt
    echo
    # Example 04 (Option -q : If exists in the difference -> print File differ ( <> Option -s ) )
    echo
    echo " Option -q : If exists in the difference -> print File differ  ( <> Option -s ) "
    echo " diff -q `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt "
    diff -q `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo
    # Example 05 (Option -b : Continuous spaces are recognized as one and files are compared )
    echo
    echo " Option -b : Continuous spaces are recognized as one and files are compared " 
    echo " diff -b `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile6.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt "
    diff -b `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile6.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo
    # Example 06 (Option -i : Case-sensitive Comparison )
    echo
    echo " Option -i : Case-sensitive Comparison "
    echo " diff -i `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile8.txt "
    diff -i `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile8.txt
    echo
    # Example 07 (Option -s : NO difference -> print File identical ( <> Option -q ) )
    echo
    echo " Option -s : NO difference -> print File identical ( <> Option -q ) "
    echo " diff -s `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt "
    diff -s `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt
    echo
    # Example 08 (Option -u : Delete Content, Add Content Info Print )
    echo
    echo " Option -u : Delete Content, Add Content Info Print "
    echo " diff -u `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt "
    diff -u `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt
    echo
    # Example 09 (Option -w : Ignore spaces and tabs )
    echo
    echo " Option -w : Ignore spaces and tabs "
    echo " diff -w `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt "
    diff -w `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt
    echo
    # Example 10 (Option -r : Compare SubDirectories )
    echo
    echo " Option -r : Compare SubDirectories "
    echo " diff -r `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt "
    diff -r `pwd`/diff_CMD_TestFolder/ `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/
    echo
    # Example End
    echo
    echo "## diff End ##"
    echo
}

diff_CompareFileContents 