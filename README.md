# Bash_Shell_CMD
Bash Shell command
<table>
  <tr>
    <td><a href="README.md">Korean</a></td>
    <td><a href="README_JP.md">Japanese</a></td>
    <td><a href="README_EN.md">English</a></td>
  </tr>
</table>

**Data Control**
<table>
  <tr>
    <td>구분</td>
    <td>쉘스크립트</td>
    <td>명령어</td>
    <td>옵션</td>
    <td>비고</td>
  </tr>
  <tr>
    <td rowspan="50">Data</td>
    <td rowspan="2"><a href="Data/Awk_DataControlAwk.sh">Awk_DataControlAwk.sh</a></td>
    <td rowspan="2">awk</td>
    <td> -f </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -F </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td rowspan="5"><a href="Data/Cat_FileContentPrint.sh">Cat_FileContentPrint.sh</a></td>
    <td rowspan="5">cat</td>
    <td> -b </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -e </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -n </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -s </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -t </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td><a href="Data/Expr_ValueOperation.sh">Expr_ValueOperation.sh</a></td>
    <td>expr</td>
    <td>Contents</td>
    <td>Contents</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Data/Head_ShowFileContentHead.sh">Head_ShowFileContentHead.sh</a></td>
    <td rowspan="2">head</td>
    <td> -c </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -N </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td rowspan="2"><a href="Data/Join_FileContentJoin.sh">Join_FileContentJoin.sh</a></td>
    <td rowspan="2">join</td>
    <td> -o </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -t </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td rowspan="10"><a href="Data/Nkf_CharacterCode_NewlineCode.sh">Nkf_CharacterCode_NewlineCode.sh</a></td>
    <td rowspan="10">nkf</td>
    <td> -g </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> --guess </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -e </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -j </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -s </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -w </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -Lw </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -Lm </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -Lu </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> --oc=[codeset] </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td rowspan="10"><a href="Data/Nkf_CharacterCode_NewlineCode.sh">Nkf_CharacterCode_NewlineCode.sh</a></td>
    <td rowspan="10">nkf</td>
    <td> -g </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> --guess </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -e </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -j </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -s </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -w </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -Lw </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -Lm </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> -Lu </td>
    <td>Contents</td>
  </tr>
  <tr>
    <td> --oc=[codeset] </td>
    <td>Contents</td>
  </tr>
</table>










|명령어|옵션|쉘스크립트|비고|
|---|---|---|---|
|awk|데이터 컨트롤(awk)|DataControlAwk.sh||
|break|루프문 강제 종료|LoopTermination.sh||
|cal|달력 출력 처리|Calendar.sh||
|cat|파일 내용 출력 처리|FileContentPrint.sh||
|cd|디렉토리 이동|DirectoryMove.sh||
|chgrp|파일 그룹 변경|FileGroupEdit.sh||
|chmod|접근 권한 변경|AccessAuthorityEdit.sh||
|chown|파일 소유자 변경|FileOwnerEdit.sh||
|clear|터미널 화면 초기화|TerminalClear.sh||
|continue|루프문 하위 처리 무시|LoopContinue.sh||
|cp|파일 디렉토리 복사 처리|CopyFileFolder.sh||
|cut|세션 구분 출력|SectionCut.sh||
|date|현재 시간 출력 처리|CurrentDate.sh||
|dd|블록단위 파일 복사 및 변환|BlockFile.sh||
|df|디스크 사용량 체크|DiskSpaceCheck.sh||
|diff|파일 내용 비교|CompareFileContents.sh||
|du|디렉토리 사용량 체크|DirectoryUsageCheck.sh||
|echo|기본 출력 처리|PrintLine.sh||
|env|전역 변수 조회|EnvironmentalVariable.sh||
|exit|종료 출력 처리|ShowExit.sh||
|export|전역 변수 생성|CreateGlobalVariable.sh||
|expr|값 연산|ValueOperation.sh||
|fc|명령어 히스토리 리스트 처리 (fc)|CommandFc.sh||
|find|파일 및 디렉토리 검색|FileSearch.sh||
|grep(egrep,fgrep)|특정 문자열 검색 처리|StringSearch.sh||
|gunzip|gzip 압축 풀기|GzipUnzip.sh||
|gzip|gzip 압축 처리 시작|GzipCompress.sh||
|head|파일 내용의 선두 부분 출력 처리|ShowFileContentHead.sh||
|history|명령어 히스토리 확인 (history)|CommandHistory.sh||
|id|사용자 정보 출력|ShowId.sh||
|join|파일 내용 조인|FileContentJoin.sh||
|less|파일 내용 출력 처리(less)|FileContentShow_Less.sh||
|ln|심볼릭 링크|SymbolicLink.sh||
|ls|디렉토리내 아이템 출력|DirectoryItem.sh||
|man|리눅스 명령어 사용법 확인|HowToUseCommand.sh||
|mkdir|디렉토리 생성 처리|CreateDirectory.sh||
|more|파일 내용 출력 처리(more)|FileContentShow_More.sh||
|mv|파일(디렉토리) 이동 처리|MoveFileAndFolder.sh||
|paste|파일 내용 합치기|FileContentAdd.sh||
|ping|네트워크 연결 확인|NetworkConnecting.sh||
|printf|포멧 지정 출력|FormatOutputPrintf.sh||
|ps|실행중인 프로세스 출력|CheckProcess.sh||
|pwd|작업 디렉토리 출력 처리|ShowPwd.sh||
|rm|파일(폴더) 삭제 처리|RemoveFileAndFolder.sh||
|rmdir|디렉토리 삭제 처리|DeleteDirectory.sh||
|sed|비대화형 모드의 텍스트 파일 에디터|TextEditerSed.sh||
|set|지역 변수 조회|LocalEnvironmentalVariable.sh||
|sh|쉘 스크립트 실행 |ShellScriptStart.sh||
|shift|파라미터 리스트중 한 개 삭제|ParameterDelete.sh||
|sleep|작업 간 중간 딜레이 부여|ProgramDelay.sh||
|sort|데이터 정렬|FileSort.sh||
|tail|파일 내용의 끝 부분 출력 처리|ShowFileContentTail.sh||
|tar|여래 개의 파일을 하나의 파일로 묶거나 푸는 처리|TapeARchiver.sh||
|top|OS상태 정보 확인|OSInformation.sh||
|touch|파일의 갱신 일자 수정 처리|UpdateFileModificationDate.sh||
|tr|파일 내용 수정|FileContentEdit.sh||
|umask|접근 권한 기본 설정|AccessAuthoritySet.sh||
|uname|시스템 정보 확인|SystemInfo.sh||
|uniq|파일 내용 중복 제거|FileContentDuplicationDelete.sh||
|unset|환경 변수 삭제|DeleteVariable.sh||
|uptime|시스템 실행 시간정보|SystemUpTime.sh||
|wc|파일 내의 데이터 수 조회 처리|FileDataCounting.sh||
|whoami|작업중인 사용자 출력|WhoAmI.sh||
|zip(unzip)|zip 압축 처리|ZipCompress.sh||
|!|명령어 히스토리 목록 처리 (!)|CommandExclamationMark.sh||

