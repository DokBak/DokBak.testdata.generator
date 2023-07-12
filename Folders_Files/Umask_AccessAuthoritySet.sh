#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Umask]_[AccessAuthoritySet]
#------------------------------------------------------------
function umask_AccessAuthoritySet(){
    echo
    echo "## umask Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : umask"
    echo " HowToUse : umask [Option] [Argument1] "
    echo "            [Argument1] : Set access permission "
    echo "            [Option : -S] : Outputs default access to characters "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Current mask print )
    echo
    echo " my system default mask : 022 "
    echo " umask "
    umask
    echo " mkdir -p `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder1/ "
    mkdir -p `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder1/
    echo " echo 'test apple' > `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder1/umask_CMD_TestFile1.txt "
    echo 'test apple' > `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder1/umask_CMD_TestFile1.txt
    echo " ls -ld `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder1/ "
    ls -ld `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder1/
    echo " ls -l `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder1/umask_CMD_TestFile1.txt "
    ls -l `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder1/umask_CMD_TestFile1.txt
    echo
    # Example 02 (Not Option : mask Set exam )
    echo
    echo " umask 000 "
    umask 000
    echo " mkdir -p `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder2/ "
    mkdir -p `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder2/
    echo " echo 'test apple' > `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder2/umask_CMD_TestFile2.txt "
    echo 'test apple' > `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder2/umask_CMD_TestFile2.txt
    echo " ls -ld `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder2/ "
    ls -ld `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder2/
    echo " ls -l `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder2/umask_CMD_TestFile2.txt "
    ls -l `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder2/umask_CMD_TestFile2.txt
    echo
    # Example 03 (Not Option : mask Set exam )
    echo
    echo " umask 012 "
    umask 012
    echo " mkdir -p `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder3/ "
    mkdir -p `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder3/
    echo " echo 'test apple' > `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder3/umask_CMD_TestFile3.txt "
    echo 'test apple' > `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder3/umask_CMD_TestFile3.txt
    echo " ls -ld `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder3/ "
    ls -ld `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder3/
    echo " ls -l `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder3/umask_CMD_TestFile3.txt "
    ls -l `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder3/umask_CMD_TestFile3.txt
    echo
    # Example 04 (Not Option : mask Set exam )
    echo
    echo " umask 567 "
    umask 567
    echo " mkdir -p `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder4/ "
    mkdir -p `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder4/
    echo " echo 'test apple' > `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder4/umask_CMD_TestFile4.txt "
    echo 'test apple' > `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder4/umask_CMD_TestFile4.txt
    echo " ls -ld `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder4/ "
    ls -ld `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder4/
    echo " ls -l `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder4/umask_CMD_TestFile4.txt "
    ls -l `pwd`/umask_CMD_TestFolder/umask_CMD_TestFolder4/umask_CMD_TestFile4.txt
    echo
    # Example 02 (Option -s : Outputs default access to characters )
    echo
    echo " Option -s : Outputs default access to characters "
    echo " umask -S "
    umask -S
    echo
    # Example End
    echo
    echo "## umask End ##"
    echo
}

umask_AccessAuthoritySet