setlocal EnableDelayedExpansion
@ set "win_out=WINDOW_OUTPUT"
@ set brk=^



@ set "bar=##########################################################################################!brk!"

call %*

goto :eof


@ rem Press any button to begin extracting all archived .7z files and transferring the contents of those arachived files within the !src! directory.
:before_extract
    @ set "p=* Press any button to begin extracting all archived .7z files and transferring the contents!brk!"
    @ set "q=  of those archived files among directories within the %~1 directory.!brk!"

    echo "!brk!!brk!!bar!!p!!q!!bar!!brk!!brk!"
exit /b


@ rem All archived .7z files have been unzipped and their contents now reside in the !src! directory. 
:after_extract
    @ set "a=* All archived .7z files have been unzipped and their contents now reside in the %~1 directory.!brk!"

    echo "!brk!!brk!!bar!!a!!bar!!brk!!brk!"
exit /b

@ rem All d
:unnecessary_extract

exit /b