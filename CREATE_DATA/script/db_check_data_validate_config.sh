#!/bin/bash

###################################################################################
#
#  シェル名      : 設定ファイルチェックシェル
#
#  作成者        : DokBak
#  作成日        : 2024/12/12          新規作成
#
#  処理概要      : db_data_config.txt の内容をチェックし、必要な設定値の有効性を確認します。
#
#  パラメータ    　:
#     なし
#
#  実行方法    　:
#     sh ./db_check_data_validate_config.sh
#
#  参照        :　https://github.com/DokBak/DokBak_Shell_CMD
#
###################################################################################

echo "設定ファイルの有効性チェックを実行中..."
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}/data_generator.log

# 設定ファイルのパス
_config_file="${CONFIG_DIR}/db_data_config.txt"

# 設定ファイルの存在確認
if [ ! -f "${_config_file}" ]; then
    echo "[220101]エラー: 設定ファイル ${_config_file} が存在しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220101]エラー: 設定ファイル ${_config_file} が存在しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# COLUMN_COUNTS の確認
if [[ -z "${COLUMN_COUNTS}" ]] || ! [[ "${COLUMN_COUNTS}" =~ ^[0-9]+$ ]]; then
    echo "[220102]エラー: COLUMN_COUNTS は正の整数で指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220102]エラー: COLUMN_COUNTS は正の整数で指定してください。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# COLUMN_COUNTS が 1 以上であることを確認
if [ "${COLUMN_COUNTS}" -lt 1 ]; then
    echo "[220103]エラー: COLUMN_COUNTS は 1 以上でなければなりません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220103]エラー: COLUMN_COUNTS は 1 以上でなければなりません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# COLUMN_DATA_TYPE と COLUMN_DATA_LENGTH が空でないことを確認
if [[ -z "${COLUMN_DATA_TYPE}" || -z "${COLUMN_DATA_LENGTH}" ]]; then
    echo "[220104]エラー: COLUMN_DATA_TYPE または COLUMN_DATA_LENGTH が空です。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220104]エラー: COLUMN_DATA_TYPE または COLUMN_DATA_LENGTH が空です。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# データ型と長さの項目数が COLUMN_COUNTS と一致しているか確認
IFS=',' read -ra DATA_TYPES <<< "${COLUMN_DATA_TYPE//\"/}"
IFS=',' read -ra DATA_LENGTHS <<< "${COLUMN_DATA_LENGTH//\"/}"

if [ "${#DATA_TYPES[@]}" -ne "${COLUMN_COUNTS}" ]; then
    echo "[220105]エラー: COLUMN_DATA_TYPE の項目数が COLUMN_COUNTS と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220105]エラー: COLUMN_DATA_TYPE の項目数が COLUMN_COUNTS と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

if [ "${#DATA_LENGTHS[@]}" -ne "${COLUMN_COUNTS}" ]; then
    echo "[220106]エラー: COLUMN_DATA_LENGTH の項目数が COLUMN_COUNTS と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220106]エラー: COLUMN_DATA_LENGTH の項目数が COLUMN_COUNTS と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# COLUMN_DATA_TYPE のサポートされているデータ型を確認
_valid_data_types=("byte" "short" "int" "long" "float" "double" "char" "string" "boolean" "date")
for _type in "${DATA_TYPES[@]}"; do
    if [[ ! " ${_valid_data_types[@]} " =~ " ${_type} " ]]; then
        echo "[220107]エラー: 無効なデータ型 ${_type} が指定されています。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220107]エラー: 無効なデータ型 ${_type} が指定されています。" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
done

