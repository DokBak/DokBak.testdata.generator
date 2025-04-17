#!/bin/bash

###################################################################################
#
#  シェル名      : ファイル関連の設定値を検証するシェル
#
#  作成者        : DokBak
#  作成日        : 2025/01/03          新規作成
#  修正日        : 2025/03/26          コードリファクタリング
#
#  処理概要      : db_file_config.txt の内容をチェックし、必要な設定値の有効性を確認します。
#
#  パラメータ    　:
#     なし
#
#  実行方法    　:
#     sh ./script/db_check_file_validate_config.sh
#
#  参照        :　https://github.com/DokBak/DokBak.testdata.generator
#
###################################################################################

echo "設定ファイルの有効性チェックを実行中..."
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}data_generator.log

# 設定ファイルのパス
_config_file="${CONFIG_DIR}db_file_config.txt"

# 設定ファイルの存在確認
if [[ ! -f "${_config_file}" ]]; then
    echo "[230101]エラー: 設定ファイル ${_config_file} が存在しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [230101]エラー: 設定ファイル ${_config_file} が存在しません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# FILE_NAME チェック
if [[ -z "${FILE_NAME}" ]]; then
    echo "[230102]エラー: FILE_NAMEを指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [230102]エラー: FILE_NAMEを指定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# FILE_EXTENSION チェック
case "${FILE_EXTENSION}" in
    "NONE"|".csv"|".tsv"|".txt")
        ;;
    *)
        echo "[230103]エラー: FILE_EXTENSIONは 'NONE', '.csv', '.tsv', '.txt' のいずれかで指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [230103]エラー: FILE_EXTENSIONは 'NONE', '.csv', '.tsv', '.txt' のいずれかで指定してください。" >> ${LOG_DIR}data_generator.log
        exit 1
        ;;
esac

# FILE_COMPRESSION チェック
case "${FILE_COMPRESSION}" in
    "NONE"|".gz"|".zip"|".Z"|".tar"|".7z")
        ;;
    *)
        echo "[230104]エラー: FILE_COMPRESSIONは 'NONE', '.gz', '.zip', '.Z', '.tar', '.7z' のいずれかで指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [230104]エラー: FILE_COMPRESSIONは 'NONE', '.gz', '.zip', '.Z', '.tar', '.7z' のいずれかで指定してください。" >> ${LOG_DIR}data_generator.log
        exit 1
        ;;
esac

# FILE_CHARSET チェック
case "${FILE_CHARSET}" in
    "UTF-8"|"UTF-16"|"EUC-JP"|"SJIS"|"CP932"|"EUC-KR")
        ;;
    *)
        echo "[230105]エラー: FILE_CHARSETは 'UTF-8', 'UTF-16', 'EUC-JP', 'SJIS', 'CP932', 'EUC-KR' のいずれかで指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [230105]エラー: FILE_CHARSETは 'UTF-8', 'UTF-16', 'EUC-JP', 'SJIS', 'CP932', 'EUC-KR' のいずれかで指定してください。" >> ${LOG_DIR}data_generator.log
        exit 1
        ;;
esac

# FILE_LINE_BREAK チェック
case "${FILE_LINE_BREAK}" in
    "CRLF"|"LF")
        ;;
    *)
        echo "[230106]エラー: FILE_LINE_BREAKは 'CRLF', 'LF' のいずれかで指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [230106]エラー: FILE_LINE_BREAKは 'CRLF', 'LF' のいずれかで指定してください。" >> ${LOG_DIR}data_generator.log
        exit 1
        ;;
esac

# FILE_FIELD_SEPARATOR チェック
case "${FILE_FIELD_SEPARATOR}" in
    "NONE"|"COMMA"|"TAB")
        ;;
    *)
        echo "[230107]エラー: FILE_FIELD_SEPARATORは 'NONE', 'COMMA', 'TAB' のいずれかで指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [230107]エラー: FILE_FIELD_SEPARATORは 'NONE', 'COMMA', 'TAB' のいずれかで指定してください。" >> ${LOG_DIR}data_generator.log
        exit 1
        ;;
esac

# FILE_ENCLOSING_CHAR チェック
case "${FILE_ENCLOSING_CHAR}" in
    "NONE"|"DOUBLE_QUOTE"|"SINGLE_QUOTE")
        ;;
    *)
        echo "[230108]エラー: FILE_ENCLOSING_CHAR 'NONE', 'DOUBLE_QUOTE', 'SINGLE_QUOTE' のいずれかで指定してください。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [230108]エラー: FILE_ENCLOSING_CHAR 'NONE', 'DOUBLE_QUOTE', 'SINGLE_QUOTE' のいずれかで指定してください。" >> ${LOG_DIR}data_generator.log
        exit 1
        ;;
esac

# ROW_COUNTS チェック
if [[ 1 -gt "${ROW_COUNTS}" ]]; then
    echo "[230109]エラー: ROW_COUNTSを1以上の値に指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [230109]エラー: ROW_COUNTSを1以上の値に指定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# FILE_EXTENSION と FILE_FIELD_SEPARATOR の関係を確認
if [[ "${FILE_FIELD_SEPARATOR}" == "NONE" && "${FILE_ENCLOSING_CHAR}" != "NONE" ]]; then
    echo "[230110]エラー: FILE_FIELD_SEPARATORが「NONE」の場合は、FILE_ENCLOSING_CHARには「NONE」以外の値を指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [230110]エラー: FILE_FIELD_SEPARATORが「NONE」の場合は、FILE_ENCLOSING_CHARには「NONE」以外の値を指定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# FILE_EXTENSION と FILE_FIELD_SEPARATOR の関係を確認
if [[ "${FILE_EXTENSION}" == ".csv" && "${FILE_FIELD_SEPARATOR}" != "COMMA" ]]; then
    echo "[230201]ワーニング: FILE_EXTENSIONが '.csv' の場合、FILE_FIELD_SEPARATORは 'COMMA' に指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [WARN]  [$(basename $0)] [230110]ワーニング: FILE_EXTENSIONが '.csv' の場合、FILE_FIELD_SEPARATORは 'COMMA' に指定してください。" >> ${LOG_DIR}data_generator.log
elif [[ "${FILE_EXTENSION}" == ".tsv" && "${FILE_FIELD_SEPARATOR}" != "TAB" ]]; then
    echo "[230202]ワーニング: FILE_EXTENSIONが '.tsv' の場合、FILE_FIELD_SEPARATORは 'TAB' に指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [WARN]  [$(basename $0)] [230111]ワーニング: FILE_EXTENSIONが '.tsv' の場合、FILE_FIELD_SEPARATORは 'TAB' に指定してください。" >> ${LOG_DIR}data_generator.log
fi

# 検証がすべて完了
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [230001]設定ファイルの内容問題なし。" >> ${LOG_DIR}data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}data_generator.log
echo "[230001]設定ファイルの内容問題なし。"
exit 0