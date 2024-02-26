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
    languageParam=$1
    
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
    fileRelativePath=$0
    ### relativePath -> AbsolutePath / 상대경로 -> 절대경로 / 相対パス -> 絶対パス
    fileAbsolutePath=$(realpath "$fileRelativePath")
    ### ShellScript Name / 쉘 스크립트 이름 / シェルスクリプト名
    scriptName=$(basename $0)
    ### FilePath / 파일 패스 / ファイルパス
    filePath=${fileAbsolutePath%/*}/
    ### LogPath / 로그 패스 / ログパス
    logPath=${fileAbsolutePath%/*}/log/
    ### ProcessID / 프로세스ID / プロセスID
    PID=$1
    ### StartEndflg / 시작종료flg / 開始終了flg
    startEndflg=$2
    ### Command Parameter / 명령어 파라미터 / コマンドパラメータ
    searchCommandParam=$3

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
    languageParam=$1

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
    languageParam=$1

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
    languageParam=$1

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
    languageParam=$1

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
    existCheckParam=$1
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    languageParam=$2

    ### Function Main Logic / 함수 메인 로직 / 関数メインロジック
    Index=0
    echo
    printf "##############################################################################################\n"
    if [[ ${languageParam} == [kK][rR] ]]; then
        printf "  %-8s %s  %-18s %s  %-102s\n" "번호" "#" "명령어" "#" "설명"
        printf "##############################################################################################\n"
        for commandIndex in ${commandList[@]}; do
            printf "  %03d    %s  %-15s %s  %-100s\n" ${Index} "#" ${commandList[${Index}]} "#" ${commandDescriptionKr[${Index}]} | sed 's/_/ /g'
            Index=$(( ${Index} + 1 ))
        done
    elif [[ ${languageParam} == [jJ][pP] ]]; then
        printf "  %-8s %s  %-19s %s  %-102s\n" "番号" "#" "コマンド" "#" "説明"
        printf "##############################################################################################\n"
        for commandIndex in ${commandList[@]}; do
            printf "  %03d    %s  %-15s %s  %-100s\n" ${Index} "#" ${commandList[${Index}]} "#" ${commandDescriptionJp[${Index}]} | sed 's/_/ /g'
            Index=$(( ${Index} + 1 ))
        done
    else
        printf "  %-6s %s  %-15s %s  %-100s\n" "Number" "#" "Command" "#" "Description"
        printf "##############################################################################################\n"
        for commandIndex in ${commandList[@]}; do
            printf "  %03d    %s  %-15s %s  %-100s\n" ${Index} "#" ${commandList[${Index}]} "#" ${commandDescriptionEn[${Index}]} | sed 's/_/ /g'
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

}

#--------------------------------------------#
# Linux Commands Exist Check                 #
#  : Included Linux Commands Exist Check     #
#  : 포함된 리눅스 명령어 존재 체크                 #
#  : 含まれているLinuxコマンド存在チェック            #
#--------------------------------------------#
function func_linuxCommandsExistCheck() {

    ### Command List Array / 명령어 리스트 배열 / コマンドリスト配列
    commandListParam=($@)

    ### Command List Array Length / 명령어 리스트 배열 길이 / コマンドリスト配列長
    commandListArrayLength="${#commandListParam}"

    ### Last Item Except New Array / 마지막 항목 제외 신규 배열 / 最後項目除外新規配列
    commandNewList=(${commandListParam[@]:0:$((commandListArrayLength-1))})

    ### Command Parameter / 명령어 파라미터 / コマンドパラメータ
    searchCommandParam="${commandListParam[${commandListArrayLength}]}"

    ### Command Exist Check Flg / 명령어 존재 체크 플래그 / コマンド存在チェックフラグ
    existCheck=0

    ### Command Array Index / 명령어 리스트 인덱스 / コマンド配列インデックス
    commandItemIndex=0
    for commandItem in ${commandNewList[@]}; do
        if [[ ${commandItem} == ${searchCommandParam} ]];then
            existCheck=1
            break
        fi
        commandItemIndex=$(( ${commandItemIndex} + 1 ))
    done

}

#--------------------------------------------#
# Not Exist Command                          #
#  : Not Exist Command                       #
#  : 존재하지 않는 명령어                         #
#  : 存在しないコマンド                           #
#--------------------------------------------#
function func_notExistCommand() {
    

    ### Command Parameter / 명령어 파라미터 / コマンドパラメータ
    searchCommandParam=$1
    
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    ouputLanguageParam=$2

    ### Exist Check Parameter / 존재 체크 파라미터 / 存在チェックパラメータ
    existCheckParam=$3

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
}

#--------------------------------------------#
# Linux Command Example                      #
#  : Linux Command Example                   #
#  : 리눅스 명령어 예                            #
#  : Linuxコマンド例                            #
#--------------------------------------------#
function func_linuxCommandExample() {

    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    ouputLanguageParam=$1
    ### FilePath / 파일 패스 파라미터 / ファイルパスパラメータ
    filePath=$2
    ### Array Index / 배열 인덱스 파라미터 / 配列インデックスパラメータ
    commandItemIndex=$3

    clear
    echo
    case ${searchCommandParam} in
        cat)
            func_command_cat ${ouputLanguageParam} ${filePath} ${commandDescriptionEn[${commandItemIndex}]} ${commandDescriptionKr[${commandItemIndex}]} ${commandDescriptionJp[${commandItemIndex}]}
            ;;
        cd)
            echo " $caseVar2 is us2 "
            ;;
        us)
            echo " $caseVar3 is us3 "
            ;;
        *) echo " caseVar ? " # default
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

}

#--------------------------------------------#
# Command : cat                              #
#--------------------------------------------#
function func_command_cat() {
    ouputLanguageParam=$1
    filePathParam=$2
    commandDescriptionEnParam=$3
    commandDescriptionKrParam=$4
    commandDescriptionJpParam=$5
    commandItem="cat"



    echo "${filePathParam%/}"
    #mkdir -p ${filePathParam%/}/tmp/${commandItem}/
    echo "testFile,Command,data" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo "" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo "File,Command,data" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo "" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo "Command,date" >> ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt
    echo
    clear
    func_basicSetting_LogFileName_Path ${PID} "0" "cat"
    printf "##############################################################################################\n"
    echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-16s %s %s\n" "명령어" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "기본설명" ":" "${commandDescriptionKrParam}" | sed 's/_/ /g'
        printf "  %-16s %s %s\n" "※사용법" ":" "${commandItem}_[옵션]_[인수]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※옵션" ":" "[-benst]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※인수" ":" "[파일경로]" | sed 's/_/ /g'
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-17s %s %s\n" "コマンド" ":" "${commandItem}"
        printf "  %-17s %s %s\n" "基本説明" ":" "${commandDescriptionJpParam}" | sed 's/_/ /g'
        printf "  %-16s %s %s\n" "※使用法" ":" "${commandItem}_[オプション]_[引数]" | sed 's/_/ /g'
        printf "  %-20s %s %s\n" "※オプション" ":" "[-benst]" | sed 's/_/ /g'
        printf "  %-17s %s %s\n" "※引数" ":" "[ファイルパス]" | sed 's/_/ /g'
    else
        printf "  %-13s %s %s\n" "Command" ":" "${commandItem}"
        printf "  %-13s %s %s\n" "Description" ":" "${commandDescriptionEnParam}" | sed 's/_/ /g'
        printf "  %-13s %s %s\n" "※HowToUse" ":" "${commandItem}_[option]_[argument]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※option" ":" "[-benst]" | sed 's/_/ /g'
        printf "  %-15s %s %s\n" "※argument" ":" "[filePath]" | sed 's/_/ /g'
    fi
        echo
        printf "##############################################################################################\n"
        echo
    if [[ ${ouputLanguageParam} == [kK][rR] ]];then
        printf "  %-15s\n" "cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-21s %s\n" "출력결과(예상)" ":"
        printf "    %-21s %s\n" "출력결과(실제)" ":"
    elif [[ ${ouputLanguageParam} == [jJ][pP] ]];then
        printf "  %-15s\n" "cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-21s %s\n" "出力結果(予想)" ":"
        printf "    %-21s %s\n" "出力結果(実際)" ":"
    else
        printf "  %-15s\n" "cat ${filePathParam%/}/tmp/${commandItem}/${commandItem}_TestFile.txt"
        printf "    %-15s %s\n" "Output(expect)" ":"
        printf "    %-15s %s\n" "Output(Real)" ":"
    fi
        echo
    printf "##############################################################################################\n"
    func_basicSetting_LogFileName_Path ${PID} "1" "cat"
    echo 
    
}

#--------------------------------------------#
# Command List                               #
#  : 명령어 리스트                               #
#  : コマンドリスト                              #
#--------------------------------------------#
readonly catEn="Reads_files_sequentially_and_records_them_as_standard_outputs.file_operands_are_handled_in_command_line_order"
readonly catKr="파일을_순차적으로_읽고_표준_출력으로_기록하며_파일_피연산자는_명령줄_순서로_처리"
readonly catJp="ファイルを順番に読み取って標準出力で記録し、ファイルの被演算子はコマンドライン順に処理します"
readonly cdEn="Reads_files_sequentially_and_records_them_as_standard_outputs.file_operands_are_handled_in_command_line_order"
readonly cdKr="파일을_순차적으로_읽고_표준_출력으로_기록하며_파일_피연산자는_명령줄_순서로_처리"
readonly cdJp="ファイルを順番に読み取って標準出力で記録し、ファイルの被演算子はコマンドライン順に処理します"
declare -a commandList=("cat" "cd" "history")
declare -a commandDescriptionEn=("${catEn}" "${cdEn}" "history")
declare -a commandDescriptionKr=("${catKr}" "${cdKr}" "history")
declare -a commandDescriptionJp=("${catJp}" "${cdJp}" "history")

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
if [[ ! -z ${searchCommand} ]] || [[ ${startedFlg} == 0 ]];then 
    func_linuxCommandsExistCheck ${commandList[@]} ${searchCommand}
fi

if [[ ! -z ${searchCommand} && ${existCheck} == 0 ]];then
    clear
    echo
    func_notExistCommand ${searchCommand} ${ouputLanguage} ${existCheck}
    exit
elif [[ -z ${ouputLanguage} ]];then
    clear
    func_howToUse
elif ! [[ ${ouputLanguage} == [eE][nN] || ${ouputLanguage} == [kK][rR] || ${ouputLanguage} == [jJ][pP] ]];then
    func_supportLanguage
    exit
else
    clear
fi

echo
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
        func_mainMenu ${ouputLanguage}
    fi

    if [[ ${selectMenu} == 1 ]];then
        clear
        ### Function Run / 함수 실행 / 関数実行
        func_selectLanguage ${ouputLanguage}
    elif [[ ${selectMenu} == 2 ]];then
        clear
        while true
        do
            clear
            if [[ ${startedFlg} -gt 0 && ! -z ${searchCommand} ]] || [[ -z ${searchCommand} ]];then
                ### Function Run / 함수 실행 / 関数実行
                func_linuxCommandsList 1 ${ouputLanguage} 
            fi
            existCheck=0
            ### Function Run / 함수 실행 / 関数実行
            func_linuxCommandsExistCheck ${commandList[@]} ${searchCommand}
            if [[ ${existCheck} == 1 ]];then
                func_linuxCommandExample ${ouputLanguage} ${filePath} ${commandItemIndex} 
            fi
        done
    elif [[ ${selectMenu} == 3 ]];then
        clear

    elif [[ ${selectMenu} == "終了" || ${selectMenu} == "종료" || ${selectMenu} == [eE][nN][dD] || ${selectMenu} == [eE][xX][iI][tT] ||  ${selectMenu} == 9 ]];then
        ### Function Run / 함수 실행 / 関数実行
        func_scriptEnd ${ouputLanguage}
    else
        continue
    fi
    selectMenu=0
    startedFlg=$((${startedFlg}+1))
done

### Function Run / 함수 실행 / 関数実行
func_basicSetting_LogFileName_Path ${PID} "1" ${searchCommand}