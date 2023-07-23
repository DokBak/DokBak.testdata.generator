#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [If]_[FileProperties]
#------------------------------------------------------------
function if_FileProperties(){
    echo
    echo "## if Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : if"
    echo " HowToUse : if [ condition ] then elif [ condition ] else fi "
    echo
    # Basic Information End
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/FIleProperties/ "
    mkdir -p `pwd`/FIleProperties/
    # Preparation : Create File
    echo " echo 'test apple' > `pwd`/FIleProperties/FIleProperties_1.txt "
    echo 'test apple' > `pwd`/FIleProperties/FIleProperties_1.txt
    echo " chmod 777 `pwd`/FIleProperties/FIleProperties_1.txt "
    chmod 777 `pwd`/FIleProperties/FIleProperties_1.txt
    echo " echo 'test peach' > `pwd`/FIleProperties/FIleProperties_2.txt "
    echo 'test peach' > `pwd`/FIleProperties/FIleProperties_2.txt
    echo " chmod 555 `pwd`/FIleProperties/FIleProperties_2.txt "
    chmod 077 `pwd`/FIleProperties/FIleProperties_2.txt
    echo " ls -l `pwd`/FIleProperties/ "
    ls -l `pwd`/FIleProperties/
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " -e : If the file exists, it's true "
    echo " if [ -e `pwd`/FIleProperties/FIleProperties_not.txt ] "
    if [ -e `pwd`/FIleProperties/FIleProperties_not.txt ]
    then
        echo " `pwd`/FIleProperties_not.txt file not exist "
    fi
    echo " if [ -e `pwd`/FIleProperties/FIleProperties_1.txt ] "
    if [ -e `pwd`/FIleProperties/FIleProperties_1.txt  ]
    then
        echo " `pwd`/FIleProperties_1.txt file exist "
    fi
    echo " if [ -e `pwd`/FIleProperties/ ] "
    if [ -e `pwd`/FIleProperties/ ]
    then
        echo " `pwd`/FIleProperties directory exist "
    fi
    echo 
    echo " -f : if Argument is normal file "
    echo " if [ -f `pwd`/FIleProperties/FIleProperties_not.txt ] "
    if [ -f `pwd`/FIleProperties/FIleProperties_not.txt ]
    then
        echo " Argument is not normal file "
    fi
    echo " if [ -f `pwd`/FIleProperties/FIleProperties_1.txt ] "
    if [ -f `pwd`/FIleProperties/FIleProperties_1.txt ]
    then
        echo " Argument is normal file "
    fi
    echo 
    echo " -d : If it's a folder, it's true "
    echo " if [ -d `pwd`/FIleProperties/FIleProperties_1.txt ]"
    if [ -d `pwd`/FIleProperties/FIleProperties_1.txt ]
    then
        echo " Argument is not folder "
    fi
    echo " if [ -d `pwd`/FIleProperties ]"
    if [ -d `pwd`/FIleProperties ]
    then
        echo " Argument is folder "
    fi
    echo 
    echo " -r : If you have permission to read, it's true "
    echo " if [ -r `pwd`/FIleProperties/FIleProperties_1.txt  ]"
    if [ -r `pwd`/FIleProperties/FIleProperties_1.txt  ]
    then
        echo " permission to read "
    fi
    echo " if [ -r `pwd`/FIleProperties/FIleProperties_2.txt  ]"
    if [ -r `pwd`/FIleProperties/FIleProperties_2.txt  ]
    then
        echo " permission to read "
    fi
    echo 
    echo " -w : If you have permission to write, it's true "
    echo " if [ -w `pwd`/FIleProperties/FIleProperties_1.txt  ]"
    if [ -w `pwd`/FIleProperties/FIleProperties_1.txt  ]
    then
        echo " permission to write "
    fi
    echo " if [ -w `pwd`/FIleProperties/FIleProperties_2.txt  ]"
    if [ -w `pwd`/FIleProperties/FIleProperties_2.txt  ]
    then
        echo " permission to write "
    fi
    echo 
    echo " -x : If you have permission to run, it's true "
    echo " if [ -x `pwd`/FIleProperties/FIleProperties_1.txt  ]"
    if [ -x `pwd`/FIleProperties/FIleProperties_1.txt  ]
    then
        echo " permission to run "
    fi
    echo " if [ -x `pwd`/FIleProperties/FIleProperties_2.txt  ]"
    if [ -x `pwd`/FIleProperties/FIleProperties_2.txt  ]
    then
        echo " permission to run "
    fi
    echo
    # Example End
    echo
    echo "## if End ##"
    echo
}

if_FileProperties