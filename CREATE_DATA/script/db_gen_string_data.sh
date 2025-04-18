#!/bin/sh

###################################################################################
#
#  シェル名      : ランダム文字列データ生成シェル
#
#  作成者        : DokBak
#  作成日        : 2024/12/04          新規作成
#  修正日        : 2024/12/12          パラメータチェック追加
#                2024/12/13          安全性と可読性の向上
#                2025/03/24          コードリファクタリング
#
#  処理概要      : ランダムな文字列を生成するシェルスクリプト。大文字・小文字のオプションに基づき文字列を生成します。
#
#  パラメータ    　:
#     パラメータ1 (必須) : 生成する文字列の長さ (0より大きい整数)
#     パラメータ2 (必須) : 大文字小文字オプション ('UPPER', 'LOWER', 'upper', 'lower', 'U', 'L', 'u', 'l', 空白の場合は大文字小文字混在)
#
#  実行方法    　: 
#     1. sh ./script/db_gen_string_data.sh 7 upper
#        実行例1：# 大文字のみ出力 (長さ 7)
#        結果: QWERTYU
#
#     2. sh ./script/db_gen_string_data.sh 8 lower
#        実行例2：小文字のみ出力 (長さ 8)
#        結果: abcdefgx
#
#     3. sh ./script/db_gen_string_data.sh 10
#        実行例3：大文字小文字混在 (長さ 10)
#        結果: aBcDeFgHkL
#
#  参照        :　https://github.com/DokBak/DokBak.testdata.generator
#
###################################################################################

echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}data_generator.log

# パラメータ1とパラメータ2の取得
_item_length=${1}  # 生成する文字列の長さ
_option=${2:-mixed} # 空白の場合は "mixed" に設定

# パラメータチェック：パラメータが2つ以上あるかを確認
if [[ ${#} -gt 2 ]]; then
    echo "[010101]エラー: 指定できるパラメータの数は最大2つまでです。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [010101]エラー: 指定できるパラメータの数は最大2つまでです。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# パラメータの検証
if ! [[ "${_item_length}" =~ ^[0-9]+$ ]] || [ "${_item_length}" -le 0 ]; then
    echo "[010102]エラー: パラメータ1は1以上の整数でなければなりません。"
    echo "実行例: sh ./db_gen_string_data.sh 10 " > /dev/null
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [010102]エラー: パラメータ1は1以上の整数でなければなりません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

if ! [[ "${_option}" =~ ^(NONE|UPPER|LOWER|upper|lower|U|L|u|l)$ ]]; then
    echo "[010201]ワーニング: パラメータ2が「'NONE','UPPER','upper','U','u'」(大文字のみデータ),「'LOWER','lower','L','l'」(小文字のみデータ),以外文字列は大・小文字混在データ"
    echo "実行例: sh ./db_gen_string_data.sh 10 u" > /dev/null
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [010201]ワーニング: パラメータ2が「'NONE','UPPER','upper','U','u'」(大文字のみデータ),「'LOWER','lower','L','l'」(小文字のみデータ),以外文字列は大・小文字混在データ" >> ${LOG_DIR}data_generator.log
fi

# 生成された文字列を格納する変数
_generated_data=""

# 指定された長さだけランダム文字を生成
for ((_i=1; _i<=${_item_length}; _i++)); do
    case "${_option}" in
        UPPER|upper|U|u)  # 大文字のみ
            _randomAscii=$((RANDOM % 26 + 65))
            ;;
        LOWER|lower|L|l)  # 小文字のみ
            _randomAscii=$((RANDOM % 26 + 97))
            ;;
        *)  # 大文字小文字混在
            if ((RANDOM % 2 == 0)); then
                _randomAscii=$((RANDOM % 26 + 65))
            else
                _randomAscii=$((RANDOM % 26 + 97))
            fi
            ;;
    esac
    _randomChar=$(printf \\$(printf '%03o' ${_randomAscii}))
    _generated_data+=${_randomChar}
done

# 生成された文字列を出力
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [010001]生成された文字列: ${_generated_data}" >> ${LOG_DIR}data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}data_generator.log
echo "${_generated_data}"
exit 0