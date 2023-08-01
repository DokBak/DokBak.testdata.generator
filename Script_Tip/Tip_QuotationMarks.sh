#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tip]_[QuotationMarks]
#------------------------------------------------------------
function Tip_QuotationMarks(){
    echo
    echo "## QuotationMarks Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : QuotationMarks"
    echo " HowToUse : QuotationMarks : \", ', \` "
    echo
    # Basic Information End
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    echo " \" : ignoring some special characters "
    echo " Param1=\"pwd : \$#\" "
    Param1="pwd : $#"
    echo " Param1 : $Param1 "
    echo
    # Example 02
    echo
    echo " ' : ignoring all special characters "
    echo " Param1='pwd : \$#' "
    Param2='pwd : $#'
    echo " Param2 : $Param2 "
    echo
    # Example 03
    echo
    echo " \` : Outputs the results of the command "
    echo " Param1=\`pwd : \$#\` "
    Param3=`pwd : $#`
    echo " Param3 : $Param3 "
    echo
    # Example End
    echo
    echo "## QuotationMarks End ##"
    echo
}

Tip_QuotationMarks