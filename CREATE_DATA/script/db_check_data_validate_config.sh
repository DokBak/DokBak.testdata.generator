#!/bin/bash

###################################################################################
#
#  シェル名      : データ関連の設定値を検証するシェル
#
#  作成者        : DokBak
#  作成日        : 2024/12/12          新規作成
#  修正日        : 2025/03/25          コードリファクタリング
#
#  処理概要      : db_data_config.txt の内容をチェックし、必要な設定値の有効性を確認します。
#
#  パラメータ    　:
#     なし
#
#  実行方法    　:
#     sh ./script/db_check_data_validate_config.sh
#
#  参照        :　https://github.com/DokBak/DokBak.testdata.generator
#
###################################################################################

echo "設定ファイルの有効性チェックを実行中..."
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}data_generator.log

# 設定ファイルのパス
_config_file="${CONFIG_DIR}db_data_config.txt"

# 共通
# 設定ファイルの存在確認
if [[ ! -f "${_config_file}" ]]; then
    echo "[220101]エラー: 設定ファイル${_config_file}が存在しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220101]エラー: 設定ファイル${_config_file}が存在しません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# COLUMN_COUNTSの確認
if [[ -z "${COLUMN_COUNTS}" ]]; then
    echo "[220102]エラー: COLUMN_COUNTSが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220102]エラー: COLUMN_COUNTSが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# COLUMN_DATA_TYPEの確認
if [[ -z "${COLUMN_DATA_TYPE}" ]]; then
    echo "[220103]エラー: COLUMN_DATA_TYPEが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220103]エラー: COLUMN_DATA_TYPEが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# COLUMN_DATA_LENGTHの確認
if [[ -z "${COLUMN_DATA_LENGTH}" ]]; then
    echo "[220104]エラー: COLUMN_DATA_LENGTHが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220104]エラー: COLUMN_DATA_LENGTHが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# COLUMN_DATA_TRIMの確認
if [[ -z "${COLUMN_DATA_TRIM}" ]]; then
    echo "[220105]エラー: COLUMN_DATA_TRIMが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220105]エラー: COLUMN_DATA_TRIMが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# COLUMN_DATA_SIGNEDの確認
if [[ -z "${COLUMN_DATA_SIGNED}" ]]; then
    echo "[220106]エラー: COLUMN_DATA_SIGNEDが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220106]エラー: COLUMN_DATA_SIGNEDが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# SIGN_DIGITの確認
if [[ -z "${SIGN_DIGIT}" ]]; then
    echo "[220107]エラー: SIGN_DIGITが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220107]エラー: SIGN_DIGITが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# DATE_SEPARATORの確認
if [[ -z "${DATE_SEPARATOR}" ]]; then
    echo "[220108]エラー: DATE_SEPARATORが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220108]エラー: DATE_SEPARATORが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# TIME_SEPARATORの確認
if [[ -z "${TIME_SEPARATOR}" ]]; then
    echo "[220109]エラー: TIME_SEPARATORが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220109]エラー: TIME_SEPARATORが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# SEPARATOR_DATE_TIMEの確認
if [[ -z "${SEPARATOR_DATE_TIME}" ]]; then
    echo "[220110]エラー: SEPARATOR_DATE_TIMEが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220110]エラー: SEPARATOR_DATE_TIMEが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# REFERENCE_DATEの確認
if [[ -z "${REFERENCE_DATE}" ]]; then
    echo "[220111]エラー: REFERENCE_DATEが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220111]エラー: REFERENCE_DATEが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# CASE_MODEの確認
if [[ -z "${CASE_MODE}" ]]; then
    echo "[220112]エラー: CASE_MODEが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220112]エラー: CASE_MODEが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# MULTIBYTE_STRINGの確認
if [[ -z "${MULTIBYTE_STRING}" ]]; then
    echo "[220113]エラー: MULTIBYTE_STRINGが設定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220113]エラー: MULTIBYTE_STRINGが設定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# COLUMN_COUNTS の値を検証
if [[ ! "${COLUMN_COUNTS}" =~ ^[0-9]+$ || "${COLUMN_COUNTS}" -lt 1 ]]; then
    echo "[220114]エラー: COLUMN_COUNTSは1以上の整数を指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220114]エラー: COLUMN_COUNTSは1以上の整数を指定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