# COLUMN_DATA_LENGTH の値を検証
for _i in "${!DATA_TYPES[@]}"; do
    _type="${DATA_TYPES[$_i]}"
    _length="${DATA_LENGTHS[$_i]}"
    _item_number=$((_i + 1)) # 配列インデックスを1から始める

    case "${_type}" in
        # 整数型タイプの検証
        byte)
            if ! [[ "${_length}" =~ ^[0-9]+$ ]]; then
                echo "[220108]エラー: 第${_item_number}項目 - データ型 byte の長さ ${_length} は無効です。整数のみを指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220108]エラー: 第${_item_number}項目 - データ型 byte の長さ ${_length} は無効です。整数のみを指定してください。" >> ${LOG_DIR}/data_generator.log
                exit 1
            elif [ "${_length}" -gt 3 ]; then
                echo "[220109]エラー: 第${_item_number}項目 - データ型 byte の長さ ${_length} は最大 3 桁までしか指定できません。"
                echo "許容範囲：( 0 ~ 255 )：最大3桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220109]エラー: 第${_item_number}項目 - データ型 byte の長さ ${_length} は最大 3 桁までしか指定できません。" >> ${LOG_DIR}/data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許容範囲：( 0 ~ 255 )：最大3桁" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
            ;;
        short)
            if ! [[ "${_length}" =~ ^[0-9]+$ ]]; then
                echo "[220110]エラー: 第${_item_number}項目 - データ型 short の長さ ${_length} は無効です。整数のみを指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220110]エラー: 第${_item_number}項目 - データ型 short の長さ ${_length} は無効です。整数のみを指定してください。" >> ${LOG_DIR}/data_generator.log
                exit 1
            elif [ "${_length}" -gt 5 ]; then
                echo "[220111]エラー: 第${_item_number}項目 - データ型 short の長さ ${_length} は最大 5 桁までしか指定できません。"
                echo "許容範囲：( -32,768 ~ 32,767 )：最大5桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220111]エラー: 第${_item_number}項目 - データ型 short の長さ ${_length} は最大 5 桁までしか指定できません。" >> ${LOG_DIR}/data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許容範囲：( -32,768 ~ 32,767 )：最大5桁" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
            ;;
        int)
            if ! [[ "${_length}" =~ ^[0-9]+$ ]]; then
                echo "[220112]エラー: 第${_item_number}項目 - データ型 int の長さ ${_length} は無効です。整数のみを指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220112]エラー: 第${_item_number}項目 - データ型 int の長さ ${_length} は無効です。整数のみを指定してください。" >> ${LOG_DIR}/data_generator.log
                exit 1
            elif [ "${_length}" -gt 10 ]; then
                echo "[220113]エラー: 第${_item_number}項目 - データ型 int の長さ ${_length} は最大 10 桁までしか指定できません。"
                echo "許容範囲：( -2,147,483,648 ~ 2,147,483,647 )：最大10桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220113]エラー: 第${_item_number}項目 - データ型 int の長さ ${_length} は最大 10 桁までしか指定できません。" >> ${LOG_DIR}/data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許容範囲：( -2,147,483,648 ~ 2,147,483,647 )：最大10桁" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
            ;;
        long)
            if ! [[ "${_length}" =~ ^[0-9]+$ ]]; then
                echo "[220114]エラー: 第${_item_number}項目 - データ型 long の長さ ${_length} は無効です。整数のみを指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220114]エラー: 第${_item_number}項目 - データ型 long の長さ ${_length} は無効です。整数のみを指定してください。" >> ${LOG_DIR}/data_generator.log
                exit 1 
            elif [ "${_length}" -gt 19 ]; then
                echo "[220115]エラー: 第${_item_number}項目 - データ型 long の長さ ${_length} は最大 19 桁までしか指定できません。"
                echo "許容範囲：( -9,223,372,036,854,775,808 ~ 9,223,372,036,854,775,807 )：最大19桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220115]エラー: 第${_item_number}項目 - データ型 long の長さ ${_length} は最大 19 桁までしか指定できません。" >> ${LOG_DIR}/data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許容範囲：( -9,223,372,036,854,775,808 ~ 9,223,372,036,854,775,807 )：最大19桁" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
            ;;
        # 浮動小数点型の検証
        float)
            # 整数部と小数部を分離
            _integer_part=$(echo "${_length}" | cut -d'.' -f1) # 整数部
            _fractional_part=$(echo "${_length}" | cut -d'.' -f2) # 小数部

            if [ -z "${_integer_part}" ] || ! [[ "${_integer_part}" =~ ^[0-9]+$ ]] || 
               ([ -n "${_fractional_part}" ] && ! [[ "${_fractional_part}" =~ ^[0-9]+$ ]]); then
                echo "[220122]エラー: 第${_item_number}項目 - データ型 float の長さ ${_length} は無効です。整数または '整数.小数' の形式で指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220122]エラー: 第${_item_number}項目 - データ型 float の長さ ${_length} は無効です。整数または '整数.小数' の形式で指定してください。" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi

            _total_length=$(( ${_integer_part} + ${_fractional_part} ))

            if [ "${_total_length}" -gt 7 ]; then
                echo "[220123]エラー: 第${_item_number}項目 - データ型 float の長さ ${_length} は最大 7 桁までしか指定できません。"
                echo "許容範囲：( ±1.17549e-38 ~ ±3.402823e+38 )：最大7桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220123]エラー: 第${_item_number}項目 - データ型 float の長さ ${_length} は最大 7 桁までしか指定できません。" >> ${LOG_DIR}/data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許容範囲：( ±1.17549e-38 ~ ±3.402823e+38 )：最大7桁" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
            ;;
        double)
            _integer_part=$(echo "${_length}" | cut -d'.' -f1)
            _fractional_part=$(echo "${_length}" | cut -d'.' -f2)

            if [ -z "${_integer_part}" ] || ! [[ "${_integer_part}" =~ ^[0-9]+$ ]] || 
               ([ -n "${_fractional_part}" ] && ! [[ "${_fractional_part}" =~ ^[0-9]+$ ]]); then
                echo "[220124]エラー: 第${_item_number}項目 - データ型 double の長さ ${_length} は無効です。整数または '整数.小数' の形式で指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220124]エラー: 第${_item_number}項目 - データ型 double の長さ ${_length} は無効です。整数または '整数.小数' の形式で指定してください。" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi

            _total_length=$(( ${_integer_part} + ${_fractional_part} ))

            if [ "${_total_length}" -gt 15 ]; then
                echo "[220125]エラー: 第${_item_number}項目 - データ型 double の長さ ${_length} は最大 15 桁までしか指定できません。"
                echo "許容範囲：( ±2.2250738585072014e-308 ~ ±1.7976931348623157e+308 )：最大15桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220125]エラー: 第${_item_number}項目 - データ型 double の長さ ${_length} は最大 15 桁までしか指定できません。" >> ${LOG_DIR}/data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許容範囲：( ±2.2250738585072014e-308 ~ ±1.7976931348623157e+308 )：最大15桁" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
            ;;
        # 文字型タイプの検証
        char)
            if ! [[ "${_length}" =~ ^[0-9]+$ ]]; then
                echo "[220116]エラー: 第${_item_number}項目 - データ型 char の長さ ${_length} は無効です。整数のみを指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220116]エラー: 第${_item_number}項目 - データ型 char の長さ ${_length} は無効です。整数のみを指定してください。" >> ${LOG_DIR}/data_generator.log
                exit 1
            elif [ "${_length}" -ne 1 ]; then
                echo "[220117]エラー: 第${_item_number}項目 - データ型 char の長さ ${_length} は常に 1 桁である必要があります。"
                echo "許容範囲：最大1桁"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220117]エラー: 第${_item_number}項目 - データ型 char の長さ ${_length} は常に 1 桁である必要があります。" >> ${LOG_DIR}/data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許容範囲：最大1桁" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
            ;;
        string)
            if ! [[ "${_length}" =~ ^[0-9]+$ ]]; then
                echo "[220118]エラー: 第${_item_number}項目 - データ型 string の長さ ${_length} は無効です。整数のみを指定してください。"
                echo "許容範囲：制限なし"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220118]エラー: 第${_item_number}項目 - データ型 string の長さ ${_length} は無効です。整数のみを指定してください。" >> ${LOG_DIR}/data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許容範囲：制限なし" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
            ;;
        # その他のデータ型 (boolean, date など) の検証はそのまま維持
        boolean)
            if [ "${_length}" -ne 1 ]; then
                echo "[220119]エラー: 第${_item_number}項目 - データ型 boolean の長さは常に '1' でなければなりません。"
                echo "許容範囲：固定値(1)"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220119]エラー: 第${_item_number}項目 - データ型 boolean の長さは常に '1' でなければなりません。" >> ${LOG_DIR}/data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許容範囲：固定値(1)" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
            ;;
        date)
            if ! [[ "${_length}" =~ ^(Y{4}|Y{2}|Y{0})(M{2}|M{0})(D{2}|D{0})(h{2}|h{0})(m{2}|m{0})(s{2}|s{0})$ ]]; then
                echo "[220120]エラー: 第${_item_number}項目 - データ型 date の長さ ${_length} は 'YYYYMMDDhhmmss', 'YYMMDDhhmmss', 'YYYY', 'YY' などの形式で指定してください。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220120]エラー: 第${_item_number}項目 - データ型 date の長さ ${_length} は 'YYYYMMDDhhmmss', 'YYMMDDhhmmss', 'YYYY', 'YY' などの形式で指定してください。" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
            ;;
        *)
            echo "[220121]エラー: 第${_item_number}項目 - 不明なデータ型 ${_type} が指定されています。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220121]エラー: 第${_item_number}項目 - 不明なデータ型 ${_type} が指定されています。" >> ${LOG_DIR}/data_generator.log
            exit 1
            ;;
    esac
