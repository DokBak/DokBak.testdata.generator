#!/bin/bash

###################################################################################
#
#  シェル名      : 設定ファイルチェックシェル
#
#  作成者        : DokBak
#  作成日        : 2025/01/04          新規作成
#  修正日        : 2025/04/06          コードリファクタリング
#
#  処理概要      : db_sql_config.txt の内容をチェックし、必要な設定値の有効性を確認します。
#
#  パラメータ    　:
#     なし
#
#  実行方法    　:
#     sh ./script/db_check_sql_validate_config.sh
#
#  参照        :　https://github.com/DokBak/DokBak.testdata.generator
#
###################################################################################

echo "設定ファイルの有効性チェックを実行中..."
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}/data_generator.log

# 設定ファイルのパス
_config_file="${CONFIG_DIR}/db_sql_config.txt"

# 設定ファイルの存在確認
if [[ ! -f "${_config_file}" ]]; then
    echo "[240101]エラー: 設定ファイル ${_config_file} が存在しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240101]エラー: 設定ファイル ${_config_file} が存在しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 入力された権限をカンマ区切りで配列に変換
IFS=',' read -ra _input_rights <<< "${DATABASE_USERRIGHT}"

# 共通設定
# DATABASE_NAME の確認
if [[ -z "${DATABASE_NAME}" ]]; then
    echo "[240102]エラー: 'DATABASE_NAME' は空白の値を指定できません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240102]エラー: 'DATABASE_NAME' は空白の値を指定できません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# DATABASE_USERNAME の確認
if [[ -z "${DATABASE_USERNAME}" ]]; then
    echo "[240103]エラー: 'DATABASE_USERNAME' は空白の値を指定できません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240103]エラー: 'DATABASE_USERNAME' は空白の値を指定できません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# DATABASE_PASSWORD の確認
if [[ -z "${DATABASE_PASSWORD}" ]]; then
    echo "[240104]エラー: 'DATABASE_PASSWORD' は空白の値を指定できません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240104]エラー: 'DATABASE_PASSWORD' は空白の値を指定できません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# SET_TABLENAME の確認
if [[ -z "${SET_TABLENAME}" ]]; then
    echo "[240105]エラー: 'SET_TABLENAME' は空白の値を指定できません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240105]エラー: 'SET_TABLENAME' は空白の値を指定できません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# IFSを使ってカンマ区切りで値を配列に変換
IFS=',' read -ra _data_names <<< "${COLUMN_DATA_NAME//\"/}"
IFS=',' read -ra _primary_keys <<< "${COLUMN_PRIMARY_KEY//\"/}"
IFS=',' read -ra _unique_keys <<< "${COLUMN_UNIQUE_KEY//\"/}"
IFS=',' read -ra _foreign_keys <<< "${COLUMN_FOREIGN_KEY//\"/}"
IFS=',' read -ra _index_keys <<< "${COLUMN_INDEX_KEY//\"/}"
IFS=',' read -ra _not_nulls <<< "${COLUMN_NOT_NULL//\"/}"
IFS=',' read -ra _auto_increments <<< "${COLUMN_AUTO_INCREMENT//\"/}"
IFS=',' read -ra _default_values <<< "${COLUMN_DEFAULT_VALUE//\"/}"
IFS=',' read -ra _comments <<< "${COLUMN_COMMENT//\"/}"

