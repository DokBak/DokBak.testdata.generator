#!/bin/bash

###################################################################################
#
#  シェル名      : 設定ファイルチェックシェル
#
#  作成者        : DokBak
#  作成日        : 2025/01/04          新規作成
#
#  処理概要      : db_sql_config.txt の内容をチェックし、必要な設定値の有効性を確認します。
#
#  パラメータ    　:
#     なし
#
#  実行方法    　:
#     sh ./db_check_sql_validate_config.sh
#
#  参照        :　https://github.com/DokBak/DokBak_Shell_CMD
#
###################################################################################

echo "設定ファイルの有効性チェックを実行中..."
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}/data_generator.log

# 設定ファイルのパス
_config_file="${CONFIG_DIR}/db_sql_config.txt"

# 設定ファイルの存在確認
if [ ! -f "${_config_file}" ]; then
    echo "[240101]エラー: 設定ファイル ${_config_file} が存在しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240101]エラー: 設定ファイル ${_config_file} が存在しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 許可されるDBMSリスト
_valid_dbms=("MySQL" "MariaDB" "PostgreSQL" "SQLite" "Oracle" "Microsoft_SQL_Server" "MongoDB" "DynamoDB")

# DBMS_NAME の確認
if [[ ! " ${_valid_dbms[@]} " =~ " ${DBMS_NAME} " ]]; then
    echo "[240102]エラー: '${DBMS_NAME}' は許可されていない値です。"
    echo "許可された値: ${DBMS_NAME[*]}"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240102]エラー: '${DBMS_NAME}' は許可されていない値です。" >> ${LOG_DIR}/data_generator.log
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可された値: ${DBMS_NAME[*]}" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# DATABASE_NAME の確認
if [[ -z "${DATABASE_NAME}" ]]; then
    echo "[240103]エラー: 'DATABASE_NAME' は空白の値を指定できません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240103]エラー: 'DATABASE_NAME' は空白の値を指定できません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 許可される文字セット
valid_mysql_character_set=("utf8mb4" "utf8" "sjis" "euckr")
valid_postgresql_character_set=("UTF8" "SJIS")

# DBMS_NAMEに基づくDATABASE_CHARACTER_SET の確認
if [[ "${DBMS_NAME}" == "MySQL" || "${DBMS_NAME}" == "MariaDB" ]]; then
    # MySQLの場合
    if [[ ! " ${valid_mysql_character_set[@]} " =~ " ${DATABASE_CHARACTER_SET} " ]]; then
        echo "[240104]エラー: '${DATABASE_CHARACTER_SET}' は${DBMS_NAME}で許可されている文字セットではありません。"
        echo "許可されている文字セット: ${valid_mysql_character_set[*]}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240104]エラー: '${DATABASE_CHARACTER_SET}' は${DBMS_NAME}で許可されている文字セットではありません。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可されている文字セット: ${valid_mysql_character_set[*]}" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
elif [[ "${DBMS_NAME}" == "PostgreSQL" ]]; then
    # PostgreSQLの場合
    if [[ ! " ${valid_postgresql_character_set[@]} " =~ " ${DATABASE_CHARACTER_SET} " ]]; then
        echo "[240105]エラー: '${DATABASE_CHARACTER_SET}' は${DBMS_NAME}で許可されている文字セットではありません。"
        echo "許可されている文字セット: ${valid_postgresql_character_set[*]}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240105]エラー: '${DATABASE_CHARACTER_SET}' は${DBMS_NAME}で許可されている文字セットではありません。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可されている文字セット: ${valid_postgresql_character_set[*]}" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
else
    # 未対応のDBMSの場合
    echo "[240106]エラー: '${DBMS_NAME}' はサポートされていないDBMSです。"
    echo "現在サポートされているDBMS: MySQL, MariaDB, MariaDB"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240106]エラー: '${DBMS_NAME}' はサポートされていないDBMSです。" >> ${LOG_DIR}/data_generator.log
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 現在サポートされているDBMS: MySQL, MariaDB, MariaDB" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 許可されている文字データの並び順設定値のリスト
valid_mysql_collate=("utf8mb4_unicode_ci" "utf8mb4_general_ci" "utf8mb4_bin")
valid_postgresql_collate=("C" "en_US.UTF-8" "ko_KR.UTF-8" "ja_JP.UTF-8")

