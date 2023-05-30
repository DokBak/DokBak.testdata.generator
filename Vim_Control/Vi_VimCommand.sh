#!/bin/sh

#-------------------------
# 테스트 쉘 : vim 조작법
#-------------------------
function VimCommand(){
    echo 
    echo "## vim 조작법 시작 ##"
    echo
    echo " 사전실행) vim 명령어 실행에 필요한 샘플 폴더 및 파일 작성 방법"
    echo "    mkdir vim_CMD_TestFolder/"
    mkdir -p vim_CMD_TestFolder
    echo '###vim Text Mod Command###' > vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo 
    echo ' 각 모드' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '   Normal Mode : 처음 실행한 상태' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> h(왼쪽 방향키) : 커서 위치부터 왼쪽으로 한 칸 이동' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> j(아래 방향키) : 커서 위치부터 아래쪽으로 한 칸 이동' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> k(위쪽 방향키) : 커서 위치부터 위쪽으로 한 칸 이동' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> l(오른쪽 방향키) : 커서 위치부터 오른쪽으로 한 칸 이동' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> x : 커서 위치의 문자 하나를 삭제' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> u : 편집 내용 하나 취소' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '   Insert Mode : i, a, o, I, A, O를 눌른후 텍스트를 입력할수 있는 상태' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> Normal 모드에서 Insert Mode로 이동' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> i : 커서 위치부터 Insert Mode 진입' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> I : 커서가 있는 줄의 맨 앞에서부터 Insert Mode 진입' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> a : 커서 위치의 다음 칸부터 Insert Mode 진입' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> A : 커서가 있는 줄의 끝에서부터 Insert Mode 진입' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> o : 커서 바로 아래에 줄을 만들고 Insert Mode 진입' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> O : 커서 바로 위에 줄을 만들고 Insert Mode 진입' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> Insert Mode에서 조작(삭제)' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> x(dl) : 커서 위치의 문자 삭제' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> X(dh) : 커서 위치의 바로 앞 문자 삭제' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> dw : 커서 위치의 한 단어를 삭제' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> d0 : 커서 위치부터 행의 처음까지 삭제' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> D(d$) : 커서 위치부터 헹의 맨끝까지 삭제' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> dd : 커서 위치의 행 전체를 삭제' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> dj : 커서 위치의 행과 그 다음 행을 삭제' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> dk : 커서 위치의 행과 그 앞 행을 삭제' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> Insert Mode에서 조작(복사/붙여넣기)' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> yw : 커서 위치부터 단어의 끝까지 복사' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> y2w : 커서 위치부터 두 단어 복사' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> y0 : 커서 위치부터 줄의 처음까지 복사' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> y$ : 커서 위치부터 줄의 끝까지 복사' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> yy : 커서가 있는 줄을 복사' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> 2yy : 커서가 있는 줄 아래로 두줄을 복사' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> yj : 커서가 있는 줄과 그 다음줄을 복사' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> yk : 커서가 있는 줄과 그 앞줄을 복사' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> yG : 현재 위치에서 파일의 끝까지 복사' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> p : 커서의 다음 위치에 붙여넣기' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> PP : 커서가 있는 위치에 붙여넣기' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '   Command Mode : Normal Mode에서 [ ESC ]를 누르고 [ : ]을 입력한 상태' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> :w : 저장하기' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> :w test.txt : test.txt 파일로 저장' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> :w >> test.txt : test.txt 파일에 이어서 저장' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> :q : vi 편집기를 종료' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> ZZ : 저장 후 종료' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> :wq! : 저장 후 강제 종료' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> :e test.txt : test.txt 파일을 불러온다.' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> :e test.txt : 현재 파일을 불러온다.' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '   Visual Mode : 블록 선택을 위해서 v 또는 [ Ctrl + V ] 키를 누른 상태' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '   추가적인 명령' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> "." : .는 이전에 사용하였던 명령을 재실행한다.' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> /[검색어] : [검색어]가 출력되는 행을 제일 위에 출력(현재 페이지에 없는 경우 다음페이지에서 검색)'  >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> ?[검색어] : [검색어]가 출력되는 행을 제일 위에 출력(현재 페이지에 없는 경우 이전페이지에서 검색)'  >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    -> :[범위]/[매칭문자열]/[치환문자열]/[라인범위] : 기존 문자열을 한 번에 치환할때 사용한다.(:%s/AA/BB/g -> 처음부터끝까지 AA를 BB로 치환)' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    ->> (:%s/AA/BB/g -> 처음부터끝까지 AA를 BB로 치환)' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo '    ->> (:%s/AA/BB/gc -> 처음부터끝까지 AA를 BB로 치환할때 사용자에게 물어보며 하나씩 치환한다.)' >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    LINENUM=1
    echo "vim start $LINENUM" >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    for n in {1..1000} 
    do 
        LINENUM=$(( LINENUM + 1 ))
        echo "vim start $LINENUM" >> vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    done
    echo
    echo " 예시1) vim vim_CMD_TestFolder/vim_CMD_TestFile1.txt"
    vi vim_CMD_TestFolder/vim_CMD_TestFile1.txt
    echo
    echo "## vim 조작법 종료 ##"
    echo 
}

VimCommand