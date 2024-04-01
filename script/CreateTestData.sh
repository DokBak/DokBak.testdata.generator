#!/bin/bash

#--------------------------------------------#
#  1.設定ファイルから文字コード情報を取得              #
#--------------------------------------------#
function check_file_encoding(){

    # 設定ファイルパス
    local _settingFile=${1}
    # 文字コード
    export `cat ${_settingFile} | grep encoding`
    data_file_encoding=""
    encoding_status=""

    # 取得情報選別
    if [[ ${encoding} == [uU][tT][fF]"-8" ]];then
        data_file_encoding="0"
        encoding_status="0"
    elif [[ ${encoding} == [eE][uU][cC] ]];then
        data_file_encoding="1"
        encoding_status="0"
    elif [[ ${encoding} == [jJ][iI][sS] ]];then
        data_file_encoding="2"
        encoding_status="0"
    elif [[ ${encoding} == [sS][jJ][iI][sS] ]];then
        data_file_encoding="3"
        encoding_status="0"
    elif [[ ${encoding} == [uU][tT][fF]"-8("[bB][oO][mM]")" ]];then
        data_file_encoding="4"
        encoding_status="0"
    else
        encoding_status="1"
        echo "支援する文字コード：UTF-8, EUC, JIS, SJIS, UTF-8(BOM)"
    fi

    echo "取得文字コード：${data_file_encoding}"
}

#--------------------------------------------#
#  2.設定ファイルから改行コード情報を取得              #
#--------------------------------------------#
function check_file_newLine(){

    # 設定ファイルパス
    local _settingFile=${1}
    # 改行コード
    export `cat ${_settingFile} | grep newLine`
    data_file_newLine=""
    newLine_status=""

    # 取得情報選別
    if [[ ${newLine} == [cC][rR][lL][fF] ]];then
        data_file_newLine="0"
        newLine_status="0"
    elif [[ ${newLine} == [lL][fF] ]];then
        data_file_newLine="1"
        newLine_status="0"
    elif [[ ${newLine} == [cC][rR] ]];then
        data_file_newLine="2"
        newLine_status="0"
    else
        newLine_status="1"
        echo "支援する改行コード：CRLF, LF, CR"
    fi

    echo "取得改行コード：${data_file_newLine}"
}

#--------------------------------------------#
#  3.設定ファイルから囲み文字情報を取得      　        #
#--------------------------------------------#
function check_file_enclosing(){

    # 設定ファイルパス
    local _settingFile=${1}
    # 囲み文字
    export `cat ${_settingFile} | grep enclosing`
    data_file_enclosing=""
    enclosing_status=""

    # 取得情報選別
    if [[ ${enclosing} == "" ]];then
        data_file_enclosing="0"
        enclosing_status="0"
    elif [[ ${enclosing} == "\"" ]];then
        data_file_enclosing="1"
        enclosing_status="0"
    elif [[ ${enclosing} == "\'" ]];then
        data_file_enclosing="2"
        enclosing_status="0"
    else
        enclosing_status="1"
        echo "「\"」, 「\'」, 「」(無)"
    fi

    echo "取得囲み文字：${data_file_enclosing}"
}

#--------------------------------------------#
#  4.設定ファイルから区切り文字情報を取得      　       #
#--------------------------------------------#
function check_file_delimiting(){

    # 設定ファイルパス
    local _settingFile=${1}
    # 区切り文字
    export `cat ${_settingFile} | grep delimiting`
    data_file_delimiting=""
    delimiting_status=""

    # 取得情報選別
    if [[ ${delimiting} == "" ]];then
        data_file_delimiting="0"
        delimiting_status="0"
    elif [[ ${delimiting} == "," ]];then
        data_file_delimiting="1"
        delimiting_status="0"
    elif [[ ${delimiting} == "\t" ]];then
        data_file_delimiting="2"
        delimiting_status="0"
    else
        delimiting_status="1"
        echo "「,」, 「\t」, 「」(無)"
    fi

    echo "取得区切り文字：${data_file_delimiting}"
}

#--------------------------------------------#
#  5.設定ファイルから出力タイプ情報を取得               #
#--------------------------------------------#
function check_data_outputType(){

    # 設定ファイルパス
    local _settingFile=${1}
    # 出力タイプ
    export `cat ${_settingFile} | grep outputType`
    data_outputType=""
    outputType_status=""

    # 取得情報選別
    if [[ ${outputType} == [fF][iI][lL][eE] ]];then
        data_outputType="0"
        outputType_status="0"
    elif [[ ${outputType} == [sS][qQ][lL] ]];then
        data_outputType="1"
        outputType_status="0"
    elif [[ ${outputType} == ".gz" ]];then
        data_outputType="2"
        outputType_status="0"
    elif [[ ${outputType} == ".Z" ]];then
        data_outputType="3"
        outputType_status="0"
    else
        outputType_status="1"
        echo "支援する出力タイプ：file, SQL, .gz, .Z"
    fi

    echo "取得出力タイプ：${data_outputType}"
}