# COLUMN_COUNTSと設定値の数を比較
if [[ ${#_data_names[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240106]エラー: COLUMN_DATA_NAME の項目数 (${#_data_names[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240106]エラー: COLUMN_DATA_NAME の項目数 (${#_data_names[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#_primary_keys[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240107]エラー: COLUMN_PRIMARY_KEY の項目数 (${#_primary_keys[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240107]エラー: COLUMN_PRIMARY_KEY の項目数 (${#_primary_keys[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#_unique_keys[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240108]エラー: COLUMN_UNIQUE_KEY の項目数 (${#_unique_keys[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240108]エラー: COLUMN_UNIQUE_KEY の項目数 (${#_unique_keys[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#_foreign_keys[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240109]エラー: COLUMN_FOREIGN_KEY の項目数 (${#_foreign_keys[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240109]エラー: COLUMN_FOREIGN_KEY の項目数 (${#_foreign_keys[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#_index_keys[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240110]エラー: COLUMN_INDEX_KEY の項目数 (${#_index_keys[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240110]エラー: COLUMN_INDEX_KEY の項目数 (${#_index_keys[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#_not_nulls[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240111]エラー: COLUMN_NOT_NULL の項目数 (${#_not_nulls[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240111]エラー: COLUMN_NOT_NULL の項目数 (${#_not_nulls[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#_auto_increments[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240112]エラー: COLUMN_AUTO_INCREMENT の項目数 (${#_auto_increments[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240112]エラー: COLUMN_AUTO_INCREMENT の項目数 (${#_auto_increments[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#_default_values[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240113]エラー: COLUMN_DEFAULT_VALUE の項目数 (${#_default_values[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240113]エラー: COLUMN_DEFAULT_VALUE の項目数 (${#_default_values[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
elif [[ ${#_comments[@]} -ne ${COLUMN_COUNTS} ]]; then
    echo "[240114]エラー: COLUMN_COMMENT の項目数 (${#_comments[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240114]エラー: COLUMN_COMMENT の項目数 (${#_comments[@]}) が COLUMN_COUNTS (${COLUMN_COUNTS}) と一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

_valid_column=("true" "false" "NONE")

for _value in "${_primary_keys[@]}"; do
    if [[ ! " ${_valid_column[@]} " =~ " ${_value} " ]]; then
        echo "[240115]エラー: COLUMN_PRIMARY_KEYの'${COLUMN_PRIMARY_KEY}' に許可されていない値があります。許可されている値: ${_valid_column[*]}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240115]エラー: COLUMN_PRIMARY_KEYの'${COLUMN_PRIMARY_KEY}' に許可されていない値があります。許可されている値: ${_valid_column[*]}" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
done
for _value in "${_unique_keys[@]}"; do
    if [[ ! " ${_valid_column[@]} " =~ " ${_value} " ]]; then
        echo "[240116]エラー: COLUMN_UNIQUE_KEYの'${COLUMN_UNIQUE_KEY}' に許可されていない値があります。許可されている値: ${_valid_column[*]}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240116]エラー: COLUMN_UNIQUE_KEYの'${COLUMN_UNIQUE_KEY}' に許可されていない値があります。許可されている値: ${_valid_column[*]}" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
done
for _value in "${_foreign_keys[@]}"; do
    if [[ ! " ${_valid_column[@]} " =~ " ${_value} " ]]; then
        echo "[240117]エラー: COLUMN_FOREIGN_KEYの'${COLUMN_FOREIGN_KEY}' に許可されていない値があります。許可されている値: ${_valid_column[*]}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240117]エラー: COLUMN_FOREIGN_KEYの'${COLUMN_FOREIGN_KEY}' に許可されていない値があります。許可されている値: ${_valid_column[*]}" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
done    
for _value in "${_index_keys[@]}"; do
    if [[ ! " ${_valid_column[@]} " =~ " ${_value} " ]]; then
        echo "[240118]エラー: COLUMN_INDEX_KEYの'${COLUMN_INDEX_KEY}' に許可されていない値があります。許可されている値: ${_valid_column[*]}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240118]エラー: COLUMN_INDEX_KEYの'${COLUMN_INDEX_KEY}' に許可されていない値があります。許可されている値: ${_valid_column[*]}" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
done
for _value in "${_not_nulls[@]}"; do
    if [[ ! " ${_valid_column[@]} " =~ " ${_value} " ]]; then
        echo "[240119]エラー: COLUMN_NOT_NULLの'${COLUMN_NOT_NULL}' に許可されていない値があります。許可されている値: ${_valid_column[*]}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240119]エラー: COLUMN_NOT_NULLの'${COLUMN_NOT_NULL}' に許可されていない値があります。許可されている値: ${_valid_column[*]}" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
done
for _value in "${_auto_increments[@]}"; do
    if [[ ! " ${_valid_column[@]} " =~ " ${_value} " ]]; then
        echo "[240120]エラー: COLUMN_AUTO_INCREMENTの'${COLUMN_AUTO_INCREMENT}' に許可されていない値があります。許可されている値: ${_valid_column[*]}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240120]エラー: COLUMN_AUTO_INCREMENTの'${COLUMN_AUTO_INCREMENT}' に許可されていない値があります。許可されている値: ${_valid_column[*]}" >> ${LOG_DIR}/data_generator.log
        exit 1
    fi
done

# trueの数をカウント
_true_count=0
for _key in "${_foreign_keys[@]}"; do
    if [[ "${_key}" == "true" ]]; then
        _true_count=$((_true_count + 1))
    fi
done

# trueが1つ以上でFOREIGN_TABLENAMEが空の場合にエラーを出力
if [[ ${_true_count} -ge 1 && -z "${FOREIGN_TABLENAME}" ]]; then
    echo "[240121]エラー: COLUMN_FOREIGN_KEY に 'true' が1つ以上含まれている場合、FOREIGN_TABLENAME の値を指定する必要があります。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240121]エラー: COLUMN_FOREIGN_KEY に 'true' が1つ以上含まれている場合、FOREIGN_TABLENAME の値を指定する必要があります。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# COLUMN_PRIMARY_KEYと設定値の数を比較
for _i in "${!_primary_keys[@]}"; do
    if [[ "${_primary_keys[_i]}" == "true" && "${_not_nulls[_i]}" == "true" ]]; then
        echo "[240201]ワーニング: PRIMARY KEY として設定されている '${_data_names[_i]}' は NOT NULL としても設定されています。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [WARN]  [$(basename $0)] [240201]ワーニング: PRIMARY KEY として設定されている '${_data_names[_i]}' は NOT NULL としても設定されています。" >> ${LOG_DIR}/data_generator.log
    elif [[ "${_primary_keys[_i]}" == "true" && "${_unique_keys[_i]}" == "true" ]]; then
        echo "[240202]ワーニング: PRIMARY KEY として設定されている '${_data_names[_i]}' は UNIQUE KEY としても設定されています。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [WARN]  [$(basename $0)] [240202]ワーニング: PRIMARY KEY として設定されている '${_data_names[_i]}' は UNIQUE KEY としても設定されています。" >> ${LOG_DIR}/data_generator.log
    elif [[ "${_primary_keys[_i]}" == "true" && "${_index_keys[_i]}" == "true" ]]; then
        echo "[240203]ワーニング: PRIMARY KEY として設定されている '${_data_names[_i]}' は INDEX KEY としても設定されています。"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [WARN]  [$(basename $0)] [240203]ワーニング: PRIMARY KEY として設定されている '${_data_names[_i]}' は INDEX KEY としても設定されています。" >> ${LOG_DIR}/data_generator.log
    fi
done

# DBMS_NAME の確認
case "${DBMS_NAME}" in
    "MySQL"|"MariaDB")
        # DBMS_NAMEに基づくDATABASE_CHARACTER_SET の確認
        _valid_character_set=("utf8mb4" "utf8" "sjis" "euckr")
        if [[ ! " ${_valid_character_set[@]} " =~ " ${DATABASE_CHARACTER_SET} " ]]; then
            echo "[240122]エラー: '${DATABASE_CHARACTER_SET}' は${DBMS_NAME}で許可されている文字セットではありません。"
            echo "許可されている文字セット: ${_valid_character_set[*]}"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240122]エラー: '${DATABASE_CHARACTER_SET}' は${DBMS_NAME}で許可されている文字セットではありません。" >> ${LOG_DIR}/data_generator.log
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可されている文字セット: ${_valid_character_set[*]}" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
        # 許可されている文字データの並び順設定値のリスト
        _valid_collate=("utf8mb4_unicode_ci" "utf8mb4_general_ci" "utf8mb4_bin")
        if [[ ! " ${_valid_collate[@]} " =~ " ${DATABASE_COLLATE} " ]]; then
            echo "[240123]エラー: '${DATABASE_COLLATE}' は${DBMS_NAME}で許可されている文字セットではありません。"
            echo "許可されている文字セット: ${_valid_collate[*]}"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240123]エラー: '${DATABASE_COLLATE}' は${DBMS_NAME}で許可されている文字セットではありません。" >> ${LOG_DIR}/data_generator.log
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可されている文字セット: ${_valid_collate[*]}" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
        # 許可されている権限のリスト
        _valid_userrights=("ALL PRIVILEGES" "SELECT" "INSERT" "UPDATE" "DELETE" "CREATE" "DROP")
        # "ALL PRIVILEGES"が含まれていて、他にも権限がある場合はエラー
        if [[ " ${_input_rights[@]} " =~ " ALL PRIVILEGES " && "${#_input_rights[@]}" -gt 1 ]]; then
            echo "[240124]エラー: 'ALL PRIVILEGES' が指定されている場合、他の権限を指定することはできません。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240124]エラー: 'ALL PRIVILEGES' が指定されている場合、他の権限を指定することはできません。" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
        
        # MySQL/MariaDBの権限リストと照合
        if [[ -z "${DATABASE_USERRIGHT}" ]]; then
            echo "[240125]エラー: 'DATABASE_USERRIGHT' は空白の値を指定できません。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240125]エラー: 'DATABASE_USERRIGHT' は空白の値を指定できません。" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
        for _right in "${_input_rights[@]}"; do
            if [[ ! " ${_valid_userrights[*]} " =~ " ${_right} " ]]; then
                echo "[240126]エラー: '${_right}' はMySQLで許可されている権限ではありません。"
                echo "許可されている権限: ${_valid_userrights[*]}"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240126]エラー: '${_right}' はMySQLで許可されている権限ではありません。" >> ${LOG_DIR}/data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可されている権限: ${_valid_userrights[*]}" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
        done
        # DATABASE_TABLERIGHTの検証
        if [[ -z "${DATABASE_TABLERIGHT}" || "${DATABASE_TABLERIGHT}" != "*" && "${DATABASE_TABLERIGHT}" != "${SET_TABLENAME}" ]]; then
            echo "[240127]エラー: 'DATABASE_TABLERIGHT' は '*' または '\${SET_TABLENAME}' (${SET_TABLENAME}) のいずれかでなければなりません。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240127]エラー: 'DATABASE_TABLERIGHT' は '*' または '\${SET_TABLENAME}' (${SET_TABLENAME}) のいずれかでなければなりません。" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
        # IP アドレス形式を検証するための正規表現
        _ip_regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"
        # SQL_SET_HOST の値を検証
        if [[ "${SQL_SET_HOST}" == "localhost" || "${SQL_SET_HOST}" == "127.0.0.1" || "${SQL_SET_HOST}" == "%" || "${SQL_SET_HOST}" =~ ${_ip_regex} ]]; then
            # SQL_SET_HOST が IP アドレス形式の場合、追加の範囲チェック (0〜255)
            IFS='.' read -ra _octets <<< "${SQL_SET_HOST}"  # IP アドレスをドット区切りで分割
            if [[ "${SQL_SET_HOST}" =~ ${_ip_regex} ]]; then
                for _octet in "${_octets[@]}"; do
                    # 各オクテットが 0〜255 の範囲内であるかを確認
                    if ((_octet < 0 || _octet > 255)); then
                        echo "[240128]エラー: '${SQL_SET_HOST}' は無効なIPアドレスです。"
                        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240128]エラー: '${SQL_SET_HOST}' は無効なIPアドレスです。" >> ${LOG_DIR}/data_generator.log
                        exit 1
                    fi
                done
            fi
        else
            # 許可されていない値の場合のエラーメッセージ
            echo "[240129]エラー: '${SQL_SET_HOST}' は許可されていない値です。"
            echo "許可される値: 'localhost', '127.0.0.1', '%', または有効なIPアドレス形式 (例: 255.255.255.255)"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240129]エラー: '${SQL_SET_HOST}' は許可されていない値です。" >> ${LOG_DIR}/data_generator.log
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可される値: 'localhost', '127.0.0.1', '%', または有効なIPアドレス形式 (例: 255.255.255.255)" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
        ;;
    "PostgreSQL")
        # DBMS_NAMEに基づくDATABASE_CHARACTER_SET の確認
        _valid_character_set=("utf8" "sjis")
        if [[ ! " ${_valid_character_set[@]} " =~ " ${DATABASE_CHARACTER_SET} " ]]; then
            echo "[240130]エラー: '${DATABASE_CHARACTER_SET}' は${DBMS_NAME}で許可されている文字セットではありません。"
            echo "許可されている文字セット: ${_valid_character_set[*]}"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240130]エラー: '${DATABASE_CHARACTER_SET}' は${DBMS_NAME}で許可されている文字セットではありません。" >> ${LOG_DIR}/data_generator.log
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可されている文字セット: ${_valid_character_set[*]}" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
        # POSTGRESQL_TEMPLATE が template1 DATABASE_CHARACTER_SET を検証
        if [[ "${POSTGRESQL_TEMPLATE}" == "template1" && "${DATABASE_CHARACTER_SET}" != "utf8" ]]; then
            echo "[240131]エラー: 'template1' を使用する場合、DATABASE_CHARACTER_SET は 'utf8' のみ許可されます。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240131]エラー: 'template1' を使用する場合、DATABASE_CHARACTER_SET は 'utf8' のみ許可されます。" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi

        # 許可されている文字データの並び順設定値のリスト
        _valid_collate=("C" "en_US.UTF-8" "ko_KR.UTF-8" "ja_JP.UTF-8")
        if [[ ! " ${_valid_collate[@]} " =~ " ${DATABASE_COLLATE} " ]]; then
            echo "[240132]エラー: '${DATABASE_COLLATE}' は${DBMS_NAME}で許可されている文字セットではありません。"
            echo "許可されている文字セット: ${_valid_collate[*]}"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240132]エラー: '${DATABASE_COLLATE}' は${DBMS_NAME}で許可されている文字セットではありません。" >> ${LOG_DIR}/data_generator.log
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可されている文字セット: ${_valid_collate[*]}" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
        # POSTGRESQL_TEMPLATE が template1 の場合、DATABASE_COLLATE を検証
        if [[ "${POSTGRESQL_TEMPLATE}" == "template1" && "${DATABASE_COLLATE}" != "C" ]]; then
            echo "[240133]エラー: 'template1' を使用する場合、DATABASE_COLLATE は 'C' のみ許可されます。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240133]エラー: 'template1' を使用する場合、DATABASE_COLLATE は 'C' のみ許可されます。" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi

        # 許可されている権限のリスト
        if [[ -z "${DATABASE_USERRIGHT}" ]]; then
            echo "[240134]エラー: 'DATABASE_USERRIGHT' は空白の値を指定できません。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240134]エラー: 'DATABASE_USERRIGHT' は空白の値を指定できません。" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
        _valid_userrights=("Superuser" "Createrole" "CreateDB" "Replication" "BypassRLS")
        # PostgreSQLの権限リストと照合
        for _right in "${_input_rights[@]}"; do
            if [[ ! " ${_valid_userrights[*]} " =~ " ${_right} " ]]; then
                echo "[240135]エラー: '${_right}' はPostgreSQLで許可されている権限ではありません。"
                echo "許可されている権限: ${_valid_userrights[*]}"
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240135]エラー: '${_right}' はPostgreSQLで許可されている権限ではありません。" >> ${LOG_DIR}/data_generator.log
                echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可されている権限: ${_valid_userrights[*]}" >> ${LOG_DIR}/data_generator.log
                exit 1
            fi
        done
        # SET_SCHEMA の確認
        if [[ -z "${SET_SCHEMA}" ]]; then
            echo "[240136]エラー: 'SET_SCHEMA' は空白の値を指定できません。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240136]エラー: 'SET_SCHEMA' は空白の値を指定できません。" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi

        # POSTGRESQL_CONNECTION_LIMIT の検証
        if [[ "${POSTGRESQL_CONNECTION_LIMIT}" -ne -1 && "${POSTGRESQL_CONNECTION_LIMIT}" -lt 1 ]]; then
            echo "[240137]エラー: '${POSTGRESQL_CONNECTION_LIMIT}' は -1 または 1以上の値でなければなりません。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240137]エラー: '${POSTGRESQL_CONNECTION_LIMIT}' は -1 または 1以上の値でなければなりません。" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi

        # POSTGRESQL_ALLOW_CONNECTIONS の検証
        if [[ "${POSTGRESQL_ALLOW_CONNECTIONS}" != "true" && "${POSTGRESQL_ALLOW_CONNECTIONS}" != "false" ]]; then
            echo "[240138]エラー: '${POSTGRESQL_ALLOW_CONNECTIONS}' は許可されていない値です。"
            echo "許可される値: 'true', 'false'"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240138]エラー: '${POSTGRESQL_ALLOW_CONNECTIONS}' は許可されていない値です。" >> ${LOG_DIR}/data_generator.log
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可される値: 'true', 'false'" >> ${LOG_DIR}/data_generator.log
            exit 1
        fi
        ;;
    *)
        echo "[240139]エラー: DBMS_NAMEの'${DBMS_NAME}' は許可されていない値です。"
        echo "許可された値: ${DBMS_NAME[*]}"
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [240139]エラー: DBMS_NAMEの'${DBMS_NAME}' は許可されていない値です。" >> ${LOG_DIR}/data_generator.log
        echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] 許可された値: ${DBMS_NAME[*]}" >> ${LOG_DIR}/data_generator.log
        exit 1 
        ;;
esac

# 検証がすべて完了
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [240001]設定ファイルの内容問題なし。" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}/data_generator.log
echo "[240001]設定ファイルの内容問題なし。"
exit 0