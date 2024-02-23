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
# PrintMenu                                  #
#  : Main Menu Print                         #
#  : 메인 메뉴 출력                            　#
#  : メインメニュー出力                           #
#--------------------------------------------#
function PrintMenu() {

    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    languageParam=$1

    ### Function Main Logic / 함수 메인 로직 / 関数メインロジック
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
        read -p " 메뉴 선택 : " SelectMenu
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
        read -p " メニュー選択 : " SelectMenu
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
        read -p " Select Menu : " SelectMenu
        echo
    
    fi
    
    ### Shell Script End / 쉘 스크립트 종료 / シェルスクリプト終了
    if [[ ${SelectMenu} == "終了" || ${SelectMenu} == "종료" || ${SelectMenu} == [eE][nN][dD] || ${SelectMenu} == [eE][xX][iI][tT] ||  ${SelectMenu} == 9 ]];then
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
    fi
}

#--------------------------------------------#
# Selectlanguage                             #
#--------------------------------------------#
function Selectlanguage() {

    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    languageParam=$1

    ### Function Main Logic / 함수 메인 로직 / 関数メインロジック
    while true
    do
        if [[ ${languageParam} == [kK][rR] ]];then
            echo
            printf "  ******************************\n"
        printf "  * %-31s*\n"                       "1. 언어 선택"
            echo "  *          언어 선택           *"
            printf "  ******************************\n"
            echo "  * 1. 영어(en)                  *"
            echo "  * 2. 한국어(kr)                *"
            echo "  * 3. 일본어(jp)                *"
            echo "  *                            *"
            echo "  * 9. 이전메뉴                  *"
            printf "  ******************************\n"
            echo 
            read -p " 출력 언어를 선택해주세요. : " SelectLanguage
            echo
        elif [[ ${languageParam} == [jJ][pP] ]]; then
            echo
            echo "  ******************************"
            echo "  *          言語選択           *"
            echo "  ******************************"
            echo "  * 1. 英語(en)                 *"
            echo "  * 2. 韓国語(kr)                *"
            echo "  * 3. 日本語(jp)                *"
            echo "  *                            *"
            echo "  * 9. 前のメニュー                *"
            echo "  ******************************"
            echo 
            read -p " 出力言語を選択ください。 : " SelectLanguage
            echo
        else
            echo
            echo "  ******************************"
            echo "  *      Select Language      *"
            echo "  ******************************"
            echo "  * 1. English(en)             *"
            echo "  * 2. Korean(kr)              *"
            echo "  * 3. Japense(jp)             *"
            echo "  *                            *"
            echo "  * 9. Previous Menu           *"
            echo "  ******************************"
            echo 
            read -p " Select Language. : " SelectLanguage
            echo
        fi

        ### ** Regular Expression logic / 정규표현식 처리 / 正規表現式ロジック 
        ### Parameter exist / 파라미터가 존재 / パラメータが存在
        if [[ ${SelectLanguage} == 1 || ${SelectLanguage} == [eE][nN] ]]; then
            languageParam="en"
            OuputLanguage="en"
            break
        elif [[ ${SelectLanguage} == 2 || ${SelectLanguage} == [kK][rR] ]]; then
            languageParam="kr"
            OuputLanguage="kr"
            break
        elif [[ ${SelectLanguage} == 3 || ${SelectLanguage} == [jJ][pP] ]]; then
            languageParam="jp"
            OuputLanguage="jp"
            break
        else
            if [[ ${languageParam} == [eE][nN] ]]; then
                echo "### Please check the language. (case-insensitive : en, kr, jp) ###"
                echo "### Please check the Number.   (                    1,  2, 3 ) ###"
            elif [[ ${languageParam} == [kK][rR] ]]; then
                echo "### 출력 언어를 선택해주세요. (대소문자 구분없음 : en, kr, jp) ###"
                echo "### 출력 번호를 선택해주세요. (                 1,  2, 3 ) ###"
            elif [[ ${languageParam} == [jJ][pP] ]]; then
                echo "### 出力言語を選択してください. (大小文字区別無し : en, kr, jp) ###"
                echo "### 出力番号を選択してください. (                1,  2, 3 ) ###"
            fi
        fi

        if [ ${SelectLanguage} = 9 ]; then
            break
        fi

    done
}

