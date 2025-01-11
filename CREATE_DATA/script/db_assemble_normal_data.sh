#!/bin/bash

###################################################################################
#
#  シェル名      : ノーマルデータ生成シェル
#
#  作成者        : DokBak
#  作成日        : 2024/12/13          新規作成
#
#  処理概要      : 設定内容に基づきランダムな文字列、数字、日付データを生成します。
#
#  パラメータ    　:
#     なし
#
#  実行方法    　:
#     sh ./db_assemble_normal_data.sh
#
#  参照        :　https://github.com/DokBak/DokBak_Shell_CMD
#
###################################################################################

echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] START" >> ${LOG_DIR}/data_generator.log

# 作成データ
_assemble_items=""

# データ型と長さの項目数が COLUMN_COUNTS と一致しているか確認
IFS=',' read -ra _data_types <<< "${COLUMN_DATA_TYPE//\"/}"
IFS=',' read -ra _data_lengths <<< "${COLUMN_DATA_LENGTH//\"/}"

# COLUMN_COUNTS が正しいか確認
if [[ "${#_data_types[@]}" -ne "${COLUMN_COUNTS}" || "${#_data_lengths[@]}" -ne "${COLUMN_COUNTS}" ]]; then
    echo "[410101]エラー: COLUMN_COUNTS と DATA_TYPE、または DATA_LENGTH の項目数が一致しません。"
    echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [410101]エラー: COLUMN_COUNTS と DATA_TYPE、または DATA_LENGTH の項目数が一致しません。" >> ${LOG_DIR}/data_generator.log
    exit 1
fi

