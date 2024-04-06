#!/bin/bash

#--------------------------------------------#
#  1.設定ファイルから文字コード情報を取得              #
#--------------------------------------------#
function check_file_encoding() {

    # 設定ファイルパス
    local _settingFile=${1}
    # 文字コード
    export `cat ${_settingFile} | grep data_encoding`
    checked_data_encoding=""
    encoding_status=""

    # 取得情報選別
    if [[ ${data_encoding} = 0 ]];then
        checked_data_encoding="UTF-8"
        encoding_status="0"
    elif [[ ${data_encoding} = 1 ]];then
        checked_data_encoding="EUC"
        encoding_status="0"
    elif [[ ${data_encoding} = 2 ]];then
        checked_data_encoding="JIS"
        encoding_status="0"
    elif [[ ${data_encoding} = 3 ]];then
        checked_data_encoding="SJIS"
        encoding_status="0"
    elif [[ ${data_encoding} = 4 ]];then
        checked_data_encoding="UTF-8(BOM)"
        encoding_status="0"
    else
        encoding_status="1"
        echo "支援する文字コード：UTF-8, EUC, JIS, SJIS, UTF-8(BOM)"
    fi

    echo "取得文字コード：${checked_data_encoding}"
}

#--------------------------------------------#
#  2.設定ファイルから改行コード情報を取得              #
#--------------------------------------------#
function check_file_newLine() {

    # 設定ファイルパス
    local _settingFile=${1}
    # 改行コード
    export `cat ${_settingFile} | grep data_newLine`
    checked_data_newLine=""
    newLine_status=""

    # 取得情報選別
    if [[ ${data_newLine} = 0 ]];then
        checked_data_newLine="CRLF"
        newLine_status="0"
    elif [[ ${data_newLine} = 1 ]];then
        checked_data_newLine="CR"
        newLine_status="0"
    elif [[ ${data_newLine} = 2 ]];then
        checked_data_newLine="LF"
        newLine_status="0"
    else
        newLine_status="1"
        echo "支援する改行コード：CRLF, LF, CR"
    fi

    echo "取得改行コード：${checked_data_newLine}"
}

#--------------------------------------------#
#  3.設定ファイルから囲み文字情報を取得      　        #
#--------------------------------------------#
function check_file_enclosing() {

    # 設定ファイルパス
    local _settingFile=${1}
    # 囲み文字
    export `cat ${_settingFile} | grep data_enclosing`
    checked_data_enclosing=""
    enclosing_status=""

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

    echo "取得囲み文字：${checked_data_enclosing}"
}

#--------------------------------------------#
#  4.設定ファイルから区切り文字情報を取得      　       #
#--------------------------------------------#
function check_file_delimiting() {

    # 設定ファイルパス
    local _settingFile=${1}
    # 区切り文字
    export `cat ${_settingFile} | grep data_delimiting`
    checked_data_delimiting=""
    delimiting_status=""

    # 取得情報選別
    if [[ ${data_delimiting} = 0 ]];then
        checked_data_delimiting=""
        delimiting_status="0"
    elif [[ ${data_delimiting} = 1 ]];then
        checked_data_delimiting=","
        delimiting_status="0"
    elif [[ ${data_delimiting} = 2 ]];then
        checked_data_delimiting="\t"
        delimiting_status="0"
    else
        delimiting_status="1"
        echo "「」(無), 「,」, 「\t」"
    fi

    echo "取得区切り文字：${checked_data_delimiting}"
}

#--------------------------------------------#
#  4.設定ファイルから区切り文字情報を取得      　       #
#--------------------------------------------#
function check_file_multiByteCharacter() {

    # 設定ファイルパス
    local _settingFile=${1}
    # 設定ファイルパス
    local _language=${2}
    # 区切り文字
    export `cat ${_settingFile} | grep data_multiByteCharacter`
    checked_data_multiByteCharacter=""
    multiByteCharacter_status=""

    # 取得情報選別
    if [[ ${data_multiByteCharacter} = 0 ]];then
        checked_data_multiByteCharacter=""
        multiByteCharacter_status="0"
    elif [[ ${data_multiByteCharacter} = 1 ]];then
        if [[ ${_language} = [kK][rR] ]];then 
            checked_data_multiByteCharacter="가"
            multiByteCharacter_status="0"
        elif [[ ${_language} = [jJ][pP] ]];then 
            checked_data_multiByteCharacter="あ"
            multiByteCharacter_status="0"
        fi 
    else
        multiByteCharacter_status="1"
        echo "「0」, 「1」"
    fi

    echo "マルチバイト文字：${checked_data_multiByteCharacter}"
    
}

#--------------------------------------------#
#  5.設定ファイルから出力タイプ情報を取得               #
#--------------------------------------------#
function check_data_outputType() {

    # 設定ファイルパス
    local _settingFile=${1}
    # 出力タイプ
    export `cat ${_settingFile} | grep data_outputType`
    checked_data_outputType=""
    outputType_status=""

    # 取得情報選別
    if [[ ${data_outputType} = 0 ]];then
        checked_data_outputType="FILE"
        outputType_status="0"
    elif [[ ${data_outputType} = 1 ]];then
        checked_data_outputType="SQL"
        outputType_status="0"
    elif [[ ${data_outputType} = 2 ]];then
        checked_data_outputType=".gz"
        outputType_status="0"
    elif [[ ${data_outputType} = 3 ]];then
        checked_data_outputType=".Z"
        outputType_status="0"
    else
        outputType_status="1"
        echo "支援する出力タイプ：FILE, SQL, .gz, .Z"
    fi

    echo "取得出力タイプ：${checked_data_outputType}"
}

