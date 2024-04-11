#!/bin/bash

#--------------------------------------------#
#   01. 設定ファイルから文字コード情報を取得
#--------------------------------------------#
function check_data_encoding() {

    # 関数終了コード
    local _encoding_status=""
    # 設定ファイルパス
    local _settingFile=${1}
    # 文字コード
    export `cat ${_settingFile} | grep data_encoding`
    checked_data_encoding=""

    # 取得情報選別
    if [[ ${data_encoding} = 0 ]];then
        checked_data_encoding="UTF-8"
        _encoding_status="0"
    elif [[ ${data_encoding} = 1 ]];then
        checked_data_encoding="EUC"
        _encoding_status="0"
    elif [[ ${data_encoding} = 2 ]];then
        checked_data_encoding="JIS"
        _encoding_status="0"
    elif [[ ${data_encoding} = 3 ]];then
        checked_data_encoding="SJIS"
        _encoding_status="0"
    elif [[ ${data_encoding} = 4 ]];then
        checked_data_encoding="UTF-8(BOM)"
        _encoding_status="0"
    else
        _encoding_status="1"
        echo "支援する文字コード：UTF-8, EUC, JIS, SJIS, UTF-8(BOM)"
    fi

    # echo "取得文字コード：${checked_data_encoding}"
}

#--------------------------------------------#
#   02. 設定ファイルから改行コード情報を取得
#--------------------------------------------#
function check_data_newLine() {

    # 関数終了コード
    local _newLine_status=""
    # 設定ファイルパス
    local _settingFile=${1}
    # 改行コード
    export `cat ${_settingFile} | grep data_newLine`
    checked_data_newLine=""

    # 取得情報選別
    if [[ ${data_newLine} = 0 ]];then
        checked_data_newLine="CRLF"
        _newLine_status="0"
    elif [[ ${data_newLine} = 1 ]];then
        checked_data_newLine="CR"
        _newLine_status="0"
    elif [[ ${data_newLine} = 2 ]];then
        checked_data_newLine="LF"
        _newLine_status="0"
    else
        _newLine_status="1"
        echo "支援する改行コード：CRLF, LF, CR"
    fi

    # echo "取得改行コード：${checked_data_newLine}"
}

#--------------------------------------------#
#   03. 設定ファイルから囲み文字情報を取得
#--------------------------------------------#
function check_data_enclosing() {

    # 関数終了コード
    local enclosing_status=""
    # 設定ファイルパス
    local _settingFile=${1}
    # 囲み文字
    export `cat ${_settingFile} | grep data_enclosing`
    checked_data_enclosing=""

    # 取得情報選別
    if [[ ${data_enclosing} = 0 ]];then
        checked_data_enclosing=""
        enclosing_status="0"
    elif [[ ${data_enclosing} = 1 ]];then
        checked_data_enclosing="\""
        enclosing_status="0"
    elif [[ ${data_enclosing} = 2 ]];then
        checked_data_enclosing="\'"
        enclosing_status="0"
    else
        enclosing_status="1"
        echo "「」(無), 「\"」, 「\'」"
    fi

    # echo "取得囲み文字：${checked_data_enclosing}"
}

#--------------------------------------------#
#   04. 設定ファイルから区切り文字情報を取得
#--------------------------------------------#
function check_data_delimiting() {

    # 関数終了コード
    local _delimiting_status=""
    # 設定ファイルパス
    local _settingFile=${1}
    # 区切り文字
    export `cat ${_settingFile} | grep data_delimiting`
    checked_data_delimiting=""

    # 取得情報選別
    if [[ ${data_delimiting} = 0 ]];then
        checked_data_delimiting=""
        _delimiting_status="0"
    elif [[ ${data_delimiting} = 1 ]];then
        checked_data_delimiting=","
        _delimiting_status="0"
    elif [[ ${data_delimiting} = 2 ]];then
        checked_data_delimiting="\t"
        _delimiting_status="0"
    else
        _delimiting_status="1"
        echo "「」(無), 「,」, 「\t」"
    fi

    # echo "取得区切り文字：${checked_data_delimiting}"
}

#--------------------------------------------#
#   05. 設定ファイルからマルチバイト文字情報を取得
#--------------------------------------------#
function check_data_multiByteCharacter() {

    # 関数終了コード
    local _multiByteCharacter_status=""
    # 設定ファイルパス
    local _settingFile=${1}
    # 設定ファイルパス
    local _language=${2}
    # 区切り文字
    export `cat ${_settingFile} | grep data_multiByteCharacter`
    checked_data_multiByteCharacter=""

    # 取得情報選別
    if [[ ${data_multiByteCharacter} = 0 ]];then
        checked_data_multiByteCharacter=""
        _multiByteCharacter_status="0"
    elif [[ ${data_multiByteCharacter} = 1 ]];then
        if [[ ${_language} = [kK][rR] ]];then 
            checked_data_multiByteCharacter="가"
            _multiByteCharacter_status="0"
        elif [[ ${_language} = [jJ][pP] ]];then 
            checked_data_multiByteCharacter="あ"
            _multiByteCharacter_status="0"
        fi 
    else
        _multiByteCharacter_status="1"
        echo "「0」, 「1」"
    fi

    # echo "マルチバイト文字：${checked_data_multiByteCharacter}"
}

