#!/bin/bash

queue=()

# enqueue 함수
enqueue() {
    queue+=("$1")
}

# dequeue 함수
dequeue() {
    if [ ${#queue[@]} -eq 0 ]; then
        echo "큐가 비어 있습니다."
    else
        echo "dequeue: ${queue[0]}"
        queue=("${queue[@]:1}")  # 첫 번째 요소 제거
    fi
}

# 큐 연산
enqueue 10
enqueue 20
enqueue 30
echo "현재 큐: ${queue[@]}"
dequeue
echo "현재 큐: ${queue[@]}"
