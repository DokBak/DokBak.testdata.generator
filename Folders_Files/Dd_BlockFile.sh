#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Dd]_[BlockFile]
#------------------------------------------------------------
function dd_BlockFile(){
    echo
    echo "## dd Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : dd"
    echo " HowToUse : dd [Argument1] [Argument2] "
    echo "            [Argument1] : if=inputFile_Path "
    echo "            [Argument2] : of=outputFile_Path "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/dd_CMD_TestFolder/ "
    mkdir -p `pwd`/dd_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'TestFile01TestFile02TestFile03TestFile04TestFile05TestFile06TestFile07TestFile08TestFile09TestFile10TestFile11TestFile12TestFile13TestFile14TestFile15TestFile16TestFile17TestFile18TestFile19TestFile20TestFile21TestFile22TestFile23TestFile24TestFile25TestFile26TestFile27TestFile28TestFile29TestFile30' > `pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt "
    echo 'TestFile01TestFile02TestFile03TestFile04TestFile05TestFile06TestFile07TestFile08TestFile09TestFile10TestFile11TestFile12TestFile13TestFile14TestFile15TestFile16TestFile17TestFile18TestFile19TestFile20TestFile21TestFile22TestFile23TestFile24TestFile25TestFile26TestFile27TestFile28TestFile29TestFile30' > `pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : if [inputFile_path], of[outputFile_path])
    echo
    echo " if : inputFile_path, of : outputFile_path "
    echo " (if)inputFileSize = 301 -> copy -> (of)outputFileSize = 301 "
    echo " ls -l `pwd`/dd_CMD_TestFolder/ "
    ls -l `pwd`/dd_CMD_TestFolder/
    echo ' dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile2.txt" '
    dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile2.txt"
    echo " ls -l `pwd`/dd_CMD_TestFolder/ "
    ls -l `pwd`/dd_CMD_TestFolder/
    echo
    # Example 02 (Not Option : bs [blockSize])
    echo
    echo " bs : blockSize "
    echo " (if)inputFileSize = 301 -> (bs)Copy by 64 bytes -> (of)outputFileSize = 64 * 4 + 45 = 301 "
    echo " ls -l `pwd`/dd_CMD_TestFolder/ "
    ls -l `pwd`/dd_CMD_TestFolder/
    echo ' dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile3.txt" bs=64 '
    dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile3.txt" bs=64
    echo " ls -l `pwd`/dd_CMD_TestFolder/ "
    ls -l `pwd`/dd_CMD_TestFolder/
    echo
    # Example 03 (Not Option : count [blockCount])
    echo
    echo " count : blockCount "
    echo " (if)inputFileSize = 301 -> (bs)Copy by 64 bytes -> (count) 2times -> (of)outputFileSize = 64 * 2 = 128 "
    echo " ls -l `pwd`/dd_CMD_TestFolder/ "
    ls -l `pwd`/dd_CMD_TestFolder/
    echo ' dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile4.txt" bs=64 count=2 '
    dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile4.txt" bs=64 count=2
    echo " ls -l `pwd`/dd_CMD_TestFolder/ "
    ls -l `pwd`/dd_CMD_TestFolder/
    echo
    # Example 04 (Not Option : skip [skip blockCount from inputFile])
    echo
    echo " skip : skip blockCount from inputFile "
    echo " (if)inputFileSize = 301 -> (bs)Copy by 64 bytes -> (skip) 2times skip -> (of)outputFileSize = 301 - (64 * 2) = 173 "
    echo " ls -l `pwd`/dd_CMD_TestFolder/ "
    ls -l `pwd`/dd_CMD_TestFolder/
    echo ' dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile5.txt" bs=64 skip=2 '
    dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile5.txt" bs=64 skip=2
    echo " ls -l `pwd`/dd_CMD_TestFolder/ "
    ls -l `pwd`/dd_CMD_TestFolder/
    echo
    # Example 05 (Not Option : seek [skip blockCount from outputFile])
    echo
    echo " seek : skip blockCount from outputFile "
    echo " (if)inputFileSize = 301 -> (bs)Copy by 64 bytes -> (seek) 2times seek -> (of)outputFileSize = (64 * 4 + 45) + (64 * 2) = 301 + 128 = 429 "
    echo " ls -l `pwd`/dd_CMD_TestFolder/ "
    ls -l `pwd`/dd_CMD_TestFolder/
    echo ' dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile6.txt" bs=64 seek=2 '
    dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile6.txt" bs=64 seek=2
    echo " ls -l `pwd`/dd_CMD_TestFolder/ "
    ls -l `pwd`/dd_CMD_TestFolder/
    echo
    # Example End
    echo
    echo "## dd End ##"
    echo
}

dd_BlockFile