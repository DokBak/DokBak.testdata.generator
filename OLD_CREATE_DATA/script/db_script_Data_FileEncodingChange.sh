#!/bin/sh

###################################################################################
#
#  Shell Name  : File Encoding Change Shell
#
#  Creater     : DokBak
#  Create Date : 2024/09/01          New
#  Modify Date :
#
#  Processing Overview : Modify the file encoding of the target file
#
#  Parameter   :
#     Parameter1  (Essential) : Setting　file　path
#     Parameter2  (Essential) : File path of the file to be modified
#     Parameter3  (Essential) : Preservation of the original file flag(0:Preservation,1:Delete)
#     Parameter4  (optional ) : Language
#
###################################################################################
#
#  쉘  이름      : 파일 인코딩 변경 쉘
#
#  작 성 자      : DokBak
#  작 성 일      : 2024/09/01          신규 작성
#  수 정 일      :
#
#  처리 개요      : 대상 파일의 파일 인코딩 수정
#
#  파라미터       :
#     파라미터1  (필수) : 설정 파일 경로
#     파라미터2  (필수) : 수정 대상 파일 경로
#     파라미터3  (필수) : 원본 파일 보존 플래그(0:보존,1:삭제)
#     파라미터4  (옵션) : 언어
#
###################################################################################
#
#  スクリプト名    : ファイルエンコーディング変更シェル
#
#  作成者        : DokBak
#  作成日        : 2024/09/01          新規作成
#  修正日        :
#
#  処理概要      : 対象ファイルのファイルエンコーディングを修正
#
#  パラメータ     :
#     パラメータ1  (必須) : 設定ファイル格納パス
#     パラメータ2  (必須) : 修正対象ファイルのパス
#     パラメータ3  (必須) : 元ファイルの保存フラグ(0:保存,1:削除)
#     パラメータ4  (任意) : 言語
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
mkdir -p ${_dataFilePath}input/
mkdir -p ${_dataFilePath}output/
mkdir -p ${_logFilePath}
### LogFile / 로그 파일 / ログファイル
_logFile=`basename ${0%.*}`.log

#--------------------------------------------#
# Parameter Check / 파라미터 체크 / パラメータチェック
#--------------------------------------------#
### Setting File Path / 설정 파일 경로 / 設定ファイルパス
_settingFilePath=${1}

### Target File Path / 처리 대상 파일 경로 / 処理対象ファイルのパス
_targetFilePath=${2}

### Original File Flag  / 원본 파일 플래그 / 元ファイルフラグ
_originalFileFlag=${3}

### Input Output File Flag  / 입출력 파일 플래그 / 入出力ファイルフラグ
_InputOutputFileFlag=${4}

### Language / 언어 / 言語
_language=${5}

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
sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610101 ${_language}


sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610120 ${_language}

if [[ ${_endFlg} == [0] ]];then
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610121 ${_language}
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
            "inputDataEncoding"
            "inputDataType"
            "inputDataFileName"
            "outputDataEncoding"
            "outputDataType"
            "outputDataFileName"
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

        sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610221 ${_language}
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
        sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610321 ${_language}
        _endFlg=1
    fi
    #△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△#
fi

if [[ ${_endFlg} == [0] ]];then
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610122 ${_language}
    #----------------------------------------------------------------------------------------------------#
    # Target File Parameter Check / 처리 대상 파라미터 체크 / 処理対象ファイルパラメータチェック
    #▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽#
    if [[ -e ${_targetFilePath} ]];then
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} : Target file exist"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} : Target file exist" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} : 처리 대상 파일 있음"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} : 처리 대상 파일 있음" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} : 処理対象ファイル有り"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} : 処理対象ファイル有り" >> ${_logFilePath}${_logFile}
        fi
        sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610222 ${_language}
    else
        echo 
        echo >>  ${_logFilePath}${_logFile}
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} Target file does not exist"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} Target file does not exist" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} 처리 대상 파일이 없습니다"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} 처리 대상 파일이 없습니다" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} 処理対象ファイルが存在しない"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_targetFilePath} 処理対象ファイルが存在しない" >> ${_logFilePath}${_logFile}
        fi
        echo
        echo >>  ${_logFilePath}${_logFile}
        sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610322 ${_language}
        _endFlg=1
    fi
    #△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△#
fi

