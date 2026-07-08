@ REM Create a list of directories where the title of each 
@ REM directory becomes the title a similarly named txt file,
@ REM and while creating that list, also check for the existence
@ REM of each found directory in the source directory.


@ REM If a directory does not exist, then that directory is
@ REM in the source directory, but is also notated with
@ REM with an exclamation point that must be removed
@ REM for future processing (like extracting, copying, and creating
@ REM required directories and files).


@ setlocal EnableDelayedExpansion

@ rem set "kless_all_dirs=KEYLESS_DIRS_ALL"
@ rem set "kless_dirty_dirs=KEYLESS_DIRS_DIRTY"
@ rem set "kless_clean_dirs=KEYLESS_DIRS_CLEAN"

@ set "src=APPLY_ON_ORIG"
@ set "src=..\..\ARCHV_DIRTY"

@ set "a_ren=ARCHV_RENAMED"
@ set "unzip=ARCHV_UNZIPPED"

@ set "is_dir=T"


@ rem set "param1=%is_dir%|%src%|%kless_all_dirs%|%kless_dirty_dirs%|%kless_clean_dirs%"

@ set "do_clean_errs=DO_CLEAN_DIR_ERRORS"

@ rem set "no_err=DIR_NO_ERRORS"
@ set "dir_named=DIR_RENAMED"
@ rem set "dlm=DIR_LIST_MADE"
@ set "msg_test=F"

@ rem set "param2=%no_err%|%do_clean_errs%|%dlm%"


@ rem This needs to change...need to evaluate for exclamation marks
@ rem ...among files within

rem @ call "funcs_msg_unzip.bat" :after_extract "%src%"
rem pause
rem goto :eof




@ rem This needs to change...need to evaluate for exclamation marks
@ rem ...among files within
rem if exist "%a_ren%" (

rem 	@ rem NEED FLAG TO AVOID RE-EXTRACING 7Z
rem 	if exist "%unzip%" (
		
rem 		@ call "funcs_msg_unzip.bat" :after_extract "%src%"
rem 		pause
rem 		goto :eof
rem 	)


rem 	@ call "funcs.bat" :loop_extract "%src%"
rem 	echo > "%unzip%"


	
rem 	@ call "funcs_msg_unzip.bat" :after_extract "%src%"
rem 	pause
rem 	@ goto :eof
rem )


@ set "mpd=DIR"

if exist "%dir_named%" (

	@ set "mpd=ARCHV"
)

if exist "%a_ren%" (

	if not exist "%unzip%" (
		@ call "funcs_msg_unzip.bat" :before_extract "%src%"
		@ pause
		@ call "funcs.bat" :loop_extract "%src%"
		@ echo > "%unzip%"
		@ pause
		@ call "funcs_msg_unzip.bat" :after_extract "%src%"
		@ goto :eof
	) else (

		@ call "funcs_msg_rename.bat" :end_clean "%src%"
		PAUSE
		goto :eof
	)



	@ set "mpd=FILE"
)
@ call "funcs_dir_to_archv_to_file.bat" :init "%mpd%" "%src%"
echo -- END OF main_clean.bat --
pause

goto :eof

