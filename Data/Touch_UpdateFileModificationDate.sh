#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Touch]_[UpdateFileModificationDate]
#------------------------------------------------------------
function touch_UpdateFileModificationDate(){
    echo
    echo "## touch Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : touch"
    echo " HowToUse : touch [Option] [Argument1] "
    echo "            [Argument1] : targetFile_Path "
    echo "            [Option : -t] : Modification Time Set [Argument1] before [time] "
    echo "            [Option : -r] : [Argument1] Modification Time copy, [Argument2] Modification Time paste "
    echo "            [Option : -c] : Not Exist, Do not Create "
    echo "            [Option : -m] : Modification Time Set to Current Time "
    echo "            [Option : -a] : Access Time Set to Current Time "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/touch_CMD_TestFolder/ "
    mkdir -p `pwd`/touch_CMD_TestFolder/
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : empty File Create )
    echo
    echo " Not Option : empty File Create "
    echo " touch `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile1.txt `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt "
    touch `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile1.txt `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt
    echo " ls -al `pwd`/touch_CMD_TestFolder/ "
    ls -al `pwd`/touch_CMD_TestFolder/
    echo
    # Example 02 (Option -t : Modification Time Set )
    echo
    echo " Option -t : Modification Time Set "
    echo " touch -t 202306010409 `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile1.txt "
    touch -t 202306010409 `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile1.txt
    echo " ls -al `pwd`/touch_CMD_TestFolder/ "
    ls -al `pwd`/touch_CMD_TestFolder/
    echo
    # Example 03 (Option -r : [Argument1] Modification Time copy, [Argument2] Modification Time paste )
    echo
    echo " Option -r : [Argument1] Modification Time copy, [Argument2] Modification Time paste "
    echo " touch -r `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile1.txt `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt "
    touch -r `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile1.txt `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt
    echo " ls -al `pwd`/touch_CMD_TestFolder/ "
    ls -al `pwd`/touch_CMD_TestFolder/
    echo
    # Example 04 (Option -c : Not Exist, Do not Create )
    echo
    echo " Option -c : Not Exist, Do not Create "
    echo " touch -c `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile3.txt "
    touch -c `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile3.txt
    echo " ls -al `pwd`/touch_CMD_TestFolder/ "
    ls -al `pwd`/touch_CMD_TestFolder/
    echo
    # Example 05 (Option -m : Modification Time Set to Current Time )
    echo
    echo " Option -m : Modification Time Set to Current Time "
    echo " touch -m `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile1.txt "
    touch -m `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile1.txt
    echo " ls -al `pwd`/touch_CMD_TestFolder/ "
    ls -al `pwd`/touch_CMD_TestFolder/
    echo
    # Example 06 (Option -a : Access Time Set to Current Time )
    echo
    echo " Option -a : Access Time Set to Current Time "
    echo " stat `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt "
    stat `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt
    echo
    echo " touch -a `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt "
    touch -a `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt
    echo " ls -al `pwd`/touch_CMD_TestFolder/ "
    ls -al `pwd`/touch_CMD_TestFolder/
    echo
    echo " stat `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt "
    stat `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt
    echo
    # Example End
    echo
    echo "## touch End ##"
    echo
}

touch_UpdateFileModificationDate