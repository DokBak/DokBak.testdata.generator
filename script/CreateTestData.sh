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
#   12. 正常系_ノーマルデータ作成（マルチバイトデータ作成）
#--------------------------------------------#
function create_normal_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
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
    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/TestData/01/CreateTestData_Explan.txt

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
#   14. 正常系_トリムデータ作成
#--------------------------------------------#
function create_trim_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
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
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/TestData/01/CreateTestData_Explan.txt
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
#   15. 正常系_数値タイプのリミットデータ作成(陰數除外)
#--------------------------------------------#
function create_number_limit_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
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
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/TestData/01/CreateTestData_Explan.txt
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
#   16. 正常系_ヌル許可データ作成
#--------------------------------------------#
function create_not_null_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # 項目ノットヌル除外フラグ
    local _limitFlg=""
    # 対象項目番号
    local _notNullItemIndex=1
    # ヌル件数対象
    local _record_notNull_counts=`echo ${list_itemsNotNull} | sed 's/"//g' | grep "1"`

    # データ作成処理
    while [ true ]; do

        # ヌル対象がない場合関数終了
        if [[ ${_record_notNull_counts} = "" ]];then
            break
        fi

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
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/TestData/01/CreateTestData_Explan.txt
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
#   17. 正常系_改行コードデータ作成
#--------------------------------------------#
function create_new_line_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # 改行レコードデータ除外フラグ
    local _newLineFlg=""
    # 対象項目番号
    local _record_newLine_index=1
    # 改行レコード項目
    local _newLineIndex=1
    # 対象レコード改行タイプ数
    local _record_newLine_counts=`echo ${data_record_newLine_list} | awk -F, '{print NF}'`
    # 対象レコード
    local _record_newLine_item=""

    # データ作成処理
    while [ true ]; do

        # 改行レコード作成対象外の場合関数終了
        if [[ ${_record_newLine_counts} -eq 0 ]];then
            break
        fi

        # 改行レコードデータフラグ
        _newLineFlg=0
        # 項目変数初期化
        item=""
        _dataRecord=""

        _record_newLine_item=`echo ${data_record_newLine_list} | awk -F, -v field=${_newLineIndex} '{print $field}' | sed 's/"//g'`

        # 改行レコード許可の場合、改行レコードでデータ作成
        for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
            # 設定ファイルから取得する項目タイプ情報
            _itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する項目桁数情報
            _itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`

            # 項目タイプ別テストデータ作成
            if [[ ${_itemType} = [cC][hH][aA][rR] || ${_itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                if [[ ${_record_newLine_index} = ${itemIndex} ]];then
                    if [[ ${_record_newLine_item} = [cC][rR][lL][fF] ]];then
                        if [[ ${_itemLength} -gt 2 ]];then
                            item=${item}"!?" # " !=\r, ?=\n " 
                            _itemLength=$(( ${_itemLength} -2 ))
                            dataTargetItemNumber=${itemIndex}
                        else
                            _newLineFlg=1
                        fi
                    elif [[ ${_record_newLine_item} = [cC][rR] ]];then
                        if [[ ${_itemLength} -gt 1 ]];then
                            item=${item}"!" # " !=\r, ?=\n " 
                            _itemLength=$(( ${_itemLength} -1 ))
                            dataTargetItemNumber=${itemIndex}
                        else
                            _newLineFlg=1
                        fi
                    elif [[ ${_record_newLine_item} = [lL][fF] ]];then
                        if [[ ${_itemLength} -gt 1 ]];then
                            item=${item}"?" # " !=\r, ?=\n " 
                            _itemLength=$(( ${_itemLength} -1 ))
                            dataTargetItemNumber=${itemIndex}
                        else
                            _newLineFlg=1
                        fi
                    fi
                    create_string_item ${_itemLength} ${_option}
                else
                    create_string_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
                if [[ ${_record_newLine_index} = ${itemIndex} ]];then
                    _newLineFlg=1
                else
                    create_integer_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                if [[ ${_record_newLine_index} = ${itemIndex} ]];then
                    _newLineFlg=1
                else
                    create_float_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
                if [[ ${_record_newLine_index} = ${itemIndex} ]];then
                    _newLineFlg=1
                else
                    create_date_item ${_itemType}
                fi
            fi
            
            # 改行レコードデータ許可対象ではない場合、省略
            if [[ ${_newLineFlg} = 1 ]];then
                continue
            else
                if [[ ${itemIndex} = ${_record_newLine_index} ]];then
                    dataNumber=$(( ${dataNumber} + 1))
                    dataRecordLine=$(( ${dataRecordLine} + 1))
                    dataRecordLine2=$(( ${dataRecordLine} + 1))
                    dataExplanation="改行レコードデータ"
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}-${dataRecordLine2}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}(${_record_newLine_item})" >> ${filePath%/}/TestData/01/CreateTestData_Explan.txt
                    dataRecordLine=$(( ${dataRecordLine} + 1))
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
                        printf "${_dataRecord}$(printf \\$(printf '%03o' 13 ))\n" | sed 's/!/\r/' | sed 's/?/\n/' >> ${_createFile}
                    elif  [[ ${checked_data_newLine} = CR ]];then
                        printf "${_dataRecord}$(printf \\$(printf '%03o' 13 ))" | sed 's/?/\r/' | sed 's/?/\n/' >> ${_createFile}
                    else # LF
                        printf "${_dataRecord}\n" | sed 's/?/\r/' | sed 's/?/\n/' >> ${_createFile}
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

        # 改行レコードデータ対象変更
        if [[ ${_record_newLine_counts} = ${_newLineIndex} ]];then
            _record_newLine_index=$(( ${_record_newLine_index} + 1 ))
            _newLineIndex=1
        else
            _newLineIndex=$(( ${_newLineIndex} + 1 ))
        fi

        # 全項目のデータ作成後終了
        if [[ ${_record_newLine_index} -gt ${itemsCount} ]];then
            break
        fi
    done 

}

#--------------------------------------------#
#   18. 正常系_エスケープ文字データ作成
#--------------------------------------------#
function create_escape_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # エスケープ文字データ除外フラグ
    local _escapeFlg=""
    # 対象項目番号
    local _record_escape_index=1
    # エスケープ文字項目
    local _escapeIndex=1
    # 対象レコード改行タイプ数
    local _record_escape_counts=`echo ${data_escapeCode_list} | awk -F, '{print NF}'`
    # 対象レコード
    local _record_escape_item=""

    # データ作成処理
    while [ true ]; do

        # エスケープ文字作成対象外の場合関数終了
        if [[ ${_record_escape_counts} -eq 0 ]];then
            break
        fi

        # エスケープ文字データフラグ
        _escapeFlg=0
        # 項目変数初期化
        item=""
        _dataRecord=""
        _escape=""
        
        _record_escape_item=`echo ${data_escapeCode_list} | awk -F, -v field=${_escapeIndex} '{print $field}' | sed 's/"//g'`

        # エスケープ文字許可の場合、改行レコードでデータ作成
        for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
            # 設定ファイルから取得する項目タイプ情報
            _itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する項目桁数情報
            _itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`

            # 項目タイプ別テストデータ作成
            if [[ ${_itemType} = [cC][hH][aA][rR] || ${_itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                if [[ ${_record_escape_index} = ${itemIndex} ]];then
                    if [[ ${_record_escape_item} = 0 ]];then
                        if [[ ${_itemLength} -gt 2 ]];then
                            _escapeString="\""
                            item=${item}${_escapeString}
                            _itemLength=$(( ${_itemLength} -2 ))
                            dataTargetItemNumber=${itemIndex}
                        else
                            _escapeFlg=1
                        fi
                    elif [[ ${_record_escape_item} = 1 ]];then
                        if [[ ${_itemLength} -gt 2 ]];then
                            _escapeString="\'"
                            item=${item}${_escapeString}
                            _itemLength=$(( ${_itemLength} -2 ))
                            dataTargetItemNumber=${itemIndex}
                        else
                            _escapeFlg=1
                        fi
                    elif [[ ${_record_escape_item} = 2 ]];then
                        if [[ ${_itemLength} -gt 2 ]];then
                            _escapeString="\\"
                            item=${item}${_escapeString}
                            _itemLength=$(( ${_itemLength} -2 ))
                            dataTargetItemNumber=${itemIndex}
                        else
                            _escapeFlg=1
                        fi
                    fi
                    create_string_item ${_itemLength} ${_option}
                else
                    create_string_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
                if [[ ${_record_escape_index} = ${itemIndex} ]];then
                    _escapeFlg=1
                else
                    create_integer_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                if [[ ${_record_escape_index} = ${itemIndex} ]];then
                    _escapeFlg=1
                else
                    create_float_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
                if [[ ${_record_escape_index} = ${itemIndex} ]];then
                    _escapeFlg=1
                else
                    create_date_item ${_itemType}
                fi
            fi
            
            # エスケープ文字データ許可対象ではない場合、省略
            if [[ ${_escapeFlg} = 1 ]];then
                continue
            else
                if [[ ${itemIndex} = ${_record_escape_index} ]];then
                    dataNumber=$(( ${dataNumber} + 1))
                    dataRecordLine=$(( ${dataRecordLine} + 1))
                    dataExplanation="エスケープ文字データ"
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}(${_escapeString})" >> ${filePath%/}/TestData/01/CreateTestData_Explan.txt
                fi
            fi

            # 項目データ、囲み文字、区切り文字、改行コードから一時ファイル(文字コード設定ファイル)作成
            if [[ ${itemsCount} = ${itemIndex} ]];then
                if [[ ${checked_data_outputType} = SQL ]];then
                    checked_data_enclosing=\'
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                else
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                    if [[ ${checked_data_escape} = CRLF ]];then
                        printf "${_dataRecord}$(printf \\$(printf '%03o' 13 ))\n" >> ${_createFile}
                    elif  [[ ${checked_data_escape} = CR ]];then
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

        # エスケープ文字データ対象変更
        if [[ ${_record_escape_counts} = ${_escapeIndex} ]];then
            _record_escape_index=$(( ${_record_escape_index} + 1 ))
            _escapeIndex=1
        else
            _escapeIndex=$(( ${_escapeIndex} + 1 ))
        fi

        # 全項目のデータ作成後終了
        if [[ ${_record_escape_index} -gt ${itemsCount} ]];then
            break
        fi
    done 

}

#--------------------------------------------#
#   19. 正常系_項目暗号化データ作成
#--------------------------------------------#
function create_item_encrypt_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # 項目ノットヌル除外フラグ
    local _limitFlg=""
    # 対象項目番号
    local _encryptItemIndex=1
    # ヌル件数対象
    local _record_encrypt_counts=`echo ${list_itemsEncrypt} | sed 's/"//g' | awk -F, '{print NF}'`

    # データ作成処理
    while [ true ]; do

        # ヌル対象がない場合関数終了
        if [[ ${_record_encrypt_counts} = "" ]];then
            break
        fi

        # ノットヌルデータフラグ
        _encryptFlg=0
        # 項目変数初期化
        item=""
        _dataRecord=""

        # ヌル許可の場合、ヌルでデータ作成
        for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
            # 設定ファイルから取得するノットヌル情報
            _itemEncrypt=`echo ${list_itemsEncrypt} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する項目タイプ情報
            _itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する項目桁数情報
            _itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する小数情報
            # 整数、「.」、小数　の総数
            _fullParts=`echo ${_itemLength} | awk -F. '{print $1}'`

            # 項目タイプ別テストデータ作成
            if [[ ${_itemType} = [cC][hH][aA][rR] || ${_itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                if [[ ${_encryptItemIndex} = ${itemIndex} ]];then
                    if [[ ${_itemEncrypt} = 0 ]];then
                        _encryptFlg=1
                    else
                        create_string_item ${_itemLength} ${_option}
                        dataTargetItemNumber=${itemIndex}
                    fi
                else
                    create_string_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
                if [[ ${_encryptItemIndex} = ${itemIndex} ]];then
                    if [[ ${_itemEncrypt} = 0 ]];then
                        _encryptFlg=1
                    else
                        create_integer_item ${_itemLength} ${_option}
                        dataTargetItemNumber=${itemIndex}
                    fi
                else
                    create_integer_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                if [[ ${_encryptItemIndex} = ${itemIndex} ]];then
                    if [[ ${_itemEncrypt} = 0 ]];then
                        _encryptFlg=1
                    else
                        create_float_item ${_itemLength} ${_option}
                        dataTargetItemNumber=${itemIndex}
                    fi
                else
                    create_float_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
                if [[ ${_encryptItemIndex} = ${itemIndex} ]];then
                    if [[ ${_itemEncrypt} = 0 ]];then
                        _encryptFlg=1
                    else
                        create_date_item ${_itemType}
                        dataTargetItemNumber=${itemIndex}
                    fi
                else
                    create_date_item ${_itemType}
                fi
            fi
            
            # ヌル許可対象ではない場合、省略
            if [[ ${_encryptFlg} = 1 ]];then
                continue
            else
                if [[ ${itemIndex} = ${_encryptItemIndex} ]];then
                    dataNumber=$(( ${dataNumber} + 1))
                    dataRecordLine=$(( ${dataRecordLine} + 1))
                    dataExplanation="項目暗号化設定"
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/TestData/01/CreateTestData_Explan.txt
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
        _encryptItemIndex=$(( ${_encryptItemIndex} + 1 ))

        # 全項目のデータ作成後終了
        if [[ ${_encryptItemIndex} -gt ${itemsCount} ]];then
            break
        fi
    done 

}

#--------------------------------------------#
#   20. 正常系_項目ハッシュ化データ作成
#--------------------------------------------#
function create_item_hash_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # 項目ノットヌル除外フラグ
    local _limitFlg=""
    # 対象項目番号
    local _hashItemIndex=1
    # ヌル件数対象
    local _record_hash_counts=`echo ${list_itemsHash} | sed 's/"//g' | awk -F, '{print NF}'`

    # データ作成処理
    while [ true ]; do

        # ヌル対象がない場合関数終了
        if [[ ${_record_hash_counts} = "" ]];then
            break
        fi

        # ノットヌルデータフラグ
        _hashFlg=0
        # 項目変数初期化
        item=""
        _dataRecord=""

        # ヌル許可の場合、ヌルでデータ作成
        for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
            # 設定ファイルから取得するノットヌル情報
            _itemHash=`echo ${list_itemsHash} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する項目タイプ情報
            _itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する項目桁数情報
            _itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する小数情報
            # 整数、「.」、小数　の総数
            _fullParts=`echo ${_itemLength} | awk -F. '{print $1}'`

            # 項目タイプ別テストデータ作成
            if [[ ${_itemType} = [cC][hH][aA][rR] || ${_itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                if [[ ${_hashItemIndex} = ${itemIndex} ]];then
                    if [[ ${_itemHash} = 0 ]];then
                        _hashFlg=1
                    else
                        sampleHashDataCounts=`echo ${sampleHashData} | sed 's/"//g' | awk -F, '{print NF}'`
                        for ((i=1; i<=${sampleHashDataCounts}; i++));do
                            _hashItemCheckLength=`echo ${sampleHashData} | sed 's/"//g' | awk -F, -v field=${i} '{print $field}' | awk -F"-" '{print $1}'`
                            if [[ ${_itemLength} = ${_hashItemCheckLength} ]];then
                                _hashItemCheckData=`echo ${sampleHashData} | sed 's/"//g' | awk -F, -v field=${i} '{print $field}' | awk -F"-" '{print $2}'`
                                dataTargetItemNumber=${itemIndex}
                                break
                            else
                                _hashItemCheckData=""
                            fi
                        done
                        item=${item}${_hashItemCheckData}
                    fi
                else
                    create_string_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
                if [[ ${_hashItemIndex} = ${itemIndex} ]];then
                    _hashFlg=1
                else
                    create_integer_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                if [[ ${_hashItemIndex} = ${itemIndex} ]];then
                    _hashFlg=1
                else
                    create_float_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
                if [[ ${_hashItemIndex} = ${itemIndex} ]];then
                    _hashFlg=1
                else
                    create_date_item ${_itemType}
                fi
            fi
            
            # ヌル許可対象ではない場合、省略
            if [[ ${_hashFlg} = 1 ]];then
                continue
            else
                if [[ ${itemIndex} = ${_hashItemIndex} ]];then
                    dataNumber=$(( ${dataNumber} + 1))
                    dataRecordLine=$(( ${dataRecordLine} + 1))
                    dataExplanation="ハッシュ化設定"
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/TestData/01/CreateTestData_Explan.txt
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
        _hashItemIndex=$(( ${_hashItemIndex} + 1 ))

        # 全項目のデータ作成後終了
        if [[ ${_hashItemIndex} -gt ${itemsCount} ]];then
            break
        fi
    done 

}

#--------------------------------------------#
#   21. 異常系_項目桁数超過データ作成
#--------------------------------------------#
function create_abnormal_length_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # 項目桁数超過データフラグ
    local _abnormalLengthFlg=""
    # 対象項目番号
    local _abnormalLengthItemIndex=1
    
    # データ作成処理
    while [ true ]; do

        # 項目桁数超過データフラグ
        _abnormalLengthFlg=0
        # 項目変数初期化
        item=""
        _dataRecord=""
        
        # 項目桁数超過データ作成
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
                if [[ ${_abnormalLengthItemIndex} = ${itemIndex} ]];then
                    _itemLength=$(( ${_itemLength} + 1 ))
                    create_string_item ${_itemLength} ${_option}
                    dataTargetItemNumber=${itemIndex}
                else
                    create_string_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
                if [[ ${_abnormalLengthItemIndex} = ${itemIndex} ]];then
                    _itemLength=$(( ${_itemLength} + 1 ))
                    create_integer_item ${_itemLength} ${_option}
                    dataTargetItemNumber=${itemIndex}
                else
                    create_integer_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                if [[ ${_abnormalLengthItemIndex} = ${itemIndex} ]];then
                    _itemLength=$(( ${_fullParts} + 1 )).${_decimalParts}
                    create_float_item ${_itemLength} ${_option}
                    dataTargetItemNumber=${itemIndex}
                else
                    create_float_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
                if [[ ${_abnormalLengthItemIndex} = ${itemIndex} ]];then
                    create_date_item ${_itemType}
                    item=${item}1
                    dataTargetItemNumber=${itemIndex}
                else
                    create_date_item ${_itemType}
                fi
            fi

            # 項目桁数超過データ作成外は省略
            if [[ ${_abnormalLengthFlg} = 1 ]];then
                continue
            else
                if [[ ${itemIndex} = ${_abnormalLengthItemIndex} ]];then
                    dataNumber=$(( ${dataNumber} + 1))
                    dataRecordLine=$(( ${dataRecordLine} + 1))
                    dataExplanation="項目桁数超過データ"
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/TestData/02/CreateTestData_Explan.txt
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

        # 次の項目桁数超過データ作成
        _abnormalLengthItemIndex=$(( ${_abnormalLengthItemIndex} + 1 ))

        # 全項目のデータ作成後終了
        if [[ ${_abnormalLengthItemIndex} -gt ${itemsCount} ]];then
            break
        fi
    done 

}

#--------------------------------------------#
#   22. 異常系_桁数不足データ作成
#--------------------------------------------#
function create_less_data_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    
    # データ作成処理
    while [ true ]; do

        # 項目変数初期化
        if [[ ${checked_data_delimiting} = "" && ${checked_data_enclosing} = "" ]];then
            item=""
            _dataRecord=""
        else
            break
        fi

        # 項目桁数不足データ作成
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
            elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
                create_integer_item ${_itemLength} ${_option}
            elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                create_float_item ${_itemLength} ${_option}
            elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
                create_date_item ${_itemType}
            fi

            # 項目桁数不足データ作成外は省略
            if [[ ${itemIndex} -eq 1 ]];then
                dataNumber=$(( ${dataNumber} + 1))
                dataRecordLine=$(( ${dataRecordLine} + 1))
                dataExplanation="項目桁数不足データ"
                dataTargetItemNumber="-1"
                printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/TestData/02/CreateTestData_Explan.txt
            fi

            # 項目データ、囲み文字、区切り文字、改行コードから一時ファイル(文字コード設定ファイル)作成
            if [[ ${itemsCount} = ${itemIndex} ]];then
                if [[ ${checked_data_outputType} = SQL ]];then
                    checked_data_enclosing=\'
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                else
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                    
                    if [[ ${checked_data_delimiting} = "" && ${checked_data_enclosing} = "" ]];then
                        dataRecordCounts=`echo ${#_dataRecord}`
                        _dataRecord=`echo ${_dataRecord:0:$(( ${dataRecordCounts} - 1 ))}`
                    fi

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

        # 全項目のデータ作成後終了
        break
    done 

}

#--------------------------------------------#
#   23. 異常系_項目数チェックデータ作成
#--------------------------------------------#
function create_item_counts_check_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # 項目数チェックデータフラグ
    local _item_counts_checkFlg=""
    # 対象項目番号
    local _item_counts_checkItemIndex=1
    
    # データ作成処理
    while [ true ]; do

        # 項目数チェックデータフラグ
        _item_counts_checkFlg=0
        # 項目変数初期化
        item=""
        _dataRecord=""

        # 項目数再設定
        if [[ ${_item_counts_checkItemIndex} = 1 ]];then
            motoItemsCount=${itemsCount}
            itemsCount=$(( ${itemsCount} - 1 ))
        else 
            itemsCount=$(( ${itemsCount} + 1 ))
        fi

        # 項目数チェックデータ作成
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
            elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
                create_integer_item ${_itemLength} ${_option}
            elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                create_float_item ${_itemLength} ${_option}
            elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
                create_date_item ${_itemType}
            fi

            # 項目数チェックデータ作成外は省略
            if [[ ${_item_counts_checkFlg} = 1 ]];then
                continue
            else
                if [[ ${itemIndex} = ${_item_counts_checkItemIndex} ]];then
                    dataNumber=$(( ${dataNumber} + 1))
                    dataRecordLine=$(( ${dataRecordLine} + 1))
                    if [[ ${motoItemsCount} -eq ${itemsCount} ]];then
                        dataTargetItemNumber=$((${itemsCount} + 1))
                        dataExplanation="項目数超過($((${itemsCount} + 1)))"
                    else
                        dataTargetItemNumber=${itemsCount}
                        dataExplanation="項目数不足(${itemsCount})"
                    fi
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/TestData/02/CreateTestData_Explan.txt
                fi
            fi

            # 項目データ、囲み文字、区切り文字、改行コードから一時ファイル(文字コード設定ファイル)作成
            if [[ ${itemsCount} = ${itemIndex} ]];then
                if [[ ${checked_data_outputType} = SQL ]];then
                    checked_data_enclosing=\'
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                else
                    if [[ ${motoItemsCount} -eq ${itemsCount} ]];then
                        _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}${checked_data_enclosing}"EXTRADATA"${checked_data_enclosing}
                    else
                        _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}

                    fi
                    
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

        # 全項目のデータ作成後終了
        _item_counts_checkItemIndex=$(( ${_item_counts_checkItemIndex} + 1 ))
        if [[ ${_item_counts_checkItemIndex} -gt 2 ]];then
            break
        fi
    done 

}

