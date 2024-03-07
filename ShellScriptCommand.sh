#!/bin/sh

###################################################################################
#                                                                                 #
#  Shell Name  : Reference Shell                                                  #
#                                                                                 #
#  Creater     : DokBak                                                           #
#  Create Date : 2024/2/21          New                                           #
#  Modify Date :                                                                  #
#                                                                                 #
#  Processing Overview : Reference Shell for Writing a Shell Script               #
#                                                                                 #
#  Parameter   :                                                                  #
#     Parameter1  (optional) : Command                                            #
#     Parameter2  (optional) : Language                                           #
#                                                                                 #
###################################################################################
#                                                                                 #
#  쉘  이름      : 참조 쉘                                                          　#
#                                                                                 #
#  작 성 자      : DokBak                                                        　　#
#  작 성 일      : 2024/2/21          신규 작성                                       #
#  수 정 일      :                                                               　　#
#                                                                                 #
#  처리 개요      : 쉘 스크립트 작성을 위한 참조 쉘                                       　#
#                                                                                 #
#  파라미터       :                                                             　　　#
#     파라미터1  (옵션) : 명령어                                                       #
#     파라미터2  (옵션) : 언어                                                       　#
#                                                                                 #
###################################################################################
#                                                                                 #
#  スクリプト名    : 参照シェル                                                         #
#                                                                                 #
#  作成者        : DokBak                                                        　　#
#  作成日        : 2024/2/21          新規作成                                        #
#  修正日        :                                                               　　#
#                                                                                 #
#  処理概要      : シェルスクリプト作成に参考できる参照シェル                                 　#
#                                                                                 #
#  パラメータ     :                                                               　　#
#     パラメータ1  (任意) : 言語                                                       #
#     パラメータ2  (任意) : 命令語                                                   　　#
#                                                                                 #
###################################################################################

#--------------------------------------------#
# Basic Setting(Start Run Time)              #
#  : Shell Start Running Time                #
#  : 쉘 기동 시작 시간 출력                       #
#  : シェル起動開始時間出力                        #
#--------------------------------------------#
function func_basicSetting_StartingRunTime() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local languageParam=$1
    
    local functionOutput=""

    ### RunDate / 실행시간 / 実行日
    sys_YYYYMMDDhhmmss=`date +%Y%m%d%H%M%S`
    sys_YYYY=${sys_YYYYMMDDhhmmss:0:4}
    sys_MM=${sys_YYYYMMDDhhmmss:4:2}
    sys_DD=${sys_YYYYMMDDhhmmss:6:2}
    sys_hh=${sys_YYYYMMDDhhmmss:8:2}
    sys_mm=${sys_YYYYMMDDhhmmss:10:2}
    sys_ss=${sys_YYYYMMDDhhmmss:12:2}

    ### Shell start time / 쉘 시작 시간 / シェル開始時間
    if [[ ${languageParam} == [eE][nN] ]]; then
        functionOutput="### Shell Running Time：${sys_YYYY}-${sys_MM}-${sys_DD} ${sys_hh}:${sys_mm}:${sys_ss} ###"
    elif [[ ${languageParam} == [kK][rR] ]]; then
        functionOutput="### 쉘 기동 시작 시간：${sys_YYYY}년${sys_MM}월${sys_DD}일 ${sys_hh}시${sys_mm}분${sys_ss}초 ###"
    elif [[ ${languageParam} == [jJ][pP] ]]; then
        functionOutput="### シェル起動開始時間：${sys_YYYY}年${sys_MM}月${sys_DD}日 ${sys_hh}時${sys_mm}分${sys_ss}秒 ###"
    else
        functionOutput="### Shell Running Time：${sys_YYYY}-${sys_MM}-${sys_DD} ${sys_hh}:${sys_mm}:${sys_ss} ###"
    fi

    ### Result print / 결과 출력 / 結果出力
    echo ${functionOutput}

}

