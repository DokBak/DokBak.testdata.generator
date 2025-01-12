#!/bin/bash

###################################################################################
#
#  シェル名      : データ生成シェル
#
#  作成者        : DokBak
#  作成日        : 2025/01/01          新規作成
#
#  処理概要      : 必要なスクリプトと設定ファイルの存在を確認し、設定内容に基づき
#                 ランダムな文字列、数字、日付データを生成します。
#
#  パラメータ    　:
#     なし
#
#  実行方法    　:
#     sh ./db_generator.sh
#
#  参照        :　https://github.com/DokBak/DokBak_Shell_CMD
#
###################################################################################

# 現在のシェルファイルが存在するディレクトリ
_current_dir=$(dirname "$(realpath "$0")")
# 上位ディレクトリ
_parent_dir=$(dirname "${_current_dir}")

# スクリプトファイルのディレクトリ
export SCRIPT_DIR="${_parent_dir}/script"
# 設定ファイルのディレクトリ
export CONFIG_DIR="${_parent_dir}/config"
# 出力データファイルのディレクトリ
export FILES_DIR="${_parent_dir}/output/files"
# 出力SQLファイルのディレクトリ
export SQLS_DIR="${_parent_dir}/output/sqls"
# 出力SQLファイルのディレクトリ
export LOG_DIR="${_parent_dir}/output/logs"

# ログファイルが存在する場合、既存ログファイルバックアップ
if [[ -f "${LOG_DIR}/data_generator.log" ]]; then
    mv "${LOG_DIR}/data_generator.log" "${LOG_DIR}/data_generator_"$(date '+%Y%m%d%H%M%S')".log"
fi

echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}/data_generator.log

# 必要なスクリプトと設定ファイルの存在をチェック
bash "${SCRIPT_DIR}/db_check_files_exist.sh"
if [[ $? -ne 0 ]]; then
    echo "[910101]エラー: 必要なスクリプトまたは設定ファイルが不足しています。処理を中断します。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910101]エラー: 必要なスクリプトまたは設定ファイルが不足しています。処理を中断します。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi
echo

# 設定ファイルのパス
_data_config_file="${CONFIG_DIR}/db_data_config.txt"

# 設定ファイルの読み込み
export COLUMN_COUNTS=""
export COLUMN_DATA_TYPE=""
export COLUMN_DATA_LENGTH=""
export DATE_SEPARATOR=""
export TIME_SEPARATOR=""
export DATE_TIME_SEPARATOR=""
export REFERENCE_DATE=""
export CASE_MODE=""

while IFS="=" read -r _key _value; do
    case "${_key}" in
        COLUMN_COUNTS)
            COLUMN_COUNTS="${_value//\"/}"
            ;;
        COLUMN_DATA_TYPE)
            # COLUMN_DATA_TYPE の値を小文字に変換
            COLUMN_DATA_TYPE=$(echo "${_value}" | tr '[:upper:]' '[:lower:]')
            ;;
        COLUMN_DATA_LENGTH)
            COLUMN_DATA_LENGTH="${_value}"
            ;;
        DATE_SEPARATOR)
            DATE_SEPARATOR="${_value//\"/}"
            ;;
        TIME_SEPARATOR)
            TIME_SEPARATOR="${_value//\"/}"
            ;;
        DATE_TIME_SEPARATOR)
            DATE_TIME_SEPARATOR="${_value//\"/}"
            ;;
        REFERENCE_DATE)
            REFERENCE_DATE="${_value//\"/}"
            ;;
        CASE_MODE)
            CASE_MODE="${_value//\"/}"
            ;;
    esac
done < "${_data_config_file}"

echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] db_data_config.txt設定値" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_COUNTS=${COLUMN_COUNTS}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_DATA_TYPE=${COLUMN_DATA_TYPE}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_DATA_LENGTH=${COLUMN_DATA_LENGTH}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] DATE_SEPARATOR=${DATE_SEPARATOR}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] TIME_SEPARATOR=${TIME_SEPARATOR}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] DATE_TIME_SEPARATOR=${DATE_TIME_SEPARATOR}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] REFERENCE_DATE=${REFERENCE_DATE}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] CASE_MODE=${CASE_MODE}" >> ${LOG_DIR}/data_generator.log

# 設定ファイルのパス
_file_config_file="${CONFIG_DIR}/db_file_config.txt"

