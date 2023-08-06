# Bash_Shell_CMD

<!-- 
<table>
  <tr>
    <td><a href="README.md">Korean</a></td>
    <td><a href="README_JP.md">Japanese</a></td>
  </tr>
</table>
-->

## **Data Control**  

<table>
  <tr>
    <td>쉘스크립트</td>
    <td>명령어</td>
    <td>기능</td>
    <td>옵션</td>
    <td>예시</td>
    <td>비고</td>
  </tr>
  <tr>
    <td rowspan="12"><a href="Data/Awk_DataControlAwk.sh">Awk_DataControlAwk.sh</a></td>
    <td rowspan="12">awk</td>
    <td>　['/pattern/']　</td>
    <td></td>
    <td>awk '/Korea/' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt</td>
    <td>파일에서 pattern과 일치하는 데이터 라인을 출력</td>
  </tr>
  <tr>    
    <td>　['{print $n}']　</td>
    <td></td>
    <td>awk '{print $2}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt</td>
    <td>파일에서 n번째 컬럼의 데이터만 출력($n 값이 없거나 $0 인 경우 모든 데이터 출력)</td>
  </tr>
  <tr>    
    <td>　['/pattern/{print $n, $m}']　</td>
    <td></td>
    <td>awk '/Japan/{print $3, $4}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt</td>
    <td>파일에서 pattern과 일치하는 데이터 라인중 n번째, m번째 컬럼의 데이터만 출력</td>
  </tr>
  <tr>    
    <td>　['{print NR, $n }']　</td>
    <td></td>
    <td>awk '{print NR, $4}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt</td>
    <td>파일에서 4번째 컬럼의 데이터만 출력하며 선두에 라인 번호를 출력</td>
  </tr>
  <tr>    
    <td>　['{print NF, $n }']　</td>
    <td></td>
    <td>awk '{print NF, $0}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt</td>
    <td>파일에서 공백 또는 탭으로 분리된 컬럼수를 출력</td>
  </tr>
  <tr>    
    <td>　['$n >= 7000']　</td>
    <td></td>
    <td>awk '$3 >= 7000' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt</td>
    <td>파일에서 n번째 컬럼 데이터가 7000이상인 데이터만 출력</td>
  </tr>
  <tr>    
    <td>　['$n ~ /pattern/']　</td>
    <td></td>
    <td>awk '$2 ~ /Kor/' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt</td>
    <td>파일에서 n번째 컬럼 데이터가 pattern과 일치하는 데이터만 출력</td>
  </tr>
  <tr>    
    <td>　['$n !~ /pattern/']　</td>
    <td></td>
    <td>awk '$2 !~ /Kor/' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt</td>
    <td>파일에서 n번째 컬럼 데이터가 pattern과 일치하지 않는 데이터만 출력</td>
  </tr>
  <tr>    
    <td>　BEGIN [FS : Field Separater, OFS : Output Field Separater, ORS : Output Record Separater]　</td>
    <td></td>
    <td>awk 'BEGIN{FS=":"; OFS="\t"; ORS="\n\n"}{print $1, $2, $3}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt</td>
    <td>FS : 필드 구분자, OFS : 출력 파일의 필드 구분자, ORS : 출력 파일의 레코드 구분자</td>
  </tr>
  <tr>    
    <td>　END [Last Print]　</td>
    <td></td>
    <td>awk 'END{print $0 "Test Number " NR}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt</td>
    <td>제일 마지막에 출력될 데이터</td>
  </tr>
  <tr>
    <td></td>
    <td> -f </td>
    <td>awk -f `pwd`/awk_CMD_TestFolder/awk_CMD_Command.txt `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile1.txt</td>
    <td>awk 명령이 입력되어 있는 파일을 사용하여 다른파일을 처리할 경우 사용</td>
  </tr>
  <tr>
    <td></td>
    <td> -F </td>
    <td>awk -F'[:,]' '{print $1, $2, $3}' `pwd`/awk_CMD_TestFolder/awk_CMD_TestFile2.txt</td>
    <td>필드 구분자를 설정하는 옵션(하나만 지정할 경우 -F:로 지정 가능, 둘 이상 지정할 경우 []로 감싸주어야한다.)</td>
  </tr>
  <tr>
    <td rowspan="5"><a href="Data/Cat_FileContentPrint.sh">Cat_FileContentPrint.sh</a></td>
    <td rowspan="5">cat</td>
    <td></td>
    <td> -b </td>
    <td>cat -b `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt</td>
    <td>공백이 아닌 라인의 앞에 줄 번호를 붙여서 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -e </td>
    <td>cat -e `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt</td>
    <td>모든 라인의 끝에 $마크를 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -n </td>
    <td>cat -n `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt</td>
    <td>모든 라인의 앞에 줄 번호를 붙여서 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -s </td>
    <td>cat -s `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt</td>
    <td>연속된 공백 줄을 압축하여 한 줄로 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -t </td>
    <td>cat -t `pwd`/cat_CMD_TestFolder/cat_CMD_TestFile.txt</td>
    <td>탭 문자열(\t)을 「^I」 문자열로 치환하여 출력</td>
  </tr>
  <tr>
    <td><a href="Data/Expr_ValueOperation.sh">Expr_ValueOperation.sh</a></td>
    <td>expr</td>
    <td></td>
    <td></td>
    <td>expr 5 '*' 3 # 15</td>
    <td>사칙연산</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Data/Head_ShowFileContentHead.sh">Head_ShowFileContentHead.sh</a></td>
    <td rowspan="2">head</td>
    <td></td>
    <td> -c </td>
    <td>head -c 17 `pwd`/head_CMD_TestFolder/Head_CMD_TestFile1.txt</td>
    <td>앞에서 부터 지정한 바이트(byte) 수 만큼 출력 (줄바꿈도 1byte)</td>
  </tr>
  <tr>
    <td></td>
    <td> -N </td>
    <td>head -n 17 `pwd`/head_CMD_TestFolder/Head_CMD_TestFile1.txt</td>
    <td>위에서 부터 지정한 라인(line) 수 만큼 출력</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="Data/Join_FileContentJoin.sh">Join_FileContentJoin.sh</a></td>
    <td rowspan="3">join</td>
    <td></td>
    <td></td>
    <td>join `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt `pwd`/join_CMD_TestFolder/join_CMD_TestFile2.txt</td>
    <td>첫 번째 파일과 두번째 파일 컬럼을 크로스 조인(cross join)한다.</td>
  </tr>
  <tr>
    <td></td>
    <td> -o </td>
    <td>join -o 1.2,2.2 `pwd`/join_CMD_TestFolder/join_CMD_TestFile1.txt `pwd`/join_CMD_TestFolder/join_CMD_TestFile2.txt</td>
    <td>첫 번째 파일에 2번째 컬럼과 두번째 파일의 2번째 컬럼을 조인한다.</td>
  </tr>
  <tr>
    <td></td>
    <td> -t </td>
    <td>join -t,  `pwd`/join_CMD_TestFolder/join_CMD_TestFile3.txt `pwd`/join_CMD_TestFolder/join_CMD_TestFile4.txt</td>
    <td>첫 번째 파일과 두번째 파일을 조인할 때 ,구분자로 크로스(cross join) 조인한다.</td>
  </tr>
  <tr>
    <td rowspan="10"><a href="Data/Nkf_CharacterCode_NewlineCode.sh">Nkf_CharacterCode_NewlineCode.sh</a></td>
    <td rowspan="10">nkf</td>
    <td></td>
    <td> -g </td>
    <td>nkf -g `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt</td>
    <td>파일의 인코딩을 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> --guess </td>
    <td>nkf --guess `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt</td>
    <td>파일의 인코딩과 개행코드를 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -e </td>
    <td>nkf -e `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_EUC.txt</td>
    <td>파일의 인코딩을 EUC형식으로 변경</td>
  </tr>
  <tr>
    <td></td>
    <td> -j </td>
    <td>nkf -j `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_JIS.txt</td>
    <td>파일의 인코딩을 JIS형식으로 변경</td>
  </tr>
  <tr>
    <td></td>
    <td> -s </td>
    <td>nkf -s `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_SJIS.txt</td>
    <td>파일의 인코딩을 SJIS형식으로 변경</td>
  </tr>
  <tr>
    <td></td>
    <td> -w </td>
    <td>nkf -w `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_UTF-8.txt</td>
    <td>파일의 인코딩을 UTF-8형식으로 변경</td>
  </tr>
  <tr>
    <td></td>
    <td> -Lw </td>
    <td>nkf -Lw `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_CRLF.txt</td>
    <td>파일의 개행코드를 CRLF형식으로 변경</td>
  </tr>
  <tr>
    <td></td>
    <td> -Lm </td>
    <td>nkf -Lm `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_LF.txt</td>
    <td>파일의 개행코드를 LF형식으로 변경</td>
  </tr>
  <tr>
    <td></td>
    <td> -Lu </td>
    <td>nkf -Lu `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_CR.txt</td>
    <td>파일의 개행코드를 CR형식으로 변경</td>
  </tr>
  <tr>
    <td> </td>
    <td> --oc=[codeset] </td>
    <td>nkf --oc=UTF-8-BOM `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile.txt > `pwd`/nkf_CMD_TestFolder/nkf_CMD_TestFile_BOM.txt</td>
    <td>파일의 인코딩을 UTF-8 (BOM)형식으로 변경</td>
  </tr>
  <tr>
    <td rowspan="9"><a href="Data/Od_SetPrintFormat.sh">Od_SetPrintFormat.sh</a></td>
    <td rowspan="9">od</td>
    <td></td>
    <td> -a </td>
    <td>od -a `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt</td>
    <td>실제 데이터 값이 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -b </td>
    <td>od -b `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt</td>
    <td>8진수 형식으로 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -c </td>
    <td>od -c `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt</td>
    <td>ASCII 문자로 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -d </td>
    <td>od -d `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt</td>
    <td>16진수로 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -x </td>
    <td>od -x `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt</td>
    <td>16진수로 출력하되, 한 줄에 2바이트씩 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -N n </td>
    <td>Contents</td>
    <td>n바이트만큼만 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -j n </td>
    <td>od -N 3 `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt</td>
    <td>파일의 시작에서 n 바이트를 건너뛰고 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -s n </td>
    <td>od -s 3 `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt</td>
    <td>출력을 시작할 오프셋을 지정</td>
  </tr>
  <tr>
    <td></td>
    <td> -t n </td>
    <td>od -t o `pwd`/od_CMD_TestFolder/od_CMD_TestFile.txt</td>
    <td>출력 형식을 지정(a (ASCII), c (ASCII), d (10진수), o (8진수), x (16진수) )</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Data/Paste_FileContentAdd.sh">Paste_FileContentAdd.sh</a></td>
    <td rowspan="2">paste</td>
    <td></td>
    <td> -d </td>
    <td>paste -d ',' `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt</td>
    <td>데이터의 구분자를 기본 탭(\t)에서 , 으로 변경</td>
  </tr>
  <tr>
    <td></td>
    <td> -s </td>
    <td>paste -s `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile1.txt `pwd`/paste_CMD_TestFolder/paste_CMD_TestFile2.txt</td>
    <td>데이터가 가로가 아닌 세로로 합치기</td>
  </tr>
  <tr>
    <td><a href="Data/Printf_FormatOutputPrintf.sh">Printf_FormatOutputPrintf.sh</a></td>
    <td>printf</td>
    <td></td>
    <td> -v </td>
    <td>printf -v testVariable 30</td>
    <td>변수에 값을 설정하면서 값을 출력</td>
  </tr>
  <tr>
    <td rowspan="9"><a href="Data/Sed_TextEditerSed.sh">Sed_TextEditerSed.sh</a></td>
    <td rowspan="9">sed</td>
    <td>['s(tart),e(nd)'d]</td>
    <td></td>
    <td>sed '2,5d' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt</td>
    <td>n번째부터 m번째까지의 라인을 제외한 나머지 데이터 출력</td>
  </tr>  
    <td>['s(tart),e(nd)'p]</td>
    <td></td>
    <td>sed '2,5'p `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt</td>
    <td>n번째 라인부터 m번째 라인까지의 라인을 중복 출력</td>
  </tr>
  </tr>  
    <td>['s/pattern1/pattern2/']</td>
    <td></td>
    <td>sed 's/TestFile/SedSample/' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt</td>
    <td>파일에서 pattern1값을 pattern2으로 치환(제일 먼저 등장하는 값만)</td>
  </tr>
  </tr>  
    <td>['s(tart),e(nd)s/pattern1/pattern2/']</td>
    <td></td>
    <td>sed '2,5s/TestFile/SedSample/' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt</td>
    <td>파일에서 n번째 라인부터 m번째 라인까지중에서 pattern1값을 pattern2으로 치환(제일 먼저 등장하는 값만)</td>
  </tr>
  </tr>  
    <td>['s/pattern1/pattern2/g']</td>
    <td></td>
    <td>sed 's/TestFile/SedSample/g' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt</td>
    <td>파일에서 pattern1값을 pattern2으로 치환 (모든 값)</td>
  </tr>
  </tr>  
    <td></td>
    <td> -n </td>
    <td>sed -n '2,5p' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt</td>
    <td>일치하는 패턴, 값이 존재하는 라인만 출력</td>
  </tr>
  </tr>  
    <td></td>
    <td> -n </td>
    <td>sed -n 's/TestFile/SedSample/p' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt</td>
    <td>일치하는 패턴, 값이 존재하는 라인만 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -e </td>
    <td>sed -e 's/TestFile/SedSample/g' -e 's/SedSample/tt/g' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt</td>
    <td>두 개이상의 sed 명령어를 사용하고자 할때 사용</td>
  </tr>
  <tr>
    <td></td>
    <td> -f </td>
    <td>sed -f `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile2.txt `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt</td>
    <td>명령이 지정된 스크립트파일을 직접 참조하여 출력</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="Data/Sort_FileSort.sh">Sort_FileSort.sh</a></td>
    <td rowspan="3">sort</td>
    <td></td>
    <td> -r </td>
    <td>sort -r `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt</td>
    <td>내림차순 [z -> a -> Z -> A]</td>
  </tr>
  <tr>
    <td></td>
    <td> -f </td>
    <td>sort -f `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt</td>
    <td>대소문자 구분 정렬</td>
  </tr>
  <tr>
    <td></td>
    <td> -b </td>
    <td>sort -b `pwd`/sort_CMD_TestFolder/sort_CMD_TestFile1.txt</td>
    <td>선두에 있는 공백 무시 정렬</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Data/Tail_ShowFileContentTail.sh">Tail_ShowFileContentTail.sh</a></td>
    <td rowspan="2">tail</td>
    <td></td>
    <td> -c m</td>
    <td>tail -c 17 `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt</td>
    <td>파일의 뒤에서 부터 m번째 byte까지 출력(newline은 1byte)</td>
  </tr>
  <tr>
    <td></td>
    <td> -n m</td>
    <td>tail -n 17 `pwd`/tail_CMD_TestFolder/tail_CMD_TestFile1.txt</td>
    <td>파일의 뒤에서 부터 m번째 라인까지 출력</td>
  </tr>
  <tr>
    <td rowspan="5"><a href="Data/Touch_UpdateFileModificationDate.sh">Touch_UpdateFileModificationDate.sh</a></td>
    <td rowspan="5">touch</td>
    <td></td>
    <td> -t </td>
    <td>touch -t 202306010409 `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile1.txt</td>
    <td>수정시간을 지정된 시간으로 설정</td>
  </tr>
  <tr>
    <td></td>
    <td> -r </td>
    <td>touch -r `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile1.txt `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt</td>
    <td>파일1의 수정 시간을 파일2의 수정 시간으로 설정</td>
  </tr>
  <tr>
    <td></td>
    <td> -c </td>
    <td>touch -c `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile3.txt</td>
    <td>파일이 존재하지 않으면 생성하지 않는다.</td>
  </tr>
  <tr>
    <td></td>
    <td> -m </td>
    <td>touch -m `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile1.txt</td>
    <td>최근 수정 시간을 현재시간으로 설정</td>
  </tr>
  <tr>
    <td></td>
    <td> -a </td>
    <td>touch -a `pwd`/touch_CMD_TestFolder/Touch_CMD_TestFile2.txt</td>
    <td>최근 액세스 시간을 현재시간으로 설정</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Data/Tr_FileContentEdit.sh">Tr_FileContentEdit.sh</a></td>
    <td rowspan="2">tr</td>
    <td></td>
    <td> -d </td>
    <td>tr -d 'es' < `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt</td>
    <td>지정된 값을 삭제</td>
  </tr>
  <tr>
    <td></td>
    <td> -s </td>
    <td>tr -s ' ' < `pwd`/tr_CMD_TestFolder/tr_CMD_TestFile1.txt</td>
    <td>지정된 값에 중복이 있으면 제거</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Data/Uniq_FileContentDuplicationDelete.sh">Uniq_FileContentDuplicationDelete.sh</a></td>
    <td rowspan="2">uniq</td>
    <td></td>
    <td> -c </td>
    <td>uniq -c `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt</td>
    <td>중복값의 갯수를 선두에 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -i </td>
    <td>uniq -i `pwd`/uniq_CMD_TestFolder/uniq_CMD_TestFile1.txt</td>
    <td>대소문자 구분없이 중복제거</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="Data/Wc_FileDataCounting.sh">Wc_FileDataCounting.sh</a></td>
    <td rowspan="3">wc</td>
    <td></td>
    <td> -l </td>
    <td>wc -l `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt</td>
    <td>파일의 라인 수를 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -w </td>
    <td>wc -w `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt</td>
    <td>파일의 문자 수를 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -c </td>
    <td>wc -c `pwd`/wc_CMD_TestFolder/wc_CMD_TestFile1.txt</td>
    <td>파일의 바이트 수를 출력</td>
  </tr>
