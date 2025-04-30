#!/bin/bash

###################################################################################
#
#  シェル名      : SQL実行コマンド(CREATE,SHOW,DROP)作成シェル
#
#  作成者        : DokBak
#  作成日        : 2025/01/04
#
#  処理概要      : 変数に基づいてデータベースを作成します。
#                 DBMSがMySQLの場合、MySQLデータベース、ユーザ（権限）、テーブルを作成します。
#                 その他のDBMSにも対応可能です。
#
#  パラメータ    　:
#     なし
#
#  実行方法    　:
#     sh ./script/db_sql_base_script.sh
#
#  参照        :　https://github.com/DokBak/DokBak.testdata.generator
#
###################################################################################

echo "データベース、ユーザ、テーブル関連sql作成中..."
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}data_generator.log

# 作成対象のファイルが既に存在する場合、バックアップ処理
if [[ -f "${SQLS_DIR}base_${DBMS_NAME}.sql" ]];then
    mv "${SQLS_DIR}base_${DBMS_NAME}.sql" "${SQLS_DIR}bk_$(date '+%Y%m%d%H%M%S')_base_${DBMS_NAME}.sql"
fi

# DBMSによる処理の分岐
case "${DBMS_NAME}" in
    "MySQL"|"MariaDB")
        # MySQL/MariaDBの場合
        echo "  MySQL/MariaDB用のデータベース関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] MySQL/MariaDB用のデータベース関連sql。" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース作成" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE DATABASE ${DATABASE_NAME} CHARACTER SET ${DATABASE_CHARACTER_SET} COLLATE ${DATABASE_COLLATE};" >> ${LOG_DIR}data_generator.log
        echo "--データベース作成" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "CREATE DATABASE ${DATABASE_NAME} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  CHARACTER SET ${DATABASE_CHARACTER_SET} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  COLLATE ${DATABASE_COLLATE};" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース削除" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE DATABASE ${DATABASE_NAME};" >> ${LOG_DIR}data_generator.log
        echo "--データベース削除" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "DROP DATABASE ${DATABASE_NAME}; " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース確認" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  SHOW DATABASES;" >> ${LOG_DIR}data_generator.log
        echo "--データベース確認" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "SHOW DATABASES; " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "  MySQL/MariaDB用のユーザ関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] MySQL/MariaDB用のユーザ関連sql。" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ作成" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE USER '${DATABASE_USERNAME}'@'${SQL_SET_HOST}' IDENTIFIED BY '${DATABASE_PASSWORD}';" >> ${LOG_DIR}data_generator.log
        echo "--ユーザ作成" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "CREATE USER '${DATABASE_USERNAME}'@'${SQL_SET_HOST}' " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  IDENTIFIED BY '${DATABASE_PASSWORD}';" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ権限設定" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  GRANT ${DATABASE_USERRIGHT} ON ${DATABASE_NAME}.${DATABASE_TABLERIGHT} TO '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${LOG_DIR}data_generator.log
        echo "--ユーザ権限設定" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "GRANT ${DATABASE_USERRIGHT} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  ON ${DATABASE_NAME}.${DATABASE_TABLERIGHT} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  TO '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ権限適用" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  FLUSH PRIVILEGES;" >> ${LOG_DIR}data_generator.log
        echo "--ユーザ権限適用" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "FLUSH PRIVILEGES;" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ権限確認" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  SHOW GRANTS FOR '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${LOG_DIR}data_generator.log
        echo "--ユーザ権限確認" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "SHOW GRANTS FOR '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ権限取り消し" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  REVOKE ${DATABASE_USERRIGHT} ON ${DATABASE_NAME}.${DATABASE_TABLERIGHT} FROM '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${LOG_DIR}data_generator.log
        echo "--ユーザ権限取り消し" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "REVOKE ${DATABASE_USERRIGHT} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  ON ${DATABASE_NAME}.${DATABASE_TABLERIGHT} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  FROM '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ削除" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DROP USER '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${LOG_DIR}data_generator.log
        echo "--ユーザ削除" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "DROP USER '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ確認" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  SELECT User, Host FROM mysql.user;" >> ${LOG_DIR}data_generator.log
        echo "--ユーザ確認" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "SELECT User, Host FROM mysql.user;" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        # 順番に設定内容を確認し、対応するスクリプトを実行
        IFS=',' read -ra _data_types <<< "${COLUMN_DATA_TYPE//\"/}"
        IFS=',' read -ra _data_lengths <<< "${COLUMN_DATA_LENGTH//\"/}"
        IFS=',' read -ra _data_names <<< "${COLUMN_DATA_NAME//\"/}"
        IFS=',' read -ra _primary_keys <<< "${COLUMN_PRIMARY_KEY//\"/}"
        IFS=',' read -ra _unique_keys <<< "${COLUMN_UNIQUE_KEY//\"/}"
        IFS=',' read -ra _foreign_keys <<< "${COLUMN_FOREIGN_KEY//\"/}"
        IFS=',' read -ra _index_keys <<< "${COLUMN_INDEX_KEY//\"/}"
        IFS=',' read -ra _not_nulls <<< "${COLUMN_NOT_NULL//\"/}"
        IFS=',' read -ra _auto_increments <<< "${COLUMN_AUTO_INCREMENT//\"/}"
        IFS=',' read -ra _default_values <<< "${COLUMN_DEFAULT_VALUE//\"/}"
        IFS=',' read -ra _comments <<< "${COLUMN_COMMENT//\"/}"
        for _i in "${!_data_types[@]}"; do
            _type="${_data_types[$_i]}"
            _length="${_data_lengths[$_i]}"
            _item_number=$((_i + 1))
        done
        echo "  MySQL/MariaDB用のテーブル関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] MySQL/MariaDB用のテーブル関連sql。" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル作成" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE TABLE ${DATABASE_NAME}.${SET_TABLENAME}" >> ${LOG_DIR}data_generator.log
        echo "--テーブル作成" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "CREATE TABLE ${DATABASE_NAME}.${SET_TABLENAME} ( " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        for _i in "${!_data_types[@]}"; do
            _type="${_data_types[$_i]}"
            _length="${_data_lengths[$_i]}"
            _data_name="${_data_names[$_i]}"
            _primary_key="${_primary_keys[$_i]}"
            _unique_key="${_unique_keys[$_i]}"
            _foreign_key="${_foreign_keys[$_i]}"
            _index_key="${_index_keys[$_i]}"
            _not_null="${_not_nulls[$_i]}"
            _auto_increment="${_auto_increments[$_i]}"
            _default_value="${_default_values[$_i]}"
            _comment="${_comments[$_i]}"
            _item_number=$((_i + 1))
            _column=""

            case "${_type}" in
                # 文字列関連タイプ
                # ※ CHAR : 固定長文字列。指定された長さ分の空白で埋められる
                # ※ VARCHAR : 可変長文字列。最大長を指定
                # ※ TEXT : 長さが決まっていないテキスト文字列。長さに制限なし
                char|string)
                    # カラム定義の作成
                    _column="${_data_name} VARCHAR(${_length})"
                    ;;
                # 数字型関連タイプ
                # ※ TINYINT : -128 ~ 127
                # ※ SMALLINT : -32,768 ~ 32,767
                # ※ MEDIUMINT : -8388608 ~ 8388607
                # ※ INT : -2147483648 ~ 2147483647
                # ※ BIGINT : -92233720036854775808 ~ 92233720036854775807
                byte|short|int|long)
                    _column="${_data_name} INT"
                    ;;
                # 浮動小数点型関連タイプ
                # ※ float : -3.402823466E+38 ~ 3.402823466E+38
                # ※ double : -1.7976931348623157E+308 ~ 1.7976931348623157E+308
                # ※ DECIMAL(D,S) : D(全体桁数)、S(小数部桁数)
                # ※ NUMERIC : DECIMALと同じ
                float|double)
                    _integer_part=$(echo "$_length" | cut -d'.' -f1)
                    _fractional_part=$(echo "$_length" | cut -d'.' -f2)
                    _column="${_data_name} DECIMAL($((${_integer_part} + ${_fractional_part})), ${_fractional_part})"
                    ;;
                # 論理型関連タイプ
                # ※ boolean : TRUE, FALSE, NULL
                boolean)
                    _column="${_data_name} BOOLEAN"
                    ;;
                # 日付関連タイプ
                # ※ DATE : YYYY-MM-DD
                # ※ DATETIME : YYYY-MM-DD HH:MM:SS
                # ※ TIMESTAMP : 現在時間を自動登録
                # ※ TIME : HH:MM:SS
                # ※ YEAR : YYYY
                date)
                    _column="${_data_name} DATETIME"
                    ;;
            esac

            # NOT NULL
            if [[ "${_not_null}" = "true" ]]; then
                _column="${_column} NOT NULL"
            fi

            # AUTO_INCREMENT
            if [[ "${_auto_increment}" = "true" ]]; then
                _column="${_column} AUTO_INCREMENT"
            fi

            # DEFAULT
            if [[ ! "${_default_value}" = " " ]]; then
                _column="${_column} DEFAULT '${_default_value}'"
            fi

            # COMMENT
            if [[ -n "${_comment}" ]]; then
                _column="${_column} COMMENT '${_comment}'"
            fi

            # PRIMARY KEY 抽出
            if [[ "${_primary_key}" = "true" ]]; then
                _true_primary_keys+=("${_data_name},")
            fi

            # UNIQUE KEY 抽出
            if [[ "${_unique_key}" = "true" ]]; then
                _true_unique_keys+=("${_data_name},")
            fi

            # FOREIGN KEY 抽出
            if [[ "${_foreign_key}" = "true" ]]; then
                _true_foreign_keys+=("${_data_name},")
            fi

            # COLUMN INDEX 抽出
            if [[ "${_index_key}" = "true" ]]; then
                index_keys+=("${_data_name},")
            fi

            # カンマの追加
            if [[ ${_i} -eq $((${#_data_types[@]} - 1)) ]];then
                if [[ "${#_true_primary_keys[@]}" -ne 0 || "${#_true_unique_keys[@]}" -ne 0 || "${#_true_unique_keys[@]}" -ne 0 || "${#_true_foreign_keys[@]}" -ne 0 ]];then
                    _column="${_column},"
                else
                    _column="${_column}"
                fi
            else
                _column="${_column},"
            fi

            # COLUMN 記載
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：    ${_column}" >> ${LOG_DIR}data_generator.log
            echo "  ${_column}" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        done

        # PRIMARY KEY 追加
        if [[ "${#_true_primary_keys[@]}" -gt 0 ]]; then
            _primary_keys_string=$(IFS=; echo "${_true_primary_keys[*]}" | sed 's/,$//')

            # カンマの追加
            _comma=","
            if [[ "${#_true_unique_keys[@]}" -eq 0 && "${#_true_foreign_keys[@]}" -eq 0 && "${#index_keys[@]}" -eq 0 ]]; then
                _comma=""
            fi

            # PRIMARY KEY の出力
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：    PRIMARY KEY (${_primary_keys_string})${_comma}" >> ${LOG_DIR}data_generator.log
            echo "  PRIMARY KEY (${_primary_keys_string})${_comma}" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        fi

        # UNIQUE KEY 追加
        if [[ "${#_true_unique_keys[@]}" -gt 0 ]]; then
            unique_keys_string=$(IFS=; echo "${_true_unique_keys[*]}" | sed 's/,$//')

            # カンマの追加
            _comma=","
            if [[ "${#_true_foreign_keys[@]}" -eq 0 && "${#index_keys[@]}" -eq 0 ]]; then
                _comma=""
            fi

            # UNIQUE KEY の出力
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：    UNIQUE KEY (${unique_keys_string})${_comma}" >> ${LOG_DIR}data_generator.log
            echo "  UNIQUE KEY (${unique_keys_string})${_comma}" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        fi

        # FOREIGN KEY 追加
        if [[ "${#_true_foreign_keys[@]}" -gt 0 ]]; then
            _foreign_keys_string=$(IFS=; echo "${_true_foreign_keys[*]}" | sed 's/,$//')

            _total_keys=$(echo "${_foreign_keys_string//,/ }" | wc -w)
            _current_index=1

            for foreign_key in ${_foreign_keys_string//,/ }; do
                # 最後の項目の場合、カンマを付けない
                _comma=","
                if [[ ${_current_index} -eq ${_total_keys} && "${#index_keys[@]}" -eq 0 ]]; then
                    _comma=""
                fi

                # FOREIGN KEY の出力
                echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：    FOREIGN KEY (${foreign_key}) REFERENCES ${FOREIGN_TABLENAME}(${foreign_key})${_comma}" >> ${LOG_DIR}data_generator.log
                echo "  FOREIGN KEY (${foreign_key}) REFERENCES ${FOREIGN_TABLENAME}(${foreign_key})${_comma}" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

                ((_current_index++))
            done
        fi

        # COLUMN INDEX 追加
        if [[ "${#index_keys[@]}" -gt 0 ]]; then
            index_keys_string=$(IFS=; echo "${index_keys[*]}" | sed 's/,$//')
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：    INDEX (${index_keys_string})" >> ${LOG_DIR}data_generator.log
            echo "  INDEX (${index_keys_string})" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        fi

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  );" >> ${LOG_DIR}data_generator.log
        echo ");" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル確認" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  SHOW TABLES FROM ${DATABASE_NAME};" >> ${LOG_DIR}data_generator.log
        echo "--テーブル確認" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "SHOW TABLES FROM ${DATABASE_NAME};" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル構造確認" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DESCRIBE ${DATABASE_NAME}.${SET_TABLENAME};" >> ${LOG_DIR}data_generator.log
        echo "--テーブル構造確認" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "DESCRIBE ${DATABASE_NAME}.${SET_TABLENAME};" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
   
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル削除" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DROP TABLE ${DATABASE_NAME}.${SET_TABLENAME};" >> ${LOG_DIR}data_generator.log
        echo "--テーブル削除" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "DROP TABLE ${DATABASE_NAME}.${SET_TABLENAME};" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        ;;

    "PostgreSQL")
        # PostgreSQLの場合
        echo "  PostgreSQL用のユーザ関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] PostgreSQL用のユーザ関連sql。" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ作成" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE USER ${DATABASE_USERNAME} WITH PASSWORD '${DATABASE_PASSWORD}';" >> ${LOG_DIR}data_generator.log
        echo "--ユーザ作成" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "CREATE USER ${DATABASE_USERNAME} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  WITH PASSWORD '${DATABASE_PASSWORD}';" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザパスワード再設定" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  ALTER USER ${DATABASE_USERNAME} WITH PASSWORD '${DATABASE_PASSWORD}';" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザパスワード削除" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  ALTER USER ${DATABASE_USERNAME} WITH PASSWORD NULL;" >> ${LOG_DIR}data_generator.log
        echo "--ユーザパスワード再設定" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "ALTER USER ${DATABASE_USERNAME} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  WITH PASSWORD '${DATABASE_PASSWORD}';" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "--ユーザパスワード削除" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "ALTER USER ${DATABASE_USERNAME} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  WITH PASSWORD NULL;" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ削除" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DROP USER ${DATABASE_USERNAME};" >> ${LOG_DIR}data_generator.log
        echo "--ユーザ削除" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "DROP USER ${DATABASE_USERNAME};" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ権限設定" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  ALTER USER ${DATABASE_NAME} WITH ${DATABASE_USERRIGHT};" >> ${LOG_DIR}data_generator.log
        echo "--ユーザ権限設定" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "ALTER USER ${DATABASE_USERNAME} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  WITH ${DATABASE_USERRIGHT};" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ確認と権限確認" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  \du" >> ${LOG_DIR}data_generator.log
        echo "--ユーザ確認と権限確認" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "\du" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "  PostgreSQL用のデータベース関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] PostgreSQL用のデータベース関連sql。" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース作成" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：CREATE DATABASE ${DATABASE_NAME} WITH OWNER = '${DATABASE_USERNAME}' TEMPLATE = '${POSTGRESQL_TEMPLATE}' ENCODING = '${DATABASE_CHARACTER_SET}' LC_COLLATE = '${DATABASE_COLLATE}' LC_CTYPE = '${DATABASE_COLLATE}' CONNECTION LIMIT = ${POSTGRESQL_CONNECTION_LIMIT} ALLOW_CONNECTIONS = '${POSTGRESQL_ALLOW_CONNECTIONS}';" >> ${LOG_DIR}data_generator.log
        echo "--データベース作成" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "CREATE DATABASE ${DATABASE_NAME} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  WITH " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  OWNER = '${DATABASE_USERNAME}' " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  TEMPLATE = '${POSTGRESQL_TEMPLATE}' " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  ENCODING = '${DATABASE_CHARACTER_SET}' " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  LC_COLLATE = '${DATABASE_COLLATE}' " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  LC_CTYPE = '${DATABASE_COLLATE}' " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  CONNECTION LIMIT = ${POSTGRESQL_CONNECTION_LIMIT} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  ALLOW_CONNECTIONS = '${POSTGRESQL_ALLOW_CONNECTIONS}';" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース削除" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DROP DATABASE ${DATABASE_NAME};" >> ${LOG_DIR}data_generator.log
        echo "--データベース削除" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "DROP DATABASE ${DATABASE_NAME}; " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース確認" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  \l" >> ${LOG_DIR}data_generator.log
        echo "--データベース確認" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "\l " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "  PostgreSQL用のスキーマ関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] PostgreSQL用のスキーマ関連sql。" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--スキーマ作成" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：CREATE SCHEMA ${SET_SCHEMA} AUTHORIZATION ${DATABASE_USERNAME};" >> ${LOG_DIR}data_generator.log
        echo "--スキーマ作成" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "CREATE SCHEMA ${SET_SCHEMA} " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "  AUTHORIZATION ${DATABASE_USERNAME};" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--スキーマ削除" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DROP SCHEMA ${SET_SCHEMA};" >> ${LOG_DIR}data_generator.log
        echo "--スキーマ削除" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "DROP SCHEMA ${SET_SCHEMA}; " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--スキーマ確認" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  \dn" >> ${LOG_DIR}data_generator.log
        echo "--スキーマ確認" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "\dn " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        # 順番に設定内容を確認し、対応するスクリプトを実行
        IFS=',' read -ra _data_types <<< "${COLUMN_DATA_TYPE//\"/}"
        IFS=',' read -ra _data_lengths <<< "${COLUMN_DATA_LENGTH//\"/}"
        IFS=',' read -ra _data_names <<< "${COLUMN_DATA_NAME//\"/}"
        IFS=',' read -ra _primary_keys <<< "${COLUMN_PRIMARY_KEY//\"/}"
        IFS=',' read -ra _unique_keys <<< "${COLUMN_UNIQUE_KEY//\"/}"
        IFS=',' read -ra _foreign_keys <<< "${COLUMN_FOREIGN_KEY//\"/}"
        IFS=',' read -ra _index_keys <<< "${COLUMN_INDEX_KEY//\"/}"
        IFS=',' read -ra _not_nulls <<< "${COLUMN_NOT_NULL//\"/}"
        IFS=',' read -ra _auto_increments <<< "${COLUMN_AUTO_INCREMENT//\"/}"
        IFS=',' read -ra _default_values <<< "${COLUMN_DEFAULT_VALUE//\"/}"
        IFS=',' read -ra _comments <<< "${COLUMN_COMMENT//\"/}"
        for _i in "${!_data_types[@]}"; do
            _type="${_data_types[$_i]}"
            _length="${_data_lengths[$_i]}"
            _item_number=$((_i + 1))
        done
        echo "  PostgreSQL用のテーブル関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] PostgreSQL用のテーブル関連sql。" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル作成" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE TABLE ${DATABASE_NAME}.${SET_TABLENAME}" >> ${LOG_DIR}data_generator.log
        echo "--テーブル作成" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "CREATE TABLE ${SET_SCHEMA}.${SET_TABLENAME} ( " >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        _unique_key_count=0
        for _i in "${!_data_types[@]}"; do
            _type="${_data_types[$_i]}"
            _length="${_data_lengths[$_i]}"
            _data_name="${_data_names[$_i]}"
            _primary_key="${_primary_keys[$_i]}"
            _unique_key="${_unique_keys[$_i]}"
            _foreign_key="${_foreign_keys[$_i]}"
            _not_null="${_not_nulls[$_i]}"
            _auto_increment="${_auto_increments[$_i]}"
            _default_value="${_default_values[$_i]}"
            _comment="${_comments[$_i]}"
            _item_number=$((_i + 1))
            _column=""

            case "${_type}" in
                # 文字列関連タイプ
                # ※ CHAR : 固定長文字列。指定された長さ分の空白で埋められる
                # ※ VARCHAR : 可変長文字列。最大長を指定
                # ※ TEXT : 長さが決まっていないテキスト文字列。長さに制限なし
                # ※ JSON : JSONデータ
                char|string)
                    # カラム定義の作成
                    _column="${_data_name} VARCHAR(${_length})"
                    ;;
                # 数字型関連タイプ
                # ※ TINYINT : -128 ~ 127
                # ※ SMALLINT : -32,768 ~ 32,767
                # ※ INTEGER : -2147483648 ~ 2147483647
                # ※ BIGINT : -92233720036854775808 ~ 92233720036854775807
                byte|short|int|long)

                    # AUTO_INCREMENT
                    if [[ "${_auto_increment}" = "true" ]]; then
                        _column="${_data_name} SERIAL"
                    else
                        _column="${_data_name} INTEGER"
                    fi
                    ;;
                # 浮動小数点型関連タイプ
                # ※ float : -3.402823466E+38 ~ 3.402823466E+38
                # ※ double : -1.7976931348623157E+308 ~ 1.7976931348623157E+308
                # ※ DECIMAL(D,S) : D(全体桁数)、S(小数部桁数)
                # ※ NUMERIC : DECIMALと同じ
                float|double)
                    _integer_part=$(echo "$_length" | cut -d'.' -f1)
                    _fractional_part=$(echo "$_length" | cut -d'.' -f2)
                    _column="${_data_name} DECIMAL($((${_integer_part} + ${_fractional_part})), ${_fractional_part})"
                    ;;
                # 論理型関連タイプ
                # ※ boolean : TRUE, FALSE, NULL
                boolean)
                    _column="${_data_name} BOOLEAN"
                    ;;
                # 日付関連タイプ
                # ※ DATE : YYYY-MM-DD
                # ※ TIME : HH:MM:SS
                # ※ TIMESTAMP : 日付と時間
                date)
                    _column="${_data_name} TIMESTAMP"
                    ;;
            esac

            # NOT NULL
            if [[ "${_not_null}" = "true" ]]; then
                _column="${_column} NOT NULL"
            fi

            # DEFAULT
            if [[ ! "${_default_value}" = " " ]]; then
                _column="${_column} DEFAULT '${_default_value}'"
            fi

            # COMMENT
            if [[ -n "${_comment}" ]]; then
            : #    _column="${_column} COMMENT '${_comment}'"
            fi

            # PRIMARY KEY 抽出
            if [[ "${_primary_key}" = "true" ]]; then
                _true_primary_keys+=("${_data_name},")
            fi

            # UNIQUE KEY のtrue のカウントを追加
            if [[ "${_unique_key}" = "true" ]]; then
                _unique_key_count=$((_unique_key_count + 1)) 
            fi

            # FOREIGN KEY 抽出
            if [[ "${_foreign_key}" = "true" ]]; then
                _true_foreign_keys+=("${_data_name},")
            fi

            # カンマの追加
            if [[ ${_i} -eq $((${#_data_types[@]} - 1)) ]];then
                if [[ "${#_true_primary_keys[@]}" -ne 0 || "${#_true_unique_keys[@]}" -ne 0 || "${#_true_unique_keys[@]}" -ne 0 || "${#_true_foreign_keys[@]}" -ne 0 ]];then
                    _column="${_column},"
                else
                    _column="${_column}"
                fi
            else
                _column="${_column},"
            fi

            # COLUMN 記載
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：    ${_column}" >> ${LOG_DIR}data_generator.log
            echo "  ${_column}" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        done

        # PRIMARY KEY 追加
        if [[ "${#_true_primary_keys[@]}" -gt 0 ]]; then
            _primary_keys_string=$(IFS=; echo "${_true_primary_keys[*]}" | sed 's/,$//')

            # カンマの追加
            _comma=","
            if [[ "${#_true_unique_keys[@]}" -eq 0 && "${#_true_foreign_keys[@]}" -eq 0 ]]; then
                _comma=""
            fi

            # PRIMARY KEY の出力
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：    PRIMARY KEY (${_primary_keys_string})${_comma}" >> ${LOG_DIR}data_generator.log
            echo "  PRIMARY KEY (${_primary_keys_string})${_comma}" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        fi

        # UNIQUE KEY の出力
        _current_count=0
        for _i in "${!_data_types[@]}"; do
            _data_name="${_data_names[$_i]}"
            _unique_key="${_unique_keys[$_i]}"
            if [[ "${_unique_key}" = "true" ]]; then
                _current_count=$((_current_count + 1))
                _comma=","
                if [[ "${_current_count}" -eq "${_unique_key_count}" && "${#_true_foreign_keys[@]}" -eq 0 ]]; then
                    _comma=""
                fi
                echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：    UNIQUE (${_data_name})${_comma}" >> ${LOG_DIR}data_generator.log
                echo "  UNIQUE (${_data_name})${_comma}" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
            fi
        done

        # FOREIGN KEY 追加
        if [[ "${#_true_foreign_keys[@]}" -gt 0 ]]; then
            _foreign_keys_string=$(IFS=; echo "${_true_foreign_keys[*]}" | sed 's/,$//')

            _total_keys=$(echo "${_foreign_keys_string//,/ }" | wc -w)
            _current_index=1

            for foreign_key in ${_foreign_keys_string//,/ }; do
                # 最後の項目の場合、カンマを付けない
                _comma=","
                if [[ ${_current_index} -eq ${_total_keys} ]]; then
                    _comma=""
                fi

                # FOREIGN KEY の出力
                echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：    FOREIGN KEY (${foreign_key}) REFERENCES ${SET_SCHEMA}.${FOREIGN_TABLENAME}(${foreign_key})${_comma}" >> ${LOG_DIR}data_generator.log
                echo "  FOREIGN KEY (${foreign_key}) REFERENCES ${SET_SCHEMA}.${FOREIGN_TABLENAME}(${foreign_key})${_comma}" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

                ((_current_index++))
            done
        fi


        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  );" >> ${LOG_DIR}data_generator.log
        echo ");" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル確認" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  \dt ${DATABASE_NAME}.*;" >> ${LOG_DIR}data_generator.log
        echo "--テーブル確認" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "\dt ${SET_SCHEMA}.*;" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル構造確認" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  \d ${DATABASE_NAME}.${SET_TABLENAME};" >> ${LOG_DIR}data_generator.log
        echo "--テーブル構造確認" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "\d ${SET_SCHEMA}.${SET_TABLENAME};" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
    
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル削除" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DROP TABLE ${DATABASE_NAME}.${SET_TABLENAME};" >> ${LOG_DIR}data_generator.log
        echo "--テーブル削除" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "DROP TABLE ${SET_SCHEMA}.${SET_TABLENAME};" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "  PostgreSQL用のインデックス関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] PostgreSQL用のインデックス関連sql。" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--インデックス作成" >> ${LOG_DIR}data_generator.log
        echo "--インデックス作成" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        for _i in "${!_data_types[@]}"; do
            _data_name="${_data_names[$_i]}"
            _index_key="${_index_keys[$_i]}"
            _item_number=$((_i + 1))
            # COLUMN INDEX 抽出
            if [[ "${_index_key}" = "true" ]]; then
                echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE INDEX idx_${_data_name} ON ${SET_SCHEMA}.${SET_TABLENAME} (${_data_name});" >> ${LOG_DIR}data_generator.log
                echo "CREATE INDEX idx_${_data_name} ON ${SET_SCHEMA}.${SET_TABLENAME} (${_data_name});" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
            fi
        done
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--インデックス確認" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  \di ${DATABASE_NAME}.*;" >> ${LOG_DIR}data_generator.log
        echo "--インデックス確認" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "\di ${SET_SCHEMA}.*;" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--インデックス削除" >> ${LOG_DIR}data_generator.log
        echo "--インデックス削除" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        for _i in "${!_data_types[@]}"; do
            _data_name="${_data_names[$_i]}"
            _index_key="${_index_keys[$_i]}"
            _item_number=$((_i + 1))
            if [[ "${_index_key}" = "true" ]]; then
                echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DROP INDEX ${SET_SCHEMA}.idx_${_data_name};" >> ${LOG_DIR}data_generator.log
                echo "DROP INDEX ${SET_SCHEMA}.idx_${_data_name};" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
            fi
        done
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "  PostgreSQL用のコメント関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] PostgreSQL用のコメント関連sql。" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--コメント作成" >> ${LOG_DIR}data_generator.log
        echo "--コメント作成" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        for _i in "${!_data_types[@]}"; do
            _data_name="${_data_names[$_i]}"
            _comment="${_comments[$_i]}"
            _item_number=$((_i + 1))
            # COLUMN INDEX 抽出
            if [[ -n "${_comment}" ]]; then
                echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  COMMENT ON COLUMN ${SET_SCHEMA}.${SET_TABLENAME}.${_data_name} IS '${_comment}';" >> ${LOG_DIR}data_generator.log
                echo "COMMENT ON COLUMN ${SET_SCHEMA}.${SET_TABLENAME}.${_data_name} IS '${_comment}';" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
            fi
        done
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--コメント確認(Description)" >> ${LOG_DIR}data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  \d+ ${DATABASE_NAME}.${SET_TABLENAME};" >> ${LOG_DIR}data_generator.log
        echo "--コメント確認(Description)" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "\d+ ${SET_SCHEMA}.${SET_TABLENAME};" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--コメント削除" >> ${LOG_DIR}data_generator.log
        echo "--コメント削除" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        for _i in "${!_data_types[@]}"; do
            _data_name="${_data_names[$_i]}"
            _comment="${_comments[$_i]}"
            _item_number=$((_i + 1))
            if [[ -n "${_comment}" ]]; then
                echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  COMMENT ON COLUMN ${SET_SCHEMA}.${SET_TABLENAME}.${_data_name} IS NULL;" >> ${LOG_DIR}data_generator.log
                echo "COMMENT ON COLUMN ${SET_SCHEMA}.${SET_TABLENAME}.${_data_name} IS NULL;" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
            fi
        done
        echo "" >> ${SQLS_DIR}base_${DBMS_NAME}.sql
        ;;

    "SQLite")
        # SQLiteの場合
        echo "SQLite関連は作成中。"
        exit 1 
        echo "SQLite用のデータベース関連。"
        sqlite3 "${DATABASE_NAME}.db" "VACUUM;"
        ;;

    "Oracle")
        # Oracleの場合
        echo "Oracle関連は作成中。"
        exit 1 
        echo "Oracle用のデータベース関連。"
        sqlplus / as sysdba << EOF
            CREATE DATABASE ${DATABASE_NAME} DEFAULT TABLESPACE users 
            CHARACTER SET ${DATABASE_CHARACTER_SET} COLLATE ${DATABASE_COLLATE};
EOF
        ;;

    "Microsoft_SQL_Server")
        # Microsoft SQL Serverの場合
        echo "Microsoft_SQL_Server関連は作成中。"
        exit 1 
        echo "Microsoft SQL Server用のデータベース関連。"
        sqlcmd -S localhost -U sa -P 'your_password' -Q "CREATE DATABASE ${DATABASE_NAME};"
        ;;

    "MongoDB")
        # MongoDBの場合
        echo "MongoDB関連は作成中。"
        exit 1 
        echo "MongoDB用のデータベース関連。"
        mongo --eval "use ${DATABASE_NAME}"
        ;;

    "DynamoDB")
        # DynamoDBの場合
        echo "DynamoDB関連は作成中。"
        exit 1 
        echo "DynamoDB用のデータベース関連。"
        aws dynamodb create-table --table-name ${DATABASE_NAME} --attribute-definitions AttributeName=Id,AttributeType=S --key-schema AttributeName=Id,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
        ;;

    *)
        echo "サポートされていないDBMSです。"
        exit 1 
        ;;
esac

echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [810001]データベース、ユーザ、テーブル関連SQLファイル作成が正常に完了しました。" >> ${LOG_DIR}data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}data_generator.log
echo "[810001]データベース、ユーザ、テーブル関連SQLファイル作成が正常に完了しました。"
exit 0