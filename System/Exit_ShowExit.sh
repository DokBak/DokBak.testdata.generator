#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Exit]_[ShowExit]
#------------------------------------------------------------
function exit_ShowExit(){
    echo
    echo "## exit Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : exit"
    echo " HowToUse : exit [Argument1] "
    echo "            [Argument1] : Shutdown_status_code "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " Default Shutdown status code : 0 "
    echo " sh ./Test_Sample/Test_exit.sh "
    sh ./Test_Sample/Test_exit.sh
    echo ' echo "$?" '  #0
    echo "$?"
    echo
    # Example 02 (Not Option)
    echo
    echo " Shutdown status code : 1 "
    echo " sh ./Test_Sample/Test_exit_1.sh "
    sh ./Test_Sample/Test_exit_1.sh
    echo ' echo "$?" '  #1
    echo "$?"
    echo
    # Example 03 (Not Option)
    echo
    echo " Shutdown status code : 2 "
    echo " sh ./Test_Sample/Test_exit_2.sh "
    sh ./Test_Sample/Test_exit_2.sh
    echo ' echo "$?" '  #2
    echo "$?"
    echo
    # Example 04 (Not Option)
    echo
    echo " Shutdown status code : 3 "
    echo " sh ./Test_Sample/Test_exit_3.sh "
    sh ./Test_Sample/Test_exit_3.sh
    echo ' echo "$?" '  #3
    echo "$?"
    echo
    # Example End
    echo
    echo "## exit End ##"
    echo
}

exit_ShowExit