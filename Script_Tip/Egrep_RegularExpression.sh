#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Egrep]_[RegularExpression]
#------------------------------------------------------------
function egrep_RegularExpression(){
    echo
    echo "## egrep Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : egrep"
    echo " HowToUse : egrep [Argument1] "
    echo "            [Argument1] : tarFile_Path "
    echo
    # Basic Information End
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/RegularExpression_CMD_TestFolder/ "
    mkdir -p `pwd`/RegularExpression_CMD_TestFolder/
    # Preparation : Create File
    echo " date > `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt "
    date > `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt
    echo " pwd >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt "
    pwd >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt 
    echo " echo \"Testing_Date_999930212312-Print.log\" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt "
    echo "Testing_Date_999930212312-Print.log" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt
    echo " echo \"Testing_Date_493124212312-Print.log\" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt "
    echo "Testing_Date_493124212312-Print.log" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt
    echo " echo \"Testing_aDte_111930212312-Print.log\" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt "
    echo "Testing_aDte_111930212312-Print.log" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt
    echo " echo \"Testing_Date_997730212333-Print.log\" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt "
    echo "Testing_Date_997730212333-Print.log" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt
    echo " echo \"Testing_Date_995944477744-Print.log\" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt "
    echo "Testing_Date_995944477744-Print.log" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt
    echo " echo \"Date_Testing_333244777744-Print.log\" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt "
    echo "Date_Testing_333244777744-Print.log" >> `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    echo " Check the contents of a file " 
    cat `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt
    echo
    echo " [ . ] : Match only one character except newline "
    echo " cat `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt  | egrep _...._ "
    cat `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt  | egrep _...._
    echo
    echo " [ ? ] : Match the number of regular expressions that precede you with 0 or 1 regular expression "
    echo " cat `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt  | egrep _D?ate_ "
    cat `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt  | egrep _D?ate_
    echo
    echo " [ * ] : Repeated characters in a string or regular expression "
    echo " cat `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt  | egrep _*_ "
    cat `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt  | egrep _*_
    echo
    echo " [ {N} ] : Exactly {N} matches "
    echo " cat `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt  | egrep 7{3} "
    cat `pwd`/RegularExpression_CMD_TestFolder/RegularExpression_CMD_TestFile.txt  | egrep 7{3}
    echo
    # Example End
    echo
    echo "## egrep End ##"
    echo
}

egrep_RegularExpression