#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Sort]_[FileSort]
#------------------------------------------------------------
function sort_FileSort(){
    echo
    echo "## sort Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : sort"
    echo " HowToUse : sort [Option] [Argument1] [Argument2] ..."
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -r] : Descending Order [z -> a -> Z -> A] "
    echo "            [Option : -f] : Case-Insensitive Sorting [last data output] "
    echo "            [Option : -b] : Ignore leading spaces and sort "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/sort_CMD_TestFolder/ "
    mkdir -p `pwd`/sort_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'TestFile1' > `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'DTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'DTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo 'zTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'zTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'tTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'tTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'xTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'xTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'cdTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'cdTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'Test,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'Test,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo '   vvTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo '   vvTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'gTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'gTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'Test,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'Test,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'oTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'oTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'iTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'iTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'pTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'pTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'vvTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'vvTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt " 
    echo 'qlTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'qlTest,bash,zsh,sh' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo 'sTest,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo " echo 'sTest,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : [A -> Z -> a -> z])
    echo
    echo " sort `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    sort `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo
    # Example 02 (Option -r : Descending Order [z -> a -> Z -> A] )
    echo
    echo " sort -r `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    sort -r `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo
    # Example 03 (Option -f : Case-Insensitive Sorting [last data output])
    echo
    echo " sort -f `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    sort -f `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo
    # Example 04 (Option -b : Ignore leading spaces and sort)
    echo
    echo " sort -b `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt "
    sort -b `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt
    echo
    # Example End
    echo
    echo "## sort End ##"
    echo
}

sort_FileSort