# 設定ファイルの読み込み
export FILE_NAME=""
export FILE_EXTENSION=""
export FILE_COMPRESSION=""
export FILE_CHARSET=""
export FILE_LINE_BREAK=""
export FILE_FIELD_SEPARATOR=""
export FILE_ENCLOSING_CHAR=""
export ROW_COUNTS=""

while IFS="=" read -r _key _value; do
    case "${_key}" in
        FILE_NAME)
            FILE_NAME="${_value//\"/}"
            ;;
        FILE_EXTENSION)
            FILE_EXTENSION="${_value//\"/}"
            ;;
        FILE_COMPRESSION)
            FILE_COMPRESSION="${_value//\"/}"
            ;;
        FILE_CHARSET)
            FILE_CHARSET="${_value//\"/}"
            ;;
        FILE_LINE_BREAK)
            FILE_LINE_BREAK="${_value//\"/}"
            ;;
        FILE_FIELD_SEPARATOR)
            FILE_FIELD_SEPARATOR="${_value//\"/}"
            ;;
        FILE_ENCLOSING_CHAR)
            FILE_ENCLOSING_CHAR="${_value//\"/}"
            ;;
        ROW_COUNTS)
            ROW_COUNTS="${_value//\"/}"
            ;;
    esac
done < "${_file_config_file}"

echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] db_file_config.txt設定値" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] FILE_NAME=${FILE_NAME}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] FILE_EXTENSION=${FILE_EXTENSION}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] FILE_COMPRESSION=${FILE_COMPRESSION}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] FILE_CHARSET=${FILE_CHARSET}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] FILE_LINE_BREAK=${FILE_LINE_BREAK}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] FILE_FIELD_SEPARATOR=${FILE_FIELD_SEPARATOR}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] FILE_ENCLOSING_CHAR=${FILE_ENCLOSING_CHAR}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] ROW_COUNTS=${ROW_COUNTS}" >> ${LOG_DIR}/data_generator.log

# 設定ファイルのパス
_sql_config_file="${CONFIG_DIR}/db_sql_config.txt"

# 設定ファイルの読み込み
export DBMS_NAME=""
export DATABASE_NAME=""
export DATABASE_CHARACTER_SET=""
export DATABASE_COLLATE=""
export DATABASE_USERNAME=""
export DATABASE_PASSWORD=""
export DATABASE_USERRIGHT=""
export DATABASE_TABLENAME=""
export SET_SCHEMA=""
export SET_TABLENAME=""
export FOREIGN_TABLENAME=""
export COLUMN_DATA_NAME=""
export COLUMN_PRIMARY_KEY=""
export COLUMN_UNIQUE_KEY=""
export COLUMN_FOREIGN_KEY=""
export COLUMN_INDEX_KEY=""
export COLUMN_NOT_NULL=""
export COLUMN_AUTO_INCREMENT=""
export COLUMN_DEFAULT_VALUE=""
export COLUMN_COMMENT=""
export SQL_SET_HOST=""
export POSTGRESQL_TEMPLATE=""
export POSTGRESQL_CONNECTION_LIMIT=""
export POSTGRESQL_ALLOW_CONNECTIONS=""

while IFS="=" read -r _key _value; do
    case "${_key}" in
        DBMS_NAME)
            DBMS_NAME="${_value//\"/}"
            ;;
        DATABASE_NAME)
            DATABASE_NAME="${_value//\"/}"
            ;;
        DATABASE_CHARACTER_SET)
            DATABASE_CHARACTER_SET="${_value//\"/}"
            ;;
        DATABASE_COLLATE)
            DATABASE_COLLATE="${_value//\"/}"
            ;;
        DATABASE_USERNAME)
            DATABASE_USERNAME="${_value//\"/}"
            ;;
        DATABASE_USERRIGHT)
            DATABASE_USERRIGHT="${_value//\"/}"
            ;;
        DATABASE_TABLENAME)
            DATABASE_TABLENAME="${_value//\"/}"
            ;;
        DATABASE_PASSWORD)
            DATABASE_PASSWORD="${_value//\"/}"
            ;;
        SET_SCHEMA)
            SET_SCHEMA="${_value//\"/}"
            ;;
        SET_TABLENAME)
            SET_TABLENAME="${_value//\"/}"
            ;;
        FOREIGN_TABLENAME)
            FOREIGN_TABLENAME="${_value//\"/}"
            ;;
        COLUMN_DATA_NAME)
            COLUMN_DATA_NAME="${_value//\"/}"
            ;;
        COLUMN_PRIMARY_KEY)
            COLUMN_PRIMARY_KEY="${_value//\"/}"
            ;;
        COLUMN_UNIQUE_KEY)
            COLUMN_UNIQUE_KEY="${_value//\"/}"
            ;;
        COLUMN_FOREIGN_KEY)
            COLUMN_FOREIGN_KEY="${_value//\"/}"
            ;;
        COLUMN_INDEX_KEY)
            COLUMN_INDEX_KEY="${_value//\"/}"
            ;;
        COLUMN_NOT_NULL)
            COLUMN_NOT_NULL="${_value//\"/}"
            ;;
        COLUMN_AUTO_INCREMENT)
            COLUMN_AUTO_INCREMENT="${_value//\"/}"
            ;;
        COLUMN_DEFAULT_VALUE)
            COLUMN_DEFAULT_VALUE="${_value//\"/}"
            ;;
        COLUMN_COMMENT)
            COLUMN_COMMENT="${_value//\"/}"
            ;;
        SQL_SET_HOST)
            SQL_SET_HOST="${_value//\"/}"
            ;;
        POSTGRESQL_TEMPLATE)
            POSTGRESQL_TEMPLATE="${_value//\"/}"
            ;;
        POSTGRESQL_CONNECTION_LIMIT)
            POSTGRESQL_CONNECTION_LIMIT="${_value//\"/}"
            ;;
        POSTGRESQL_ALLOW_CONNECTIONS)
            POSTGRESQL_ALLOW_CONNECTIONS="${_value//\"/}"
            ;;
    esac