# DBMS_NAMEに基づくDATABASE_COLLATE の確認
if [[ "${DBMS_NAME}" == "MySQL" || "${DBMS_NAME}" == "MariaDB" ]]; then
    # MySQLまたはMariaDBの場合
    if [[ ! " ${valid_mysql_collate[@]} " =~ " ${DATABASE_COLLATE} " ]]; then
        echo "[240107]エラー: '${DATABASE_COLLATE}' は${DBMS_NAME}で許可されている文字セットではありません。"
        echo "許可されている文字セット: ${valid_mysql_collate[*]}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240107]エラー: '${DATABASE_COLLATE}' は${DBMS_NAME}で許可されている文字セットではありません。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可されている文字セット: ${valid_mysql_collate[*]}" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
elif [[ "${DBMS_NAME}" == "PostgreSQL" ]]; then
    # PostgreSQLの場合
    if [[ ! " ${valid_postgresql_collate[@]} " =~ " ${DATABASE_COLLATE} " ]]; then
        echo "[240108]エラー: '${DATABASE_COLLATE}' は${DBMS_NAME}で許可されている文字セットではありません。"
        echo "許可されている文字セット: ${valid_postgresql_collate[*]}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240108]エラー: '${DATABASE_COLLATE}' は${DBMS_NAME}で許可されている文字セットではありません。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可されている文字セット: ${valid_postgresql_collate[*]}" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
else
    # 未対応のDBMSの場合
    echo "[240109]エラー: '${DBMS_NAME}' はサポートされていないDBMSです。"
    echo "現在サポートされているDBMS: MySQL, MariaDB, PostgreSQL"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240109]エラー: '${DBMS_NAME}' はサポートされていないDBMSです。" >> ${LOG_DIR}/data_generator.log
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 現在サポートされているDBMS: MySQL, MariaDB, PostgreSQL" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# DATABASE_USERNAME の確認
if [[ -z "${DATABASE_USERNAME}" ]]; then
    echo "[240110]エラー: 'DATABASE_USERNAME' は空白の値を指定できません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240110]エラー: 'DATABASE_USERNAME' は空白の値を指定できません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# DATABASE_PASSWORD の確認
if [[ -z "${DATABASE_PASSWORD}" ]]; then
    echo "[240111]エラー: 'DATABASE_PASSWORD' は空白の値を指定できません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240111]エラー: 'DATABASE_PASSWORD' は空白の値を指定できません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 許可されている権限のリスト
valid_mysql_userrights=("ALL PRIVILEGES" "SELECT" "INSERT" "UPDATE" "DELETE" "CREATE" "DROP")
valid_postgresql_userrights=("Superuser" "Createrole" "CreateDB" "Replication" "BypassRLS")

# ユーザー権限の検証関数
validate_userrights() {
    local dbms_rights=("$@")           # 許可されている権限リストを配列として受け取る
    local input_rights                # 入力された権限を配列に変換
    IFS=',' read -ra input_rights <<< "$DATABASE_USERRIGHT"

    # ALL PRIVILEGESが含まれる場合の特殊処理 (MySQL用)
    if [[ "${DBMS_NAME}" == "MySQL" ]]; then
        if [[ " ${input_rights[@]} " =~ " ALL PRIVILEGES " && "${#input_rights[@]}" -gt 1 ]]; then
            echo "[240112]エラー: 'ALL PRIVILEGES' が指定されている場合、他の権限を指定することはできません。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240112]エラー: 'ALL PRIVILEGES' が指定されている場合、他の権限を指定することはできません。" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
    fi

    # 権限が許可されているかを検証
    for right in "${input_rights[@]}"; do
        if [[ ! " ${dbms_rights[*]} " =~ " ${right} " ]]; then
            echo "[240113]エラー: '${right}' は${DBMS_NAME}で許可されている権限ではありません。"
            echo "許可されている権限: ${dbms_rights[*]}"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240113]エラー: '${right}' は${DBMS_NAME}で許可されている権限ではありません。" >> ${LOG_DIR}/data_generator.log
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可されている権限: ${dbms_rights[*]}" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
    done
}
# DBMS_NAMEに基づく権限の確認
if [[ "${DBMS_NAME}" == "MySQL" ]]; then
    validate_userrights "${valid_mysql_userrights[@]}"
