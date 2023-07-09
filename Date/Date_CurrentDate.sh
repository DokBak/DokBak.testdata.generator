#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Date]_[CurrentDate]
#------------------------------------------------------------
function Date_CurrentDate(){
    echo 
    echo "## Date Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : Date"
    echo " HowToUse : Date [Option] [Argument1] [Argument2] ..."
    echo "            [Argument1] : tarFile_Path "
    echo "            [Option : -q] : No Message) "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Format Output According to Date Locale )
    echo
    echo " locale Change : KR "
    echo ' export LC_ALL="ko_KR.UTF-8" '
    export LC_ALL="ko_KR.UTF-8"
    echo
    echo " locale " 
    locale 
    echo
    echo " date "
    date
    echo
    echo " Korea Locale Output Format "
    echo ' date "+%Y년 %h월 %d일 %A %H시 %M분 %S초 %Z" '
    date "+%Y년%h월 %d일 %A %H시 %M분 %S초 %Z"
    echo
    echo " locale Change : JP "
    echo ' export LC_ALL="ja_JP.UTF-8" '
    export LC_ALL="ja_JP.UTF-8"
    echo
    echo " locale " 
    locale 
    echo
    echo ' date ' 
    date
    echo
    echo " JP Locale Output Format "
    echo ' date "+%Y年%h月%d日 %a曜日 %H時%M分%S秒 %Z" '
    date "+%Y年%h月%d日 %a曜日 %H時%M分%S秒 %Z"
    echo
    echo " locale Change : US "
    echo ' export LC_ALL="en_US.UTF-8" '
    export LC_ALL="en_US.UTF-8"
    echo
    echo " locale " 
    locale 
    echo
    echo ' date ' 
    date
    echo
    echo " US Locale Output Format "
    echo ' date "+%a %b %d %H:%M:%S %Z %Y" '
    date "+%a %b %d %H:%M:%S %Z %Y"
    echo
    # Example 02 (Not Option : %c [week months days time(hours:minutes:seconds) years] )
    echo 
    echo " %c Type Print "
    echo " [week months days time(hours:minutes:seconds) years] "
    echo " [ %c : (KR) 수  6/21 02:26:06 2023    ] "
    echo " [ %c : (JP) 水  6/21 02:26:06 2023    ] "
    echo " [ %c : (US) Wed Jun 21 02:26:06 2023 ] "
    echo
    echo " locale Change : KR "
    echo ' export LC_ALL="ko_KR.UTF-8" '
    export LC_ALL="ko_KR.UTF-8"
    echo ' date "+%c" '
    date "+%c"
    echo ' date "+%a %b/%e %H:%M:%S %Y" '
    date "+%a %b/%e %H:%M:%S %Y"
    echo
    echo
    echo " locale Change : JP "
    echo ' export LC_ALL="ja_JP.UTF-8" '
    export LC_ALL="ja_JP.UTF-8"
    echo ' date "+%c" '
    date "+%c"
    echo ' date "+%a %b/%e %H:%M:%S %Y" '
    date "+%a %b/%e %H:%M:%S %Y"
    echo
    echo
    echo " locale Change : US "
    echo ' export LC_ALL="en_US.UTF-8" '
    export LC_ALL="en_US.UTF-8"
    echo ' date "+%c" '
    date "+%c"
    echo ' date "+%a %b %e %H:%M:%S %Y" '
    date "+%a %b %e %H:%M:%S %Y"
    echo
    # Example 03 (Option : %F [YYYY-MM-DD] , %D [MM/DD/YY] , %x  [MM/DD/YYYY] )
    echo 
    echo " %F %D %x Type Print : LC_ALL Common"
    echo " [ %F : YYYY-MM-DD ] "
    echo " [ %D : MM/DD/YY   ] "
    echo " [ %x : MM/DD/YYYY ] "
    echo
    echo ' date "+%F" '
    date "+%F"
    echo ' date "+%Y-%m-%d" '
    date "+%Y-%m-%d"
    echo
    echo ' date "+%D" '
    date "+%D"
    echo ' date "+%m/%d/%y" '
    date "+%m/%d/%y"
    echo
    echo ' date "+%x" '
    date "+%x"
    echo ' date "+%m/%d/%Y" '
    date "+%m/%d/%Y"
    echo
    echo
    # Example 04 (Option : %Y [YYYY] , %y ..[YY] , %C  [YY].. )
    echo 
    echo " %Y %y %C Type Print : LC_ALL Common"
    echo " [ years ] "
    echo " [ %Y : 2023 ] "
    echo " [ %y :   23 ] "
    echo " [ %C : 20   ] "
    echo
    echo ' date "+%Y" '
    date "+%Y"
    echo ' date "+%y" '
    date "+%y"
    echo ' date "+%C" '
    date "+%C"
    echo
    # Example 05 (Option : %m [2 words(Number)] , %B [locale Month] , %b [US locale 3 Words(Word)] , %h [Same %b] )
    echo 
    echo " [ months ] "
    echo " [ %m : (KR) 06  (JP) 06  (US) 06    ] "
    echo " [ %B : (KR) 6월  (JP) 6月 (US) June  ] "
    echo " [ %b : (KR) 6   (JP) 6   (US) Jun   ] "
    echo " [ %h : (KR) 6   (JP) 6   (US) Jun   ] "
    echo
    echo " locale Change : KR "
    echo ' export LC_ALL="ko_KR.UTF-8" '
    export LC_ALL="ko_KR.UTF-8"
    echo ' date "+%m" '
    date "+%m"
    echo ' date "+%B" '
    date "+%B"
    echo ' date "+%b" '
    date "+%b"
    echo ' date "+%h" '
    date "+%h"
    echo
    echo " locale Change : JP "
    echo ' export LC_ALL="ja_JP.UTF-8" '
    export LC_ALL="ja_JP.UTF-8"
    echo ' date "+%m" '
    date "+%m"
    echo ' date "+%B" '
    date "+%B"
    echo ' date "+%b" '
    date "+%b"
    echo ' date "+%h" '
    date "+%h"
    echo
    echo " locale Change : US "
    echo ' export LC_ALL="en_US.UTF-8" '
    export LC_ALL="en_US.UTF-8"
    echo ' date "+%m" '
    date "+%m"
    echo ' date "+%B" '
    date "+%B"
    echo ' date "+%b" '
    date "+%b"
    echo ' date "+%h" '
    date "+%h"
    echo
    # Example 06 (Option : %d [2 words(Number)] , %e [1 word(Number)] )
    echo
    echo " %d %e Type Print : LC_ALL Common"
    echo " [ days ] "
    echo " [ %d : 09         2Word ] "
    echo " [ %e :  9 (= %_d) 1Word ] "
    echo
    echo ' date "+%d" '
    date "+%d"
    echo ' date "+%e" '
    date "+%e"
    echo ' date "+%_d" '
    date "+%_d" 
    echo
    # Example 07 (Option : %A [Full Week] , %a [1 Word Week] , %u [1(Mon)~7(Sun)] ,  %w [0(Sun)~6(Mon)] )
    echo 
    echo " [ weeks ] "
    echo " [ %A : (KR) 수요일 (JP) 水曜日 (US) Wednesday ] "
    echo " [ %a : (KR) 수    (JP) 水    (US) Wed       ] "
    echo " [ %u : (KR) 3    (JP) 3     (US) 3         ] : 1(Mon)~7(Sun) "
    echo " [ %w : (KR) 3    (JP) 3     (US) 3         ] : 0(Sun)~6(Mon) "
    echo
    echo " locale Change : KR "
    echo ' export LC_ALL="ko_KR.UTF-8" '
    export LC_ALL="ko_KR.UTF-8"
    echo ' date "+%A" '
    date "+%A"
    echo ' date "+%a" '
    date "+%a"
    echo ' date "+%u" '
    date "+%u"
    echo ' date "+%w" '
    date "+%w"
    echo
    echo " locale Change : JP "
    echo ' export LC_ALL="ja_JP.UTF-8" '
    export LC_ALL="ja_JP.UTF-8"
    echo ' date "+%A" '
    date "+%A"
    echo ' date "+%a" '
    date "+%a"
    echo ' date "+%u" '
    date "+%u"
    echo ' date "+%w" '
    date "+%w"
    echo
    echo " locale Change : US "
    echo ' export LC_ALL="en_US.UTF-8" '
    export LC_ALL="en_US.UTF-8"
    echo ' date "+%A" '
    date "+%A"
    echo ' date "+%a" '
    date "+%a"
    echo ' date "+%u" '
    date "+%u"
    echo ' date "+%w" '
    date "+%w"
    echo
    # Example 08 (Option : %p [AM/PM] )
    echo
    echo " %p Type Print : LC_ALL Common"
    echo " [ %p : AM/PM ] "
    echo ' date "+%p" '
    date "+%p"
    echo
    # Example 09 (Option : %H [2 words 24hours] , %I [2 words 12hours] , %k [1 word 24hours] , %l [1 word 12hours] )
    echo 
    echo " %H %I %k %l Type Print : LC_ALL Common"
    echo " [ hours ] "
    echo " [ %H : 02 (2 words 24hours)] "
    echo " [ %I : 02 (2 words 12hours)] "
    echo " [ %k :  2 (1 word  24hours)] "
    echo " [ %l :  2 (1 word  12hours)] "
    echo
    echo ' date "+%H" '
    date "+%H"
    echo ' date "+%I" '
    date "+%I"
    echo ' date "+%k" '
    date "+%k"
    echo ' date "+%l" '
    date "+%l"
    echo
    # Example 10 (Option : %M [2 words minutes] )
    echo 
    echo " %M Type Print : LC_ALL Common"
    echo " [ Minutes ] "
    echo " [ %M : 02 (2 words)] "
    echo " [ %_M : 2 (1 word)] "
    echo
    echo ' date "+%M" '
    date "+%M"
    echo ' date "+%_M" '
    date "+%_M"
    echo
    # Example 11 (Option : %S [2 words seconds] )
    echo 
    echo " %S Type Print : LC_ALL Common"
    echo " [ Seconds ] "
    echo " [ %S : 02 (2 words)] "
    echo " [ %_S : 2 (1 word)] "
    echo
    echo ' date "+%S" '
    date "+%S"
    echo ' date "+%_S" '
    date "+%_S"
    echo
    # Example 12 (Option : %z [Timezone time] , %Z [Timezone area] )
    echo 
    echo " %z %Z Type Print : LC_ALL Common"
    echo " [ Timezone ] "
    echo " [ %z : +0900 (timezone time)] "
    echo " [ %Z :   JST (timezone area)] "
    echo
    echo ' date "+%z" '
    date "+%z"
    echo ' date "+%Z" '
    date "+%Z"
    echo
    # Example 13 (Option : %j [the date past this year] , %s , %U , %V , %W )
    echo 
    echo " %j %s %U %V %W Type Print : LC_ALL Common"
    echo " [ Time Calculator ] "
    echo " [ %j : 172        (the date past this year)    ] "
    echo " [ %s : 1687284763 (the seconds past this year) ] "
    echo " [ %U : 25         (week past this year(sunday start(00~53))) ] "
    echo " [ %V : 25         (week past this year(monday start(10~53))) ] "
    echo " [ %W : 25         (week past this year(monday start(00~53))) ] "
    echo
    echo ' date "+%j" '
    date "+%j"
    echo ' date "+%s" '
    date "+%s"
    echo ' date "+%U" '
    date "+%U"
    echo ' date "+%V" '
    date "+%V"
    echo ' date "+%W" '
    date "+%W"
    echo
    # Example 14 (Option : %t [tap] , %n [new line] , %% [% print] )
    echo
    echo " %j %s %U %V %W Type Print : LC_ALL Common"
    echo " [ Time Calculator ] "
    echo " [ %t (tap)      ] "
    echo " [ %n (new Line) ] "
    echo " [ %% (% print)  ] "
    echo
    echo ' date "+%t" '
    date "+%t"
    echo ' date "+%n" '
    date "+%n"
    echo ' date "+%%" '
    date "+%%"
    echo
    # Example 15 (Option -u : Output in standard time [UTC Time])
    echo
    echo " date -u "
    date -u
    echo
    # Example 16 (Option -R : Output in standard time [RFC2822 Format + UTC Time])
    echo
    echo " date -R "
    date -R
    echo ' date "+%a, %d %b %Y %H:%M:%S %z" '
    date "+%a, %d %b %Y %H:%M:%S %z"
    echo
    # Example End
    echo
    echo "## Date End ##"
    echo 
}

Date_CurrentDate