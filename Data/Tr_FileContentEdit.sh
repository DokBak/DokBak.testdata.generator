#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tr]_[FileContentEdit]
#------------------------------------------------------------
function tr_FileContentEdit(){
    echo
    echo "## tr Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : tr"
    echo " HowToUse : tr [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : Pre-Modification data "
    echo "            [Argument2] : Post-Modification data "
    echo "            [Option : -d] : delete [Argument1] "
    echo "            [Option : -s] : [Argument1] Duplicate values Compress "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/tr_CMD_TestFolder/ "
    mkdir -p `pwd`/tr_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'test  apple' > `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt "
    echo 'test  apple' > `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo " echo 'test  banana' >> `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt "
    echo 'test  banana' >> `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo " echo 'test  melon' >> `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt "
    echo 'test  melon' >> `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo " echo 'test  pear' >> `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt "
    echo 'test  pear' >> `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo " echo 'test  peach' >> `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt "
    echo 'test  peach' >> `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Value Replacement of Regular Expression )
    echo
    echo " Not Option : Value Replacement of Regular Expression "
    cat `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo " tr [a-z] [A-Z] < `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt "
    tr [a-z] [A-Z] < `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    cat `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo
    # Example 02 (Not Option : Value Replacement )
    echo
    echo " Not Option : Value Replacement "
    cat `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo " tr 'es' 'xy' < `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt "
    tr 'es' 'xy' < `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    cat `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo
    # Example 03 (Option -d : delete [Argument1] )
    echo
    echo " Option -d : delete [Argument1] "
    cat `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo " tr -d 'es' < `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt "
    tr -d 'es' < `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    cat `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo
    # Example 04 (Option -s : [Argument1] Duplicate values Compress )
    echo
    echo " Option -s : [Argument1] Duplicate values Compress "
    cat `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo " tr -s ' ' < `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt "
    tr -s ' ' < `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    cat `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt
    echo
    # Example End
    echo
    echo "## tr End ##"
    echo
}

tr_FileContentEdit