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
    if [[ ${encoding} == 0 ]];then
        data_file_encoding="UTF-8"
        encoding_status="0"
    elif [[ ${encoding} == 1 ]];then
        data_file_encoding="EUC"
        encoding_status="0"
    elif [[ ${encoding} == 2 ]];then
        data_file_encoding="JIS"
        encoding_status="0"
    elif [[ ${encoding} == 3 ]];then
        data_file_encoding="SJIS"
        encoding_status="0"
    elif [[ ${encoding} == 4 ]];then
        data_file_encoding="UTF-8(BOM)"
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
    if [[ ${newLine} == 0 ]];then
        data_file_newLine="CRLF"
        newLine_status="0"
    elif [[ ${newLine} == 1 ]];then
        data_file_newLine="CR"
        newLine_status="0"
    elif [[ ${newLine} == 2 ]];then
        data_file_newLine="LF"
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
    if [[ ${enclosing} == 0 ]];then
        data_file_enclosing=""
        enclosing_status="0"
    elif [[ ${enclosing} == 1 ]];then
        data_file_enclosing="\""
        enclosing_status="0"
    elif [[ ${enclosing} == 2 ]];then
        data_file_enclosing="\'"
        enclosing_status="0"
    else
        enclosing_status="1"
        echo "「」(無), 「\"」, 「\'」"
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
    if [[ ${delimiting} == 0 ]];then
        data_file_delimiting=""
        delimiting_status="0"
    elif [[ ${delimiting} == 1 ]];then
        data_file_delimiting=","
        delimiting_status="0"
    elif [[ ${delimiting} == 2 ]];then
        data_file_delimiting="\t"
        delimiting_status="0"
    else
        delimiting_status="1"
        echo "「」(無), 「,」, 「\t」"
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
    if [[ ${outputType} == 0 ]];then
        data_outputType="FILE"
        outputType_status="0"
    elif [[ ${outputType} == 1 ]];then
        data_outputType="SQL"
        outputType_status="0"
    elif [[ ${outputType} == 2 ]];then
        data_outputType=".gz"
        outputType_status="0"
    elif [[ ${outputType} == 3 ]];then
        data_outputType=".Z"
        outputType_status="0"
    else
        outputType_status="1"
        echo "支援する出力タイプ：FILE, SQL, .gz, .Z"
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
        data_trim=""
        trim_status="0"
    elif [[ ${trim} == 1 ]];then
        data_trim="F_HS"
        trim_status="0"
    elif [[ ${trim} == 2 ]];then
        data_trim="B_HS"
        trim_status="0"
    elif [[ ${trim} == 3 ]];then
        data_trim="F_FS"
        trim_status="0"
    elif [[ ${trim} == 4 ]];then
        data_trim="B_FS"
        trim_status="0"
    elif [[ ${trim} == 5 ]];then
        data_trim="A_HS"
        trim_status="0"
    elif [[ ${trim} == 6 ]];then
        data_trim="A_HS_F_FS"
        trim_status="0"
    elif [[ ${trim} == 7 ]];then
        data_trim="A_HS_B_FS"
        trim_status="0"
    elif [[ ${trim} == 8 ]];then
        data_trim="A_FS"
        trim_status="0"
    else
        trim_status="1"
        echo "支援するトリム：F_HS, B_HS, F_FS, B_FS, A_HS, A_HS_F_FS, A_HS_B_FS, A_FS"
    fi

    echo "取得トリム：${data_trim}"
}

