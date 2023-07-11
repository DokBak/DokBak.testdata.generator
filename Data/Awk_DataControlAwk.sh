#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Awk]_[DataControlAwk]
#------------------------------------------------------------
function awk_DataControlAwk(){
    echo
    echo "## awk Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : awk"
    echo " HowToUse : awk [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : Pattern "
    echo "            [Argument2] : tarFile_Path "
    echo "            [Option : -f] : awk Script File Read "
    echo "            [Option : -F] : Specifying Separater "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    echo " mkdir -p `pwd`/awk_CMD_TestFolder/ "
    mkdir -p `pwd`/awk_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'Kr Korea 3324 5/11/96 50354' > `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    echo " echo 'Jp Japan 5246 15/9/66 287650' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    echo " echo 'Us USA 7654 6/20/58 60000' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    echo " echo 'Cn China 8683 9/40/48 465000' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    echo 'Kr Korea 3324 5/11/96 50354' > `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo 'Jp Japan 5246 15/9/66 287650' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo 'Us USA 7654 6/20/58 60000' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo 'Cn China 8683 9/40/48 465000' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " echo '{print \"Country : \" \$1, \$2 }' > `pwd`/awk_CMD_TestFolder/awk_CMD_Command.txt "
    echo " echo '{print \$1, \$2, \$3, \$4, \$5 }' >> `pwd`/awk_CMD_TestFolder/awk_CMD_Command.txt "
    echo '{print "Country : " $1, $2 }' > `pwd`/awk_CMD_TestFolder/awk_CMD_Command.txt
    echo '{print $1, $2, $3, $4, $5 }' >> `pwd`/awk_CMD_TestFolder/awk_CMD_Command.txt
    echo
    echo " echo 'Kr Korea :3324 5/11/96 :50354' > `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt "
    echo " echo 'Jp Japan :5246 15/9/66 :287650' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt "
    echo " echo 'Us USA :7654 6/20/58 :60000' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt "
    echo " echo 'Cn China :8683 9/40/48 :465000' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt "
    echo 'Kr    Korea   :3324    :5/11/96    :50354' > `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo 'Jp    Japan    :5246    :15/9/66    :287650' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo 'Us    USA    :7654    :6/20/58    :60000' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo 'Cn,China,:8683,:9/40/48,:465000' >> `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : ['/pattern/'] )
    echo
    echo " Not Option : ['/pattern/']  "
    echo " matching 'pattern' in file : [ awk '/pattern/' filename ] "
    echo " awk '/Korea/' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    awk '/Korea/' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    # Example 02 (Not Option : ['{print $n}'] )
    echo
    echo " Not Option : ['{print $n}'] "
    echo " print All Columns in file : [ awk '{print}' filename ] "
    echo " awk '{print}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    awk '{print}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " print All Columns in file : [ awk '{print \$0}' filename ] "
    echo " awk '{print \$0}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    awk '{print $0}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " print Second Column in file : [ awk '{print \$2}' filename ] "
    echo " awk '{print \$2}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    awk '{print $2}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    # Example 03 (Not Option : ['/pattern/{print $n, $m}'] )
    echo
    echo " Not Option : ['/pattern/{print $n, $m}'] "
    echo " matching 'pattern' print Third Column and fourth Column in file : [ awk '/pattern/{print \$3, \$4}' filename ] "
    echo " awk '/Japan/{print \$3, \$4}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    awk '/Japan/{print $3, $4}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    # Example 04 (Not Option : ['{print NR, $n }'] )
    echo
    echo " Not Option : ['{print NR, $n }'] "
    echo " Show line Number : [ awk '{print NR, \$4}' filename ] "
    echo " awk '{print NR, \$4}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    awk '{print NR, $4}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    # Example 05 (Not Option : ['{print NF, $n }'] )
    echo
    echo " Not Option : ['{print NF, $n }'] "
    echo " Show Field Count Number : [ awk '{print NF, \$0}' filename ] "
    echo " awk '{print NF, \$0}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    awk '{print NF, $0}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    # Example 06 (Not Option : Comparison of Separater )
    echo
    echo " Comparison of Separater "
    echo " awk '\$3 >=7000' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    awk '$3 >= 7000' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " awk '\$2 ~ /Kor/' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    awk '$2 ~ /Kor/' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    echo " awk '\$2 !~ /Kor/' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    awk '$2 !~ /Kor/' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    # Example 07 (Not Option : BEGIN [FS : Field Separater, OFS : Output Field Separater, ORS : Output Record Separater] )
    echo
    echo " Not Option : BEGIN [FS : Field Separater, OFS : Output Field Separater, ORS : Output Record Separater] "
    echo " awk 'BEGIN{FS=\":\"; OFS=\"\\t\"; ORS=\"\\n\\n\"}{print \$1, \$2, \$3}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    awk 'BEGIN{FS=":"; OFS="\t"; ORS="\n\n"}{print $1, $2, $3}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    # Example 08 (Option : END [Last Print])
    echo
    echo " Option : END [Last Print] "
    echo " awk 'END{print \$0 \"Test Number \" NR}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt"
    awk 'END{print $0 "Test Number " NR}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    # Example 09 (Option -f : awk Script File Read )
    echo
    echo " Option -f : awk Script File Read "
    echo " awk Script File Read "
    echo " cat `pwd`/awk_CMD_TestFolder/awk_CMD_Command.txt "
    cat `pwd`/awk_CMD_TestFolder/awk_CMD_Command.txt 
    echo " awk -f `pwd`/awk_CMD_TestFolder/awk_CMD_Command.txt `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt "
    awk -f `pwd`/awk_CMD_TestFolder/awk_CMD_Command.txt `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt
    echo
    # Example 10 (Option -F : Specifying Separater )
    echo
    echo " Option -F : Specifying Separater "
    echo " awk -F: '{print \$1, \$2, \$3}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt "
    awk -F: '{print $1, $2, $3}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo
    echo " awk -F'[:,]' '{print \$1, \$2, \$3}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt "
    awk -F'[:,]' '{print $1, $2, $3}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt
    echo
    # Example End
    echo
    echo "## awk End ##"
    echo
}

awk_DataControlAwk