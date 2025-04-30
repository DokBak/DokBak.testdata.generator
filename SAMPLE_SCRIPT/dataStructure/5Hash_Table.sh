#!/bin/bash

# 배열 초기화
keys=("key1" "key2" "key3")
values=("value1" "value2" "value3")

# 데이터 출력
for i in "${!keys[@]}"; do
    echo "${keys[$i]}: ${values[$i]}"
done