# 順番に設定内容を確認し、対応するスクリプトを実行
for _i in "${!_data_types[@]}"; do
    _type="${_data_types[$_i]}"
    _length="${_data_lengths[$_i]}"
    _item_number=$((_i + 1))

    echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 処理中: 第${_item_number}項目 (データ型: ${_type}, 長さ: ${_length})" >> ${LOG_DIR}/data_generator.log

    case "${_type}" in
        char|string)
            _item=`sh ${SCRIPT_DIR}/db_gen_string_data.sh ${_length} ${CASE_MODE}`
            if [[ -n "${_assemble_items}" ]]; then
                _assemble_items+=",${_item}"  # 値が空でない場合、カンマを追加
            else
                _assemble_items="${_item}"  # 最初の値はカンマなしで追加
            fi
            ;;
        byte|short|int|long)
            _item=`sh ${SCRIPT_DIR}/db_gen_number_data.sh ${_length}`
            if [[ -n "${_assemble_items}" ]]; then
                _assemble_items+=",${_item}"  # 値が空でない場合、カンマを追加
            else
                _assemble_items="${_item}"  # 最初の値はカンマなしで追加
            fi
            ;;
        float|double)
            _integer_part=$(echo "$_length" | cut -d'.' -f1)
            _fractional_part=$(echo "$_length" | cut -d'.' -f2)
            _item=`sh ${SCRIPT_DIR}/db_gen_number_data.sh ${_integer_part} ${_fractional_part}`
            if [[ -n "$_assemble_items" ]]; then
                _assemble_items+=",${_item}"  # 値が空でない場合、カンマを追加
            else
                _assemble_items="${_item}"  # 最初の値はカンマなしで追加
            fi
            ;;
        boolean)
            # 0 または 1 をランダムに生成 (0: FALSE, 1: TRUE)
            _random_value=$((RANDOM % 2))
            # ランダム値に基づいて結果を出力
            if [[ "${_random_value}" -eq 0 ]]; then
                case "${DBMS_NAME}" in
                    "MySQL"|"MariaDB")
                        _item="0"
                        ;;
                    "PostgreSQL")
                        _item="FALSE"
                        ;;
                    *)
                        echo "サポートされていないDBMSです。"
                        exit 1 
                        ;;
                esac
            else
                case "${DBMS_NAME}" in
                    "MySQL"|"MariaDB")
                        _item="1"
                        ;;
                    "PostgreSQL")
                        _item="TRUE"
                        ;;
                    *)
                        echo "サポートされていないDBMSです。"
                        exit 1 
                        ;;
                esac
            fi
            if [[ -n "$_assemble_items" ]]; then
                _assemble_items+=",${_item}"  # 値が空でない場合、カンマを追加
            else
                _assemble_items="${_item}"  # 最初の値はカンマなしで追加
            fi
            echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] 生成された値：${_item}" >> ${LOG_DIR}/data_generator.log
            ;;
        date)
            # 日付フォーマットをシステム互換形式に変換
            _system_format="${_length}"

            # DATE_SEPARATORが設定されている場合、日付区切り文字を挿入
            if [[ -n "${DATE_SEPARATOR}" && "${DATE_SEPARATOR}" != " " ]]; then
                # YとMの間にDATE_SEPARATORを挿入
                _system_format=$(echo "${_system_format}" | sed 's#Y\(M\)#Y'"${DATE_SEPARATOR}"'\1#')
                # MとDの間にDATE_SEPARATORを挿入
                _system_format=$(echo "${_system_format}" | sed 's#M\(D\)#M'"${DATE_SEPARATOR}"'\1#')
            fi

            # TIME_SEPARATORが設定されている場合、時間区切り文字を挿入
            if [[ -n "${TIME_SEPARATOR}" && "${TIME_SEPARATOR}" != " " ]]; then
                # hとmの間にTIME_SEPARATORを挿入
                _system_format=$(echo "${_system_format}" | sed 's#h\(m\)#h'"${TIME_SEPARATOR}"'\1#')
                # mとsの間にTIME_SEPARATORを挿入
                _system_format=$(echo "${_system_format}" | sed 's#m\(s\)#m'"${TIME_SEPARATOR}"'\1#')
            fi

            # DATE_TIME_SEPARATORが設定されている場合、日付と時間の間に区切り文字を挿入
            # 日付と時間が全て存在する場合,日付と時間の間に”_"追加
            if [[ "${_system_format}" =~ "YY" || "${_system_format}" =~ "MM" || "${_system_format}" =~ "DD" ]] && [[ "${_system_format}" =~ "hh" || "${_system_format}" =~ "mm" || "${_system_format}" =~ "ss" ]]; then
                _system_format=$(echo "${_system_format}" | sed 's#\(DD\)\(hh\)#\1'"_"'\2#')
            fi

            # 1. 年(Y)
            _system_format=$(echo "${_system_format}" | sed -E -e 's/Y{4}/%Y/g' -e 's/Y{2}/%y/g' -e 's/Y{0}//g')
            # 2. 月(M)
            _system_format=$(echo "${_system_format}" | sed -E -e 's/M{2}/%m/g' -e 's/M{0}//g')
            # 3. 日(D)
            _system_format=$(echo "${_system_format}" | sed -E -e 's/D{2}/%d/g' -e 's/D{0}//g')
            # 4. 時(h)
            _system_format=$(echo "${_system_format}" | sed -E -e 's/h{2}/%H/g' -e 's/h{0}//g')
            # 5. 分(m)
            _system_format=$(echo "${_system_format}" | sed -E -e 's/m{2}/%M/g' -e 's/m{0}//g')
            # 6. 秒(s)
            _system_format=$(echo "${_system_format}" | sed -E -e 's/s{2}/%S/g' -e 's/s{0}//g')
            
            _item=`sh ${SCRIPT_DIR}/db_gen_date_data.sh "${_system_format}" `
            
            if [[ -n "$_assemble_items" ]]; then
                _assemble_items+=",${_item}"  # 値が空でない場合、カンマを追加
            else
                _assemble_items="${_item}"  # 最初の値はカンマなしで追加
            fi
            ;;
        *)
            echo "[410102]エラー: データ型 ${_type} はサポートされていません。"
            echo "$(date '+%Y/%m/%d %H:%M:%S') [ERROR] [$(basename $0)] [410102]エラー: データ型 ${_type} はサポートされていません。" >> ${LOG_DIR}/data_generator.log
            exit 1
            ;;
    esac
done

# 生成された文字列を出力
echo "$(date '+%Y/%m/%d %H:%M:%S') [DEBUG] [$(basename $0)] [410001]すべてのデータ生成が正常に完了しました。" >> ${LOG_DIR}/data_generator.log
echo "$(date '+%Y/%m/%d %H:%M:%S') [INFO]  [$(basename $0)] END" >> ${LOG_DIR}/data_generator.log
echo "${_assemble_items}"
exit 0