#--------------------------------------------#
#   24. 異常系_数値項目に文字列データ作成
#--------------------------------------------#
function create_number_item_in_string_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # データ作成オプション
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # 項目数チェックデータフラグ
    local _number_item_in_string_checkFlg=""
    # 対象項目番号
    local _number_item_in_string_checkItemIndex=1
    
    # データ作成処理
    while [ true ]; do

        # 項目数チェックデータフラグ
        _number_item_in_string_checkFlg=0
        # 項目変数初期化
        item=""
        _dataRecord=""

        # 項目数チェックデータ作成
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
                if [[ ${itemIndex} = ${_number_item_in_string_checkItemIndex} ]];then
                    _number_item_in_string_checkFlg=1
                else
                    create_string_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [bB][yY][tT][eE] || ${_itemType} = [sS][hH][oO][rR][tT] || ${_itemType} = [iI][nN][tT] || ${_itemType} = [lL][oO][nN][gG] ]];then
                if [[ ${itemIndex} = ${_number_item_in_string_checkItemIndex} ]];then
                    create_string_item ${_itemLength} ${_option}
                    dataTargetItemNumber=${itemIndex}
                else
                    create_integer_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} = [fF][lL][oO][aA][tT] || ${_itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                if [[ ${itemIndex} = ${_number_item_in_string_checkItemIndex} ]];then
                    create_string_item ${_fullParts} ${_option}
                    dataTargetItemNumber=${itemIndex}
                else
                    create_float_item ${_itemLength} ${_option}
                fi
            elif [[ ${_itemType} =~ [dD][aA][tT][eE] ]];then
                if [[ ${itemIndex} = ${_number_item_in_string_checkItemIndex} ]];then
                    create_string_item ${_itemLength} ${_option}
                    dataTargetItemNumber=${itemIndex}
                else
                    create_date_item ${_itemType}
                fi
            fi

            # 項目数チェックデータ作成外は省略
            if [[ ${_number_item_in_string_checkFlg} = 1 ]];then
                continue
            else
                if [[ ${itemIndex} = ${_number_item_in_string_checkItemIndex} ]];then
                    dataNumber=$(( ${dataNumber} + 1))
                    dataRecordLine=$(( ${dataRecordLine} + 1))
                    dataExplanation="数値項目に文字列"
                    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "${dataNumber}" "#" "${dataRecordLine}" "#" "${dataTargetItemNumber}" "#" "${dataExplanation}" >> ${filePath%/}/TestData/02/CreateTestData_Explan.txt
                fi
            fi

            # 項目データ、囲み文字、区切り文字、改行コードから一時ファイル(文字コード設定ファイル)作成
            if [[ ${itemsCount} = ${itemIndex} ]];then
                if [[ ${checked_data_outputType} = SQL ]];then
                    checked_data_enclosing=\'
                    _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                else
                    if [[ ${motoItemsCount} -eq ${itemsCount} ]];then
                        _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}${checked_data_enclosing}"EXTRADATA"${checked_data_enclosing}
                    else
                        _dataRecord=${_dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}

                    fi
                    
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

        # 全項目のデータ作成後終了
        _number_item_in_string_checkItemIndex=$(( ${_number_item_in_string_checkItemIndex} + 1 ))
        if [[ ${_number_item_in_string_checkItemIndex} -gt ${itemsCount} ]];then
            break
        fi
    done 

}

