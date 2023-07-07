#!/bin/sh

#------------------------------------------------------------
# Cmd test Shell : [Join]_[FileContentJoin]
#------------------------------------------------------------
function join_FileContentJoin(){
    echo
    echo "## join Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : join"
    echo " HowToUse : join [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : tarFile_Path1 "
    echo "            [Argument2] : tarFile_Path2 "
    echo "            [Option : -o] : [Argument1.column],[Argument2.column] select column Join "
    echo "            [Option : -t] : [delimiters] Join "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/join_CMD_TestFolder/ "
    mkdir -p `pwd`/join_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'test apple A' > `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt "
    echo 'test apple A' > `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt
    echo " echo 'test banana B' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt "
    echo 'test banana B' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt
    echo " echo 'test melon C' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt "
    echo 'test melon C' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt
    echo
    echo " echo 'test,pear,D' > `pwd`/join_CMD_TestFolder/join_CMD_TestFile3.txt "
    echo 'test,pear,D' > `pwd`/join_CMD_TestFolder/join_CMD_TestFile3.txt
    echo " echo 'test,peach,E' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile3.txt "
    echo 'test,peach,E' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile3.txt
    echo 
    echo " echo 'test 300 F' > `pwd`/join_CMD_TestFolder/join_CMD_TestFile2.txt "
    echo 'test 300 F' > `pwd`/join_CMD_TestFolder/join_CMD_TestFile2.txt
    echo " echo 'test 350 G' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile2.txt "
    echo 'test 350 G' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile2.txt
    echo
    echo " echo 'test,120,X' > `pwd`/join_CMD_TestFolder/join_CMD_TestFile4.txt "
    echo 'test,120,X' > `pwd`/join_CMD_TestFolder/join_CMD_TestFile4.txt
    echo " echo 'test,270,Y' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile4.txt "
    echo 'test,270,Y' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile4.txt
    echo " echo 'test,410,Z' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile4.txt "
    echo 'test,410,Z' >> `pwd`/join_CMD_TestFolder/join_CMD_TestFile4.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : cross Join)
    echo
    echo " join `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt `pwd`/join_CMD_TestFolder/join_CMD_TestFile2.txt "
    join `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt `pwd`/join_CMD_TestFolder/join_CMD_TestFile2.txt
    echo
    # Example 02 (Option -o : [Argument1.column],[Argument2.column] select column Join)
    echo
    echo " join -o 1.2,2.2 `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt `pwd`/join_CMD_TestFolder/join_CMD_TestFile2.txt "
    join -o 1.2,2.2 `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt `pwd`/join_CMD_TestFolder/join_CMD_TestFile2.txt
    echo
    # Example 03 (Option -t : [delimiters] Join )
    echo
    echo " join -t,  `pwd`/join_CMD_TestFolder/join_CMD_TestFile3.txt `pwd`/join_CMD_TestFolder/join_CMD_TestFile4.txt "
    join -t,  `pwd`/join_CMD_TestFolder/join_CMD_TestFile3.txt `pwd`/join_CMD_TestFolder/join_CMD_TestFile4.txt
    echo
    # Example End
    echo
    echo "## join End ##"
    echo
}

join_FileContentJoin