**스크립트 작성법 모음 표**
|기능|쉘이름|간략 설명|비고|
|---|---|---|---|
|쉘 스크립트 파라미터|ShellScriptParameter.sh|||
|쉘 스크립트 함수|ShellScriptFunction.sh|||
|쉘 스크립트 사용자 입력|ShellScriptUserWrite.sh|||
|쉘 스크립트 파일 속성 판별 연산자|ShellScriptIFFileProperties.sh|||
|쉘 스크립트 조건문(if)|ShellScriptIF.sh|||
|쉘 스크립트 조건문(case)|ShellScriptCase.sh|||
|쉘 스크립트 반복문(while)|ShellScriptLoopWhile.sh|||
|쉘 스크립트 반복문(until)|ShellScriptLoopUntil.sh|||
|쉘 스크립트 반복문(for)|ShellScriptLoopFor.sh|||
|쉘 스크립트 명령 내용 변수에 담기|ShellScriptPrintCommand.sh|||
|쉘 스크립트 산술 계산(이중 괄호)|ShellScriptCalculateBracket.sh|||
|쉘 스크립트 산술 계산(expr)|ShellScriptCalculateExpr.sh|||
|쉘 스크립트 다중명령|ShellScriptMultiCommand.sh|||
|쉘 스크립트 조건명령|ShellScriptConditionalCommand.sh|||
|쉘 스크립트 백그라운드 실행|ShellScriptBackgroundRun.sh|||
|쉘 스크립트 변수 선언(declare/typeset)|ShellScriptVariableDeclareTypeset.sh|||
|쉘 스크립트 연관 배열(Map)|ShellScriptVariableMap.sh|||
|쉘 스크립트 읽기 전용 변수 선언(readonly)|ShellScriptVariableReadonly.sh|||
|쉘 스크립트 변수의 확장 변경자|ShellScriptVariablesExtensionModifiy.sh|||
|쉘 스크립트 변수 문자열 자르기|ShellScriptVariablesCut.sh|||
|쉘 스크립트 리다이렉션 연산자|ShellScriptRedirectionOperator.sh|||
|쉘 스크립트 명령 결과에 추가 명령|ShellScriptPipeCommand.sh|||
|쉘 스크립트 정규식표현|ShellScriptRegularExpression.sh|||
|쉘 스크립트 디버그|ShellScriptDebug.sh|||
|쉘 스크립트 내부 필드 분리자|ShellScriptIFS.sh|||
|쉘 스크립트 따옴표|ShellScriptQuotationMarks.sh|||

**Vim 사용법**
|기능|쉘이름|간략 설명|비고|
|---|---|---|---|
|Vim 사용법|VimCommand.sh|||