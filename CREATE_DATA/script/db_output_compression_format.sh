#!/bin/bash

###################################################################################
#
#  シェル名      : ファイル圧縮処理シェル
#
#  作成者        : DokBak
#  作成日        : 2025/01/03          新規作成
#
#  処理概要      : FILE_COMPRESSION の設定値に応じてファイルを圧縮。
#
#  パラメータ    　:
#     なし
#
#  実行方法    　:
#     sh ./db_output_compression_format.sh
#
#  参照        :　https://github.com/DokBak/DokBak_Shell_CMD
#
###################################################################################

echo "ファイル圧縮処理中..."
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}/data_generator.log

# 対象ファイルの存在確認
if [[ ! -f "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}" ]]; then
    echo "[630101]エラー: 圧縮対象ファイル ${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION} が存在しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [630101]エラー: 圧縮対象ファイル ${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION} が存在しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 圧縮処理
case "${FILE_COMPRESSION}" in
    "")  # 圧縮しない
        echo "出力ファイルの中身確認"
        cat "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 圧縮形式が指定されていないため、処理をスキップします。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 最終出力ファイル確認 " >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] " `ls -l "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"` >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 出力ファイルの中身確認 " >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] " `cat "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"` >> ${LOG_DIR}/data_generator.log
        ;;
    ".gz")  # gzip形式で圧縮
        # 作成対象のファイルが既に存在する場合、バックアップ処理
        if [[ -f "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" ]];then
            mv "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" "${FILES_DIR}/bk_$(date '+%Y%m%d%H%M%S')_${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"
        fi

        # .gz圧縮処理
        gzip "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"
        
        # 圧縮ファイル中身確認
        echo "出力ファイルの中身確認"
        # OS環境別.gzファイル確認コマンド指定
        if command -v gzcat > /dev/null 2>&1; then
            # MacOSでは gzcatで .gzファイル中身確認
            gzcat "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"
        else
            # MacOS以外では zcatで .gzファイル中身確認
            zcat "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"
        fi

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] ファイルを .gz 形式で圧縮しました。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 最終出力ファイル確認 " >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] " `ls -l "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"` >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 出力ファイルの中身確認 " >> ${LOG_DIR}/data_generator.log
        if command -v gzcat > /dev/null 2>&1; then
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] " `gzcat "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"` >> ${LOG_DIR}/data_generator.log
        else
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] " `zcat "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"` >> ${LOG_DIR}/data_generator.log
        fi
        ;;
    ".zip")  # zip形式で圧縮
        # 作成対象のファイルが既に存在する場合、バックアップ処理
        if [[ -f "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" ]];then
            mv "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" "${FILES_DIR}/bk_$(date '+%Y%m%d%H%M%S')_${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"
        fi

        # .zip圧縮処理 (-q : quiet mode ,-m : 原本削除)
        zip -qm "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}.zip" "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"

        # 圧縮ファイル中身確認
        echo "出力ファイルの中身確認：zipファイルは圧縮された状態では内容を直接確認することはできません。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] ファイルを .zip 形式で圧縮しました。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 最終出力ファイル確認 " >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] " `ls -l "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"` >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 出力ファイルの中身確認：zipファイルは圧縮された状態では内容を直接確認することはできません。 " >> ${LOG_DIR}/data_generator.log
        ;;
    ".Z")  # compress形式で圧縮
        # 作成対象のファイルが既に存在する場合、バックアップ処理
        if [[ -f "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" ]];then
            mv "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" "${FILES_DIR}/bk_$(date '+%Y%m%d%H%M%S')_${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"
        fi

        # .Z圧縮処理
        compress "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"

        # 圧縮ファイル中身確認
        echo "出力ファイルの中身確認"
        # OS環境別.gzファイル確認コマンド指定
        if command -v gzcat > /dev/null 2>&1; then
            # MacOSでは gzcatで .Zファイル中身確認
            gzcat "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"
        else
            # MacOS以外では zcatで .Zファイル中身確認
            zcat "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"
        fi

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] ファイルを .Z 形式で圧縮しました。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 最終出力ファイル確認 " >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] " `ls -l "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"` >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] ファイルの中身確認 " >> ${LOG_DIR}/data_generator.log
        if command -v gzcat > /dev/null 2>&1; then
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] " `gzcat "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"` >> ${LOG_DIR}/data_generator.log
        else
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] " `zcat "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"` >> ${LOG_DIR}/data_generator.log
        fi
        ;;
    ".tar")  # tar形式で圧縮
        # 作成対象のファイルが既に存在する場合、バックアップ処理
        if [[ -f "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" ]];then
            mv "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" "${FILES_DIR}/bk_$(date '+%Y%m%d%H%M%S')_${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"
        fi

        # .tar圧縮処理 (-c : 圧縮, -f : アーカイブファイル指定, -C : 実行ディレクトリ修正)
        tar -cf "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" -C "${FILES_DIR}" "${FILE_NAME}${FILE_EXTENSION}"

        # 元ファイル削除
        rm -f "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}"

        # 圧縮ファイル中身確認 (-t : アーカイブファイルリスト表示, -f : アーカイブファイル指定)
        echo "出力ファイルの中身確認：tarファイルは圧縮された状態では内容を直接確認することはできません。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] ファイルを .tar 形式で圧縮しました。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 最終出力ファイル確認 " >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] " `ls -l "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"` >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 出力ファイルの中身確認：tarファイルは圧縮された状態では内容を直接確認することはできません。 " >> ${LOG_DIR}/data_generator.log
        ;;
    ".7z")  # 7z形式で圧縮
        # 作成対象のファイルが既に存在する場合、バックアップ処理
        if [[ -f "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" ]];then
            mv "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" "${FILES_DIR}/bk_$(date '+%Y%m%d%H%M%S')_${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"
        fi

        if command -v 7z &> /dev/null; then
            # .7z圧縮処理
            7z a "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}" "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"

            # 圧縮ファイル中身確認
            echo "出力ファイルの中身確認：7zファイルは圧縮された状態では内容を直接確認することはできません。"
            cat "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] ファイルを .7z 形式で圧縮しました。" >> ${LOG_DIR}/data_generator.log
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 最終出力ファイル確認 " >> ${LOG_DIR}/data_generator.log
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] " `ls -l "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}${FILE_COMPRESSION}"` >> ${LOG_DIR}/data_generator.log
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 出力ファイルの中身確認：7zファイルは圧縮された状態では内容を直接確認することはできません。 " >> ${LOG_DIR}/data_generator.log
        else
            echo "[630102]エラー: 7z コマンドが見つかりません。7zip をインストールしてください。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [630102]エラー: 7z コマンドが見つかりません。7zip をインストールしてください。" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
        ;;
    *)
        echo "[630103]エラー: サポートされていない圧縮形式 ${FILE_COMPRESSION} が指定されました。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [630103]エラー: サポートされていない圧縮形式 ${FILE_COMPRESSION} が指定されました。" >> ${LOG_DIR}/data_generator.log
        exit 1
        ;;
esac

# 処理完了メッセージ
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [630001]ファイル圧縮処理が正常に完了しました。" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}/data_generator.log
echo "[630001]ファイル圧縮処理が正常に完了しました。"
exit 0
