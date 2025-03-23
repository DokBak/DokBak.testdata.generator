#!/bin/bash

###################################################################################
#
#  シェル名      : 日付データ生成シェル
#
#  作成者        : DokBak
#  作成日        : 2024/12/05          新規作成
#  修正日        : 2024/12/12          パラメータチェック追加
#                2025/03/24          コードリファクタリング
#
#  処理概要      : 指定された日付形式および日付を基準にランダムな日付や時間を生成する。
#
#  パラメータ    　:
#     パラメータ1 (必須) : 日付フォーマット (例: "%Y-%m-%d %H:%M:%S" または "%Y/%m/%d")
#     パラメータ2 (任意) : 基準日付 ("YYYY/MM/DD" の形式で指定)
#                      空白の場合、実行日を基準にする。
#
#  実行方法    　:
#     1. sh ./db_gen_date_data.sh "%Y-%m-%d %H:%M:%S"
#        実行例1：実行日を基準に生
#        出力例: 2024-12-31 07:01:40
#
#     2. sh ./db_gen_date_data.sh "%Y/%m/%d" "2024/12/06"
#        実行例2：指定された日付を基準に生成
#        出力例: 2024/12/06
#
#  参照        :　https://github.com/DokBak/DokBak_Shell_CMD
#
###################################################################################

echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}/data_generator.log

# パラメータの取得
_date_format=${1}
_base_date=${2:-$(date +"%Y/%m/%d")} # 空白の場合、実行日を基準日付として設定

# パラメータチェック：パラメータが2つ以上あるかを確認
if [[ ${#} -gt 2 ]]; then
    echo "[030101]エラー: 指定できるパラメータの数は最大2つまでです。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [030101]エラー: 指定できるパラメータの数は最大2つまでです。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

if [[ "${_date_format}" != *%* ]]; then
    echo "[030102]エラー: 日付フォーマットには「%」を含める必要があります。例: %Y/%m/%d"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [030102]エラー: 日付フォーマットには「%」を含める必要があります。例: %Y/%m/%d" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 入力フォーマットの確認 (YYYY/MM/DD または YYYY-MM-DD)
if [[ ! "${_base_date}" =~ ^[0-9]{4}[/-][0-9]{2}[/-][0-9]{2}$ ]]; then
    echo "[030103]エラー: パラメータ2は「YYYY/MM/DD」形式で指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [030103]エラー: パラメータ2は「YYYY/MM/DD」形式で指定してください。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 時間部分を生成するかどうかを確認
if [[ "${_date_format}" =~ "%H:%M:%S" ]]; then
    # ランダムな時間を生成 (00:00:00 ~ 23:59:59)
    _random_hour=$(printf "%02d" $((RANDOM % 24)))
    _random_minute=$(printf "%02d" $((RANDOM % 60)))
    _random_second=$(printf "%02d" $((RANDOM % 60)))
    _time_part="${_random_hour}:${_random_minute}:${_random_second}"
else
    _time_part=""
fi

# システムごとのdateコマンドの互換性を処理
if date --version >/dev/null 2>&1; then
    # GNU date (Linux)
    if [[ -n "${_time_part}" ]]; then
        _generated_data=$(date -d "${_base_date} ${_time_part}" +"${_date_format}" 2>/dev/null)
    else
        _generated_data=$(date -d "${_base_date}" +"${_date_format}" 2>/dev/null)
    fi
else
    # BSD/macOS date
    if [[ -n "${_time_part}" ]]; then
        _generated_data=$(date -j -f "%Y/%m/%d %H:%M:%S" "${_base_date} ${_time_part}" +"${_date_format}" 2>/dev/null)
    else
        _generated_data=$(date -j -f "%Y/%m/%d" "${_base_date}" +"${_date_format}" 2>/dev/null)
    fi
fi

# 日付生成の結果を確認
if [[ -z "${_generated_data}" ]]; then
    echo "[030104]エラー: 入力された日付またはフォーマットが無効です。日付の指定が誤っているか、フォーマットが正しくありません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [030104]エラー: 入力された日付またはフォーマットが無効です。日付の指定が誤っているか、フォーマットが正しくありません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 生成された日付を出力
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [030001]生成された日付: ${_generated_data}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}/data_generator.log
echo "${_generated_data}"
exit 0
