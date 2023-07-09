#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Cal]_[Calendar]
#------------------------------------------------------------
function cal_Calendar(){
    echo
    echo "## cal Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : cal"
    echo " HowToUse : cal [Option] [Argument1] [Argument2] ..."
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -h] : Today HighLight Off (Defualt On) "
    echo "            [Option : -j] : Julian date (add each day from January 1st) "
    echo "            [Option : -y] : All Months from The Year) "
    echo "            [Option : -3] : Previous Month + The Month + After Month) "
    echo "            [Option : -A] : The Month + After 3 Months) "
    echo "            [Option : -B] : Previous 3 Months + The Month) "
    echo "            [Option : -N] : Matrix Transition) "
    echo "            [Option : -d] : Specified calendar output) "
    echo "            [Option : -H] : Specified calendar output + dd HighLight) "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Current Calendar )
    echo
    echo " Not Option : Current Calendar "
    echo cal
    cal
    echo " ncal -C "
    ncal -C
    echo
    # Example 02 (Option -h : Today HighLight Off (Defualt On) )
    echo
    echo " Option -h : Today HighLight Off (Defualt On) "
    echo " cal -h "
    cal -h
    echo
    # Example 03 (Option -j : Julian date (add each day from January 1st) )
    echo
    echo " Option -j : Julian date (add each day from January 1st) "
    echo " cal -j "
    cal -j
    echo
    # Example 04 (Option -y : All Months from The Year )
    echo
    echo " Option -y : All Months from The Year "
    echo " cal -y "
    cal -y
    echo
    # Example 05 (Option -3 : Previous Month + The Month + After Month )
    echo
    echo " Option -3 : Previous Month + The Month + After Month "
    echo " cal -3 "
    cal -3
    echo
    # Example 06 (Option -A 3 : The Month + After 3 Months )
    echo
    echo " Option -A 3 : The Month + After 3 Months "
    echo " cal -A 3 "
    cal -A 3
    echo
    # Example 07 (Option -B 3 : Previous 3 Months + The Month )
    echo
    echo " Option -B 3 : Previous 3 Months + The Month "
    echo " cal -B 3 "
    cal -B 3
    echo
    # Example 08 (Option -N : Matrix Transition )
    echo
    echo " Option -N : Matrix Transition "
    echo " cal -N "
    cal -N
    echo " ncal "
    ncal
    echo
    # Example 09 (Option -d : Specified calendar output )
    echo
    echo " Option -d : Specified calendar output "
    echo " cal -d 2023-05 "
    cal -d 2023-05
    echo
    # Example 10 (Option -H : Specified calendar output + dd HighLight )
    echo
    echo " Option -H : Specified calendar output + dd HighLight "
    echo " cal -H 2023-06-11 "
    cal -H 2023-06-11
    echo
    # Example End
    echo
    echo "## cal End ##"
    echo
}

cal_Calendar