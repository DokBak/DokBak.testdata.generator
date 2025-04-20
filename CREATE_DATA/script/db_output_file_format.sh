#!/bin/bash

###################################################################################
#
#  シェル名      : 出力ファイルフォーマット設定シェル
#
#  作成者        : DokBak
#  作成日        : 2025/01/03          新規作成
#  修正日        : 2025/04/20          コードリファクタリング
#
#  処理概要      : 指定されたフォーマットに基づいてファイルを生成します。
#                 - FILE_LINE_BREAK="LF" または "CRLF" に応じて改行コードを設定。
#                 - FILE_CHARSET="UTF-8" または "SJIS" に応じて文字コードを設定。
#
#  パラメータ    　:
#
#  実行方法    　:
#     sh ./script/db_output_file_format.sh
#
#  参照        :　https://github.com/DokBak/DokBak.testdata.generator
#
###################################################################################

echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}data_generator.log

# 一次加工ファイルとして stage1FormattedData.txtが存在すること確認
if [[ ! -f "${FILES_DIR}stage1FormattedData.txt" ]];then
    echo "[620101]エラー: ${FILES_DIR}パスに「stage1FormattedData.txt」が存在しないです。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [620101]エラー: ${FILES_DIR}パスに「stage1FormattedData.txt」が存在しないです。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# レコード一行ずつ読み込む
while IFS= read -r _line || [[ -n "${_line}" ]]; do
    # 改行コード設定に基づいて一時ファイルを生成
    if [[ ${FILE_LINE_BREAK} = CRLF ]];then
        printf "${_line}$(printf \\$(printf '%03o' 13 ))\n" >> "${FILES_DIR}stage2FormattedData.txt"
    elif  [[ ${FILE_LINE_BREAK} = LF ]];then
        printf "${_line}\n" >>  "${FILES_DIR}stage2FormattedData.txt"
    else
        echo "[620102]エラー: 設定ファイルの改行コード値(FILE_LINE_BREAK)が無効です。'LF' または 'CRLF' を指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [620102]エラー: 設定ファイルの改行コード値(FILE_LINE_BREAK)が無効です。'LF' または 'CRLF' を指定してください。" >> ${LOG_DIR}data_generator.log
        exit 1
    fi
done < "${FILES_DIR}stage1FormattedData.txt"

#二次加工ファイル（stage2FormattedData.txt）が存在する場合、一次加工ファイルを削除
if [[ -f "${FILES_DIR}stage2FormattedData.txt" ]];then
    rm -f ${FILES_DIR}stage1FormattedData.txt
fi

# 設定ファイルのFILE_EXTENSIONがNONEの場合、FILE_EXTENSIONをから文字に再設定
if [[ "${FILE_EXTENSION}" == "NONE" ]];then
    FILE_EXTENSION=""
fi

if command -v iconv >/dev/null 2>&1; then
    # 文字コードを変換
    # iconvコマンドで変更可能文字コード確認方法：iconv --list
    if [[ "${FILE_CHARSET}" = "UTF-8" ]]; then
        iconv -f UTF-8 -t UTF-8 "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "UTF-16" ]]; then
       iconv -f UTF-8 -t UTF-16 "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "EUC-JP" ]]; then
        iconv -f UTF-8 -t EUC-JP "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "SJIS" ]]; then
        iconv -f UTF-8 -t SJIS "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "CP932" ]]; then
        iconv -f UTF-8 -t CP932 "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "EUC-KR" ]]; then
        iconv -f UTF-8 -t EUC-KR "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    else
        echo "[620103]エラー: 設定ファイルの文字コード値(FILE_CHARSET)が無効です。'UTF-8' または 'UTF-16' 'EUC-JP' 'SJIS' 'CP932' 'EUC-KR' を指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [620103]エラー: 設定ファイルの文字コード値(FILE_CHARSET)が無効です。'UTF-8' または 'UTF-16' 'EUC-JP' 'SJIS' 'CP932' 'EUC-KR' を指定してください。" >> ${LOG_DIR}data_generator.log
        rm -f "${FILES_DIR}stage2FormattedData.txt"
        exit 1
    fi
else
    if [[ "${FILE_CHARSET}" = "UTF-8" ]];then
        nkf --oc=UTF-8 "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
        # 同じ処理
        # nkf -w "${FILES_DIR}stage2FormattedData.txt" > "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "UTF-16" ]];then
        nkf --oc=UTF-16 "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
        # 同じ処理
        # nkf -w16 "${FILES_DIR}stage2FormattedData.txt" > "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "EUC-JP" ]];then
        nkf --oc=EUC-JP "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
        # 同じ処理
        # nkf -e "${FILES_DIR}stage2FormattedData.txt" > "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "SJIS" ]];then
        nkf --oc=SJIS "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
        # 同じ処理
        # nkf -s "${FILES_DIR}stage2FormattedData.txt" > "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "CP932" ]];then
        nkf --oc=CP932 "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
        # 同じ処理
        # nkf -s "${FILES_DIR}stage2FormattedData.txt" > "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    elif [[ "${FILE_CHARSET}" = "EUC-KR" ]];then
        nkf --oc=EUC-KR "${FILES_DIR}stage2FormattedData.txt" >> "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"
    else
        echo "[620104]エラー: 設定ファイルの文字コード値(FILE_CHARSET)が無効です。'UTF-8' または 'UTF-16' 'EUC-JP' 'SJIS' 'CP932' 'EUC-KR' を指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [620104]エラー: 設定ファイルの文字コード値(FILE_CHARSET)が無効です。'UTF-8' または 'UTF-16' 'EUC-JP' 'SJIS' 'CP932' 'EUC-KR' を指定してください。" >> ${LOG_DIR}data_generator.log
        rm -f "${FILES_DIR}stage2FormattedData.txt"
        exit 1
    fi
fi

#設定の出力ファイル（stage2FormattedData.txt）が存在する場合、二次加工ファイルを削除
if [[ -f "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}" ]];then
    rm -f ${FILES_DIR}stage2FormattedData.txt
fi

# 処理完了メッセージ
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [620001]出力ファイルフォーマット確認：" `nkf --guess "${FILES_DIR}${FILE_NAME}${FILE_EXTENSION}"` >> ${LOG_DIR}data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}data_generator.log
exit 0