#--------------------------------------------#
#  6.設定ファイルからトリム情報を取得                 #
#--------------------------------------------#
function check_data_trim(){

    # 設定ファイルパス
    local _settingFile=${1}
    # トリム
    export `cat ${_settingFile} | grep trim`
    data_trim=""
    trim_status=""

    # 取得情報選別
    if [[ ${trim} == "" ]];then
        data_trim="0"
        trim_status="0"
    elif [[ ${trim} == [fF][hH][sS] ]];then
        data_trim="1"
        trim_status="0"
    elif [[ ${trim} == [bB][hH][sS] ]];then
        data_trim="2"
        trim_status="0"
    elif [[ ${trim} == [fF][fF][sS] ]];then
        data_trim="3"
        trim_status="0"
    elif [[ ${trim} == [bB][fF][sS] ]];then
        data_trim="4"
        trim_status="0"
    elif [[ ${trim} == [hH][sS] ]];then
        data_trim="5"
        trim_status="0"
    elif [[ ${trim} == [hH][sS][fF][fF][sS] ]];then
        data_trim="6"
        trim_status="0"
    elif [[ ${trim} == [hH][sS][bB][fF][sS] ]];then
        data_trim="7"
        trim_status="0"
    elif [[ ${trim} == [fF][sS] ]];then
        data_trim="8"
        trim_status="0"
    else
        trim_status="1"
        echo "支援するトリム：FHS, BHS, FFS, BFS, HS, HSFFS, HSBFS, FS"
    fi

    echo "取得トリム：${data_trim}"
}

#--------------------------------------------#
#  7.設定ファイルからデータタイプ情報を取得             #
#--------------------------------------------#
function check_data_dataType(){

    # 設定ファイルパス
    local _settingFile=${1}
    # 項目番号
    local _itemNum=${2}
    # データタイプ
    export `cat ${_settingFile} | grep dataTypeList`
    dataType=`echo ${dataTypeList} | sed 's/"//g' | awk -F, -v field=${_itemNum} '{print $field}'`
    data_dataType=""
    dataType_status=""

    # 取得情報選別
    if [[ ${dataType} == [cC][hH][aA][rR] ]];then
        data_dataType="0"
        dataType_status="0"
    elif [[ ${dataType} == [sS][tT][rR][iI][nN][gG] ]];then
        data_dataType="1"
        dataType_status="0"
    elif [[ ${dataType} == [bB][yY][tT][eE] ]];then
        data_dataType="2"
        dataType_status="0"
    elif [[ ${dataType} == [sS][hH][oO][rR][tT] ]];then
        data_dataType="3"
        dataType_status="0"
    elif [[ ${dataType} == [iI][nN][tT] ]];then
        data_dataType="4"
        dataType_status="0"
    elif [[ ${dataType} == [lL][oO][nN][gG] ]];then
        data_dataType="5"
        dataType_status="0"
    elif [[ ${dataType} == [fF][lL][oO][aA][tT] ]];then
        data_dataType="6"
        dataType_status="0"
    elif [[ ${dataType} == [dD][oO][uU][bB][lL][eE] ]];then
        data_dataType="7"
        dataType_status="0"
    else
        dataType_status="1"
        echo "支援するデータタイプ：char, string, byte, short, int, long, float, double"
    fi

    echo "取得データタイプ：${data_dataType}"
}

