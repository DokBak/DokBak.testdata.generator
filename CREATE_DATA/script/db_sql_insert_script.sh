#!/bin/bash

###################################################################################
#
#  シェル名      : SQL実行コマンド(INSERT,SELECT)作成シェル
#
#  作成者        : DokBak
#  作成日        : 2025/01/08
#
#  処理概要      : 入力されたデータと設定ファイルのCOLUMN_DATA_NAMEに基づき、
#                 MySQL用のINSERT文を作成します。
#
#  パラメータ    　:
#     パラメータ1: カンマ区切りのデータ (例: value1,value2,value3)
#     パラメータ2: カラム数 (例: 3)
#
#  実行方法    　:
#     sh ./script/db_sql_insert_script.sh "value1,value2,value3" "3"
#
#  参照        : https://github.com/DokBak/DokBak.testdata.generator
#
###################################################################################

echo "  INSERTデータ関連sql作成中..."
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}data_generator.log

# パラメータのチェック
if [[ -z "$1" ]]; then
    echo "    [820101]エラー: パラメータ1にカンマ区切りデータを指定してください。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [820101]エラー: パラメータ1にカンマ区切りデータを指定してください。" >> ${LOG_DIR}data_generator.log
    exit 1
fi
if [[ -z "$2" ]]; then
    echo "    [820102]エラー: 出力するINSERT文の数が指定されていません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [820102]エラー: 出力するINSERT文の数が指定されていません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# 作成対象のファイルが既に存在する場合、バックアップ処理
if [[ 1 -eq "${2}" && -f "${SQLS_DIR}insert_${DBMS_NAME}.sql" ]];then
    mv "${SQLS_DIR}insert_${DBMS_NAME}.sql" "${SQLS_DIR}bk_$(date '+%Y%m%d%H%M%S')_insert_${DBMS_NAME}.sql"
fi

# COLUMN_DATA_NAME を配列に変換
IFS=',' read -r -a _column_names <<< "${COLUMN_DATA_NAME}"
# パラメータ1を配列に変換
IFS=',' read -r -a _values <<< "$1"

# COLUMN_DATA_NAMEとデータの数が一致しているか確認
echo "_column_names=${_column_names}" 
echo "${#_column_names[@]}" 
echo "_values=${_values}" 
echo "${#_values[@]}" 
if [[ "${#_column_names[@]}" -ne "${#_values[@]}" ]]; then
    echo "    [820103]エラー: 入力データの項目数とCOLUMN_DATA_NAMEの項目数が一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [820103]エラー: 入力データの項目数とCOLUMN_DATA_NAMEの項目数が一致しません。" >> ${LOG_DIR}data_generator.log
    exit 1
fi

# INSERT文を生成
_columns=$(IFS=','; echo "${_column_names[*]}")

# INSERT文の形式に合わせてデータをクオートで囲む
_formatted_values=$(IFS=','; echo "${_values[*]}" | sed "s/\([^,]*\)/'\1'/g")

_select_sql=""
case "${DBMS_NAME}" in
    "MySQL"|"MariaDB")
    _insert_sql="INSERT INTO ${DATABASE_NAME}.${SET_TABLENAME} (${_columns}) VALUES (${_formatted_values});"
    if [[ "${ROW_COUNTS}" -eq "${2}" ]]; then
        _select_sql="SELECT * FROM ${DATABASE_NAME}.${SET_TABLENAME};"
    fi
    ;;

    "PostgreSQL")
    _insert_sql="INSERT INTO ${SET_SCHEMA}.${SET_TABLENAME} (${_columns}) VALUES (${_formatted_values});"
    
    if [[ "${ROW_COUNTS}" -eq "${2}" ]]; then
        _select_sql="SELECT * FROM ${SET_SCHEMA}.${SET_TABLENAME};"
    fi
    ;;

    *)
    echo "    [820104]エラー: サポートされていないDBMSです。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [820104]エラー: サポートされていないDBMSです。" >> ${LOG_DIR}data_generator.log
    exit 1 
    ;;
esac

# 結果を表示
echo "${_insert_sql}" >> ${SQLS_DIR}insert_${DBMS_NAME}.sql
if [[ -n "${_select_sql}" ]]; then
    echo "${_select_sql}" >> ${SQLS_DIR}insert_${DBMS_NAME}.sql
fi 

echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [820001]INSERTデータ関連SQLファイル作成が正常に完了しました。" >> ${LOG_DIR}data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}data_generator.log
exit 0