#--------------------------------------------#
#   06. 設定ファイルから出力タイプ情報を取得
#--------------------------------------------#
function check_data_outputType() {

    # 関数終了コード
    local _outputType_status=""
    # 設定ファイルパス
    local _settingFile=${1}
    # 出力タイプ
    export `cat ${_settingFile} | grep data_outputType`
    checked_data_outputType=""

    # 取得情報選別
    if [[ ${data_outputType} = 0 ]];then
        checked_data_outputType="FILE"
        _outputType_status="0"
    elif [[ ${data_outputType} = 1 ]];then
        checked_data_outputType="SQL"
        _outputType_status="0"
    elif [[ ${data_outputType} = 2 ]];then
        checked_data_outputType=".gz"
        _outputType_status="0"
    elif [[ ${data_outputType} = 3 ]];then
        checked_data_outputType=".Z"
        _outputType_status="0"
    else
        _outputType_status="1"
        echo "支援する出力タイプ：FILE, SQL, .gz, .Z"
    fi

    # echo "取得出力タイプ：${checked_data_outputType}"
}

#--------------------------------------------#
#   07. 項目変数タイプが文字列値の場合、データ作成
#--------------------------------------------#
function create_string_item() {
    
    # 項目の桁数
    _itemLength=$1
    # 変数初期化有無
    _funcOption=$2

    # 1番項目の場合変数初期化
    if [[ ${_funcOption} = "" ]];then
        item=""
    fi

    # 文字列値データ作成
    for ((i=1; i<=${_itemLength}; i++)); do
            _randomAscii=$((RANDOM % 26 + 65))
            _randomChar=$(printf \\$(printf '%03o' ${_randomAscii}))
            item=${item}${_randomChar}
    done

    # echo "item=${item}"
}

#--------------------------------------------#
#   08. 項目変数タイプが整数値の場合、データ作成
#--------------------------------------------#
function create_integer_item() {

    # 項目の桁数
    _itemLength=$1
    # 変数初期化有無
    _funcOption=$2

    # 1番項目の場合変数初期化
    if [[ ${_funcOption} = "" ]];then
        item=""
    fi

    # 整数データ作成
    for ((i=1; i<=${_itemLength}; i++)); do
        if [[ ${i} = [1] ]];then
            _randomint=$((RANDOM % 9))
            if [[ ${_randomint} = [0] ]];then
                _randomint=9
            fi
        else
            _randomint=$((RANDOM % 10))
        fi
        item=${item}${_randomint}
    done

    # echo "item=${item}"
}

#--------------------------------------------#
#   09. 項目変数タイプが小数値の場合、データ作成
#--------------------------------------------#
function create_float_item() {
    
    # 項目の桁数
    _itemLength=$1
    # 変数初期化有無
    _funcOption=$2
    
    # 1番項目の場合変数初期化
    if [[ ${_funcOption} = "" ]];then
        item=""
    fi

    # 整数、「.」、小数　の総数
    _fullParts=`echo ${_itemLength} | awk -F. '{print $1}'`
    # 小数部分の桁数
    _decimalParts=`echo ${_itemLength} | awk -F. '{print $2}'`
    # 整数部分の桁数
    _integerParts=$(( ${_fullParts} - ${_decimalParts} - 1 ))
    
    # 小数値データ作成
    for ((i=1; i<=${_integerParts}; i++)) ;do
        if [[ ${i} = [1] ]];then
            _randomint=$((RANDOM % 9))
            if [[ ${_randomint} = [0] ]];then
                _randomint=9
            fi
        else
            _randomint=$((RANDOM % 10))
        fi
        item=${item}${_randomint}
    done

    item=${item}.

    if [[ ${_decimalParts} -gt 0 ]];then
        for ((i=1; i<=$(( ${_decimalParts} - 1 )); i++)) ;do
            _randomint=$((RANDOM % 10))
            item=${item}${_randomint}
        done
        _randomint=$((RANDOM % 10))
        if [[ ${_randomint} = [0] ]];then
            _randomint=9
        fi
        item=${item}${_randomint}
    fi

    # echo "item=${item}"
}

#--------------------------------------------#
#   10. 項目変数タイプが日付値の場合、データ作成
#--------------------------------------------#
function create_date_item() {

    # 出力フォーマット
    _format=$1
    
    #　出力フォーマットによって実行日を設定
    if [[ ${_format} =~ YYYYMMDDhhmmss ]];then
        item=`date +"%Y%m%d%H%M%S"`
    elif [[ ${_format} =~ YYYYMMDDhhmm ]];then
        item=`date +"%Y%m%d%H%M"`
    elif [[ ${_format} =~ YYYYMMDDhh ]];then
        item=`date +"%Y%m%d%H"`
    elif [[ ${_format} =~ YYYYMMDD ]];then
        item=`date +"%Y%m%d"`
    elif [[ ${_format} =~ YYYYMM ]];then
        item=`date +"%Y%m"`
    elif [[ ${_format} =~ YYYY ]];then
        item=`date +"%Y"`
    elif [[ ${_format} =~ MMDD ]];then
        item=`date +"%m%d"`
    elif [[ ${_format} =~ MM ]];then
        item=`date +"%m"`
    elif [[ ${_format} =~ DD ]];then
        item=`date +"%d"`
    elif [[ ${_format} =~ hhmm ]];then
        item=`date +"%H%M"`
    elif [[ ${_format} =~ hh ]];then
        item=`date +"%H"`
    fi

    # echo "item=${item}"
}

