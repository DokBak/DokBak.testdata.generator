#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tip]_[RedirectionOperator]
#------------------------------------------------------------
function Tip_RedirectionOperator(){
    echo
    echo "## Redirection Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : Redirection"
    echo " HowToUse : [command] [Redirection] [command] "
    echo "            [ < ] : Put the results on the right to the left "
    echo "            [ > ] : Output the results on the left to the right [Overwrite] "
    echo "            [ >> ] : Output the results on the left to the right [Additional] "
    echo "            [ 2>> ] : Output left error to right "
    echo "            [ &> ] or [ >& ] : Output the results on the left to the right [Overwrite] "
    echo "            [ 2>&1 ] : Standard output of errors in the left contents "
    echo
    # Basic Information End
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/RedirectionOperator_CMD_TestFolder/ "
    mkdir -p `pwd`/RedirectionOperator_CMD_TestFolder/
    # Preparation : Create File
    echo " date > `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt "
    date > `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt
    echo " pwd >> `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt "
    pwd >> `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt
    echo " date >> `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt "
    date >> `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 ( [ < ] : Put the results on the right to the left )
    echo
    echo " sort < `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt "
    sort < `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt
    echo
    # Example 02 ( [ > ] : Output the results on the left to the right [Overwrite] )
    echo
    echo " date > `pwd`/RedirectionOperator_CMD_TestFolder/CreateWriteRedirectFile.txt "
    date > `pwd`/RedirectionOperator_CMD_TestFolder/CreateWriteRedirectFile.txt
    echo " pwd > `pwd`/RedirectionOperator_CMD_TestFolder/CreateWriteRedirectFile.txt "
    pwd > `pwd`/RedirectionOperator_CMD_TestFolder/CreateWriteRedirectFile.txt
    echo " date > `pwd`/RedirectionOperator_CMD_TestFolder/CreateWriteRedirectFile.txt "
    date > `pwd`/RedirectionOperator_CMD_TestFolder/CreateWriteRedirectFile.txt
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/CreateWriteRedirectFile.txt "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/CreateWriteRedirectFile.txt
    echo
    # Example 03 ( [ >> ] : Output the results on the left to the right [Additional] )
    echo
    echo " date >> `pwd`/RedirectionOperator_CMD_TestFolder/AddWriteRedirectFile.txt "
    date >> `pwd`/RedirectionOperator_CMD_TestFolder/AddWriteRedirectFile.txt
    echo " pwd >> `pwd`/RedirectionOperator_CMD_TestFolder/AddWriteRedirectFile.txt "
    pwd >> `pwd`/RedirectionOperator_CMD_TestFolder/AddWriteRedirectFile.txt
    echo " date >> `pwd`/RedirectionOperator_CMD_TestFolder/AddWriteRedirectFile.txt "
    date >> `pwd`/RedirectionOperator_CMD_TestFolder/AddWriteRedirectFile.txt
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/AddWriteRedirectFile.txt "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/AddWriteRedirectFile.txt
    echo
    # Example 04 ( [ 2>> ] : Output left error to right )
    echo
    echo " cat NoFile.txt 2>> `pwd`/RedirectionOperator_CMD_TestFolder/ErrWriteRedirectFile.txt "
    cat NoFile.txt 2>> `pwd`/RedirectionOperator_CMD_TestFolder/ErrWriteRedirectFile.txt
    echo " pwd 2>> `pwd`/RedirectionOperator_CMD_TestFolder/ErrWriteRedirectFile.txt "
    pwd 2>> `pwd`/RedirectionOperator_CMD_TestFolder/ErrWriteRedirectFile.txt
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/ErrWriteRedirectFile.txt "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/ErrWriteRedirectFile.txt
    echo
    # Example 05 ( [ &> ] or [ >& ] : Output the results on the left to the right [Overwrite] )
    echo
    echo " cat NoFile.txt &> `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectAndErr1.txt "
    cat NoFile.txt &> `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectAndErr1.txt
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectAndErr1.txt "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectAndErr1.txt
    echo " pwd &> `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectAndErr2.txt "
    pwd &> `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectAndErr2.txt
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectAndErr2.txt "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectAndErr2.txt
    echo
    # Example 06 ( [ 2>&1 ] : Standard output of errors in the left contents )
    echo
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt > `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt > `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/NoFile.txt 2> `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/NoFile.txt 2> `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt
    echo
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt > `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt 2> `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt > `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt 2> `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/NoFile.txt > `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt 2> `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/NoFile.txt > `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt 2> `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt
    echo
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt > `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt 2>&1 "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt > `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt 2>&1 
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/NoFile.txt > `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt 2>&1 "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/NoFile.txt > `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectTest.txt 2>&1
    echo
    echo " /dev/null is the same place as the Recycle Bin "
    echo
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt > /dev/null 2>&1 "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt > /dev/null 2>&1 
    echo " cat `pwd`/RedirectionOperator_CMD_TestFolder/NoFile.txt > /dev/null 2>&1 "
    cat `pwd`/RedirectionOperator_CMD_TestFolder/NoFile.txt > /dev/null 2>&1 
    echo
    # Example End
    echo
    echo "## Redirection End ##"
    echo
}

Tip_RedirectionOperator