if [[ ${_endFlg} == [0] ]];then
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610123 ${_language}
    #----------------------------------------------------------------------------------------------------#
    # Original File Flag Parameter Check / 원본 파일 플래그 파라미터 체크 / 元ファイルフラグパラメータチェック
    #▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽#
    if [[ ${_originalFileFlag} == [0] || ${_originalFileFlag} == [1] ]];then
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} : Selected option(Original File Flag)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} : Selected option(Original File Flag)" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} : 선택한 옵션(원본 파일 플래그)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} : 선택한 옵션(원본 파일 플래그)" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} : 選択オプション(元ファイルフラグ)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} : 選択オプション(元ファイルフラグ)" >> ${_logFilePath}${_logFile}
        fi
        sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610223 ${_language}
    else 
        echo
        echo >>  ${_logFilePath}${_logFile}
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please choose from the available options: 0 (Keep), 1 (Delete)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please choose from the available options: 0 (Keep), 1 (Delete)" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 선택 가능한 옵션 중에서 입력해주세요: 0 (보존), 1 (삭제)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 선택 가능한 옵션 중에서 입력해주세요: 0 (보존), 1 (삭제)" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 選択可能なオプションから選んでください: 0 (保持), 1 (削除)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 選択可能なオプションから選んでください: 0 (保持), 1 (削除)" >> ${_logFilePath}${_logFile}
        fi
        echo
        echo >>  ${_logFilePath}${_logFile}
        sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610323 ${_language}
        _endFlg=1
    fi
    #△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△#
fi

if [[ ${_endFlg} == [0] ]];then
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610123 ${_language}
    #----------------------------------------------------------------------------------------------------#
    # Input Output File Flag Parameter Check / 입출력 파일 플래그 파라미터 체크 / 入出力ファイルフラグパラメータチェック
    #▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽#
    if [[ ${_InputOutputFileFlag} == [0] || ${_InputOutputFileFlag} == [1] ]];then
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} : Selected option(Input Output File Flag)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} : Selected option(Input Output File Flag)" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} : 선택한 옵션(입출력 파일 플래그)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} : 선택한 옵션(입출력 파일 플래그)" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} : 選択オプション(入出力ファイルフラグ)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} : 選択オプション(入出力ファイルフラグ)" >> ${_logFilePath}${_logFile}
        fi
        sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610223 ${_language}
    else 
        echo
        echo >>  ${_logFilePath}${_logFile}
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} Please choose from the available options: 0 (Input), 1 (Output)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} Please choose from the available options: 0 (Input), 1 (Output)" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} 선택 가능한 옵션 중에서 입력해주세요: 0 (입력), 1 (출력)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} 선택 가능한 옵션 중에서 입력해주세요: 0 (입력), 1 (출력)" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} 選択可能なオプションから選んでください: 0 (入力), 1 (出力)"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_InputOutputFileFlag} 選択可能なオプションから選んでください: 0 (入力), 1 (出力)" >> ${_logFilePath}${_logFile}
        fi
        echo
        echo >>  ${_logFilePath}${_logFile}
        sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610323 ${_language}
        _endFlg=1
    fi
    #△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△#
fi

if [[ ${_endFlg} == [0] ]];then
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610220 ${_language}
else
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610320 ${_language}
fi

