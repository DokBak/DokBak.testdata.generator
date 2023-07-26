#!/bin/sh

#-------------------------
# 테스트 쉘 : 쉘 스크립트 따옴표
#-------------------------
function ShellScriptQuotationMarks(){
    echo 
    echo "## 쉘 스크립트 따옴표 시작 ##"
    echo
    echo " 기본설명 : 큰따옴표(일부 특수 문자를 무시), 작은따옴표(모든 특수 문자를 무시)"
    QuotationMarks=TestData
    echo 
    echo "큰따옴표를 사용(일부 특수문자를 무시) : QuotationMarks = $QuotationMarks"
    echo 
    echo '작은따옴표를 사용(모든 특수문자를 무시) : QuotationMarks = $QuotationMarks'
    echo
    echo "## 쉘 스크립트 따옴표 종료 ##"
    echo 
}

ShellScriptQuotationMarks