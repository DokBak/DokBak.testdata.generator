#!/bin/bash

###################################################################################
#
#  シェル名      : 出力ファイルフォーマット設定シェル
#
#  作成者        : DokBak
#  作成日        : 20254/01/03          新規作成
#
#  処理概要      : パラメータ1を受け取り、指定されたフォーマットに基づいてファイルを生成します。
#                 - FILE_LINE_BREAK="LF" または "CRLF" に応じて改行コードを設定。
#                 - FILE_CHARSET="UTF-8" または "SJIS" に応じて文字コードを設定。
#
#  パラメータ    　:
#     パラメータ1 (必須) : 出力データの内容
#
#  実行方法    　:
#     sh ./db_output_file_format.sh 出力データ内容
#
#  参照        :　https://github.com/DokBak/DokBak_Shell_CMD
#
###################################################################################

echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}/data_generator.log

# 入力されたパラメータの個数を確認
if [ "${FILE_FIELD_SEPARATOR}" = "TAB" ];then
    _field_separator=$'\t'
    # パラメータチェック
    if [ "${#}" -ne "${COLUMN_COUNTS}" ]; then
        echo "[620101]エラー: パラメータの数が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [620101]エラー: パラメータの数が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
        exit 1
    else
        # パラメータを区切り文字で結合して _output_content に保存
        _output_content=""
        for _param in "${@}"; do
            if [ -z "${_output_content}" ]; then
                _output_content="${_param}"
            else
                _output_content="${_output_content}${_field_separator}${_param}"
            fi
        done
    fi
else
    # パラメータチェック
    if [ -z "${1}" ]; then
        echo "[620102]エラー: パラメータ1が指定されていません。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [620102]エラー: パラメータ1が指定されていません。" >> ${LOG_DIR}/data_generator.log
        exit 1
    else
        # パラメータ1の値を取得
        _output_content="${1}"
    fi
fi

# 出力ファイル生成
_output_content="${_output_content}"

# 改行コード設定に基づいて一時ファイルを生成
if [[ ${FILE_LINE_BREAK} = CRLF ]];then
    printf "${_output_content}$(printf \\$(printf '%03o' 13 ))\n" >  "${FILES_DIR}/${FILE_NAME}.tmp"
elif  [[ ${FILE_LINE_BREAK} = LF ]];then
    printf "${_output_content}\n" >  "${FILES_DIR}/${FILE_NAME}.tmp"
else
    echo "[620103]エラー: 設定ファイルの改行コード値(FILE_LINE_BREAK)が無効です。'LF' または 'CRLF' を指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [620103]エラー: 設定ファイルの改行コード値(FILE_LINE_BREAK)が無効です。'LF' または 'CRLF' を指定してください。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

if command -v iconv >/dev/null 2>&1; then
    # 文字コードを変換
    # iconvコマンドで変更可能文字コード確認方法：iconv --list
    if [ "${FILE_CHARSET}" = "UTF-8" ]; then
        iconv -f UTF-8 -t UTF-8 "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    elif [ "${FILE_CHARSET}" = "UTF-16" ]; then
       iconv -f UTF-8 -t UTF-16 "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    elif [ "${FILE_CHARSET}" = "EUC-JP" ]; then
        iconv -f UTF-8 -t EUC-JP "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    elif [ "${FILE_CHARSET}" = "SJIS" ]; then
        iconv -f UTF-8 -t SJIS "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    elif [ "${FILE_CHARSET}" = "CP932" ]; then
        iconv -f UTF-8 -t CP932 "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    elif [ "${FILE_CHARSET}" = "EUC-KR" ]; then
        iconv -f UTF-8 -t EUC-KR "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    else
        echo "[620104]エラー: 設定ファイルの文字コード値(FILE_CHARSET)が無効です。'UTF-8' または 'UTF-16' 'EUC-JP' 'SJIS' 'CP932' 'EUC-KR' を指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [620104]エラー: 設定ファイルの文字コード値(FILE_CHARSET)が無効です。'UTF-8' または 'UTF-16' 'EUC-JP' 'SJIS' 'CP932' 'EUC-KR' を指定してください。" >> ${LOG_DIR}/data_generator.log
        rm -f "${FILES_DIR}/${FILE_NAME}.tmp"
        exit 1
    fi
else
    if [[ "${FILE_CHARSET}" = "UTF-8" ]];then
        nkf --oc=UTF-8 "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
        # 同じ処理
        # nkf -w "${FILES_DIR}/${FILE_NAME}.tmp" > "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "UTF-16" ]];then
        nkf --oc=UTF-16 "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
        # 同じ処理
        # nkf -w16 "${FILES_DIR}/${FILE_NAME}.tmp" > "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "EUC-JP" ]];then
        nkf --oc=EUC-JP "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
        # 同じ処理
        # nkf -e "${FILES_DIR}/${FILE_NAME}.tmp" > "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "SJIS" ]];then
        nkf --oc=SJIS "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
        # 同じ処理
        # nkf -s "${FILES_DIR}/${FILE_NAME}.tmp" > "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "CP932" ]];then
        nkf --oc=CP932 "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
        # 同じ処理
        # nkf -s "${FILES_DIR}/${FILE_NAME}.tmp" > "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "EUC-KR" ]];then
        nkf --oc=EUC-KR "${FILES_DIR}/${FILE_NAME}.tmp" >> "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
    else
        echo "[620105]エラー: 設定ファイルの文字コード値(FILE_CHARSET)が無効です。'UTF-8' または 'UTF-16' 'EUC-JP' 'SJIS' 'CP932' 'EUC-KR' を指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [620105]エラー: 設定ファイルの文字コード値(FILE_CHARSET)が無効です。'UTF-8' または 'UTF-16' 'EUC-JP' 'SJIS' 'CP932' 'EUC-KR' を指定してください。" >> ${LOG_DIR}/data_generator.log
        rm -f "${FILES_DIR}/${FILE_NAME}.tmp"
        exit 1
    fi
fi

# 出力ファイルが作成に問題ない場合、一時ファイル削除
if [[ -f "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}" ]];then
    rm -f ${FILES_DIR}/${FILE_NAME}.tmp
fi

# 処理完了メッセージ
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [620001]出力ファイルフォーマット確認：" `nkf --guess "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"` >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}/data_generator.log
exit 0