IFS=',' read -ra _data_types <<< "${COLUMN_DATA_TYPE}"
IFS=',' read -ra _data_lengths <<< "${COLUMN_DATA_LENGTH}"
IFS=',' read -ra _data_trim <<< "${COLUMN_DATA_TRIM}"
IFS=',' read -ra _data_signed <<< "${COLUMN_DATA_SIGNED}"

# データタイプリストの項目数が COLUMN_COUNTS と一致しているか確認
if [[ "${#_data_types[@]}" -ne "${COLUMN_COUNTS}" ]]; then
    echo "[220115]エラー: COLUMN_DATA_TYPEの項目数がCOLUMN_COUNTSと異なります。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220115]エラー: COLUMN_DATA_TYPEの項目数がCOLUMN_COUNTSと異なります。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# データ桁数リストの項目数が COLUMN_COUNTS と一致しているか確認
if [[ "${#_data_lengths[@]}" -ne "${COLUMN_COUNTS}" ]]; then
    echo "[220116]エラー: COLUMN_DATA_LENGTHの項目数がCOLUMN_COUNTSと異なります。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220116]エラー: COLUMN_DATA_LENGTHの項目数がCOLUMN_COUNTSと異なります。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# データトリムリストの項目数が COLUMN_COUNTS と一致しているか確認
if [[ "${#_data_trim[@]}" -ne "${COLUMN_COUNTS}" ]]; then
    echo "[220117]エラー: COLUMN_DATA_TRIMの項目数がCOLUMN_COUNTSと異なります。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220117]エラー: COLUMN_DATA_TRIMの項目数がCOLUMN_COUNTSと異なります。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# データ負数有無リストの項目数が COLUMN_COUNTS と一致しているか確認
if [[ "${#_data_signed[@]}" -ne "${COLUMN_COUNTS}" ]]; then
    echo "[220118]エラー: COLUMN_DATA_SIGNEDの項目数がCOLUMN_COUNTSと異なります。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220118]エラー: COLUMN_DATA_SIGNEDの項目数がCOLUMN_COUNTSと異なります。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# COLUMN_DATA_TYPE のサポートされているデータタイプを確認
_valid_data_types=("byte" "short" "int" "long" "float" "double" "char" "string" "boolean" "date")
for _type in "${_data_types[@]}"; do
    if [[ ! " ${_valid_data_types[@]} " =~ " ${_type} " ]]; then
        echo "[220119]エラー: 無効なデータタイプ${_type}が指定されています。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220119]エラー: 無効なデータタイプ${_type}が指定されています。" >> ${LOG_DIR}data_generator.log
        exit 1
    fi
done

# COLUMN_DATA_TRIM のサポートされているデータトリムを確認
_valid_trim_types=("NONE" "FT" "BT" "ft" "bt")
for _type in "${_data_trim[@]}"; do
    # NONE であればスキップ
    if [[ "${_type}" == "NONE" ]]; then
        continue
    fi
    
    # FT, BT, ft, bt のいずれかを含んでいるかチェック
    if [[ ! "${_type}" =~ (FT|BT|ft|bt) ]]; then
        echo "[220120]エラー: 無効なトリム${_type}が指定されています。'NONE' または 'FT', 'BT', 'ft', 'bt' を含む文字列を指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220120]エラー: 無効なトリム${_type}が指定されています。'NONE' または 'FT', 'BT', 'ft', 'bt' を含む文字列を指定してください。" >> ${LOG_DIR}data_generator.log
        exit 1
    fi
done

# COLUMN_DATA_SIGNED のサポートされているデータ負数有無を確認
_valid_signed_types=("0" "1")
for _type in "${_data_signed[@]}"; do
    if [[ ! " ${_valid_signed_types[@]} " =~ " ${_type} " ]]; then
        echo "[220121]エラー: 無効な値${_type}が指定されています。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220121]エラー: 無効な値${_type}が指定されています。" >> ${LOG_DIR}data_generator.log
        exit 1
    fi
done

# SIGN_DIGIT の値を検証
if [[ "${SIGN_DIGIT}" != "0" && "${SIGN_DIGIT}" != "1" ]]; then
    echo "[220122]エラー: SIGN_DIGITは「0」または「1」を指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220122]エラー: SIGN_DIGITは「0」または「1」を指定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# DATE_SEPARATOR の値を検証
