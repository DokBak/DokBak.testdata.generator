#!/bin/sh

#-------------------------
# 테스트 쉘 : 명령어 히스토리 목록 처리 (!)
#-------------------------
function CommandExclamationMark(){
    echo 
    echo "## 명령어 히스토리 목록 처리 (!) 시작 ##"
    echo " 명령어  : !"
    echo " 사용방법 : !"
    echo " 기본설명 : !는 이벤트 지시자로 !뒤에 오는 문자로 최근 실행하였던 명령을 실행한다. (스크립트 상에서는 사용할수 없다.)"
    echo
    echo " 예시1) !!"
    echo " 부가설명) ! : 바로 직전의 명령어를 실행"
    echo
    echo " 예시2) pwd"
    echo " 예시2) !n"
    echo " 부가설명) n : n번째로 실행한 명령어를 실행(실패한 명령어여도 실행)"
    echo
    echo " 예시3) pwd"
    echo " 예시3) !-n"
    echo " 부가설명) -n : 현재 명령행에서 n을 뺀 행에 실행한 명령어를 실행(실패한 명령어여도 실행)"
    echo
    echo " 예시4) pwd"
    echo " 예시4) date"
    echo " 예시4) !p"
    echo " 부가설명) p : p로 시작하는 가장 최근에 사용한 명령어를 실행(실패한 명령어여도 실행)"
    echo
    echo " 예시5) date"
    echo " 예시5) pwd"
    echo " 예시5) !?at"
    echo " 부가설명) ?at : at를 포함하는 가장 최근에 사용한 명령어를 실행(실패한 명령어여도 실행)"
    echo
    echo " 예시6) echo a s d f"
    echo " 예시6) echo !:2"
    echo " 부가설명) !:n : 이전에 사용하였던 [echo a s d f] 명령에서 n번째 아규먼트를 가져온다."
    echo
    echo " 예시7) echo a s d f"
    echo " 예시7) echo !^"
    echo " 부가설명) !^ : 이전에 사용하였던 [echo a s d f] 명령에서 첫번째 아규먼트를 가져온다."
    echo
    echo " 예시8) echo a s d f"
    echo " 예시8) echo !^"
    echo " 부가설명) !^ : 이전에 사용하였던 [echo a s d f] 명령에서 마지막 아규먼트를 가져온다."
    echo
    echo " 예시9) echo a s d f"
    echo " 예시9) echo !*"
    echo " 부가설명) !* : 이전에 사용하였던 [echo a s d f] 명령에서 사용한 모든 아규먼트를 가져온다."
    echo
    echo "## 명령어 히스토리 목록 처리 (!) 종료 ##"
    echo 
}

CommandExclamationMark