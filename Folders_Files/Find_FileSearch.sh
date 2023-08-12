#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Find]_[FileSearch]
#------------------------------------------------------------
function find_FileSearch(){
    echo
    echo "## find Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : find"
    echo " HowToUse : find [Option] [Argument1] [Argument2] ..."
    echo "            [Argument1] : tarFile_Path "
    echo "            [Argument1] : type Option "
    echo "            [Argument1] : matchingdata "
    echo "            [Option : -name] : search Pattern Name "
    echo "            [Option : -empty] : empty Folder check "
    echo "            [Option : -delete] : delete file "
    echo "            [Option : -print] : print file and folder "
    echo "            [Option : -print0] : print file and folder not new Line "
    echo "            [Option : -maxdepth] : SubDirectories "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/find_CMD_TestFolder2/ "
    mkdir -p `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/find_CMD_TestFolder2/
    echo " mkdir -p `pwd`/find_CMD_TestFolder/find_CMD_TestFolder3/find_CMD_TestFolder4/ "
    mkdir -p `pwd`/find_CMD_TestFolder/find_CMD_TestFolder3/find_CMD_TestFolder4/
    echo " mkdir -p `pwd`/find_CMD_TestFolder/find_CMD_TestFolder5/find_CMD_TestFolder6/ "
    mkdir -p `pwd`/find_CMD_TestFolder/find_CMD_TestFolder5/find_CMD_TestFolder6/
    # Preparation : Create File
    echo " echo 'TestFile100' > `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/find_CMD_TestFile100.txt "
    echo 'TestFile100' > `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/find_CMD_TestFile100.txt
    echo " echo 'TestFile200' > `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/find_CMD_TestFolder2/find_CMD_TestFile200.txt "
    echo 'TestFile200' > `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/find_CMD_TestFolder2/find_CMD_TestFile200.txt
    echo " echo 'TestFile300' > `pwd`/find_CMD_TestFolder/find_CMD_TestFolder3/find_CMD_TestFile300.txt "
    echo 'TestFile300' > `pwd`/find_CMD_TestFolder/find_CMD_TestFolder3/find_CMD_TestFile300.txt
    echo " touch `pwd`/find_CMD_TestFolder/find_CMD_TestFolder5/find_CMD_TestFolder4/find_CMD_TestFile400.txt "
    touch `pwd`/find_CMD_TestFolder/find_CMD_TestFolder5/find_CMD_TestFolder4/find_CMD_TestFile400.txt
    echo " touch `pwd`/find_CMD_TestFolder/find_CMD_TestFolder5/find_CMD_TestFile500.tt "
    touch `pwd`/find_CMD_TestFolder/find_CMD_TestFolder5/find_CMD_TestFile500.tt
    echo " touch `pwd`/find_CMD_TestFolder/find_CMD_TestFolder5/find_CMD_TestFile501.log "
    touch `pwd`/find_CMD_TestFolder/find_CMD_TestFolder5/find_CMD_TestFile501.log
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : exists File )
    echo
    echo " matchingdata -> file : exists check "
    echo " find `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/find_CMD_TestFile100.txt "
    find `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/find_CMD_TestFile100.txt
    echo
    # Example 02 (Not Option : Not exists File )
    echo
    echo " matchingdata -> file : exists check "
    echo " find `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/find_CMD_TestFile1000.txt "
    find `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/find_CMD_TestFile1000.txt
    echo
    # Example 03 (Not Option : SubDirectories All Print )
    echo
    echo " matchingdata -> folder : Files and SubDirectories Print "
    echo " find `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/ "
    find `pwd`/find_CMD_TestFolder/find_CMD_TestFolder1/
    echo
    # Example 04 (Option -name : search Pattern Name )
    echo
    echo " Option -name : search Pattern Name "
    echo " find . -name find_CMD_TestFile100.txt "
    find . -name find_CMD_TestFile100.txt
    echo
    echo " find . -name '*find*' "
    find . -name '*find*'
    echo
    # Example 05 (Option -empty : empty Folder check )
    echo
    echo " Option -empty : empty Folder check "
    echo " find . -empty "
    find . -empty
    echo
    # Example 06 (Option -delete : delete file )
    echo
    echo " Option -delete : delete file "
    echo " find . -name '*.tt' -delete "
    find . -name '*.tt' -delete
    echo
    # Example 07 (Option -print : print file and folder , Option -print0 : print file and folder not new Line )
    echo
    echo " Option -print : print file and folder "
    echo " find . -name '*find*' -print0 "
    find . -name '*find*' -print0
    echo
    echo
    echo " Option -print0 : print file and folder not new Line "
    echo " find . -name '*find*' -print "
    find . -name '*find*' -print
    echo
    # Example 08 (Option -maxdepth : SubDirectories )
    echo
    echo " Option -maxdepth : SubDirectories "
    echo " find . -maxdepth 1 -name '*log*' "
    find . -maxdepth 2 -name '*log*'
    echo
    echo " find . -maxdepth 2 -name '*log*' "
    find . -maxdepth 3 -name '*log*'
    echo
    # Example End
    echo
    echo "## find End ##"
    echo
}

find_FileSearch