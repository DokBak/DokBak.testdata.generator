#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Ls]_[DirectoryItem]
#------------------------------------------------------------
function ls_DirectoryItem(){
    echo
    echo "## ls Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : ls"
    echo " HowToUse : ls [Option] [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -a] : All files print, with hidden files and directories(Current Directory[.], Previous Directory[..]) "
    echo "            [Option : -A] : All files print, with hidden files and directories "
    echo "            [Option : -l] : Prints details of a file or directory (Horizon print) "
    echo "            [Option : -r] : Output in reverse order [default : file, directory] "
    echo "            [Option : -t] : The most recently modified file print "
    echo "            [Option : -p] : For folders, print folder name followed by / "
    echo "            [Option : -R] : Outputs both files and folders from subdirectories "
    echo "            [Option : -h] : Human-readable output /1024 "
    echo "            [Option : -i] : Print inode number (inode number : Number that uniquely identifies a file or directory) "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/ls_CMD_TestFolder/ls_CMD_TestFolder2/ "
    mkdir -p `pwd`/ls_CMD_TestFolder/ls_CMD_TestFolder2/
    echo " mkdir -p `pwd`/ls_CMD_TestFolder/ls_CMD_TestFolder3/ "
    mkdir -p `pwd`/ls_CMD_TestFolder/ls_CMD_TestFolder3/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile1.txt "
    echo 'TestFile1' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile1.txt
    echo " echo 'TestFile2' > `pwd`/ls_CMD_TestFolder/.ls_CMD_TestFile2.txt "
    echo 'TestFile2' > `pwd`/ls_CMD_TestFolder/.ls_CMD_TestFile2.txt
    echo " echo 'TestFile1' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile3.txt "
    echo 'TestFile3' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile3.txt
    echo " echo 'TestFile4' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile4.txt "
    echo 'TestFile4' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile4.txt
    echo " echo 'TestFile5' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile5.txt "
    echo 'TestFile5' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile5.txt
    echo " echo 'TestFile6' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile6.txt "
    echo 'TestFile6' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile6.txt
    echo " echo 'TestFile7' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile6.txt "
    echo 'TestFile7' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile6.txt
    echo " echo 'TestFile8' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile6.txt "
    echo 'TestFile8' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile6.txt
    echo " echo 'TestFile9' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile6.txt "
    echo 'TestFile9' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile6.txt
    echo " echo 'TestFile20' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFolder2/ls_CMD_TestFile20.txt "
    echo 'TestFile20' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFolder2/ls_CMD_TestFile20.txt
    echo " echo 'TestFile30' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFolder3/ls_CMD_TestFile30.txt "
    echo 'TestFile30' > `pwd`/ls_CMD_TestFolder/ls_CMD_TestFolder3/ls_CMD_TestFile30.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " ls `pwd`/ls_CMD_TestFolder/ "
    ls `pwd`/ls_CMD_TestFolder/
    echo
    # Example 02 (Option -a : All files print, with hidden files and directories(Current Directory[.], Previous Directory[..]) )
    echo
    echo " Option -a : All files print, with hidden files and directories(Current Directory[.], Previous Directory[..]) "
    echo " ls -a `pwd`/ls_CMD_TestFolder/ "
    ls -a `pwd`/ls_CMD_TestFolder/
    echo
    # Example 03 (Option -A : All files print, with hidden files and directories )
    echo
    echo " Option -A : All files print, with hidden files and directories "
    echo " ls -A `pwd`/ls_CMD_TestFolder/ "
    ls -A `pwd`/ls_CMD_TestFolder/
    echo
    # Example 04 (Option -l : Prints details of a file or directory (Horizon print) )
    # Print Content : Permission, number of files, owner, group, file size, modification date, file name
    echo
    echo " Option -l : Prints details of a file or directory (Horizon print) "
    echo " ls -l `pwd`/ls_CMD_TestFolder/ "
    ls -l `pwd`/ls_CMD_TestFolder/
    echo
    # Example 05 (Option -r : Output in reverse order [default : file, directory] )
    echo
    echo " Option -r : Output in reverse order [default : file, directory] "
    echo " ls -rl `pwd`/ls_CMD_TestFolder/ "
    ls -rl `pwd`/ls_CMD_TestFolder/
    echo
    # Example 06 (Option -t : The most recently modified file print )
    echo
    echo " Option -t : The most recently modified file print "
    echo " ls -tl `pwd`/ls_CMD_TestFolder/ "
    ls -tl `pwd`/ls_CMD_TestFolder/
    echo
    # Example 07 (Option -p : For folders, print folder name followed by / )
    echo
    echo " Option -p : For folders, print folder name followed by / "
    echo " ls -pl `pwd`/ls_CMD_TestFolder/ "
    ls -pl `pwd`/ls_CMD_TestFolder/
    echo
    # Example 08 (Option -R : Outputs both files and folders from subdirectories )
    echo
    echo " Option -R : Outputs both files and folders from subdirectories "
    echo " ls -Rl `pwd`/ls_CMD_TestFolder/ "
    ls -Rl `pwd`/ls_CMD_TestFolder/
    echo
    # Example 09 (Option -h : Human-readable output /1024 )
    echo
    echo " Option -h : Human-readable output /1024 "
    echo " ls -hl `pwd`/ls_CMD_TestFolder/ "
    ls -hl `pwd`/ls_CMD_TestFolder/
    echo
    # Example 10 (Option -i : print inode number (inode number : Number that uniquely identifies a file or directory) )
    echo
    echo " Option -i : print inode number (inode number : Number that uniquely identifies a file or directory) "
    echo " ln -s `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile1.txt `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile1_ln.txt "
    ln -s `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile1.txt `pwd`/ls_CMD_TestFolder/ls_CMD_TestFile1_ln.txt
    echo " ls -il `pwd`/ls_CMD_TestFolder/ "
    ls -il `pwd`/ls_CMD_TestFolder/
    echo
    # Example End
    # Sample Start
    echo
    echo " ls -ahptil `pwd`/ls_CMD_TestFolder/ "
    ls -ahptil `pwd`/ls_CMD_TestFolder/
    echo
    # Sample End
    echo
    echo "## ls End ##"
    echo
}

ls_DirectoryItem