#--------------------------------------------#
#  8.設定ファイルから出力結果名情報を取得              #
#--------------------------------------------#
function check_data_outputName(){

    # 設定ファイルパス
    local _settingFile=${1}
    # 出力結果名
    export `cat ${_settingFile} | grep outputName`
    data_outputName=""
    outputName_status=""
    # ファイル番号
    data_fileCounts=`echo ${outputName} | grep -o "?" | wc -l`

    # 取得情報選別
    if [[ ${outputName} =~ YYYYMMDDhhmmss ]];then
        YYYYMMDDhhmmss=`date +"%Y%m%d%H%M%S"`
        data_outputName=`echo ${outputName} | sed "s/YYYYMMDDhhmmss/${YYYYMMDDhhmmss}/g"`
        outputName_status="0"
    elif [[ ${outputName} =~ YYYYMMDDhhmm ]];then
        YYYYMMDDhhmm=`date +"%Y%m%d%H%M"`
        data_outputName=`echo ${outputName} | sed "s/YYYYMMDDhhmm/${YYYYMMDDhhmm}/g"`
        outputName_status="0"
    elif [[ ${outputName} =~ YYYYMMDDhh ]];then
        YYYYMMDDhh=`date +"%Y%m%d%H"`
        data_outputName=`echo ${outputName} | sed "s/YYYYMMDDhh/${YYYYMMDDhh}/g"`
        outputName_status="0"
    elif [[ ${outputName} =~ YYYYMMDD ]];then
        YYYYMMDD=`date +"%Y%m%d"`
        data_outputName=`echo ${outputName} | sed "s/YYYYMMDD/${YYYYMMDD}/g"`
        outputName_status="0"
    elif [[ ${outputName} =~ YYYYMM ]];then
        YYYYMM=`date +"%Y%m"`
        data_outputName=`echo ${outputName} | sed "s/YYYYMM/${YYYYMM}/g"`
        outputName_status="0"
    elif [[ ${outputName} =~ YYYY ]];then
        YYYY=`date +"%Y"`
        data_outputName=`echo ${outputName} | sed "s/YYYY/${YYYY}/g"`
        outputName_status="0"
    elif [[ ${outputName} =~ MMDD ]];then
        MMDD=`date +"%m%d"`
        data_outputName=`echo ${outputName} | sed "s/MMDD/${MMDD}/g"`
        outputName_status="0"
    elif [[ ${outputName} =~ MM ]];then
        MM=`date +"%m"`
        data_outputName=`echo ${outputName} | sed "s/MM/${MM}/g"`
        outputName_status="0"
    elif [[ ${outputName} =~ DD ]];then
        DD=`date +"%d"`
        data_outputName=`echo ${outputName} | sed "s/DD/${DD}/g"`
        outputName_status="0"
    elif [[ ${outputName} =~ hhmm ]];then
        hhmm=`date +"%H%M"`
        data_outputName=`echo ${outputName} | sed "s/hhmm/${hhmm}/g"`
        outputName_status="0"
    elif [[ ${outputName} =~ hh ]];then
        hh=`date +"%H"`
        data_outputName=`echo ${outputName} | sed "s/hh/${hh}/g"`
        outputName_status="0"
    else
        data_outputName=${outputName}
        outputName_status="0"
    fi
    
    if [[ ${data_fileCounts} -gt 0 ]];then
        data_outputName=`echo ${data_outputName} | sed "s/?/0/g"`
    fi

    echo "取得出力結果名：${data_outputName}、取得ファイル番号：${data_fileCounts}"
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

clear

while [ true ];do

    check_file_encoding ${setFilePath}
            data_file_encoding="4"
    check_file_newLine ${setFilePath}
            data_file_newLine="2"
    check_file_enclosing ${setFilePath}
            data_file_enclosing="2"
    check_file_delimiting ${setFilePath}
            data_file_delimiting="2"
    check_data_outputType ${setFilePath}
            data_outputType="3"
    check_data_trim ${setFilePath}
            data_trim="8"
    check_data_outputName ${setFilePath}
            data_outputName=${outputName}
    # status check
    if [[ ${encoding_status} -ne 0 ]];then
        echo "文字コード情報を取得失敗"
        break
    elif  [[ ${newLine_status} -ne 0 ]];then
        echo "改行コード情報を取得失敗"
        break
    elif  [[ ${enclosing_status} -ne 0 ]];then
        echo "囲み文字情報を取得失敗"
        break
    elif  [[ ${delimiting_status} -ne 0 ]];then
        echo "区切り文字情報を取得失敗"
        break
    elif  [[ ${outputType_status} -ne 0 ]];then
        echo "出力タイプ情報を取得失敗"
        break
    elif  [[ ${trim_status} -ne 0 ]];then
        echo "トリム情報を取得失敗"
        break
    elif  [[ ${dataType_status} -ne 0 ]];then
        echo "データタイプ情報を取得失敗"
        break
    elif  [[ ${outputName_status} -ne 0 ]];then
        echo "出力結果名情報を取得失敗"
        break
    fi
    
    export `cat ${setFilePath} | grep itemsLength`
    itemCounts=`echo ${itemsLength} | sed 's/"//g' | awk -F, -v field=${_itemNum} '{print NF}'`

    echo "main 처리"
    echo
    for ((itemIndex=1; itemIndex<=${itemCounts}; itemIndex++))
    do
        echo "itemIndex=${itemIndex}"
        itemLength=`echo ${itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
        check_data_dataType ${setFilePath} ${itemIndex}
        echo "data_dataType=${data_dataType}"
        if [[ ${data_dataType} = [0-1] ]];then
            echo "문자열을 출력"

            random_ascii=$((RANDOM % 26 + 65))
            random_char=$(printf \\$(printf '%03o' $random_ascii))
            echo $random_char

        elif [[ ${data_dataType} = [2-4] ]];then
            echo "정수를 출력"
            echo $((RANDOM % 10))

        elif [[ ${data_dataType} = [5-7] ]];then
            echo "실수를 출력"
            echo $((RANDOM % 10))
        fi
        echo
    done

    echo
    echo "itemsLength=${itemsLength}"
    echo "itemCounts=${itemCounts}"
    endFlg=1
    if [[ ${endFlg} -eq 1 ]];then
        break
    fi

done


#printf "%s" "testああvv" | iconv -t SJIS >> ./filename.txt
#printf "%s" "testああvv" | iconv -t SJIS | tr "\n" "\r" >> ./filename.txt
#nkf --guess ./filename.txt