#!/bin/bash

tree="root:10,left:5,right:20,left_left:3,left_right:7,right_left:15,right_right:25"

# 트리 순회
IFS=',' read -r -a nodes <<< "$tree"
for node in "${nodes[@]}"; do
    IFS=':' read -r name value <<< "$node"
    echo "$name 값: $value"
done
