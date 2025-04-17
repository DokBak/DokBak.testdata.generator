#!/bin/bash

###################################################################################
#
#  シェル名      : データフォーマット変更シェル
#
#  作成者        : DokBak
#  作成日        : 2025/01/02          新規作成
#  修正日        : 2025/04/17          コードリファクタリング
#
#  処理概要      : 単一のデータ文字列を、指定の区切り文字および囲み文字でフォーマットして出力します。
#                 全体の設定は以下のグローバル変数で制御されます。
#                 - FILE_FIELD_SEPARATOR : 項目間の区切り文字を指定 ("COMMA", "TAB", "NONE")
#                 - FILE_ENCLOSING_CHAR  : 項目を囲む文字を指定 ("DOUBLE_QUOTE", "SINGLE_QUOTE","NONE")
#
#  パラメータ     :
#
#  実行方法      :
#     sh ./script/db_output_record_format.sh
#
#  参照         :　https://github.com/DokBak/DokBak.testdata.generator
#
###################################################################################

echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}data_generator.log

# 初期生成ファイルとして initialData.txtが存在すること確認
if [[ ! -f "${FILES_DIR}initialData.txt" ]];then
    echo "[610101]エラー: ${FILES_DIR}パスに「initialData.txt」が存在しないです。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [610101]エラー: ${FILES_DIR}パスに「initialData.txt」が存在しないです。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

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

# レコード一行ずつ読み込む
while IFS= read -r _line || [[ -n "${_line}" ]]; do

    # レコードをカンマ（,）区切りで各項目に分割
    IFS=',' read -ra _items <<< "${_line}"

    _formatted_line=""
    for _item in "${_items[@]}"; do
        if [[ -n "${_enclosing_char}" ]]; then
            _item="${_enclosing_char}${_item}${_enclosing_char}"
        fi
        _formatted_line="${_formatted_line}${_item}${_field_separator}"
    done
    # 最後の区切り文字を削除
    _formatted_line="${_formatted_line%${_field_separator}}"

    echo "${_formatted_line}" >> ${FILES_DIR}stage1FormattedData.txt
done < "${FILES_DIR}initialData.txt"

#処理済みでstage1FormattedData.txtが存在する場合、初期生成ファイルを削除
if [[ -f "${FILES_DIR}stage1FormattedData.txt" ]];then
    rm -f ${FILES_DIR}initialData.txt
fi

# フォーマットされたデータを出力
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [610001]区切り文字・囲み文字設定が正常に完了しました。" >> ${LOG_DIR}data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}data_generator.log
exit 0