#--------------------------------------------#
#   11. 設定ファイルから出力結果名情報を取得
#--------------------------------------------#
function check_data_outputName() {

    # 関数終了コード
    local outputName_status=""
    # 設定ファイルパス
    local _settingFile=${1}
    # ファイル番号
    data_fileCounts=`echo ${data_outputName} | grep -o "?" | wc -l`
    # 出力結果名
    export `cat ${_settingFile} | grep data_outputName`
    export `cat ${_settingFile} | grep data_schema`
    checked_data_outputName=""
    
    # 取得情報選別
    if [[ ${data_outputName} =~ YYYYMMDDhhmmss ]];then
        YYYYMMDDhhmmss=`date +"%Y%m%d%H%M%S"`
        checked_data_outputName=`echo ${data_outputName} | sed "s/YYYYMMDDhhmmss/${YYYYMMDDhhmmss}/g"`
        data_outputName_status="0"
    elif [[ ${data_outputName} =~ YYYYMMDDhhmm ]];then
        YYYYMMDDhhmm=`date +"%Y%m%d%H%M"`
        checked_data_outputName=`echo ${data_outputName} | sed "s/YYYYMMDDhhmm/${YYYYMMDDhhmm}/g"`
        data_outputName_status="0"
    elif [[ ${data_outputName} =~ YYYYMMDDhh ]];then
        YYYYMMDDhh=`date +"%Y%m%d%H"`
        checked_data_outputName=`echo ${data_outputName} | sed "s/YYYYMMDDhh/${YYYYMMDDhh}/g"`
        data_outputName_status="0"
    elif [[ ${data_outputName} =~ YYYYMMDD ]];then
        YYYYMMDD=`date +"%Y%m%d"`
        checked_data_outputName=`echo ${data_outputName} | sed "s/YYYYMMDD/${YYYYMMDD}/g"`
        data_outputName_status="0"
    elif [[ ${data_outputName} =~ YYYYMM ]];then
        YYYYMM=`date +"%Y%m"`
        checked_data_outputName=`echo ${data_outputName} | sed "s/YYYYMM/${YYYYMM}/g"`
        data_outputName_status="0"
    elif [[ ${data_outputName} =~ YYYY ]];then
        YYYY=`date +"%Y"`
        checked_data_outputName=`echo ${data_outputName} | sed "s/YYYY/${YYYY}/g"`
        data_outputName_status="0"
    elif [[ ${data_outputName} =~ MMDD ]];then
        MMDD=`date +"%m%d"`
        checked_data_outputName=`echo ${data_outputName} | sed "s/MMDD/${MMDD}/g"`
        data_outputName_status="0"
    elif [[ ${data_outputName} =~ MM ]];then
        MM=`date +"%m"`
        checked_data_outputName=`echo ${data_outputName} | sed "s/MM/${MM}/g"`
        data_outputName_status="0"
    elif [[ ${data_outputName} =~ DD ]];then
        DD=`date +"%d"`
        checked_data_outputName=`echo ${data_outputName} | sed "s/DD/${DD}/g"`
        data_outputName_status="0"
    elif [[ ${data_outputName} =~ hhmm ]];then
        hhmm=`date +"%H%M"`
        checked_data_outputName=`echo ${data_outputName} | sed "s/hhmm/${hhmm}/g"`
        data_outputName_status="0"
    elif [[ ${data_outputName} =~ hh ]];then
        hh=`date +"%H"`
        checked_data_outputName=`echo ${data_outputName} | sed "s/hh/${hh}/g"`
        data_outputName_status="0"
    else
        checked_data_outputName=${data_outputName}
        data_outputName_status="0"
    fi
    
    # 連番がある場合の設定
    if [[ ${_data_fileCounts} -gt 0 ]];then
        checked_data_outputName=`echo ${checked_data_outputName} | sed "s/?/0/g"`
    fi

    # echo "取得出力結果名：${checked_data_outputName}、取得ファイル番号：${_data_fileCounts}"
}

