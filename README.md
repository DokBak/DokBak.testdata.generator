# Bash_Shell_CMD
Bash Shell command

**명령어 모음 표**
|명령어|쉘이름|간략 설명|비고|
|---|---|---|---|
|alias|CommandCreate.sh|명령어 선언|쉘 스크립트내에서 선언시 정상작동하지 않는것으로 보임, alias로 변수를 설정하기보단 bash의 설정파일에 직접 추가하는 방법을 권장함|
|cal|Calendar.sh|달력 출력 처리||
|cat|FileContentPrint.sh|파일 내용 출력 처리||
|cd|DirectoryMove.sh|디렉토리 이동||
|clear|TerminalClear.sh|터미널 화면 초기화||
|cp|CopyFileFolder.sh|파일 디렉토리 복사 처리||
|date|CurrentDate.sh|현재 시간 출력 처리||
|dd|BlockFile.sh|블록단위 파일 복사 및 변환||
|diff|CompareFileContents.sh|파일 내용 비교||
|echo|PrintLine.sh|기본 출력 처리||
|env|EnvironmentalVariable.sh|전역 변수 조회||
|exit|ShowExit.sh|종료 출력 처리||
|export|CreateGlobalVariable.sh|전역 변수 생성||
|expr|ValueOperation.sh|값 연산||
|find|FileSearch.sh|파일 및 디렉토리 검색||
|grep|StringSearch.sh|특정 문자열 검색 처리||
|gzip|GzipCompress.sh|gzip 압축 처리 시작||
|head|ShowFileContentHead.sh|파일 내용의 선두 부분 출력 처리||
|id|ShowId.sh|사용자 정보 출력||
|ls|DirectoryItem.sh|디렉토리내 아이템 출력||
|man|HowToUseCommand.sh|리눅스 명령어 사용법 확인||
|mkdir|CreateDirectory.sh|디렉토리 생성 처리||
|mv|MoveFileAndFolder.sh|파일(디렉토리) 이동 처리||
|ps|CheckProcess.sh|실행중인 프로세스 출력||
|pwd|ShowPwd.sh|작업 디렉토리 출력 처리||
|rm|RemoveFileAndFolder.sh|파일(폴더) 삭제 처리||
|rmdir|DeleteDirectory.sh|디렉토리 삭제 처리||
|set|LocalEnvironmentalVariable.sh|지역 변수 조회||
|sh|ShellScriptStart.sh|쉘 스크립트 실행 ||
|sleep|ProgramDelay.sh|작업 간 중간 딜레이 부여||
|sort|FileSort.sh|데이터 정렬||
|tail|ShowFileContentTail.sh|파일 내용의 끝 부분 출력 처리||
|tar|TapeARchiver.sh|여래 개의 파일을 하나의 파일로 묶거나 푸는 처리||
|touch|UpdateFileModificationDate.sh|파일의 갱신 일자 수정 처리||
|unset|DeleteVariable.sh|환경 변수 삭제||
|wc|FileDataCounting.sh|파일 내의 데이터 수 조회 처리||
|whoami|WhoAmI.sh|작업중인 사용자 출력||
|zip(unzip)|ZipCompress.sh|zip 압축 처리||

**스크립트 작성법 모음 표**
|기능|쉘이름|간략 설명|비고|
|---|---|---|---|
|파라미터취득,활용|ShellScriptParameter.sh|||
|함수 사용법|ShellScriptFunction.sh|||
|사용자 입력|ShellScriptUserWrite.sh|||
|쉘 스크립트 조건문(if)|ShellScriptIF.sh|||
|쉘 스크립트 조건문(case)|ShellScriptCase.sh|||
|쉘 스크립트 반복문(while)|ShellScriptLoopWhile.sh|||
|쉘 스크립트 반복문(for)|ShellScriptLoopFor.sh|||
|쉘 스크립트 명령 내용 변수에 담기|ShellScriptPrintCommand.sh|||