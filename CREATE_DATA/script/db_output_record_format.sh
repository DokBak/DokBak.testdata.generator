#!/bin/bash

###################################################################################
#
#  シェル名      : データフォーマット変更シェル
#
#  作成者        : DokBak
#  作成日        : 2025/01/02          新規作成
#
#  処理概要      : 単一のデータ文字列を、指定の区切り文字および囲み文字でフォーマットして出力します。
#                 全体の設定は以下のグローバル変数で制御されます。
#                 - FILE_FIELD_SEPARATOR : 項目間の区切り文字を指定 ("COMMA", "TAB", "")
#                 - FILE_ENCLOSING_CHAR  : 項目を囲む文字を指定 ("DOUBLE_QUOTE", "SINGLE_QUOTE","")
#
#  パラメータ    　:
#     1. データ文字列 (例: "項目1,項目2,項目3,...")
#
#  実行方法    　:
#     sh ./db_output_record_format.sh "項目1,項目2,項目3,..."
#
#  参照        :　https://github.com/DokBak/DokBak_Shell_CMD
#
###################################################################################

echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}/data_generator.log

# パラメータチェック
if [[ "$#" -ne 1 ]]; then
    echo "[610101]エラー: 1つのデータ文字列をパラメータとして指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [610101]エラー: 1つのデータ文字列をパラメータとして指定してください。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# パラメータ取得
_data_string=${1}

# 項目分割
IFS=',' read -ra _items <<< "${_data_string}"

# 区切り文字の設定
case "${FILE_FIELD_SEPARATOR}" in
    COMMA)
        _field_separator=","
        ;;
    TAB)
        _field_separator=$'\t'
        ;;
    *)
        _field_separator=""
        ;;
esac

# 囲み文字の設定
case "${FILE_ENCLOSING_CHAR}" in
    DOUBLE_QUOTE)
        _enclosing_char='"'
        ;;
    SINGLE_QUOTE)
        _enclosing_char="'"
        ;;
    *)
        _enclosing_char=""
        ;;
esac

# フォーマット処理
_formatted_data=""
for _item in "${_items[@]}"; do
    # 項目を囲み文字で囲む
    if [ -n "${_enclosing_char}" ]; then
        _item="${_enclosing_char}${_item}${_enclosing_char}"
    fi
    _formatted_data="${_formatted_data}${_item}${_field_separator}"
done

# 最後の区切り文字を削除
_formatted_data="${_formatted_data%$_field_separator}"


# フォーマットされたデータを出力
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [610001]フォーマット処理後レコード：${_formatted_data}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}/data_generator.log
echo "${_formatted_data}"
exit 0