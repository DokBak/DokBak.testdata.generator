#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Expr]_[ValueOperation]
#------------------------------------------------------------
function expr_ValueOperation(){
    echo
    echo "## expr Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : expr"
    echo " HowToUse : expr [Option] [Argument1] [Argument2] [Argument3] "
    echo "            [Argument1] : target_data1 "
    echo "            [Argument2] : operator "
    echo "            [Argument3] : target_data2 "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option)
    echo
    echo " Arithmetic Operation : [+], [-], [*], [/], [%]"
    echo " expr 5 '+' 3 = 8 "
    expr 5 '+' 3 # 8
    echo " expr 5 '-' 3 = 2 "
    expr 5 '-' 3 # 2
    echo " expr 5 '*' 3 = 15 "
    expr 5 '*' 3 # 15
    echo " expr 5 '/' 3 = 1 "
    expr 5 '/' 3 # 1
    echo " expr 5 '%' 3 = 2 "
    expr 5 '%' 3 # 2
    echo 
    echo " Logical Operation "
    echo " [ | : '' or '0' -> anotherData, !'' and !'0' -> firstData ] "
    echo " [ & : '' or '0' -> 0          , !'' and !'0' -> firstData ] "
    echo " expr '' '|' '3' = 3 "
    expr '' '|' '3' # 3
    echo " expr '3' '|' '' = 3 "
    expr '3' '|' '' # 3
    echo " expr '0' '|' '3' = 3 "
    expr '0' '|' '3' # 3
    echo " expr '3' '|' '0' = 3 "
    expr '3' '|' '0' # 3
    echo 
    echo " expr ' ' '|' '3' =   "
    expr ' ' '|' '3' # 
    echo " expr '3' '|' ' ' = 3 "
    expr '3' '|' ' ' # 3
    echo " expr '1' '|' '3' = 1 "
    expr '1' '|' '3' # 1 
    echo " expr '3' '|' '1' = 3 "
    expr '3' '|' '1' # 3
    echo
    echo " expr '' '&' '3' = 0 "
    expr '' '&' '3' # 0
    echo " expr '3' '&' '' = 0 "
    expr '3' '&' '' # 0
    echo " expr '0' '&' '3' = 0 "
    expr '0' '&' '3' # 0
    echo " expr '3' '&' '0' = 0 "
    expr '3' '&' '0' # 0
    echo
    echo " expr ' ' '&' '3' =  "
    expr ' ' '&' '3' # 
    echo " expr '3' '&' ' ' = 3 "
    expr '3' '&' ' ' # 3
    echo " expr '1' '&' '3' = 1 "
    expr '1' '&' '3' # 1
    echo " expr '3' '&' '1' = 3 "
    expr '3' '&' '1' # 3
    echo
    echo " Relational Operation "
    echo " expr '3' '=' '3' = 1 "
    expr '3' '=' '3' # 1
    echo " expr '0' '>' '3' = 0 "
    expr '0' '>' '3' # 0
    echo " expr '1' '>=' '3' = 0 "
    expr '1' '>=' '3' # 0
    echo " expr '2' '<' '3' = 1 "
    expr '2' '<' '3' # 1
    echo " expr '2' '<=' '3' = 1 "
    expr '2' '<=' '3' # 1
    echo " expr '2' '!=' '3' = 1 "
    expr '2' '!=' '3' # 1
    echo
    echo " Equivalent Operation "
    echo " expr 'ASD123' ':' 'ASD1' = 3 "
    expr 'ASD123' ':' 'ASD' # 3
    echo " expr 'ASD' ':' 'ASD123' = 0 "
    expr 'ASD' ':' 'ASD123' # 0
    echo
    # Example End
    echo
    echo "## expr End ##"
    echo
}

expr_ValueOperation