</table>

## **Date Control**

<table>
  <tr>
    <td>쉘스크립트</td>
    <td>명령어</td>
    <td>기능</td>
    <td>옵션</td>
    <td>예시</td>
    <td>비고</td>
  </tr>
  <tr>
    <td rowspan="9"><a href="Date/Cal_Calendar.sh">Cal_Calendar.sh</a></td>
    <td rowspan="9">cal</td>
    <td></td>
    <td> -h </td>
    <td>cal -h</td>
    <td>오늘 날짜가 하이라이트</td>
  </tr>
  <tr>
    <td></td>
    <td> -j </td>
    <td>cal -j</td>
    <td>줄리안 형식의 날짜 출력(1/1부터 경과된 날짜)</td>
  </tr>
  <tr>
    <td></td>
    <td> -v </td>
    <td>cal -v</td>
    <td>올해의 모든 달을 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -3 </td>
    <td>cal -3</td>
    <td>이전달,이번달,다음달 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -A </td>
    <td>-A 3</td>
    <td>이번달과 다음 3달 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -B </td>
    <td>-B 3</td>
    <td>이번달과 이전 3달 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -N </td>
    <td>cal -N</td>
    <td>달력 행 열 반전</td>
  </tr>
  <tr>
    <td></td>
    <td> -d </td>
    <td>cal -d 2023-05</td>
    <td>지정된 달력을 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -H </td>
    <td>cal -H 2023-06-11</td>
    <td>지정된 날짜를 하이라이트</td>
  </tr>
  <tr>
    <td rowspan="6"><a href="Date/Date_CurrentDate.sh">Date_CurrentDate.sh</a></td>
    <td rowspan="6">date</td>
    <td>"+%c"</td>
    <td></td>
    <td>date "+%c"</td>
    <td>date "+%a %b/%e %H:%M:%S %Y"</td>
  </tr>
  <tr>
    <td>"+%F"</td>
    <td></td>
    <td>date "+%F"</td>
    <td>date "+%Y-%m-%d"</td>
  </tr>
  <tr>
    <td>"+%D"</td>
    <td></td>
    <td>date "+%D"</td>
    <td>date "+%m/%d/%y"</td>
  </tr>
  <tr>
    <td>"+%x"</td>
    <td></td>
    <td>date "+%x"</td>
    <td>date "+%m/%d/%Y"</td>
  </tr>
  <tr>
    <td></td>
    <td> -u </td>
    <td>date -u</td>
    <td>표준출력 날짜를 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -R </td>
    <td>date -R</td>
    <td>표준출력 날짜를 출력(RFC2822 포맷)</td>
  </tr>
