#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Ln]_[SymbolicLink]
#------------------------------------------------------------
function ln_SymbolicLink(){
    echo
    echo "## ln Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : ln"
    echo " HowToUse : ln [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Argument2] : Link_File_Path "
    echo "            [Option : -s] : Similar to Windows shortcuts "
    echo "            [Option : -f] : Force an action when overwriting a link that already exists "
    echo "            [Option : -v] : Output detailed information "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/ln_CMD_TestFolder/ "
    mkdir -p `pwd`/ln_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'test apple' > `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt "
    echo 'test apple' > `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " ls -il `pwd`/ln_CMD_TestFolder/ "
    ls -il `pwd`/ln_CMD_TestFolder/
    echo " ln `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln.txt "
    ln `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln.txt
    echo " ls -il `pwd`/ln_CMD_TestFolder/ "
    ls -il `pwd`/ln_CMD_TestFolder/
    echo
    # Example 02 (Option -s : Similar to Windows shortcuts )
    echo
    echo " Option -s : Similar to Windows shortcuts "
    echo " ls -il `pwd`/ln_CMD_TestFolder/ "
    ls -il `pwd`/ln_CMD_TestFolder/
    echo " ln -s `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt "
    ln -s `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt
    echo " ls -il `pwd`/ln_CMD_TestFolder/ "
    ls -il `pwd`/ln_CMD_TestFolder/
    echo
    # Example 03 (Option -f : Force an action when overwriting a link that already exists )
    echo
    echo " Option -f : Force an action when overwriting a link that already exists "
    echo " ls -il `pwd`/ln_CMD_TestFolder/ "
    ls -il `pwd`/ln_CMD_TestFolder/
    echo " ln -s `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt "
    ln -s `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt
    echo " ln -f `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt "
    ln -f `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt
    echo " ls -il `pwd`/ln_CMD_TestFolder/ "
    ls -il `pwd`/ln_CMD_TestFolder/
    echo
    # Example 04 (Option -v : Output detailed information )
    echo
    echo " Option -v : Output detailed information "
    echo " ls -il `pwd`/ln_CMD_TestFolder/ "
    ls -il `pwd`/ln_CMD_TestFolder/
    echo " ln -v `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln3.txt "
    ln -v `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln3.txt
    echo " ls -il `pwd`/ln_CMD_TestFolder/ "
    ls -il `pwd`/ln_CMD_TestFolder/
    echo
    # Example End
    echo
    echo "## ln End ##"
    echo
}

ln_SymbolicLink