#!/bin/bash

###################################################################################
#
#  シェル名      : ランダム数字データ生成シェル
#
#  作成者        : DokBak
#  作成日        : 2024/12/05          新規作成
#  修正日        : 2024/12/12          パラメータチェック追加
#                2025/03/24          コードリファクタリング
#
#  処理概要      : 指定された整数部と小数部の桁数に基づいてランダムな数値を生成します。
#                 パラメータ1が0の場合、小数点以下のみの値を生成します。
#
#  パラメータ    　:
#     パラメータ1 (必須) : 整数部の桁数 (0を許容)
#     パラメータ2 (任意) : 小数部の桁数
#
#  実行方法    　: 
#     1. sh ./script/db_gen_string_data.sh 6
#        実行例1：整数のみを生成（パラメータ2なしの場合）
#        出力例: 872364
#     
#     2. sh ./script/db_gen_string_data.sh 0 2
#        実行例2：小数点以下のみを生成
#        出力例: 0.35
#
#     3. sh ./script/db_gen_string_data.sh 6 2
#        実行例3：整数部6桁、小数部2桁を生成
#        出力例: 123456.78
#
#     4. sh ./script/db_gen_string_data.sh 6 0
#        実行例4：整数のみを生成（パラメータ2が0の場合）
#        出力例: 492873
#
#  参照        :　https://github.com/DokBak/DokBak.testdata.generator
#
###################################################################################

echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}data_generator.log

# パラメータチェック：パラメータが2つ以上あるかを確認
if [[ ${#} -gt 2 ]]; then
    echo "[020101]エラー: 指定できるパラメータの数は最大2つまでです。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [020101]エラー: 指定できるパラメータの数は最大2つまでです。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# パラメータ1とパラメータ2が数字かどうかを確認
_item_length=${1}
_decimal_places=${2}

# パラメータ1が数字かどうかを確認 (0も許容)
if ! [[ "${_item_length}" =~ ^[0-9]+$ ]]; then
    echo "[020102]エラー: パラメータ1は0以上の整数でなければなりません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [020102]エラー: パラメータ1は0以上の整数でなければなりません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# パラメータ2が数字かどうかを確認
if [[ -n "${_decimal_places}" && ! "${_decimal_places}" =~ ^[0-9]+$ ]]; then
    echo "[020103]エラー: パラメータ2は数字でなければなりません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [020103]エラー: パラメータ2は数字でなければなりません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# パラメータ1が0かつパラメータ2が空白の場合はエラー
if [[ "${_item_length}" -eq 0 && -z "${_decimal_places}" ]]; then
    echo "[020104]エラー: 整数部が0の場合、小数部の桁数（パラメータ2）を指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [020104]エラー: 整数部が0の場合、小数部の桁数（パラメータ2）を指定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# 整数部と小数部の両方が0の場合は無効
if [[ "${_item_length}" -eq 0 && "${_decimal_places}" -eq 0 ]]; then
    echo "[020105]エラー: 整数部と小数部の桁数がどちらも0の場合、無効です。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [020105]エラー: 整数部と小数部の桁数がどちらも0の場合、無効です。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# パラメータ1が0の場合、小数点以下のみを生成
if [[ "${_item_length}" -eq 0 ]]; then
    _generated_data="0."
    for ((_i=1; _i<=${_decimal_places}; _i++)); do
        _random_digit=$((RANDOM % 10))  # 0から9のランダムな数字を生成
        _generated_data="${_generated_data}${_random_digit}"
    done
    # 小数部分の最後の桁が0にならないように修正
    if [[ "${_generated_data: -1}" -eq 0 ]]; then
        _generated_data="${_generated_data%0}$(($RANDOM % 9 + 1))"
    fi
    echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [020003]生成された小数: ${_generated_data}" >> ${LOG_DIR}data_generator.log
    echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}data_generator.log
    echo "${_generated_data}"
    exit 0

# パラメータ2が空白の場合、整数のみを生成
elif [[ -z "${_decimal_places}" || "${_decimal_places}" -eq 0 ]]; then
    _generated_data=""
    for ((_i=1; _i<=${_item_length}; _i++)); do
        _random_digit=$((RANDOM % 10))  # 0から9のランダムな数字を生成
        if [[ ${_i} -eq 1 && ${_random_digit} -eq 0 ]]; then
            _random_digit=$((RANDOM % 9 + 1))  # 最初の桁が0の場合は1から9までの数字で再生成
        fi
        _generated_data="${_generated_data}${_random_digit}"
    done
    echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [020002]生成された整数: ${_generated_data}" >> ${LOG_DIR}data_generator.log
    echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}data_generator.log
    echo "${_generated_data}"
    exit 0

# 整数部と小数部を生成
else
    _generated_data=""
    for ((_i=1; _i<=${_item_length}; _i++)); do
        _random_digit=$((RANDOM % 10))  # 0から9のランダムな数字を生成
        if [[ ${_i} -eq 1 && ${_random_digit} -eq 0 ]]; then
            _random_digit=$((RANDOM % 9 + 1))  # 最初の桁が0の場合は1から9までの数字で再生成
        fi
        _generated_data="${_generated_data}${_random_digit}"
    done
    _generated_data="${_generated_data}."
    for ((_i=1; _i<=${_decimal_places}; _i++)); do
        _random_digit=$((RANDOM % 10))
        _generated_data="${_generated_data}${_random_digit}"
    done
    # 小数部分の最後の桁が0にならないように修正
    if [[ "${_generated_data: -1}" -eq 0 ]]; then
        _generated_data="${_generated_data%0}$(($RANDOM % 9 + 1))"
    fi
    echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [020001]生成された実数: ${_generated_data}" >> ${LOG_DIR}data_generator.log
    echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}data_generator.log
    echo "${_generated_data}"
    exit 0
fi