function create_string_item() {
    _itemLength=$1
    _funcOption=$2
    if [[ ${_funcOption} = "" ]];then
        item=""
    fi

    for ((i=1; i<=${_itemLength}; i++)); do
            _randomAscii=$((RANDOM % 26 + 65))
            _randomChar=$(printf \\$(printf '%03o' ${_randomAscii}))
            item=${item}${_randomChar}
    done
    echo "item=${item}"
}

function create_integer_item() {
    _itemLength=$1
    _funcOption=$2
    if [[ ${_funcOption} = "" ]];then
        item=""
    fi

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
    echo "item=${item}"
}

function create_float_item() {
    _itemLength=$1
    _funcOption=$2
    if [[ ${_funcOption} = "" ]];then
        item=""
    fi

    _fullParts=`echo ${_itemLength} | awk -F. '{print $1}'`
    _decimalParts=`echo ${_itemLength} | awk -F. '{print $2}'`
    _integerParts=$(( ${_fullParts} - ${_decimalParts} - 1 ))
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
    echo "item=${item}"
}

#--------------------------------------------#
#  8.設定ファイルから出力結果名情報を取得              #
#--------------------------------------------#
function check_data_outputName() {

    # 設定ファイルパス
    local _settingFile=${1}
    # 出力結果名
    export `cat ${_settingFile} | grep data_outputName`
    export `cat ${_settingFile} | grep data_schema`
    checked_data_outputName=""
    outputName_status=""
    # ファイル番号
    data_fileCounts=`echo ${data_outputName} | grep -o "?" | wc -l`

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
    
    if [[ ${data_fileCounts} -gt 0 ]];then
        checked_data_outputName=`echo ${checked_data_outputName} | sed "s/?/0/g"`
    fi

    echo "取得出力結果名：${checked_data_outputName}、取得ファイル番号：${data_fileCounts}"
}

function create_normal_record() {
    
    # 設定ファイルパス
    local _createFile=${1}
    # 設定ファイルパス
    local _option=${2}

    for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++));do
        itemTrim=`echo ${list_itemsTrim} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
        itemType=`echo ${list_itemsType} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
        itemName=`echo ${list_itemsName} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
        itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
        item=""

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

        echo "itemType=${itemType}"
        echo "item=${item}"
        if [[ ${itemType} = [cC][hH][aA][rR] || ${itemType} = [sS][tT][rR][iI][nN][gG] ]];then
            create_string_item ${itemLength} ${_option}
        elif [[ ${itemType} = [bB][yY][tT][eE] || ${itemType} = [sS][hH][oO][rR][tT] || ${itemType} = [iI][nN][tT] || ${itemType} = [lL][oO][nN][gG] ]];then
            create_integer_item ${itemLength} ${_option}
        elif [[ ${itemType} = [fF][lL][oO][aA][tT] || ${itemType} = [dD][oO][uU][bB][lL][eE] ]];then
            create_float_item ${itemLength} ${_option}
        fi
        
        if [[ ${itemsCount} = ${itemIndex} ]];then
            if [[ ${checked_data_outputType} = SQL ]];then
                checked_data_enclosing=\'
                dataRecord=${dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
            else
                dataRecord=${dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}
                if [[ ${checked_data_newLine} = CRLF ]];then
                    printf "${dataRecord}$(printf \\$(printf '%03o' 13 ))\n" > ${_createFile}
                elif  [[ ${checked_data_newLine} = CR ]];then
                    printf "${dataRecord}$(printf \\$(printf '%03o' 13 ))" > ${_createFile}
                else # LF
                    printf "${dataRecord}\n" > ${_createFile}
                fi
            fi
        else
            if [[ ${checked_data_outputType} = SQL ]];then
                checked_data_enclosing=\'
                dataRecord=${dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}
            else
                dataRecord=${dataRecord}${checked_data_enclosing}${item}${checked_data_enclosing}${checked_data_delimiting}
            fi
        fi
    done

    if [[ ${checked_data_outputType} = SQL ]];then
        list_itemsName=`echo ${list_itemsName} | sed 's/"//g'`
        echo "INSERT INTO "${data_schema}.${data_outputName}" (${list_itemsName}) VALUES (${dataRecord})" > ${_createFile}.txt
    fi
}

function create_trim_data() {
    
    _itemTrim=$1
    _trimLocation=$2

    if [[ ${_trimLocation} = [hH][sS] ]];then
        if [[ ${_itemTrim} =~ ft ]];then
            item=""
            item=${item}" "
        elif [[ ${_itemTrim} =~ bk ]];then
            item=${item}" "
        fi
    fi

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


check_file_encoding ${setFilePath}
check_file_newLine ${setFilePath}
check_file_enclosing ${setFilePath}
check_file_delimiting ${setFilePath}
check_data_outputType ${setFilePath}
check_data_outputName ${setFilePath}
check_file_multiByteCharacter ${setFilePath} jp

export `cat ${setFilePath} | grep data_escapeCode_list`
export `cat ${setFilePath} | grep list_itemsTrim`
export `cat ${setFilePath} | grep list_itemsType`
export `cat ${setFilePath} | grep list_itemsName`
export `cat ${setFilePath} | grep list_itemsLength`

itemsCount=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, '{print NF}'`

create_normal_record ${filePath%/}/${checked_data_outputName} MULTI
#create_normal_record ${filePath%/}/${checked_data_outputName}

echo "dataRecord=${dataRecord}"




#printf "%s" "testああvv" | iconv -t SJIS >> ./filename.txt
#printf "%s" "testああvv" | iconv -t SJIS | tr "\n" "\r" >> ./filename.txt
#nkf --guess ./filename.txt