#--------------------------------------------#
#   12. ノーマルデータ作成（マルチバイトデータ作成）
#--------------------------------------------#
function create_normal_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # 設定ファイルパス
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # 項目タイプ
    local _itemType=""
    # 項目桁数
    local _itemLength=""

    # データ作成処理
    for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
        # 設定ファイルから取得する項目タイプ情報
        _itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
        # 設定ファイルから取得する項目桁数情報
        _itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
        # 項目変数初期化
        item=""

        # マルチバイトチェック処理、対象：文字列タイプのみ
        # 文字コードが「UTF-8の場合、マルチバイト文字は3バイト
        # 文字コードが「「JIS」,「SJIS」,「EUC」の場合、マルチバイト文字は2バイト
        # その他の文字コードの場合、マルチバイト文字は1バイト
        if [[ ${checked_data_multiByteCharacter} = "" ]];then
            item=${item}
        else 
            if [[ ${_itemType} = [sS][tT][rR][iI][nN][gG] && ${_itemLength} -gt 3 && ${checked_data_encoding} =~ UTF-8 ]];then
                item=${item}${checked_data_multiByteCharacter}
                _itemLength=$(( ${_itemLength} - 3 ))
            elif [[ ${_itemType} = [sS][tT][rR][iI][nN][gG] && ${_itemLength} -gt 2 && ${checked_data_encoding} =~ JIS || ${checked_data_encoding} =~ EUC ]];then
                item=${item}${checked_data_multiByteCharacter}
                _itemLength=$(( ${_itemLength} - 2 ))
            elif [[ ${_itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                item=${item}${checked_data_multiByteCharacter}
                _itemLength=$(( ${_itemLength} - 1 ))
            fi
        fi

        # 項目タイプ別テストデータ作成
        if [[ ${_itemType} = [cC][hH][aA][rR] || ${_itemType} = [sS][tT][rR][iI][nN][gG] ]];then
            create_string_item ${_itemLength} ${_option}
        elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
            create_integer_item ${_itemLength} ${_option}
        elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
            create_float_item ${_itemLength} ${_option}
        elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
            create_date_item ${_itemType}
        fi
        
        # 項目データ、囲み文字、区切り文字、改行コードから一時ファイル(文字コード設定ファイル)作成
        if [[ ${itemsCount} = ${itemIndex} ]];then
            if [[ ${checked_data_outputType} = SQL ]];then
                checked_data_enclosing=\'
                _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
            else
                _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                if [[ ${checked_data_newLine} = CRLF ]];then
                    printf "${_dataRecord}$(printf \\$(printf '%03o' 13 ))\n" > ${_createFile}
                elif  [[ ${checked_data_newLine} = CR ]];then
                    printf "${_dataRecord}$(printf \\$(printf '%03o' 13 ))" > ${_createFile}
                else # LF
                    printf "${_dataRecord}\n" > ${_createFile}
                fi
            fi
        else
            if [[ ${checked_data_outputType} = SQL ]];then
                checked_data_enclosing=\'
                _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}
            else
                _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}
            fi
        fi
    done

    # SQLの場合、クエリー形式に修正
    if [[ ${checked_data_outputType} = SQL ]];then
        list_itemsName=`echo ${list_itemsName} | sed 's/"//g'`
        echo "INSERT INTO "${data_schema}.${data_outputName}" (${list_itemsName}) VALUES (${_dataRecord})" > ${_createFile}.sql
    fi

    dataNumber=$(( ${dataNumber} + 1))
    dataRecordLine=$(( ${dataRecordLine} + 1))
    dataTargetItemNumber="A"
    dataExplanation="Normal Data"
    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/CreateTestData_Explan.txt

}

#--------------------------------------------#
#   13. トリムデータ(半角、全角スペース)作成
#--------------------------------------------#
function create_trim_data() {
    
    # 項目トリム情報
    _itemTrim=$1
    # 項目トリム位置
    _trimLocation=$2

    # 半角スペーストリム設定
    if [[ ${_trimLocation} = [hH][sS] ]];then
        if [[ ${_itemTrim} =~ ft ]];then
            item=""
            item=${item}" "
        elif [[ ${_itemTrim} =~ bk ]];then
            item=${item}" "
        fi
    fi

    # 全角スペーストリム設定
    if [[ ${_trimLocation} = [fF][sS] ]];then
        if [[ ${_itemTrim} =~ FT ]];then
            item=""
            item=${item}"　"
        elif [[ ${_itemTrim} =~ BK ]];then
            item=${item}"　"
        fi
    fi
}