#--------------------------------------------#
# Main Logic / 메인 처리 / メイン処理
#--------------------------------------------#
if [[ ${_endFlg} == [0] ]];then
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610130 ${_language}

    mv -fv ${_targetFilePath} ${_targetFilePath}_bk
    _oldEncoding=`nkf --guess ${_targetFilePath}_bk`
    
    export `cat ${_settingFilePath} | grep inputDataEncoding`
    export `cat ${_settingFilePath} | grep inputDataFileName`
    export `cat ${_settingFilePath} | grep inputDataType`

    ### Input File
    if [[ ${inputDataEncoding} = "" ]];then
        echo
        echo >>  ${_logFilePath}${_logFile}
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : inputDataEncoding"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : inputDataEncoding" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : inputDataEncoding"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : inputDataEncoding" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: inputDataEncoding"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: inputDataEncoding" >> ${_logFilePath}${_logFile}
        fi
        echo
        echo >>  ${_logFilePath}${_logFile}
        _endFlg=1
    elif [[ ${inputDataFileName} = "" ]];then
        echo
        echo >>  ${_logFilePath}${_logFile}
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : inputDataFileName"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : inputDataFileName" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : inputDataFileName"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : inputDataFileName" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: inputDataFileName"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: inputDataFileName" >> ${_logFilePath}${_logFile}
        fi
        echo
        echo >>  ${_logFilePath}${_logFile}
        _endFlg=1
    elif [[ ${inputDataType} = "" ]];then
        echo
        echo >>  ${_logFilePath}${_logFile}
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : inputDataType"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : inputDataType" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : inputDataType"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : inputDataType" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: inputDataType"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: inputDataType" >> ${_logFilePath}${_logFile}
        fi
        echo
        echo >>  ${_logFilePath}${_logFile}
        _endFlg=1
    elif [[ ${inputDataType} == [0] ]];then
        _endFlg=1
    elif [[ ${_endFlg} == [0] ]];then
        if [[ ${_InputOutputFileFlag} == [0] ]];then
            if [[ ${inputDataEncoding} = 0 ]];then ### UTF-8
                nkf -w ${_targetFilePath}_bk > ${_targetFilePath}
            elif [[ ${inputDataEncoding} = 1 ]];then ### EUC-JP
                nkf -e ${_targetFilePath}_bk > ${_targetFilePath}
            elif [[ ${inputDataEncoding} = 2 ]];then ### ISO-2022-JP(JIS)
                nkf -j ${_targetFilePath}_bk > ${_targetFilePath}
            elif [[ ${inputDataEncoding} = 3 ]];then ### Shift_JIS(SJIS)
                nkf -s ${_targetFilePath}_bk > ${_targetFilePath}
            elif [[ ${inputDataEncoding} = 4 ]];then ### UTF-8(BOM)
                nkf --oc=UTF-8-BOM ${_targetFilePath}_bk > ${_targetFilePath}
            fi

            _newEncodingInput=`nkf --guess ${_targetFilePath}`
            if [[ ${inputDataType} == [1] ]];then ### File
                mv -fv ${_targetFilePath} ${_dataFilePath}input/${inputDataFileName}
            elif [[ ${inputDataType} == [2] ]];then ### .gz
                if [[ ${inputDataFileName} == *.gz ]];then
                    inputDataFileName="${inputDataFileName%.gz}"
                fi
                mv -fv ${_targetFilePath} ${_dataFilePath}input/${inputDataFileName}
                gzip -fv ${_dataFilePath}input/${inputDataFileName}
            elif [[ ${inputDataType} == [3] ]];then ### .Z
                if [[ ${inputDataFileName} == *.Z ]];then
                    inputDataFileName="${inputDataFileName%.Z}"
                fi
                mv -fv ${_targetFilePath} ${_dataFilePath}input/${inputDataFileName}
                compress -fv ${_dataFilePath}input/${inputDataFileName}
            fi

            if [[ ${_language} == [eE][nN] ]];then
                echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] Input File Encoding : ${_newEncodingInput}"
                echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] Input File Encoding : ${_newEncodingInput}" >> ${_logFilePath}${_logFile}
            elif [[ ${_language} == [kK][rR] ]];then
                echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] 입력 파일 인코딩 : ${_newEncodingInput}"
                echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] 입력 파일 인코딩 : ${_newEncodingInput}" >> ${_logFilePath}${_logFile}
            elif [[ ${_language} == [jJ][pP] ]];then
                echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] 入力ファイルエンコーディング : ${_newEncodingInput}"
                echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] 入力ファイルエンコーディング : ${_newEncodingInput}" >> ${_logFilePath}${_logFile}
            fi
        fi
    fi

    export `cat ${_settingFilePath} | grep outputDataEncoding`
    export `cat ${_settingFilePath} | grep outputDataFileName`
    export `cat ${_settingFilePath} | grep outputDataType`

    ### Output File 
    if [[ ${outputDataEncoding} = "" ]];then
        echo
        echo >>  ${_logFilePath}${_logFile}
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : outputDataEncoding"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : outputDataEncoding" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : outputDataEncoding"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : outputDataEncoding" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: outputDataEncoding"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: outputDataEncoding" >> ${_logFilePath}${_logFile}
        fi
        echo
        echo >>  ${_logFilePath}${_logFile}
        _endFlg=1
    elif [[ ${outputDataFileName} = "" ]];then
        echo
        echo >>  ${_logFilePath}${_logFile}
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : outputDataFileName"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : outputDataFileName" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : outputDataFileName"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : outputDataFileName" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: outputDataFileName"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: outputDataFileName" >> ${_logFilePath}${_logFile}
        fi
        echo
        echo >>  ${_logFilePath}${_logFile}
        _endFlg=1
    elif [[ ${outputDataType} = "" ]];then
        echo
        echo >>  ${_logFilePath}${_logFile}
        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : outputDataType"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} Please check the following configuration value in the settings file : outputDataType" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : outputDataType"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 설정 파일에서 다음 설정 값을 확인해주세요 : outputDataType" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: outputDataType"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_originalFileFlag} 設定ファイルで次の設定値を確認してください: outputDataType" >> ${_logFilePath}${_logFile}
        fi
        echo
        echo >>  ${_logFilePath}${_logFile}
        _endFlg=1
    elif [[ ${outputDataType} == [0] ]];then
        _endFlg=1
    elif [[ ${_InputOutputFileFlag} = [1] ]];then
        if [[ ${outputDataEncoding} = 0 ]];then ### UTF-8
            nkf -w ${_targetFilePath}_bk > ${_targetFilePath}
        elif [[ ${outputDataEncoding} = 1 ]];then ### EUC-JP
            nkf -e ${_targetFilePath}_bk > ${_targetFilePath}
        elif [[ ${outputDataEncoding} = 2 ]];then ### ISO-2022-JP(JIS)
            nkf -j ${_targetFilePath}_bk > ${_targetFilePath}
        elif [[ ${outputDataEncoding} = 3 ]];then ### Shift_JIS(SJIS)
            nkf -s ${_targetFilePath}_bk > ${_targetFilePath}
        elif [[ ${outputDataEncoding} = 4 ]];then ### UTF-8(BOM)
            nkf --oc=UTF-8-BOM ${_targetFilePath}_bk > ${_targetFilePath}
        fi

        _newEncodingOutput=`nkf --guess ${_targetFilePath}`

        if [[ ${outputDataType} == [1] ]];then ### File
            mv -fv ${_targetFilePath} ${_dataFilePath}output/${outputDataFileName}
        elif [[ ${outputDataType} == [2] ]];then ### .gz
            if [[ ${outputDataFileName} == *.gz ]];then
                outputDataFileName="${outputDataFileName%.gz}"
            fi
            mv -fv ${_targetFilePath} ${_dataFilePath}output/${outputDataFileName}
            gzip -fv ${_dataFilePath}output/${outputDataFileName}
        elif [[ ${outputDataType} == [3] ]];then ### .Z
            if [[ ${outputDataFileName} == *.Z ]];then
                outputDataFileName="${outputDataFileName%.Z}"
            fi
            mv -fv ${_targetFilePath} ${_dataFilePath}output/${outputDataFileName}
            compress -fv ${_dataFilePath}output/${outputDataFileName}
        fi

        if [[ ${_language} == [eE][nN] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] Output File Encoding : ${_newEncodingOutput}"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] Output File Encoding : ${_newEncodingOutput}" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [kK][rR] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] 출력 파일 인코딩 : ${_newEncodingOutput}"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] 출력 파일 인코딩 : ${_newEncodingOutput}" >> ${_logFilePath}${_logFile}
        elif [[ ${_language} == [jJ][pP] ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] 出力ファイルエンコーディング : ${_newEncodingOutput}"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] 出力ファイルエンコーディング : ${_newEncodingOutput}" >> ${_logFilePath}${_logFile}
        fi
    fi

    ### Original File
    if [[ ${_originalFileFlag} == [0] ]];then
        mv -fv ${_targetFilePath}_bk ${_targetFilePath}
    else 
        rm -fv ${_targetFilePath}_bk
    fi
fi

if [[ ${_endFlg} == [0] ]];then
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610230 ${_language}
else
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610330 ${_language}
    _endFlg=1
fi

if [[ ${_endFlg} == [0] ]];then
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610201 ${_language}
else
    sh ${_filePath}db_script_Data_LogDefinitionOutput.sh ${_processId} ${_logFilePath}${_logFile} 610301 ${_language}
fi