#--------------------------------------------#
#   90. データ作成(正常系・異常系)
#--------------------------------------------#
function create_data() {

    ### SetFile / 설정파일 / 設定ファイル
    setFilePath=${filePath%/}/CreateTestData.txt

    ### Normal System Data / 정상계 데이터 / 正常系データ
    mkdir -p ${filePath%/}/TestData/01/
    ### Abnormal System Data / 이상계 데이터 / 異常系データ
    mkdir -p ${filePath%/}/TestData/02/

    check_data_encoding ${setFilePath}
    check_data_newLine ${setFilePath}
    check_data_enclosing ${setFilePath}
    check_data_delimiting ${setFilePath}
    check_data_outputType ${setFilePath}
    check_data_outputName ${setFilePath}
    check_data_multiByteCharacter ${setFilePath} jp

    export `cat ${setFilePath} | grep data_escapeCode_list`
    export `cat ${setFilePath} | grep data_record_newLine_list`
    export `cat ${setFilePath} | grep list_itemsTrim`
    export `cat ${setFilePath} | grep list_itemsType`
    export `cat ${setFilePath} | grep list_itemsName`
    export `cat ${setFilePath} | grep list_itemsLength`
    export `cat ${setFilePath} | grep list_itemsNotNull`
    export `cat ${setFilePath} | grep list_itemsEncrypt`
    export `cat ${setFilePath} | grep list_itemsHash`
    export `cat ${setFilePath} | grep sampleHashData`

    ### ItemCounts / 항목수 / 項目数
    itemsCount=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, '{print NF}'`

    ### 正常系
    ### ExplanFile / 설명파일 / 説明ファイル
    dataNumber=""
    dataRecordLine=""
    dataTargetItemNumber=""
    dataExplanation=""
    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "No" "#" "LINE" "#" "ITEM" "#" "PATTERN"> ${filePath%/}/TestData/01/CreateTestData_Explan.txt
    printf "%s\n" "######################################################################" >> ${filePath%/}/TestData/01/CreateTestData_Explan.txt

    ### Normal data
      create_normal_record ${filePath%/}/TestData/01/tmp_${checked_data_outputName} ${checked_data_multiByteCharacter}
    ### Trim data
      create_trim_record ${filePath%/}/TestData/01/tmp_${checked_data_outputName} trim
    ### Limit Number data
      create_number_limit_record ${filePath%/}/TestData/01/tmp_${checked_data_outputName} number_limit
    ### Not Null data
      create_not_null_record ${filePath%/}/TestData/01/tmp_${checked_data_outputName} not_null
    ### New Line data
      create_new_line_record ${filePath%/}/TestData/01/tmp_${checked_data_outputName} new_line
    ### Escape data
      create_escape_record ${filePath%/}/TestData/01/tmp_${checked_data_outputName} escape
    ### Item Encrypt data
      create_item_encrypt_record ${filePath%/}/TestData/01/tmp_${checked_data_outputName} item_encrypt
    ### Item Hash data
      create_item_hash_record ${filePath%/}/TestData/01/tmp_${checked_data_outputName} item_hash

    ### encoding change
    if [[ -e ${filePath%/}/TestData/01/tmp_${checked_data_outputName} ]];then
        if [[ ${checked_data_encoding} = UTF-8 ]];then
            nkf -w ${filePath%/}/TestData/01/tmp_${checked_data_outputName} > ${filePath%/}/TestData/01/${checked_data_outputName}
        elif [[ ${checked_data_encoding} = EUC ]];then
            nkf -e ${filePath%/}/TestData/01/tmp_${checked_data_outputName} > ${filePath%/}/TestData/01/${checked_data_outputName}
        elif [[ ${checked_data_encoding} = JIS ]];then
            nkf -j ${filePath%/}/TestData/01/tmp_${checked_data_outputName} > ${filePath%/}/TestData/01/${checked_data_outputName}
        elif [[ ${checked_data_encoding} = SJIS ]];then
            nkf -s ${filePath%/}/TestData/01/tmp_${checked_data_outputName} > ${filePath%/}/TestData/01/${checked_data_outputName}
        elif [[ ${checked_data_encoding} = "UTF-8(BOM)" ]];then
            nkf --oc=UTF-8-BOM ${filePath%/}/TestData/01/tmp_${checked_data_outputName} > ${filePath%/}/TestData/01/${checked_data_outputName}
        fi
        rm -rfv ${filePath%/}/TestData/01/tmp_${checked_data_outputName}
    fi

    ### compressed file format
    if [[ ${checked_data_outputType} = .gz ]];then
        gzip ${filePath%/}/TestData/01/${checked_data_outputName}
    elif [[ ${checked_data_outputType} = .Z ]];then
        compress ${filePath%/}/TestData/01/${checked_data_outputName}
    fi

    ### 異常系
    ### ExplanFile / 설명파일 / 説明ファイル
    dataNumber=""
    dataRecordLine=""
    dataTargetItemNumber=""
    dataExplanation=""
    printf "%-3s%-10s%-3s%-10s%-3s%-10s%-3s%-30s\n" "#" "No" "#" "LINE" "#" "ITEM" "#" "PATTERN"> ${filePath%/}/TestData/02/CreateTestData_Explan.txt
    printf "%s\n" "######################################################################" >> ${filePath%/}/TestData/02/CreateTestData_Explan.txt

    ### Abnormal length data
      create_abnormal_length_record ${filePath%/}/TestData/02/tmp_${checked_data_outputName} abnormal_length
    ### Less data(data_enclosing=0, data_delimiting=0 のみ)
      create_less_data_record ${filePath%/}/TestData/02/tmp_${checked_data_outputName} less_data
    ### Item counts check data(data_enclosing=0, data_delimiting=0 のみ)
      create_item_counts_check_record ${filePath%/}/TestData/02/tmp_${checked_data_outputName} item_counts_check
    ### Number item in string data
      create_number_item_in_string_record ${filePath%/}/TestData/02/tmp_${checked_data_outputName} item_counts_check

    ### encoding change
    if [[ -e ${filePath%/}/TestData/02/tmp_${checked_data_outputName} ]];then
        if [[ ${checked_data_encoding} = UTF-8 ]];then
            nkf -w ${filePath%/}/TestData/02/tmp_${checked_data_outputName} > ${filePath%/}/TestData/02/${checked_data_outputName}
        elif [[ ${checked_data_encoding} = EUC ]];then
            nkf -e ${filePath%/}/TestData/02/tmp_${checked_data_outputName} > ${filePath%/}/TestData/02/${checked_data_outputName}
        elif [[ ${checked_data_encoding} = JIS ]];then
            nkf -j ${filePath%/}/TestData/02/tmp_${checked_data_outputName} > ${filePath%/}/TestData/02/${checked_data_outputName}
        elif [[ ${checked_data_encoding} = SJIS ]];then
            nkf -s ${filePath%/}/TestData/02/tmp_${checked_data_outputName} > ${filePath%/}/TestData/02/${checked_data_outputName}
        elif [[ ${checked_data_encoding} = "UTF-8(BOM)" ]];then
            nkf --oc=UTF-8-BOM ${filePath%/}/TestData/02/tmp_${checked_data_outputName} > ${filePath%/}/TestData/02/${checked_data_outputName}
        fi
        rm -rfv ${filePath%/}/TestData/02/tmp_${checked_data_outputName}
    fi

    ### compressed file format
    if [[ ${checked_data_outputType} = .gz ]];then
        gzip ${filePath%/}/TestData/02/${checked_data_outputName}
    elif [[ ${checked_data_outputType} = .Z ]];then
        compress ${filePath%/}/TestData/02/${checked_data_outputName}
    fi
}

#--------------------------------------------#
# Main Menu
#  : Main Menu Print
#  : 메인 메뉴 출력
#  : メインメニュー出力
#--------------------------------------------#
function func_mainMenu() {

    ### Language Parameter / 언어 파라미터 / 言語パラメータ
    local languageParam=$1

    ### Function Main Logic / 함수 메인 로직 / 関数メインロジック
    while true
    do
        if [[ ${languageParam} == [kK][rR] ]];then
            echo
            printf "  ****************************************\n"
            printf "  *    %s\n"                                  "메뉴"
            printf "  ****************************************\n"
            printf "  * %s\n"                                     "1. 언어 선택"
            printf "  * %s\n"                                     "2. 설정파일 샘플 작성"
            printf "  * %s\n"                                     "3. 입력 데이터 작성"
            printf "  * %s\n"                                     "4. 출력 데이터 작성"
            printf "  * %s\n"                                     "5. 입출력 데이터 비교"
            printf "  *\n"
            printf "  * %s\n"                                     "9. 종료"
            printf "  ****************************************\n"
            echo 
            read -p " 메뉴 선택 : " selectMenu
            echo
        elif [[ ${languageParam} == [jJ][pP] ]]; then
            echo
            printf "  ****************************************\n"
            printf "  *    %s\n"                                  "メニュー"
            printf "  ****************************************\n"
            printf "  * %s\n"                                     "1. 言語選択"
            printf "  * %s\n"                                     "2. 設定ファイルサンプル作成"
            printf "  * %s\n"                                     "3. 入力データ作成"
            printf "  * %s\n"                                     "4. 出力データ作成"
            printf "  * %s\n"                                     "5. 入出力データ比較"
            printf "  *\n"
            printf "  * %s\n"                                     "9. 終了"
            printf "  ****************************************\n"
            echo 
            read -p " メニュー選択 : " selectMenu
            echo
        else
            echo
            printf "  ****************************************\n"
            printf "  *    %s\n"                                  "MENU"
            printf "  ****************************************\n"
            printf "  * %s\n"                                     "1. Select Language"
            printf "  * %s\n"                                     "2. Sample Configuration Files"
            printf "  * %s\n"                                     "3. Input Data Creation"
            printf "  * %s\n"                                     "4. Output Data Creation"
            printf "  * %s\n"                                     "5. Input-Output Data Comparison"
            printf "  *\n"
            printf "  * %s\n"                                     "9. End"
            printf "  ****************************************\n"
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
        elif [[ ${selectMenu} == 4 ]]; then
            break
        elif [[ ${selectMenu} == 5 ]]; then
            break
        elif [[ ${selectMenu} == 9 ]]; then
            break
        else
            clear
            if [[ ${languageParam} == [kK][rR] ]]; then
                echo
                printf "%s\n" "### 선택 가능한 메뉴(번호) : 1, 2, 3, 4, 5, 9 ###"
            elif [[ ${languageParam} == [jJ][pP] ]]; then
                echo
                printf "%s\n" "### 選択可能なメニュー(番号) : 1, 2, 3, 4, 5, 9 ###"
            else
                echo
                printf "%s\n" "### Selectable menu (number): 1, 2, 3, 4, 5, 9 ###"
            fi
        fi
    done

}

#--------------------------------------------#
# Select Language
#  : Output Language Select
#  : 출력 언어 선택
#  : 出力言語出力
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
        elif [[ ${selectLanguage} == 9 ]]; then
            clear
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
    done

}

#--------------------------------------------#
# Data Setting File Create
#  : Setting File Create
#  : 설정 파일 작성
#  : 設定ファイル作成
#--------------------------------------------#
function func_dataSettingFile() {

    echo '### テストデータ作成設定一覧' > ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 文字コード' >> ${filePath%/}/CreateTestData.txt
    echo 'data_encoding=0' >> ${filePath%/}/CreateTestData.txt
    echo '### 0 : UTF-8' >> ${filePath%/}/CreateTestData.txt
    echo '### 1 : EUC' >> ${filePath%/}/CreateTestData.txt
    echo '### 2 : JIS' >> ${filePath%/}/CreateTestData.txt
    echo '### 3 : SJIS' >> ${filePath%/}/CreateTestData.txt
    echo '### 4 : UTF-8(BOM)' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 改行コード' >> ${filePath%/}/CreateTestData.txt
    echo 'data_newLine=0' >> ${filePath%/}/CreateTestData.txt
    echo '### 0 : CRLF' >> ${filePath%/}/CreateTestData.txt
    echo '### 1 : CR' >> ${filePath%/}/CreateTestData.txt
    echo '### 2 : LF' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 囲み文字' >> ${filePath%/}/CreateTestData.txt
    echo 'data_enclosing=1' >> ${filePath%/}/CreateTestData.txt
    echo '### 0 : ' >> ${filePath%/}/CreateTestData.txt
    echo '### 1 : "' >> ${filePath%/}/CreateTestData.txt
    echo "### 2 : '" >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 区切り文字' >> ${filePath%/}/CreateTestData.txt
    echo 'data_delimiting=1' >> ${filePath%/}/CreateTestData.txt
    echo '### 0 : ' >> ${filePath%/}/CreateTestData.txt
    echo '### 1 : ,' >> ${filePath%/}/CreateTestData.txt
    echo '### 2 : \\t' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### マルチバイトチェックフラグ' >> ${filePath%/}/CreateTestData.txt
    echo 'data_multiByteCharacter=1' >> ${filePath%/}/CreateTestData.txt
    echo '### 0 : Not multiByteCharacter' >> ${filePath%/}/CreateTestData.txt
    echo '### 1 : multiByteCharacter' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 出力タイプ' >> ${filePath%/}/CreateTestData.txt
    echo 'data_outputType=0' >> ${filePath%/}/CreateTestData.txt
    echo '### 0 : FILE' >> ${filePath%/}/CreateTestData.txt
    echo '### 1 : SQL' >> ${filePath%/}/CreateTestData.txt
    echo '### 2 : .gz' >> ${filePath%/}/CreateTestData.txt
    echo '### 3 : .Z' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 改行コード' >> ${filePath%/}/CreateTestData.txt
    echo 'data_record_newLine_list="CRLF","CR","LF"' >> ${filePath%/}/CreateTestData.txt
    echo '### CRLF : \\r\\n' >> ${filePath%/}/CreateTestData.txt
    echo '### CR : \\r' >> ${filePath%/}/CreateTestData.txt
    echo '### LF : \\n' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### エスケープ文字' >> ${filePath%/}/CreateTestData.txt
    echo 'data_escapeCode_list="0","1","2"' >> ${filePath%/}/CreateTestData.txt
    echo "### 0 : \"" >> ${filePath%/}/CreateTestData.txt
    echo "### 1 : '" >> ${filePath%/}/CreateTestData.txt
    echo '### 2 : \(¥)' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 出力タイプ名' >> ${filePath%/}/CreateTestData.txt
    echo 'data_outputName=createfile_YYYYMMDD.txt' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### SQLタイプ出力の場合、スキーマ名' >> ${filePath%/}/CreateTestData.txt
    echo 'data_schema=TEST_SCHEMA' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 項目別トリム情報リスト' >> ${filePath%/}/CreateTestData.txt
    echo 'list_itemsTrim="ftbkFTBK,"ftbkFTBK","ftbkFTBK","ftbkFTBK","ftbkFTBK","ftbkFTBK","ftbkFTBK","ftbkFTBK",""' >> ${filePath%/}/CreateTestData.txt
    echo '### ft       : (Front_HalfSpace)' >> ${filePath%/}/CreateTestData.txt
    echo '### bk       : (Back_HalfSpace)' >> ${filePath%/}/CreateTestData.txt
    echo '### FT       : (Front_FullSpace)' >> ${filePath%/}/CreateTestData.txt
    echo '### BK       : (Back_FullSpace)' >> ${filePath%/}/CreateTestData.txt
    echo '### ftbk     : (ALL_HalfSpace)' >> ${filePath%/}/CreateTestData.txt
    echo '### ftbkFT   : (ALL_HalfSpace_Front_FullSpace)' >> ${filePath%/}/CreateTestData.txt
    echo '### ftbkBK   : (ALL_HalfSpace_Back_FullSpace)' >> ${filePath%/}/CreateTestData.txt
    echo '### ftbkFTBK : (ALL_FullSpace)' >> ${filePath%/}/CreateTestData.txt
    echo '### Type date is only ""(NotTrim)' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 項目別タイプ情報リスト' >> ${filePath%/}/CreateTestData.txt
    echo 'list_itemsType="char","string","byte","short","int","long","float","double","date:YYYYMMDD"' >> ${filePath%/}/CreateTestData.txt
    echo '### char          : (1byte string)' >> ${filePath%/}/CreateTestData.txt
    echo '### string        : (nbyte string)' >> ${filePath%/}/CreateTestData.txt
    echo '### byte          : (-128 ~ 127)' >> ${filePath%/}/CreateTestData.txt
    echo '### short         : (-32,768 ~ 32,767)' >> ${filePath%/}/CreateTestData.txt
    echo '### int           : (-2,147,483,648 ~ 2,147,483,647)' >> ${filePath%/}/CreateTestData.txt
    echo '### long          : (-9,223,372,036,854,775,808 ~ 9,223,372,036,854,775,807)' >> ${filePath%/}/CreateTestData.txt
    echo '### float         : (3.4 X 10-38) ~ (3.4 X 1038)' >> ${filePath%/}/CreateTestData.txt
    echo '### double        : (1.7 X 10-308) ~ (1.7 X 10308)' >> ${filePath%/}/CreateTestData.txt
    echo '### date:YYYYMMDD : (date:format / [format_ex] YYYYMMDD, YYYYMMDDhhmmss)' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 項目別桁数情報リスト' >> ${filePath%/}/CreateTestData.txt
    echo 'list_itemsLength="1","6","5","3","4","9","7.3","7.3","8"' >> ${filePath%/}/CreateTestData.txt
    echo '### char          : only 1' >> ${filePath%/}/CreateTestData.txt
    echo '### string        : n' >> ${filePath%/}/CreateTestData.txt
    echo '### byte          : max 3' >> ${filePath%/}/CreateTestData.txt
    echo '### short         : max 5' >> ${filePath%/}/CreateTestData.txt
    echo '### int           : max 10' >> ${filePath%/}/CreateTestData.txt
    echo '### long          : max 19' >> ${filePath%/}/CreateTestData.txt
    echo '### float         : max 38' >> ${filePath%/}/CreateTestData.txt
    echo '### double        : max 308' >> ${filePath%/}/CreateTestData.txt
    echo '### date:YYYYMMDD : max 14' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 項目別ヌル情報リスト' >> ${filePath%/}/CreateTestData.txt
    echo 'list_itemsNotNull="1","1","1","1","1","1","1","1","1"' >> ${filePath%/}/CreateTestData.txt
    echo '### 0 : Not Null ' >> ${filePath%/}/CreateTestData.txt
    echo '### 1 : Null Allow' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 項目暗号化情報リスト' >> ${filePath%/}/CreateTestData.txt
    echo 'list_itemsEncrypt="1","1","1","1","1","1","1","1","1"' >> ${filePath%/}/CreateTestData.txt
    echo '### 0          : 項目暗号化なし' >> ${filePath%/}/CreateTestData.txt
    echo '### 1          : 暗号化方式1' >> ${filePath%/}/CreateTestData.txt
    echo '### 2          : 暗号化方式2(暗号化方式が多数ある場合)' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 項目ハッシュ情報リスト' >> ${filePath%/}/CreateTestData.txt
    echo 'list_itemsHash="1","1","0","0","0","0","0","0","0"' >> ${filePath%/}/CreateTestData.txt
    echo '### 0          : ハッシュ化なし' >> ${filePath%/}/CreateTestData.txt
    echo '### 1          : ハッシュ' >> ${filePath%/}/CreateTestData.txt
    echo 'sampleHashData="1-9-X","6-123456-f9d8s7"' >> ${filePath%/}/CreateTestData.txt
    echo '### データ区分(-)' >> ${filePath%/}/CreateTestData.txt
    echo '### 1番：桁数' >> ${filePath%/}/CreateTestData.txt
    echo '### 2番：入力値' >> ${filePath%/}/CreateTestData.txt
    echo '### 3番：ハッシュ化値' >> ${filePath%/}/CreateTestData.txt
    echo '' >> ${filePath%/}/CreateTestData.txt
    echo '### 項目別名情報リスト' >> ${filePath%/}/CreateTestData.txt
    echo 'list_itemsName="test1","test2","test3","test4","test5","test6","test7","test8","test9"' >> ${filePath%/}/CreateTestData.txt
}

#--------------------------------------------#
# Script End
#  : Shell Script Close
#  : 쉘 스크립트 종료
#  : シェルスクリプト終了
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

ouputLanguage=$1
if [[ ${ouputLanguage} = "" ]];then
    ouputLanguage="jp"
fi

### ShellScript relativePath / 쉘 스크립트 풀패스 / シェルスクリプトフルパス
fileRelativePath=$0
### relativePath -> AbsolutePath / 상대경로 -> 절대경로 / 相対パス -> 絶対パス
fileAbsolutePath=$(realpath "$fileRelativePath")
### ShellScript Name / 쉘 스크립트 이름 / シェルスクリプト名
scriptName=$(basename $0)
### FilePath / 파일 패스 / ファイルパス
filePath=${fileAbsolutePath%/*}/

while true
do
    clear
    func_mainMenu ${ouputLanguage}

    if [[ ${selectMenu} = 1 ]];then
        clear
        func_selectLanguage ${ouputLanguage}
    elif [[ ${selectMenu} = 2 ]];then
        if [[ -f ${filePath%/}/CreateTestData.txt ]];then
            if [[ ${ouputLanguage} = [kK][rR] ]];then
                echo "기존 설정 파일 있음"
            elif [[ ${ouputLanguage} = [jJ][pP] ]];then
                echo "既存の構成ファイルが有り"
            else
                echo "Existing configuration file exists"
            fi
        else 
            func_dataSettingFile
            if [[ ${ouputLanguage} = [kK][rR] ]];then
                echo "설정 파일 작성완료!"
                echo `ls -l ${filePath%/}/CreateTestData.txt`
            elif [[ ${ouputLanguage} = [jJ][pP] ]];then
                echo "設定ファイルの作成完了!"
                echo `ls -l ${filePath%/}/CreateTestData.txt`
            else
                echo "Configuration file creation complete!"
                echo `ls -l ${filePath%/}/CreateTestData.txt`
            fi
        fi
        sleep 2
    elif [[ ${selectMenu} = 3 ]];then
        create_data
    elif [[ ${selectMenu} = 4 ]];then
        echo
    elif [[ ${selectMenu} = 5 ]];then
        echo
    elif [[ ${selectMenu} = 9 ]];then
        func_scriptEnd ${ouputLanguage}
    fi

done