done < "${_sql_config_file}"

echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] db_sql_config.txt設定値" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] DBMS_NAME=${DBMS_NAME}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] DATABASE_NAME=${DATABASE_NAME}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] DATABASE_CHARACTER_SET=${DATABASE_CHARACTER_SET}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] DATABASE_COLLATE=${DATABASE_COLLATE}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] DATABASE_USERNAME=${DATABASE_USERNAME}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] DATABASE_PASSWORD=${DATABASE_PASSWORD}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] DATABASE_USERRIGHT=${DATABASE_USERRIGHT}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] DATABASE_TABLENAME=${DATABASE_TABLENAME}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SET_SCHEMA=${SET_SCHEMA}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SET_TABLENAME=${SET_TABLENAME}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] FOREIGN_TABLENAME=${FOREIGN_TABLENAME}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_DATA_NAME=${COLUMN_DATA_NAME}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_PRIMARY_KEY=${COLUMN_PRIMARY_KEY}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_UNIQUE_KEY=${COLUMN_UNIQUE_KEY}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_FOREIGN_KEY=${COLUMN_FOREIGN_KEY}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_INDEX_KEY=${COLUMN_INDEX_KEY}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_NOT_NULL=${COLUMN_NOT_NULL}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_AUTO_INCREMENT=${COLUMN_AUTO_INCREMENT}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_DEFAULT_VALUE=${COLUMN_DEFAULT_VALUE}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] COLUMN_COMMENT=${COLUMN_COMMENT}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQL_SET_HOST=${SQL_SET_HOST}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] POSTGRESQL_TEMPLATE=${POSTGRESQL_TEMPLATE}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] POSTGRESQL_CONNECTION_LIMIT=${POSTGRESQL_CONNECTION_LIMIT}" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] POSTGRESQL_ALLOW_CONNECTIONS=${POSTGRESQL_ALLOW_CONNECTIONS}" >> ${LOG_DIR}/data_generator.log

# 設定ファイルの内容を検証
bash "${SCRIPT_DIR}/db_check_data_validate_config.sh"
if [[ $? -ne 0 ]]; then
    echo "[910102]エラー: 設定ファイルの検証中に問題が発生しました。処理を中断します。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910102]エラー: 設定ファイルの検証中に問題が発生しました。処理を中断します。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi
echo

# 設定ファイルの内容を検証
bash "${SCRIPT_DIR}/db_check_file_validate_config.sh"
if [[ $? -ne 0 ]]; then
    echo "[910103]エラー: 設定ファイルの検証中に問題が発生しました。処理を中断します。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910103]エラー: 設定ファイルの検証中に問題が発生しました。処理を中断します。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi
echo

# 設定ファイルの内容を検証
bash "${SCRIPT_DIR}/db_check_sql_validate_config.sh"
if [[ $? -ne 0 ]]; then
    echo "[910104]エラー: 設定ファイルの検証中に問題が発生しました。処理を中断します。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910104]エラー: 設定ファイルの検証中に問題が発生しました。処理を中断します。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi
echo

