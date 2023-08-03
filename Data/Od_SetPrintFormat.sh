#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Od]_[SetPrintFormat]
#------------------------------------------------------------
function od_SetPrintFormat(){
    echo
    echo "## od Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : od"
    echo " HowToUse : od [Option] [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -a  ] : When outputting ASCII characters, they are not represented by octal or hexadecimal numbers, but as real characters "
    echo "            [Option : -b  ] : Outputs in octal format "
    echo "            [Option : -c  ] : Outputs in ASCII characters "
    echo "            [Option : -d  ] : Outputs in hexadecimal "
    echo "            [Option : -x  ] : Outputs in hexadecimal, 2 bytes per line "
    echo "            [Option : -N n] : Outputs only by count bytes "
    echo "            [Option : -j n] : Skip and output skip bytes from the start of the file "
    echo "            [Option : -s n] : Specifies the offset to start the output "
    echo "            [Option : -t n] : Specifies the output format. For type, use one of the following: a (ASCII), c (ASCII character), d (decimal), o (eight), and x (hex) "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/od_CMD_TestFolder/ "
    mkdir -p `pwd`/od_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'test Data' >> `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    echo 'test Data' >> `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo " echo 'Data test' >> `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    echo 'Data test' >> `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " od `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    # Example 02 (Option -a : real characters )
    echo
    echo " od -a `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -a `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    # Example 03 (Option -b : Outputs in octal format )
    echo
    echo " od -b `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -b `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    # Example 04 (Option -c : Outputs in ASCII characters )
    echo
    echo " od -c `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -c `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    # Example 05 (Option -d : Outputs in hexadecimal )
    echo
    echo " od -d `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -d `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    # Example 06 (Option -x : Outputs in hexadecimal, 2 bytes per line )
    echo
    echo " od -x `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -x `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    # Example 07 (Option -N n : Outputs only by count bytes )
    echo
    echo " od -N 3 `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -N 3 `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    # Example 08 (Option -j n : Skip and output skip bytes from the start of the file )
    echo
    echo " od -j 3 `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -j 3 `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    # Example 09 (Option -s n : Specifies the offset to start the output )
    echo
    echo " od -s 3 `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -s 3 `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    # Example 10 (Option -t a,c,o,x : Specifies the output format. For type, use one of the following: a (ASCII), c (ASCII character), d (decimal), o (eight), and x (hex) )
    echo
    echo " od -t a `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -t a `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    echo " od -t c `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -t c `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    echo " od -t o `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -t o `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    echo " od -t x `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt "
    od -t x `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt
    echo
    # Example End
    echo
    echo "## od End ##"
    echo
}

od_SetPrintFormat