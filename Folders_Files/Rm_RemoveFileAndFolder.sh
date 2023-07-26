#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Rm]_[RemoveFileAndFolder]
#------------------------------------------------------------
function rm_RemoveFileAndFolder(){
    echo
    echo "## rm Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : rm"
    echo " HowToUse : rm [Option] [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -i] : Ask questions when deleting files or folders one by one "
    echo "            [Option : -r] : delete File of SubDirectories "
    echo "            [Option : -f] : force delete File "
    echo "            [Option : -v] : Output detailed information "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder2/rm_CMD_TestFolder3/ "
    mkdir -p `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder2/rm_CMD_TestFolder3/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile1.txt "
    echo 'TestFile1' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile1.txt
    echo " echo 'TestFile2' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile2.txt "
    echo 'TestFile2' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile2.txt
    echo " echo 'TestFile3' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile3.txt "
    echo 'TestFile3' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile3.txt
    echo " echo 'TestFile4' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder2/rm_CMD_TestFile4.txt "
    echo 'TestFile4' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder2/rm_CMD_TestFile4.txt
    echo " echo 'TestFile5' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder3/rm_CMD_TestFolder4/rm_CMD_TestFile5.txt "
    echo 'TestFile5' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder3/rm_CMD_TestFolder4/rm_CMD_TestFile5.txt
    echo " echo 'TestFile6' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder4/rm_CMD_TestFile6.txt "
    echo 'TestFile6' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder4/rm_CMD_TestFile6.txt
    echo " echo 'TestFile7' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder4/rm_CMD_TestFile7.txt "
    echo 'TestFile7' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder4/rm_CMD_TestFile7.txt
    echo " echo 'TestFile8' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder4/rm_CMD_TestFile8.txt "
    echo 'TestFile8' > `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder4/rm_CMD_TestFile8.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : delete File ) 
    echo
    echo " Not Option : delete File "
    echo " rm `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile1.txt "
    rm `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile1.txt
    echo " ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile1.txt "
    ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile1.txt
    echo
    # Example 02 (Option -i : Ask questions when deleting files or folders one by one ) 
    echo
    echo " Option -i : Ask questions when deleting files or folders one by one "
    echo " rm -i `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile2.txt "
    rm -i `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile2.txt
    echo " ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile2.txt "
    ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile2.txt
    echo
    # Example 03 (Option -r : delete File of SubDirectories ) 
    echo
    echo " Option -r : delete File of SubDirectories "
    echo " rm -r `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder2/ "
    rm -r `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder2/
    echo " ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder2/ "
    ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder2/
    echo
    # Example 04 (Option -f : force delete File ) 
    echo
    echo " Option -f : force delete File "
    echo " rm -rf `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder3/rm_CMD_TestFolder4/ "
    rm -rf `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder3/rm_CMD_TestFolder4/
    echo " ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder3/rm_CMD_TestFolder4/rm_CMD_TestFile5.txt "
    ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder3/rm_CMD_TestFolder4/rm_CMD_TestFile5.txt
    echo " ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder3/rm_CMD_TestFolder4/ "
    ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder3/rm_CMD_TestFolder4/
    echo
    # Example 05 (Option -v : Output detailed information ) 
    echo
    echo " Option -v : Output detailed information "
    echo " rm -v `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile3.txt "
    rm -v `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile3.txt
    echo " ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile3.txt "
    ls -l `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile3.txt
    echo
    # Example End
    echo
    echo "## rm End ##"
    echo
}

rm_RemoveFileAndFolder