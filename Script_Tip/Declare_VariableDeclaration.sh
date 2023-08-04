#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Declare]_[VariableDeclaration]
#------------------------------------------------------------
function declare_VariableDeclaration(){
    echo
    echo "## declare Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : declare"
    echo " HowToUse : declare [Option] [Argument1] "
    echo "            [Argument1] : Variable "
    echo "            [Option : -x] : Declared as a global variable as well "
    echo "            [Option : -r] : Register as a read-only variable[Re-registration not possible] "
    echo "            [Option : -a] : Defined by array "
    echo "            [Option : -i] : Defined as numeric -> Set "0" if non-numeric characters are specified as values "
    echo "            [Option : -f] : Show all currently defined functions [including content] "
    echo "            [Option : -F] : Show all the currently defined function name "
    echo "            [Option : -p] : Show all currently defined variables [ default ] "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Global variable values output )
    echo
    echo " declare "
    declare
    echo
    # Example 02 (Option -x : Declared as a global variable as well )
    echo
    env
    echo
    echo " declare -x DeclareVariExport=VariExport "
    declare -x DeclareVariExport=VariExport
    echo
    env
    echo
    # Example 03 (Option -r : Register as a read-only variable[Re-registration not possible] )
    echo
    echo " declare -r DeclareVariReadOnly=VariReadOnly "
    declare -r DeclareVariReadOnly=VariReadOnly
    echo " declare DeclareVariReadOnly : $DeclareVariReadOnly "
    #DeclareVariReadOnly=TestingRename
    #declare -r DeclareVariReadOnly=VariReadOnlyRename
    #echo " DeclareVariReadOnly : $DeclareVariReadOnly "
    echo
    # Example 04 (Option -a : Defined by array )
    echo
    echo " declare -a DeclareVariArray=(Text1 Text2) "
    declare -a DeclareVariArray=(Text1 Text2)
    echo " Arrayitem1 : $Arrayitem1 "
    echo " Arrayitem2 : $Arrayitem2 "
    echo " declare DeclareVariArray : Arrayitem1=${DeclareVariArray[0]}, Arrayitem2=${DeclareVariArray[1]} "
    echo " Arrayitem1 : $Arrayitem1 "
    echo " Arrayitem2 : $Arrayitem2 "
    echo
    # Example 05 (Option -i : Defined as numeric -> Set "0" if non-numeric characters are specified as values )
    echo
    echo " declare -i DeclareVariInt=152 "
    declare -i DeclareVariInt=152
    echo " declare DeclareVariInt : $DeclareVariInt "
    echo " declare -i DeclareVariString=String "
    declare -i DeclareVariString=String
    echo " declare DeclareVariString : $DeclareVariString "
    echo
    # Example 06 (Option -f : Show all currently defined functions [including content] )
    echo
    echo " declare -f "
    declare -f 
    echo " declare -f declare_VariableDeclaration"
    declare -f declare_VariableDeclaration
    echo
    # Example 07 (Option -F : Show all the currently defined function name )
    echo
    echo " declare -F "
    declare -F 
    echo
    # Example 08 (Option -p : Show all currently defined variables [ default ] )
    echo
    echo " declare -p "
    declare -p 
    echo
    # Example End
    echo
    echo "## declare End ##"
    echo
}

declare_VariableDeclaration