#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [tar]_[TapeARchiver]
#------------------------------------------------------------
function tar_TapeARchiver(){
    echo 
    echo "## tar Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : tar "
    echo " HowToUse : tar [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Argument2] : targetFile_Path "
    echo "            [Option : -v] : tar Command Preview "
    echo "            [Option : -f] : tar Archive File (default) "
    echo "            [Option : -c] : tar Archive Create (overwrite) "
    echo "            [Option : -t] : tar Archive File List Show "
    echo "            [Option : -x] : tar Archive Extracting To Current Folder "
    echo "            [Option : -r] : tar Archive File Add (append) "
    echo "            [Option : -u] : tar Archive File Add (update) "
    echo "            [Option : -C] : tar Archive Extracting To Specify Folder "    
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/tar_CMD_TestFolder/tar_CMD_TestFolder2 "
    mkdir -p `pwd`/tar_CMD_TestFolder/tar_CMD_TestFolder2
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile1.txt "
    echo " TestFile1" > `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile1.txt
    echo " echo 'TestFile2' > `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile2.txt "
    echo " TestFile2" > `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile2.txt
    echo " echo 'TestFile3' > `pwd`/tar_CMD_TestFolder/tar_CMD_TestFolder2/tar_CMD_TestFile3.txt "
    echo " TestFile3" > `pwd`/tar_CMD_TestFolder/tar_CMD_TestFolder2/tar_CMD_TestFile3.txt
    echo " Tcd `pwd`/tar_CMD_TestFolder/ "
    echo
    # Preparation End
    # Example Start
    # Example 01 (Option cvf : Creating a tar Archive1)
    echo
    echo " tar cvf `pwd`/tar_CMD_TestFolder/Testtar1.tar `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile1.txt `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile2.txt "
    tar cvf `pwd`/tar_CMD_TestFolder/Testtar1.tar `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile1.txt `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile2.txt
    echo    
    # Example 02 (Option cvf : Creating a tar Archive2)
    echo
    echo " tar cvf `pwd`/tar_CMD_TestFolder/Testtar2.tar `pwd`/tar_CMD_TestFolder/* "
    tar cvf `pwd`/tar_CMD_TestFolder/Testtar2.tar `pwd`/tar_CMD_TestFolder/*
    echo    
    # Example 03 (Option tvf : tar Archive Show)
    echo
    echo " tar tvf `pwd`/tar_CMD_TestFolder/Testtar1.tar "
    tar tvf `pwd`/tar_CMD_TestFolder/Testtar1.tar
    echo " tar tvf `pwd`/tar_CMD_TestFolder/Testtar2.tar "
    tar tvf `pwd`/tar_CMD_TestFolder/Testtar2.tar
    echo
    # Example 04 (Option xvf : Extracting a tar Archive)
    echo
    echo " tar xvf `pwd`/tar_CMD_TestFolder/Testtar1.tar "
    tar xvf `pwd`/tar_CMD_TestFolder/Testtar1.tar
    echo
    # Example 05 (Option xvf : Extracting a tar Archive)
    #            (Option -C : To specify a directory)
    echo
    echo " tar xvf `pwd`/tar_CMD_TestFolder/Testtar2.tar -C `pwd`/tar_CMD_TestFolder/tar_CMD_TestFolder2 "
    tar xvf `pwd`/tar_CMD_TestFolder/Testtar2.tar -C `pwd`/tar_CMD_TestFolder/tar_CMD_TestFolder2
    echo
    # Example 06 (Option rvf : Add File to tar Archive)
    echo
    echo " cp `pwd`/tar_CMD_TestFolder/Testtar1.tar `pwd`/tar_CMD_TestFolder/Testtar3.tar "
    cp `pwd`/tar_CMD_TestFolder/Testtar1.tar `pwd`/tar_CMD_TestFolder/Testtar3.tar
    echo " tar tvf `pwd`/tar_CMD_TestFolder/Testtar3.tar "
    tar tvf `pwd`/tar_CMD_TestFolder/Testtar3.tar
    echo " echo 'r TestFile1' > `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile1.txt "
    echo " r TestFile1" > `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile1.txt
    echo " tar rvf `pwd`/tar_CMD_TestFolder/Testtar3.tar `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile1.txt "
    tar rvf `pwd`/tar_CMD_TestFolder/Testtar3.tar `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile1.txt
    echo " tar tvf `pwd`/tar_CMD_TestFolder/Testtar3.tar "
    tar tvf `pwd`/tar_CMD_TestFolder/Testtar3.tar 
    echo
    # Example 07 (Option uvf : Update File to tar Archive)
    echo
    echo " cp `pwd`/tar_CMD_TestFolder/Testtar1.tar `pwd`/tar_CMD_TestFolder/Testtar4.tar "
    cp `pwd`/tar_CMD_TestFolder/Testtar1.tar `pwd`/tar_CMD_TestFolder/Testtar4.tar
    echo " tar tvf `pwd`/tar_CMD_TestFolder/Testtar4.tar "
    tar tvf `pwd`/tar_CMD_TestFolder/Testtar4.tar
    echo " echo 'u TestFile2' > `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile2.txt "
    echo " u TestFile2" > `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile2.txt
    echo " tar uvf `pwd`/tar_CMD_TestFolder/Testtar4.tar `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile2.txt "
    tar uvf `pwd`/tar_CMD_TestFolder/Testtar4.tar `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile2.txt
    echo " tar tvf `pwd`/tar_CMD_TestFolder/Testtar4.tar"
    tar tvf `pwd`/tar_CMD_TestFolder/Testtar4.tar 
    echo
    # Example End
    echo
    echo "## tar End ##"
    echo 
}

tar_TapeARchiver 