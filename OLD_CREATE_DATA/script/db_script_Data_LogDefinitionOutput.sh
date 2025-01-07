#!/bin/sh

###################################################################################
#
#  Shell Name  : Log Definition And Output Shell
#
#  Creater     : DokBak
#  Create Date : 2024/09/01          New
#  Modify Date :
#
#  Processing Overview : Log definition, output 
#
#  Parameter   :
#     Parameter1  (Essential) : Setting　file　path
#     Parameter1  (Essential) : File path of the file to be modified
#     Parameter1  (Essential) : Preservation of the original file flag(0:Preservation,1:Delete)
#     Parameter2  (optional ) : Language
#
###################################################################################
#
#  쉘  이름      : 로그 정의 및 출력 쉘
#
#  작 성 자      : DokBak
#  작 성 일      : 2024/09/01          신규 작성
#  수 정 일      :
#
#  처리 개요      : 로그 정의 및 출력
#
#  파라미터       :
#     파라미터1  (필수) : 설정 파일 경로
#     파라미터2  (필수) : 수정 대상 파일 경로
#     파라미터3  (필수) : 원본 파일 보존 플래그(0:보존,1:삭제)
#     파라미터4  (옵션) : 언어
#
###################################################################################
#
#  スクリプト名    : ログの定義と出力シェル
#
#  作成者        : DokBak
#  作成日        : 2024/09/01          新規作成
#  修正日        :
#
#  処理概要      : ログの定義と出力
#
#  パラメータ     :
#     パラメータ1  (必須) : 設定ファイル格納パス
#     パラメータ1  (必須) : 修正対象ファイルのパス
#     パラメータ1  (必須) : 元ファイルの保存フラグ(0:保存,1:削除)
#     パラメータ2  (任意) : 言語
# 
###################################################################################


#--------------------------------------------#
# Main Logic / 메인 처리 / メイン処理
#--------------------------------------------#
### Process Id / 프로세스Id / プロセスId
_processId=${1}
### Log Path / 로그 경로 / ログパス
_logPath=${2}
### Log Code / 로그 코드 / ログコード
_logCode=${3}
### Language / 언어 / 言語
_language=${4}

### parameterCount / 파라미터 수 / パラメータ数
_paramCount=$#
if [[ ${_paramCount} == [3] || ${_paramCount} == [4] ]];then
    if [[ ${_language} == "" ]];then
        if [[ ${LC_ALL} == "ko_KR.UTF-8" ]];then    #export LC_ALL="ko_KR.UTF-8"
            _language="kr"
        elif  [[ ${LC_ALL} == "ja_JP.UTF-8" ]];then #export LC_ALL="ja_JP.UTF-8"
            _language="jp"
        else                                        #export LC_ALL="en_US.UTF-8"
            _language="en" 
        fi
    fi
