#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Uniq]_[FileContentDuplicationDelete]
#------------------------------------------------------------
function uniq_FileContentDuplicationDelete(){
    echo
    echo "## uniq Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : uniq"
    echo " HowToUse : uniq [Option] [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -c] : duplicate values print "
    echo "            [Option : -i] : Not case sensitive "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/uniq_CMD_TestFolder/ "
    mkdir -p `pwd`/uniq_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'test apple' > `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test apple' > `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test apple' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test apple' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test apple' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test apple' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test apple' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test apple' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test banana' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test banana' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test Banana' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test Banana' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test banana' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test banana' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test melon' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test melon' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test banana' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test banana' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test Peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test Peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test pear' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test pear' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test apple' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test apple' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test Peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test Peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo " echo 'test peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    echo 'test peach' >> `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Remove consecutive duplicate values )
    echo
    cat `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo
    echo " uniq `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    uniq `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo
    # Example 02 (Option -c : duplicate values print )
    echo
    echo " uniq -c `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    uniq -c `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo
    # Example 03 (Option -i : Not case sensitive )
    echo
    echo " uniq -i `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt "
    uniq -i `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt
    echo
    # Example End
    echo
    echo "## uniq End ##"
    echo
}

uniq_FileContentDuplicationDelete