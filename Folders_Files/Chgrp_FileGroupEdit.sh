#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Chgrp]_[FileGroupEdit]
#------------------------------------------------------------
function chgrp_FileGroupEdit(){
    echo
    echo "## chgrp Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : chgrp"
    echo " HowToUse : chgrp [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : owner group "
    echo "            [Argument2] : tarFile_Path "
    echo "            [Option : -R] : Apply to subfolders and files as well "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/chgrp_CMD_TestFolder/ "
    mkdir -p `pwd`/chgrp_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'test apple' > `pwd`/chgrp_CMD_TestFolder/chgrp_CMD_TestFile1.txt "
    echo 'test apple' > `pwd`/chgrp_CMD_TestFolder/chgrp_CMD_TestFile1.txt
    echo " ls -l `pwd`/chgrp_CMD_TestFolder/ "
    ls -l `pwd`/chgrp_CMD_TestFolder/
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option )
    echo
    echo " sudo Chgrp admin `pwd`/chgrp_CMD_TestFolder/chgrp_CMD_TestFile1.txt "
    sudo Chgrp admin `pwd`/chgrp_CMD_TestFolder/chgrp_CMD_TestFile1.txt
    echo " ls -l `pwd`/chgrp_CMD_TestFolder/ "
    ls -l `pwd`/chgrp_CMD_TestFolder/
    echo
    # Example 02 (Option -R : Apply to subfolders and files as well )
    echo
    echo " Option -R : Apply to subfolders and files as well "
    echo " sudo Chgrp -R wheel `pwd`/chgrp_CMD_TestFolder/ "
    sudo Chgrp -R wheel `pwd`/chgrp_CMD_TestFolder/
    echo " ls -l `pwd`/ "
    ls -l `pwd`/
    echo " ls -l `pwd`/chgrp_CMD_TestFolder/ "
    ls -l `pwd`/chgrp_CMD_TestFolder/
    echo
    # Example End
    echo
    echo "## chgrp End ##"
    echo
}

chgrp_FileGroupEdit