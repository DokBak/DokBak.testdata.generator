#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Cat]_[FileContentPrint]
#------------------------------------------------------------
function cat_FileContentPrint(){
    echo
    echo "## cat Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : cat"
    echo " HowToUse : cat [Option] [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -b] : Outputs a line number in front of a line that is not blank "
    echo "            [Option : -e] : Print a [$] at the end of all lines "
    echo "            [Option : -n] : Print out all lines with line numbers "
    echo "            [Option : -s] : Compresses consecutive blank lines and outputs them as a single line "
    echo "            [Option : -t] : tab string is replaced with a string "^I" and outputted "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/cat_CMD_TestFolder/ "
    mkdir -p `pwd`/cat_CMD_TestFolder/
    # Preparation : Create File
    echo " echo '' > `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    echo '' > `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo " echo 'testfile1' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    echo 'testfile1' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo " echo '' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    echo '' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo " echo '' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    echo '' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo " echo 'testfile2' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    echo 'testfile2' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo " echo 'testfile3' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    echo 'testfile3' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo " echo '' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    echo '' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo " echo 'testfile4\t' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    echo 'testfile4\t' >> `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : File Contents Print )
    echo
    echo " Not Option : File Contents Print "
    echo " cat `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    cat `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo
    # Example 02 (Option -b : Outputs a line number in front of a line that is not blank )
    echo
    echo " Option -b : Outputs a line number in front of a line that is not blank "
    echo " cat -b `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    cat -b `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo
    # Example 03 (Option -e : Print a [$] at the end of all lines )
    echo
    echo " Option -e : Print a [$] at the end of all lines "
    echo " cat -e `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    cat -e `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo
    # Example 04 (Option -n : Print out all lines with line numbers )
    echo
    echo " Option -n : Print out all lines with line numbers "
    echo " cat -n `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    cat -n `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo
    # Example 05 (Option -s : Compresses consecutive blank lines and outputs them as a single line )
    echo
    echo " Option -s : Compresses consecutive blank lines and outputs them as a single line "
    echo " cat -s `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    cat -s `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo
    # Example 06 (Option -t : tab string is replaced with a string "^I" and outputted )
    echo
    echo " Option -t : tab string is replaced with a string "^I" and outputted "
    echo " cat -t `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt "
    cat -t `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt
    echo
    # Example End
    echo
    echo "## cat End ##"
    echo
}

cat_FileContentPrint