# 作成対象のファイルが既に存在する場合、バックアップ処理
if [[ -f "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}" ]];then
    mv "${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION}" "${FILES_DIR}/bk_$(date '+%Y%m%d%H%M%S')_${FILE_NAME}${FILE_EXTENSION}"
fi

for ((_i=1; _i<=${ROW_COUNTS}; _i++)); do
    if [[ ${ROW_COUNTS} -ne 1 ]];then
        echo "これは ${_i} 回目の処理です。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] これは ${_i} 回目の処理です。" >> ${LOG_DIR}/data_generator.log
    fi

    echo "  ノーマルデータ生成シェル作成中..."
    # ノーマルのフル桁のデータ作成
    _gen_data=$(bash "${SCRIPT_DIR}/db_assemble_normal_data.sh")
    if [[ $? -ne 0 ]]; then
        echo "[910105]エラー: データ作成中に問題が発生しました。処理を中断します。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910105]エラー: データ作成中に問題が発生しました。処理を中断します。" >> ${LOG_DIR}/data_generator.log
        exit 1
    # _gen_data の値が空の場合エラー
    elif [[ -z "${_gen_data}" ]]; then
        echo "[910106]エラー: 空の変数。db_assemble_normal_data.sh処理中に問題が発生しました。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910106]エラー: 空の変数。db_assemble_normal_data.sh処理中に問題が発生しました。" >> ${LOG_DIR}/data_generator.log
        exit 1
    else
        echo "  ノーマルデータ作成完了"
    fi
    echo

    bash "${SCRIPT_DIR}/db_sql_insert_script.sh" "${_gen_data}" "${_i}"
    if [[ $? -ne 0 ]]; then
        echo "[910112]エラー: INSERTのSQL文作成中に問題が発生しました。処理を中断します。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910112]エラー: INSERTのSQL文作成中に問題が発生しました。処理を中断します。" >> ${LOG_DIR}/data_generator.log
        exit 1
    else
        echo "  INSERTのSQL文作成完了"
    fi
    echo


    echo "  データフォーマット変更中..."
    # データフォーマット変更
    _formatted_data=$(bash "${SCRIPT_DIR}/db_output_record_format.sh" "${_gen_data}")
    if [[ $? -ne 0 ]]; then
        echo "[910107]エラー: データフォーマット変更中に問題が発生しました。処理を中断します。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910107]エラー: データフォーマット変更中に問題が発生しました。処理を中断します。" >> ${LOG_DIR}/data_generator.log
        exit 1
    # _formatted_data の値が空の場合エラー
    elif [[ -z "${_formatted_data}" ]]; then
        echo "[910108]エラー: 空の変数。db_output_record_format.sh処理中に問題が発生しました。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910108]エラー: 空の変数。db_output_record_format.sh処理中に問題が発生しました。" >> ${LOG_DIR}/data_generator.log
        exit 1
    else
        echo "  データフォーマット変更完了"
    fi
    echo

    echo "  出力ファイルフォーマット変更中..."
    # 出力ファイルフォーマット変更
    bash "${SCRIPT_DIR}/db_output_file_format.sh" ${_formatted_data}
    if [[ $? -ne 0 ]]; then
        echo "[910109]エラー: 出力ファイルフォーマット変更中に問題が発生しました。処理を中断します。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910109]エラー: 出力ファイルフォーマット変更中に問題が発生しました。処理を中断します。" >> ${LOG_DIR}/data_generator.log
        exit 1
    else
        echo "  出力ファイルフォーマット変更完了"
    fi
    echo

    echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 総レコード数：" `cat ${FILES_DIR}/${FILE_NAME}${FILE_EXTENSION} | wc -l` >> ${LOG_DIR}/data_generator.log

done

# ファイル圧縮処理
bash "${SCRIPT_DIR}/db_output_compression_format.sh"
if [[ $? -ne 0 ]]; then
    echo "[910110]エラー: ファイル圧縮処理中に問題が発生しました。処理を中断します。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910110]エラー: ファイル圧縮処理中に問題が発生しました。処理を中断します。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi
echo

# ファイル圧縮処理
bash "${SCRIPT_DIR}/db_sql_base_script.sh"
if [[ $? -ne 0 ]]; then
    echo "[910111]エラー: データベース作成、ユーザ設定コマンド作成中に問題が発生しました。処理を中断します。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [910111]エラー: データベース作成、ユーザ設定コマンド作成中に問題が発生しました。処理を中断します。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi
echo


echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}/data_generator.log
exit 0


