#!/bin/bash

# YAML 설정 파일
CONFIG_FILE="table_config.yaml"

# PostgreSQL 접속 정보
DB_USER="your_username"
DB_NAME="your_database"

# 테이블 이름 읽기
TABLE_NAME=$(yq e '.table_name' $CONFIG_FILE)

# CREATE TABLE 명령문 생성
SQL="CREATE TABLE $TABLE_NAME ("

# 컬럼 정보 파싱
COLUMNS=$(yq e '.columns[]' -o=json $CONFIG_FILE)
echo "$COLUMNS" | jq -c '.[]' | while read COLUMN; do
  NAME=$(echo $COLUMN | jq -r '.name')
  TYPE=$(echo $COLUMN | jq -r '.type')
  LENGTH=$(echo $COLUMN | jq -r '.length // empty')
  NOT_NULL=$(echo $COLUMN | jq -r '.not_null')
  UNIQUE=$(echo $COLUMN | jq -r '.unique')

  # PostgreSQL 데이터 타입 매핑
  case "$TYPE" in
    "char") SQL_TYPE="CHAR($LENGTH)" ;;
    "string") SQL_TYPE="VARCHAR($LENGTH)" ;;
    "int") SQL_TYPE="INTEGER" ;;
    "float") SQL_TYPE="REAL" ;;
    "double") SQL_TYPE="DOUBLE PRECISION" ;;
    "boolean") SQL_TYPE="BOOLEAN" ;;
    "date") SQL_TYPE="TIMESTAMP" ;;
    *) SQL_TYPE="$TYPE" ;; # 기본값
  esac

  # 제약 조건 처리
  CONSTRAINTS=""
  if [[ "$NOT_NULL" == "true" ]]; then
    CONSTRAINTS+=" NOT NULL"
  fi
  if [[ "$UNIQUE" == "true" ]]; then
    CONSTRAINTS+=" UNIQUE"
  fi

  # 컬럼 추가
  SQL+="\n  $NAME $SQL_TYPE$CONSTRAINTS,"
done

# 마지막 콤마 제거
SQL=${SQL::-1}
SQL+="\n);"

# SQL 실행
 echo $SQL

# 결과 확인
if [[ $? -eq 0 ]]; then
  echo "테이블 $TABLE_NAME 생성 완료!"
else
  echo "테이블 생성 중 오류 발생!"
fi
