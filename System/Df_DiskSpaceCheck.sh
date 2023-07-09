#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Df]_[DiskSpaceCheck]
#------------------------------------------------------------
function df_DiskSpaceCheck(){
    echo 
    echo "## df Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : df"
    echo " HowToUse : df [Option] [Argument1] [Argument2] ..."
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -h] : Human-readable output /1024) "
    echo "            [Option : -H] : Human-readable output /1000) "
    echo "            [Option : -l] : Only display information about locally-mounted) "
    echo "            [Option : -P] : Path Line 2 -> 1) "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " df "
    df
    echo 
    # Example 02 (Option -h : Human-readable output /1024 )
    echo
    echo " Option -h : Human-readable output /1024 "
    echo " df -h "
    df -h 
    echo
    # Example 03 (Option -H : Human-readable output /1000 )
    echo
    echo " Option -H : Human-readable output /1000 "
    echo " df -H "
    df -H 
    echo
    # Example 04 (Option -l : Only display information about locally-mounted)
    echo
    echo " Option -l : Only display information about locally-mounted "
    echo " df -l "
    df -l 
    echo
    # Example 05 (Option -P : Path Line 2 -> 1)
    echo
    echo " Option -P : Path Line 2 -> 1 "
    echo " df -P "
    df -P 
    echo
    # Example End
    echo
    echo "## df End ##"
    echo 
}

df_DiskSpaceCheck