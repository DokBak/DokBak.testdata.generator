#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Tip]_[Parameter_ShellRunArgument]
#------------------------------------------------------------
function Tip_Parameter_ShellRunArgument(){
    echo
    echo "## parameter Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : parameter"
    echo " HowToUse : parameter [Option] [Argument1] [Argument2] ..."
    echo "            [ \$$ ] : Process ID of the current shell "
    echo "            [ \$! ] : ID of the process that was most recently run in the background "
    echo "            [ \$? ] : Shutdown status of the most recently executed foreground pipeline "
    echo "            [ \$0 ] : Name of the shell or shell script "
    echo "            [ \$_ ] : Absolute path to the executed shell "
    echo "            [ \$* ] : All Parameter( All parameters are recognized as one value when wrapped with "" : '\$*' ) "
    echo "            [ \$@ ] : All Parameter( Wrapping with "" recognizes each as a parameter value : '\$@' ) "
    echo "            [ \$1 ] : First Parameter "
    echo "            [ \${10} ] : Tenth Parameter "
    echo "            [ \$# ] : Parameter counts "
    echo
    # Basic Information End
    echo
    echo " Param1=$1 "
    Param1=$1
    echo " Param2=$2 "
    Param2=$2
    echo " Param3=$3 "
    Param3=$3
    echo " Param4=$4 "
    Param4=$4
    echo
    # Preparation End
    # Example Start
    # Example 01
    echo
    echo " [ \$$ ] : $$ "
    echo " [ \$! ] : $! "
    echo " [ \$? ] : $? "
    echo " [ \$0 ] : $0 "
    echo " [ \$_ ] : $_ "
    echo " [ \$* ] : $* "
    echo " [ \$1 ] : $1 "
    echo " [ \${10} ] : ${10} "
    echo " [ \$# ] : $# "
    echo " [ \$@ ] : $@ "
    echo
    # Example 02
    echo
    echo " \$* \$@ compare "
    echo " set 'week Sunday' Monday Tuesday "
    set 'week Sunday' Monday Tuesday
    echo
    echo " \$* Content Check "
    for i in $*; do echo $i; done
    echo " \"\$*\" Content Check "
    for i in "$*"; do echo $i; done
    echo
    echo " \$@ Content Check "
    for i in $@; do echo $i; done
    echo " \"\$@\" Content Check "
    for i in "$@"; do echo $i; done
    echo
    # Example End
    echo
    echo "## parameter End ##"
    echo
}

Tip_Parameter_ShellRunArgument 20230108 seoul tokyo 