</table>

## **Folders/Files Control**

<table>
  <tr>
    <td>쉘스크립트</td>
    <td>명령어</td>
    <td>기능</td>
    <td>옵션</td>
    <td>예시</td>
    <td>비고</td>
  </tr>
  <tr>
    <td><a href="Folders_Files/Cd_DirectoryMove.sh">Cd_DirectoryMove.sh</a></td>
    <td>cd</td>
    <td></td>
    <td></td>
    <td>cd `pwd`/cd_CMD_TestFolder/</td>
    <td>디렉토리 이동</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Folders_Files/Chgrp_FileGroupEdit.sh">Chgrp_FileGroupEdit.sh</a></td>
    <td rowspan="2">chgrp</td>
    <td></td>
    <td></td>
    <td>sudo Chgrp admin `pwd`/chgrp_CMD_TestFolder/chgrp_CMD_TestFile1.txt</td>
    <td>지정된 파일 소유그룹을 변경</td>
  </tr>
  <tr>
    <td></td>
    <td> -R </td>
    <td>sudo Chgrp -R wheel `pwd`/chgrp_CMD_TestFolder/</td>
    <td>하위 디렉토리까지 소유그룹을 변경</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Folders_Files/Chmod_AccessAuthorityEdit.sh">Chmod_AccessAuthorityEdit.sh</a></td>
    <td rowspan="2">chmod</td>
    <td></td>
    <td></td>
    <td>chmod g-w `pwd`/chmod_CMD_TestFolder/chmod_CMD_TestFile1.txt</td>
    <td>파일 또는 디렉토리의 파일 권한을 변경 u[user], g[group], o[owner], a[all], r[read:4], w[write:2], x[run:1]</td>
  </tr>
  <tr>
    <td></td>
    <td> -R </td>
    <td>chmod -R 777 `pwd`/chmod_CMD_TestFolder/</td>
    <td>하위 디렉토리까지 파일 또는 디렉토리의 파일 권한을 변경</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Folders_Files/Chown_FileOwnerEdit.sh">Chown_FileOwnerEdit.sh</a></td>
    <td rowspan="2">chown</td>
    <td></td>
    <td></td>
    <td>sudo chown Dok `pwd`/chown_CMD_TestFolder/chown_CMD_TestFile1.txt</td>
    <td>파일 또는 디렉토리의 소유자와 그룹을 변경</td>
  </tr>
  <tr>
    <td></td>
    <td> -R </td>
    <td>sudo chown -R jonmingi `pwd`/chown_CMD_TestFolder/</td>
    <td>하위 디렉토리까지 파일 또는 디렉토리의 소유자와 그룹을 변경</td>
  </tr>
  <tr>
    <td rowspan="5"><a href="Folders_Files/Cp_CopyFileFolder.sh">Cp_CopyFileFolder.sh</a></td>
    <td rowspan="5">cp</td>
    <td></td>
    <td> -i </td>
    <td>cp -i `pwd`/cp_CMD_TestFolder1/cp_CMD_TestFile1.txt `pwd`/cp_CMD_TestFolder2/cp_CMD_TestFile2.txt</td>
    <td>파일이 존재하는 경우 덮어쓰여졌는지 확인</td>
  </tr>
  <tr>
    <td></td>
    <td> -r </td>
    <td>cp -r `pwd`/cp_CMD_TestFolder2/ `pwd`/cp_CMD_TestFolder3/</td>
    <td>하위 디렉토리까지 파일 또는 디렉토리 모두 복사</td>
  </tr>
  <tr>
    <td></td>
    <td> -a </td>
    <td>cp -a `pwd`/cp_CMD_TestFolder2/cp_CMD_TestFile1.txt `pwd`/cp_CMD_TestFolder3/</td>
    <td>원본 파일의 속성 및 링크 정보 복사</td>
  </tr>
  <tr>
    <td></td>
    <td> -p </td>
    <td>cp -p `pwd`/cp_CMD_TestFolder2/cp_CMD_TestFile2.txt `pwd`/cp_CMD_TestFolder3/</td>
    <td>원본 파일의 소유자 그룹, 권한 등의 정보 복사</td>
  </tr>
  <tr>
    <td></td>
    <td> -v </td>
    <td>cp -rv `pwd`/cp_CMD_TestFolder3/ `pwd`/cp_CMD_TestFolder4/</td>
    <td>진행 상황 표시</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="Folders_Files/Cut_SectionCut.sh">Cut_SectionCut.sh</a></td>
    <td rowspan="3">cut</td>
    <td></td>
    <td> -b </td>
    <td>cut -b 5 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt</td>
    <td>바이트 단위로 잘라서 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -c </td>
    <td>cut -c 5 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt</td>
    <td>문자 단위로 잘라서 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -d  -f </td>
    <td>cut -d , -f 3 `pwd`/cut_CMD_TestFolder/cut_CMD_TestFile1.txt</td>
    <td>지정된 구분자[d] 단위로 잘라서 n번째 데이터[f] 출력</td>
  </tr>
  <tr>
    <td rowspan="5"><a href="Folders_Files/Dd_BlockFile.sh">Dd_BlockFile.sh</a></td>
    <td rowspan="5">dd</td>
    <td></td>
    <td></td>
    <td>dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile2.txt"</td>
    <td>데이터를 복사</td>
  </tr>
  <tr>
    <td>[ bs ]</td>
    <td></td>
    <td>dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile3.txt" bs=64</td>
    <td>64block단위로 복사</td>
  </tr>
  <tr>
    <td>[ count ]</td>
    <td></td>
    <td>dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile4.txt" bs=64 count=2</td>
    <td>64block단위로 2번 복사</td>
  </tr>
  <tr>
    <td>[ skip ]</td>
    <td></td>
    <td>dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile5.txt" bs=64 skip=2</td>
    <td>64block단위로 앞에서 2번 스킵후 복사</td>
  </tr>
  <tr>
    <td>[ seek ]</td>
    <td></td>
    <td>dd if="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile1.txt" of="`pwd`/dd_CMD_TestFolder/dd_CMD_TestFile6.txt" bs=64 seek=2</td>
    <td>파일 복사 후 64block단위로 2번 데이터 추가해서 복사</td>
  </tr>
  <tr>
    <td rowspan="8"><a href="Folders_Files/Diff_CompareFileContents.sh">Diff_CompareFileContents.sh</a></td>
    <td rowspan="8">diff</td>
    <td></td>
    <td></td>
    <td>diff `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile3.txt</td>
    <td>두 파일의 차이를 비교( 오른쪽 파일에만 있는 데이터가 있는 경우[>], 왼쪽 파일에만 있는 데이터가 있는 경우[<] )</td>
  </tr>
  <tr>
    <td></td>
    <td> -q </td>
    <td>diff -q `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt</td>
    <td>두 파일의 차이가 있는 경우 내용이 아닌 파일명이 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -b </td>
    <td>diff -b `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile6.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt</td>
    <td>연속된 공백은 하나로 인식하여 파일 비교</td>
  </tr>
  <tr>
    <td></td>
    <td> -i </td>
    <td>diff -i `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile8.txt</td>
    <td>대소문자를 구분하지 않고 비교</td>
  </tr>
  <tr>
    <td></td>
    <td> -s </td>
    <td>diff -s `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/diff_CMD_TestFolder3/diff_CMD_TestFile2.txt</td>
    <td>동일한 파일의 경우, 동일한 파일이라는 메시지가 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -u </td>
    <td>diff -u `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile5.txt</td>
    <td>두 파일의 차이를 자세히 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -w </td>
    <td>diff -w `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile1.txt `pwd`/diff_CMD_TestFolder/diff_CMD_TestFile7.txt</td>
    <td>공백 및 탭 무시</td>
  </tr>
  <tr>
    <td></td>
    <td> -r </td>
    <td>diff -r `pwd`/diff_CMD_TestFolder/ `pwd`/diff_CMD_TestFolder/diff_CMD_TestFolder2/</td>
    <td>하위 디렉토리까지 비교</td>
  </tr>
  <tr>
    <td rowspan="5"><a href="Folders_Files/Find_FileSearch.sh">Find_FileSearch.sh</a></td>
    <td rowspan="5">find</td>
    <td> -name </td>
    <td></td>
    <td>find . -name '*find*'</td>
    <td>지정 패턴의 파일을 검색</td>
  </tr>
  <tr>
    <td> -empty </td>
    <td></td>
    <td>find . -empty</td>
    <td>파일 용량이 0이거나 디렉토리가 비어있는 파일을 출력</td>
  </tr>
  <tr>
    <td> -delete </td>
    <td></td>
    <td>find . -name '*.tt' -delete</td>
    <td>매칭되는 파일들을 삭제</td>
  </tr>
  <tr>
    <td> -print </td>
    <td></td>
    <td>find . -name '*find*' -print</td>
    <td>매칭되는 모든 파일을 출력(-print0 : 개행하지않고 출력)</td>
  </tr>
  <tr>
    <td> -maxdepth </td>
    <td></td>
    <td>find . -maxdepth 3 -name '*log*'</td>
    <td>.[현재디텍토리]로부터 상위 3번째 디렉토리에서 검색</td>
  </tr>
  <tr>
    <td rowspan="7"><a href="Folders_Files/Grep_StringSearch.sh">Grep_StringSearch.sh</a></td>
    <td rowspan="7">grep</td>
    <td></td>
    <td> -i </td>
    <td>grep -i 'PHONE' `pwd`/grep_CMD_TestFolder/*</td>
    <td>대소문자를 구별하지 않고 검색</td>
  </tr>
  <tr>
    <td></td>
    <td> -v </td>
    <td>grep -v 'Test' `pwd`/grep_CMD_TestFolder/*</td>
    <td>패턴과 일치하지 않는 라인 검색</td>
  </tr>
  <tr>
    <td></td>
    <td> -w </td>
    <td>grep -w 'phone' `pwd`/grep_CMD_TestFolder/*</td>
    <td>정확하게 일치하는 단어 단위로 검색</td>
  </tr>
  <tr>
    <td></td>
    <td> -n </td>
    <td>grep -n 'Note7' `pwd`/grep_CMD_TestFolder/*</td>
    <td>[패턴]이 포함된 검색 데이터 출력시 시작 부분에 라인 번호가 표시</td>
  </tr>
  <tr>
    <td></td>
    <td> -l </td>
    <td>grep -l 'Test' `pwd`/grep_CMD_TestFolder/*</td>
    <td>패턴과 일치하는 라인이 하나 이상 있는 파일의 이름</td>
  </tr>
  <tr>
    <td></td>
    <td> -s </td>
    <td>grep -s 'ipod' `pwd`/grep_CMD_TestFolder/*</td>
    <td>오류가 있어도 출력되지 않음</td>
  </tr>
  <tr>
    <td></td>
    <td> -r </td>
    <td>grep -r 'ipod' `pwd`/grep_CMD_TestFolder/*</td>
    <td>하위 디렉토리까지 검색</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="Folders_Files/Ln_SymbolicLink.sh">Ln_SymbolicLink.sh</a></td>
    <td rowspan="3">ln</td>
    <td></td>
    <td> -s </td>
    <td>ln -s `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt</td>
    <td>윈도우의 바로가기와 유사한 바로가기만들기</td>
  </tr>
  <tr>
    <td></td>
    <td> -f </td>
    <td>ln -f `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln2.txt</td>
    <td>이미 존재하는 링크를 덮어쓸 때 작업 강제 실행</td>
  </tr>
  <tr>
    <td></td>
    <td> -v </td>
    <td>n -v `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1.txt `pwd`/ln_CMD_TestFolder/ln_CMD_TestFile1_ln3.txt</td>
    <td>출력 상세 정보 출력</td>
  </tr>
  <tr>
    <td rowspan="9"><a href="Folders_Files/Ls_DirectoryItem.sh">Ls_DirectoryItem.sh</a></td>
    <td rowspan="9">ls</td>
    <td></td>
    <td> -a </td>
    <td>ls -a `pwd`/ls_CMD_TestFolder/</td>
    <td>숨겨진 파일 및 디렉토리(Current Directory[.], 이전 디렉토리[..])를 사용하여 모든 파일을 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -A </td>
    <td>ls -A `pwd`/ls_CMD_TestFolder/</td>
    <td>모든 파일 출력, 숨겨진 파일 및 디렉토리 포함</td>
  </tr>
  <tr>
    <td></td>
    <td> -l </td>
    <td>ls -l `pwd`/ls_CMD_TestFolder/</td>
    <td>파일 또는 디렉토리의 세부 정보를 출력 (세로 출력[권한, 파일 수, 소유자, 그룹, 파일 크기, 수정 날짜, 파일 이름])</td>
  </tr>
  <tr>
    <td></td>
    <td> -r </td>
    <td>ls -rl `pwd`/ls_CMD_TestFolder/</td>
    <td>역순으로 출력 [기본값 : 파일, 디렉토리]</td>
  </tr>
  <tr>
    <td></td>
    <td> -t </td>
    <td>ls -tl `pwd`/ls_CMD_TestFolder/</td>
    <td>가장 최근에 수정된 파일 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -p </td>
    <td>ls -pl `pwd`/ls_CMD_TestFolder/</td>
    <td>폴더의 경우 폴더 이름 뒤에 /를 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -R </td>
    <td>ls -Rl `pwd`/ls_CMD_TestFolder/</td>
    <td>하위 디렉토리에서 파일과 폴더를 모두 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -h </td>
    <td>ls -hl `pwd`/ls_CMD_TestFolder/</td>
    <td>용량의 경우 사람이 읽을 수 있는 출력 (/1024)</td>
  </tr>
  <tr>
    <td></td>
    <td> -i </td>
    <td>ls -il `pwd`/ls_CMD_TestFolder/</td>
    <td>인쇄 inode 번호(inode 번호: 파일 또는 디렉토리를 고유하게 식별하는 번호)</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="Folders_Files/Mkdir_CreateDirectory.sh">Mkdir_CreateDirectory.sh</a></td>
    <td rowspan="3">mkdir</td>
    <td></td>
    <td> -p </td>
    <td>mkdir -p `pwd`/mkdir_CMD_TestFolder/mkdir_CMD_TestFolder1/mkdir_CMD_TestFolder2/</td>
    <td>하위 디렉토리까지 생성</td>
  </tr>
  <tr>
    <td></td>
    <td> -m </td>
    <td>mkdir -m 700 `pwd`/mkdir_CMD_TestFolder/mkdir_CMD_TestFolder3/</td>
    <td>디렉토리 생성과 함께 권한 설정</td>
  </tr>
  <tr>
    <td></td>
    <td> -v </td>
    <td>mkdir -v `pwd`/mkdir_CMD_TestFolder/mkdir_CMD_TestFolder4/</td>
    <td>디렉토리 생성 결과 출력</td>
  </tr>
  <tr>
    <td rowspan="5"><a href="Folders_Files/Mv_MoveFileAndFolder.sh">Mv_MoveFileAndFolder.sh</a></td>
    <td rowspan="5">mv</td>
    <td></td>
    <td> -h </td>
    <td>mv `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile1.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/mv_CMD_TestFile2.txt</td>
    <td>2번째 아규먼트의 값으로 파일을 그대로 이동하거나 이름을 변경하여 이동</td>
  </tr>
  <tr>
    <td></td>
    <td> -f </td>
    <td>mv -f `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile5.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/</td>
    <td>파일 또는 디렉토리가 존재하는지 묻지 않고 이동</td>
  </tr>
    <tr>
    <td></td>
    <td> -i </td>
    <td>mv -i `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile2.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/</td>
    <td>명령 실행 시 질문 후 이동</td>
  </tr>
    <tr>
    <td></td>
    <td> -n </td>
    <td>mv -n `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile4.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/</td>
    <td>파일이 존재하는 경우 이동하지 않음</td>
  </tr>
    <tr>
    <td></td>
    <td> -v </td>
    <td>mv -v `pwd`/mv_CMD_TestFolder/mv_CMD_TestFile4.txt `pwd`/mv_CMD_TestFolder/mv_CMD_TestFolder2/</td>
    <td>출력 상세 정보 출력</td>
  </tr>
  <tr>
    <td><a href="Folders_Files/Pwd_ShowPwd.sh">Pwd_ShowPwd.sh</a></td>
    <td>pwd</td>
    <td></td>
    <td> -h </td>
    <td>pwd -L</td>
    <td>현재 작업 디렉토리 출력(디폴트 옵션)</td>
  </tr>
  <tr>
    <td rowspan="4"><a href="Folders_Files/Rm_RemoveFileAndFolder.sh">Rm_RemoveFileAndFolder.sh</a></td>
    <td rowspan="4">rm</td>
    <td></td>
    <td> -i </td>
    <td>rm -i `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile2.txt</td>
    <td>파일 또는 폴더를 삭제시 질문 후 삭제</td>
  </tr>
  <tr>
    <td></td>
    <td> -r </td>
    <td>rm -r `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder2/</td>
    <td>하위 디렉토리까지 삭제</td>
  </tr>
  </tr>
  <tr>
    <td></td>
    <td> -f </td>
    <td>rm -rf `pwd`/rm_CMD_TestFolder/rm_CMD_TestFolder3/rm_CMD_TestFolder4/</td>
    <td>파일 또는 폴더를 삭제시 질문없이 강제 삭제</td>
  </tr>
  </tr>
  <tr>
    <td></td>
    <td> -v </td>
    <td>rm -v `pwd`/rm_CMD_TestFolder/rm_CMD_TestFile3.txt</td>
    <td>상세 정보 출력</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Folders_Files/Rmdir_DeleteDirectory.sh">Rmdir_DeleteDirectory.sh</a></td>
    <td rowspan="2">rmdir</td>
    <td></td>
    <td> -p </td>
    <td>rmdir -p 'pwd'/rmdir_CMD_TestFolder/rmdir_CMD_TestFolder2/</td>
    <td>하위 디렉토리까지 삭제</td>
  </tr>
  <tr>
    <td></td>
    <td> -v </td>
    <td>rmdir -v 'pwd'/rmdir_CMD_TestFolder/</td>
    <td>상세 정보 출력<</td>
  </tr>
  <tr>
    <td rowspan="9"><a href="Folders_Files/Umask_AccessAuthoritySet.sh">Umask_AccessAuthoritySet.sh</a></td>
    <td rowspan="9">umask</td>
    <td></td>
    <td></td>
    <td>umask 012</td>
    <td>허용하지 않을 권한을 설정</td>
  </tr>
  <tr>
    <td></td>
    <td> -S </td>
    <td>umask -S</td>
    <td>기본 권한 출력</td>
  </tr>
