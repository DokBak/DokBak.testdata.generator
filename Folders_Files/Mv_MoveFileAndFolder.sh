#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Mv]_[MoveFileAndFolder]
#------------------------------------------------------------
function mv_MoveFileAndFolder(){
    echo
    echo "## mv Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : mv"
    echo " HowToUse : mv [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Argument2] : moveFolder_Path "
    echo "            [Option : -f] : Move files without asking even if they exist "
    echo "            [Option : -i] : Move after question when executing command "
    echo "            [Option : -n] : If the file exists, it does not move "
    echo "            [Option : -v] : Output detailed information "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFolder3/ "
    mkdir -p `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFolder3/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile1.txt "
    echo 'TestFile1' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile1.txt
    echo " echo 'TestFile2' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile2.txt "
    echo 'TestFile2' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile2.txt
    echo " echo 'TestFile3' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile3.txt "
    echo 'TestFile3' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile3.txt
    echo " echo 'TestFile4' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile4.txt "
    echo 'TestFile4' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile4.txt
    echo " echo 'TestFile5' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile5.txt "
    echo 'TestFile5' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile5.txt
    echo " echo 'TestFile6' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile6.txt "
    echo 'TestFile6' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile6.txt
    echo " echo 'TestFile8' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile3.txt "
    echo 'TestFile8' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile3.txt
    echo " echo 'TestFile9' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile4.txt "
    echo 'TestFile9' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile4.txt
    echo " echo 'TestFile10' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile5.txt "
    echo 'TestFile10' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile5.txt
    echo " echo 'TestFile11' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile6.txt "
    echo 'TestFile11' > `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile6.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " mv `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile3.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFolder3/ "
    mv `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile3.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFolder3/
    echo " ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile3.txt "
    ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile3.txt
    echo " mv `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile1.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile2.txt "
    mv `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile1.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile2.txt
    echo " ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile1.txt "
    ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile1.txt
    echo
    # Example 02 (Option -f : Move files without asking even if they exist )
    echo
    echo " Option -f : Move files without asking even if they exist "
    echo " mv -f `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile5.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/ "
    mv -f `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile5.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/
    echo " ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile5.txt "
    ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile5.txt
    echo
    # Example 03 (Option -i : Move after question when executing command )
    echo
    echo " Option -i : Move after question when executing command "
    echo " mv -i `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile2.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/ "
    mv -i `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile2.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/
    echo " ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile2.txt "
    ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile2.txt
    echo
    # Example 04 (Option -n : If the file exists, it does not move )
    echo
    echo " Option -n : If the file exists, it does not move "
    echo " mv -n `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile4.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/ "
    mv -n `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile4.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/
    echo " ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile4.txt "
    ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile4.txt
    echo
    # Example 05 (Option -v : Output detailed information )
    echo
    echo " Option -v : Output detailed information "
    echo " mv -v `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile4.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/ "
    mv -v `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile4.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/
    echo " ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile3.txt "
    ls -l `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile4.txt
    echo
    # Example End
    echo
    echo "## mv End ##"
    echo
}

mv_MoveFileAndFolder