done

# DATE_SEPARATOR の値を検証
if [[ "${DATE_SEPARATOR}" != "-" && "${DATE_SEPARATOR}" != "/" && "${DATE_SEPARATOR}" != " " ]]; then
    echo "[220122]エラー: 無効な日付区切り文字です。- / または空白のみが許可されます。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220122]エラー: 無効な日付区切り文字です。- / または空白のみが許可されます。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# TIME_SEPARATOR の値を検証
if [[ "${TIME_SEPARATOR}" != ":" && "${TIME_SEPARATOR}" != " " ]]; then
    echo "[220123]エラー: 無効な時間区切り文字です。: または空白のみが許可されます。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220123]エラー: 無効な時間区切り文字です。: または空白のみが許可されます。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# DATE_TIME_SEPARATOR の値を検証
if [[ -n "${DATE_TIME_SEPARATOR}" && "${DATE_TIME_SEPARATOR}" != " " ]]; then
    echo "[220124]エラー: 空白または空文字のみが許可されます。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220124]エラー: 空白または空文字のみが許可されます。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# REFERENCE_DATE の値を検証
if date --version >/dev/null 2>&1; then
    # GNU date (Linux)
    if ! date -d "%Y/%m/%d" "${REFERENCE_DATE}" &>/dev/null; then
        echo "[220125]エラー: 無効な日付です。${REFERENCE_DATE} は無効な日付です。(GNU date (Linux))"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220125]エラー: 無効な日付です。${REFERENCE_DATE} は無効な日付です。(GNU date (Linux))" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
else
    # BSD/macOS date
    if ! date -j -f "%Y/%m/%d" "${REFERENCE_DATE}" &>/dev/null; then
        echo "[220126]エラー: 無効な日付です。${REFERENCE_DATE} は無効な日付です。(BSD/macOS date)"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220126]エラー: 無効な日付です。${REFERENCE_DATE} は無効な日付です。(BSD/macOS date)" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
fi

# CASE_MODE の値を検証
if [[ "${CASE_MODE}" != "UPPER" && "${CASE_MODE}" != "LOWER" && "${CASE_MODE}" != " " ]]; then
    echo "[220127]エラー: 無効な CASE_MODE の値です。許可されている値は 'UPPER', 'LOWER', または空白のみです。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [220127]エラー: 無効な CASE_MODE の値です。許可されている値は 'UPPER', 'LOWER', または空白のみです。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 検証がすべて完了
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [220001]設定ファイルの内容問題なし。" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}/data_generator.log
echo "[220001]設定ファイルの内容問題なし。"
exit 0