</table>

## **System Control**

<table>
  <tr>
    <td>쉘스크립트</td>
    <td>명령어</td>
    <td>기능</td>
    <td>옵션</td>
    <td>예시</td>
    <td>비고</td>
  </tr>
  <tr>
    <td><a href="System/Alias_CommandCreate.sh">Alias_CommandCreate.sh</a></td>
    <td>alias</td>
    <td></td>
    <td></td>
    <td>alias ll='ls -l'</td>
    <td>임의의 명령어를 선언</td>
  </tr>
  <tr>
    <td><a href="System/Clear_TerminalClear.sh">Clear_TerminalClear.sh</a></td>
    <td>clear</td>
    <td></td>
    <td></td>
    <td>clear</td>
    <td>현재의 터미널 화면을 클리어</td>
  </tr>
  <tr>
    <td rowspan="4"><a href="System/Df_DiskSpaceCheck.sh">Df_DiskSpaceCheck.sh</a></td>
    <td rowspan="4">df</td>
    <td></td>
    <td> -h </td>
    <td>df -h</td>
    <td>용량의 경우 사람이 읽을 수 있는 출력(/1024)</td>
  </tr>
  <tr>
    <td></td>
    <td> -H </td>
    <td>df -H</td>
    <td>용량의 경우 사람이 읽을 수 있는 출력(/1000)</td>
  </tr>
  <tr>
    <td></td>
    <td> -l </td>
    <td>df -l</td>
    <td>로컬에 장착된 정보만 표시</td>
  </tr>
  <tr>
    <td></td>
    <td> -P </td>
    <td>df -P</td>
    <td>2줄 이상으로 출력되는 디렉토리의 경우 한 줄에 모두 출력</td>
  </tr>
  <tr>
    <td rowspan="4"><a href="System/Du_DirectoryUsageCheck.sh">Du_DirectoryUsageCheck.sh</a></td>
    <td rowspan="4">du</td>
    <td></td>
    <td></td>
    <td>du</td>
    <td>현재 디렉토리에서 각 디렉토리별 용량을 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -a </td>
    <td>du -a `pwd`/</td>
    <td>현재 디렉토리에서 하위 디렉토리까지의 용량을 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -h </td>
    <td>du -h `pwd`/</td>
    <td>용량의 경우 사람이 읽을 수 있는 출력(/1024)</td>
  </tr>
  <tr>
    <td></td>
    <td> -s </td>
    <td>du -s `pwd`/</td>
    <td>사용되는 용량의 총합을 출력</td>
  </tr>
  <tr>
    <td><a href="System/Echo_PrintLine.sh">Echo_PrintLine.sh</a></td>
    <td>echo</td>
    <td></td>
    <td></td>
    <td>echo `pwd`</td>
    <td>명령어는 주어진 인자(문자열)를 화면에 출력</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="System/Env_EnvironmentalVariable.sh">Env_EnvironmentalVariable.sh</a></td>
    <td rowspan="2">env</td>
    <td></td>
    <td></td>
    <td>env -0</td>
    <td>개행코드를 제외하여 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -u </td>
    <td>env -u TESTenv</td>
    <td>지정된 변수를 제외하고 나머지 변수들을 출력</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="System/Exit_ShowExit.sh">Exit_ShowExit.sh</a></td>
    <td rowspan="2">exit</td>
    <td></td>
    <td></td>
    <td>exit</td>
    <td>실행중인 명령 또는 접속상태를 종료</td>
  </tr>
  <tr>
    <td> 2 </td>
    <td></td>
    <td>exit 2</td>
    <td>2단계 위의 명령 또는 접속상태를 종료</td>
  </tr>
  <tr>
    <td><a href="System/Export_CreateGlobalVariable.sh">Export_CreateGlobalVariable.sh</a></td>
    <td>export</td>
    <td></td>
    <td></td>
    <td>export GLOBALVAR=GLOBALDATA</td>
    <td>환경변수를 선언</td>
  </tr>
  <tr>
    <td rowspan="5"><a href="System/Fc_CommandFc.sh">Fc_CommandFc.sh</a></td>
    <td rowspan="5">fc</td>
    <td></td>
    <td> -l </td>
    <td>fc -l</td>
    <td>실행중인 명령 또는 접속상태를 종료</td>
  </tr>
  <tr>
    <td></td>
    <td> -r </td>
    <td>fc -l -r</td>
    <td>가장 최근에 사용된 명령의 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -n </td>
    <td>fc -l -r -3</td>
    <td>인수 값(n)에 해당하는 이력이 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -m </td>
    <td>fc -l -r -3 -5</td>
    <td>인수 값(n)부터 인수 값(m)까지의 해당하는 이력이 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -e </td>
    <td>fc -e vim</td>
    <td>지정된 편집기(vim)로 명령어를 수정</td>
  </tr>
  <tr>
    <td><a href="System/History_CommandHistory.sh">History_CommandHistory.sh</a></td>
    <td>history</td>
    <td></td>
    <td></td>
    <td>history</td>
    <td>이전에 사용하였던 명령어 리스트를 출력 (기본 15개)</td>
  </tr>
  <tr>
    <td rowspan="5"><a href="System/Id_ShowId.sh">Id_ShowId.sh</a></td>
    <td rowspan="5">id</td>
    <td></td>
    <td></td>
    <td>id</td>
    <td>사용자의 정보를 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -u </td>
    <td>id -u</td>
    <td>UID(User ID) 정보 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -g </td>
    <td>id -g</td>
    <td>주 GID(Group ID) 정보 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -G </td>
    <td>id -G</td>
    <td>보조 GID(Group ID) 정보 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -F </td>
    <td>id -F</td>
    <td>사용자의 이름</td>
  </tr>
  <tr>
    <td><a href="System/Less_FileContentShow.sh">Less_FileContentShow.sh</a></td>
    <td>less</td>
    <td></td>
    <td></td>
    <td>less</td>
    <td>텍스트 파일의 내용을 페이지 단위로 출력(페이지단위이동 및 검색 가능)</td>
  </tr>
  <tr>
    <td><a href="System/Man_HowToUseCommand.sh">Man_HowToUseCommand.sh</a></td>
    <td>man</td>
    <td></td>
    <td></td>
    <td>man</td>
    <td>명령어의 정의 사용법등을 확인하는데 사용</td>
  </tr>
  <tr>
    <td><a href="System/More_FileContentShow.sh">More_FileContentShow.sh</a></td>
    <td>more</td>
    <td></td>
    <td></td>
    <td>more</td>
    <td>텍스트 파일의 내용을 페이지 단위로 출력</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="System/Ping_NetworkConnecting.sh">Ping_NetworkConnecting.sh</a></td>
    <td rowspan="3">ping</td>
    <td></td>
    <td> -c n </td>
    <td>ping google.com -c 3</td>
    <td>n번의 패킷만 전송</td>
  </tr>
  <tr>
    <td></td>
    <td> -i n </td>
    <td>ping google.com -i 3</td>
    <td>n초 단위의 인터벌로 패킷 전송</td>
  </tr>
  <tr>
    <td></td>
    <td> -t n </td>
    <td>ping google.com -t 2</td>
    <td>패킷을 전송하는 총 타임 n초로 설정</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="System/Ps_CheckProcess.sh">Ps_CheckProcess.sh</a></td>
    <td rowspan="3">ps</td>
    <td></td>
    <td> -f </td>
    <td>ps -f</td>
    <td>프로세스의 정보 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -e </td>
    <td>ps -e</td>
    <td>사용자의 모든 프로세스 리스트 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -l </td>
    <td>ps -l</td>
    <td>프로세스 정보, 리소스, 런타임을 출력</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="System/Set_LocalEnvironmentalVariable.sh">Set_LocalEnvironmentalVariable.sh</a></td>
    <td rowspan="3">set</td>
    <td></td>
    <td></td>
    <td>set</td>
    <td>쉘에서 사용하는 변수의 on/off 리스트 출력, 쉘 내부에서는 전역변수를 설정하는데 사용</td>
  </tr>
  <tr>
    <td></td>
    <td> -o </td>
    <td>set -o vi</td>
    <td>기본 변수 옵션을 활성화</td>
  </tr>
  <tr>
    <td></td>
    <td> +o </td>
    <td>set +o vi</td>
    <td>기본 변수 옵션을 비활성화</td>
  </tr>
  <tr>
    <td><a href="System/Sleep_ProgramDelay.sh">Sleep_ProgramDelay.sh</a></td>
    <td>sleep</td>
    <td> n </td>
    <td></td>
    <td>sleep 60</td>
    <td>n초간 대기상태</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="System/Top_OSInformation.sh">Top_OSInformation.sh</a></td>
    <td rowspan="2">top</td>
    <td></td>
    <td></td>
    <td>top</td>
    <td>현재 기동중인 모든 프로세스를 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -n </td>
    <td>top -n 10</td>
    <td>현재 기동중인 프로세스 중에서 CPU사용량(기본값) 상위 10개를 출력</td>
  </tr>
  <tr>
    <td rowspan="7"><a href="System/Uname_SystemInfo.sh">Uname_SystemInfo.sh</a></td>
    <td rowspan="7">uname</td>
    <td></td>
    <td> -s </td>
    <td>uname -s</td>
    <td>커널 이름</td>
  </tr>
  <tr>
    <td></td>
    <td> -n </td>
    <td>uname -n</td>
    <td>네트워크 호스트이름</td>
  </tr>
  <tr>
    <td></td>
    <td> -r </td>
    <td>uname -r</td>
    <td>커널 릴리스 버전</td>
  </tr>
  <tr>
    <td></td>
    <td> -v </td>
    <td>uname -v</td>
    <td>커널 버전</td>
  </tr>
  <tr>
    <td></td>
    <td> -m </td>
    <td>uname -m</td>
    <td>시스템 하드웨어 타입 정보</td>
  </tr>
  <tr>
    <td></td>
    <td> -p </td>
    <td>uname -p</td>
    <td>프로세서 타입 정보</td>
  </tr>
  <tr>
    <td></td>
    <td> -a </td>
    <td>uname -a</td>
    <td>uname -s -n -r -v -m 과 같은 출력</td>
  </tr>
  <tr>
    <td><a href="System/Unset_DeleteVariable.sh">Unset_DeleteVariable.sh</a></td>
    <td>unset</td>
    <td></td>
    <td></td>
    <td>unset GLOBALVAR</td>
    <td>설정된 전역변수를 해제</td>
  </tr>
  <tr>
    <td><a href="System/Uptime_SystemUpTime.sh">Uptime_SystemUpTime.sh</a></td>
    <td>uptime</td>
    <td></td>
    <td></td>
    <td>uptime</td>
    <td>현재 시스템이 실행된 지 얼마나 오래되었는지와 시스템의 부하 정보를 출력</td>
  </tr>
  <tr>
    <td><a href="System/Whoami_WhoAmI.sh">Whoami_WhoAmI.sh</a></td>
    <td>whoami</td>
    <td></td>
    <td></td>
    <td>whoami</td>
    <td>현재 사용자의 이름 출력</td>
  </tr>