elif [[ "${DBMS_NAME}" == "PostgreSQL" ]]; then
    validate_userrights "${valid_postgresql_userrights[@]}"
else
    echo "[240114]エラー: '${DBMS_NAME}' はサポートされていないDBMSです。"
    echo "現在サポートされているDBMS: MySQL, PostgreSQL"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240114]エラー: '${DBMS_NAME}' はサポートされていないDBMSです。" >> ${LOG_DIR}/data_generator.log
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 現在サポートされているDBMS: MySQL, PostgreSQL" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# SET_TABLENAME の確認
if [[ -z "${SET_TABLENAME}" ]]; then
    echo "[240115]エラー: 'SET_TABLENAME' は空白の値を指定できません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240115]エラー: 'SET_TABLENAME' は空白の値を指定できません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# DATABASE_TABLENAMEの検証
if [[ "${DATABASE_TABLENAME}" != "*" && "${DATABASE_TABLENAME}" != "${SET_TABLENAME}" ]]; then
    echo "[240116]エラー: 'DATABASE_TABLENAME' は '*' または '\${SET_TABLENAME}' (${SET_TABLENAME}) のいずれかでなければなりません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240116]エラー: 'DATABASE_TABLENAME' は '*' または '\${SET_TABLENAME}' (${SET_TABLENAME}) のいずれかでなければなりません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# COLUMN_FOREIGN_KEYの検証
# IFSを使ってカンマ区切りで値を配列に変換
IFS=',' read -ra DATA_NAMES <<< "${COLUMN_DATA_NAME//\"/}"
IFS=',' read -ra PRIMARY_KEYS <<< "${COLUMN_PRIMARY_KEY//\"/}"
IFS=',' read -ra UNIQUE_KEYS <<< "${COLUMN_UNIQUE_KEY//\"/}"
IFS=',' read -ra FOREIGN_KEYS <<< "${COLUMN_FOREIGN_KEY//\"/}"
IFS=',' read -ra INDEX_KEYS <<< "${COLUMN_INDEX_KEY//\"/}"
IFS=',' read -ra NOT_NULLS <<< "${COLUMN_NOT_NULL//\"/}"
IFS=',' read -ra AUTO_INCREMENTS <<< "${COLUMN_AUTO_INCREMENT//\"/}"
IFS=',' read -ra DEFAULT_VALUES <<< "${COLUMN_DEFAULT_VALUE//\"/}"
IFS=',' read -ra COMMENTS <<< "${COLUMN_COMMENT//\"/}"

