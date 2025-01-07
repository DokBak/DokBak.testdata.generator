#!/bin/sh

###################################################################################
#
#  Shell Name  : Normal Data Create Shell
#
#  Creater     : DokBak
#  Create Date : 2024/09/02          New
#  Modify Date :
#
#  Processing Overview : Normal Data Create
#
#  Parameter   :
#     Parameter1  (Essential) : Setting　file　path
#     Parameter1  (Essential) : File path of the file to be modified
#     Parameter1  (Essential) : Preservation of the original file flag(0:Preservation,1:Delete)
#     Parameter2  (optional ) : Language
#
###################################################################################
#
#  쉘  이름      : 정상 데이터 작성 쉘
#
#  작 성 자      : DokBak
#  작 성 일      : 2024/09/02          신규 작성
#  수 정 일      :
#
#  처리 개요      : 정상계 데이터 작성 
#
#  파라미터       :
#     파라미터1  (필수) : 설정 파일 경로
#     파라미터2  (필수) : 수정 대상 파일 경로
#     파라미터3  (필수) : 원본 파일 보존 플래그(0:보존,1:삭제)
#     파라미터4  (옵션) : 언어
#
###################################################################################
#
#  スクリプト名    : 正常系データ作成シェル
#
#  作成者        : DokBak
#  作成日        : 2024/09/02          新規作成
#  修正日        :
#
#  処理概要      : 正常系データ作成
#
#  パラメータ     :
#     パラメータ1  (必須) : 設定ファイル格納パス
#     パラメータ1  (必須) : 修正対象ファイルのパス
#     パラメータ1  (必須) : 元ファイルの保存フラグ(0:保存,1:削除)
#     パラメータ2  (任意) : 言語
# 
###################################################################################

#--------------------------------------------#
# Basic Parameter / 기본 파라미터 / 基本パラメータ
#--------------------------------------------#
### Process Id / 프로세스Id / プロセスId
_processId=$$
### System Date / 시스템 날짜 / システム日付
_systemDate=`date +%Y%m%d`
### ShellScript Name / 쉘 스크립트 이름 / シェルスクリプト名
_scriptFile=`basename ${0}`
### ShellScript RelativePath / 쉘 스크립트 풀패스 / シェルスクリプトフルパス
_fileRelativePath=$0
### RelativePath -> AbsolutePath / 상대경로 -> 절대경로 / 相対パス -> 絶対パス
_fileAbsolutePath=$(realpath "${_fileRelativePath}")
### FilePath / 파일 패스 / ファイルパス
_filePath=${_fileAbsolutePath%/*}/
### LogFilePath / 로그 파일 패스 / ログファイルパス
if [[ ${_filePath:${#_filePath}-7:${#_filePath}} == "script/" ]];then
    _dataFilePath=${_filePath:0:${#_filePath}-7}
    _logFilePath=${_filePath:0:${#_filePath}-7}log/
else
    _dataFilePath=${_filePath}
    _logFilePath=${_filePath}log/
fi
mkdir -p ${_dataFilePath}tmp/
mkdir -p ${_logFilePath}
### LogFile / 로그 파일 / ログファイル
_logFile=`basename ${0%.*}`.log

#--------------------------------------------#
# Parameter Check / 파라미터 체크 / パラメータチェック
#--------------------------------------------#
### Setting File Path / 설정 파일 경로 / 設定ファイルパス
_settingFilePath=${1}

### Record Count / 데이터 건수 / データ件数
_numberOfRecords=${2}

### Language / 언어 / 言語
_language=${3}

### End Flag / 종료 플래그 / 終了フラグ
_endFlg=0

#----------------------------------------------------------------------------------------------------#
# Language Parameter Check or Initialization / 언어 파라미터 체크 및 초기화 / 言語パラメータチェック、初期化
#▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽#
if [[ ${_language} == "" ]];then
    if [[ ${LC_ALL} == "ko_KR.UTF-8" ]];then    #export LC_ALL="ko_KR.UTF-8"
        _language="kr"
    elif  [[ ${LC_ALL} == "ja_JP.UTF-8" ]];then #export LC_ALL="ja_JP.UTF-8"
        _language="jp"
    else                                        #export LC_ALL="en_US.UTF-8"
        _language="en" 
    fi
elif [[ ${_language} == [eE][nN] || ${_language} == [kK][rR] || ${_language} == [jJ][pP] ]];then
    _language=${_language}
else
    _language="en" 
    echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} Please choose a language from the available options: EN, KR, JP"
    echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} Please choose a language from the available options: EN, KR, JP" >> ${_logFilePath}${_logFile}
fi
#△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△#
sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 620101 ${_language}


sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 620120 ${_language}

if [[ ${_endFlg} == [0] ]];then
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 620121 ${_language}
    #----------------------------------------------------------------------------------------------------#
    # Setting File Parameter Check / 설정 파일 파라미터 체크 / 設定ファイルパラメータチェック
    #▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽#
    if [[ -e ${_settingFilePath} ]];then
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} : Configuration file exist"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} : Configuration file exist" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} : 설정 파일 있음"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} : 설정 파일 있음" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} : 設定ファイル有り"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} : 設定ファイル有り" >> ${_logFilePath}${_logFile}
        fi

        requiredItems=(
            "inputDataType"
            "inputDataFileName"
            "inputListItemsName"
            "inputListItemsType"
            "inputListItemsLength"
            "inputListItemsTrim"
            "inputListItemsNotNull"
            "inputListItemsEncrypt"
            "inputListItemsHash"
            "inputDataNewLine"
            "inputDataEnclosing"
            "inputDataDelimiting"
            "inputDataRecordNewLineList"
            "inputDataEscapeCodeList"
            "outputDataType"
            "outputDataFileName"
            "outputListItemsName"
            "outputListItemsType"
            "outputListItemsLength"
            "outputListItemsTrim"
            "outputListItemsNotNull"
            "outputListItemsEncrypt"
            "outputListItemsHash"
            "outputDataNewLine"
            "outputDataEnclosing"
            "outputDataDelimiting"
            "outputDataRecordNewLineList"
            "outputDataEscapeCodeList"
            "dataMultiByteCharacter"
            "dataSqlSchema"
        )

        for TargetItem in "${requiredItems[@]}";do
            checkItem=""
            checkItem=`cat ${_settingFilePath} | grep ${TargetItem}`
            if [[ ${checkItem} == "" ]];then
                echo
                echo >>  ${_logFilePath}${_logFile}
                if [[ ${_language} == [eE][nN] ]];then
                    echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : ${TargetItem}"
                    echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : ${TargetItem}" >> ${_logFilePath}${_logFile}
                elif [[ ${_language} == [kK][rR] ]];then
                    echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : ${TargetItem}"
                    echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : ${TargetItem}" >> ${_logFilePath}${_logFile}
                elif [[ ${_language} == [jJ][pP] ]];then
                    echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: ${TargetItem}"
                    echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: ${TargetItem}" >> ${_logFilePath}${_logFile}
                fi
                echo
                echo >>  ${_logFilePath}${_logFile}
            fi
        done 

        sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 620221 ${_language}
    else 
        echo 
        echo >>  ${_logFilePath}${_logFile}
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} Configuration file does not exist"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} Configuration file does not exist" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} 설정 파일이 없습니다"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} 설정 파일이 없습니다" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} 設定ファイルが存在しない"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_settingFilePath} 設定ファイルが存在しない" >> ${_logFilePath}${_logFile}
        fi
        echo 
        echo >>  ${_logFilePath}${_logFile}
        sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 620321 ${_language}
        _endFlg=1
    fi
    #△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△#
fi
