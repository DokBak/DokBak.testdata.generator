#!/bin/bash

stack=()

# push 함수
push() {
    stack+=("$1")
}

# pop 함수
pop() {
    if [ ${#stack[@]} -eq 0 ]; then
        echo "스택이 비어 있습니다."
    else
        last_index=$((${#stack[@]} - 1))
        echo "pop: ${stack[$last_index]}"
        unset stack[$last_index]
    fi
}

# 스택 연산
push 10
push 20
push 30
echo "현재 스택: ${stack[@]}"
pop
echo "현재 스택: ${stack[@]}"