</table>

## **Zip Control**

<table>
  <tr>
    <td>쉘스크립트</td>
    <td>명령어</td>
    <td>기능</td>
    <td>옵션</td>
    <td>예시</td>
    <td>비고</td>
  </tr>
  <tr>
    <td><a href="Zip/Gunzip_GzipFileUnzip.sh">Gunzip_GzipFileUnzip.sh</a></td>
    <td>gunzip</td>
    <td></td>
    <td></td>
    <td>gunzip `pwd`/gunzip_CMD_TestFolder/gunzip_CMD_TestFile1.txt.gz</td>
    <td>gzip, gz형식의 파일 압축해제</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Zip/Gzip_GzipCompress.sh">Gzip_GzipCompress.sh</a></td>
    <td rowspan="2">gzip</td>
    <td></td>
    <td></td>
    <td>gzip `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile1.txt</td>
    <td>gz형식으로 파일 압축</td>
  </tr>
  <tr>
    <td></td>
    <td> -d </td>
    <td>gzip -d `pwd`/gzip_CMD_TestFolder/gzip_CMD_TestFile2.txt.gz</td>
    <td>gzip, gz형식의 파일 압축해제</td>
  </tr>
  <tr>
    <td rowspan="6"><a href="Zip/Tar_TapeARchiver.sh">Tar_TapeARchiver.sh</a></td>
    <td rowspan="6">tar</td>
    <td> cvf </td>
    <td></td>
    <td>tar cvf `pwd`/tar_CMD_TestFolder/Testtar1.tar `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile1.txt `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile2.txt</td>
    <td>아카이브 파일(f) 생성(c) 결과를 출력(v)</td>
  </tr>
  <tr>
    <td> tvf </td>
    <td></td>
    <td>tar tvf `pwd`/tar_CMD_TestFolder/Testtar1.tar</td>
    <td>아카이브 파일(f) 리스트(t) 결과를 출력(v)</td>
  </tr>
  <tr>
    <td> xvf </td>
    <td></td>
    <td>tar xvf `pwd`/tar_CMD_TestFolder/Testtar1.tar</td>
    <td>아카이브 파일(f)을 현재폴더에추출(x) 결과를 출력(v)</td>
  </tr>
  <tr>
    <td> tvf </td>
    <td> -C </td>
    <td>tar xvf `pwd`/tar_CMD_TestFolder/Testtar2.tar -C `pwd`/tar_CMD_TestFolder/tar_CMD_TestFolder2</td>
    <td>아카이브 파일(f)을 지정된폴더(-C)에추출(x) 결과를 출력(v)</td>
  </tr>
  <tr>
    <td> rvf </td>
    <td></td>
    <td>tar rvf `pwd`/tar_CMD_TestFolder/Testtar3.tar `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile1.txt</td>
    <td>아카이브 파일(f)에 파일추가(r) 결과를 출력(v)</td>
  </tr>
  <tr>
    <td> uvf </td>
    <td></td>
    <td>tar uvf `pwd`/tar_CMD_TestFolder/Testtar4.tar `pwd`/tar_CMD_TestFolder/tar_CMD_TestFile2.txt</td>
    <td>아카이브 파일(f)에 파일갱신(u) 결과를 출력(v)</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="Zip/Unzip_FileUnzip.sh">Unzip_FileUnzip.sh</a></td>
    <td rowspan="3">unzip</td>
    <td></td>
    <td> -l </td>
    <td>unzip -l `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip</td>
    <td>파일내 리스트 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -q </td>
    <td>unzip -q `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip</td>
    <td>압축해제를 완료하면 요약을 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -d </td>
    <td>unzip `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFile1.zip -d `pwd`/unzip_CMD_TestFolder/unzip_CMD_TestFolder2/</td>
    <td>지정된 폴더에 압축해제</td>
  </tr>
  <tr>
    <td rowspan="5"><a href="Zip/Zip_ZipCompress.sh">Zip_ZipCompress.sh</a></td>
    <td rowspan="5">zip</td>
    <td></td>
    <td> -r </td>
    <td>zip -r `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_r.zip `pwd`/zip_CMD_TestFolder/</td>
    <td>폴더 및 파일을 압축</td>
  </tr>
  <tr>
    <td></td>
    <td> -q </td>
    <td>zip -q `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_q.zip `pwd`/zip_CMD_TestFolder/*</td>
    <td>압축 프로세스가 인쇄되지 않음</td>
  </tr>
  <tr>
    <td></td>
    <td> -9 </td>
    <td>zip -9 `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_9.zip `pwd`/zip_CMD_TestFolder/*</td>
    <td>높은 레벨 압축(0[가장 낮은 레벨] ~ 9[가장 높은 레벨])</td>
  </tr>
  <tr>
    <td></td>
    <td> -j </td>
    <td>zip -j `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_j.zip `pwd`/zip_CMD_TestFolder/*</td>
    <td>디렉토리는 무시한채 파일만으로 압축</td>
  </tr>
  <tr>
    <td></td>
    <td> -d </td>
    <td>zip -d `pwd`/zip_CMD_TestFolder/zip_CMD_TestFileFolder_j.zip zip_CMD_TestFile1.txt</td>
    <td>압축파일에서 지정된 파일 삭제</td>
  </tr>
</table>

## **Script_Tip Control**

<table>
  <tr>
    <td>쉘스크립트</td>
    <td>명령어</td>
    <td>기능</td>
    <td>옵션</td>
    <td>예시</td>
    <td>비고</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/Break_LoopTermination.sh">Break_LoopTermination.sh</a></td>
    <td>break</td>
    <td> n </td>
    <td></td>
    <td>break</td>
    <td>n번 째 while, for 루프문을 종료</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/Continue_LoopContinue.sh">Continue_LoopContinue.sh</a></td>
    <td>continue</td>
    <td> n </td>
    <td></td>
    <td>continue</td>
    <td>n번 째 while, for 루프문 패스하여 하위 처리를 진행</td>
  </tr>
  <tr>
    <td rowspan="7"><a href="Script_Tip/Declare_VariableDeclaration.sh">Declare_VariableDeclaration.sh</a></td>
    <td rowspan="7">declare</td>
    <td></td>
    <td> -x </td>
    <td>declare -x DeclareVariExport=VariExport</td>
    <td>글로벌 변수로 선언</td>
  </tr>
  <tr>
    <td></td>
    <td> -r </td>
    <td>declare -r DeclareVariReadOnly=VariReadOnly</td>
    <td>읽기 전용 변수로 선언</td>
  </tr>
  <tr>
    <td></td>
    <td> -a </td>
    <td>declare -a DeclareVariArray=(Text1 Text2)</td>
    <td>배열로 선언</td>
  </tr>
  <tr>
    <td></td>
    <td> -i </td>
    <td>declare -i DeclareVariString=String</td>
    <td>숫자형(integer) 값만 설정가능, 문자형의 경우 0값으로 설정</td>
  </tr>
  <tr>
    <td></td>
    <td> -f </td>
    <td>declare -f declare_VariableDeclaration</td>
    <td>현재 정의된 함수의 내용을 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -F </td>
    <td>declare -F</td>
    <td>정의되어 있는 함수를 출력</td>
  </tr>
  <tr>
    <td></td>
    <td> -p </td>
    <td>declare -p</td>
    <td>현재 정의된 모든 변수 출력</td>
  </tr>
  <tr>
    <td rowspan="4"><a href="Script_Tip/Egrep_RegularExpression.sh">Egrep_RegularExpression.sh</a></td>
    <td rowspan="4">egrep</td>
    <td> [ . ] </td>
    <td></td>
    <td>RegularExpression_CMD_TestFile.txt  | egrep _...._</td>
    <td>한 자리가 일치하는 패턴</td>
  </tr>
  <tr>
    <td> [ ? ] </td>
    <td></td>
    <td>RegularExpression_CMD_TestFile.txt  | egrep _D?ate_ "</td>
    <td>앞의 문자와 0번 또는 1번 일치하는 패턴</td>
  </tr>
  <tr>
    <td> [ * ] </td>
    <td></td>
    <td>RegularExpression_CMD_TestFile.txt  | egrep _*_</td>
    <td>0번 이상 일치하는 패턴</td>
  </tr>
  <tr>
    <td> [ {N} ] </td>
    <td></td>
    <td>RegularExpression_CMD_TestFile.txt  | egrep 7{3}</td>
    <td>앞에 일치하는 값이 연속 {N}번 등장하는 패턴</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/Expr_Calculate.sh">Expr_Calculate.sh</a></td>
    <td>expr</td>
    <td></td>
    <td></td>
    <td>ADDVar=` expr $NumVar1 '+' $NumVar2 `</td>
    <td>숫자형 데이터의 연산처리를 실행( +, -, *, /, % )</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/For_ForLoop.sh">For_ForLoop.sh</a></td>
    <td>for</td>
    <td></td>
    <td></td>
    <td>for indexNum in {4..9}; do echo $indexNum; done</td>
    <td>리스트의 갯수만큼 반복하는 반복문</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/If_ConditionCompare.sh">If_ConditionCompare.sh</a></td>
    <td>if</td>
    <td></td>
    <td></td>
    <td>if [ $Var2 = 11 ]; then echo " if_Data : $Var2 "; elif [ $Var2 = 9 ]; then echo " elif_Data : $Var2 "; else echo " else_Data : $Var2 "; fi</td>
    <td>조건문 if</td>
  </tr>
  <tr>
    <td rowspan="6"><a href="Script_Tip/If_FileProperties.sh">If_FileProperties.sh</a></td>
    <td rowspan="6">if</td>
    <td> -e </td>
    <td></td>
    <td>if [ -e `pwd`/FIleProperties/FIleProperties_not.txt ]; then echo " `pwd`/FIleProperties_not.txt file not exist "; fi</td>
    <td>파일이 존재하는지 확인</td>
  </tr>
  <tr>
    <td> -f </td>
    <td></td>
    <td>if [ -f `pwd`/FIleProperties/FIleProperties_not.txt ]; then echo " Argument is not normal file "; fi</td>
    <td>일반 파일인지 확인</td>
  </tr>
  <tr>
    <td> -d </td>
    <td></td>
    <td>if [ -d `pwd`/FIleProperties/FIleProperties_1.txt ]; then echo " Argument is not folder "; fi</td>
    <td>폴더인지 확인</td>
  </tr>
  <tr>
    <td> -r </td>
    <td></td>
    <td>if [ -r `pwd`/FIleProperties/FIleProperties_1.txt ]; then echo " permission to read "; fi</td>
    <td>읽기 권한이 있는지 확인</td>
  </tr>
  <tr>
    <td> -w </td>
    <td></td>
    <td>if [ -w `pwd`/FIleProperties/FIleProperties_1.txt ]; then echo " permission to read "; fi</td>
    <td>쓰기 권한이 있는지 확인</td>
  </tr>
  <tr>
    <td> -x </td>
    <td></td>
    <td>if [ -x `pwd`/FIleProperties/FIleProperties_1.txt ]; then echo " permission to read "; fi</td>
    <td>실행 권한이 있는지 확인</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/IFS_DataSeparator.sh">IFS_DataSeparator.sh</a></td>
    <td>IFS</td>
    <td></td>
    <td></td>
    <td>IFS=":"</td>
    <td>별도 지정이 없는경우 " " 공백이 데이터구분자로 설정되어있다. 쉘스크립트 작성시 oldifs="$IFS" 로 백업후 설정후 수정하는 편이 좋다.</td>
  </tr>
  <tr>
    <td rowspan="4"><a href="Script_Tip/Read_UserWrite.sh">Read_UserWrite.sh</a></td>
    <td rowspan="4">read</td>
    <td> " Contents " </td>
    <td> -p </td>
    <td>read -p " input your number : " tel</td>
    <td>read명령어 실행시 먼저 출력되는 값(Contents)을 출력</td>
  </tr>
  <tr>
    <td> m </td>
    <td> -n </td>
    <td>read -n 4 nickName</td>
    <td>변수에 설정될 값의 길이(m)를 설정</td>
  </tr>
  <tr>
    <td> m </td>
    <td> -t </td>
    <td>read -t 3 waittime</td>
    <td>입력을 기다리는 시간(m)을 설정</td>
  </tr>
  <tr>
    <td></td>
    <td> -s </td>
    <td>read -s hideString</td>
    <td>입력되는 값이 보이지 않도록 설정(비밀번호)</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/Readonly_VariableReadonly.sh">Readonly_VariableReadonly.sh</a></td>
    <td>readonly</td>
    <td></td>
    <td></td>
    <td>readonly ReadonlyVariString=VariString</td>
    <td>재설정이 불가능한 변수 설정</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="Script_Tip/Sh_ShellStart.sh">Sh_ShellStart.sh</a></td>
    <td rowspan="3">sh</td>
    <td></td>
    <td></td>
    <td>sh `pwd`/Test_Sample/Test_ShellStart.sh</td>
    <td>쉘 스크립트를 실행(sh, bash, zsh등 원하는 쉘로 실행가능)</td>
  </tr>
  <tr>
    <td></td>
    <td> -x </td>
    <td>sh -x `pwd`/Test_Sample/Test_ShellStart.sh</td>
    <td>쉘 스크립트를 디버그모드로 실행(처리과정이 모두 출력되고 선두에 +가 붙어서 출력) </td>
  </tr>
  <tr>
    <td></td>
    <td> -v </td>
    <td>sh -v `pwd`/Test_Sample/Test_ShellStart.sh</td>
    <td>쉘 스크립트를 디버그모드로 실행(처리과정이 간결하게 출력)</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/Shift_ParameterDelete.sh">Shift_ParameterDelete.sh</a></td>
    <td>shift</td>
    <td> n </td>
    <td></td>
    <td>shift 2</td>
    <td>아규먼트를 n개씩 제거(기본 1개)</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/Tip_BackgroundRun.sh">Tip_BackgroundRun.sh</a></td>
    <td></td>
    <td> & </td>
    <td></td>
    <td>sh `pwd`/Test_Sample/Test_BackgroundRun.sh &</td>
    <td>쉘스크립트 실행시 &를 추가하면 백그라운드에서 쉘이 실행</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/Tip_CalculateBracket.sh">Tip_CalculateBracket.sh</a></td>
    <td></td>
    <td> $(( Calculate )) </td>
    <td></td>
    <td>ADDVar=$(( $NumVar1 + $NumVar2 ))</td>
    <td>$((  ))의 형식으로 숫자형 데이터의 연산처리를 실행( +, -, *, /, % )</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Script_Tip/Tip_ConditionalCommand.sh">Tip_ConditionalCommand.sh</a></td>
    <td rowspan="2"></td>
    <td> && </td>
    <td></td>
    <td>pwdd && date</td>
    <td>&& 이전의 커맨드 실행에 실패하면 && 이후의 커맨드는 실행되지 않음</td>
  </tr>
  <tr>
    <td></td>
    <td> || </td>
    <td>pwdd || date</td>
    <td>&& 이전의 커맨드 실행에 실패하더라도 || 이후의 커맨드는 실행된다</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/Tip_Function.sh">Tip_Function.sh</a></td>
    <td>function</td>
    <td></td>
    <td></td>
    <td>function TestFunc4() { echo "TestFunc4 print1"; }</td>
    <td>스크립트에서 반복적으로 실행되는 함수를 선언( 생략 가능 부분 : function,함수명뒤의 () )</td>
  </tr>
  <tr>
    <td rowspan="7"><a href="Script_Tip/Tip_Mark_CommandExclamationMark.sh">Tip_Mark_CommandExclamationMark.sh</a></td>
    <td rowspan="7"></td>
    <td> ! </td>
    <td></td>
    <td>!!</td>
    <td>터미널을 기동하여 실행된 커맨드중에서 n번째로 실행된 명령을 실행(실패한 커맨드여도 실행)</td>
  </tr>
  <tr>
    <td> -n </td>
    <td></td>
    <td>!-3</td>
    <td>이전에 실행되었던 n번째 이전에 실행된 커맨드를 실행(실패한 커맨드여도 실행)</td>
  </tr>
  <tr>
    <td> p </td>
    <td></td>
    <td>!p</td>
    <td>p로 시작되는 가장 최근에 실행된 명령어가 실행</td>
  </tr>
  <tr>
    <td> ?at </td>
    <td></td>
    <td>!?at</td>
    <td>at를 포함하는 가장 최근에 사용한 명령어를 실행</td>
  </tr>
  <tr>
    <td> :n </td>
    <td></td>
    <td>!:2</td>
    <td>이전에 사용하였던 [echo a s d f] 명령에서 n번째 아규먼트를 가져온다.(예시로는 s)</td>
  </tr>
  <tr>
    <td> ^ </td>
    <td></td>
    <td>!^</td>
    <td>이전에 사용하였던 [echo a s d f] 명령에서 첫번째 아규먼트를 가져온다.(예시로는 a)</td>
  </tr>
  <tr>
    <td> * </td>
    <td></td>
    <td>!*</td>
    <td>이전에 사용하였던 [echo a s d f] 명령에서 사용한 모든 아규먼트를 가져온다</td>
  </tr>
  <tr>
    <td rowspan="9"><a href="Script_Tip/Tip_Parameter_ShellRunArgument.sh">Tip_Parameter_ShellRunArgument.sh</a></td>
    <td rowspan="9"></td>
    <td> $ </td>
    <td></td>
    <td>$$</td>
    <td>현재 쉘의 프로세스 ID</td>
  </tr>
  <tr>
    <td> ! </td>
    <td></td>
    <td>$!</td>
    <td>가장 최근에 백그라운드로 실행된 프로세스의 ID</td>
  </tr>
  <tr>
    <td> ? </td>
    <td></td>
    <td>$?</td>
    <td>가장 최근에 실행된 포그라운드 파이프라인의 종료상태</td>
  </tr>
  <tr>
    <td> 0 </td>
    <td></td>
    <td>$0</td>
    <td>쉘 또는 쉘 스크립트의 이름</td>
  </tr>
  <tr>
    <td> _ </td>
    <td></td>
    <td>$_</td>
    <td>실행된 쉘의 절대경로</td>
  </tr>
  <tr>
    <td> * </td>
    <td></td>
    <td>$*</td>
    <td>모든 파라미터의 값들("$*"처럼 사용시 ''로 묶이더라도 공백으로 데이터를 구분)</td>
  </tr>
  <tr>
    <td> n </td>
    <td></td>
    <td>$1</td>
    <td>n 번째 파라미터(10이상의 2자리 이상의 파라미터는 ${10}과 같이 괄호로 감싸야한다)</td>
  </tr>
  <tr>
    <td> # </td>
    <td></td>
    <td>$#</td>
    <td>입력받은 파라미터 갯수</td>
  </tr>
  <tr>
    <td> @ </td>
    <td></td>
    <td>$@</td>
    <td>모든 파라미터의 값들("$@"처럼 사용시 ''로 묶인 값은 하나로 취급)</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/Tip_Pipe_ContinuousCommand.sh">Tip_Pipe_ContinuousCommand.sh</a></td>
    <td> | </td>
    <td></td>
    <td></td>
    <td>ps -ef | grep System | head -n 5 | wc -l</td>
    <td>좌측부터의 명령어 실행되며 실행된 결과를 바탕으로 | 다음 명령이 실행</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="Script_Tip/Tip_QuotationMarks.sh">Tip_QuotationMarks.sh</a></td>
    <td rowspan="3"></td>
    <td> "" </td>
    <td></td>
    <td>Param1="pwd : $#" -> 출력 (pwd : 3)</td>
    <td>일부 특수문자만 예외 처리</td>
  </tr>
  <tr>
    <td> '' </td>
    <td></td>
    <td>Param2='pwd : $#' -> 출력 (pwd : $#)</td>
    <td>모든 특수문자를 예외 처리</td>
  </tr>
  <tr>
    <td> `` </td>
    <td></td>
    <td>Param3=`pwd : $#` -> 출력 (path : 3)</td>
    <td>명령의 결과를 출력</td>
  </tr>
  <tr>
    <td rowspan="3"><a href="Script_Tip/Tip_QuotationMarks.sh">Tip_QuotationMarks.sh</a></td>
    <td rowspan="3"></td>
    <td> "" </td>
    <td></td>
    <td>Param1="pwd : $#" -> 출력 (pwd : 3)</td>
    <td>일부 특수문자만 예외 처리</td>
  </tr>
  <tr>
    <td> '' </td>
    <td></td>
    <td>Param2='pwd : $#' -> 출력 (pwd : $#)</td>
    <td>모든 특수문자를 예외 처리</td>
  </tr>
  <tr>
    <td> `` </td>
    <td></td>
    <td>Param3=`pwd : $#` -> 출력 (path : 3)</td>
    <td>명령의 결과를 출력</td>
  </tr>
  <tr>
    <td rowspan="6"><a href="Script_Tip/Tip_RedirectionOperator.sh">Tip_RedirectionOperator.sh</a></td>
    <td rowspan="6"></td>
    <td> < </td>
    <td></td>
    <td>sort < `pwd`/RedirectionOperator_CMD_TestFolder/RedirectionOperator_CMD_TestFile.txt</td>
    <td>오른쪽에서 실행된 결과를 왼쪽 명령에서 실행</td>
  </tr>
  <tr>
    <td> > </td>
    <td></td>
    <td>pwd > `pwd`/RedirectionOperator_CMD_TestFolder/CreateWriteRedirectFile.txt</td>
    <td>왼쪽 명령의 결과를 오른쪽으로 출력(덮어쓰기)</td>
  </tr>
  <tr>
    <td> >> </td>
    <td></td>
    <td>pwd >> `pwd`/RedirectionOperator_CMD_TestFolder/AddWriteRedirectFile.txt</td>
    <td>왼쪽 명령의 결과를 오른쪽으로 출력(이어쓰기)</td>
  </tr>
  <tr>
    <td> 2>> </td>
    <td></td>
    <td>pwd 2>> `pwd`/RedirectionOperator_CMD_TestFolder/ErrWriteRedirectFile.txt</td>
    <td>왼쪽 명령의 오류결과를 오른쪽으로 출력</td>
  </tr>
  <tr>
    <td> &> </td>
    <td></td>
    <td>pwd &> `pwd`/RedirectionOperator_CMD_TestFolder/OutputRedirectAndErr2.txt</td>
    <td>왼쪽의 결과를 오른쪽으로 출력(덮어쓰기)</td>
  </tr>
  <tr>
    <td> 2>&1 </td>
    <td></td>
    <td>cat `pwd`/RedirectionOperator_CMD_TestFolder/NoFile.txt > /dev/null 2>&1</td>
    <td>왼쪽 내용의 오류 출력 표준</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/Tip_Semicolon_CommandEnd.sh">Tip_Semicolon_CommandEnd.sh</a></td>
    <td> ; </td>
    <td></td>
    <td></td>
    <td>cal; pwd; date;</td>
    <td>커맨드가 종료됨을 명시. 한 줄에 여러 명령을 실행가능</td>
  </tr>
  <tr>
    <td rowspan="4"><a href="Script_Tip/Tip_VariablesCut.sh">Tip_VariablesCut.sh</a></td>
    <td rowspan="4"></td>
    <td> ${Variable%pattern} </td>
    <td></td>
    <td>${TestVariablePattern%B*}</td>
    <td>변수 Variable 값에서 끝지점을 포함하여 가장 짧게 매칭되는 패턴(%뒷부분) 삭제(일시적)</td>
  </tr>
  <tr>
    <td> ${Variable%%pattern} </td>
    <td></td>
    <td>${TestVariablePattern%%B*}</td>
    <td>변수 Variable 값에서 끝지점을 포함하여 가장 길게 매칭되는 패턴(%%뒷부분) 삭제(일시적)</td>
  </tr>
  <tr>
    <td> ${Variable#pattern} </td>
    <td></td>
    <td>${TestVariablePattern#*B}</td>
    <td>변수 Variable 값에서 시작지점을 포함하여 가장 짧게 매칭되는 패턴(#뒷부분) 삭제(일시적)</td>
  </tr>
  <tr>
    <td> ${Variable##pattern} </td>
    <td></td>
    <td>${TestVariablePattern##*B}</td>
    <td>변수 Variable 값에서 시작지점을 포함하여 가장 길게 매칭되는 패턴(##뒷부분) 삭제(일시적)</td>
  </tr>
  <tr>
    <td rowspan="6"><a href="Script_Tip/Tip_VariablesExtensionModifiy.sh">Tip_VariablesExtensionModifiy.sh</a></td>
    <td rowspan="6"></td>
    <td> ${Variable:-STRING} </td>
    <td></td>
    <td>${TestVariableNotNull:-Test1}</td>
    <td>변수가 null이 아니라면 변수의 값을 그대로 사용하고, 변수가 null이라면 [STRING]로 치환(일시적)</td>
  </tr>
  <tr>
    <td> ${Variable:=STRING} </td>
    <td></td>
    <td>${TestVariableNotNull:=Test1}</td>
    <td>변수가 null이 아니라면 변수의 값을 그대로 사용하고, 변수가 null이라면 [STRING]로 치환(영구적)</td>
  </tr>
  <tr>
    <td> ${Variable:+STRING} </td>
    <td></td>
    <td>${TestVariableNotNull:+Test1}</td>
    <td>변수가 null이 아니라면 [STRING]로 치환하고, 변수가 null이라면 아무것도 하지 않는다(일시적)</td>
  </tr>
  <tr>
    <td> ${Variable:n} </td>
    <td></td>
    <td>${TestVariableNotNull:6}</td>
    <td>변수값 좌측부터 [offset] 숫자만큼 소거(offset)하여 출력. [offset]은 양수만 입력(일시적)</td>
  </tr>
  <tr>
    <td> ${Variable:n:m} </td>
    <td></td>
    <td>${TestVariableNotNull:6:3}</td>
    <td>변수값 좌측부터 [offset] 숫자만큼 소거(offset)하고 [length] 만큼 출력. [offset][length]는 양수만 입력(일시적)</td>
  </tr>
  <tr>
    <td> ${Variable:?STRING} </td>
    <td></td>
    <td>${TestVariableNull:?Test1}</td>
    <td>변수가 null이 아니라면 변수값을 사용하고, 변수가 null이라면 에러 출력후 쉘이 종료</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/Until_UntilLoop.sh">Until_UntilLoop.sh</a></td>
    <td>until</td>
    <td></td>
    <td></td>
    <td>until [ $number -gt 20 ]; do echo "$number"; number=`expr $number + 1`; done</td>
    <td>조건문이 결과가 false일 경우에 반복문이 실행된다.</td>
  </tr>
  <tr>
    <td><a href="Script_Tip/While_WhileLoop.sh">While_WhileLoop.sh</a></td>
    <td>while</td>
    <td></td>
    <td></td>
    <td>while [ $number -lt 20 ]; do echo "$number"; number=`expr $number + 1`; done</td>
    <td>조건문이 결과가 true 경우에 반복문이 실행된다.</td>
  </tr>
</table>

## **Vim Control**

<table>
  <tr>
    <td>쉘스크립트</td>
    <td>명령어</td>
    <td>기능</td>
    <td>옵션</td>
    <td>예시</td>
    <td>비고</td>
  </tr>
  <tr>
    <td rowspan="1"><a href="Vim_Control/Vi_VimCommand.sh">Vi_VimCommand.sh</a></td>
    <td rowspan="1">vi</td>
    <td></td>
    <td></td>
    <td>vi vim_CMD_TestFolder/vim_CMD_TestFile1.txt</td>
    <td>vim 편집기사용법 (한국어)</td>
  </tr>
</table>