#--------------------------------------------#
# basicSetting(RunTime)                      #
#--------------------------------------------#
function basicSetting_RunTime() {
    
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
    if [[ "$1" == [eE][nN] ]]; then
        functionOutput="### Shell Running Time：${sys_YYYY}-${sys_MM}-${sys_DD} ${sys_hh}:${sys_mm}:${sys_ss} ###"
    elif [[ "$1" == [kK][rR] ]]; then
        functionOutput="### 쉘 기동 시작 시간：${sys_YYYY}년${sys_MM}월${sys_DD}일 ${sys_hh}시${sys_mm}분${sys_ss}초 ###"
    elif [[ "$1" == [jJ][pP] ]]; then
        functionOutput="### シェル起動開始時間：${sys_YYYY}年${sys_MM}月${sys_DD}日 ${sys_hh}時${sys_mm}分${sys_ss}秒 ###"
    else
        functionOutput="### Shell Running Time：${sys_YYYY}-${sys_MM}-${sys_DD} ${sys_hh}:${sys_mm}:${sys_ss} ###"
    fi

    ### Result print / 결과 출력 / 結果出力
    echo ${functionOutput}

}

#--------------------------------------------#
# basicSetting(FileName_Path)                #
#--------------------------------------------#
function basicSetting_FileName_Path() {
    
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
    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    languageParam=$1
    ### ProcessID / 프로세스ID / プロセスID
    PID=$2
    ### StartEndflg / 시작종료flg / 開始終了flg
    SEflg=$3
    ### Command Parameter / 명령어 파라미터 / コマンドパラメータ
    CommandParam=$4

    ### Directory exists check / 디렉토리 존재 체크 / ディレクトリ存在チェック
    if [ -d "${logPath}" ]; then
        logFilePath=""
    else
        mkdir -p ${logPath}
    fi

    ### Directory or File exists check / 디렉토리 또는 파일 존재 체크 / ディレクトリ又はファイル存在チェック
    if [ -e "${logPath}" ]; then
        logFilePath=""
    else
        mkdir -p ${logPath}
    fi

    ### Directory exists check / 디렉토리 존재 체크 / ディレクトリ存在チェック
#    if ls -d "${logPath}" 2>/dev/null; then
#        logFilePath=""
#    else
#        mkdir -p ${logPath}
#    fi

    ### logFileName Set / 로그 파일명 설정 / ログファイル名
    if [ -z ${CommandParam} ];then
        logFilePath=${logPath%/}/shellCommand_`date +%Y%m%d`.log
    else
        logFilePath=${logPath%/}/shellCommand_${CommandParam}_`date +%Y%m%d`.log
    fi

    ### log Print / 로그 출력 / ログファイル出力
    if [ ${SEflg} -eq 0 ]; then
        echo "### `date +%Y/%m/%d-%H:%M:%S` [${PID}] ${scriptName} >>> ${CommandParam} START "
        echo "### `date +%Y/%m/%d-%H:%M:%S` [${PID}] ${scriptName} >>> ${CommandParam} START " >> ${logFilePath}
    else
        echo "### `date +%Y/%m/%d-%H:%M:%S` [${PID}] ${scriptName} >>> ${CommandParam} END "
        echo "### `date +%Y/%m/%d-%H:%M:%S` [${PID}] ${scriptName} >>> ${CommandParam} END " >> ${logFilePath}
    fi
}

#--------------------------------------------#
# Script Setting                             #
#--------------------------------------------#
### parameterCount / 파라미터 수 / パラメータ数
paramCount=$#
### ProcessID / 프로세스ID / プロセスID
PID=$$
### SearchCommand / 검색명령어 / 検索コマンド
SearchCommand=$1
### Output Language / 출력 언어 / 出力言語
OuputLanguage=$2
#--------------------------------------------#
# Main logic                                 #
#--------------------------------------------#
### Parameter Check / 파라미터 체크 / パラメータチェック
if [[ ${paramCount} == 0 || ${paramCount} == 1 ]];then
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
    echo
fi

while true
do
    ### Function Run / 함수 실행 / 関数実行
    PrintMenu ${OuputLanguage}

    if [[ ${SelectMenu} == 1 ]];then
        ### Function Run / 함수 실행 / 関数実行
        Selectlanguage ${OuputLanguage}
    else
        continue
    fi 

done