#--------------------------------------------#
# Basic Setting(LogFileName_Path)            #
#  : LogFile Name & Path Set                 #
#  : 로그 파일 이름 및 경로 설정                   #
#  : ログファイル名及びパス設定                     #
#--------------------------------------------#
function func_basicSetting_LogFileName_Path() {
    
    ### ShellScript relativePath / 쉘 스크립트 풀패스 / シェルスクリプトフルパス
    local fileRelativePath=$0
    ### relativePath -> AbsolutePath / 상대경로 -> 절대경로 / 相対パス -> 絶対パス
    local fileAbsolutePath=$(realpath "$fileRelativePath")
    ### ShellScript Name / 쉘 스크립트 이름 / シェルスクリプト名
    scriptName=$(basename $0)
    ### FilePath / 파일 패스 / ファイルパス
    filePath=${fileAbsolutePath%/*}/
    ### LogPath / 로그 패스 / ログパス
    logPath=${fileAbsolutePath%/*}/log/
    ### ProcessID / 프로세스ID / プロセスID
    PID=$1
    ### StartEndflg / 시작종료flg / 開始終了flg
    local startEndflg=$2
    ### Command Parameter / 명령어 파라미터 / コマンドパラメータ
    local searchCommandParam=$3

    ### Directory or File exists check / 디렉토리 또는 파일 존재 체크 / ディレクトリ又はファイル存在チェック
    if [ -e "${logPath}" ]; then
        logFilePath=""
    else
        mkdir -p ${logPath}
    fi

    ### logFileName Set / 로그 파일명 설정 / ログファイル名
    logFilePath=${logPath%/}/shellCommand_`date +%Y%m%d`.log
    commandLogFilePath=${logPath%/}/shellCommand_${searchCommandParam}_`date +%Y%m%d`.log

    ### log Print / 로그 출력 / ログファイル出力
    if [ ${startEndflg} -eq 0 ]; then
        echo "### `date +%Y/%m/%d-%H:%M:%S` [${PID}] ${scriptName} >>> START "
        echo "### `date +%Y/%m/%d-%H:%M:%S` [${PID}] ${scriptName} >>> START " >> ${logFilePath}
        if [ ! -z ${searchCommandParam} ];then
            echo "### `date +%Y/%m/%d-%H:%M:%S` [${PID}] ${scriptName} >>> ${searchCommandParam} START " >> ${commandLogFilePath}
        fi
    else
        echo "### `date +%Y/%m/%d-%H:%M:%S` [${PID}] ${scriptName} >>> END "
        echo "### `date +%Y/%m/%d-%H:%M:%S` [${PID}] ${scriptName} >>> END " >> ${logFilePath}
        if [ ! -z ${searchCommandParam} ];then
            echo "### `date +%Y/%m/%d-%H:%M:%S` [${PID}] ${scriptName} >>> ${searchCommandParam} END " >> ${commandLogFilePath}
        fi
    fi

}

#--------------------------------------------#
# How To Use                                 #
#  : How to use                              #
#  : 사용법                                  　#
#  : 使用法                                    #
#--------------------------------------------#
function func_howToUse() {

    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local languageParam=$1

    if [[ ${languageParam} == [kK][rR] ]];then
        echo 
        echo "##############################################################################################"
        echo
        echo "  이 쉘의 기본 설정 언어는 영어입니다. "
        echo "  지원 언어 : 영어(en), 한국어(kr), 일본어(jp) "
        echo "  사용법   : sh [Shell Scrip Directory Path]/ShellScriptCommand.sh [Command] [Language] "
        echo
        echo "  예시    : sh ./ShellScriptCommand.sh "
        echo "         : sh ./ShellScriptCommand.sh cp "
        echo "         : sh ./ShellScriptCommand.sh cat kr "
        echo
        echo "##############################################################################################"
    elif [[ ${languageParam} == [jJ][pP] ]];then
        echo 
        echo "##############################################################################################"
        echo
        echo "  このシェルの基本言語は英語です。 "
        echo "  支援言語 : 英語(en), 韓国語(kr), 日本語(jp) "
        echo "  使用法   : sh [Shell Scrip Directory Path]/ShellScriptCommand.sh [Command] [Language] "
        echo
        echo "  例      : sh ./ShellScriptCommand.sh "
        echo "         : sh ./ShellScriptCommand.sh cp "
        echo "         : sh ./ShellScriptCommand.sh cat kr "
        echo
        echo "##############################################################################################"
    else
        echo 
        echo "##############################################################################################"
        echo
        echo "  Default language for this shell script is English "
        echo "  Support language : English(en), Korean(kr), Japense(jp) "
        echo "  How To Use : sh [Shell Scrip Directory Path]/ShellScriptCommand.sh [Command] [Language] "
        echo
        echo "  Sample : sh ./ShellScriptCommand.sh "
        echo "         : sh ./ShellScriptCommand.sh cp "
        echo "         : sh ./ShellScriptCommand.sh cat kr "
        echo
        echo "##############################################################################################"
    fi

}

#--------------------------------------------#
# Support Language                           #
#  : support language                        #
#  : 지원 언어                                  #
#  : 支援言語                                   #
#--------------------------------------------#
function func_supportLanguage() {

    echo
    echo "##############################################################################################"
    echo
    echo "  Support language : English(en), Korean(kr), Japense(jp) "
    echo "    ( Parameter2 )  "
    echo
    echo "##############################################################################################"
    echo

}

#--------------------------------------------#
# Main Menu                                  #
#  : Main Menu Print                         #
#  : 메인 메뉴 출력                            　#
#  : メインメニュー出力                           #
#--------------------------------------------#
function func_mainMenu() {

    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local languageParam=$1

    ### Function Main Logic / 함수 메인 로직 / 関数メインロジック
    while true
    do
        if [[ ${languageParam} == [kK][rR] ]];then
            echo
            printf "  ******************************\n"
            printf "  *%18s%12s*\n"                     "메뉴"
            printf "  ******************************\n"
            printf "  * %-31s*\n"                       "1. 언어 선택"
            printf "  * %-36s*\n"                       "2. 리눅스 명령어 리스트"
            printf "  * %-36s*\n"                       "3. 스크립트 작성 도움말"
            printf "  *                            *\n"
            printf "  * %-29s*\n"                       "9. 종료"
            printf "  ******************************\n"
            echo 
            read -p " 메뉴 선택 : " selectMenu
            echo
        elif [[ ${languageParam} == [jJ][pP] ]]; then
            echo
            printf "  ******************************\n"
            printf "  *%22s%10s*\n"                     "メニュー"
            printf "  ******************************\n"
            printf "  * %-31s*\n"                       "1. 言語選択"
            printf "  * %-39s*\n"                       "2. リナックスコマンドリスト"
            printf "  * %-36s*\n"                       "3. スクリプトのヘルプ"
            printf "  *                            *\n"
            printf "  * %-29s*\n"                       "9. 終了"
            printf "  ******************************\n"
            echo 
            read -p " メニュー選択 : " selectMenu
            echo
        else
            echo
            printf "  ******************************\n"
            printf "  *%16s%12s*\n"                     "MENU"
            printf "  ******************************\n"
            printf "  * %-27s*\n"                       "1. Select Language"
            printf "  * %-27s*\n"                       "2. List of Linux Commands"
            printf "  * %-27s*\n"                       "3. Helping For Script"
            printf "  *                            *\n"
            printf "  * %-27s*\n"                       "9. End"
            printf "  ******************************\n"
            echo 
            read -p " Select Menu : " selectMenu
            echo
        fi

        ### Parameter exist / 파라미터가 존재 / パラメータが存在
        if [[ ${selectMenu} == 1 ]]; then
            break
        elif [[ ${selectMenu} == 2 ]]; then
            break
        elif [[ ${selectMenu} == 3 ]]; then
            break
        elif [[ ${selectMenu} == 9 ]]; then
            break
        else
            clear
            if [[ ${languageParam} == [kK][rR] ]]; then
                echo
                printf "%s\n" "### 선택 가능한 메뉴(번호) : 1, 2, 3, 9 ###"
            elif [[ ${languageParam} == [jJ][pP] ]]; then
                echo
                printf "%s\n" "### 選択可能なメニュー(番号) : 1, 2, 3, 9 ###"
            else
                echo
                printf "%s\n" "### Selectable menu (number): 1, 2, 3, 9 ###"
            fi
        fi
    done

}

#--------------------------------------------#
# Script End                                 #
#  : Shell Script Close                      #
#  : 쉘 스크립트 종료                           　#
#  : シェルスクリプト終了                          #
#--------------------------------------------#
function func_scriptEnd() {

    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local languageParam=$1

    clear

    ### Shell Script End / 쉘 스크립트 종료 / シェルスクリプト終了
    if [[ ${languageParam} == [kK][rR]  ]];then
        echo
        printf "  ******************************\n"
        printf "  *                            *\n"
        printf "  * %36s%2s*\n"                     "사용해주셔서 감사합니다"
        printf "  * %17s%10s*\n"                    "[DokBak]"
        printf "  *                            *\n"
        printf "  ******************************\n"
        echo
        break
    elif [[ ${languageParam} == [jJ][pP]  ]];then
        echo
        printf "  ******************************\n"
        printf "  *                            *\n"
        printf "  * %19s%1s*\n"                     "ご利用ありがとうございます"
        printf "  * %17s%10s*\n"                    "[DokBak]"
        printf "  *                            *\n"
        printf "  ******************************\n"
        echo
        break
    else
        echo
        printf "  ******************************\n"
        printf "  *                            *\n"
        printf "  * %22s%5s*\n"                     "Thank you for Using"
        printf "  * %17s%10s*\n"                    "[DokBak]"
        printf "  *                            *\n"
        printf "  ******************************\n"
        echo
        break
    fi
    
}

#--------------------------------------------#
# Select Language                            #
#  : Output Language Select                  #
#  : 출력 언어 선택                            　#
#  : 出力言語出力                               #
#--------------------------------------------#
function func_selectLanguage() {

    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local languageParam=$1

    ### Function Main Logic / 함수 메인 로직 / 関数メインロジック
    while true
    do
        if [[ ${languageParam} == [kK][rR] ]];then
            echo
            printf "  ******************************\n"
            printf "  * %22s%9s*\n"                     "언어 선택"
            printf "  ******************************\n"
            printf "  * %-29s*\n"                       "1. 영어(en)"
            printf "  * %-30s*\n"                       "2. 한국어(kr)"
            printf "  * %-30s*\n"                       "3. 일본어(jp)"
            printf "  *                            *\n"
            printf "  * %-31s*\n"                       "9. 이전메뉴"
            printf "  ******************************\n"
            echo 
            read -p " 출력 언어를 선택해주세요. : " selectLanguage
            echo
        elif [[ ${languageParam} == [jJ][pP] ]]; then
            echo
            printf "  ******************************\n"
            printf "  * %22s%9s*\n"                     "言語選択"
            printf "  ******************************\n"
            printf "  * %-29s*\n"                       "1. 英語(en)"
            printf "  * %-30s*\n"                       "2. 韓国語(kr)"
            printf "  * %-30s*\n"                       "3. 日本語(jp)"
            printf "  *                            *\n"
            printf "  * %-33s*\n"                       "9. 前のメニュー"
            printf "  ******************************\n"
            echo 
            read -p " 出力言語を選択ください。 : " selectLanguage
            echo
        else
            echo
            printf "  ******************************\n"
            printf "  * %22s%5s*\n"                     "Select Language"
            printf "  ******************************\n"
            printf "  * %-27s*\n"                       "1. English(en)"
            printf "  * %-27s*\n"                       "2. Korean(kr)"
            printf "  * %-27s*\n"                       "3. Japense(jp)"
            printf "  *                            *\n"
            printf "  * %-27s*\n"                       "9. Previous Menu"
            printf "  ******************************\n"
            echo 
            read -p " Select Language. : " selectLanguage
            echo
        fi

        ### Parameter exist / 파라미터가 존재 / パラメータが存在
        if [[ ${selectLanguage} == 1 || ${selectLanguage} == [eE][nN] ]]; then
            clear
            languageParam="en"
            ouputLanguage="en"
            break
        elif [[ ${selectLanguage} == 2 || ${selectLanguage} == [kK][rR] ]]; then
            clear
            languageParam="kr"
            ouputLanguage="kr"
            break
        elif [[ ${selectLanguage} == 3 || ${selectLanguage} == [jJ][pP] ]]; then
            clear
            languageParam="jp"
            ouputLanguage="jp"
            break
        else
            clear
            if [[ ${languageParam} == [kK][rR] ]]; then
                echo
                printf "%s%s\n" "### 출력 언어를 선택해주세요. (대소문자 구분없음 : " "en, kr, jp ) ###"
                printf "%s%36s\n" "### 출력 번호를 선택해주세요. (" "1,  2,  3 ) ###"
            elif [[ ${languageParam} == [jJ][pP] ]]; then
                echo
                printf "%s%s\n" "### 出力言語を選択してください. (大小文字区別無し : " "en, kr, jp ) ###"
                printf "%s%35s\n" "### 出力番号を選択してください. (" "1,  2,  3 ) ###"
            else
                echo
                printf "%s%s\n" "### Please check the language. (case-insensitive : " "en, kr, jp ) ###"
                printf "%s%35s\n" "### Please check the Number.   (" "1,  2,  3 ) ###"
            fi
        fi

        if [ ${selectLanguage} = 9 ]; then
            clear
            break
        fi
    done

}

#--------------------------------------------#
# Linux Commands List                        #
#  : Included Linux Commands List            #
#  : 포함된 리눅스 명령어 리스트                    #
#  : 含まれているLinuxコマンドリスト                 #
#--------------------------------------------#
function func_linuxCommandsList() {
    
    ### Command Existed Check　Flg / 명령 존재 확인 플래그 / コマンド存在チェックフラグ
    local existCheckParam=$1
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local languageParam=$2

    ### Function Main Logic / 함수 메인 로직 / 関数メインロジック
    Index=0
    echo
    printf "##############################################################################################\n"
    if [[ ${languageParam} == [kK][rR] ]]; then
        printf "  %-8s %s  %-18s %s  %-102s\n" "번호" "#" "명령어" "#" "설명"
        printf "##############################################################################################\n"
        for commandIndex in ${commandList[@]}; do
            printf "  %03d    %s  %-15s %s  %-100s\n" $((${Index}+1)) "#" ${commandList[${Index}]} "#" ${commandDescriptionKr[${Index}]} | sed 's/_/ /g'
            Index=$(( ${Index} + 1 ))
        done
    elif [[ ${languageParam} == [jJ][pP] ]]; then
        printf "  %-8s %s  %-19s %s  %-102s\n" "番号" "#" "コマンド" "#" "説明"
        printf "##############################################################################################\n"
        for commandIndex in ${commandList[@]}; do
            printf "  %03d    %s  %-15s %s  %-100s\n" $((${Index}+1)) "#" ${commandList[${Index}]} "#" ${commandDescriptionJp[${Index}]} | sed 's/_/ /g'
            Index=$(( ${Index} + 1 ))
        done
    else
        printf "  %-6s %s  %-15s %s  %-100s\n" "Number" "#" "Command" "#" "Description"
        printf "##############################################################################################\n"
        for commandIndex in ${commandList[@]}; do
            printf "  %03d    %s  %-15s %s  %-100s\n" $((${Index}+1)) "#" ${commandList[${Index}]} "#" ${commandDescriptionEn[${Index}]} | sed 's/_/ /g'
            Index=$(( ${Index} + 1 ))
        done
    fi
    printf "##############################################################################################\n"
    echo
    if [[ ${existCheckParam} == 1 ]];then
        if [[ ${languageParam} == [kK][rR] ]];then
            read -p " 검색 명령어 (취소:C) : " searchCommand
        elif [[ ${languageParam} == [jJ][pP] ]];then
            read -p " 検索コマンド (取り消し:C) : " searchCommand
        else
            read -p " Search Command (Cancel:C) : " searchCommand
        fi

        if [[ ${searchCommand} == [cC] || ${searchCommand} == [cC][aA][nN][cC][eE][lL] ]];then
            searchCommand=""
            break
        fi
    else
        break
    fi

    #Debug Check Code
    #"#echo "func_linuxCommandsList Check"
    #"#echo "existCheckParam=${existCheckParam}"
    #"#echo "languageParam=${languageParam}"
    #"#echo "languageParam=${languageParam}"

}

#--------------------------------------------#
# Linux Commands Exist Check                 #
#  : Included Linux Commands Exist Check     #
#  : 포함된 리눅스 명령어 존재 체크                 #
#  : 含まれているLinuxコマンド存在チェック            #
#--------------------------------------------#
function func_linuxCommandsExistCheck() {

    ### Command List Array / 명령어 리스트 배열 / コマンドリスト配列
    local commandListParam=(${commandList[@]})
    
    ### Command List Array Length / 명령어 리스트 배열 길이 / コマンドリスト配列長
    local commandListArrayLength="${#commandList[@]}"

    ### Command Parameter / 명령어 파라미터 / コマンドパラメータ
    local searchCommandParam=$1

    ### Command Exist Check Flg / 명령어 존재 체크 플래그 / コマンド存在チェックフラグ
    existCheck=0

    ### Command Array Index / 명령어 리스트 인덱스 / コマンド配列インデックス
    commandItemIndex=0
    for commandItem in ${commandListParam[@]}; do
        if [[ ${commandItem} == ${searchCommandParam} ]];then
            existCheck=1
            break
        fi
        commandItemIndex=$(( ${commandItemIndex} + 1 ))
    done

    #Debug Check Code
    #"#echo "func_linuxCommandsExistCheck Check"
    #"#echo "commandListParam=${commandListParam[@]}"
    #"#echo "commandListArrayLength=${commandListArrayLength}"
    #"#echo "searchCommandParam=${searchCommandParam}"

}

#--------------------------------------------#
# Not Exist Command                          #
#  : Not Exist Command                       #
#  : 존재하지 않는 명령어                         #
#  : 存在しないコマンド                           #
#--------------------------------------------#
function func_notExistCommand() {
    

    ### Command Parameter / 명령어 파라미터 / コマンドパラメータ
    local searchCommandParam=$1
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$2

    ### Exist Check Parameter / 존재 체크 파라미터 / 存在チェックパラメータ
    local existCheckParam=$3

    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        echo "##############################################################################################"
        echo
        echo "  해당 명령어(${searchCommandParam})는 포함되어 있지 않습니다. "
        echo "    ( 파라미터1 )  "
        func_linuxCommandsList ${existCheckParam} ${ouputLanguageParam}
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        echo "##############################################################################################"
        echo
        echo "  ごのコマンド(${searchCommandParam})は含まれていません。"
        echo "    ( パラメータ1 )  "
        func_linuxCommandsList ${existCheckParam} ${ouputLanguageParam}
    else
        func_howToUse ${ouputLanguageParam}
        echo
        echo "  The Command(${searchCommandParam}) not included. "
        echo "    ( Parameter1 )  "
        func_linuxCommandsList ${existCheckParam} ${ouputLanguageParam}
    fi

    #Debug Check Code
    #"#echo "func_notExistCommand Check"
    #"#echo "searchCommandParam=${searchCommandParam}"
    #"#echo "ouputLanguageParam=${ouputLanguageParam}"
    #"#echo "existCheckParam=${existCheckParam}"

}

#--------------------------------------------#
# Linux Command Example                      #
#  : Linux Command Example                   #
#  : 리눅스 명령어 예                            #
#  : Linuxコマンド例                            #
#--------------------------------------------#
function func_linuxCommandExample() {

    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### FilePath / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### Array Index / 배열 인덱스 파라미터 / 配列インデックスパラメータ
    local commandItemIndex=$3

    clear
    echo
    case ${commandList[${commandItemIndex}]} in
        cat)
            func_command_cat ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        expr)
            func_command_expr ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        sleep)
            func_command_sleep ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        gunzip)
            func_command_gunzip ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        gzip)
            func_command_gzip ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        zip)
            func_command_zip ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        unzip)
            func_command_unzip ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        date)
            func_command_date ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        cal)
            func_command_cal ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        wc)
            func_command_wc ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        uniq)
            func_command_uniq ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        touch)
            func_command_touch ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        head)
            func_command_head ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        tail)
            func_command_tail ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        cd)
            func_command_cd ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        chgrp)
            func_command_chgrp ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        chmod)
            func_command_chmod ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        chown)
            func_command_chown ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        pwd)
            func_command_pwd ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        mkdir)
            func_command_mkdir ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        rmdir)
            func_command_rmdir ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        rm)
            func_command_rm ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        mv)
            func_command_mv ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        cp)
            func_command_cp ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        cut)
            func_command_cut ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        dd)
            func_command_dd ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        diff)
            func_command_diff ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        find)
            func_command_find ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        clear)
            func_command_clear ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        man)
            func_command_man ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        df)
            func_command_df ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        du)
            func_command_du ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        history)
            func_command_history ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]} ${commandList[${commandItemIndex}]}
            ;;
        *)  echo ; 
            if [[ ${ouputLanguageParam} == [kK][rR] ]];then
                echo " 에러 : 명령어 함수 미포함 (func_command_${commandList[${commandItemIndex}]})"; 
            elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
                echo " エラー : コマンド関数を含まない (func_command_${commandList[${commandItemIndex}]})"; 
            else
                echo " ERROR : Command_Function Not Included (func_command_${commandList[${commandItemIndex}]})"; 
            fi
            echo ; # default
    esac
    
    while true
    do
        if [[ ${ouputLanguageParam} == [kK][rR] ]];then
            read -p " 메인메뉴[Y] / 재검색[N/C] : " previousMenu
        elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
            read -p " メインメニュー[Y] / 再検索[N/C] : " previousMenu
        else
            read -p " Main Menu[Y] / Re-searching[N/C] : " previousMenu
        fi

        if [[ ${previousMenu} == [yY] || ${previousMenu} == [yY][eE][sS] ]];then
            clear
            searchCommand=""
            break 2
        elif [[ ${previousMenu} == [nN] || ${previousMenu} == [nN][oO] || ${previousMenu} == [cC] || ${previousMenu} == [cC][aA][nN][cC][eE][lL] ]];then
            clear
            searchCommand=""
            break
        fi
    done

    #Debug Check Code
    #"#echo "func_linuxCommandExample Check"
    #"#echo "ouputLanguageParam=${ouputLanguageParam}"
    #"#echo "filePathParam=${filePathParam}"
    #"#echo "commandItemIndex=${commandItemIndex}"
    #"#echo "commandList[${commandItemIndex}]=${commandList[${commandItemIndex}]}"

}

#--------------------------------------------#
# Command : cat                              #
#--------------------------------------------#
function func_command_cat() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    echo "testFile,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo "" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo "File,Command,data\t" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo "" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo "" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo "" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo "Command,date" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-benst]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[파일경로]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-benst]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[ファイルパス]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-benst]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[filePath]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "옵션" ":" "없음"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data"
            echo ""
            echo "File,Command,data\t"
            echo ""
            echo ""
            echo ""
            echo "Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cat -b ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "옵션" ":" "b"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "공백이 아닌 라인의 라인 번호를 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "     1  testFile,Command,data"
            echo ""
            echo "     2  File,Command,data\t"
            echo ""
            echo ""
            echo ""
            echo "     3  Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cat -b ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -b ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cat -n ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "옵션" ":" "n"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "모든 라인을 라인 번호로 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "     1  testFile,Command,data"
            echo "     2"
            echo "     3  File,Command,data\t"
            echo "     4"
            echo "     5"
            echo "     6"
            echo "     7  Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cat -n ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -n ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cat -e ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "옵션" ":" "e"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "모든 행 끝에 [$] 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data$"
            echo "$"
            echo "File,Command,data\t$"
            echo "$"
            echo "$"
            echo "$"
            echo "Command,date$"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cat -e ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -e ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cat -s ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "옵션" ":" "s"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "연속된 빈 줄을 압축하여 한 줄로 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data"
            echo ""
            echo "File,Command,data\t"
            echo ""
            echo "Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cat -s ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -s ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cat -t ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "옵션" ":" "t"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "탭 문자열 "^I"로 대체되어 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data"
            echo ""
            echo "File,Command,data^I"
            echo ""
            echo ""
            echo ""
            echo "Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cat -t ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -t ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "オプション" ":" "無"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" 
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data"
            echo ""
            echo "File,Command,data\t"
            echo ""
            echo ""
            echo ""
            echo "Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cat -b ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "オプション" ":" "b"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "空白ではない行の前に行番号を出力します"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "     1  testFile,Command,data"
            echo ""
            echo "     2  File,Command,data\t"
            echo ""
            echo ""
            echo ""
            echo "     3  Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cat -b ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -b ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cat -n ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "オプション" ":" "n"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "すべての行を行番号を出力します"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "     1  testFile,Command,data"
            echo "     2"
            echo "     3  File,Command,data\t"
            echo "     4"
            echo "     5"
            echo "     6"
            echo "     7  Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cat -n ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -n ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cat -e ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "オプション" ":" "e"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "すべての行の末尾に[$]を出力します"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data$"
            echo "$"
            echo "File,Command,data\t$"
            echo "$"
            echo "$"
            echo "$"
            echo "Command,date$"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cat -e ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -e ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cat -s ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "オプション" ":" "s"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "連続する空白行を圧縮し、1行として出力します"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data"
            echo ""
            echo "File,Command,data\t"
            echo ""
            echo "Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cat -s ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -s ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cat -t ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "オプション" ":" "t"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "タブ文字列を"^I"に置き換えられ、出力されます"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data"
            echo ""
            echo "File,Command,data^I"
            echo ""
            echo ""
            echo ""
            echo "Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cat -t ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -t ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-10s %s %-15s\n" "Option" ":" "Not"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data"
            echo ""
            echo "File,Command,data\t"
            echo ""
            echo ""
            echo ""
            echo "Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cat -b ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-10s %s %-15s\n" "Option" ":" "b"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Outputs a line number in front of a line that is not blank"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "     1  testFile,Command,data"
            echo ""
            echo "     2  File,Command,data\t"
            echo ""
            echo ""
            echo ""
            echo "     3  Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cat -b ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -b ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cat -n ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-10s %s %-15s\n" "Option" ":" "n"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Print out all lines with line numbers"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "     1  testFile,Command,data"
            echo "     2"
            echo "     3  File,Command,data\t"
            echo "     4"
            echo "     5"
            echo "     6"
            echo "     7  Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cat -n ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -n ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cat -e ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-10s %s %-15s\n" "Option" ":" "e"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Print a [$] at the end of all lines"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data$"
            echo "$"
            echo "File,Command,data\t$"
            echo "$"
            echo "$"
            echo "$"
            echo "Command,date$"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cat -e ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -e ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cat -s ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-10s %s %-15s\n" "Option" ":" "s"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Compresses consecutive blank lines and outputs them as a single line"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data"
            echo ""
            echo "File,Command,data\t"
            echo ""
            echo "Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cat -s ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -s ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cat -t ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-10s %s %-15s\n" "Option" ":" "t"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "tab string is replaced with a string "^I" and outputted"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "testFile,Command,data"
            echo ""
            echo "File,Command,data^I"
            echo ""
            echo ""
            echo ""
            echo "Command,date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cat -t ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            cat -t ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"
    
    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/
    
    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : expr                             #
#--------------------------------------------#
function func_command_expr() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[인수1]_[연산자]_[인수2]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[숫자1]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※연산자" ":" "[+,-,/,*,%,>,>=,=,<=,<]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수2" ":" "[숫자2]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[引数1]_[演算子]_[引数2]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[数字1]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※演算子" ":" "[+,-,/,*,%,>,>=,=,<=,<]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数2" ":" "[数字2]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[argument1]_[Operator]_[argument2]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[number1]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※Operator" ":" "[+,-,/,*,%,>,>=,=,<=,<]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument2" ":" "[number2]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "expr '5' '+' '2'"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "expr '5' '-' '2'"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "expr '5' '/' '2'"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "expr '5' '*' '2'"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "expr '5' '%' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "산술연산"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "7"
            echo "3"
            echo "2"
            echo "10"
            echo "1"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "expr '5' '+' '2'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "expr '5' '-' '2'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "expr '5' '/' '2'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "expr '5' '*' '2'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "expr '5' '%' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            expr '5' '+' '2'
            expr '5' '-' '2'
            expr '5' '/' '2'
            expr '5' '*' '2'
            expr '5' '%' '2'
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "expr '5' '>' '2'"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "expr '5' '>=' '2'"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "expr '5' '=' '2'"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "expr '5' '<=' '2'"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "expr '5' '<' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "관계연산"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "1"
            echo "1"
            echo "0"
            echo "0"
            echo "0"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "expr '5' '>' '2'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "expr '5' '>=' '2'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "expr '5' '=' '2'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "expr '5' '<=' '2'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "expr '5' '<' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            expr '5' '>' '2'
            expr '5' '>=' '2'
            expr '5' '=' '2'
            expr '5' '<=' '2'
            expr '5' '<' '2'
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "expr '5' '+' '2'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "expr '5' '-' '2'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "expr '5' '/' '2'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "expr '5' '*' '2'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "expr '5' '%' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "算術演算"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "7"
            echo "3"
            echo "2"
            echo "10"
            echo "1"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "expr '5' '+' '2'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "expr '5' '-' '2'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "expr '5' '/' '2'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "expr '5' '*' '2'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "expr '5' '%' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            expr '5' '+' '2'
            expr '5' '-' '2'
            expr '5' '/' '2'
            expr '5' '*' '2'
            expr '5' '%' '2'
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "expr '5' '>' '2'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "expr '5' '>=' '2'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "expr '5' '=' '2'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "expr '5' '<=' '2'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "expr '5' '<' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "算術演算"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "1"
            echo "1"
            echo "0"
            echo "0"
            echo "0"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "expr '5' '>' '2'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "expr '5' '>=' '2'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "expr '5' '=' '2'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "expr '5' '<=' '2'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "expr '5' '<' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            expr '5' '>' '2'
            expr '5' '>=' '2'
            expr '5' '=' '2'
            expr '5' '<=' '2'
            expr '5' '<' '2'
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "expr '5' '+' '2'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "expr '5' '-' '2'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "expr '5' '/' '2'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "expr '5' '*' '2'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "expr '5' '%' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "arithmetic operations"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "7"
            echo "3"
            echo "2"
            echo "10"
            echo "1"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "expr '5' '+' '2'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "expr '5' '-' '2'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "expr '5' '/' '2'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "expr '5' '*' '2'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "expr '5' '%' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            expr '5' '+' '2'
            expr '5' '-' '2'
            expr '5' '/' '2'
            expr '5' '*' '2'
            expr '5' '%' '2'
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "expr '5' '>' '2'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "expr '5' '>=' '2'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "expr '5' '=' '2'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "expr '5' '<=' '2'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "expr '5' '<' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "arithmetic operations"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "1"
            echo "1"
            echo "0"
            echo "0"
            echo "0"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "expr '5' '>' '2'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "expr '5' '>=' '2'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "expr '5' '=' '2'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "expr '5' '<=' '2'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "expr '5' '<' '2'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            expr '5' '>' '2'
            expr '5' '>=' '2'
            expr '5' '=' '2'
            expr '5' '<=' '2'
            expr '5' '<' '2'
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"
    
    export LC_ALL=${old_LC_ALL}

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : sleep                            #
#--------------------------------------------#
function func_command_sleep() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[인수1]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대기시간:'n'초]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[引数1]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[待機時間:'n'秒]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[waitingTime:'n'seconds]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "sleep 3"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "n초 후 다음 작업 실행"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "sleep 명령어 전 출력"
            echo "sleep 명령어 3초 후 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "sleep 3"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "sleep 명령어 전 출력"
            sleep 3
            echo "sleep 명령어 3초 후 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "sleep 3"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "n秒後に次の作業を実行"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "sleep コマンド前出力"
            echo "sleep コマンド3秒後出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "sleep 3"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "sleep コマンド前出力"
            sleep 3
            echo "sleep コマンド3秒後出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "sleep 3"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "After n seconds, perform the following actions"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "sleep Command Pre-Output"
            echo "sleep command output after 3 seconds"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "sleep 3"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "sleep Command Pre-Output"
            sleep 3
            echo "sleep command output after 3 seconds"
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"
    
    export LC_ALL=${old_LC_ALL}

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : gzip                             #
#--------------------------------------------#
function func_command_gzip() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    echo "testFile1,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
    echo "testFile2,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
    echo "testFile3,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-dr]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[파일경로]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-dr]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[ファイルパス]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-dr]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[filePath]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "gzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 단위로 압축"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "폴더 내 파일 확인"
            echo "대상 폴더 : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt.gz"
            echo "${commandItem}_TestFile2.txt"
            echo "${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "gzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "폴더 내 파일 확인"
            echo "대상 폴더 : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "gzip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 단위로 압축 해제(gunzip)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "폴더 내 파일 확인"
            echo "대상 폴더 : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt"
            echo "${commandItem}_TestFile2.txt"
            echo "${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "gzip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "폴더 내 파일 확인"
            echo "대상 폴더 : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gzip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "gzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "하위 폴더내 모든 파일 압축"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "폴더 내 파일 확인"
            echo "대상 폴더 : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt.gz"
            echo "${commandItem}_TestFile2.txt.gz"
            echo "${commandItem}_TestFile3.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "gzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "폴더 내 파일 확인"
            echo "대상 폴더 : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gzip -r ${filePathParam%/}/tmp/${commandItem}/
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt.gz
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "gzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイル単位で圧縮"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "フォルダ内ファイル確認"
            echo "対象フォルダ : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt.gz"
            echo "${commandItem}_TestFile2.txt"
            echo "${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "gzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "フォルダ内ファイル確認"
            echo "対象フォルダ : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "gzip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイル単位で解凍(gunzip)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "フォルダ内ファイル確認"
            echo "対象フォルダ : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt"
            echo "${commandItem}_TestFile2.txt"
            echo "${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "gzip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "フォルダ内ファイル確認"
            echo "対象フォルダ : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gzip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "gzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "サブフォルダー内のすべてのファイルを圧縮"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "フォルダ内ファイル確認"
            echo "対象フォルダ : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt.gz"
            echo "${commandItem}_TestFile2.txt.gz"
            echo "${commandItem}_TestFile3.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "gzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "フォルダ内ファイル確認"
            echo "対象フォルダ : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gzip -r ${filePathParam%/}/tmp/${commandItem}/
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt.gz
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "gzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Compress by file"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "Checking files in folders"
            echo "Target Folder : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt.gz"
            echo "${commandItem}_TestFile2.txt"
            echo "${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "gzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "Checking files in folders"
            echo "Target Folder : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "gzip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Uncompress by file(gunzip)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "Checking files in folders"
            echo "Target Folder : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt"
            echo "${commandItem}_TestFile2.txt"
            echo "${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "gzip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "Checking files in folders"
            echo "Target Folder : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gzip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "gzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Compress all files in subfolders"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "Checking files in folders"
            echo "Target Folder : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt.gz"
            echo "${commandItem}_TestFile2.txt.gz"
            echo "${commandItem}_TestFile3.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "gzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "Checking files in folders"
            echo "Target Folder : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gzip -r ${filePathParam%/}/tmp/${commandItem}/
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt.gz
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"
    
    export LC_ALL=${old_LC_ALL}
    
    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : gunzip                           #
#--------------------------------------------#
function func_command_gunzip() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    echo "testFile1,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
    echo "testFile2,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
    echo "testFile3,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt
    gzip ${filePathParam%/}/tmp/${commandItem}/*
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-r]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[파일경로]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-r]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[ファイルパス]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[argument]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-r]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[filePath]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "gunzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 단위로 압축 해제"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "폴더 내 파일 확인"
            echo "대상 폴더 : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt"
            echo "${commandItem}_TestFile2.txt.gz"
            echo "${commandItem}_TestFile3.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "gunzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "폴더 내 파일 확인"
            echo "대상 폴더 : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gunzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt.gz
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "gunzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "하위 폴더내 모든 파일 압축해제"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "폴더 내 파일 확인"
            echo "대상 폴더 : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt"
            echo "${commandItem}_TestFile2.txt"
            echo "${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "gunzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "폴더 내 파일 확인"
            echo "대상 폴더 : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gunzip -r ${filePathParam%/}/tmp/${commandItem}/
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "gunzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイル単位で解凍"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "フォルダ内ファイル確認"
            echo "対象フォルダ : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt"
            echo "${commandItem}_TestFile2.txt.gz"
            echo "${commandItem}_TestFile3.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "gunzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "フォルダ内ファイル確認"
            echo "対象フォルダ : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gunzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt.gz
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "gunzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "サブフォルダー内のすべてのファイルの解凍"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "フォルダ内ファイル確認"
            echo "対象フォルダ : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt"
            echo "${commandItem}_TestFile2.txt"
            echo "${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "gunzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "フォルダ内ファイル確認"
            echo "対象フォルダ : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gunzip -r ${filePathParam%/}/tmp/${commandItem}/
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "gunzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Uncompress by file"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "Checking files in folders"
            echo "Target Folder : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt"
            echo "${commandItem}_TestFile2.txt.gz"
            echo "${commandItem}_TestFile3.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "gunzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "Checking files in folders"
            echo "Target Folder : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gunzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt.gz
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt.gz
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "gunzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Unzip all files in subfolders"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "Checking files in folders"
            echo "Target Folder : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            echo "${commandItem}_TestFile1.txt"
            echo "${commandItem}_TestFile2.txt"
            echo "${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "gunzip -r ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo "Checking files in folders"
            echo "Target Folder : ${filePathParam%/}/tmp/${commandItem}/"
            echo
            gunzip -r ${filePathParam%/}/tmp/${commandItem}/
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile1.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile2.txt
            ls ${filePathParam%/}/tmp/${commandItem}/ | grep ${commandItem}_TestFile3.txt
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"
    
    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : zip                              #
#--------------------------------------------#
function func_command_zip() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/test1/
    echo "testFile1,Command,data" > ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt
    echo "testFile2,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
    echo "testFile3,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수1]_[인수2]_[인수3]_..." | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-rjd]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[압축 대상 파일 경로]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수2" ":" "[압축 파일 출력 경로]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수3" ":" "[압축 파일 출력 경로]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数1]_[引数2]_[引数3]_..." | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-rjd]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[圧縮対象ファイルパス]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数2" ":" "[圧縮ファイル出力パス]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数3" ":" "[圧縮ファイル出力パス]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument1]_[argument2]_[argument3]_..." | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-rjd]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[compressed_file_path]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument2" ":" "[compressed_file_output_path]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument3" ":" "[compressed_file_output_path]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "여러 파일 압축 (신규파일 adding)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "여러 파일 압축 (기존파일 updatng)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "updating: ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt"
            echo "updating: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "샘플${countNumber}" ":" "zip -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_r.zip ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "출력결과(예상)" ":" "지정된 폴더의 모든 하위 구조 압축"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/test1/"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "출력결과(실제)" ":" "zip -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_r.zip ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_r.zip ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "샘플${countNumber}" ":" "zip -j ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${filePathParam%/}/tmp/${commandItem}/*"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "출력결과(예상)" ":" "하위 폴더를 무시하고 파일만 압축"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  adding: ${commandItem}_TestFile.zip"
            echo "  adding: ${commandItem}_TestFile2.txt"
            echo "  adding: ${commandItem}_TestFile3.txt"
            echo "  adding: ${commandItem}_TestFile_r.zip"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "출력결과(실제)" ":" "zip -j ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${filePathParam%/}/tmp/${commandItem}/*"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip -j ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${filePathParam%/}/tmp/${commandItem}/*
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "샘플${countNumber}" ":" "zip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${commandItem}_TestFile2.txt ${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "출력결과(예상)" ":" "zip파일 내부에서 지정 파일을 삭제"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "deleting: ${commandItem}_TestFile2.txt"
            echo "deleting: ${commandItem}_TestFile3.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "출력결과(실제)" ":" "zip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${commandItem}_TestFile2.txt ${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${commandItem}_TestFile2.txt ${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "複数ファイル圧縮(新規ファイルadding)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "複数ファイル圧縮(既存ファイルupdatng)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "updating: ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt"
            echo "updating: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "サンプル${countNumber}" ":" "zip -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_r.zip ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "出力結果(予想)" ":" "指定されたフォルダー内のすべてのサブ構造圧"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/test1/"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "出力結果(実際)" ":" "zip -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_r.zip ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_r.zip ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "サンプル${countNumber}" ":" "zip -j ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${filePathParam%/}/tmp/${commandItem}/*"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "出力結果(予想)" ":" "サブフォルダーを無視してファイルのみを圧縮"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  adding: ${commandItem}_TestFile.zip"
            echo "  adding: ${commandItem}_TestFile2.txt"
            echo "  adding: ${commandItem}_TestFile3.txt"
            echo "  adding: ${commandItem}_TestFile_r.zip"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "出力結果(実際)" ":" "zip -j ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${filePathParam%/}/tmp/${commandItem}/*"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip -j ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${filePathParam%/}/tmp/${commandItem}/*
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "サンプル${countNumber}" ":" "zip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${commandItem}_TestFile2.txt ${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "出力結果(予想)" ":" "zipファイルの内部から指定ファイルを削除"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "deleting: ${commandItem}_TestFile2.txt"
            echo "deleting: ${commandItem}_TestFile3.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "出力結果(実際)" ":" "zip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${commandItem}_TestFile2.txt ${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${commandItem}_TestFile2.txt ${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Compress multiple files (new file adding)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/ ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Compress multiple files (existing files updateng)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "updating: ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt"
            echo "updating: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "zip -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_r.zip ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Compress all substructures in the specified folder"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.zip"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/test1/"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            echo "  adding: ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "zip -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_r.zip ${filePathParam%/}/tmp/${commandItem}/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_r.zip ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "zip -j ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${filePathParam%/}/tmp/${commandItem}/*"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Ignore subfolders and compress only files"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  adding: ${commandItem}_TestFile.zip"
            echo "  adding: ${commandItem}_TestFile2.txt"
            echo "  adding: ${commandItem}_TestFile3.txt"
            echo "  adding: ${commandItem}_TestFile_r.zip"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "zip -j ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${filePathParam%/}/tmp/${commandItem}/*"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip -j ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${filePathParam%/}/tmp/${commandItem}/*
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "zip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${commandItem}_TestFile2.txt ${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Delete the specified file from inside the zip file"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "deleting: ${commandItem}_TestFile2.txt"
            echo "deleting: ${commandItem}_TestFile3.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "zip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${commandItem}_TestFile2.txt ${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            zip -d ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_j.zip ${commandItem}_TestFile2.txt ${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"
    
    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : unzip                              #
#--------------------------------------------#
function func_command_unzip() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/test1/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/test2/
    echo "testFile1,Command,data" > ${filePathParam%/}/tmp/${commandItem}/test1/${commandItem}_TestFile1.txt
    echo "testFile2,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
    echo "testFile3,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt
    zip -jr ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip ${filePathParam%/}/tmp/${commandItem}/
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수1]_[인수2]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-ld]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[압축 파일 파일 경로]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수2" ":" "[압축 해제 경로]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数1]_[引数2]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-ld]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[圧縮ファイル出力パス]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数2" ":" "[ファイル解凍パス]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument1]_[argument2]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-ld]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[compressed_file_output_path]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument2" ":" "[decompression_path]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "현재 폴더에 압축 해제"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "extracting: ${commandItem}_TestFile2.txt"
            echo "extracting: ${commandItem}_TestFile3.txt"
            echo "extracting: ${commandItem}_TestFile1.txt"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "unzip -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "압축 파일 내용 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  Length      Date    Time    Name"
            echo "---------  ---------- -----   ----"
            echo "       23  MM-DD-YYYY hh:mm   unzip_TestFile2.txt"
            echo "       23  MM-DD-YYYY hh:mm   unzip_TestFile3.txt"
            echo "       23  MM-DD-YYYY hh:mm   unzip_TestFile1.txt"
            echo "---------                     -------"
            echo "       69                     n files"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "unzip -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            unzip -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip -d ${filePathParam%/}/tmp/${commandItem}/test2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "지정된 폴더에 압축 해제"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "extracting: ${filePathParam%/}/tmp/${commandItem}/test2/${commandItem}_TestFile2.txt"
            echo "extracting: ${filePathParam%/}/tmp/${commandItem}/test2/${commandItem}_TestFile3.txt"
            echo "extracting: ${filePathParam%/}/tmp/${commandItem}/test2/${commandItem}_TestFile1.txt"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip -d ${filePathParam%/}/tmp/${commandItem}/test2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip -d ${filePathParam%/}/tmp/${commandItem}/test2/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "現在のフォルダへの解凍"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "extracting: ${commandItem}_TestFile2.txt"
            echo "extracting: ${commandItem}_TestFile3.txt"
            echo "extracting: ${commandItem}_TestFile1.txt"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "unzip -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "圧縮ファイルの内容出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  Length      Date    Time    Name"
            echo "---------  ---------- -----   ----"
            echo "       23  MM-DD-YYYY hh:mm   unzip_TestFile2.txt"
            echo "       23  MM-DD-YYYY hh:mm   unzip_TestFile3.txt"
            echo "       23  MM-DD-YYYY hh:mm   unzip_TestFile1.txt"
            echo "---------                     -------"
            echo "       69                     n files"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "unzip -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            unzip -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip -d ${filePathParam%/}/tmp/${commandItem}/test2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "指定されたフォルダへの解凍"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "extracting: ${filePathParam%/}/tmp/${commandItem}/test2/${commandItem}_TestFile2.txt"
            echo "extracting: ${filePathParam%/}/tmp/${commandItem}/test2/${commandItem}_TestFile3.txt"
            echo "extracting: ${filePathParam%/}/tmp/${commandItem}/test2/${commandItem}_TestFile1.txt"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip -d ${filePathParam%/}/tmp/${commandItem}/test2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip -d ${filePathParam%/}/tmp/${commandItem}/test2/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Compressed File Content Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "extracting: ${commandItem}_TestFile2.txt"
            echo "extracting: ${commandItem}_TestFile3.txt"
            echo "extracting: ${commandItem}_TestFile1.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "unzip -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Unzip to the current folder"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "  Length      Date    Time    Name"
            echo "---------  ---------- -----   ----"
            echo "       23  MM-DD-YYYY hh:mm   unzip_TestFile2.txt"
            echo "       23  MM-DD-YYYY hh:mm   unzip_TestFile3.txt"
            echo "       23  MM-DD-YYYY hh:mm   unzip_TestFile1.txt"
            echo "---------                     -------"
            echo "       69                     n files"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "unzip -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            unzip -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip -d ${filePathParam%/}/tmp/${commandItem}/test2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Unzip to the specified folder"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "extracting: ${filePathParam%/}/tmp/${commandItem}/test2/${commandItem}_TestFile2.txt"
            echo "extracting: ${filePathParam%/}/tmp/${commandItem}/test2/${commandItem}_TestFile3.txt"
            echo "extracting: ${filePathParam%/}/tmp/${commandItem}/test2/${commandItem}_TestFile1.txt"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip -d ${filePathParam%/}/tmp/${commandItem}/test2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            unzip ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile_jr.zip -d ${filePathParam%/}/tmp/${commandItem}/test2/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"
    
    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/
    rm -rf ./${commandItem}_TestFile2.txt
    rm -rf ./${commandItem}_TestFile3.txt
    rm -rf ./${commandItem}_TestFile1.txt

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : date                              #
#--------------------------------------------#
function func_command_date() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[인수1]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[출력 날짜 형식]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[引数1]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[出力日付形式]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[argument1]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[Output_Date_Format]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "표준 형식 날짜 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo ' export LC_ALL="ko_KR.UTF-8" '
            export LC_ALL="ko_KR.UTF-8"
            echo "[YYYY]년 [M]월  [D]일 [X]요일 [hh]시 [mm]분 [ss]초 JST"
            echo "2024년 3월  1일 금요일 21시 35분 28초 JST"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%c"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "표준 형식 날짜 출력(간소화)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "[X]  [M]/ [D] [hh]:[mm]:[ss] [YYYY]"
            echo "금  3/ 1 21:35:28 2024"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%c'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%c'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%F"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%D"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%x"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "날짜 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "YYYY-MM-DD : 2024-03-01"
            echo "MM/DD/YY : 03/01/24"
            echo "MM/DD/YYYY : 03/01/2024"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%F'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%D'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%x'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%F'
            date '+%D'
            date '+%x'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%Y"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%y"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%C"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "연도 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "YYYY : 2024"
            echo "  YY :   24"
            echo "YY   : 20  "
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%Y'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%y'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%C'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%Y'
            date '+%y'
            date '+%C'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%m"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%B"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%b"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%h"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "월 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "03"
            echo "3월"
            echo "3"
            echo "3"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%m'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%B'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%b'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%h'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%m'
            date '+%B'
            date '+%b'
            date '+%h'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%d"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%_d"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%e"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "월 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "03"
            echo "3"
            echo "3"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%d'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%_d'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%e'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%d'
            date '+%_d'
            date '+%e'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%A"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%a"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%u"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%w"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "요일 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "일요일"
            echo "일"
            echo "7 : 1(Mon)~7(Sun)"
            echo "0 : 0(Sun)~6(Mon)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%A'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%a'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%u'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%w'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%A'
            date '+%a'
            date '+%u'
            date '+%w'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%p"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "AM/PM 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "PM"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%p'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%p'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%H"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%I"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%k"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%l"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "시간 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "01 : (2桁 24時)"
            echo "01 : (2桁 12時)"
            echo " 1 : (1桁 24時)"
            echo " 1 : (1桁 12時)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%H'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%I'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%k'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%l'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%H'
            date '+%I'
            date '+%k'
            date '+%l'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%M"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%_M"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "분출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "01 : (2분)"
            echo " 1 : (1분)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%M'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%_M'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%M'
            date '+%_M'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%S"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%_S"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "초출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "01 : (2자리수)"
            echo " 1 : (1자리수)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%S'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%_S'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%S'
            date '+%_S'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%z"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "date +%Z"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "타임존출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "+0900"
            echo "JST"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%z'"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "date '+%Z'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%z'
            date '+%Z'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "標準形式日付出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo ' export LC_ALL="ja_JP.UTF-8" '
            export LC_ALL="ja_JP.UTF-8"
            echo "[YYYY]年 [M]月 [D]日 [X]曜日 [hh]時[mm]分[ss]秒 JST"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%c'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "標準形式日付出力(簡略)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "[X]  [M]/ [D] [hh]:[mm]:[ss] [YYYY]"
            echo "金  3/ 1 21:35:28 2024"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%c'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%c'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%F'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%D'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%x'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "日付出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "YYYY-MM-DD : 2024-03-01"
            echo "MM/DD/YY : 03/01/24"
            echo "MM/DD/YYYY : 03/01/2024"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%F'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%D'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%x'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%F'
            date '+%D'
            date '+%x'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%Y'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%y'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%C'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "年度出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "YYYY : 2024"
            echo "  YY : 24"
            echo "YY   : 20"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%Y'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%y'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%C'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%Y'
            date '+%y'
            date '+%C'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%m'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%B'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%b'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%h'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "月出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "03"
            echo "3月"
            echo "3"
            echo "3"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%m'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%B'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%b'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%h'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%m'
            date '+%B'
            date '+%b'
            date '+%h'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%d'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%_d'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%e'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "日出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "03"
            echo " 3"
            echo " 3"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%d'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%_d'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%e'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%d'
            date '+%_d'
            date '+%e'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%A'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%a'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%u'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%w'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "曜日出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "日曜日"
            echo "日"
            echo "7 : 1(Mon)~7(Sun)"
            echo "0 : 0(Sun)~6(Mon)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%A'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%a'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%u'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%w'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%A'
            date '+%a'
            date '+%u'
            date '+%w'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%p'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "AM/PM出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "PM"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%p'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%p'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%H'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%I'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%k'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%l'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "時出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "01 : (2桁 24時)"
            echo "01 : (2桁 12時)"
            echo " 1 : (1桁 24時)"
            echo " 1 : (1桁 12時)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%H'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%I'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%k'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%l'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%H'
            date '+%I'
            date '+%k'
            date '+%l'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%M'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%_M'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "分出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "01 : (2桁 分)"
            echo " 1 : (1桁 分)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%M'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%_M'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%M'
            date '+%_M'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%S'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%_S'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "秒出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "01 : (2桁)"
            echo " 1 : (1桁)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%S'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%_S'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%S'
            date '+%_S'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%z'"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "date '+%Z'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "タイムゾーン出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "+0900"
            echo "JST"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%z'"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "date '+%Z'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%z'
            date '+%Z'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Standard Format Date Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo ' export LC_ALL="en_US.UTF-8" '
            export LC_ALL="en_US.UTF-8"
            echo "[the week] [Months] [Days] [hh]:[mm]:[ss] JST [YYYY]"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%c'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Standard Format Date Output(simplify)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "[X]  [M] [D] [hh]:[mm]:[ss] [YYYY]"
            echo "Fri Mar 1 21:35:28 2024"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%c'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%c'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%F'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%D'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%x'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Date Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "YYYY-MM-DD : 2024-03-01"
            echo "MM/DD/YY : 03/01/24"
            echo "MM/DD/YYYY : 03/01/2024"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%F'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%D'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%x'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%F'
            date '+%D'
            date '+%x'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%Y'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%y'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%C'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Year Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "YYYY : 2024"
            echo "  YY :   24"
            echo "YY   : 20  "
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%Y'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%y'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%C'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%Y'
            date '+%y'
            date '+%C'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%m'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%B'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%b'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%h'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Months Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "03"
            echo "March"
            echo "Mar"
            echo "Mar"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%m'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%B'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%b'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%h'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%m'
            date '+%B'
            date '+%b'
            date '+%h'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%d'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%_d'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%e'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Days Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "03"
            echo " 3"
            echo " 3"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%d'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%_d'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%e'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%d'
            date '+%_d'
            date '+%e'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%A'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%a'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%u'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%w'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Weeks Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Sunday"
            echo "Sun"
            echo "7 : 1(Mon)~7(Sun)"
            echo "0 : 0(Sun)~6(Mon)"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%A'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%a'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%u'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%w'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%A'
            date '+%a'
            date '+%u'
            date '+%w'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%p'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "AM/PM Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "PM"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%p'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%p'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%H'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%I'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%k'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%l'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "hours Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "01 : (2 words 24hours)"
            echo "01 : (2 words 12hours)"
            echo " 1 : (1 words 24hours)"
            echo " 1 : (1 words 12hours)"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%H'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%I'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%k'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%l'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%H'
            date '+%I'
            date '+%k'
            date '+%l'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%M'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%_M'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Minutes Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "01 : (2 words)"
            echo " 1 : (1 words)"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%M'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%_M'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%M'
            date '+%_M'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%S'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%_S'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Seconds Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "01 : (2 words)"
            echo " 1 : (1 words)"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%S'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%_S'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%S'
            date '+%_S'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%z'"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "date '+%Z'"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Timezone Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "+0900"
            echo "JST"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%z'"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "date '+%Z'"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            date '+%z'
            date '+%Z'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"
    
    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    #rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : cal                              #
#--------------------------------------------#
function func_command_cal() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-r]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상날짜]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-r]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象日付]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[argument]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-r]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[target_Date]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cal"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "명령어 실행 월의 달력을 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "     M월 YYYY    "
            echo "일 월 화 수 목 금 토"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　●　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cal"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cal -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "명령어 실행 월의 달력을 출력(오늘 강조 표시)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "     M월 YYYY    "
            echo "일 월 화 수 목 금 토"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cal -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -h
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cal -j"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "줄리안 달력으로 출력(1월 1일을 기준으로 1씩 더해진 날짜를 출력)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "     M월 YYYY    "
            echo "일 월 화 수 목 금 토"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　●　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cal -j"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -j
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cal -y"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "올해의 모든 날짜를 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "     M월 YYYY    "
            echo "일 월 화 수 목 금 토"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　●　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cal -y"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -y
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cal -d 2022-6"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cal -d 2022-6-1"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "지정된 날짜를 달력을 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "     6월 2022    "
            echo "일 월 화 수 목 금 토"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cal -d 2022-6"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cal -d 2022-6-1"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -d 2022-6
            cal -d 2022-6-1
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cal"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "コマンド実行月のカレンダーを出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "     M月 YYYY    "
            echo "日 月 火 水 木 金 土"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　●　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cal"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cal -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "コマンド実行月のカレンダーを出力(今日は強調表示しない)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "     M月 YYYY    "
            echo "日 月 火 水 木 金 土"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cal -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -h
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cal -j"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ジュリアンカレンダーへの出力（1月1日から1日ずつ足す日付を出力）"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "     M月 YYYY    "
            echo "日 月 火 水 木 金 土"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　●　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cal -j"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -j
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cal -y"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "今年のすべての日付を出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "     M月 YYYY    "
            echo "日 月 火 水 木 金 土"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　●　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cal -y"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -y
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cal -d 2022-6"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cal -d 2022-6-1"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "指定された日付をカレンダーを出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "     6月 2022    "
            echo "日 月 火 水 木 金 土"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cal -d 2022-6"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cal -d 2022-6-1"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -d 2022-6
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cal"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Outputs the calendar for the month of command execution"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   March YYYY    "
            echo "Su Mo Tu We Th Fr Sa"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　●　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cal"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cal -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Outputs the calendar for the month of command execution(Not highlight today)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   March YYYY    "
            echo "Su Mo Tu We Th Fr Sa"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cal -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -h 
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cal -j"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Output to Julian Calendar (outputs the date added by 1 as of January 1st)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   March YYYY    "
            echo "Su Mo Tu We Th Fr Sa"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　●　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cal -j"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -j
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cal -y"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Output all dates for this year"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   March YYYY    "
            echo "Su Mo Tu We Th Fr Sa"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　●　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cal -y"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -y
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cal -d 2022-6"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cal -d 2022-6-1"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Output calendar for the specified date"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   June 2022    "
            echo "Su Mo Tu We Th Fr Sa"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo "◯　◯　◯　◯　◯　◯　◯"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cal -d 2022-6"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cal -d 2022-6-1"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cal -d 2022-6
            cal -d 2022-6-1
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"
    
    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    #rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : wc                               #
#--------------------------------------------#
function func_command_wc() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    echo "testFileA,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'TestFile1' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'apple banana cream dust Test txt TestFile1 gui' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'Test,bash,zsh,sh' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'TestFile2' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'iphone,ipad,imac\tTest,ipod,ipodtouch' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo '' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'galaxyS7,Note7,ZFilp,S7,Test' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'TestFile3' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'Korea,Test,Japan,China' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-lwc]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_파일]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-lwc]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象ファイル]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-lwc]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Files]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "wc ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "라인수,단어수,바이트수출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   라인수  단어수  바이트수  대상파일경로" 
            echo "    10     17        207       ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt" 
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "wc ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "wc -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "라인수출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   10 : 라인수" 
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "wc -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "wc -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "단어수출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   17 : 단어수 (구분자 : 스페이스)" 
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "wc -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "wc -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "바이트수출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   207 : 바이트수 (LF : 1바이트, CRLF : 2바이트)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "wc -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "wc ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "行数、単語数、バイト数出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   行数  単語数  バイト数  対象ファイルパス" 
            echo "    10    17       207      ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt" 
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "wc ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "wc -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "行数出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   10 : 行数" 
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "wc -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "wc -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "単語数出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   17 : 単語数 (区分字 : スペース)" 
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "wc -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "wc -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "バイト数出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   207 : バイト数 (LF : 1バイト, CRLF : 2バイト)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "wc -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "wc ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Line_Count,Words_Count,Byte_Count Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   Line_Count  Words_Count  Byte_Count  TargetFilePath" 
            echo "       10           17         207       ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt" 
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "wc ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "wc -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Line Count Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   10 : Line Count" 
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "wc -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "wc -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Words Count Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   17 : Words Count (Separator : space)" 
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "wc -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "wc -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Bytes Count Output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "   207 : Byte Count (LF : 1byte, CRLF : 2byte)"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "wc -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            wc -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : uniq                             #
#--------------------------------------------#
function func_command_uniq() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    echo "testFileA,Command,data" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'test apple' > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'test apple' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'test banana' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'test Banana' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'test banana' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'test apple' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'test Peach' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'test peach' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'test peach' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-ci]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_파일]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-ci]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象ファイル]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-ci]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Files]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "uniq ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "연속된 중복값을 제거하여 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "##원본##"
            echo "test apple\ntest apple\ntest banana\ntest Banana\ntest banana\ntest apple\ntest Peach\ntest peach\ntest peach\n"
            echo "##예상출력##"
            echo "test apple\ntest banana\ntest Banana\ntest banana\ntest apple\ntest Peach\ntest peach\n"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "uniq ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            uniq ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "uniq -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "연속된 중복값을 제거하여 출력(중복된 라인수를 선두에 출력)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "##예상출력##"
            echo "   2 test apple\n   1 test banana\n   1 test Banana\n   1 test banana\n   1 test apple\n   1 test Peach\n   2 test peach\n"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "uniq -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            uniq -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "uniq -i ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "대소문자 구분없이 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "##예상출력##"
            echo "test apple\ntest banana\ntest apple\ntest Peach\n"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "uniq -i ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            uniq -i ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "uniq ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "連続重複値の削除と出力(先頭に重複数を出力)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "##原本##"
            echo "test apple\ntest apple\ntest banana\ntest Banana\ntest banana\ntest apple\ntest Peach\ntest peach\ntest peach\n"
            echo "##予想出力##"
            echo "test apple\ntest banana\ntest Banana\ntest banana\ntest apple\ntest Peach\ntest peach\n"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "uniq ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            uniq ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "uniq -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "大文字と小文字を区別しない"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "##予想出力##"
            echo "   2 test apple\n   1 test banana\n   1 test Banana\n   1 test banana\n   1 test apple\n   1 test Peach\n   2 test peach\n"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "uniq -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            uniq -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "uniq -i ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "単語数出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "##予想出力##"
            echo "test apple\ntest banana\ntest apple\ntest Peach\n"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "uniq -i ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            uniq -i ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "uniq ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Delete consecutive duplicate values and output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "##Original##"
            echo "test apple\ntest apple\ntest banana\ntest Banana\ntest banana\ntest apple\ntest Peach\ntest peach\ntest peach\n"
            echo "##Estimated_output##"
            echo "test apple\ntest banana\ntest Banana\ntest banana\ntest apple\ntest Peach\ntest peach\n"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "uniq ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            uniq ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "uniq -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Output by eliminating consecutive duplicate values (number of duplicate outputs)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "##Estimated_output##"
            echo "   2 test apple\n   1 test banana\n   1 test Banana\n   1 test banana\n   1 test apple\n   1 test Peach\n   2 test peach\n"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "uniq -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            uniq -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "uniq -i ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Put out case-insensitive"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "##Estimated_output##"
            echo "test apple\ntest banana\ntest apple\ntest Peach\n"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "uniq -i ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            uniq -i ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : touch                            #
#--------------------------------------------#
function func_command_touch() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-trc]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_파일]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-trc]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象ファイル]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-trc]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Files]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "0바이트의 빈 파일을 생성"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "현재시간"
            date "+%m/%d %H:%M"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "현재시간"
            date "+%m/%d %H:%M"
            touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "touch -t 199112312359 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "지정된 날짜 및 시간[[CC]YY]MMDDhhmm[SS]으로 수정"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "현재시간"
            date "+%m/%d %H:%M"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "touch -t 199112312359 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "현재시간"
            date "+%m/%d %H:%M"
            touch -t 199112312359 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "touch -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파라미터(앞)의 수정 날짜 정보를 파라미터(뒤)의 수정날짜 정보로 수정"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "현재시간"
            date "+%m/%d %H:%M"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "touch -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "현재시간"
            date "+%m/%d %H:%M"
            touch -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "touch -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "수정 날짜 정보를 현재 시간으로 갱신"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "현재시간"
            date "+%m/%d %H:%M"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "touch -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "현재시간"
            date "+%m/%d %H:%M"
            touch -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "0バイトの空きファイルを作成"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "現在時間"
            date "+%m/%d %H:%M"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "現在時間"
            date "+%m/%d %H:%M"
            touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "touch -t 199112312359 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "指定された日付[[CC]YY]MMDDhhmm[SS]に修正"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "現在時間"
            date "+%m/%d %H:%M"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "touch -t 199112312359 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "現在時間"
            date "+%m/%d %H:%M"
            touch -t 199112312359 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "touch -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "パラメータ（前）の修正日付情報をパラメータ（後）の修正日付情報に修正"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "現在時間"
            date "+%m/%d %H:%M"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "touch -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "現在時間"
            date "+%m/%d %H:%M"
            touch -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "touch -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "修正日付情報を現在の時間に更新"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "現在時間"
            date "+%m/%d %H:%M"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "touch -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "現在時間"
            date "+%m/%d %H:%M"
            touch -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Create an empty file of 0 bytes"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Current Time"
            date "+%m/%d %H:%M"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "touch ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Current Time"
            date "+%m/%d %H:%M"
            touch -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            touch -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "touch -t 199112312359 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Modify to specified date and time [[CC]YY]MMDDhmm[SS]"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Current Time"
            date "+%m/%d %H:%M"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "touch -t 199112312359 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Current Time"
            date "+%m/%d %H:%M"
            touch -t 199112312359 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "touch -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Modify the modification date information of the parameter (front) to the modification date information of the parameter (back)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Current Time"
            date "+%m/%d %H:%M"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "touch -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Current Time"
            date "+%m/%d %H:%M"
            touch -r ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "touch -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Refreshing revision date information to current time"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Current Time"
            date "+%m/%d %H:%M"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "touch -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Current Time"
            date "+%m/%d %H:%M"
            touch -c ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            ls -l ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : head                             #
#--------------------------------------------#
function func_command_head() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    echo 'TestFile1' > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    for n in {2..20};
    do
        echo "TestFile${n}" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    done 
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-nc]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_파일]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-nc]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象ファイル]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-nc]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Files]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "head ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "앞에서 10줄 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile1'
            echo 'TestFile2'
            echo 'TestFile3'
            echo 'TestFile4'
            echo 'TestFile5'
            echo 'TestFile6'
            echo 'TestFile7'
            echo 'TestFile8'
            echo 'TestFile9'
            echo 'TestFile10'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "head ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            head ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "head -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "앞에서 n줄 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile1'
            echo 'TestFile2'
            echo 'TestFile3'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "head -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            head -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "head -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "앞에서 n바이트 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'Tes'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "head -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            head -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "head ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "前から10行出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile1'
            echo 'TestFile2'
            echo 'TestFile3'
            echo 'TestFile4'
            echo 'TestFile5'
            echo 'TestFile6'
            echo 'TestFile7'
            echo 'TestFile8'
            echo 'TestFile9'
            echo 'TestFile10'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "head ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            head ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "head -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "前からn行出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile1'
            echo 'TestFile2'
            echo 'TestFile3'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "head -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            head -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "head -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "前からnバイト出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'Tes'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "head -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            head -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "head ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "10 lines output from the front"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile1'
            echo 'TestFile2'
            echo 'TestFile3'
            echo 'TestFile4'
            echo 'TestFile5'
            echo 'TestFile6'
            echo 'TestFile7'
            echo 'TestFile8'
            echo 'TestFile9'
            echo 'TestFile10'
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "head ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            head ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "head -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "n-line output from front"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile1'
            echo 'TestFile2'
            echo 'TestFile3'
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "head -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            head -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "head -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Output n-bytes from the front"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'Tes'
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "head -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            head -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : tail                             #
#--------------------------------------------#
function func_command_tail() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    echo 'TestFile1' > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    for n in {2..20};
    do
        echo "TestFile${n}" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    done 
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-nc]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_파일]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-nc]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象ファイル]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-nc]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Files]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "tail ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "뒤에서 10줄 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile11'
            echo 'TestFile12'
            echo 'TestFile13'
            echo 'TestFile14'
            echo 'TestFile15'
            echo 'TestFile16'
            echo 'TestFile17'
            echo 'TestFile18'
            echo 'TestFile19'
            echo 'TestFile20'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "tail ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            tail ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "tail -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "뒤에서 n줄 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile18'
            echo 'TestFile19'
            echo 'TestFile20'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "tail -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            tail -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "tail -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "뒤에서 n바이트 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo '20 : 개행코드 포함'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "tail -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            tail -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "tail ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "後ろから10行出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile11'
            echo 'TestFile12'
            echo 'TestFile13'
            echo 'TestFile14'
            echo 'TestFile15'
            echo 'TestFile16'
            echo 'TestFile17'
            echo 'TestFile18'
            echo 'TestFile19'
            echo 'TestFile20'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "tail ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            tail ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "tail -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "後ろからn行出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile18'
            echo 'TestFile19'
            echo 'TestFile20'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "tail -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            tail -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "tail -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "後ろからnバイト出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo '20 : 改行コード付き'
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "tail -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            tail -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "tail ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "10 lines output from the back"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile11'
            echo 'TestFile12'
            echo 'TestFile13'
            echo 'TestFile14'
            echo 'TestFile15'
            echo 'TestFile16'
            echo 'TestFile17'
            echo 'TestFile18'
            echo 'TestFile19'
            echo 'TestFile20'
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "tail ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            tail ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "tail -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "n-line output from the back"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo 'TestFile18'
            echo 'TestFile19'
            echo 'TestFile20'
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "tail -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            tail -n 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "tail -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "n-byte output from the back"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo '20 : Include NewLine code'
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "tail -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            tail -c 3 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : cd                               #
#--------------------------------------------#
function func_command_cd() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/
    echo 'TestFile1' > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_폴더]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[引数]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象フォルダ]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Folders]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "작업 디렉토리 변경"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "pwd : 작업 디렉토리"
            echo "pwd : Directory1"
            echo "pwd : Directory2"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            pwd
            cd ${filePathParam%/}/tmp/${commandItem}/Directory1/
            pwd
            cd ${filePathParam%/}/tmp/${commandItem}/Directory2/
            pwd
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "作業ディレクトリの変更"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "pwd : 作業ディレクトリ"
            echo "pwd : Directory1"
            echo "pwd : Directory2"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            pwd
            cd ${filePathParam%/}/tmp/${commandItem}/Directory1/
            pwd
            cd ${filePathParam%/}/tmp/${commandItem}/Directory2/
            pwd            
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Changing the Working Directory"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "pwd : Working Directory"
            echo "pwd : Directory1"
            echo "pwd : Directory2"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cd ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            pwd
            cd ${filePathParam%/}/tmp/${commandItem}/Directory1/
            pwd
            cd ${filePathParam%/}/tmp/${commandItem}/Directory2/
            pwd
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : chgrp                            #
#--------------------------------------------#
function func_command_chgrp() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/
    echo 'TestFile1' > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo 'TestFile1' > ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-R]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_파일_또는_폴더]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-R]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象ファイル又はフォルダ]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-R]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Files_or_Folders]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 그룹 소유권 변경"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "폴더 그룹 소유권 변경"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "/etc/group : 파일에서 확인 가능"
            echo "${commandItem}_TestFile1.txt : 파일 그룹 소유권이 admin으로 변경"
            echo
            echo "Directory1 : 폴더 그룹 소유권이 admin으로 변경"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일 그룹 소유권 변경 전 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "파일 그룹 소유권 변경 후 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo
            echo "폴더 그룹 소유권 변경 전 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "폴더 그룹 소유권 변경 후 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "chgrp -R admin ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일/폴더 그룹 소유권 변경"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : 파일 그룹 소유권이 admin으로 변경"
            echo
            echo "Directory2 : 폴더 그룹 소유권이 admin으로 변경"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "chgrp -R admin ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일/폴더 그룹 소유권 변경 전 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chgrp -R admin ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "파일/폴더 그룹 소유권 변경 후 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイルグループの所有権変更"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "フォルダグループの所有権変更"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "/etc/group : ファイルから確認可能"
            echo "${commandItem}_TestFile1.txt : ファイルグループの所有権がadminに変更"
            echo
            echo "Directory1 : フォルダグループ所有権がadminに変更"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイルグループの所有権変更前 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "ファイルグループの所有権変更後 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo
            echo "フォルダグループの所有権変更前 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "フォルダグループの所有権変更後 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "chgrp -R admin ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイル・フォルダグループの所有権変更"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : ファイルグループの所有権がadminに変更"
            echo
            echo "Directory2 : フォルダグループの所有権がadminに変更"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "chgrp -R admin ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイル・フォルダグループの所有権変更前 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chgrp -R admin ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "ファイル・フォルダグループの所有権変更後 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Change File group Ownership"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Change folder group ownership"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "/etc/group : Check from the File"
            echo "${commandItem}_TestFile1.txt : Change file group ownership to admin"
            echo
            echo "Directory1 : Change folder group ownership to admin"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before changing ownership of file groups : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "After changing ownership of file groups : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo
            echo "Before changing ownership of folder groups : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chgrp admin ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "After changing ownership of folder groups : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "chgrp -R admin ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Change file/folder group ownership"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : Change file group ownership to admin"
            echo
            echo "Directory2 : Change folder group ownership to admin"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "chgrp -R admin ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before changing ownership of file/folder groups :(${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chgrp -R admin ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "After changing ownership of file/folder groups : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : chmod                            #
#--------------------------------------------#
function func_command_chmod() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/
    echo 'TestFile1' > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo 'TestFile1' > ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-R]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_파일_또는_폴더]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-R]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象ファイル又はフォルダ]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-R]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Files_or_Folders]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 그룹 소유권 변경"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "폴더 그룹 소유권 변경"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile1.txt : 파일 그룹 소유권이 777으로 변경"
            echo
            echo "Directory1 : 폴더 그룹 소유권이 777으로 변경"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일 그룹 소유권 변경 전 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "파일 그룹 소유권 변경 후 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo
            echo "폴더 그룹 소유권 변경 전 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "폴더 그룹 소유권 변경 후 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "chmod -R 777 ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일/폴더 그룹 소유권 변경"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : 파일 그룹 소유권이 777으로 변경"
            echo
            echo "Directory2 : 폴더 그룹 소유권이 777으로 변경"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "chmod -R 777 ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일/폴더 그룹 소유권 변경 전 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chmod -R 777 ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "파일/폴더 그룹 소유권 변경 후 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイルグループの所有権変更"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "フォルダグループの所有権変更"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile1.txt : ファイルグループの所有権が777に変更"
            echo
            echo "Directory1 : フォルダグループ所有権が777に変更"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイルグループの所有権変更前 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "ファイルグループの所有権変更後 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo
            echo "フォルダグループの所有権変更前 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "フォルダグループの所有権変更後 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "chmod -R 777 ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイル・フォルダグループの所有権変更"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : ファイルグループの所有権が777に変更"
            echo
            echo "Directory2 : フォルダグループの所有権が777に変更"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "chmod -R 777 ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイル・フォルダグループの所有権変更前 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chmod -R 777 ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "ファイル・フォルダグループの所有権変更後 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Change File group Ownership"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Change folder group ownership"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile1.txt : Change file group ownership to 777"
            echo
            echo "Directory1 : Change folder group ownership to 777"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before changing ownership of file groups : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "After changing ownership of file groups : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo
            echo "Before changing ownership of folder groups : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chmod 777 ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "After changing ownership of folder groups : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "chmod -R 777 ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Change file/folder group ownership"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : Change file group ownership to 777"
            echo
            echo "Directory2 : Change folder group ownership to 777"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "chmod -R 777 ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before changing ownership of file/folder groups :(${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chmod -R 777 ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "After changing ownership of file/folder groups : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : chown                            #
#--------------------------------------------#
function func_command_chown() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/
    echo 'TestFile1' > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo 'TestFile1' > ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-R]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_파일_또는_폴더]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-R]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象ファイル又はフォルダ]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-R]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Files_or_Folders]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 소유자 변경"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "폴더 소유자 변경"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "/etc/passwd : 파일에서 확인 가능"
            echo "${commandItem}_TestFile1.txt : 파일 소유자가 ownchange으로 변경"
            echo
            echo "Directory1 : 폴더 소유자가 ownchange으로 변경"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일 소유자 변경 전 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "파일 소유자 변경 후 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo
            echo "폴더 소유자 변경 전 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "폴더 소유자 변경 후 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "chown -R ownchange ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일/폴더 소유자 변경"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : 파일 소유자가 ownchange으로 변경"
            echo
            echo "Directory2 : 폴더 소유자가 ownchange으로 변경"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "chown -R ownchange ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일/폴더 소유자 변경 전 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chown -R ownchange ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "파일/폴더 소유자 변경 후 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイル所有権変更"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "フォルダ所有権変更"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "/etc/passwd : ファイルから確認可能"
            echo "${commandItem}_TestFile1.txt : ファイル所有権がownchangeに変更"
            echo
            echo "Directory1 : フォルダ所有権がownchangeに変更"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイルの所有権変更前 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "ファイルの所有権変更後 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo
            echo "フォルダの所有権変更前 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "フォルダの所有権変更後 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "chown -R ownchange ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイル・フォルダ所有権変更"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : ファイル所有権がownchangeに変更"
            echo
            echo "Directory2 : フォルダ所有権がownchangeに変更"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "chown -R ownchange ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイル・フォルダ所有権変更前 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chown -R ownchange ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "ファイル・フォルダ所有権変更後 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Change File Ownership"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Change folder ownership"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "/etc/passwd : Check from the File"
            echo "${commandItem}_TestFile1.txt : Change file ownership to ownchange"
            echo
            echo "Directory1 : Change folder ownership to ownchange"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before changing ownership of file groups : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "After changing ownership of file groups : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo
            echo "Before changing ownership of folder groups : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chown ownchange ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "After changing ownership of folder groups : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "chown -R ownchange ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Change file/folder ownership"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : Change file ownership to ownchange"
            echo
            echo "Directory2 : Change folder ownership to ownchange"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "chown -R ownchange ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before changing ownership of file/folder groups :(${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            chown -R ownchange ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "After changing ownership of file/folder groups : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory2/
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : pwd                              #
#--------------------------------------------#
function func_command_pwd() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "pwd"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "작업 디렉토리 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "작업 디렉토리 출력"
            cd ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "pwd"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            pwd
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "pwd"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "作業ディレクトリ出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "作業ディレクトリ出力"
            cd ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "pwd"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            pwd
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "pwd"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Output Working Directory"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Output Working Directory"
            cd ${filePathParam%/}/tmp/${commandItem}/
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "pwd"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            pwd
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : mkdir                            #
#--------------------------------------------#
function func_command_mkdir() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-pm]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_폴더]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-pm]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象フォルダ]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-pm]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Folders]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "mkdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "폴더를 생성"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1 : 폴더를 생성"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "mkdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "폴더를 생성 전 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            mkdir ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "폴더를 생성 후 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "mkdir -m 710 ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "권한을 설정하면서 폴더 생성"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2 : 폴더를 생성(권한 : 710)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "mkdir -m 710 ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "폴더를 생성 전 : (Directory2)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            mkdir -m 710 ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "폴더를 생성 후 : (Directory2)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory3/SubDirectory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "하위 디렉토리까지 모두 생성"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory3/SubDirectory4 : 폴더를 생성"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory3/SubDirectory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "폴더를 생성 전 : (Directory3/SubDirectory4)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory3/SubDirectory4/
            echo
            echo "폴더를 생성 후 : (Directory3/SubDirectory4)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "mkdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "フォルダ作成"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1 : フォルダ作成"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "mkdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "フォルダ作成前 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            mkdir ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "フォルダ作成後 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "mkdir -m 710 ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "権限を設定しながらフォルダを作成"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2 : フォルダ作成(権限 : 710)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "mkdir -m 710 ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "フォルダ作成前 : (Directory2)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            mkdir -m 710 ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "フォルダ作成後 : (Directory2)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory3/SubDirectory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "下位ディレクトリまですべて作成"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory3/SubDirectory4 : フォルダ作成"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory3/SubDirectory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "フォルダ作成前 : (Directory3/SubDirectory4)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory3/SubDirectory4/
            echo
            echo "フォルダ作成後 : (Directory3/SubDirectory4)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "mkdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Folder Create"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1 : Folder Create"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "mkdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before creating a folder : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            mkdir ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "After creating a folder : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "mkdir -m 710 ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Create folder while setting permissions"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2 : フォルダ作成(権限 : 710)"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "mkdir -m 710 ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before creating a folder : (Directory2)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            mkdir -m 710 ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "After creating a folder : (Directory2)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory3/SubDirectory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Create all down to subdirectories"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory3/SubDirectory4 : Folder Create"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory3/SubDirectory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before creating a folder : (Directory3/SubDirectory4)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory3/SubDirectory4/
            echo
            echo "After creating a folder : (Directory3/SubDirectory4)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : rmdir                            #
#--------------------------------------------#
function func_command_rmdir() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/SubDirectory3/
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-p]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_폴더]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-p]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象フォルダ]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-p]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Folders]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "rmdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "폴더를 삭제"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1 : 폴더를 삭제"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "rmdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "폴더를 삭제 전 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            rmdir ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "폴더를 삭제 후 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "rmdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "하위 디렉토리까지 모두 삭제"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/SubDirectory3 : 폴더를 삭제"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "rmdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "폴더를 삭제 전 : (Directory2/SubDirectory3)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            rmdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "폴더를 삭제 후 : (Directory2/SubDirectory3)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "rmdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "フォルダ削除"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1 : フォルダ削除"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "rmdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "フォルダ削除前 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            rmdir ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "フォルダ削除後 : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "rmdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "下位ディレクトリまですべて削除"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/SubDirectory3 : フォルダ削除"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "rmdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "フォルダ削除前 : (Directory2/SubDirectory3)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            rmdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "フォルダ削除後 : (Directory2/SubDirectory3)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "rmdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Folder Delete"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1 : Folder Delete"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "rmdir ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before deleting a folder : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            rmdir ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "After deleting a folder : (Directory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "rmdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Delete all down to subdirectories"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/SubDirectory3 : Folder Delete"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "rmdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before deleting a folder : (Directory2/SubDirectory3)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            rmdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "After deleting a folder : (Directory2/SubDirectory3)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : rm                               #
#--------------------------------------------#
function func_command_rm() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/
    echo 'TestData' > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo 'TestData' > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt
    echo 'TestData' > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile3.txt
    echo 'TestData' > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile4.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-ifr]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[대상_파일_또는_폴더]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-ifr]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[対象ファイル又はフォルダ]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-ifr]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[Target_Files_or_Folders]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "rm ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일을 삭제"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile1.txt : 파일를 삭제"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "rm ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일를 삭제 전 : (${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory1/
            rm ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "파일를 삭제 후 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "rm -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일을 삭제시 질문"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : 파일를 삭제시 질문"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "rm -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일를 삭제 전 : (${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory1/
            rm -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt
            echo
            echo "파일를 삭제 후 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "rm -f ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일을 강제 삭제"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile3.txt : 파일를 강제 삭제"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "rm -f ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일를 삭제 전 : (${commandItem}_TestFile3.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory1/
            rm -f ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile3.txt
            echo
            echo "파일를 삭제 후 : (${commandItem}_TestFile3.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "rm -r ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "하위 디렉토리까지 모두 삭제"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1/${commandItem}_TestFile4.txt : 하위 디렉토리까지 모두 삭제"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "rm -r ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일를 삭제 전 : (Directory1/${commandItem}_TestFile4.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            rm -r ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "파일를 삭제 후 : (Directory1/${commandItem}_TestFile4.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "rm ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイル削除"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile1.txt : ファイル削除"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "rm ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイル削除前 : (${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory1/
            rm ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "ファイル削除後 : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "rm -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイルを削除する際の質問"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : ファイルを削除する際の質問"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "rm -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイル削除前 : (${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory1/
            rm -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt
            echo
            echo "ファイル削除後 : (${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "rm -f ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイルを強制削除"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile3.txt : ファイルを強制削除"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "rm -f ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイル削除前 : (${commandItem}_TestFile3.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory1/
            rm -f ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile3.txt
            echo
            echo "ファイル削除後 : (${commandItem}_TestFile3.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "rm -r ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "下位ディレクトリまですべて削除"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1/${commandItem}_TestFile4.txt : 下位ディレクトリまですべて削除"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "rm -r ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイル削除前 : (Directory1/${commandItem}_TestFile4.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            rm -r ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "ファイル削除後 : (Directory1/${commandItem}_TestFile4.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "rm ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "File Delete"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile1.txt : File Delete"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "rm ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before deleting a File : (${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory1/
            rm ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            echo "After deleting a File : (${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "rm -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Questions when deleting file"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : Questions when deleting file"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "rm -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before deleting a file : (${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory1/
            rm -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt
            echo
            echo "After deleting a file : (Direct${commandItem}_TestFile2.txtory1)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "rm -f ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Force file deletion"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1 : Force file deletion"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "rm -f ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before deleting a file : (${commandItem}_TestFile3.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory1/
            rm -f ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile3.txt
            echo
            echo "After deleting a file : (${commandItem}_TestFile3.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "rm -r ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Delete all down to subdirectories"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1/${commandItem}_TestFile4.txt : Delete all down to subdirectories"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "rm -r ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before deleting a File : (Directory1/${commandItem}_TestFile4.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            rm -r ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "After deleting a File : (Directory1/${commandItem}_TestFile4.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : mv                               #
#--------------------------------------------#
function func_command_mv() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory3/
    echo 'TestData' > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo 'TestData' > ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
    echo 'TestData' > ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수1]_[인수2]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-ifn]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[대상_파일_또는_폴더]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수2" ":" "[대상_파일_또는_폴더]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数1]_[引数2]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-ifn]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[対象ファイル又はフォルダ]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数2" ":" "[対象ファイル又はフォルダ]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument1]_[argument2]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-ifn]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[Target_Files_or_Folders]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument2" ":" "[Target_Files_or_Folders]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 이동"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile1.txt : 파일 이동"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일 이동 전 : (${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "파일 이동 후 : (${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 이름 변경"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile11.txt : 파일 이름 변경"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일 이름 변경 전 : (수정전 : ${commandItem}_TestFile1.txt, 수정후 : ${commandItem}_TestFile11.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt
            echo
            echo "파일 이름 변경 후 : (수정전 : ${commandItem}_TestFile1.txt, 수정후 : ${commandItem}_TestFile11.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory3/ ${filePathParam%/}/tmp/${commandItem}/Directory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "폴더 이름 변경"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory4/ : 폴더 이름 변경"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory3/ ${filePathParam%/}/tmp/${commandItem}/Directory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "폴더 이름 변경 전 : (수정전 : Directory3, 수정후 : Directory4)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv ${filePathParam%/}/tmp/${commandItem}/Directory3/ ${filePathParam%/}/tmp/${commandItem}/Directory4/
            echo
            echo "폴더 이름 변경 후 : (수정전 : Directory3, 수정후 : Directory4)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "mv -i ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일/폴더 이동 또는 이름 변경시 기존 파일/폴더가 존재한다면 질문"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : 파일/폴더 이동 또는 이름 변경시 기존 파일/폴더가 존재한다면 질문"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "mv -i ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일/폴더 이동 또는 이름 변경시 기존 파일/폴더가 존재한다면 질문 전 : (수정전 : ${commandItem}_TestFile11.txt, 수정후 : ${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv -i ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo "파일/폴더 이동 또는 이름 변경시 기존 파일/폴더가 존재한다면 질문 후 : (수정전 : ${commandItem}_TestFile11.txt, 수정후 : ${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "mv -f ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile3.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 및 폴더 강제이동 또는 강제 이름 변경"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile5.txt : 파일 및 폴더 강제 이동 또는 강제 이름 변경"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "mv -f ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile3.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일 및 폴더 강제 이동 또는 강제 이름 변경 전 : (수정전 : ${commandItem}_TestFile3.txt, 수정후 : ${commandItem}_TestFile5.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory4/
            mv -f ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile3.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt
            echo
            echo "파일 및 폴더 강제 이동 또는 강제 이름 변경 후 : (수정전 : ${commandItem}_TestFile3.txt, 수정후 : ${commandItem}_TestFile5.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory4/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "mv -n ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일/폴더 이동 또는 이름 변경시 기존 파일/폴더가 존재한다면 명령이 실행되지 않음"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : 파일/폴더 이동 또는 이름 변경시 기존 파일/폴더가 존재한다면 명령이 실행되지 않음"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "mv -n ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일/폴더 이동 또는 이름 변경시 기존 파일/폴더가 존재한다면 명령이 실행되지 않음 전 : (수정전 : ${commandItem}_TestFile2.txt, 수정후 : ${commandItem}_TestFile5.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv -n ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt
            echo
            echo "파일/폴더 이동 또는 이름 변경시 기존 파일/폴더가 존재한다면 명령이 실행되지 않음 후 : (수정전 : ${commandItem}_TestFile2.txt, 수정후 : ${commandItem}_TestFile5.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイル移動"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile1.txt : ファイル移動"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイル移動前 : (${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "ファイル移動後 : (${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイル名変更"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile1.txt : ファイル名変更"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイル名変更前 : (変更前 : ${commandItem}_TestFile1.txt, 変更後 : ${commandItem}_TestFile11.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt
            echo
            echo "ファイル名変更前 : (変更前 : ${commandItem}_TestFile1.txt, 変更後 : ${commandItem}_TestFile11.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory3/ ${filePathParam%/}/tmp/${commandItem}/Directory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "フォルダ名変更"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile1.txt : フォルダ名変更"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory3/ ${filePathParam%/}/tmp/${commandItem}/Directory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "フォルダ名変更前 : (変更前 : Directory3, 変更後 : Directory4)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv ${filePathParam%/}/tmp/${commandItem}/Directory3/ ${filePathParam%/}/tmp/${commandItem}/Directory4/
            echo
            echo "フォルダ名変更後 : (変更前 : Directory3, 変更後 : Directory4)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "mv -i ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイルを移動する際の質問"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : ファイルを移動する際の質問"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "mv -i ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイル/フォルダの移動または名前変更時に既存のファイル/フォルダが存在する場合は質問 前 : (変更前 : ${commandItem}_TestFile11.txt, 変更後 : ${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv -i ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo "ファイル/フォルダの移動または名前変更時に既存のファイル/フォルダが存在する場合は質問 後 : (変更前 : ${commandItem}_TestFile11.txt, 変更後 : ${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "mv -f ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile3.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイルを強制移動,強制名前変更"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile5.txt : ファイルを強制移動,強制名前変更"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "mv -f ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile3.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイルを強制移動,強制名前変更 前 : (変更前 : ${commandItem}_TestFile3.txt, 変更後 : ${commandItem}_TestFile5.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory4/
            mv -f ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile3.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt
            echo
            echo "ファイルを強制移動,強制名前変更 後 : (変更前 : ${commandItem}_TestFile3.txt, 変更後 : ${commandItem}_TestFile5.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory4/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "mv -n ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイル/フォルダ移動または名前変更時に既存のファイル/フォルダが存在する場合、命令が実行されない"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : ファイル/フォルダ移動または名前変更時に既存のファイル/フォルダが存在する場合、命令が実行されない"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "mv -n ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイル/フォルダ移動または名前変更時に既存のファイル/フォルダが存在する場合、命令が実行されない 前 : (変更前 : ${commandItem}_TestFile11.txt, 変更後 : ${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv -n ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt
            echo
            echo "ファイル/フォルダ移動または名前変更時に既存のファイル/フォルダが存在する場合、命令が実行されない 後 : (変更前 : ${commandItem}_TestFile11.txt, 変更後 : ${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "File Moving"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile1.txt : File Moving"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before Moving a File : (${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "After Moving a File : (${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Changing the File Name"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile1.txt : Changing the File Name"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before changing the File Name : (Before : ${commandItem}_TestFile1.txt, After : ${commandItem}_TestFile11.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt
            echo
            echo "After changing the File Name : (Before : ${commandItem}_TestFile1.txt, After : ${commandItem}_TestFile11.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory3/ ${filePathParam%/}/tmp/${commandItem}/Directory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Folder Rename"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory4/ : Folder Rename"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "mv ${filePathParam%/}/tmp/${commandItem}/Directory3/ ${filePathParam%/}/tmp/${commandItem}/Directory4/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before Folder Rename : (Before : Directory3, After : Directory4)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv ${filePathParam%/}/tmp/${commandItem}/Directory3/ ${filePathParam%/}/tmp/${commandItem}/Directory4/
            echo
            echo "After Folder Rename : (Before : Directory3, After : Directory4)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "mv -i ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Questions if existing files/folders exist when moving or renaming files/folders"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : Questions if existing files/folders exist when moving or renaming files/folders"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "mv -i ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Questions if existing files/folders exist when moving or renaming files/folders Before : (Before : ${commandItem}_TestFile11.txt, After : ${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv -i ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile11.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo "Questions if existing files/folders exist when moving or renaming files/folders After : (Before : ${commandItem}_TestFile11.txt, After : ${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "mv -f ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile3.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Forced move or rename files and folders"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1 : Forced move or rename files and folders"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "mv -f ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile3.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Forced move or rename files and folders Before : (Before : ${commandItem}_TestFile3.txt, After : ${commandItem}_TestFile5.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory4/
            mv -f ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile3.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt
            echo
            echo "Forced move or rename files and folders After : (Before : ${commandItem}_TestFile3.txt, After : ${commandItem}_TestFile5.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/Directory4/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "Sample${countNumber}" ":" "mv -n ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "Output(expect)" ":" "If an existing file/folder exists when you move or rename a file/folder, the command does not run"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "${commandItem}_TestFile2.txt : If an existing file/folder exists when you move or rename a file/folder, the command does not run"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "Output(Real)" ":" "mv -n ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "If an existing file/folder exists when you move or rename a file/folder, the command does not run Before : (Before : ${commandItem}_TestFile2.txt, After : ${commandItem}_TestFile5.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            mv -n ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory4/${commandItem}_TestFile5.txt
            echo
            echo "If an existing file/folder exists when you move or rename a file/folder, the command does not run After : (Before : ${commandItem}_TestFile2.txt, After : ${commandItem}_TestFile5.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : cp                               #
#--------------------------------------------#
function func_command_cp() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/
    echo 'TestData' > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo 'TestData' > ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
    echo 'TestData' > ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/Test.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수1]_[인수2]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-irpa]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[대상_파일_또는_폴더]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수2" ":" "[대상_파일_또는_폴더]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数1]_[引数2]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-irpa]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[対象ファイル又はフォルダ]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数2" ":" "[対象ファイル又はフォルダ]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument1]_[argument2]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-irpa]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[Target_Files_or_Folders]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument2" ":" "[Target_Files_or_Folders]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 복사"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile1.txt : 파일 복사"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일 복사 전 : (Directory2/${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "파일 복사 후 : (Directory2/${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 복사(이름 재정의)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile3.txt : 파일 복사(이름 재정의)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일 복사(이름 재정의) 전 : (Directory2/${commandItem}_TestFile3.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt
            echo
            echo "파일 복사(이름 재정의) 후 : (Directory2/${commandItem}_TestFile3.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cp -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "출력 경로에 같은 이름의 파일이 존재하는경우 질문"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile3.txt : 출력 경로에 같은 이름의 파일이 존재하는경우 질문"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cp -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "출력 경로에 같은 이름의 파일이 존재하는경우 질문 전 : (Directory2/${commandItem}_TestFile3.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            cp -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt
            echo
            echo "출력 경로에 같은 이름의 파일이 존재하는경우 질문 후 : (Directory2/${commandItem}_TestFile3.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cp -r ${filePathParam%/}/tmp/${commandItem}/Directory2/ ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "하위 디렉토리 모두 복사"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1/${commandItem}_TestFile1.txt"
            echo "Directory1/${commandItem}_TestFile2.txt"
            echo "Directory1/${commandItem}_TestFile3.txt"
            echo "Directory1/Test/Test.txt                : 하위 디렉토리 모두 복사"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cp -r ${filePathParam%/}/tmp/${commandItem}/Directory2/ ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "하위 디렉토리 모두 복사 전 : (Directory1/Test/Test.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            cp -r ${filePathParam%/}/tmp/${commandItem}/Directory2/ ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "하위 디렉토리 모두 복사 후 : (Directory1/Test/Test.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cp -p ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 소유자, 그룹, 권한, 타임스탬프 등을 원본 그대로 복사"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/Test/${commandItem}_TestFile1.txt : 파일 소유자, 그룹, 권한, 타임스탬프 등을 원본 그대로 복사"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cp -p ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "일 소유자, 그룹, 권한, 타임스탬프 등을 원본 그대로 복사 전 : (Directory2/Test/${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            cp -p ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/
            echo
            echo "일 소유자, 그룹, 권한, 타임스탬프 등을 원본 그대로 복사 후 : (Directory2/Test/${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cp -a ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일 소유자, 그룹, 권한, 타임스탬프 등을 원본 그대로 복사(-p) & 심볼릭 링크 제체를 복사하고 원본 참조도 유지"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/Test/${commandItem}_TestFile2.txt : 파일 소유자, 그룹, 권한, 타임스탬프 등을 원본 그대로 복사(-p) & 심볼릭 링크 제체를 복사하고 원본 참조도 유지"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cp -p ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일 소유자, 그룹, 권한, 타임스탬프 등을 원본 그대로 복사(-p) & 심볼릭 링크 제체를 복사하고 원본 참조도 유지 전 : (Directory2/Test/${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            cp -p ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/
            echo
            echo "파일 소유자, 그룹, 권한, 타임스탬프 등을 원본 그대로 복사(-p) & 심볼릭 링크 제체를 복사하고 원본 참조도 유지 후 : (Directory2/Test/${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "フォルダ削除"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile1.txt : ファイルコピー"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイルコピー前 : (Directory2/${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "ファイルコピー後 : (Directory2/${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイルコピー（名前再定義）"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile3.txt : ファイルコピー（名前再定義）"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイルコピー（名前再定義）前 : (Directory2/${commandItem}_TestFile3.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt
            echo
            echo "ファイルコピー（名前再定義）後 : (Directory2/${commandItem}_TestFile3.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cp -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "出力パスに同名のファイルが存在する場合の質問"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile3.txt : 出力パスに同名のファイルが存在する場合の質問"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cp -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "出力パスに同名のファイルが存在する場合の質問前 : (Directory2/${commandItem}_TestFile3.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt
            echo
            echo "出力パスに同名のファイルが存在する場合の質問後 : (Directory2/${commandItem}_TestFile3.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cp -r ${filePathParam%/}/tmp/${commandItem}/Directory2/ ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "サブディレクトリすべてコピー"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1/${commandItem}_TestFile1.txt"
            echo "Directory1/${commandItem}_TestFile2.txt"
            echo "Directory1/${commandItem}_TestFile3.txt"
            echo "Directory1/Test/Test.txt                : サブディレクトリすべてコピー"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cp -r ${filePathParam%/}/tmp/${commandItem}/Directory2/ ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "サブディレクトリすべてコピー前 : (Directory1/Test/Test.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp -r ${filePathParam%/}/tmp/${commandItem}/Directory2/ ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "サブディレクトリすべてコピー後 : (Directory1/Test/Test.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cp -p ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイルの所有者、グループ、権限、タイムスタンプなどを元のままコピー"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/Test/${commandItem}_TestFile1.txt : ファイルの所有者、グループ、権限、タイムスタンプなどを元のままコピー"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cp -p ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイルの所有者、グループ、権限、タイムスタンプなどを元のままコピー前 : (Directory2/Test/${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp -p ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/
            echo
            echo "ファイルの所有者、グループ、権限、タイムスタンプなどを元のままコピー後 : (Directory2/Test/${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cp -a ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイルの所有者、グループ、権限、タイムスタンプなどを元のままコピー(-p)&シンボリックリンクの堤体をコピーし、原本参照も保持"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/Test/${commandItem}_TestFile2.txt : ファイルの所有者、グループ、権限、タイムスタンプなどを元のままコピー(-p)&シンボリックリンクの堤体をコピーし、原本参照も保持"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cp -a ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイルの所有者、グループ、権限、タイムスタンプなどを元のままコピー(-p)&シンボリックリンクの堤体をコピーし、原本参照も保持前 : (Directory2/Test/${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp -a ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/
            echo
            echo "ファイルの所有者、グループ、権限、タイムスタンプなどを元のままコピー(-p)&シンボリックリンクの堤体をコピーし、原本参照も保持後 : (Directory2/Test/${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "File copy"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile1.txt : File copy"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before File copy : (Directory2/${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/
            echo
            echo "After File copy : (Directory2/${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Copy File (Rename)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile3.txt : Copy File (Rename)"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before Copy File (Rename) : (Directory2/${commandItem}_TestFile3.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt
            echo
            echo "After Copy File (Rename) : (Directory2/${commandItem}_TestFile3.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cp -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Questions if a file of the same name exists in the output path"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/${commandItem}_TestFile3.txt : Questions if a file of the same name exists in the output path"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cp -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before Questions if a file of the same name exists in the output path : (Directory2/${commandItem}_TestFile3.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile3.txt
            echo
            echo "After Questions if a file of the same name exists in the output path : (Directory2/${commandItem}_TestFile3.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cp -r ${filePathParam%/}/tmp/${commandItem}/Directory2/ ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Copy all subdirectories"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory1/${commandItem}_TestFile1.txt"
            echo "Directory1/${commandItem}_TestFile2.txt"
            echo "Directory1/${commandItem}_TestFile3.txt"
            echo "Directory1/Test/Test.txt                : Copy all subdirectories"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cp -r ${filePathParam%/}/tmp/${commandItem}/Directory2/ ${filePathParam%/}/tmp/${commandItem}/Directory1/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before Copy all subdirectories : (Directory1/Test/Test.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp -r ${filePathParam%/}/tmp/${commandItem}/Directory2/ ${filePathParam%/}/tmp/${commandItem}/Directory1/
            echo
            echo "After Copy all subdirectories : (Directory1/Test/Test.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cp -p ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Copy file owners, groups, privileges, timestamps, and so on"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/Test/${commandItem}_TestFile1.txt : Copy file owners, groups, privileges, timestamps, and so on"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cp -p ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before Copy file owners, groups, privileges, timestamps, and so on : (Directory2/Test/${commandItem}_TestFile1.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp -p ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/
            echo
            echo "After Copy file owners, groups, privileges, timestamps, and so on : (Directory2/Test/${commandItem}_TestFile1.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cp -a ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Copy file owners, groups, privileges, timestamps, and so on(-p) & copy the symbolic link system and maintain the original reference"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Directory2/Test/${commandItem}_TestFile2.txt : Copy file owners, groups, privileges, timestamps, and so on(-p) & copy the symbolic link system and maintain the original reference"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cp -a ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Before Copy file owners, groups, privileges, timestamps, and so on (-p) & copy the symbolic link system and maintain the original reference: (Directory2/Test/${commandItem}_TestFile2.txt)"
            ls -l ${filePathParam%/}/tmp/${commandItem}/
            cp -a ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/Test/
            echo
            echo "After Copy file owners, groups, privileges, timestamps, and so on (-p) & copy the symbolic link system and maintain the original reference: (Directory2/Test/${commandItem}_TestFile2.txt)"
            ls -lR ${filePathParam%/}/tmp/${commandItem}/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : cut                              #
#--------------------------------------------#
function func_command_cut() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    echo '1234567890' > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'ABCDEFGHIJKL' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo '2b yteString1 2byteS,tring2,2byteString3' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo '2byteString12byteString2,2byteString3' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'ＡTestFile1,3Testing2,3Testing3' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo 'あTestFile14Testing2,4Testing3' >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수1]_[인수2]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-bcfdw]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[출력_자릿수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수2" ":" "[대상_파일]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数1]_[引数2]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-bcfdw]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[出力桁数]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数2" ":" "[対象ファイル]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument1]_[argument2]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-bcfdw]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[Output_digits]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument2" ":" "[Target_File]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cut -b 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "각 라인 선두에서부터 n바이트 위치의 문자 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1 : 선두에서부터 n바이트 위치의 문자 출력"
            echo "A "
            echo "2 "
            echo "2 "
            echo "  : 멀티바이트 문자는 정상적으로 출력되지 않을 가능성이 있다."
            echo "  "
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cut -b 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -b 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cut -b 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "각 라인 선두에서부터 n바이트 위치부터 m바이트 위치까지의 문자 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "12345 : 선두에서부터 n바이트 위치부터 m바이트 위치까지의 문자 출력"
            echo "ABCDE "
            echo "2b yt "
            echo "2byte "
            echo "ＡTes : 멀티바이트 문자는 정상적으로 출력되지 않을 가능성이 있다."
            echo "あTes "
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cut -b 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -b 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cut -c 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "각 라인 선두에서부터 n번째 위치의 문자 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1 : 선두에서부터 n번째 위치의 문자 출력"
            echo "A "
            echo "2 "
            echo "2 "
            echo "Ａ "
            echo "あ "
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cut -c 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -c 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cut -c 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "각 라인 선두에서부터 n번째 위치부터 m번째 위치까지의 문자 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "12345 : 선두에서부터 n번째 위치부터 m번째 위치까지의 문자 출력"
            echo "ABCDE "
            echo "2b yt "
            echo "2byte "
            echo "ＡTest "
            echo "あTest "
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cut -c 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -c 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cut -f1 -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "스페이스로 구분지어서 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1234567890"
            echo "ABCDEFGHIJKL"
            echo "2b"
            echo "2byteString12byteString2,2byteString3"
            echo "ＡTestFile1,3Testing2,3Testing3"
            echo "あTestFile14Testing2,4Testing3"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cut -f1 -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -f1 -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cut -f1 -d ,  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cut -f1 -d ',' ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cut -f1 -d "," ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "cut -f1 -d, ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "-d옵션뒤의 기호로 구분하며 -f뒤의 n번째 항목 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1234567890"
            echo "ABCDEFGHIJKL"
            echo "2b yteString1 2byteS"
            echo "2byteString12byteString2"
            echo "ＡTestFile1"
            echo "あTestFile14Testing2"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cut -f1 -d , ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cut -f1 -d ',' ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cut -f1 -d "," ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "cut -f1 -d, ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -f1 -d ,  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
            cut -f1 -d ',' ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
            cut -f1 -d "," ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
            cut -f1 -d, ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cut -b 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "各行先頭からnバイト位置の文字を出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1 : 各行先頭からnバイト位置の文字を出力"
            echo "A "
            echo "2 "
            echo "2 "
            echo "  : マルチバイト文字は正常に出力されない可能性がある"
            echo "  "
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cut -b 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -b 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cut -b 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "先頭からnバイト位置からmバイト位置までの文字出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "12345 : 各行先頭からnバイト位置からmバイト位置までの文字出力"
            echo "ABCDE "
            echo "2b yt "
            echo "2byte "
            echo "ＡTes : マルチバイト文字は正常に出力されない可能性がある"
            echo "あTes "
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cut -b 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -b 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cut -c 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "先頭先頭からn番目の位置の文字出"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1 : 先頭先頭からn番目の位置の文字出"
            echo "A "
            echo "2 "
            echo "2 "
            echo "Ａ "
            echo "あ "
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cut -c 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -c 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cut -c 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "先頭からn番目の位置からm番目の位置までの文字出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "12345 : 先頭からn番目の位置からm番目の位置までの文字出力"
            echo "ABCDE "
            echo "2b yt "
            echo "2byte "
            echo "ＡTest "
            echo "あTest "
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cut -c 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -c 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cut -f1 -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "先頭からn番目の位置からm番目の位置までの文字出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1234567890"
            echo "ABCDEFGHIJKL"
            echo "2b"
            echo "2byteString12byteString2,2byteString3"
            echo "ＡTestFile1,3Testing2,3Testing3"
            echo "あTestFile14Testing2,4Testing3"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cut -f1 -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -f1 -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cut -f1 -d ,  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cut -f1 -d ','  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cut -f1 -d ","  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "cut -f1 -d,  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "-dオプションの後ろの記号で区分し-fの後ろのn番目の項目を出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1234567890"
            echo "ABCDEFGHIJKL"
            echo "2b"
            echo "2byteString12byteString2,2byteString3"
            echo "ＡTestFile1,3Testing2,3Testing3"
            echo "あTestFile14Testing2,4Testing3"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cut -f1 -d , ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cut -f1 -d ',' ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cut -f1 -d "," ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "cut -f1 -d, ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -f1 -d ,  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
            cut -f1 -d ',' ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
            cut -f1 -d "," ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
            cut -f1 -d, ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cut -b 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Text output from each line lead to [n]bit position"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1 : Text output from each line lead to [n]bit position"
            echo "A "
            echo "2 "
            echo "2 "
            echo "  : There is a possibility that the multi-byte character may not be output normally"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cut -b 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -b 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cut -b 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Delete all down to subdirectories"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "12345 : Character output from the beginning to the [n]byte position to the [m]byte position"
            echo "ABCDE "
            echo "2b yt "
            echo "2byte "
            echo "ＡTes : There is a possibility that the multi-byte character may not be output normally"
            echo "あTes "
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cut -b 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -b 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cut -c 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Character output from the beginning to the [n]th position"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1 : Character output from the beginning to the [n]th position"
            echo "A "
            echo "2 "
            echo "2 "
            echo "Ａ "
            echo "あ "
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cut -c 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -c 1 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cut -c 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Character output from head to [n]th position to [m]th position"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "12345 : Character output from head to [n]th position to [m]th position"
            echo "ABCDE "
            echo "2b yt "
            echo "2byte "
            echo "ＡTest "
            echo "あTest "
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cut -c 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -c 1-5 ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cut -f1 -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Output separated by space"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1234567890"
            echo "ABCDEFGHIJKL"
            echo "2b"
            echo "2byteString12byteString2,2byteString3"
            echo "ＡTestFile1,3Testing2,3Testing3"
            echo "あTestFile14Testing2,4Testing3"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cut -f1 -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -f1 -w ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cut -f1 -d ,  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cut -f1 -d ','  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cut -f1 -d ","  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "cut -f1 -d,  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "The -d option is symbol-separated and the nth item is displayed after the -f option"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "1234567890"
            echo "ABCDEFGHIJKL"
            echo "2b yteString1 2byteS"
            echo "2byteString12byteString2"
            echo "ＡTestFile1"
            echo "あTestFile14Testing2"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cut -f1 -d ,  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cut -f1 -d ','  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cut -f1 -d ","  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "cut -f1 -d,  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            cut -f1 -d ,  ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
            cut -f1 -d ',' ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
            cut -f1 -d "," ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
            cut -f1 -d, ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : dd                               #
#--------------------------------------------#
function func_command_dd() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    echo "TestFile01TestFile02TestFile03TestFile04TestFile05TestFile06TestFile07TestFile08TestFile09TestFile10" > ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수1]_[인수2]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[대상_입력파일]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수2" ":" "[대상_출력파일]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数1]_[引数2]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[対象入力ファイル]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数2" ":" "[対象出力ファイル]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument1]_[argument2]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[Target_InputFile]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument2" ":" "[Target_OutputFile]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "블록 단위로 복사해서 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 블록 단위로 복사해서 출력"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt" bs=32'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "32byte 블록 단위로 복사해서 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 32byte 블록 단위로 복사해서 출력"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt" bs=32'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt" bs=32
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt" bs=32 count=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "32byte 블록 단위로 2블록 만큼 복사해서 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 32byte 블록 단위로 2블록 만큼 복사해서 출력"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt" bs=32 count=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt" bs=32 count=2
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt" bs=32 skip=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "32byte 블록 단위로 2블록 만큼 스킵후 나머지 복사해서 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 32byte 블록 단위로 2블록 만큼 스킵후 나머지 복사해서 출력"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt" bs=32 skip=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt" bs=32 skip=2
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ブロック単位でコピーして出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " ブロック単位でコピーして出力"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt" bs=32'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "32byteブロック単位でコピーして出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 32byteブロック単位でコピーして出力"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt" bs=32'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt" bs=32
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt" bs=32 count=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "32byteブロック単位で2ブロック分コピーして出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 32byteブロック単位で2ブロック分コピーして出力"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt" bs=32 count=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt" bs=32 count=2
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt" bs=32 skip=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "32byteブロック単位で2ブロック分スキップした後、残りをコピーして出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 32byteブロック単位で2ブロック分スキップした後、残りをコピーして出力"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt" bs=32 skip=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt" bs=32 skip=2
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Copy in blocks and print out"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Copy in blocks and print out"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt" bs=32'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Copy and print in 32-byte blocks"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " Copy and print in 32-byte blocks"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt" bs=32'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt" bs=32
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt" bs=32 count=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Copy and output 2 blocks per 32 byte block"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " Copy and output 2 blocks per 32 byte block"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt" bs=32 count=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt" bs=32 count=2
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile4.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt" bs=32 skip=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Skip by 2 blocks per 32-byte block and copy the rest and output it"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " Skip by 2 blocks per 32-byte block and copy the rest and output it"
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" 'dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt" bs=32 skip=2'
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            dd if="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile1.txt" of="${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt" bs=32 skip=2
            cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile5.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : diff                             #
#--------------------------------------------#
function func_command_diff() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory2/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory3/
    echo "Test File01" > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo "Test File02" >> ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo "Test File03" >> ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo "Test File04" >> ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo "Test File05" >> ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo "Test File01" > ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
    echo "Test File02" >> ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
    echo "Test File03" >> ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
    echo "Test File04" >> ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
    echo "Test File05" >> ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
    echo "Test   File01" > ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
    echo "Test File02" >> ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
    echo "test File03" >> ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
    echo "test File04" >> ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
    echo "test File05" >> ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수1]_[인수2]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-qsib]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[대상_파일]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수2" ":" "[대상_파일]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数1]_[引数2]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-qsib]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[対象ファイル]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数2" ":" "[対象ファイル]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument1]_[argument2]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-qsib]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[Target_File]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument2" ":" "[Target_File]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "두 파일을 비교"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 차이가 없는 파일 비교 : 출력 없음"
            echo
            echo " 차이가 있는 파일 비교"
            echo " 1c1"
            echo " < Test File01"
            echo " ---"
            echo " > Test   File01"
            echo " 3,5c3,5"
            echo " < Test File03"
            echo " < Test File04"
            echo " < Test File05"
            echo " ---"
            echo " > test File03"
            echo " > test File04"
            echo " > test File05"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 차이가 없는 파일 비교"
            diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " 차이가 있는 파일 비교"
            diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "차이가 있는 파일의 경우 differ 라고 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 차이가 없는 파일 비교 : 출력 없음"
            echo
            echo " 차이가 있는 파일 비교 : [인수1] and [인수2] differ 출력"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 차이가 없는 파일 비교"
            diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " 차이가 있는 파일 비교"
            diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "차이가 없는 파일의 경우 identical 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 차이가 없는 파일 비교 : [인수1] and [인수2] identical 출력"
            echo
            echo " 차이가 있는 파일 비교"
            echo " 3,5c3,5"
            echo " < TestFile03"
            echo " < TestFile04"
            echo " < TestFile05"
            echo " ---"
            echo " > testFile03"
            echo " > testFile04"
            echo " > testFile05"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 차이가 없는 파일 비교"
            diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " 차이가 있는 파일 비교"
            diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "대소문자 구분없이 파일 비교"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 차이가 없는 파일 비교 : 출력 없음"
            echo
            echo " 차이가 있는 파일 비교"
            echo " 1c1"
            echo " < Test File01"
            echo " ---"
            echo " > Test   File01"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 차이가 없는 파일 비교"
            diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " 차이가 있는 파일 비교"
            diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "연속된 스페이스는 하나로 인식하여 파일 비교"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 차이가 없는 파일 비교 : 출력 없음"
            echo
            echo " 차이가 있는 파일 비교"
            echo " 3,5c3,5"
            echo " < TestFile03"
            echo " < TestFile04"
            echo " < TestFile05"
            echo " ---"
            echo " > testFile03"
            echo " > testFile04"
            echo " > testFile05"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 차이가 없는 파일 비교"
            diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " 차이가 있는 파일 비교"
            diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイルの比較"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 差のないファイル比較 : 出力なし"
            echo
            echo " 異なるファイルを比較"
            echo " 1c1"
            echo " < Test File01"
            echo " ---"
            echo " > Test   File01"
            echo " 3,5c3,5"
            echo " < Test File03"
            echo " < Test File04"
            echo " < Test File05"
            echo " ---"
            echo " > test File03"
            echo " > test File04"
            echo " > test File05"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 差のないファイル比較"
            diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " 異なるファイルを比較"
            diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "差のあるファイルの場合、differと出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 差のないファイル比較 : 出力なし"
            echo
            echo " 異なるファイルを比較 : [引数1] and [引数2] differ 出力"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 差のないファイル比較"
            diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " 異なるファイルを比較"
            diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "差のないファイルの場合、identical出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 差のないファイル比較 : [引数1] and [引数2] identical 出力"
            echo
            echo " 異なるファイルを比較"
            echo " 3,5c3,5"
            echo " < TestFile03"
            echo " < TestFile04"
            echo " < TestFile05"
            echo " ---"
            echo " > testFile03"
            echo " > testFile04"
            echo " > testFile05"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 差のないファイル比較"
            diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " 異なるファイルを比較"
            diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "大文字と小文字の区別なくファイルを比較"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 差のないファイル比較 : 出力なし"
            echo
            echo " 異なるファイルを比較"
            echo " 1c1"
            echo " < Test File01"
            echo " ---"
            echo " > Test   File01"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 差のないファイル比較"
            diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " 異なるファイルを比較"
            diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "連続したスペースは一つとして認識し、ファイルを比較"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 差のないファイル比較 : 出力なし"
            echo
            echo " 異なるファイルを比較"
            echo " 3,5c3,5"
            echo " < TestFile03"
            echo " < TestFile04"
            echo " < TestFile05"
            echo " ---"
            echo " > testFile03"
            echo " > testFile04"
            echo " > testFile05"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " 差のないファイル比較"
            diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " 異なるファイルを比較"
            diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Compare two files"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " File comparison without difference : no output"
            echo
            echo " Compare files with differences"
            echo " 1c1"
            echo " < Test File01"
            echo " ---"
            echo " > Test   File01"
            echo " 3,5c3,5"
            echo " < Test File03"
            echo " < Test File04"
            echo " < Test File05"
            echo " ---"
            echo " > test File03"
            echo " > test File04"
            echo " > test File05"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " Comparison of files without difference"
            diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " Compare files with differences"
            diff ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Output as differ for files with differences"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " File comparison without difference : no output"
            echo
            echo " Compare files with differences : [argument1] and [argument2] differ print"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " Comparison of files without difference"
            diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " Compare files with differences"
            diff -q ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "identical output for files with no difference"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " File comparison without difference : [argument1] and [argument2] identical print"
            echo
            echo " Compare files with differences"
            echo " 3,5c3,5"
            echo " < TestFile03"
            echo " < TestFile04"
            echo " < TestFile05"
            echo " ---"
            echo " > testFile03"
            echo " > testFile04"
            echo " > testFile05"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " Comparison of files without difference"
            diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " Compare files with differences"
            diff -s ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "case sensitive file comparison"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " File comparison without difference : no output"
            echo
            echo " Compare files with differences"
            echo " 1c1"
            echo " < Test File01"
            echo " ---"
            echo " > Test   File01"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " Comparison of files without difference"
            diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " Compare files with differences"
            diff -i ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Recognize consecutive spaces as one and compare files"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " File comparison without difference : no output"
            echo
            echo " Compare files with differences"
            echo " 3,5c3,5"
            echo " < TestFile03"
            echo " < TestFile04"
            echo " < TestFile05"
            echo " ---"
            echo " > testFile03"
            echo " > testFile04"
            echo " > testFile05"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo " Comparison of files without difference"
            diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory2/${commandItem}_TestFile2.txt
            echo
            echo " Compare files with differences"
            diff -b ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt ${filePathParam%/}/tmp/${commandItem}/Directory3/${commandItem}_TestFile3.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : find                             #
#--------------------------------------------#
function func_command_find() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory2/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/
    mkdir -p ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory4/
    echo "Test File01" > ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
    echo "Test File02" > ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/${commandItem}_TestFile2.txt
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[인수1]_[옵션]_[인수2]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[대상_파일_또는_폴더]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-name | -maxdepth | -print | -delete]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수2" ":" "[검색패턴]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[引数1]_[オプション]_[引数2]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[対象ファイル又はフォルダ]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-name | -maxdepth | -print | -delete]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数2" ":" "[検索パタン]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[argument1]_[option]_[argument2]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[Target_Files_or_Folders]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-name | -maxdepth | -print | -delete]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument2" ":" "[Target_Pattern]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "파일이 존재 하는지 체크"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "파일이 존재하면 해당 경로 출력, 없다면 No such file or directory"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "하위 디렉토리까지 파일/폴더들을 모두 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "하위 디렉토리까지 파일/폴더들을 모두 출력"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*TestF*" '
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*Directory2*" '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "지정된 패턴으로 파일/폴더를 검색"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "지정된 패턴으로 파일/폴더를 검색하여 결과값이 있다면 파일/폴더 경로 출력"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*TestF*" '
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*Directory2*" '
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*TestF*"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*Directory2*"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print '
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print0 '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "하위 폴더의 모든 파일을 출력(-print : 개행있음, -print0 : 개행없음)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "하위 폴더의 모든 파일을 출력(-print : 개행있음, -print0 : 개행없음)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print '
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory2 -name '*find*' -print0 '
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "-print"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print
            echo
            echo "-print0"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print0
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3 -maxdepth 2 -name "*File2*" '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "깊이 n만큼의 상위 경로까지만 검색"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "깊이 n만큼의 상위 경로까지만 검색"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3 -maxdepth 2 -name "*File2*" '
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "깊이 3의 파일은 검색이 안됨"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3 -maxdepth 2 -name "*File2*" 
            echo
            echo "깊이 2의 파일이 검색"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4 -maxdepth 2 -name "*File2*" 
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/find_TestFile2.txt -name "*File2*" -delete '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "검색된 패턴의 파일 삭제"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "검색된 패턴의 파일 삭제"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/find_TestFile2.txt -name "*File2*" -delete '
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            ls ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/
            echo "검색된 패턴의 파일 삭제"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/find_TestFile2.txt -name "*File2*" -delete
            ls ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ファイルが存在するかどうかをチェック"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ファイルが存在する場合はそのパスを出力、存在しない場合は[No such file or directory]"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "下位ディレクトリまでファイル/フォルダをすべて出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "下位ディレクトリまでファイル/フォルダをすべて出力"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*TestF*" '
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*Directory2*" '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "指定されたパターンでファイル/フォルダを検索"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "指定されたパターンでファイル/フォルダを検索し、結果値がある場合はファイル/フォルダ経路を出力"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*TestF*" '
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*Directory2*" '
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*TestF*"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*Directory2*"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print '
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print0 '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "下位フォルダのすべてのファイルを出力(-print:改行あり、-print0:改行なし)"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "下位フォルダのすべてのファイルを出力(-print:改行あり、-print0:改行なし)"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print '
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print0 '
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "-print"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print
            echo
            echo "-print0"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print0
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3 -maxdepth 2 -name "*File2*" '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "深さ2の上位経路まで検索"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "深さ2の上位経路まで検索"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3 -maxdepth 2 -name "*File2*" '
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "深さ3のファイルは検索できない"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3 -maxdepth 2 -name "*File2*" 
            echo
            echo "深さ2のファイルが検索"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4 -maxdepth 2 -name "*File2*" 
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/find_TestFile2.txt -name "*File2*" -delete '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "検索されたパターンのファイルを削除"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "検索されたパターンのファイルを削除"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/find_TestFile2.txt -name "*File2*" -delete '
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            ls ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/
            echo "検索されたパターンのファイルを削除"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/find_TestFile2.txt -name "*File2*" -delete
            ls ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Check if a file exists"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Check if a file exists, Not exist : No such file or directory"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile1.txt
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/${commandItem}_TestFile2.txt
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Outputs all files/folders in the subdirectory"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Outputs all files/folders in the subdirectory"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*TestF*" '
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*Directory2*" '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Search for files/folders in a specified pattern"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Search for files/folders in a specified pattern and output the file/folder path if there is a result"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "find ${filePathParam%/}/tmp/${commandItem}/Directory1"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*TestF*"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name "*Directory2*"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print '
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print0 '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Outputs all files in subfolders (-print: New Line, -print0: )"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Outputs all files in subfolders (-print: New Line, -print0: )"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print '
        printf "    %-15s %s %s\n" "Output(Real)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print0 '
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "-print"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print
            echo
            echo "-print0"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1 -name '*find*' -print0
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3 -maxdepth 2 -name "*File2*" '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Search only up to upper path by depth n"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Search only up to upper path by depth n"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3 -maxdepth 2 -name "*File2*" '
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Files with depth 3 are not retrieved"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3 -maxdepth 2 -name "*File2*" 
            echo
            echo "File at depth 2 is detected"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4 -maxdepth 2 -name "*File2*" 
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/find_TestFile2.txt -name "*File2*" -delete '
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Delete files in retrieved patterns"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Delete files in retrieved patterns"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" 'find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/find_TestFile2.txt -name "*File2*" -delete '
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            ls ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/
            echo "Delete files in retrieved patterns"
            find ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/find_TestFile2.txt -name "*File2*" -delete
            ls ${filePathParam%/}/tmp/${commandItem}/Directory1/Directory3/Directory4/Directory5/
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : clear                            #
#--------------------------------------------#
function func_command_clear() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "clear"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "작업중인 터미널 화면을 정리"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "작업중인 터미널 화면을 정리"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "clear"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            clear
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "clear"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "作業中のターミナル画面を整理"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "作業中のターミナル画面を整理"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "clear"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            clear
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "clear"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Clean up the terminal screen you're working on"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Clean up the terminal screen you're working on"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "clear"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            clear
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : man                              #
#--------------------------------------------#
function func_command_man() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[인수1]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[명령어]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[引数1]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[コマンド]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[argument1]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[Command]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "man cat"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "다른 명령어에 대한 매뉴얼 페이지를 표시하는 데 사용"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "다른 명령어에 대한 매뉴얼 페이지를 표시하는 데 사용"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "man cat"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            man cat
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "man cat"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "他のコマンドのマニュアルページを表示するために使います"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "他のコマンドのマニュアルページを表示するために使います"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "man cat"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            man cat
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "man cat"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Used to display manual pages for other commands"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Used to display manual pages for other commands"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "man cat"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            man cat
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : df                               #
#--------------------------------------------#
function func_command_df() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-hHl]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-hHl]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-hHl]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "df -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "단위가 1024로 계산되어 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "단위가 1024로 계산되어 출력"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "df -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            df -h
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "df -H"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "단위가 1000로 계산되어 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "단위가 1000로 계산되어 출력"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "df -H"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            df -H
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "df -l"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "로컬 마운트 디스크 정보만을 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "로컬 마운트 디스크 정보만을 출력"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "df -l"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            df -l
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "df -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "単位が1024で計算され出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "単位が1024で計算され出力"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "df -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            df -h
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "df -H"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "単位が1000で計算され出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "単位が1000で計算され出力"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "df -H"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            df -H
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "df -l"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ローカルマウントディスク情報のみを出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ローカルマウントディスク情報のみを出力"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "df -l"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            df -l
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "df -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Unit calculated as 1024 and output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Unit calculated as 1024 and output"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "df -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            df -h
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "df -H"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Unit calculated as 1000 and output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Unit calculated as 1000 and output"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "df -H"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            df -H
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "df -l"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Output local mount disk information only"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Output local mount disk information only"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "df -l"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            df -l
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : du                               #
#--------------------------------------------#
function func_command_du() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수1]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-ahs]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수1" ":" "[대상_파일_또는_폴더]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数1]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-ahs]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数1" ":" "[対象ファイル又はフォルダ]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument1]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-ahs]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument1" ":" "[Target_Files_or_Folders]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "du -a ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "하위 디렉토리내의 모든 파일/폴더의 용량을 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "하위 디렉토리내의 모든 파일/폴더의 용량을 출력"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "du -a ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            du -a ${filePathParam%/}
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "du -h ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "단위가 1024로 계산되어 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "단위가 1024로 계산되어 출력"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "du -h ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            du -h ${filePathParam%/}
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "du -s ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "지정 폴더의 사용 용량의 합계 출력"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "지정 폴더의 사용 용량의 합계 출력"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "du -s ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            du -s ${filePathParam%/}
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "du -a ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "下位ディレクトリ内のすべてのファイル/フォルダの容量を出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "下位ディレクトリ内のすべてのファイル/フォルダの容量を出力"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "du -a ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            du -a ${filePathParam%/}
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "du -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "単位が1024で計算され出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "単位が1024で計算され出力"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "du -h"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            du -h
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "du -s ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "指定フォルダの使用容量の合計出力"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "指定フォルダの使用容量の合計出力"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "du -s ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            du -s ${filePathParam%/}
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "du -a ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Outputs the capacity of all files/folders in a subdirectory"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Outputs the capacity of all files/folders in a subdirectory"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "du -a ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            du -a ${filePathParam%/}
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "du -h ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Unit calculated as 1024 and output"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Unit calculated as 1024 and output"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "du -h ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            du -h ${filePathParam%/}
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        echo
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "du -s ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Total Output of Capacity Used for a Specified Folder"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Total Output of Capacity Used for a Specified Folder"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "du -s ${filePathParam%/}"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            du -s ${filePathParam%/}
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command : history                          #
#--------------------------------------------#
function func_command_history() {
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local ouputLanguageParam=$1
    ### File Path Parameter / 파일 패스 파라미터 / ファイルパスパラメータ
    local filePathParam=$2
    ### English Command Description Parameter / 영어 명령어 설명 파라미터 / 英語コマンド説明パラメータ
    local commandDescriptionEnParam=$3
    ### Korean Command Description Parameter / 한국어 명령어 설명 파라미터 / 韓国語コマンド説明パラメータ
    local commandDescriptionKrParam=$4
    ### Japense Command Description Parameter / 일본어 명령어 설명 파라미터 / 日本語コマンド説明パラメータ
    local commandDescriptionJpParam=$5
    ### Command / 명령어 / コマンド
    local commandItem=$6
    ### Count / 번호 / 番号 
    local countNumber=0

    mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    old_LC_ALL=${LC_ALL}
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" ${commandItem}
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※사용법" ":" "${commandItem}" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-18s %s %s\n" "※使用法" ":" "${commandItem}" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※HowToUse" ":" "${commandItem}" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        export LC_ALL="ko_KR.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-12s %s %-15s\n" "샘플${countNumber}" ":" "history"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(예상)" ":" "터미널에서 최근에 실행된 명령어 목록을 표시"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "터미널에서 최근에 실행된 명령어 목록을 표시"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "출력결과(실제)" ":" "history"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            history
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        export LC_ALL="ja_JP.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-14s %s %-15s\n" "サンプル${countNumber}" ":" "history"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(予想)" ":" "ターミナルで最近実行されたコマンドのリストを表示"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "ターミナルで最近実行されたコマンドのリストを表示"
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-21s %s %s\n" "出力結果(実際)" ":" "history"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            history
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    else
        export LC_ALL="en_US.UTF-8"
        countNumber=$((${countNumber}+1))
        printf "#============================================================================================#\n"
        printf "  %-10s %s %-15s\n" "Sample${countNumber}" ":" "history"
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(expect)" ":" "Displays a list of recently executed commands from the terminal"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            echo "Displays a list of recently executed commands from the terminal"
            echo 
        printf "#--------------------------------------------------------------------------------------------#\n"
        printf "    %-15s %s %s\n" "Output(Real)" ":" "history"
        printf "#--------------------------------------------------------------------------------------------#\n"
            echo
            history
            echo
        printf "#--------------------------------------------------------------------------------------------#\n"
    fi
        echo
    printf "##############################################################################################\n"

    export LC_ALL=${old_LC_ALL}

    ### tmp Directory Delete / 임시 디렉토리 삭제 / 作業ディレクトリ削除
    rm -rf ${filePathParam%/}/tmp/${commandItem}/

    func_basicSetting_LogFileName_Path ${PID} "1" ${commandItem}
    echo 
    
}

#--------------------------------------------#
# Command List                               #
#  : 명령어 리스트                               #
#  : コマンドリスト                              #
#--------------------------------------------#
readonly calEn="It_allows_you_to_view_the_calendar_based_on_the_date_and_month_and_you_can_also_specify_a_particular_month_or_year_for_display"
readonly calKr="날짜와_월에_따라_달력을_확인할_수_있으며_특정_월이나_연도를_지정하여_출력"
readonly calJp="日付と月によってカレンダーを確認でき、特定の月や年を指定して表示"
readonly catEn="It_is_primarily_used_to_read_and_display_text_files_on_the_screen_and_can_be_used_to_communicate_the_contents_of_files_to_other_commands"
readonly catKr="주로_텍스트_파일을_읽어_화면에_표시할_때_사용되며_여러_파일을_순서대로_결합하거나_파일의_내용을_다른_명령어로_전달하는데에도_활용"
readonly catJp="主にテキストファイルを読み込んで画面に表示するために使用され、ファイルの内容を他のコマンドに渡すためにも利用"
readonly cdEn="Command_is_used_to_change_the_current_working_directory_in_a_command-line_interface"
readonly cdKr="명령줄_인터페이스에서_현재_작업_디렉토리를_변경하는데_사용"
readonly cdJp="コマンドラインインターフェイスの現在の作業ディレクトリを変更するために使用"
readonly chgrpEn="Use_commands_to_change_group_ownership_of_files_or_directories"
readonly chgrpKr="명령어는_파일이나_디렉토리의_그룹_소유권을_변경하는데_사용"
readonly chgrpJp="ファイルやディレクトリのグループ所有権を変更するために使用"
readonly chmodEn="Use_to_change_permissions_for_files_or_directories"
readonly chmodKr="파일이나_디렉토리의_권한을_변경하는데_사용"
readonly chmodJp="ファイルやディレクトリのパーミッションを変更するために使用"
readonly chownEn="Used_to_change_the_owner_of_a_file_or_directory"
readonly chownKr="파일이나_디렉토리의_소유자를_변경하는데_사용"
readonly chownJp="ファイルやディレクトリの所有者を変更するために使用"
readonly clearEn="Clear_the_terminal_screen_to_provide_a_clean_workspace"
readonly clearKr="터미널_화면을_지워_깨끗한_작업_공간을_제공"
readonly clearJp="ターミナル画面を消してきれいな作業スペースを提供"
readonly cpEn="The_command_in_Unix/Linux_is_used_to_copy_files_or_directories"
readonly cpKr="파일_또는_디렉토리를_복사하는데_사용"
readonly cpJp="ファイルやディレクトリをコピーするため使用"
readonly cutEn="Used_to_extract_a_specific_portion_of_text_from_a_file_or_stream"
readonly cutKr="파일이나_스트림에서_특정_텍스트_부분을_추출하는데_사용"
readonly cutJp="ファイルやストリームから特定のテキスト部分を抽出するために使用"
readonly dateEn="Displays_the_date_and_time_of_the_current_system_and_formats_the_output._Also_used_to_calculate_or_manipulate_dates_and_times"
readonly dateKr="현재_시스템의_날짜와_시간이_표시되며_포맷을_지정하여_출력.날짜_및_시간을_계산하거나_조작하는데에도_사용"
readonly dateJp="現在のシステムの日付と時刻が表示され、フォーマットを指定して表示することもできます。また、日付や時刻の計算や操作にも使用"
readonly ddEn="Used_primarily_for_tasks_such_as_creating_disk_images,copying_data_between_devices,_and_converting_file_formats"
readonly ddKr="디스크_이미지_생성,_장치_간_데이터_복사,파일_형식_변환_등과_같은_작업에_사용"
readonly ddJp="ディスクイメージの作成、デバイス間のデータ複製、ファイルフォーマットの変換などのタスクによく使われます"
readonly dfEn="Use_to_display_information_about_disk_space_usage"
readonly dfKr="디스크_공간_사용에_관한_정보를_표시하는_데_사용"
readonly dfJp="ディスク領域の使用に関する情報を表示するために使用"
readonly diffEn="Use_to_compare_the_contents_of_two_files_or_directories"
readonly diffKr="두_파일_또는_디렉토리의_내용을_비교하는_데_사용"
readonly diffJp="2つのファイルまたはディレクトリの内容を比較するために使われます"
readonly duEn="Used_to_estimate_disk_space_usage_for_files_and_directories"
readonly duKr="파일과_디렉토리의_디스크_공간_사용량을_추정하는_데_사용"
readonly duJp="ファイルとディレクトリのディスク領域の使用量を推定するために使用"
readonly exprEn="It_is_employed_in_tasks_such_as_evaluating_expressions_entered_by_users_in_the_terminal_or_finding_patterns_in_strings"
readonly exprKr="사용자가_입력한_표현식을_계산하거나_문자열에서_패턴을_찾아내는_등의_작업에_사용"
readonly exprJp="ユーザーが入力した式を計算したり、文字列からパターンを検出するなどの作業に使用"
readonly findEn="Used_to_search_for_files_and_directories_in_a_directory_hierarchy_based_on_a_variety_of_conditions"
readonly findKr="다양한_조건을_기반으로_디렉토리_계층에서_파일_및_디렉토리를_검색하는_데_사용"
readonly findJp="さまざまな条件に基づいてディレクトリツリー内のファイルやディレクトリを検索するために使用"
readonly gunzipEn="Command_is_used_to_decompress_files_compressed_with_gzip.This_command_is_employed_to_extract_and_restore_the_original_file"
readonly gunzipKr="gzip으로_압축된_파일을_해제하는데_사용됩니다.이_명령어는_파일을_압축_해제하고_원래_파일을_복원하는데_활용"
readonly gunzipJp="gzipで圧縮されたファイルを解凍するために使用されます。このコマンドはファイルを解凍し、元のファイルを復元するのに利用"
readonly gzipEn="Command_is_used_to_compress_files_primarily_useful_for_large_files_or_when_archiving_multiple_files"
readonly gzipKr="파일을_압축하는데_사용됩니다.주로_대용량_파일이나_여러_파일을_아카이브할_때_활용"
readonly gzipJp="ファイルを圧縮するために使用されます。主に大容量ファイルや複数のファイルをアーカイブする際に利用"
readonly headEn="Command_is_used_to_display_the_beginning(head)_of_a_file"
readonly headKr="파일의_처음_부분을_표시하는데_사용"
readonly headJp="ファイルの先頭部分を表示するために使用"
readonly historyEn="Displays_a_list_of_recently_executed_commands_from_the_terminal"
readonly historyKr="터미널에서_최근에_실행된_명령어_목록을_표시"
readonly historyJp="ターミナルで最近実行されたコマンドのリストを表示"
readonly manEn="Used_to_display_manual_pages_for_other_commands"
readonly manKr="다른_명령어에_대한_매뉴얼_페이지를_표시하는데_사용"
readonly manJp="他のコマンドのマニュアルページを表示するために使用"
readonly mkdirEn="Used_to_create_a_directory"
readonly mkdirKr="디렉터리를_생성하는데_사용"
readonly mkdirJp="ディレクトリを作成するために使用"
readonly mvEn="Used_to_move_or_rename_files_or_directories"
readonly mvKr="파일이나_디렉터리를_이동하거나_이름을_변경하는데_사용"
readonly mvJp="ファイルやディレクトリを移動または名前を変更するために使用"
readonly pwdEn="Outputs_the_directory_you_are_currently_working_on"
readonly pwdKr="현재_작업_중인_디렉터리를_출력"
readonly pwdJp="現在の作業ディレクトリを表示"
readonly rmEn="Use_to_delete_files_or_directories_from_Linux"
readonly rmKr="리눅스에서_파일이나_디렉터리를_삭제하기_위해_사용"
readonly rmJp="Linuxでファイルやディレクトリを削除するために使用"
readonly rmdirEn="Use_Linux_to_delete_empty_directories"
readonly rmdirKr="리눅스에서_비어있는_디렉터리를_삭제하는_데_사용"
readonly rmdirJp="Linuxで空のディレクトリを削除するために使用"
readonly sleepEn="It_is_commonly_used_in_scripts_or_programs_when_you_want_to_pause_execution_for_a_certain_duration"
readonly sleepKr="지정된_시간_동안_실행을_지연시키는데_사용됩니다.주로_스크립트나_프로그램에서_일정한_시간_동안_대기하고자_할_때_활용"
readonly sleepJp="指定された時間の間、実行を遅延させるために使用されます。主にスクリプトやプログラムで一定の時間待機させたい場合に利用"
readonly tailEn="Command_is_used_to_display_the_last_part_of_a_file"
readonly tailKr="파일의_마지막_부분을_표시하는데_사용"
readonly tailJp="ファイルの最後の部分を表示するために使用"
readonly touchEn="Used_to_create_empty_files_or_update_access_and_modification_times_for_existing_files"
readonly touchKr="빈_파일을_생성하거나_기존_파일의_액세스_및_수정_시간을_업데이트하는데_사용"
readonly touchJp="空のファイルを作成したり、既存ファイルのアクセスおよび修正のタイムスタンプを更新するために使用"
readonly uniqEn="Used_to_remove_duplicate_rows_or_to_output_only_one_of_successively_repeated_rows"
readonly uniqKr="중복된_행을_제거하거나_연속적으로_반복된_행_중_하나만을_출력하는데_사용"
readonly uniqJp="重複する行を削除するか、連続して繰り返される行の1つのみを出力するために使用"
readonly unzipEn="Command_is_used_to_extract_files_from_a_ZIP_archive.It's_commonly_used_to_unzip_compressed_files_or_directories"
readonly unzipKr="ZIP_파일을_해제하는데_사용됩니다.주로_압축된_파일이나_디렉토리를_푸는데_활용"
readonly unzipJp="ZIPファイルを解凍するために使用されます。主に圧縮されたファイルやディレクトリを解凍するのに利用"
readonly wcEn="Command_is_used_to_count_the_number_of_lines_words_and_bytes_in_a_file.It's_often_used_to_report_statistics_on_text_files_or_as_part_of_data_processing"
readonly wcKr="파일의_행_단어_바이트_수를_세는데_사용됩니다.텍스트_파일의_통계_정보를_보고하거나_데이터_처리에서_활용"
readonly wcJp="ファイルの行数、単語数、バイト数を数えるのに使用されます。テキストファイルの統計情報を報告するか、データ処理で利用"
readonly zipEn="Command_is_used_to_compress_files_and_directories_creating_a_compressed_archive.It's_primarily_used_to_save_space_by_compressing_files_or_when_transferring_files"
readonly zipKr="파일_및_디렉터리를_압축하고_압축_파일을_만드는데_사용됩니다.주로_파일을_압축하여_용량을_절약하거나_파일을_전송할_때_활용"
readonly zipJp="ファイルやディレクトリを圧縮し、圧縮ファイルを作成するのに使用されます。主にファイルを圧縮して容量を節約しファイルを転送する際に利用"
declare -a commandList=("cal" "cat" "cd" "chgrp" "chmod" "chown" "clear" "cp" "cut" "date" "dd" "df" "diff" "du" "expr" "find" "gunzip" "gzip" "head" "man" "mkdir" "mv" "pwd" "rm" "rmdir" "sleep" "tail" "touch" "uniq" "unzip" "wc" "zip")
declare -a commandDescriptionEn=("${calEn}" "${catEn}" "${cdEn}" "${chgrpEn}" "${chmodEn}" "${chownEn}" "${clearEn}" "${cpEn}" "${cutEn}" "${dateEn}" "${ddEn}" "${dfEn}" "${diffEn}" "${duEn}" "${exprEn}" "${findEn}" "${gunzipEn}" "${gzipEn}" "${headEn}" "${manEn}" "${mkdirEn}" "${mvEn}" "${pwdEn}" "${rmEn}" "${rmdirEn}" "${sleepEn}" "${tailEn}" "${touchEn}" "${uniqEn}" "${unzipEn}" "${wcEn}" "${zipEn}")
declare -a commandDescriptionKr=("${calKr}" "${catKr}" "${cdKr}" "${chgrpKr}" "${chmodKr}" "${chownKr}" "${clearKr}" "${cpKr}" "${cutKr}" "${dateKr}" "${ddKr}" "${dfKr}" "${diffKr}" "${duKr}" "${exprKr}" "${findKr}" "${gunzipKr}" "${gzipKr}" "${headKr}" "${manKr}" "${mkdirKr}" "${mvKr}" "${pwdKr}" "${rmKr}" "${rmdirKr}" "${sleepKr}" "${tailKr}" "${touchKr}" "${uniqKr}" "${unzipKr}" "${wcKr}" "${zipKr}")
declare -a commandDescriptionJp=("${calJp}" "${catJp}" "${cdJp}" "${chgrpJp}" "${chmodJp}" "${chownJp}" "${clearJp}" "${cpJp}" "${cutJp}" "${dateJp}" "${ddJp}" "${dfJp}" "${diffJp}" "${duJp}" "${exprJp}" "${findJp}" "${gunzipJp}" "${gzipJp}" "${headJp}" "${manJp}" "${mkdirJp}" "${mvJp}" "${pwdJp}" "${rmJp}" "${rmdirJp}" "${sleepJp}" "${tailJp}" "${touchJp}" "${uniqJp}" "${unzipJp}" "${wcJp}" "${zipJp}")

#--------------------------------------------#
# Script Basic Variable Setting              #
#  : 스크립트 기본 변수 설정                       #
#  : スクリプトの基本変数設定                      #
#--------------------------------------------#
### parameterCount / 파라미터 수 / パラメータ数
paramCount=$#
### ProcessID / 프로세스ID / プロセスID
PID=$$
### searchCommand / 검색명령어 / 検索コマンド
searchCommand=$1
### Output Language / 출력 언어 / 出力言語
ouputLanguage=$2
### Start Flg / 시작 Flg / 開始フラグ
startedFlg=0

#--------------------------------------------#
# Main Logic                                 #
#  : 메인 처리                                  #
#  : メイン処理                                 #
#--------------------------------------------#
### Parameter Check / 파라미터 체크 / パラメータチェック
#"# echo "CHECK TREE 1"
if [[ ! -z ${searchCommand} ]] || [[ ${startedFlg} == 0 ]];then 
    func_linuxCommandsExistCheck ${searchCommand}
fi

#"# echo "CHECK TREE 2"
if [[ ! -z ${searchCommand} && ${existCheck} == 0 ]];then
    clear
    echo
    func_notExistCommand ${searchCommand} ${ouputLanguage} ${existCheck}
    exit
fi
#"# echo "CHECK TREE 3"
if [[ -z ${ouputLanguage} ]];then
    clear
    ouputLanguage="en"
    func_howToUse
fi
#"# echo "CHECK TREE 4"
if ! [[ ${ouputLanguage} == [eE][nN] || ${ouputLanguage} == [kK][rR] || ${ouputLanguage} == [jJ][pP] ]];then
    func_supportLanguage
    exit
else
    clear
fi

echo
#"# echo "CHECK TREE 5"
### Function Run / 함수 실행 / 関数実行
func_basicSetting_StartingRunTime ${ouputLanguage} 
### Function Run / 함수 실행 / 関数実行
func_basicSetting_LogFileName_Path ${PID} "0" ${searchCommand}

while true
do
    if [[ startedFlg -ge 1 ]];then
        clear
    fi

    if [[ ${startedFlg} == 0 && ! -z ${searchCommand} ]];then
        selectMenu=2
    else
        ### Function Run / 함수 실행 / 関数実行
        #"# echo "CHECK TREE 6"
        func_mainMenu ${ouputLanguage}
    fi

    if [[ ${selectMenu} == 1 ]];then
        clear
        ### Function Run / 함수 실행 / 関数実行
        #"# echo "CHECK TREE 7"
        func_selectLanguage ${ouputLanguage}
    elif [[ ${selectMenu} == 2 ]];then
        clear
        while true
        do
            clear
            if [[ ${startedFlg} -gt 0 && ! -z ${searchCommand} ]] || [[ -z ${searchCommand} ]];then
                ### Function Run / 함수 실행 / 関数実行
                #"# echo "CHECK TREE 8"
                func_linuxCommandsList 1 ${ouputLanguage} 
            fi
            existCheck=0
            ### Function Run / 함수 실행 / 関数実行
            #"# echo "CHECK TREE 9"
            func_linuxCommandsExistCheck ${searchCommand}
            if [[ ${existCheck} == 1 ]];then
                #"# echo "CHECK TREE 10"
                func_linuxCommandExample ${ouputLanguage} ${filePath} ${commandItemIndex} 
            fi
        done
    elif [[ ${selectMenu} == 3 ]];then
        clear

    elif [[ ${selectMenu} == "終了" || ${selectMenu} == "종료" || ${selectMenu} == [eE][nN][dD] || ${selectMenu} == [eE][xX][iI][tT] ||  ${selectMenu} == 9 ]];then
        ### Function Run / 함수 실행 / 関数実行
        #"# echo "CHECK TREE 11"
        func_scriptEnd ${ouputLanguage}
    else
        continue
    fi
    selectMenu=0
    startedFlg=$((${startedFlg}+1))
done

### Function Run / 함수 실행 / 関数実行
func_basicSetting_LogFileName_Path ${PID} "1" ${searchCommand}

## What to do when adding a command (ex:gzip)
## 명령어 추가시 작업 내용 (예:gzip)
## コマンド追加時の作業内容 (例:gzip)
#readonly gzipEn="Compress_or_decompress_a_file"
#readonly gzipKr="파일을_압축하거나_압축_해제"
#readonly gzipJp="ファイルを圧縮したり解凍する"
#declare -a commandList=("cat" "expr" "sleep" "gzip")
#declare -a commandDescriptionEn=("${catEn}" "${exprEn}" "${sleepEn}" "${gzipEn}")
#declare -a commandDescriptionKr=("${catKr}" "${exprKr}" "${sleepKr}" "${gzipKr}")
#declare -a commandDescriptionJp=("${catJp}" "${exprJp}" "${sleepJp}" "${gzipJp}")
#func_linuxCommandExample case 추가