if [[ "${DATE_SEPARATOR}" != "NONE" && "${DATE_SEPARATOR}" != "/" && "${DATE_SEPARATOR}" != "-" ]]; then
    echo "[220123]エラー: 無効な日付区切り文字です。「/」、「-」、または「NONE」を指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220123]エラー: 無効な日付区切り文字です。「/」、「-」、または「NONE」を指定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# TIME_SEPARATOR の値を検証
if [[ "${TIME_SEPARATOR}" != "NONE" && "${TIME_SEPARATOR}" != ":" ]]; then
    echo "[220124]エラー: 無効な時間区切り文字です。「:」または「NONE」を指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220124]エラー: 無効な時間区切り文字です。「:」または「NONE」を指定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# SEPARATOR_DATE_TIME の値を検証
if [[ "${SEPARATOR_DATE_TIME}" != "NONE" && "${SEPARATOR_DATE_TIME}" != "SPACE" ]]; then
    echo "[220125]エラー: 無効な日付・時間区切り文字です。「NONE」または「SPACE」を指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220125]エラー: 無効な日付・時間区切り文字です。「NONE」または「SPACE」を指定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# REFERENCE_DATE の値を検証
if [[ "${REFERENCE_DATE}" != "NONE" ]]; then
    if date --version >/dev/null 2>&1; then
        # GNU date (Linux)
        if ! date -d "%Y/%m/%d" "${REFERENCE_DATE}" &>/dev/null; then
            echo "[220126]エラー: 無効な日付です。${REFERENCE_DATE}は無効な日付です。(GNU date (Linux))"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220126]エラー: 無効な日付です。${REFERENCE_DATE}は無効な日付です。(GNU date (Linux))" >> ${LOG_DIR}data_generator.log
            exit 1
        fi
    else
        # BSD/macOS date
        if ! date -j -f "%Y/%m/%d" "${REFERENCE_DATE}" &>/dev/null; then
            echo "[220127]エラー: 無効な日付です。${REFERENCE_DATE}は無効な日付です。(BSD/macOS date)"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220127]エラー: 無効な日付です。${REFERENCE_DATE}は無効な日付です。(BSD/macOS date)" >> ${LOG_DIR}data_generator.log
            exit 1
        fi
    fi
fi

# CASE_MODE の値を検証
if [[ "${CASE_MODE}" != "NONE" && "${CASE_MODE}" != "UPPER" && "${CASE_MODE}" != "LOWER" ]]; then
    echo "[220128]エラー: 無効なCASE_MODEの値です。「UPPER」「LOWER」「NONE」のいずれかを指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220128]エラー: 無効なCASE_MODEの値です。「UPPER」「LOWER」「NONE」のいずれかを指定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# MULTIBYTE_STRING の値を検証
