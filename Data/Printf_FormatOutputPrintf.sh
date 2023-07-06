#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Printf]_[FormatOutputprintf]
#------------------------------------------------------------
function printf_FormatOutputprintf(){
    echo
    echo "## printf Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : printf"
    echo " HowToUse : printf [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : Pattern "
    echo "            [Argument2] : Data "
    echo "            [Option : -v] : Variable Set "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : %s [String], %f [Float], %d [Int])
    echo
    echo " printf '_%s_%f_%d_' 'test data' 15.1 15 "
    printf '_%s_%f_%d_' 'test data' 15.1 15
    echo
    # Example 02 (Not Option : %[-n]s [ Right blank ], %[+n]s [ Left blank ])
    echo
    echo " printf '_%-15s_%11s_' 'test_data' 'data_test' "
    printf '_%-15s_%11s_' 'test_data' 'data_test'
    echo
    # Example 03 (Not Option : %[n]d [ Left blank ], %0[n]d [ Left 0 ], %[n.m]f [ Int n, Float m ])
    echo 
    echo " printf '_%3d_%03d_%f_%.f_%.2f_%4.f_%6.2f_' 15 15 15.0123456 15.0123456 15.0123456 15.0123456 15.0123456 "
    printf '_%3d_%03d_%f_%.f_%.2f_%4.f_%6.2f_' 15 15 15.0123456 15.0123456 15.0123456 15.0123456 15.0123456
    echo
    # Example 04 (Not Option : \" ["], \\ [\], \a [BeapSound], \b [BackSpace], \f [Formed], \n [NewLine], \r [], \r [CarriageReturn], \t [Tap], \t [HorizonTap], \v [VerticalTap], \c [NextCharNotPrint])
    echo
    echo " printf 'S\"E' "
    printf 'S\"E'
    echo
    echo " printf 'S\\E' "
    printf 'S\\E'
    echo
    echo " printf 'S\aE' "
    printf 'S\aE'
    echo
    echo " printf 'S\bE' "
    printf 'S\bE'
    echo
    echo " printf 'S\fE' "
    printf 'S\fE'
    echo
    echo " printf 'S\nE' "
    printf 'S\nE'
    echo
    echo " printf 'S\rE' "
    printf 'S\rE'
    echo
    echo " printf 'S\tE' "
    printf 'S\tE'
    echo
    echo " printf 'S\vE' "
    printf 'S\vE'
    echo
    echo " printf 'S\cE' "
    printf 'S\cE'
    echo
    # Example 05 (Not Option -v : Variable Set)
    echo
    echo "testVariable : ${testVariable}"
    echo " printf -v testVariable 30"
    printf -v testVariable 30
    echo "testVariable : ${testVariable}"
    echo
    # Sample End
    echo
    echo "## printf End ##"
    echo
}

printf_FormatOutputprintf