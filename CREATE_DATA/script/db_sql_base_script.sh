#!/bin/bash

###################################################################################
#
#  シェル名      : SQL実行コマンド作成シェル
#
#  作成者        : DokBak
#  作成日        : 2025/01/04
#
#  処理概要      : 変数に基づいてデータベースを作成します。
#                 DBMSがMySQLの場合、MySQLデータベースを作成します。その他のDBMSにも対応可能です。
#
#  パラメータ    　:
#     なし
#
#  実行方法    　:
#     sh ./db_sql_scrpt.sh
#
#  参照        :　https://github.com/DokBak/DokBak_Shell_CMD
#
###################################################################################

echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}/data_generator.log

# DBMSによる処理の分岐
case "${DBMS_NAME}" in
    "MySQL"|"MariaDB")
        # 作成対象のファイルが既に存在する場合、バックアップ処理
        if [[ -f "${SQLS_DIR}/base_${DBMS_NAME}.sql" ]];then
            mv "${SQLS_DIR}/base_${DBMS_NAME}.sql" "${SQLS_DIR}/bk_$(date '+%Y%m%d%H%M%S')_base_${DBMS_NAME}.sql"
        fi
        # MySQL/MariaDBの場合
        echo "MySQL/MariaDB用のデータベース関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] MySQL/MariaDB用のデータベース関連sql。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース作成" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE DATABASE ${DATABASE_NAME} CHARACTER SET ${DATABASE_CHARACTER_SET} COLLATE ${DATABASE_COLLATE};" >> ${LOG_DIR}/data_generator.log
        echo "--データベース作成" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "CREATE DATABASE ${DATABASE_NAME} " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  CHARACTER SET ${DATABASE_CHARACTER_SET} " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  COLLATE ${DATABASE_COLLATE};" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース削除" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE DATABASE ${DATABASE_NAME};" >> ${LOG_DIR}/data_generator.log
        echo "--データベース削除" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "DROP DATABASE ${DATABASE_NAME}; " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース確認" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  SHOW DATABASES;" >> ${LOG_DIR}/data_generator.log
        echo "--データベース確認" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "SHOW DATABASES; " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "MySQL/MariaDB用のユーザ関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] MySQL/MariaDB用のユーザ関連sql。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ作成" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE USER '${DATABASE_USERNAME}'@'${SQL_SET_HOST}' IDENTIFIED BY '${DATABASE_PASSWORD}';" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザ作成" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "CREATE USER '${DATABASE_USERNAME}'@'${SQL_SET_HOST}' " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  IDENTIFIED BY '${DATABASE_PASSWORD}';" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ権限設定" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  GRANT '${DATABASE_USERRIGHT}' ON '${DATABASE_NAME}'.'${DATABASE_TABLENAME}' TO '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザ権限設定" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "GRANT '${DATABASE_USERRIGHT}' " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  ON '${DATABASE_NAME}'.'${DATABASE_TABLENAME}' " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  TO '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ適用" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  FLUSH PRIVILEGES;" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザ適用" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "FLUSH PRIVILEGES;" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ権限確認" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  SHOW GRANTS FOR '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザ権限確認" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "SHOW GRANTS FOR '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ権限取り消し" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  REVOKE '${DATABASE_USERRIGHT}' ON '${DATABASE_NAME}'.'${DATABASE_TABLENAME}' FROM '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザ権限限取り消し" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "REVOKE '${DATABASE_USERRIGHT}' " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  ON '${DATABASE_NAME}'.'${DATABASE_TABLENAME}' " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  FROM '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ削除" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DROP USER '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザ削除" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "DROP USER '${DATABASE_USERNAME}'@'${SQL_SET_HOST}';" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ確認" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  SELECT User, Host FROM mysql.user;" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザ確認" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "SELECT User, Host FROM mysql.user;" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        # 順番に設定内容を確認し、対応するスクリプトを実行
        IFS=',' read -ra DATA_TYPES <<< "${COLUMN_DATA_TYPE//\"/}"
        IFS=',' read -ra DATA_LENGTHS <<< "${COLUMN_DATA_LENGTH//\"/}"
        IFS=',' read -ra DATA_NAMES <<< "${COLUMN_DATA_NAME//\"/}"
        IFS=',' read -ra PRIMARY_KEYS <<< "${COLUMN_PRIMARY_KEY//\"/}"
        IFS=',' read -ra UNIQUE_KEYS <<< "${COLUMN_UNIQUE_KEY//\"/}"
        IFS=',' read -ra FOREIGN_KEYS <<< "${COLUMN_FOREIGN_KEY//\"/}"
        IFS=',' read -ra INDEX_KEYS <<< "${COLUMN_INDEX_KEY//\"/}"
        IFS=',' read -ra NOT_NULLS <<< "${COLUMN_NOT_NULL//\"/}"
        IFS=',' read -ra AUTO_INCREMENTS <<< "${COLUMN_AUTO_INCREMENT//\"/}"
        IFS=',' read -ra DEFAULT_VALUES <<< "${COLUMN_DEFAULT_VALUE//\"/}"
        IFS=',' read -ra COMMENTS <<< "${COLUMN_COMMENT//\"/}"
        for _i in "${!DATA_TYPES[@]}"; do
            _type="${DATA_TYPES[$_i]}"
            _length="${DATA_LENGTHS[$_i]}"
            _item_number=$((_i + 1))
        done
        echo "MySQL/MariaDB用のテーブル関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] MySQL/MariaDB用のテーブル関連sql。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル作成" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  SELECT User, Host FROM mysql.user;" >> ${LOG_DIR}/data_generator.log
        echo "--テーブル作成" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "CREATE TABLE ${SET_TABLENAME} ( " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        for _i in "${!DATA_TYPES[@]}"; do
            _type="${DATA_TYPES[$_i]}"
            _length="${DATA_LENGTHS[$_i]}"
            _data_name="${DATA_NAMES[$_i]}"
            _primary_key="${PRIMARY_KEYS[$_i]}"
            _unique_key="${UNIQUE_KEYS[$_i]}"
            _foreign_key="${FOREIGN_KEYS[$_i]}"
            _index_key="${INDEX_KEYS[$_i]}"
            _not_null="${NOT_NULLS[$_i]}"
            _auto_increment="${AUTO_INCREMENTS[$_i]}"
            _default_value="${DEFAULT_VALUES[$_i]}"
            _comment="${COMMENTS[$_i]}"
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
            if [ "${_not_null}" = "true" ]; then
                _column="${_column} NOT NULL"
            fi

            # AUTO_INCREMENT
            if [ "${_auto_increment}" = "true" ]; then
                _column="${_column} AUTO_INCREMENT"
            fi

            # DEFAULT
            if [ -n "${_default_value}" ]; then
                _column="${_column} DEFAULT ${_default_value}"
            fi

            # COMMENT
            if [ -n "${_comment}" ]; then
                _column="${_column} COMMENT '${_comment}'"
            fi

            # PRIMARY KEY 抽出
            if [ "${_primary_key}" = "true" ]; then
                primary_keys+=("${_data_name},")
            fi

            # UNIQUE KEY 抽出
            if [ "${_unique_key}" = "true" ]; then
                unique_keys+=("${_data_name},")
            fi

            # FOREIGN KEY 抽出
            if [ "${_foreign_key}" = "true" ]; then
                foreign_keys+=("${_data_name},")
            fi

            # COLUMN INDEX 抽出
            if [ "${_index_key}" = "true" ]; then
                index_keys+=("${_data_name},")
            fi

            # カンマの追加
            if [[ ${_i} -eq $((${#DATA_TYPES[@]} - 1)) ]];then
                if [[ "${#primary_keys[@]}" -ne 0 || "${#unique_keys[@]}" -ne 0 || "${#unique_keys[@]}" -ne 0 || "${#foreign_keys[@]}" -ne 0 ]];then
                    _column="${_column},"
                else
                    _column="${_column}"
                fi
            else
                _column="${_column},"
            fi

            # COLUMN 記載
            echo "  ${_column}" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        done

        # PRIMARY KEY 追加
        if [ "${#primary_keys[@]}" -gt 0 ]; then
            primary_keys_string=$(IFS=; echo "${primary_keys[*]}" | sed 's/,$//')

            # カンマの追加
            comma=","
            if [[ "${#unique_keys[@]}" -eq 0 && "${#foreign_keys[@]}" -eq 0 && "${#index_keys[@]}" -eq 0 ]]; then
                comma=""
            fi

            # PRIMARY KEY の出力
            echo "  PRIMARY KEY (${primary_keys_string})${comma}" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        fi

        # UNIQUE KEY 追加
        if [ "${#unique_keys[@]}" -gt 0 ]; then
            unique_keys_string=$(IFS=; echo "${unique_keys[*]}" | sed 's/,$//')

            # カンマの追加
            comma=","
            if [[ "${#foreign_keys[@]}" -eq 0 && "${#index_keys[@]}" -eq 0 ]]; then
                comma=""
            fi

            # UNIQUE KEY の出力
            echo "  UNIQUE KEY (${unique_keys_string})${comma}" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        fi

        # FOREIGN KEY 追加
        if [ "${#foreign_keys[@]}" -gt 0 ]; then
            foreign_keys_string=$(IFS=; echo "${foreign_keys[*]}" | sed 's/,$//')

            total_keys=$(echo "${foreign_keys_string//,/ }" | wc -w)
            current_index=1

            for foreign_key in ${foreign_keys_string//,/ }; do
                # 最後の項目の場合、カンマを付けない
                comma=","
                if [[ ${current_index} -eq ${total_keys} && "${#index_keys[@]}" -eq 0 ]]; then
                    comma=""
                fi

                # FOREIGN KEY の出力
                echo "  FOREIGN KEY (${foreign_key}) REFERENCES ${FOREIGN_TABLENAME}(${foreign_key})${comma}" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

                ((current_index++))
            done
        fi

        # COLUMN INDEX 追加
        if [ "${#index_keys[@]}" -gt 0 ]; then
            index_keys_string=$(IFS=; echo "${index_keys[*]}" | sed 's/,$//')
            echo "  INDEX (${index_keys_string})" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        fi

        echo ");" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル確認" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  SHOW TABLES;" >> ${LOG_DIR}/data_generator.log
        echo "--テーブル確認" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "SHOW TABLES;" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル削除" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DROP TABLE ${SET_TABLENAME};" >> ${LOG_DIR}/data_generator.log
        echo "--テーブル削除" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "DROP TABLE ${SET_TABLENAME};" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--テーブル構造確認" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DESCRIBE ${SET_TABLENAME};" >> ${LOG_DIR}/data_generator.log
        echo "--テーブル構造確認" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "DESCRIBE ${SET_TABLENAME};" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        
        ;;

        

    "PostgreSQL")
        # 作成対象のファイルが既に存在する場合、バックアップ処理
        if [[ -f "${SQLS_DIR}/base_${DBMS_NAME}.sql" ]];then
            mv "${SQLS_DIR}/base_${DBMS_NAME}.sql" "${SQLS_DIR}/bk_$(date '+%Y%m%d%H%M%S')_base_${DBMS_NAME}.sql"
        fi
        # PostgreSQLの場合
        echo "PostgreSQL用のデータベース関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] MySQL/MariaDB用のデータベース関連sql。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース作成" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：CREATE DATABASE ${DATABASE_NAME} WITH OWNER = '${DATABASE_NAME}' TEMPLATE = '${POSTGRESQL_TEMPLATE}' ENCODING = '${DATABASE_CHARACTER_SET}' LC_COLLATE = '${DATABASE_COLLATE}' LC_CTYPE = '${DATABASE_COLLATE}' CONNECTION LIMIT = ${POSTGRESQL_CONNECTION_LIMIT} ALLOW_CONNECTIONS = '${POSTGRESQL_ALLOW_CONNECTIONS}';" >> ${LOG_DIR}/data_generator.log
        echo "--データベース作成" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "CREATE DATABASE ${DATABASE_NAME} " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  WITH " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  OWNER = '${DATABASE_NAME}' " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  TEMPLATE = '${POSTGRESQL_TEMPLATE}' " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  ENCODING = '${DATABASE_CHARACTER_SET}' " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  LC_COLLATE = '${DATABASE_COLLATE}' " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  LC_CTYPE = '${DATABASE_COLLATE}' " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  CONNECTION LIMIT = ${POSTGRESQL_CONNECTION_LIMIT} " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  ALLOW_CONNECTIONS = '${POSTGRESQL_ALLOW_CONNECTIONS}';" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース削除" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE DATABASE ${DATABASE_NAME};" >> ${LOG_DIR}/data_generator.log
        echo "--データベース削除" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "DROP DATABASE ${DATABASE_NAME}; " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--データベース確認" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  \l" >> ${LOG_DIR}/data_generator.log
        echo "--データベース確認" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "\l; " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "PostgreSQL用のユーザ関連sql。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] PostgreSQL用のユーザ関連sql。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ作成" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  CREATE USER '${DATABASE_USERNAME}' WITH PASSWORD '${DATABASE_PASSWORD}';" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザ作成" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "CREATE USER '${DATABASE_USERNAME}' WITH PASSWORD '${DATABASE_PASSWORD}';" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザパスワード再設定" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  ALTER USER '${DATABASE_USERNAME}' WITH PASSWORD '${DATABASE_PASSWORD}';" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザパスワード削除" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  ALTER USER '${DATABASE_USERNAME}' WITH PASSWORD NULL;" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザパスワード再設定" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "ALTER USER '${DATABASE_USERNAME}' WITH PASSWORD '${DATABASE_PASSWORD}';" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "--ユーザパスワード削除" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "ALTER USER '${DATABASE_USERNAME}' WITH PASSWORD NULL;" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ削除" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  DROP USER '${DATABASE_USERNAME}';" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザ削除" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "DROP USER '${DATABASE_USERNAME}';" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ権限設定" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  ALTER USER '${DATABASE_NAME}' WITH '${DATABASE_USERRIGHT}';" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザ権限設定" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "ALTER USER '${DATABASE_NAME}' " >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "  WITH '${DATABASE_USERRIGHT}';" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：--ユーザ確認と権限確認" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] SQLファイル記載：  \du" >> ${LOG_DIR}/data_generator.log
        echo "--ユーザ確認と権限確認" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "\du" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql
        echo "" >> ${SQLS_DIR}/base_${DBMS_NAME}.sql

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
        ;;
esac

echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}/data_generator.log
exit 0