#!/bin/sh

#-------------------------
# 테스트 쉘 : 현재 시간 출력 처리
#-------------------------
function CurrentDate(){
    echo 
    echo "## 현재 시간 출력 처리 시작 ##"
    echo " 명령어 : date"
    echo " 사용방법 : date [파라미터없음]"
    echo " 기본설명 : 현재 시간을 출력하는 명령어 (locale : ko_KR.UTF-8 기준 )"
    echo " 예시1) date 로케일에 따른 형식 출력"
    date
    echo
    echo " 예시2) date 형식 지정 방식"
    date "+%Y년 %m월 %d일 %A %H시 %M분 %S초 %Z"
    echo
    echo " - 날짜 + 시간 출력"
    echo " 출력형식 종류(%c) : %a %b/%e %H:%M:%S %Y (locale : ko_KR.UTF-8)"
    date "+%c"
    echo
    echo " - 날짜 형식 출력"
    echo " 출력형식 종류(%F) : %Y-%m-%d 와 같은 형식"
    date "+%F"
    echo " 출력형식 종류(%D) : %m/%d/%y 와 같은 형식"
    date "+%D"
    echo " 출력형식 종류(%x) : %m/%d/%Y 와 같은 형식"
    date "+%x"
    echo
    echo " - 연도 형식 출력"
    echo " 출력형식 종류(%Y) : 4자리 년도로 출력 ex)2022"
    date "+%Y"
    echo " 출력형식 종류(%y) : 2자리 년도로 출력 ex)22"
    date "+%y"
    echo " 출력형식 종류(%C) : 2022의 경우 앞의 두 자리 ex)20"
    date "+%C"
    echo
    echo " - 월 형식 출력"
    echo " 출력형식 종류(%m) : 월 출력(숫자) ex)11"
    date "+%m"
    echo " 출력형식 종류(%B) : 월 출력(영문시 풀네임 출력 January) ex)November"
    date "+%B"
    echo " 출력형식 종류(%b) : 월 출력(영문시 약어 출력 Jan) ex)Nov"
    date "+%b"
    echo " 출력형식 종류(%h) : 월 출력 %b와 같은 형식, 로케일에 영향없는 형식"
    date "+%h"
    echo
    echo " - 일 형식 출력"
    echo " 출력형식 종류(%d) : 일 출력 두 자리 출력 ex)01"
    date "+%d"
    echo " 출력형식 종류(%e) : 일 출력 한 자리 출력, %_d와 같은 의미 ex)1"
    date "+%e"
    date "+%_d"
    echo
    echo " - 요일 형식 출력"
    echo " 출력형식 종류(%A) : 요일 출력(영문시 Sunday) ex)Sunday"
    date "+%A"
    echo " 출력형식 종류(%a) : 요일 출력(영문시 Sun) ex)Sun"
    date "+%a"
    echo " 출력형식 종류(%u) : 요일 출력(숫자 1 : 월요일, 7 : 일요일)"
    date "+%u"
    echo " 출력형식 종류(%w) : 요일 출력(숫자 0 : 일요일, 6 : 월요일)"
    date "+%w"
    echo
    echo " - 시간 형식 출력"
    echo " 출력형식 종류(%r) : 시간 출력 시분초(12시간 단위) ex)오전 x시x분x초"
    date "+%r"
    echo " 출력형식 종류(%X) : 시간 출력 시분초(24시간 단위) ex)x시x분x초"
    date "+%X"
    echo " 출력형식 종류(%T) : 시간 출력 시분초(24시간 단위), %H:%M:%S와 같은 의미 ex)x시x분x초"
    date "+%T"
    echo " 출력형식 종류(%R) : 시간 출력 시분(24시간 단위) ex)x시x분"
    date "+%R"
    echo
    echo " - 오전오후 구분자 형식 출력"
    echo " 출력형식 종류(%p) : 오전 오후 형식 출력 ex)AM"
    date "+%p"
    echo
    echo " - 시 형식 출력"
    echo " 출력형식 종류(%H) : 두 자리 시간 출력(24시간 단위) ex)05"
    date "+%H"
    echo " 출력형식 종류(%I) : 두 자리 시간 출력(12시간 단위) ex)05"
    date "+%I"
    echo " 출력형식 종류(%k) : 한 자리 시간 출력(24시간 단위) ex)5"
    date "+%k"
    echo " 출력형식 종류(%l) : 한 자리 시간 출력(12시간 단위) ex)05"
    date "+%l"
    echo
    echo " - 분 형식 출력"
    echo " 출력형식 종류(%M) : 두 자리 분 출력 ex)05"
    date "+%M"
    echo
    echo " - 초 형식 출력"
    echo " 출력형식 종류(%S) : 두 자리 초 출력 ex)05"
    date "+%S"
    echo
    echo " - 지난 시간 계산 형식 출력"
    echo " 출력형식 종류(%j) : 올해의 경과된 날짜 시간 출력"
    date "+%j"
    echo " 출력형식 종류(%s) : 1970/01/01 00:00:00로부터 경과한 초 출력"
    date "+%s"
    echo " 출력형식 종류(%U) : 일요일이 시작으로 몇 주 출력(00~53)"
    date "+%U"
    echo " 출력형식 종류(%V) : 월요일이 시작으로 몇 주 출력(ISO 주 번호 01~53)"
    date "+%V"
    echo " 출력형식 종류(%W) : 월요일이 시작으로 몇 주 출력(00~53)"
    date "+%W"
    echo
    echo " - 타임존 형식 출력"
    echo " 출력형식 종류(%z) : 타임존 형식 출력 (시)"
    date "+%z"
    echo " 출력형식 종류(%Z) : 타임존 형식 출력(시간 대역 이름)"
    date "+%Z"
    echo
    echo " - 명령어 커맨드 형식 출력"
    echo " 출력형식 종류(%t) : 탭 출력"
    date "+%t"
    echo " 출력형식 종류(%n) : 새 줄 출력"
    date "+%n"
    echo " 출력형식 종류(%%) : % 출력"
    date "+%%"
    echo
    echo " 옵션 -u : 표준시간으로 출력하기 "
    echo " 예시3) date -u"
    date -u
    echo
    echo " 옵션 -R : 날짜 + 시간 출력 "
    echo " 예시3) date -R : %a, %d %b %Y %H:%M:%S %z 형식으로 출력(locale : C)"
    date -R
    echo
    echo "## 현재 시간 출력 처리 종료 ##"
    echo 
}

CurrentDate 