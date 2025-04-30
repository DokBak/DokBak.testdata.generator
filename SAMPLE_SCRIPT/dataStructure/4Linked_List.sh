#!/bin/bash

# 연결 리스트를 문자열로 관리
linked_list="node1:10,node2:20,node3:30"

# 리스트 순회
IFS=',' read -r -a nodes <<< "$linked_list"
for node in "${nodes[@]}"; do
    IFS=':' read -r name value <<< "$node"
    echo "노드 이름: $name, 값: $value"
done
