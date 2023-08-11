#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Grep]_[StringSearch]
#------------------------------------------------------------
function grep_StringSearch(){
    echo
    echo "## grep Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : grep"
    echo " HowToUse : grep [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : Search_String "
    echo "            [Argument2] : tarFile_Path "
    echo "            [Option : -i] : Case-sensitive search "
    echo "            [Option : -v] : Outputs data from the line that not contains the search "
    echo "            [Option : -w] : Search by exact matching word units "
    echo "            [Option : -n] : The line number containing the [search word] is displayed at the beginning "
    echo "            [Option : -l] : Outputs the name of a file with at least one line matched by a pattern "
    echo "            [Option : -s] : It does not print out even if there is an error "
    echo "            [Option : -r] : Recursively search files in the directory "
    echo " Extended command : egrep "
    echo " Extended command : fgrep "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/ "
    mkdir -p `pwd`/grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile1.txt "
    echo 'TestFile1' > `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo " echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile1.txt "
    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo " echo 'Test,bash,zsh,sh'>> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile1.txt "
    echo 'Test,bash,zsh,sh'>> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo " echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile1.txt "
    echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo " echo 'TestFile2' > `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile2.txt "
    echo 'TestFile2' > `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile2.txt
    echo " echo 'iphone,ipad,imac,Test,ipod,ipodtouch' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile2.txt "
    echo 'iphone,ipad,imac,Test,ipod,ipodtouch' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile2.txt
    echo " echo 'galaxyS7,Note7,ZFilp,S7,Test' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile2.txt "
    echo 'galaxyS7,Note7,ZFilp,S7,Test' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile2.txt
    echo " echo 'TestFile3' > `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile3.t "
    echo 'TestFile3' > `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile3.t
    echo " echo 'Korea,Test,Japan,China' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile3.t "
    echo 'Korea,Test,Japan,China' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile3.t
    echo " echo 'Seoul,Tokyo,hongkong' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile3.t "
    echo 'Seoul,Tokyo,hongkong' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile3.t
    echo " echo 'TestFile4' > `pwd`/grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFile4.log "
    echo 'TestFile4' > `pwd`/grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFile4.log
    echo " echo 'ps1,ps2,ps3,ps4' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFile4.log "
    echo 'ps1,ps2,ps3,ps4' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFile4.log
    echo " echo 'psa,psa,psa,psa' > `pwd`/grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile5.log "
    echo 'psa,psa,psa,psa' > `pwd`/grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile5.log
    echo " echo 'Nintendo,NDSL,DSL,wii' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile5.log "
    echo 'Nintendo,NDSL,DSL,wii' >> `pwd`/grep_CMD_TestFolder/grep_CMD_TestFolder2/grep_CMD_TestFolder3/grep_CMD_TestFile5.log
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Outputs data from the line that contains the search )
    echo
    echo " grep 'Test' `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile1.txt "
    grep 'Test' `pwd`/grep_CMD_TestFolder/grep_CMD_TestFile1.txt
    echo
    echo " grep 'Test' `pwd`/grep_CMD_TestFolder/* "
    grep 'Test' `pwd`/grep_CMD_TestFolder/*
    echo
    echo " grep 'Test' `pwd`/grep_CMD_TestFolder/*.t "
    grep 'Test' `pwd`/grep_CMD_TestFolder/*.t
    echo
    # Example 02 (Option -i : Case-sensitive search )
    echo
    echo " Option -i : Case-sensitive search "
    echo " grep -i 'PHONE' `pwd`/grep_CMD_TestFolder/* "
    grep -i 'PHONE' `pwd`/grep_CMD_TestFolder/*
    echo
    # Example 03 (Option -v : Outputs data from the line that not contains the search )
    echo
    echo " Option -v : Outputs data from the line that not contains the search "
    echo " grep -v 'Test' `pwd`/grep_CMD_TestFolder/* "
    grep -v 'Test' `pwd`/grep_CMD_TestFolder/*
    echo
    # Example 04 (Option -w : Search by exact matching word units )
    echo
    echo " Option -w : Search by exact matching word units "
    echo " grep 'iphone' `pwd`/grep_CMD_TestFolder/* "
    grep 'phone' `pwd`/grep_CMD_TestFolder/*
    echo
    echo " grep -w 'iphone' `pwd`/grep_CMD_TestFolder/* "
    grep -w 'phone' `pwd`/grep_CMD_TestFolder/*
    echo
    # Example 05 (Option -n : The line number containing the [search word] is displayed at the beginning )
    echo
    echo " Option -n : The line number containing the [search word] is displayed at the beginning "
    echo " grep -n 'Note7' `pwd`/grep_CMD_TestFolder/* "
    grep -n 'Note7' `pwd`/grep_CMD_TestFolder/*
    echo
    # Example 06 (Option -l : Outputs the name of a file with at least one line matched by a pattern )
    echo
    echo " Option -n : Outputs the name of a file with at least one line matched by a pattern "
    echo " grep -l 'Test' `pwd`/grep_CMD_TestFolder/* "
    grep -l 'Test' `pwd`/grep_CMD_TestFolder/*
    echo
    # Example 07 (Option -s : It does not print out even if there is an error )
    echo
    echo " Option -s : It does not print out even if there is an error "
    echo " grep -s 'ipod' `pwd`/grep_CMD_TestFolder/* "
    grep -s 'ipod' `pwd`/grep_CMD_TestFolder/*
    echo
    # Example 08 (Option -r : Recursively search files in the directory )
    echo
    echo " Option -r : Recursively search files in the directory "
    echo " grep -r 'ipod' `pwd`/grep_CMD_TestFolder/* "
    grep -r 'ipod' `pwd`/grep_CMD_TestFolder/*
    echo
    # Extended commands
    echo
    echo " Extended commands : egrep "
    echo " Add MetaString 1) ^ : Line start.                                                          '^linux' "
    echo " Add MetaString 2) $ : Line end.                                                            'linux$' "
    echo " Add MetaString 3) . : One character.                                                       'l...x' "
    echo " Add MetaString 4) * : No or More characters match.                                         '*linux' "
    echo " Add MetaString 5) [ ] : Characters that match any of the characters in [].                 '[Li]inux' "
    echo " Add MetaString 6) [^ ] : characters that do not match any of the characters in [].         '[^A-KM-Z]inux' "
    echo " Add MetaString 7) + : + character that matches one or more of the preceding characters.    '[a-z] + linux' "
    echo " Add MetaString 8) ? : ? A character with or without the immediate preceding character.     'lo?ve' "
    echo " Add MetaString 9) a|b : Left or right character of |.                                      'love|hate' "
    echo " Add MetaString 10) () : The characters in () are grouped string.                           'love(able|ly)' "
    echo
    echo " Extended commands : fgrep "
    echo " Description : Regular expression meta characters are not available. Special characters and $ characters are not allowed "
    echo
    # Example End
    echo
    echo "## grep End ##"
    echo
}

grep_StringSearch