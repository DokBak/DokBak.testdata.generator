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
#  Parameter1  (optional) : Language                                              #
#  Parameter2  (optional) : Command                                               #
#                                                                                 #
###################################################################################
#                                                                                 #
#  쉘  이름      : 참조 쉘                                                            #
#                                                                                 #
#  작 성 자      : DokBak                                                           #
#  작 성 일      : 2024/2/21          신규 작성                                       #
#  수 정 일      :                                                                  #
#                                                                                 #
#  처리 개요      : 쉘 스크립트 작성을 위한 참조 쉘                                         #
#                                                                                 #
#  파라미터       :                                                                  #
#  파라미터1  (옵션) : 언어                                                            #
#  파라미터2  (옵션) : 명령어                                                          #
#                                                                                 #
###################################################################################
#                                                                                 #
#  スクリプト名  : 参照シェル                                                           #
#                                                                                 #
#  作成者     : DokBak                                                              #
#  作成日 : 2024/2/21          新規作成                                               #
#  修正日 :                                                                         #
#                                                                                 #
#  処理概要 : シェルスクリプト作成に参考できる参照シェル                                        #
#                                                                                 #
#  パラメータ   :                                                                    #
#  パラメータ1  (任意) : 言語                                                          #
#  パラメータ2  (任意) : 命令語                                                         #
#                                                                                 #
###################################################################################

#--------------------------------------------#
# languageCheck                           #
#--------------------------------------------#
function languageCheck() {

    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    languageParam=$1

    ### Parameter exist / 파라미터가 존재 / パラメータが存在
    if [ ${languageParam} = "en" ]; then
        functionOutput="### Output language is English. ###"
    elif [ ${languageParam} = "kr" ]; then
        functionOutput="### 출력 언어는 한국어입니다. ###"
    elif [ ${languageParam} = "jp" ]; then
        functionOutput="### 出力言語は日本語です。 ###"
    else
        functionOutput="### Please check the parameters.(Only lowercase letters : en, kr, jp) ###"
    fi

    ### Regular Expression / 정규표현식 / 正規表現式 
    ### Parameter exist / 파라미터가 존재 / パラメータが存在
    if [[ ${languageParam} == [eE][nN] ]]; then
        functionOutput="### Output language is English. ###"
    elif [[ ${languageParam} == [kK][rR] ]]; then
        functionOutput="### 출력 언어는 한국어입니다. ###"
    elif [[ ${languageParam} == [jJ][pP] ]]; then
        functionOutput="### 出力言語は日本語です。 ###"
    else
        functionOutput="### Please check the parameters.(case-insensitive : en, kr, jp) ###"
    fi
    
    ### Result print / 결과 출력 / 結果出力
    echo ${functionOutput}

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

### Language select / 언어 선택 / 言語選択
while true
do
    if [[ ${paramCount} == 0 ]];then
        echo "Please enter a language"
        read -p "Insert(en, kr, jp) : " OuputLanguage
    else
        OuputLanguage=$1
    fi
    ### English, Korean, Japanese / 영어, 한국어, 일본어 / 英語、韓国語、日本語
    if [[ ${OuputLanguage} == [eE][nN] || ${OuputLanguage} == [kK][rR] || ${OuputLanguage} == [jJ][pP] ]]; then
        break
    fi
done
echo

### Function Run / 함수 실행 / 関数実行
languageCheck ${OuputLanguage} ${Command}
### Function Run / 함수 실행 / 関数実行
basicSetting_RunTime ${OuputLanguage} 
echo
### Function Run / 함수 실행 / 関数実行
basicSetting_FileName_Path ${OuputLanguage} ${PID} "0" 
echo

### SearchCommand / 검색명령어 / 検索コマンド
SearchCommand=$2

### Command List / 명령어 리스트 / コマンドリスト
declare -a CommandList=("cat1" "cd1" "cut1")
declare -a CommandDescription=("cat2" "cd2" "cut2")

echo ${CommandList[@]}
echo ${#CommandList[@]}
echo
Index=0
for CommandIndex in ${CommandList[@]}; do
    echo CommandList[${Index}]=${CommandList[${Index}]}, CommandDescription[${Index}]=${CommandDescription[${Index}]}
    Index=$((${Index} + 1))
done



### Command Select / 명령어 선택 / コマンド選択
while true
do
    if [[ ${SearchCommand} == "" ]];then
        if [[ ${OuputLanguage} == [eE][nN] ]]; then
            echo "Shell Stop : ZZ"
            read -p "Please enter a Command." SearchCommand
        elif [[ ${OuputLanguage} == [kK][rR] ]]; then
            echo "쉘 종료 : ZZ"
            read -p "명령어를 입력해주세요." SearchCommand
        elif [[ ${OuputLanguage} == [jJ][pP] ]]; then
            echo "シェル終了 : ZZ"
            read -p "コマンドを入力してください。" SearchCommand
        fi
    fi
    ### Command Example / 명령어 예시 / コマンドサンプル
    if [[ ${SearchCommand} == "dd" ]]; then
        basicSetting_FileName_Path ${OuputLanguage} ${PID} "0" ${SearchCommand} 
        echo
        echo "각 명령어당 작성 함수"
        echo
        basicSetting_FileName_Path ${OuputLanguage} ${PID} "1" ${SearchCommand} 
    elif [[ ${SearchCommand} == [zZ][zZ] ]]; then
        basicSetting_FileName_Path ${OuputLanguage} ${PID} "1" 
        break
    else
        if [[ ${OuputLanguage} == [eE][nN] ]]; then
            echo "The command isn't in the shell."
            echo "This command(${SearchCommand}) will be added."
        elif [[ ${OuputLanguage} == [kK][rR] ]]; then
            echo "쉘에 존재하지 않는 명령어입니다."
            echo "해당 명령어(${SearchCommand})는 추가예정입니다."
        elif [[ ${OuputLanguage} == [jJ][pP] ]]; then
            echo "シェルに存在しないコマンドです。"
            echo "該当コマンド（${SearchCommand}）は追加予定です。"
        fi
    fi
    SearchCommand=""
done



