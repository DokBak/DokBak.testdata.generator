#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [Sed]_[TextEditerSed]
#------------------------------------------------------------
function sed_TextEditerSed(){
    echo
    echo "## sed Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : sed"
    echo " HowToUse : sed [Option] [Argument1] [Argument2] "
    echo "            [Argument1] : Pattern "
    echo "            [Argument2] : tarFile_Path "
    echo "            [Option : -n] : Only Correct Pattern Print "
    echo "            [Option : -e] : Script Set "
    echo "            [Option : -f] : Script File Read "
    echo
    # Basic Information End
    # Preparation Start
    echo
    # Preparation : mkdir
    mkdir -p `pwd`/sed_CMD_TestFolder/
    # Preparation : Create File
    echo " echo 'TestFile1' > `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'TestFile1' > `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'apple,banana,cream,dust,Test,txt,TestFile1,gui' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'Test,bash,zsh,sh' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'Test,bash,zsh,sh' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'Test,java,Javascript,C,C#,C++,python,ruby' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'TestFile2' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'TestFile2' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'iphone,ipad,imac,Test,ipod,ipodtouch' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'iphone,ipad,imac,Test,ipod,ipodtouch' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'iphone,ipod,ipodtouch,Test,ipad,imac' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'iphone,ipod,ipodtouch,Test,ipad,imac' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'galaxyS7,Note7,ZFilp,S7,Test' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'galaxyS7,Note7,ZFilp,S7,Test' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'TestFile3' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'TestFile3' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'Korea,Test,Japan,China' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'Korea,Test,Japan,China' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'Seoul,Tokyo,hongkong' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'Seoul,Tokyo,hongkong' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo '0102,12310,asdas' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo '0102,12310,asdas' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'TestFile4' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'TestFile4' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'ps1,ps2,ps3,ps4' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'ps1,ps2,ps3,ps4' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'psa,psa,psa,psa' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo 'psa,psa,psa,psa' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo " echo 'Nintendo,NDSL,DSL,wii' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "    
    echo 'Nintendo,NDSL,DSL,wii' >> `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    echo " echo 's/TestFile/fileRead/g' > `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile2.txt "
    echo 's/TestFile/fileRead/g' > `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile2.txt
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : ['s(tart),e(nd)'d] )
    echo
    echo " Select Line Delete : ['s(tart),e(nd)'d] "
    echo " sed '2,5d' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo " sed '2,5'd `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    sed '2,5d' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    # Example 02 (Not Option : ['s(tart),e(nd)'p] )
    echo
    echo " Select Line Print : ['s(tart),e(nd)'d] "
    echo " sed '2,5p' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    echo " sed '2,5'p `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    sed '2,5'p `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    # Example 03 (Not Option : ['s/pattern1/pattern2/] )
    echo
    echo " Select Pattern One Time Change : ['s/pattern1/pattern2/'] "
    echo " sed 's/TestFile/SedSample/' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    sed 's/TestFile/SedSample/' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    # Example 04 (Not Option : ['s(tart),e(nd)s/pattern1/pattern2/] )
    echo
    echo " Select Pattern Change One Time (on 2~5Line): ['s(tart),e(nd)s/pattern1/pattern2/'] "
    echo " sed '2,5s/TestFile/SedSample/' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    sed '2,5s/TestFile/SedSample/' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    # Example 05 (Not Option : ['s/pattern1/pattern2/] )
    echo
    echo " Select Pattern All Change : ['s/pattern1/pattern2/g'] "
    echo " sed 's/TestFile/SedSample/g' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    sed 's/TestFile/SedSample/g' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    # Example 06 (Not Option -n : Only Correct Pattern Print )
    echo
    echo " Only Correct Pattern Print : [ -n 's(tart),e(nd)p'] "
    echo " sed -n '2,5p' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    sed -n '2,5p' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    # Example 07 (Not Option -n : Only Correct Pattern Print )
    echo
    echo " Only Correct Pattern Print : [ -n 's/pattern1/pattern2/p'] "
    echo " sed -n 's/TestFile/SedSample/p' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    sed -n 's/TestFile/SedSample/p' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    # Example 08 (Not Option -e : Script Set)
    echo
    echo " Script Set : [ -e 's/pattern1/pattern2/g'] "
    echo " sed -e 's/TestFile/SedSample/g' -e 's/SedSample/tt/g' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    sed -e 's/TestFile/SedSample/g' -e 's/SedSample/tt/g' `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    # Example 09 (Not Option -f : Script File Read)
    echo
    echo " Script Set : [ -f 's/pattern1/pattern2/g'] "
    echo " sed -f `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile2.txt `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt "
    sed -f `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile2.txt `pwd`/sed_CMD_TestFolder/sed_CMD_TestFile1.txt
    echo
    echo "## sed End ##"
    echo
}

sed_TextEditerSed