#--------------------------------------------#
#  7.設定ファイルからデータタイプ情報を取得             #
#--------------------------------------------#
function check_data_itemType(){

    # 設定ファイルパス
    local _settingFile=${1}
    # 項目番号
    local _itemNum=${2}
    # データタイプ
    export `cat ${_settingFile} | grep list_itemType`
    itemType=`echo ${list_itemType} | sed 's/"//g' | awk -F, -v field=${_itemNum} '{print $field}'`
    data_itemType=""
    itemType_status=""

    # 取得情報選別
    if [[ ${itemType} == [cC][hH][aA][rR] ]];then
        data_itemType="0"
        itemType_status="0"
    elif [[ ${itemType} == [sS][tT][rR][iI][nN][gG] ]];then
        data_itemType="1"
        itemType_status="0"
    elif [[ ${itemType} == [bB][yY][tT][eE] ]];then
        data_itemType="2"
        itemType_status="0"
    elif [[ ${itemType} == [sS][hH][oO][rR][tT] ]];then
        data_itemType="3"
        itemType_status="0"
    elif [[ ${itemType} == [iI][nN][tT] ]];then
        data_itemType="4"
        itemType_status="0"
    elif [[ ${itemType} == [lL][oO][nN][gG] ]];then
        data_itemType="5"
        itemType_status="0"
    elif [[ ${itemType} == [fF][lL][oO][aA][tT] ]];then
        data_itemType="6"
        itemType_status="0"
    elif [[ ${itemType} == [dD][oO][uU][bB][lL][eE] ]];then
        data_itemType="7"
        itemType_status="0"
    else
        itemType_status="1"
        echo "支援するデータタイプ：char, string, byte, short, int, long, float, double"
    fi

    echo "取得データタイプ：${data_itemType}"
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


check_file_encoding ${setFilePath}
        data_file_encoding="UTF-8"
check_file_newLine ${setFilePath}
        data_file_newLine="CRLF"
check_file_enclosing ${setFilePath}
        data_file_enclosing="\""
check_file_delimiting ${setFilePath}
        data_file_delimiting=","
check_data_outputType ${setFilePath}
        data_outputType="FILE"
check_data_trim ${setFilePath}
        data_trim="A_FS"
check_data_outputName ${setFilePath}
        #data_outputName=${outputName}

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
elif  [[ ${itemType_status} -ne 0 ]];then
    echo "データタイプ情報を取得失敗"
    break
elif  [[ ${outputName_status} -ne 0 ]];then
    echo "出力結果名情報を取得失敗"
    break
fi

# setFile check





clear

testNumber=0

while [ true ];do
    testNumber=$(( ${testNumber} + 1 ))
    echo "tmp_testNumber=${testNumber}"
    
    export `cat ${setFilePath} | grep list_itemsLength`
    itemsCount=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${_itemNum} '{print NF}'`
    
    echo "tmp_itemsCount=${itemsCount}"
    echo
    echo "tmp_main 처리"
    echo
        for ((itemIndex=1; itemIndex<=${itemsCount}; itemIndex++))
        do
            echo "tmp_itemIndex=${itemIndex}"
            echo
            itemLength=`echo ${list_itemsLength} | sed 's/"//g' | awk -F, -v field=${itemIndex} '{print $field}'`
            echo "tmp_itemLength=${itemLength}"
            echo

            check_data_itemType ${setFilePath} ${itemIndex}
            echo
            echo "data_itemType=${data_itemType}"
            echo
            item=""
            if [[ ${data_itemType} = [0] ]];then
                randomAscii=$((RANDOM % 26 + 65))
                randomChar=$(printf \\$(printf '%03o' ${randomAscii}))
                item=${item}${randomChar}
                echo "item=${item}"
            elif [[ ${data_itemType} = [1] ]];then
                echo "문자열을 출력 ${i}"
                if [[ ${itemLength} -lt 2 ]];then
                    item=${item}
                    echo "2보다 작다"
                elif [[ ${itemLength} -lt 3 && ${data_trim} ~= F_HS || ${data_trim} ~= A_HS ]];then
                    echo "3보다 작다"
                else
                    echo "1보다 크다"
                fi 
                for ((i=1; i<=${itemLength}; i++))    
                do
                    randomAscii=$((RANDOM % 26 + 65))
                    randomChar=$(printf \\$(printf '%03o' ${randomAscii}))
                    item=${item}${randomChar}
                    echo "item=${item}"
                done
            elif [[ ${data_itemType} = [2-5] ]];then
                echo "정수를 출력"
                for ((i=1; i<=${itemLength}; i++))    
                do
                    if [[ ${i} = [1] ]];then
                        randomint=$((RANDOM % 9))
                        if [[ ${randomint} = [0] ]];then
                            randomint=9
                        fi
                    else
                        randomint=$((RANDOM % 10))
                    fi
                    item=${item}${randomint}
                    echo "item=${item}"
                done
            elif [[ ${data_itemType} = [6-7] ]];then
                echo "실수를 출력"
                echo ${itemLength} 
                fullParts=`echo ${itemLength} | awk -F. '{print $1}'`
                decimalParts=`echo ${itemLength} | awk -F. '{print $2}'`
                echo "fullParts=${fullParts}"
                echo "decimalParts=${decimalParts}"
                integerParts=$(( ${fullParts} - ${decimalParts} - 1 ))
                echo "integerParts=${integerParts}"
                for ((i=1; i<=${integerParts}; i++))    
                do
                    if [[ ${i} = [1] ]];then
                        randomint=$((RANDOM % 9))
                        if [[ ${randomint} = [0] ]];then
                            randomint=9
                        fi
                    else
                        randomint=$((RANDOM % 10))
                    fi
                    item=${item}${randomint}
                    echo "item=${item}"
                done
                echo "integerParts checking"

                if [[ ${decimalParts} = [0] ]];then
                    item=${item}
                elif [[ ${decimalParts} = [1] ]];then
                    item=${item}.
                    randomint=$((RANDOM % 10))
                    if [[ ${randomint} = [0] ]];then
                        randomint=9
                    fi
                    item=${item}${randomint}
                else
                    item=${item}.
                    for ((i=1; i<=$(( ${decimalParts} - 1 )); i++))    
                    do
                        randomint=$((RANDOM % 10))
                        item=${item}${randomint}
                        echo "item=${item}"
                    done
                    randomint=$((RANDOM % 10))
                    if [[ ${randomint} = [0] ]];then
                        randomint=9
                    fi
                    item=${item}${randomint}
                    echo "item=${item}"
                fi
            fi
            echo "fianl"
            if [[ ${itemsCount} = ${itemIndex} ]];then
                lineText=${lineText}${data_file_enclosing}${item}${data_file_enclosing}
            else
                lineText=${lineText}${data_file_enclosing}${item}${data_file_enclosing}${data_file_delimiting}
            fi
            echo "lineText=${lineText}"
            
            
        done
        if [[ ${testNumber} = 1 ]];then
            echo "${lineText}" > ${data_outputName}
        else 
            echo "${lineText}" >> ${data_outputName}
        fi
    endFlg=1
    if [[ ${endFlg} -eq 1 ]];then
        break
    fi

done


#printf "%s" "testああvv" | iconv -t SJIS >> ./filename.txt
#printf "%s" "testああvv" | iconv -t SJIS | tr "\n" "\r" >> ./filename.txt
#nkf --guess ./filename.txt