if ! [[ ${#MULTIBYTE_STRING} -eq 1 && $(printf "%s" "${MULTIBYTE_STRING}" | wc -c | tr -d ' ') -gt 1 ]]; then
    echo "[220129]エラー: マルチバイトの1文字を設定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220129]エラー: マルチバイトの1文字を設定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# COLUMN_DATA_LENGTH の値を検証
for _i in "${!_data_types[@]}"; do
    _type="${_data_types[$_i]}"
    _length="${_data_lengths[$_i]}"
    _trim="${_data_trim[$_i]}"
    _signed="${_data_signed[$_i]}"
    _item_number=$((_i + 1)) # 配列インデックスを1から始める
    case "${_type}" in
        # 文字型タイプの検証
        char)
            # 桁数の検証
            if [[ ! "${_length}" =~ ^[0-9]+$ || "${_length}" -lt 1 ]]; then
                echo "[220130]エラー: 第${_item_number}項目 - データ型 charの設定桁数は${_length}です。1以上の整数を指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220130]エラー: 第${_item_number}項目 - データ型 charの設定桁数は${_length}です。1以上の整数を指定してください。" >> ${LOG_DIR}data_generator.log
                exit 1
            fi
            # _trim の値を検証し、_length の条件をチェック
            if [[ "${_trim}" =~ "FT" || "${_trim}" =~ "BT" ]]; then
                if [[ "${_length}" -lt 3 ]]; then
                    echo "[220131]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220131]エラー: 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            elif [[ "${_trim}" =~ "ft" || "${_trim}" =~ "bt" ]]; then
                if [[ "${_length}" -lt 2 ]]; then
                    echo "[220132]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220132]エラー: 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            fi
            ;;
        string)
            # 桁数の検証
            if [[ ! "${_length}" =~ ^[0-9]+$ || "${_length}" -lt 1 ]]; then
                echo "[220133]エラー: 第${_item_number}項目 - データ型 stringの設定桁数は${_length}です。1以上の整数を指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220133]エラー: 第${_item_number}項目 - データ型 stringの設定桁数は${_length}です。1以上の整数を指定してください。" >> ${LOG_DIR}data_generator.log
                exit 1
            fi
            # _trim の値を検証し、_length の条件をチェック
            if [[ "${_trim}" =~ "FT" || "${_trim}" =~ "BT" ]]; then
                if [[ "${_length}" -lt 3 ]]; then
                    echo "[220134]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220134]エラー: 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            elif [[ "${_trim}" =~ "ft" || "${_trim}" =~ "bt" ]]; then
                if [[ "${_length}" -lt 2 ]]; then
                    echo "[220135]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220135]エラー: 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            fi
            ;;
        # 論理型タイプの検証
        boolean)
            # 桁数の検証
            if ! [[ "${_length}" =~ ^[0-2]+$ ]]; then
                echo "[220136]エラー: 第${_item_number}項目 - データ型 booleanの設定桁数は${_length}です。常に'0'または'1'または'2'でなければなりません。"
                echo "許容範囲：0(false)または1(true)または2(random)"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220136]エラー: 第${_item_number}項目 - データ型 booleanの設定桁数は${_length}です。常に'0'または'1'または'2'でなければなりません。" >> ${LOG_DIR}data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：0(false)または1(true)または2(random)" >> ${LOG_DIR}data_generator.log
                exit 1
            fi
            ;;
        # 日付タイプの検証
        date)
            # 桁数の検証
            if ! [[ "${_length}" =~ ^(Y{4}|Y{2}|Y{0})(M{2}|M{1}|M{0})(D{2}|D{1}|D{0})(H{2}|h{2}|h{1}|h{0})(m{2}|m{1}|m{0})(s{2}|s{1}|s{0})$ ]]; then
                echo "[220137]エラー: 第${_item_number}項目 - データ型 dateの設定桁数は${_length}です。'YYYYMMDDhhmmss','YYMMDDhhmmss','YYYY','YY'などの形式で指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220137]エラー: 第${_item_number}項目 - データ型 dateの設定桁数は${_length}です。'YYYYMMDDhhmmss','YYMMDDhhmmss','YYYY','YY'などの形式で指定してください。" >> ${LOG_DIR}data_generator.log
                exit 1
            fi
            ;;
        # 整数型タイプの検証
        byte)
            # 桁数の検証
            if [[ ! "${_length}" =~ ^[0-9]+$ || "${_length}" -lt 1 ]]; then
                echo "[220138]エラー: 第${_item_number}項目 - データ型 byteの設定桁数は${_length}です。1以上の整数を指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220138]エラー: 第${_item_number}項目 - データ型 byteの設定桁数は${_length}です。1以上の整数を指定してください。" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_length}" -gt 3 ]]; then
                echo "[220139]エラー: 第${_item_number}項目 - データ型 byteの長さ${_length}は最大3桁までしか指定できません。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220139]エラー: 第${_item_number}項目 - データ型 byteの長さ${_length}は最大3桁までしか指定できません。" >> ${LOG_DIR}data_generator.log
                if [[ "${_signed}" = 0 ]]; then 
                    echo "許容範囲：( 0 ~ 255 )：最大3桁"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( 0 ~ 255 )：最大3桁" >> ${LOG_DIR}data_generator.log
                else
                    echo "許容範囲：( -128 ~ 127 )：最大3桁"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( -128 ~ 127 )：最大3桁" >> ${LOG_DIR}data_generator.log
                fi
                exit 1
            fi
            
            # _trim の値を検証し、_length の条件をチェック
            if [[ "${_trim}" =~ "FT" || "${_trim}" =~ "BT" ]]; then
                if [[ "${_length}" -lt 3 ]]; then
                    echo "[220140]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220140]エラー: 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            elif [[ "${_trim}" =~ "ft" || "${_trim}" =~ "bt" ]]; then
                if [[ "${_length}" -lt 2 ]]; then
                    echo "[220141]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220141]エラー: 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            fi

            if [[ "${_signed}" = 1 && "${SIGN_DIGIT}" = 1 ]]; then
                if [[ "${_trim}" =~ "ft" || "${_trim}" =~ "bt" ]]; then
                    if [[ "${_length}" -lt 3 ]]; then
                        echo "[220142]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。"
                        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220142]エラー: 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                        exit 1
                    fi
                fi
            fi
            ;;
        short)
            # 桁数の検証
            if [[ ! "${_length}" =~ ^[0-9]+$ || "${_length}" -lt 1 ]]; then
                echo "[220143]エラー: 第${_item_number}項目 - データ型 shortの設定桁数は${_length}です。1以上の整数を指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220143]エラー: 第${_item_number}項目 - データ型 shortの設定桁数は${_length}です。1以上の整数を指定してください。" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_length}" -gt 5 ]]; then
                echo "[220144]エラー: 第${_item_number}項目 - データ型 shortの長さ${_length}は最大5桁までしか指定できません。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220144]エラー: 第${_item_number}項目 - データ型 shortの長さ${_length}は最大5桁までしか指定できません。" >> ${LOG_DIR}data_generator.log
                if [[ "${_signed}" = 0 ]]; then 
                    echo "許容範囲：( 0 ~ 65,535 )：最大5桁"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( 0 ~ 65,535 )：最大5桁" >> ${LOG_DIR}data_generator.log
                else
                    echo "許容範囲：( -32,768 ~ 32,767 )：最大5桁"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( -32,768 ~ 32,767 )：最大5桁" >> ${LOG_DIR}data_generator.log
                fi
                exit 1
            fi
            # _trim の値を検証し、_length の条件をチェック
            if [[ "${_trim}" =~ "FT" || "${_trim}" =~ "BT" ]]; then
                if [[ "${_length}" -lt 3 ]]; then
                    echo "[220145]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220145]エラー: 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            elif [[ "${_trim}" =~ "ft" || "${_trim}" =~ "bt" ]]; then
                if [[ "${_length}" -lt 2 ]]; then
                    echo "[220146]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220146]エラー: 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            fi

            if [[ "${_signed}" = 1 && "${SIGN_DIGIT}" = 1 ]]; then
                if [[ "${_trim}" =~ "FT" || "${_trim}" =~ "BT" ]]; then
                    if [[ "${_length}" -lt 4 ]]; then
                        echo "[220147]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは4以上である必要があります。"
                        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220147]エラー: 「FT」または「BT」を指定した場合、_lengthは4以上である必要があります。" >> ${LOG_DIR}data_generator.log
                        exit 1
                    fi
                elif [[ "${_trim}" =~ "ft" || "${_trim}" =~ "bt" ]]; then
                    if [[ "${_length}" -lt 3 ]]; then
                        echo "[220148]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。"
                        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220148]エラー: 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                        exit 1
                    fi
                fi
            fi
            ;;
        int)
            # 桁数の検証
            if [[ ! "${_length}" =~ ^[0-9]+$ || "${_length}" -lt 1 ]]; then
                echo "[220149]エラー: 第${_item_number}項目 - データ型 intの設定桁数は${_length}です。1以上の整数を指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220149]エラー: 第${_item_number}項目 - データ型 intの設定桁数は${_length}です。1以上の整数を指定してください。" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_length}" -gt 10 ]]; then
                echo "[220150]エラー: 第${_item_number}項目 - データ型 intの長さ${_length}は最大10桁までしか指定できません。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220150]エラー: 第${_item_number}項目 - データ型 intの長さ${_length}は最大10桁までしか指定できません。" >> ${LOG_DIR}data_generator.log
                if [[ "${_signed}" = 0 ]]; then 
                    echo "許容範囲：( 0 ~ 4,294,967,295 )：最大10桁"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( 0 ~ 4,294,967,295 )：最大10桁" >> ${LOG_DIR}data_generator.log
                else
                    echo "許容範囲：( -2,147,483,648 ~ 2,147,483,647 )：最大10桁"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( -2,147,483,648 ~ 2,147,483,647 )：最大10桁" >> ${LOG_DIR}data_generator.log
                fi
                exit 1
            fi
            # _trim の値を検証し、_length の条件をチェック
            if [[ "${_trim}" =~ "FT" || "${_trim}" =~ "BT" ]]; then
                if [[ "${_length}" -lt 3 ]]; then
                    echo "[220151]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220151]エラー: 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            elif [[ "${_trim}" =~ "ft" || "${_trim}" =~ "bt" ]]; then
                if [[ "${_length}" -lt 2 ]]; then
                    echo "[220152]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220152]エラー: 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            fi

            if [[ "${_signed}" = 1 && "${SIGN_DIGIT}" = 1 ]]; then
                if [[ "${_trim}" =~ "FT" || "${_trim}" =~ "BT" ]]; then
                    if [[ "${_length}" -lt 4 ]]; then
                        echo "[220153]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは4以上である必要があります。"
                        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220153]エラー: 「FT」または「BT」を指定した場合、_lengthは4以上である必要があります。" >> ${LOG_DIR}data_generator.log
                        exit 1
                    fi
                elif [[ "${_trim}" =~ "ft" || "${_trim}" =~ "bt" ]]; then
                    if [[ "${_length}" -lt 3 ]]; then
                        echo "[220154]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。"
                        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220154]エラー: 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                        exit 1
                    fi
                fi
            fi
            ;;
        long)
            # 桁数の検証
            if [[ ! "${_length}" =~ ^[0-9]+$ || "${_length}" -lt 1 ]]; then
                echo "[220155]エラー: 第${_item_number}項目 - データ型 longの設定桁数は${_length}です。1以上の整数を指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220155]エラー: 第${_item_number}項目 - データ型 longの設定桁数は${_length}です。1以上の整数を指定してください。" >> ${LOG_DIR}data_generator.log
                exit 1 
            elif [[ "${_signed}" = 0 && "${_length}" -gt 20 ]]; then
                echo "[220156]エラー: 第${_item_number}項目 - データ型 longの長さ${_length}は最大20桁までしか指定できません。(無符号：整数のみ)"
                echo "許容範囲：( 0 ~ 18,446,744,073,709,551,615 )：最大20桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220156]エラー: 第${_item_number}項目 - データ型 longの長さ${_length}は最大20桁までしか指定できません。(無符号：整数のみ)" >> ${LOG_DIR}data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( 0 ~ 18,446,744,073,709,551,615 )：最大20桁" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_signed}" = 1 && "${_length}" -gt 19 ]]; then
                echo "[220157]エラー: 第${_item_number}項目 - データ型 longの長さ${_length}は最大19桁までしか指定できません。(符号付き)"
                echo "許容範囲：( -9,223,372,036,854,775,808 ~ 9,223,372,036,854,775,807 )：最大19桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220157]エラー: 第${_item_number}項目 - データ型 longの長さ${_length}は最大19桁までしか指定できません。(符号付き)" >> ${LOG_DIR}data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( -9,223,372,036,854,775,808 ~ 9,223,372,036,854,775,807 )：最大19桁" >> ${LOG_DIR}data_generator.log
                exit 1
            fi
            # _trim の値を検証し、_length の条件をチェック
            if [[ "${_trim}" =~ "FT" || "${_trim}" =~ "BT" ]]; then
                if [[ "${_length}" -lt 3 ]]; then
                    echo "[220158]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220158]エラー: 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            elif [[ "${_trim}" =~ "ft" || "${_trim}" =~ "bt" ]]; then
                if [[ "${_length}" -lt 2 ]]; then
                    echo "[220159]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220159]エラー: 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            fi

            if [[ "${_signed}" = 1 && "${SIGN_DIGIT}" = 1 ]]; then
                if [[ "${_trim}" =~ "FT" || "${_trim}" =~ "BT" ]]; then
                    if [[ "${_length}" -lt 4 ]]; then
                        echo "[220160]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは4以上である必要があります。"
                        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220160]エラー: 「FT」または「BT」を指定した場合、_lengthは4以上である必要があります。" >> ${LOG_DIR}data_generator.log
                        exit 1
                    fi
                elif [[ "${_trim}" =~ "ft" || "${_trim}" =~ "bt" ]]; then
                    if [[ "${_length}" -lt 3 ]]; then
                        echo "[220161]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。"
                        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220161]エラー: 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                        exit 1
                    fi
                fi
            fi
            ;;
        # 浮動小数点型の検証
        float)
            # 実数であること確認
            if [[ ! "${_length}" =~ \. ]]; then
                echo "[220162]エラー: 第${_item_number}項目 - _lengthの値が無効です。小数点(.)を含める必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220162]エラー: _lengthの値が無効です。小数点(.)を含める必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            fi

            # 整数部と小数部を分離
            _integer_part=$(echo "${_length}" | cut -d'.' -f1) # 整数部
            _fractional_part=$(echo "${_length}" | cut -d'.' -f2) # 小数部

            # 整数部と小数部が数値かどうかを確認し、両方が1未満ならエラー
            if [[ ! "${_integer_part}" =~ ^[0-9]+$ || ! "${_fractional_part}" =~ ^[0-9]+$ ]]; then
                echo "[220163]エラー: 第${_item_number}項目 - _lengthの値が無効です。整数部および小数部には数値を指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220163]エラー: 第${_item_number}項目 - _lengthの値が無効です。整数部および小数部には数値を指定してください。" >> ${LOG_DIR}data_generator.log
                exit 1
            fi

            if [[ "${_integer_part}" -lt 1 && "${_fractional_part}" -lt 1 ]]; then
                echo "[220164]エラー: 第${_item_number}項目 - _lengthの値が無効です。整数部または小数部のいずれかが1以上である必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220164]エラー: _lengthの値が無効です。整数部または小数部のいずれかが1以上である必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            fi

            if [[ "${_integer_part}" -gt 38 ]]; then
                echo "[220165]エラー: 第${_item_number}項目 - データ型 float整数部の設定桁数は${_integer_part}です。最大38桁までしか指定できません。"
                echo "許容範囲：( ±1.17549e-38 ~ ±3.402823e+38 )：最大38桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220165]エラー: 第${_item_number}項目 - データ型 float整数部の設定桁数は${_integer_part}です。最大38桁までしか指定できません。" >> ${LOG_DIR}data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( ±1.17549e-38 ~ ±3.402823e+38 )：最大38桁" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_fractional_part}" -gt 7 ]]; then
                echo "[220166]エラー: 第${_item_number}項目 - データ型 float小数部の設定桁数は${_fractional_part}です。最大7桁までしか指定できません。"
                echo "許容範囲：( ±1.17549e-38 ~ ±3.402823e+38 )：最大7桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220166]エラー: 第${_item_number}項目 - データ型 float小数部の設定桁数は${_fractional_part}です。最大7桁までしか指定できません。" >> ${LOG_DIR}data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( ±1.17549e-38 ~ ±3.402823e+38 )：最大7桁" >> ${LOG_DIR}data_generator.log
                exit 1
            fi

            # _trim の値を検証し、_length の条件をチェック
            if [[ "${_trim}" =~ "FT" && "${_integer_part}" -lt 3 ]]; then
                echo "[220167]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220167]エラー: 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_trim}" =~ "BT" && "${_fractional_part}" -lt 3 ]]; then
                echo "[220168]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220168]エラー: 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_trim}" =~ "ft" && "${_integer_part}" -lt 2 ]]; then
                echo "[220169]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220169]エラー: 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_trim}" =~ "bt" &&"${_fractional_part}" -lt 2 ]]; then
                echo "[220170]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220170]エラー: 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            fi

            if [[ "${_signed}" = 1 && "${SIGN_DIGIT}" = 1 ]]; then
                if [[ "${_trim}" =~ "FT" && "${_integer_part}" -lt 4 ]]; then
                    echo "[220171]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは4以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220171]エラー: 「FT」または「BT」を指定した場合、_lengthは4以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                elif [[ "${_trim}" =~ "ft" && "${_integer_part}" -lt 3 ]]; then
                    echo "[220172]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220172]エラー: 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            fi
            ;;
        double)
            # 実数であること確認
            if [[ ! "${_length}" =~ \. ]]; then
                echo "[220173]エラー: 第${_item_number}項目 - _lengthの値が無効です。小数点(.)を含める必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220173]エラー: _lengthの値が無効です。小数点(.)を含める必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            fi

            # 整数部と小数部を分離
            _integer_part=$(echo "${_length}" | cut -d'.' -f1) # 整数部
            _fractional_part=$(echo "${_length}" | cut -d'.' -f2) # 小数部

            # 整数部と小数部が数値かどうかを確認し、両方が1未満ならエラー
            if [[ ! "${_integer_part}" =~ ^[0-9]+$ || ! "${_fractional_part}" =~ ^[0-9]+$ ]]; then
                echo "[220174]エラー: _lengthの値が無効です。整数部および小数部には数値を指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220174]エラー: _lengthの値が無効です。整数部および小数部には数値を指定してください。" >> ${LOG_DIR}data_generator.log
                exit 1
            fi

            if [[ "${_integer_part}" -lt 1 && "${_fractional_part}" -lt 1 ]]; then
                echo "[220175]エラー: _lengthの値が無効です。整数部または小数部のいずれかが1以上である必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220175]エラー: _lengthの値が無効です。整数部または小数部のいずれかが1以上である必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            fi

            if [[ "${_integer_part}" -gt 100 ]]; then
                echo "[220176]エラー: 第${_item_number}項目 - データ型 double整数部の設定桁数は${_integer_part}です。最大100桁までしか指定できません。"
                echo "許容範囲：( ±2.2250738585072014e-308 ~ ±1.7976931348623157e+308 )：最大100桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220176]エラー: 第${_item_number}項目 - データ型 double整数部の設定桁数は${_integer_part}です。最大100桁までしか指定できません。" >> ${LOG_DIR}data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( ±2.2250738585072014e-308 ~ ±1.7976931348623157e+308 )：最大100桁" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_fractional_part}" -gt 15 ]]; then
                echo "[220177]エラー: 第${_item_number}項目 - データ型 double小数部の設定桁数は${_fractional_part}です。最大15桁までしか指定できません。"
                echo "許容範囲：( ±2.2250738585072014e-308 ~ ±1.7976931348623157e+308 )：最大15桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220177]エラー: 第${_item_number}項目 - データ型 double小数部の設定桁数は${_fractional_part}です。最大15桁までしか指定できません。" >> ${LOG_DIR}data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] 許容範囲：( ±2.2250738585072014e-308 ~ ±1.7976931348623157e+308 )：最大15桁" >> ${LOG_DIR}data_generator.log
                exit 1
            fi

            # _trim の値を検証し、_length の条件をチェック
            if [[ "${_trim}" =~ "FT" && "${_integer_part}" -lt 3 ]]; then
                echo "[220178]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220178]エラー: 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_trim}" =~ "BT" && "${_fractional_part}" -lt 3 ]]; then
                echo "[220179]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220179]エラー: 「FT」または「BT」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_trim}" =~ "ft" && "${_integer_part}" -lt 2 ]]; then
                echo "[220180]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220180]エラー: 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            elif [[ "${_trim}" =~ "bt" &&"${_fractional_part}" -lt 2 ]]; then
                echo "[220181]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220181]エラー: 「ft」または「bt」を指定した場合、_lengthは2以上である必要があります。" >> ${LOG_DIR}data_generator.log
                exit 1
            fi

            if [[ "${_signed}" = 1 && "${SIGN_DIGIT}" = 1 ]]; then
                if [[ "${_trim}" =~ "FT" && "${_integer_part}" -lt 4 ]]; then
                    echo "[220182]エラー: 第${_item_number}項目 - 「FT」または「BT」を指定した場合、_lengthは4以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220182]エラー: 「FT」または「BT」を指定した場合、_lengthは4以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                elif [[ "${_trim}" =~ "ft" && "${_integer_part}" -lt 3 ]]; then
                    echo "[220183]エラー: 第${_item_number}項目 - 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。"
                    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220183]エラー: 「ft」または「bt」を指定した場合、_lengthは3以上である必要があります。" >> ${LOG_DIR}data_generator.log
                    exit 1
                fi
            fi
            ;;
    esac
done

# 検証がすべて完了
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [220001]設定ファイルの内容問題なし。" >> ${LOG_DIR}data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}data_generator.log
echo "[220001]設定ファイルの内容問題なし。"
exit 0