#--------------------------------------------#
#   14. トリムデータ作成
#--------------------------------------------#
function create_trim_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # 設定ファイルパス
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # 項目トリム情報
    local _itemTrim=""
    # 項目トリムパタン数
    local _itemTrimCount=""
    # 項目トリムターゲットパタン
    local _targetItemTrim=""
    # 項目トリム除外フラグ
    local _trimFlg=""
    # 項目タイプ
    local _itemType=""
    # 項目桁数
    local _itemLength=""
    # 整数、「.」、小数　の総数
    local _fullParts=""
    # 小数部分の桁数
    local _decimalParts=""
    # 整数部分の桁数
    local _integerParts=""
    # トリムターゲット項目番号
    local _trimItemIndex=1
    # カレントトリムターゲット項目番号
    local _tmpCount=1
    # トリム情報から取得する先頭の文字
    local _cutfront=1
    # トリム情報から取得する後列の文字
    local _cutback=2

    # データ作成処理
    while [ true ]; do

        # 設定ファイルから取得する項目トリム情報
        _itemTrim=`echo ${list_itemsTrim} | sed 's/"//g' | awk -F, -v field=${_trimItemIndex} '{print $field}'`
        # 項目トリム情報文字列数
        _itemTrimCount=$(( `echo "${_itemTrim}" | wc -c` - 1 ))
        _itemTrimCount=$(( ${_itemTrimCount} / 2 ))
        # 項目トリム情報
        _targetItemTrim=`echo "${_itemTrim}" | cut -b ${_cutfront}-${_cutback}`
        # トリムデータフラグ
        _trimFlg=0
        # 項目変数初期化
        item=""
        _dataRecord=""

        # 項目トリム情報に　「ft」が存在場合、項目の先頭に半角スペース（1バイト）追加 
        # 項目トリム情報に　「bk」が存在場合、項目の後列に半角スペース（1バイト）追加 
        # 項目トリム情報に　「FT」が存在場合、項目の先頭に全角スペース（2バイト）追加 
        # 項目トリム情報に　「BK」が存在場合、項目の後列に全角スペース（2バイト）追加 
        for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
            # 設定ファイルから取得する項目タイプ情報
            _itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する項目桁数情報
            _itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する小数情報
            # 整数、「.」、小数　の総数
            _fullParts=`echo ${_itemLength} | awk -F. '{print $1}'`
            # 小数部分の桁数
            _decimalParts=`echo ${_itemLength} | awk -F. '{print $2}'`
            # 整数部分の桁数
            _integerParts=$(( ${_fullParts} - ${_decimalParts} - 1 ))

            # 項目タイプ別テストデータ作成
            # 先頭トリム対象の場合、トリムデータ作成および本データ桁数再設定
            # 後列トリム対象の場合、本データ桁数再設定
            if [[ ${itemIndex} = ${_trimItemIndex} ]];then
                if [[ ${_targetItemTrim} = ft ]];then
                    if [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                        if [[ ${_integerParts} -gt 1 ]];then
                            _itemLength=${_fullParts}
                        else
                            item=""
                            _trimFlg=1
                            continue
                        fi
                    fi

                    if [[ ${_itemLength} -gt 1 ]];then
                        create_trim_data ${_targetItemTrim} HS
                        _itemLength=$(( ${_itemLength} - 1))
                        dataTargetItemNumber=${itemIndex}
                    else
                        _trimFlg=1
                    fi
                elif [[ ${_targetItemTrim} = FT ]];then
                    if [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                        if [[ ${_integerParts} -gt 2 ]];then
                            _itemLength=${_fullParts}
                        else
                            item=""
                            _trimFlg=1
                            continue
                        fi
                    fi

                    if [[ ${_itemLength} -gt 2 ]];then
                        create_trim_data ${_targetItemTrim} FS
                        _itemLength=$(( ${_itemLength} - 2))
                        dataTargetItemNumber=${itemIndex}
                    else
                        _trimFlg=1
                    fi
                elif [[ ${_targetItemTrim} = bk ]];then
                    if [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                        if [[ ${_decimalParts} -gt 1 ]];then
                            _itemLength=${_fullParts}
                            _decimalParts=$(( ${_decimalParts} - 1 ))
                        else
                            item=""
                            _trimFlg=1
                            continue
                        fi
                    fi

                    if [[ ${_itemLength} -gt 1 ]];then
                        _itemLength=$(( ${_itemLength} - 1 ))
                    else
                        _trimFlg=1
                    fi
                elif [[ ${_targetItemTrim} = BK ]];then
                    if [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                        if [[ ${_decimalParts} -gt 2 ]];then
                            _itemLength=${_fullParts}
                            _decimalParts=$(( ${_decimalParts} - 2 ))
                        else
                            item=""
                            _trimFlg=1
                            continue
                        fi
                    fi

                    if [[ ${_itemLength} -gt 2 ]];then
                        _itemLength=$(( ${_itemLength} - 2 ))
                    else
                        _trimFlg=1
                    fi
                elif [[ ${_targetItemTrim} = "" ]];then
                    _trimFlg=1
                fi  
            fi

            # トリム対象ではない場合、省略
            if [[ ${_trimFlg} = 1 ]];then
                continue
            else
                if [[ ${itemIndex} = ${_trimItemIndex} ]];then
                    dataNumber=$(( ${dataNumber} + 1))
                    dataRecordLine=$(( ${dataRecordLine} + 1))
                    if [[ ${_targetItemTrim} = ft ]];then
                        dataExplanation="先頭半角スペーストリム（${_targetItemTrim}）"
                    elif [[ ${_targetItemTrim} = bk ]];then
                        dataExplanation="後列半角スペーストリム（${_targetItemTrim}）"
                    elif [[ ${_targetItemTrim} = FT ]];then
                        dataExplanation="先頭全角スペーストリム（${_targetItemTrim}）"
                    elif [[ ${_targetItemTrim} = BK ]];then
                        dataExplanation="後列全角スペーストリム（${_targetItemTrim}）"
                    fi
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/CreateTestData_Explan.txt
                fi
            fi

            # トリム桁数除外のデータ作成
            if [[ ${_itemType} = [cC][hH][aA][rR] || ${_itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                create_string_item ${_itemLength} ${_option}
            elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
                create_integer_item ${_itemLength} ${_option}
            elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                _itemLength=${_itemLength}.${_decimalParts}
                create_float_item ${_itemLength} ${_option}
            elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
                create_date_item ${_itemType}
            fi

            # 後列トリム対象の場合、トリムデータ作成
            if [[ ${itemIndex} = ${_trimItemIndex} ]];then
                if [[ ${_targetItemTrim} = bk ]];then
                    create_trim_data ${_targetItemTrim} HS
                    dataTargetItemNumber=${itemIndex}
                elif [[ ${_targetItemTrim} = BK ]];then
                    create_trim_data ${_targetItemTrim} FS
                    dataTargetItemNumber=${itemIndex}
                fi
            fi

            # 項目データ、囲み文字、区切り文字、改行コードから一時ファイル(文字コード設定ファイル)作成
            if [[ ${itemsCount} = ${itemIndex} ]];then
                if [[ ${checked_data_outputType} = SQL ]];then
                    checked_data_enclosing=\'
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                else
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                    if [[ ${checked_data_newLine} = CRLF ]];then
                        printf "${_dataRecord}$(printf \\$(printf '%03o' 13 ))\n" >> ${_createFile}
                    elif  [[ ${checked_data_newLine} = CR ]];then
                        printf "${_dataRecord}$(printf \\$(printf '%03o' 13 ))" >> ${_createFile}
                    else # LF
                        printf "${_dataRecord}\n" >> ${_createFile}
                    fi
                fi
            else
                if [[ ${checked_data_outputType} = SQL ]];then
                    checked_data_enclosing=\'
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}
                else
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}
                fi
            fi
            
            # レコード出力後項目変数初期化
            item=""
        done

        # SQLの場合、クエリー形式に修正
        if [[ ${checked_data_outputType} = SQL ]];then
            list_itemsName=`echo ${list_itemsName} | sed 's/"//g'`
            echo "INSERT INTO "${data_schema}.${data_outputName}" (${list_itemsName}) VALUES (${_dataRecord})" > ${_createFile}.sql
        fi

        # トリムタイプが複数の場合、次のタイプのデータ作成
        # ftFTの場合、半角スペーストリムデータ(ft)作成後全角スペーストリムデータ(FT)を作成
        if [[ 0 -eq ${_itemTrimCount} ]];then
            _trimItemIndex=$(( ${_trimItemIndex} + 1 ))
        elif [[ ${_tmpCount} -eq ${_itemTrimCount} ]];then
            _trimItemIndex=$(( ${_trimItemIndex} + 1 ))
            _tmpCount=1
            _cutfront=1
            _cutback=2
        else
            _tmpCount=$(( ${_tmpCount} + 1 ))
            _cutfront=$(( ${_cutfront} + 2 ))
            _cutback=$(( ${_cutback} + 2 ))
        fi

        # 全項目のデータ作成後終了
        if [[ ${_trimItemIndex} -gt ${itemsCount} ]];then
            break
        fi
    done 

}

#--------------------------------------------#
#   15. 数値タイプのリミットデータ作成(陰數除外)
#--------------------------------------------#
function create_number_limit_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # 設定ファイルパス
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # 項目トリム除外フラグ
    local _limitFlg=""
    # リミットチェック数
    local _number_limit=1
    # 対象項目番号
    local _limitItemIndex=1
    
    # データ作成処理
    while [ true ]; do

        # トリムデータフラグ
        _limitFlg=0
        # 項目変数初期化
        item=""
        _dataRecord=""
        
        # 項目タイプ情報が数値タイプの場合のみデータ作成
        for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
            # 設定ファイルから取得する項目タイプ情報
            _itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する項目桁数情報
            _itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する小数情報
            # 整数、「.」、小数　の総数
            _fullParts=`echo ${_itemLength} | awk -F. '{print $1}'`
            # 小数部分の桁数
            _decimalParts=`echo ${_itemLength} | awk -F. '{print $2}'`
            # 整数部分の桁数
            _integerParts=$(( ${_fullParts} - ${_decimalParts} - 1 ))

            # 項目タイプ別テストデータ作成
            if [[ ${_itemType} = [cC][hH][aA][rR] || ${_itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                create_string_item ${_itemLength} ${_option}
                if [[ ${_limitItemIndex} = ${itemIndex} ]];then
                    _limitFlg=1
                fi
            elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
                if [[ ${_limitItemIndex} = ${itemIndex} ]];then
                    for ((i=1; i<=${_itemLength}; i++)); do
                        if [[ ${_number_limit} = 1 ]];then
                            _randomint=9
                        else
                            _randomint=0
                        fi
                        item=${item}${_randomint}
                    done
                    dataTargetItemNumber=${itemIndex}
                else
                    create_integer_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                if [[ ${_limitItemIndex} = ${itemIndex} ]];then
                    for ((i=1; i<=${_integerParts}; i++)); do
                        if [[ ${_number_limit} = 1 ]];then
                            _randomint=9
                        else
                            _randomint=0
                        fi
                        item=${item}${_randomint}
                    done
                    item=${item}.
                    for ((i=1; i<=${_decimalParts}; i++)); do
                        if [[ ${_number_limit} = 1 ]];then
                            _randomint=9
                        else
                            _randomint=0
                        fi
                        item=${item}${_randomint}
                    done
                    dataTargetItemNumber=${itemIndex}
                else
                    create_float_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
                if [[ ${_limitItemIndex} = ${itemIndex} ]];then
                    _limitFlg=1
                else
                    create_date_item ${_itemType}
                fi
            fi
            
            # リミットチェック対象ではない場合、省略
            if [[ ${_limitFlg} = 1 ]];then
                continue
            else
                if [[ ${itemIndex} = ${_limitItemIndex} ]];then
                    dataNumber=$(( ${dataNumber} + 1))
                    dataRecordLine=$(( ${dataRecordLine} + 1))
                    if [[ ${_number_limit} = 1 ]];then
                        dataExplanation="最大データ"
                    elif [[ ${_number_limit} = 2 ]];then
                        dataExplanation="最小データ"
                    fi
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/CreateTestData_Explan.txt
                fi
            fi

            # 項目データ、囲み文字、区切り文字、改行コードから一時ファイル(文字コード設定ファイル)作成
            if [[ ${itemsCount} = ${itemIndex} ]];then
                if [[ ${checked_data_outputType} = SQL ]];then
                    checked_data_enclosing=\'
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                else
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                    if [[ ${checked_data_newLine} = CRLF ]];then
                        printf "${_dataRecord}$(printf \\$(printf '%03o' 13 ))\n" >> ${_createFile}
                    elif  [[ ${checked_data_newLine} = CR ]];then
                        printf "${_dataRecord}$(printf \\$(printf '%03o' 13 ))" >> ${_createFile}
                    else # LF
                        printf "${_dataRecord}\n" >> ${_createFile}
                    fi
                fi
            else
                if [[ ${checked_data_outputType} = SQL ]];then
                    checked_data_enclosing=\'
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}
                else
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}
                fi
            fi

            # レコード出力後項目変数初期化
            item=""
        done

        # SQLの場合、クエリー形式に修正
        if [[ ${checked_data_outputType} = SQL ]];then
            list_itemsName=`echo ${list_itemsName} | sed 's/"//g'`
            echo "INSERT INTO "${data_schema}.${data_outputName}" (${list_itemsName}) VALUES (${_dataRecord})" > ${_createFile}.sql
        fi

        # 数値データを最大データ「9」で作成、最小データ「0」で作成
        if [[ ${_number_limit} = 2 ]];then
            _limitItemIndex=$(( ${_limitItemIndex} + 1 ))
            _number_limit=1
        else
            _number_limit=2
        fi

        # 全項目のデータ作成後終了
        if [[ ${_limitItemIndex} -gt ${itemsCount} ]];then
            break
        fi
    done 

}

#--------------------------------------------#
#   16. ヌル許可データ作成
#--------------------------------------------#
function create_not_null_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # 設定ファイルパス
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # 項目ノットヌル除外フラグ
    local _limitFlg=""
    # 対象項目番号
    local _notNullItemIndex=1

    # データ作成処理
    while [ true ]; do

        # ノットヌルデータフラグ
        _notNullFlg=0
        # 項目変数初期化
        item=""
        _dataRecord=""

        # ヌル許可の場合、ヌルでデータ作成
        for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
            # 設定ファイルから取得するノットヌル情報
            _itemNotNull=`echo ${list_itemsNotNull} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する項目タイプ情報
            _itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する項目桁数情報
            _itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する小数情報
            # 整数、「.」、小数　の総数
            _fullParts=`echo ${_itemLength} | awk -F. '{print $1}'`

            # 項目タイプ別テストデータ作成
            if [[ ${_itemType} = [cC][hH][aA][rR] || ${_itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                if [[ ${_notNullItemIndex} = ${itemIndex} ]];then
                    if [[ ${_itemNotNull} = 1 ]];then
                        if [[ ${checked_data_enclosing} = "" && ${checked_data_delimiting} = "" ]];then
                            for ((i=1; i<=${_itemLength}; i++)); do
                                _randomchar=" "
                                item=${item}${_randomchar}
                            done
                        else
                            _randomchar=""
                            item=${item}${_randomchar}
                        fi
                        dataTargetItemNumber=${itemIndex}
                    elif [[ ${_itemNotNull} = 0 ]];then
                        _notNullFlg=1
                    fi
                else
                    create_string_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
                if [[ ${_notNullItemIndex} = ${itemIndex} ]];then
                    if [[ ${_itemNotNull} = 1 ]];then
                        if [[ ${checked_data_enclosing} = "" && ${checked_data_delimiting} = "" ]];then
                            for ((i=1; i<=${_itemLength}; i++)); do
                                _randomint=" "
                                item=${item}${_randomint}
                            done
                        else
                            _randomint=""
                            item=${item}${_randomint}
                        fi
                        dataTargetItemNumber=${itemIndex}
                    else
                        _notNullFlg=1
                    fi
                else
                    create_integer_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                if [[ ${_notNullItemIndex} = ${itemIndex} ]];then
                    if [[ ${_itemNotNull} = 1 ]];then
                        if [[ ${checked_data_enclosing} = "" && ${checked_data_delimiting} = "" ]];then
                            for ((i=1; i<=${_fullParts}; i++)); do
                                _randomint=" "
                                item=${item}${_randomint}
                            done
                        else
                            _randomint=""
                            item=${item}${_randomint}
                        fi
                        dataTargetItemNumber=${itemIndex}
                    else
                        _notNullFlg=1
                    fi
                else
                    create_float_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
                if [[ ${_notNullItemIndex} = ${itemIndex} ]];then
                    if [[ ${_itemNotNull} = 1 ]];then
                        if [[ ${checked_data_enclosing} = "" && ${checked_data_delimiting} = "" ]];then
                            for ((i=1; i<=${_itemLength}; i++)); do
                                _randomDate=" "
                                item=${item}${_randomDate}
                            done
                        else
                            _randomDate=""
                            item=${item}${_randomDate}
                        fi
                        dataTargetItemNumber=${itemIndex}
                    else
                        _notNullFlg=1
                    fi
                else
                    create_date_item ${_itemType}
                fi
            fi
            
            # ヌル許可対象ではない場合、省略
            if [[ ${_notNullFlg} = 1 ]];then
                continue
            else
                if [[ ${itemIndex} = ${_notNullItemIndex} ]];then
                    dataNumber=$(( ${dataNumber} + 1))
                    dataRecordLine=$(( ${dataRecordLine} + 1))
                    dataExplanation="ヌルデータ設定"
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/CreateTestData_Explan.txt
                fi
            fi

            # 項目データ、囲み文字、区切り文字、改行コードから一時ファイル(文字コード設定ファイル)作成
            if [[ ${itemsCount} = ${itemIndex} ]];then
                if [[ ${checked_data_outputType} = SQL ]];then
                    checked_data_enclosing=\'
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                else
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                    if [[ ${checked_data_newLine} = CRLF ]];then
                        printf "${_dataRecord}$(printf \\$(printf '%03o' 13 ))\n" >> ${_createFile}
                    elif  [[ ${checked_data_newLine} = CR ]];then
                        printf "${_dataRecord}$(printf \\$(printf '%03o' 13 ))" >> ${_createFile}
                    else # LF
                        printf "${_dataRecord}\n" >> ${_createFile}
                    fi
                fi
            else
                if [[ ${checked_data_outputType} = SQL ]];then
                    checked_data_enclosing=\'
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}
                else
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}
                fi
            fi
            
            # レコード出力後項目変数初期化
            item=""
        done

        # SQLの場合、クエリー形式に修正
        if [[ ${checked_data_outputType} = SQL ]];then
            list_itemsName=`echo ${list_itemsName} | sed 's/"//g'`
            echo "INSERT INTO "${data_schema}.${data_outputName}" (${list_itemsName}) VALUES (${_dataRecord})" > ${_createFile}.sql
        fi

        # ヌルデータ対象変更
        _notNullItemIndex=$(( ${_notNullItemIndex} + 1 ))

        # 全項目のデータ作成後終了
        if [[ ${_notNullItemIndex} -gt ${itemsCount} ]];then
            break
        fi
    done 

}

#--------------------------------------------#
#  メイン処理                                   #
#--------------------------------------------#
### ShellScript relativePath / 쉘 스크립트 풀패스 / シェルスクリプトフルパス
fileRelativePath=$0
### relativePath -> AbsolutePath / 상대경로 -> 절대경로 / 相対パス -> 絶対パス
fileAbsolutePath=$(realpath "$fileRelativePath")
### ShellScript Name / 쉘 스크립트 이름 / シェルスクリプト名
scriptName=$(basename $0)
### FilePath / 파일 패스 / ファイルパス
filePath=${fileAbsolutePath%/*}/
### SetFile / 설정파일 / 設定ファイル
setFilePath=${filePath%/}/CreateTestData.txt

check_data_encoding ${setFilePath}
check_data_newLine ${setFilePath}
check_data_enclosing ${setFilePath}
check_data_delimiting ${setFilePath}
check_data_outputType ${setFilePath}
check_data_outputName ${setFilePath}
check_data_multiByteCharacter ${setFilePath} jp

export `cat ${setFilePath} | grep data_escapeCode_list`
export `cat ${setFilePath} | grep list_itemsTrim`
export `cat ${setFilePath} | grep list_itemsType`
export `cat ${setFilePath} | grep list_itemsName`
export `cat ${setFilePath} | grep list_itemsLength`
export `cat ${setFilePath} | grep list_itemsNotNull`

### ItemCounts / 항목수 / 項目数
itemsCount=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, '{print NF}'`

### ExplanFile / 설명파일 / 説明ファイル
dataNumber=""
dataRecordLine=""
dataTargetItemNumber=""
dataExplanation=""
printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "No" "#" "LINE" "#" "ITEM" "#" "PATTERN"> ${filePath%/}/CreateTestData_Explan.txt
printf "%s\n" "######################################################################" >> ${filePath%/}/CreateTestData_Explan.txt

### Normal data
create_normal_record ${filePath%/}/tmp_${checked_data_outputName} ${checked_data_multiByteCharacter}
### Trim data
create_trim_record ${filePath%/}/tmp_${checked_data_outputName} trim
### Limit Number data
create_number_limit_record ${filePath%/}/tmp_${checked_data_outputName} number_limit
### Not Null data
create_not_null_record ${filePath%/}/tmp_${checked_data_outputName} not_null

### encoding change
if [[ -e ${filePath%/}/tmp_${checked_data_outputName} ]];then
    if [[ ${checked_data_encoding} = UTF-8 ]];then
        nkf -w ${filePath%/}/tmp_${checked_data_outputName} > ${filePath%/}/${checked_data_outputName}
    elif [[ ${checked_data_encoding} = EUC ]];then
        nkf -e ${filePath%/}/tmp_${checked_data_outputName} > ${filePath%/}/${checked_data_outputName}
    elif [[ ${checked_data_encoding} = JIS ]];then
        nkf -j ${filePath%/}/tmp_${checked_data_outputName} > ${filePath%/}/${checked_data_outputName}
    elif [[ ${checked_data_encoding} = SJIS ]];then
        nkf -s ${filePath%/}/tmp_${checked_data_outputName} > ${filePath%/}/${checked_data_outputName}
    elif [[ ${checked_data_encoding} = "UTF-8(BOM)" ]];then
        nkf --oc=UTF-8-BOM ${filePath%/}/tmp_${checked_data_outputName} > ${filePath%/}/${checked_data_outputName}
    fi
    rm -rfv ${filePath%/}/tmp_${checked_data_outputName}
fi

### compressed file format
if [[ ${checked_data_outputType} = .gz ]];then
    gzip ${filePath%/}/${checked_data_outputName}
elif [[ ${checked_data_outputType} = .Z ]];then
    compress ${filePath%/}/${checked_data_outputName}
fi



#printf "%s" "testああvv" | iconv -t SJIS >> ./filename.txt
#printf "%s" "testああvv" | iconv -t SJIS | tr "\n" "\r" >> ./filename.txt
#nkf --guess ./filename.txt