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
    local _data_fileCounts=`echo ${data_outputName} | grep -o "?" | wc -l`
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

    # データ作成処理
    for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
        # 設定ファイルから取得する項目タイプ情報
        itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
        # 設定ファイルから取得する項目桁数情報
        itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
        # 項目変数初期化
        item=""

        # マルチバイトチェック処理、対象：文字列タイプのみ
        # 文字コードが「UTF-8の場合、マルチバイト文字は3バイト
        # 文字コードが「「JIS」,「SJIS」,「EUC」の場合、マルチバイト文字は2バイト
        # その他の文字コードの場合、マルチバイト文字は1バイト
        if [[ ${checked_data_multiByteCharacter} = "" ]];then
            item=${item}
        else 
            if [[ ${itemType} = [sS][tT][rR][iI][nN][gG] && ${itemLength} -gt 3 && ${checked_data_encoding} =~ UTF-8 ]];then
                item=${item}${checked_data_multiByteCharacter}
                itemLength=$(( ${itemLength} - 3 ))
            elif [[ ${itemType} = [sS][tT][rR][iI][nN][gG] && ${itemLength} -gt 2 && ${checked_data_encoding} =~ JIS || ${checked_data_encoding} =~ EUC ]];then
                item=${item}${checked_data_multiByteCharacter}
                itemLength=$(( ${itemLength} - 2 ))
            elif [[ ${itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                item=${item}${checked_data_multiByteCharacter}
                itemLength=$(( ${itemLength} - 1 ))
            fi
        fi

        # 項目タイプ別テストデータ作成
        if [[ ${itemType} = [cC][hH][aA][rR] || ${itemType} = [sS][tT][rR][iI][nN][gG] ]];then
            create_string_item ${itemLength} ${_option}
        elif [[ ${itemType} = [bB][yY][tT][eE] || ${itemType} = [sS][hH][oO][rR][tT] || ${itemType} = [iI][nN][tT] || ${itemType} = [lL][oO][nN][gG] ]];then
            create_integer_item ${itemLength} ${_option}
        elif [[ ${itemType} = [fF][lL][oO][aA][tT] || ${itemType} = [dD][oO][uU][bB][lL][eE] ]];then
            create_float_item ${itemLength} ${_option}
        elif [[ ${itemType} =~ [dD][aA][tT][eE] ]];then
            create_date_item ${itemType}
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

function create_trim_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # 設定ファイルパス
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
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
        itemTrim=`echo ${list_itemsTrim} | sed 's/"//g' | awk -F, -v field=${_trimItemIndex} '{print $field}'`
        # 項目トリム情報文字列数
        itemTrimCount=$(( `echo "${itemTrim}" | wc -c` - 1 ))
        itemTrimCount=$(( ${itemTrimCount} / 2 ))
        # 項目トリム情報
        targetItemTrim=`echo "${itemTrim}" | cut -b ${_cutfront}-${_cutback}`
        # トリムデータフラグ
        trimFlg=0
        # 項目変数初期化
        item=""

        # 項目トリム情報に　「ft」が存在場合、項目の先頭に半角スペース（1バイト）追加 
        # 項目トリム情報に　「bk」が存在場合、項目の後列に半角スペース（1バイト）追加 
        # 項目トリム情報に　「FT」が存在場合、項目の先頭に全角スペース（2バイト）追加 
        # 項目トリム情報に　「BK」が存在場合、項目の後列に全角スペース（2バイト）追加 
        for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
            # 設定ファイルから取得する項目タイプ情報
            itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する項目桁数情報
            itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            # 設定ファイルから取得する
            fullParts=`echo ${itemLength} | awk -F. '{print $1}'`
            decimalParts=`echo ${itemLength} | awk -F. '{print $2}'`
            integerParts=$(( ${fullParts} - ${decimalParts} - 1 ))

            if [[ ${itemIndex} = ${_trimItemIndex} ]];then
                if [[ ${targetItemTrim} = ft ]];then
                    if [[ ${itemType} = [fF][lL][oO][aA][tT] || ${itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                        if [[ ${integerParts} -gt 1 ]];then
                            itemLength=${fullParts}
                        else
                            item=""
                            trimFlg=1
                            continue
                        fi
                    fi

                    if [[ ${itemLength} -gt 1 ]];then
                        create_trim_data ${targetItemTrim} HS
                        itemLength=$(( ${itemLength} - 1))
                    else
                        trimFlg=1
                    fi
                elif [[ ${targetItemTrim} = FT ]];then
                    if [[ ${itemType} = [fF][lL][oO][aA][tT] || ${itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                        if [[ ${integerParts} -gt 2 ]];then
                            itemLength=${fullParts}
                        else
                            item=""
                            trimFlg=1
                            continue
                        fi
                    fi

                    if [[ ${itemLength} -gt 2 ]];then
                        create_trim_data ${targetItemTrim} FS
                        itemLength=$(( ${itemLength} - 2))
                    else
                        trimFlg=1
                    fi
                elif [[ ${targetItemTrim} = bk ]];then
                    if [[ ${itemType} = [fF][lL][oO][aA][tT] || ${itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                        if [[ ${decimalParts} -gt 1 ]];then
                            itemLength=${fullParts}
                            decimalParts=$(( ${decimalParts} - 1 ))
                        else
                            item=""
                            trimFlg=1
                            continue
                        fi
                    fi

                    if [[ ${itemLength} -gt 1 ]];then
                        itemLength=$(( ${itemLength} - 1 ))
                    else
                        trimFlg=1
                    fi
                elif [[ ${targetItemTrim} = BK ]];then
                    if [[ ${itemType} = [fF][lL][oO][aA][tT] || ${itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                        if [[ ${decimalParts} -gt 2 ]];then
                            itemLength=${fullParts}
                            decimalParts=$(( ${decimalParts} - 2 ))
                        else
                            item=""
                            trimFlg=1
                            continue
                        fi
                    fi

                    if [[ ${itemLength} -gt 2 ]];then
                        itemLength=$(( ${itemLength} - 2 ))
                    else
                        trimFlg=1
                    fi
                elif [[ ${targetItemTrim} = "" ]];then
                    trimFlg=1
                fi  
            fi

            if [[ ${trimFlg} = 1 ]];then
                continue
            fi

            if [[ ${itemType} = [cC][hH][aA][rR] || ${itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                create_string_item ${itemLength} ${_option}
            elif [[ ${itemType} = [bB][yY][tT][eE] || ${itemType} = [sS][hH][oO][rR][tT] || ${itemType} = [iI][nN][tT] || ${itemType} = [lL][oO][nN][gG] ]];then
                create_integer_item ${itemLength} ${_option}
            elif [[ ${itemType} = [fF][lL][oO][aA][tT] || ${itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                itemLength=${itemLength}.${decimalParts}
                create_float_item ${itemLength} ${_option}
            elif [[ ${itemType} =~ [dD][aA][tT][eE] ]];then
                create_date_item ${itemType}
            fi
            
            if [[ ${itemIndex} = ${_trimItemIndex} ]];then
                if [[ ${targetItemTrim} = bk ]];then
                    create_trim_data ${targetItemTrim} HS
                elif [[ ${targetItemTrim} = BK ]];then
                    create_trim_data ${targetItemTrim} FS
                fi
            fi

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
            item=""
        done

        # SQLの場合、クエリー形式に修正
        if [[ ${checked_data_outputType} = SQL ]];then
            list_itemsName=`echo ${list_itemsName} | sed 's/"//g'`
            echo "INSERT INTO "${data_schema}.${data_outputName}" (${list_itemsName}) VALUES (${_dataRecord})" > ${_createFile}.sql
        fi

        if [[ 0 -eq ${itemTrimCount} ]];then
            _trimItemIndex=$(( ${_trimItemIndex} + 1 ))
        elif [[ ${_tmpCount} -eq ${itemTrimCount} ]];then
            _trimItemIndex=$(( ${_trimItemIndex} + 1 ))
            _tmpCount=1
            _cutfront=1
            _cutback=2
        else
            _tmpCount=$(( ${_tmpCount} + 1 ))
            _cutfront=$(( ${_cutfront} + 2 ))
            _cutback=$(( ${_cutback} + 2 ))
        fi
        if [[ ${_trimItemIndex} -gt ${itemsCount} ]];then
            break
        fi
    done 

}

function create_number_limit_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # 設定ファイルパス
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    # リミットチェック数
    local _number_limit=1
    # 対象項目番号
    local _limitItemIndex=1
    
    # データ作成処理
    while [ true ]; do
        targetItemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${_limitItemIndex} '{print $field}'`
        limitFlg=0
        item=""

        for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
            itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            itemName=`echo ${list_itemsName} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            fullParts=`echo ${itemLength} | awk -F. '{print $1}'`
            decimalParts=`echo ${itemLength} | awk -F. '{print $2}'`
            integerParts=$(( ${fullParts} - ${decimalParts} - 1 ))

            if [[ ${itemType} = [cC][hH][aA][rR] || ${itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                create_string_item ${itemLength} ${_option}
                if [[ ${_limitItemIndex} = ${itemIndex} ]];then
                    limitFlg=1
                fi
            elif [[ ${itemType} = [bB][yY][tT][eE] || ${itemType} = [sS][hH][oO][rR][tT] || ${itemType} = [iI][nN][tT] || ${itemType} = [lL][oO][nN][gG] ]];then
                if [[ ${_limitItemIndex} = ${itemIndex} ]];then
                    for ((i=1; i<=${itemLength}; i++)); do
                        if [[ ${_number_limit} = 1 ]];then
                            _randomint=9
                        else
                            _randomint=0
                        fi
                        item=${item}${_randomint}
                    done
                else
                    create_integer_item ${itemLength} ${_option}
                fi
            elif [[ ${itemType} = [fF][lL][oO][aA][tT] || ${itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                if [[ ${_limitItemIndex} = ${itemIndex} ]];then
                    for ((i=1; i<=${integerParts}; i++)); do
                        if [[ ${_number_limit} = 1 ]];then
                            _randomint=9
                        else
                            _randomint=0
                        fi
                        item=${item}${_randomint}
                    done
                    item=${item}.
                    for ((i=1; i<=${decimalParts}; i++)); do
                        if [[ ${_number_limit} = 1 ]];then
                            _randomint=9
                        else
                            _randomint=0
                        fi
                        item=${item}${_randomint}
                    done
                else
                    create_float_item ${itemLength} ${_option}
                fi
            elif [[ ${itemType} =~ [dD][aA][tT][eE] ]];then
                if [[ ${_limitItemIndex} = ${itemIndex} ]];then
                    limitFlg=1
                else
                    create_date_item ${itemType}
                fi
            fi
            
            if [[ ${limitFlg} = 1 ]];then
                continue
            fi
            echo "itemsCount=${itemsCount}, itemIndex=${itemIndex}"
            echo "_limitItemIndex=${_limitItemIndex}"
            echo
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
            echo "_dataRecord=${_dataRecord}"

            item=""
        done

        # SQLの場合、クエリー形式に修正
        if [[ ${checked_data_outputType} = SQL ]];then
            list_itemsName=`echo ${list_itemsName} | sed 's/"//g'`
            echo "INSERT INTO "${data_schema}.${data_outputName}" (${list_itemsName}) VALUES (${_dataRecord})" > ${_createFile}.sql
        fi

        if [[ ${_number_limit} = 2 ]];then
            _limitItemIndex=$(( ${_limitItemIndex} + 1 ))
            _number_limit=1
        else
            _number_limit=2
        fi

        if [[ ${_limitItemIndex} -gt ${itemsCount} ]];then
            break
        fi
        _dataRecord=""
    done 

}

function create_not_null_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # 設定ファイルパス
    local _option=${2}
    # 出力レコード
    local _dataRecord=""
    number_not_null=1
    notNullItemIndex=1
    # データ作成処理
    while [ true ]; do
        targetItemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${notNullItemIndex} '{print $field}'`
        notNullFlg=0
        item=""
        for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
            itemNotNull=`echo ${list_itemsNotNull} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            itemName=`echo ${list_itemsName} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            fullParts=`echo ${itemLength} | awk -F. '{print $1}'`

            if [[ ${itemType} = [cC][hH][aA][rR] || ${itemType} = [sS][tT][rR][iI][nN][gG] ]];then
                if [[ ${notNullItemIndex} = ${itemIndex} ]];then
                    if [[ ${itemNotNull} = 1 ]];then
                        if [[ ${checked_data_enclosing} = "" && ${checked_data_delimiting} = "" ]];then
                            for ((i=1; i<=${itemLength}; i++)); do
                                _randomchar=" "
                                item=${item}${_randomchar}
                            done
                        else
                            _randomchar=""
                            item=${item}${_randomchar}
                        fi
                    elif [[ ${itemNotNull} = 0 ]];then
                        notNullFlg=1
                    fi
                else
                    create_string_item ${itemLength} ${_option}
                fi
            elif [[ ${itemType} = [bB][yY][tT][eE] || ${itemType} = [sS][hH][oO][rR][tT] || ${itemType} = [iI][nN][tT] || ${itemType} = [lL][oO][nN][gG] ]];then
                if [[ ${notNullItemIndex} = ${itemIndex} ]];then
                    if [[ ${itemNotNull} = 1 ]];then
                        if [[ ${checked_data_enclosing} = "" && ${checked_data_delimiting} = "" ]];then
                            for ((i=1; i<=${itemLength}; i++)); do
                                _randomint=" "
                                item=${item}${_randomint}
                            done
                        else
                            _randomint=""
                            item=${item}${_randomint}
                        fi
                    else
                        notNullFlg=1
                    fi
                else
                    create_integer_item ${itemLength} ${_option}
                fi
            elif [[ ${itemType} = [fF][lL][oO][aA][tT] || ${itemType} = [dD][oO][uU][bB][lL][eE] ]];then
                if [[ ${notNullItemIndex} = ${itemIndex} ]];then
                    if [[ ${itemNotNull} = 1 ]];then
                        if [[ ${checked_data_enclosing} = "" && ${checked_data_delimiting} = "" ]];then
                            for ((i=1; i<=${fullParts}; i++)); do
                                _randomint=" "
                                item=${item}${_randomint}
                            done
                        else
                            _randomint=""
                            item=${item}${_randomint}
                        fi
                    else
                        notNullFlg=1
                    fi
                else
                    create_float_item ${itemLength} ${_option}
                fi
            elif [[ ${itemType} =~ [dD][aA][tT][eE] ]];then
                if [[ ${notNullItemIndex} = ${itemIndex} ]];then
                    if [[ ${itemNotNull} = 1 ]];then
                        if [[ ${checked_data_enclosing} = "" && ${checked_data_delimiting} = "" ]];then
                            for ((i=1; i<=${itemLength}; i++)); do
                                _randomDate=" "
                                item=${item}${_randomDate}
                            done
                        else
                            _randomDate=""
                            item=${item}${_randomDate}
                        fi
                    else
                        notNullFlg=1
                    fi
                else
                    create_date_item ${itemType}
                fi
            fi
            if [[ ${notNullFlg} = 1 ]];then
                continue
            fi

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
            item=""
        done

        # SQLの場合、クエリー形式に修正
        if [[ ${checked_data_outputType} = SQL ]];then
            list_itemsName=`echo ${list_itemsName} | sed 's/"//g'`
            echo "INSERT INTO "${data_schema}.${data_outputName}" (${list_itemsName}) VALUES (${_dataRecord})" > ${_createFile}.sql
        fi

        notNullItemIndex=$(( ${notNullItemIndex} + 1 ))

        if [[ ${notNullItemIndex} -gt ${itemsCount} ]];then
            break
        fi
        _dataRecord=""
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

itemsCount=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, '{print NF}'`

### Normal data
#create_normal_record ${filePath%/}/tmp_${checked_data_outputName} ${checked_data_multiByteCharacter}
### Trim data
#create_trim_record ${filePath%/}/tmp_${checked_data_outputName} trim
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


echo "_dataRecord=${_dataRecord}"




#printf "%s" "testああvv" | iconv -t SJIS >> ./filename.txt
#printf "%s" "testああvv" | iconv -t SJIS | tr "\n" "\r" >> ./filename.txt
#nkf --guess ./filename.txt