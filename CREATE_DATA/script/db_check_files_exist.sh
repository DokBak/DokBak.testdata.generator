#!/bin/bash

###################################################################################
#
#  シェル名      : スクリプトと設定ファイル存在チェックシェル
#
#  作成者        : DokBak
#  作成日        : 2024/12/12          新規作成
#  修正日        : 2025/03/24          コードリファクタリング
#
#  処理概要      : 指定されたスクリプトファイルと設定ファイルが存在するかを確認します。
#
#  パラメータ    　:
#     なし
#
#  実行方法    　:
#     sh ./db_check_files_exist.sh
#
#  参照        :　https://github.com/DokBak/DokBak_Shell_CMD
#
###################################################################################

echo "スクリプトと設定ファイルの確認を実行中..."
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}/data_generator.log

# 出力ファイルのディレクトリ
_output_dir="$(dirname "${SCRIPT_DIR}")/output"

# 設定ファイルディレクトリの確認
if [[ ! -d "${CONFIG_DIR}" ]]; then
    echo "[210101]エラー: 設定ファイルディレクトリ ${CONFIG_DIR} が存在しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [210101]エラー: 設定ファイルディレクトリ ${CONFIG_DIR} が存在しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 出力ファイルディレクトリの確認&作成
mkdir -p ${_output_dir}/files/
mkdir -p ${_output_dir}/sqls/
mkdir -p ${_output_dir}/logs/

# 確認するスクリプトファイル
_script_files=("db_gen_date_data.sh" "db_gen_number_data.sh" "db_gen_string_data.sh" "db_check_data_validate_config.sh" "db_check_file_validate_config.sh" "db_check_sql_validate_config.sh" "db_assemble_normal_data.sh" "db_output_record_format.sh" "db_output_file_format.sh" "db_output_compression_format.sh" "db_sql_base_script.sh" "db_generator.sh")

# 確認する設定ファイル
_config_files=("db_data_config.txt" "db_file_config.txt" "db_sql_config.txt")

# スクリプトファイルの存在チェック
for _script_file in "${_script_files[@]}"; do
    if [[ ! -f "${SCRIPT_DIR}/${_script_file}" ]]; then
        _missing_scripts+=("${_script_file}")
    fi
done

# 設定ファイルの存在チェック
for _config_file in "${_config_files[@]}"; do
    if [[ ! -f "${CONFIG_DIR}/${_config_file}" ]]; then
        _missing_configs+=("${_config_file}")
    fi
done

# 欠落ファイルがあれば一括エラー出力
if [[ ${#_missing_scripts[@]} -gt 0 || ${#_missing_configs[@]} -gt 0 ]]; then
    for _file in "${_missing_scripts[@]}"; do
        echo " [210102]エラー: スクリプトファイル ${_file} が存在しません。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [210102]エラー: スクリプトファイル ${_file} が存在しません。" >> ${LOG_DIR}/data_generator.log
    done

    for _file in "${_missing_configs[@]}"; do
        echo " [210103]エラー: 設定ファイル ${_file} が存在しません。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [210103]エラー: 設定ファイル ${_file} が存在しません。" >> ${LOG_DIR}/data_generator.log
    done
    exit 1
fi

# ファイルの確認がすべて完了
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [210001]スクリプトと設定ファイルに問題なし。" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}/data_generator.log
echo "[210001]スクリプトと設定ファイルに問題なし。"
exit 0