# COLUMN_COUNTSと設定値の数を比較
if [[ ${#DATA_NAMES[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240117]エラー: COLUMN_DATA_NAME の項目数 (${#DATA_NAMES[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240117]エラー: COLUMN_DATA_NAME の項目数 (${#DATA_NAMES[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#PRIMARY_KEYS[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240118]エラー: COLUMN_PRIMARY_KEY の項目数 (${#PRIMARY_KEYS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240118]エラー: COLUMN_PRIMARY_KEY の項目数 (${#PRIMARY_KEYS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#UNIQUE_KEYS[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240119]エラー: COLUMN_UNIQUE_KEY の項目数 (${#UNIQUE_KEYS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240119]エラー: COLUMN_UNIQUE_KEY の項目数 (${#UNIQUE_KEYS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#FOREIGN_KEYS[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240120]エラー: COLUMN_FOREIGN_KEY の項目数 (${#FOREIGN_KEYS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240120]エラー: COLUMN_FOREIGN_KEY の項目数 (${#FOREIGN_KEYS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#INDEX_KEYS[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240121]エラー: COLUMN_INDEX_KEY の項目数 (${#INDEX_KEYS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240121]エラー: COLUMN_INDEX_KEY の項目数 (${#INDEX_KEYS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#NOT_NULLS[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240122]エラー: COLUMN_NOT_NULL の項目数 (${#NOT_NULLS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240122]エラー: COLUMN_NOT_NULL の項目数 (${#NOT_NULLS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#AUTO_INCREMENTS[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240123]エラー: COLUMN_AUTO_INCREMENT の項目数 (${#AUTO_INCREMENTS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240123]エラー: COLUMN_AUTO_INCREMENT の項目数 (${#AUTO_INCREMENTS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#DEFAULT_VALUES[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240124]エラー: COLUMN_DEFAULT_VALUE の項目数 (${#DEFAULT_VALUES}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240124]エラー: COLUMN_DEFAULT_VALUE の項目数 (${#DEFAULT_VALUES}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#COMMENTS[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240125]エラー: COLUMN_COMMENT の項目数 (${#COMMENTS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240125]エラー: COLUMN_COMMENT の項目数 (${#COMMENTS}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# trueの数をカウント
true_count=0
for key in "${foreign_keys[@]}"; do
    if [[ "$key" == "true" ]]; then
        true_count=$((true_count + 1))
    fi
done

# trueが1つ以上でFOREIGN_TABLENAMEが空の場合にエラーを出力
if [[ $true_count -ge 1 && -z "$FOREIGN_TABLENAME" ]]; then
    echo "[240126]エラー: COLUMN_FOREIGN_KEY に 'true' が1つ以上含まれている場合、FOREIGN_TABLENAME の値を指定する必要があります。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240126]エラー: COLUMN_FOREIGN_KEY に 'true' が1つ以上含まれている場合、FOREIGN_TABLENAME の値を指定する必要があります。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# COLUMN_PRIMARY_KEYと設定値の数を比較
for i in "${!COLUMN_PRIMARY_KEY[@]}"; do
    if [[ "${COLUMN_PRIMARY_KEY[i]}" == "true" && "${COLUMN_NOT_NULL[i]}" == "true" ]]; then
        echo "[240201]ワーニング: PRIMARY KEY として設定されている '${COLUMN_DATA_NAME[i]}' は NOT NULL としても設定されています。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [WARN]  [$(basename $0)] [240201]ワーニング: PRIMARY KEY として設定されている '${COLUMN_DATA_NAME[i]}' は NOT NULL としても設定されています。" >> ${LOG_DIR}/data_generator.log
    elif [[ "${COLUMN_PRIMARY_KEY[i]}" == "true" && "${COLUMN_UNIQUE_KEY[i]}" == "true" ]]; then
        echo "[240202]ワーニング: PRIMARY KEY として設定されている '${COLUMN_UNIQUE_KEY[i]}' は UNIQUE KEY としても設定されています。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [WARN]  [$(basename $0)] [240202]ワーニング: PRIMARY KEY として設定されている '${COLUMN_UNIQUE_KEY[i]}' は UNIQUE KEY としても設定されています。" >> ${LOG_DIR}/data_generator.log
    elif [[ "${COLUMN_PRIMARY_KEY[i]}" == "true" && "${COLUMN_INDEX_KEY[i]}" == "true" ]]; then
        echo "[240203]ワーニング: PRIMARY KEY として設定されている '${COLUMN_INDEX_KEY[i]}' は INDEX KEY としても設定されています。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [WARN]  [$(basename $0)] [240203]ワーニング: PRIMARY KEY として設定されている '${COLUMN_INDEX_KEY[i]}' は INDEX KEY としても設定されています。" >> ${LOG_DIR}/data_generator.log
    fi
done

# IP アドレス形式を検証するための正規表現
ip_regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

# SQL_SET_HOST の値を検証
if [[ "$SQL_SET_HOST" == "localhost" || "$SQL_SET_HOST" == "127.0.0.1" || "$SQL_SET_HOST" == "%" || "$SQL_SET_HOST" =~ $ip_regex ]]; then
    # SQL_SET_HOST が IP アドレス形式の場合、追加の範囲チェック (0〜255)
    if [[ "$SQL_SET_HOST" =~ $ip_regex ]]; then
        IFS='.' read -ra octets <<< "$SQL_SET_HOST"  # IP アドレスをドット区切りで分割
        for octet in "${octets[@]}"; do
            # 各オクテットが 0〜255 の範囲内であるかを確認
            if ((octet < 0 || octet > 255)); then
                echo "[240127]エラー: '${SQL_SET_HOST}' は無効なIPアドレスです。"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240127]エラー: '${SQL_SET_HOST}' は無効なIPアドレスです。" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
        done
    fi
else
    # 許可されていない値の場合のエラーメッセージ
    echo "[240128]エラー: '${SQL_SET_HOST}' は許可されていない値です。"
    echo "許可される値: 'localhost', '127.0.0.1', '%', または有効なIPアドレス形式 (例: 255.255.255.255)"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240128]エラー: '${SQL_SET_HOST}' は許可されていない値です。" >> ${LOG_DIR}/data_generator.log
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可される値: 'localhost', '127.0.0.1', '%', または有効なIPアドレス形式 (例: 255.255.255.255)" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# POSTGRESQL_TEMPLATE の検証
if [[ "$POSTGRESQL_TEMPLATE" != "template0" && "$POSTGRESQL_TEMPLATE" != "template1" ]]; then
    echo "[240129]エラー: '${POSTGRESQL_TEMPLATE}' は許可されていない値です。"
    echo "許可される値: 'template0', 'template1'"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240129]エラー: '${POSTGRESQL_TEMPLATE}' は許可されていない値です。" >> ${LOG_DIR}/data_generator.log
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可される値: 'template0', 'template1'" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# POSTGRESQL_TEMPLATE が template1 の場合、DATABASE_COLLATE を検証
if [[ "$POSTGRESQL_TEMPLATE" == "template1" && "$DATABASE_COLLATE" != "C" ]]; then
    echo "[240130]エラー: 'template1' を使用する場合、DATABASE_COLLATE は 'C' のみ許可されます。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240130]エラー: 'template1' を使用する場合、DATABASE_COLLATE は 'C' のみ許可されます。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# POSTGRESQL_CONNECTION_LIMIT の検証
if [[ "$POSTGRESQL_CONNECTION_LIMIT" -ne -1 && "$POSTGRESQL_CONNECTION_LIMIT" -lt 1 ]]; then
    echo "[240131]エラー: '${POSTGRESQL_CONNECTION_LIMIT}' は -1 または 1以上の値でなければなりません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240131]エラー: '${POSTGRESQL_CONNECTION_LIMIT}' は -1 または 1以上の値でなければなりません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# POSTGRESQL_ALLOW_CONNECTIONS の検証
if [[ "$POSTGRESQL_ALLOW_CONNECTIONS" != "true" && "$POSTGRESQL_ALLOW_CONNECTIONS" != "false" ]]; then
    echo "[240132]エラー: '${POSTGRESQL_ALLOW_CONNECTIONS}' は許可されていない値です。"
    echo "許可される値: 'true', 'false'"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240132]エラー: '${POSTGRESQL_ALLOW_CONNECTIONS}' は許可されていない値です。" >> ${LOG_DIR}/data_generator.log
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可される値: 'true', 'false'" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 検証がすべて完了
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [240001]設定ファイルの内容問題なし。" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}/data_generator.log
echo "[240001]設定ファイルの内容問題なし。"
exit 0