else
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
        _logFilePath=${_filePath:0:${#_filePath}-7}log/
    else
        _logFilePath=${_filePath}log/
    fi
    mkdir -p ${_logFilePath}
    ### LogFile / 로그 파일 / ログファイル
    _logFile=`basename ${0%.*}`.log
    ### LogPath / 로그 패스 / ログパス
    _logPath=${_logFilePath}${_logFile}
    ### Shell Test Code / 쉘 테스트 코드 / シェルテストコード
    _logCode=600101
    
    if [[ ${LC_ALL} == "ko_KR.UTF-8" ]];then    #export LC_ALL="ko_KR.UTF-8"
        _language="kr"
    elif  [[ ${LC_ALL} == "ja_JP.UTF-8" ]];then #export LC_ALL="ja_JP.UTF-8"
        _language="jp"
    else                                        #export LC_ALL="en_US.UTF-8"
        _language="en" 
    fi
fi

for _testNum in {1..2};do
    ### Script File Name / 쉘 파일명 / シェルファイル名
    _scriptCode=`echo "${_logCode}" | cut -b 1-2`
    ### End Code / 종료 코드 / 終了コード
    _endCode=`echo "${_logCode}" | cut -b 3-4`
    ### Process Code / 처리 코드 / 処理コード
    _processCode=`echo "${_logCode}" | cut -b 5-6`

    ### Individual Processing Comment / 개별 처리 코멘트 / 個別処理コメント
    if [[ ${_scriptCode} == "60" ]];then
        _scriptName="db_script_Data_LogDefinitionOutput"
        if [[ ${_processCode} == "01" ]];then # Shell Explanation / 쉘 설명 / シェル説明
            if [[ ${_language} == [eE][nN] ]];then
                _processCodeOutput="Output Main Log"
            elif [[ ${_language} == [kK][rR] ]];then
                _processCodeOutput="메인 로그 출력"
            elif [[ ${_language} == [jJ][pP] ]];then
                _processCodeOutput="メインログ出力"
            fi
        fi
    elif [[ ${_scriptCode} == "61" ]];then
        _scriptName="db_script_Data_FileEncodingChange"
        if [[ ${_processCode} == "01" ]];then # Shell Explanation / 쉘 설명 / シェル説明
            if [[ ${_language} == [eE][nN] ]];then
                _processCodeOutput="Encoding Processing"
            elif [[ ${_language} == [kK][rR] ]];then
                _processCodeOutput="인코딩 처리"
            elif [[ ${_language} == [jJ][pP] ]];then
                _processCodeOutput="エンコーディング処理"
            fi
        fi
    elif [[ ${_scriptCode} == "62" ]];then
        _scriptName="db_script_Data_ConfigurationCheck"
        if [[ ${_processCode} == "01" ]];then # Shell Explanation / 쉘 설명 / シェル説明
            if [[ ${_language} == [eE][nN] ]];then
                _processCodeOutput="Configuration File Check"
            elif [[ ${_language} == [kK][rR] ]];then
                _processCodeOutput="설정 파일 체크"
            elif [[ ${_language} == [jJ][pP] ]];then
                _processCodeOutput="設定ファイルチェック"
            fi
        fi
    elif [[ ${_scriptCode} == "63" ]];then
        _scriptName="db_script_Data_NormalDataCreate"
        if [[ ${_processCode} == "01" ]];then # Shell Explanation / 쉘 설명 / シェル説明
            if [[ ${_language} == [eE][nN] ]];then
                _processCodeOutput="Normal Data Create"
            elif [[ ${_language} == [kK][rR] ]];then
                _processCodeOutput="정상계 데이터 작성"
            elif [[ ${_language} == [jJ][pP] ]];then
                _processCodeOutput="正常系データ作成"
            fi
        fi
    fi

    ### Common Processing Comments / 공통 처리 코멘트 / 共通処理コメント
        # 20 ~ 
        # Related to the parameters / 파라미터 관련 / パラメータ関連
        if [[ ${_processCode} == "20" ]];then 
            if [[ ${_language} == [eE][nN] ]];then
                _processCodeOutput="Parameter Check"
            elif [[ ${_language} == [kK][rR] ]];then
                _processCodeOutput="파라미터 체크"
            elif [[ ${_language} == [jJ][pP] ]];then
                _processCodeOutput="パラメータチェック"
            fi
        elif [[ ${_processCode} == "21" ]];then
            if [[ ${_language} == [eE][nN] ]];then
                _processCodeOutput="Setting File Check"
            elif [[ ${_language} == [kK][rR] ]];then
                _processCodeOutput="설정 파일 체크"
            elif [[ ${_language} == [jJ][pP] ]];then
                _processCodeOutput="設定ファイルチェック"
            fi
        elif [[ ${_processCode} == "22" ]];then
            if [[ ${_language} == [eE][nN] ]];then
                _processCodeOutput="Target File Check"
            elif [[ ${_language} == [kK][rR] ]];then
                _processCodeOutput="처리 대상 파일 체크"
            elif [[ ${_language} == [jJ][pP] ]];then
                _processCodeOutput="処理対象ファイルチェック"
            fi
        elif [[ ${_processCode} == "23" ]];then
            if [[ ${_language} == [eE][nN] ]];then
                _processCodeOutput="Flag Check"
            elif [[ ${_language} == [kK][rR] ]];then
                _processCodeOutput="플래그 체크"
            elif [[ ${_language} == [jJ][pP] ]];then
                _processCodeOutput="フラグチェック"
            fi
        fi
        # 30 ~ 
        # Related to Main Process / 메인 처리 관련 / メイン処理関連
        if [[ ${_processCode} == "30" ]];then 
            if [[ ${_language} == [eE][nN] ]];then
                _processCodeOutput="Main Process"
            elif [[ ${_language} == [kK][rR] ]];then
                _processCodeOutput="메인 처리"
            elif [[ ${_language} == [jJ][pP] ]];then
                _processCodeOutput="メイン処理"
            fi
        fi
    
    ### Start/End Flag / 시작 종료 플래그 / 開始終了フラグ
    if [[ ${_endCode} == "01" ]];then
        if [[ ${_language} == [eE][nN] ]];then
            _endCodeOutput="START"
        elif [[ ${_language} == [kK][rR] ]];then
            _endCodeOutput="개시"
        elif [[ ${_language} == [jJ][pP] ]];then
            _endCodeOutput="開始"
        fi
    elif [[ ${_endCode} == "02" ]];then
        if [[ ${_language} == [eE][nN] ]];then
            _endCodeOutput="END (Normal completion)"
        elif [[ ${_language} == [kK][rR] ]];then
            _endCodeOutput="종료 (정상종료)"
        elif [[ ${_language} == [jJ][pP] ]];then
            _endCodeOutput="終了 (正常終了)"
        fi
    elif [[ ${_endCode} == "03" ]];then
        if [[ ${_language} == [eE][nN] ]];then
            _endCodeOutput="END (Error completion)"
        elif [[ ${_language} == [kK][rR] ]];then
            _endCodeOutput="종료 (이상종료)"
        elif [[ ${_language} == [jJ][pP] ]];then
            _endCodeOutput="終了 (異常終了)"
        fi
    elif [[ ${_endCode} == "04" ]];then
        if [[ ${_language} == [eE][nN] ]];then
            _endCodeOutput="END (Simulated completion)"
        elif [[ ${_language} == [kK][rR] ]];then
            _endCodeOutput="종료 (모의종료)"
        elif [[ ${_language} == [jJ][pP] ]];then
            _endCodeOutput="終了 (擬似終了)"
        fi
    fi

    ### Log Output / 로그 출력 / ログ出力
    if [[ ${_processCodeOutput} == "" || ${_endCodeOutput} == ""  ]];then
        echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_scriptName} >>> " ADD : log code " ${_scriptName}.sh ${_endCodeOutput} [${_logCode}]"
        echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_scriptName} >>> " ADD : log code " ${_scriptName}.sh ${_endCodeOutput} [${_logCode}]" >> ${_logPath}
    else
        if [[ ${_scriptCode} == "60" ]];then
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_scriptName} >>> ${_processCodeOutput} ${_scriptName}.sh ${_endCodeOutput} [${_logCode}]"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_scriptName} >>> ${_processCodeOutput} ${_scriptName}.sh ${_endCodeOutput} [${_logCode}]" >> ${_logPath}
            ### Shell Test Code / 쉘 테스트 코드 / シェルテストコード
            _logCode=600201
            _processCodeOutput=""
            _endCodeOutput=""
        else
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_scriptName} >>> ${_processCodeOutput} ${_scriptName}.sh ${_endCodeOutput} [${_logCode}]"
            echo "`date +%Y/%m/%d-%H:%M:%S` [${_processId}] ${_scriptName} >>> ${_processCodeOutput} ${_scriptName}.sh ${_endCodeOutput} [${_logCode}]" >> ${_logPath}
            break
        fi
    fi
done