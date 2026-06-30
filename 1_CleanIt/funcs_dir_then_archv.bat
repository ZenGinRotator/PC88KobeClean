setlocal EnableDelayedExpansion

call %*

goto :eof


@ rem Required params:
@ rem DIR/ARCHV: X/TYPE
@ rem src

:init

@ set "type=%~1"
@ set "src=%~2"


@ set "k_all=KEYLESS_!type!S_ALL"
@ set "k_dirty=KEYLESS_!type!S_DIRTY"
@ set "k_clean=KEYLESS_!type!S_CLEAN"






@ set "param1=!type!|!src!|!k_all!|!k_dirty!|!k_clean!"


@ set "do_clean_errs=DO_CLEAN_!type!_ERRORS"

@ set "no_err=!type!_NO_ERRORS"
@ set "rnamed=!type!_RENAMED"
@ set "dlm=!type!_LIST_MADE"
@ set "msg_test=F"

@ set "param2=!no_err!|!do_clean_errs!|!dlm!"




if not exist "!dlm!" (

	@ call "funcs_msg_list.bat" :before_list "!param1!"
	pause

	if "!msg_test!" equ "F" (
		if "!type!" equ "DIR" (
			@ call "funcs_dir.bat" :dir_list "!param1!" "!param2!" "!rnamed!"
		) else (
			@ call "funcs_archv.bat" :archv_list "!param1!" "!param2!" "!rnamed!"	
		)
	)
	echo > "!dlm!"
	
	pause
	goto :eof
)

if exist "!rnamed!" (

	@ call "funcs.bat" :end_rename_dir_msg "!param1!"
	pause
	goto :eof
)

if not exist "!no_err!" (

	@ rem NEED A MESSAGE HERE?
	@ rem delete contents of do clean errors directory & delete this directory
	@ call "funcs.bat" :delete_errs "!do_clean_errs!"
	

	@ call "funcs.bat" :start_car_err_msg "!param1!" "!do_clean_errs!"
	pause
	
	if "!msg_test!" equ "F" (
		if "!type!" equ "DIR" (
			@ call "funcs_dir.bat" :careted_errors "!param1!" "!param2!"
		) else (
			@ call "funcs_archv.bat" :careted_errors "!param1!" "!param2!"
		)	
	) else (
		echo > "!no_err!"
	)
	@ rem message is displayed - embeded in function call
	
	pause

)
if exist "!no_err!" (
	
	@ call "funcs.bat" :start_rename_msg "!param1!"
	pause	


	if "!msg_test!" equ "F" (
		if "!type!" equ "DIR" (
			@ call "funcs_dir.bat" :rename_ "!k_clean!" "!src!"
		) else (
			@ call "funcs_archv.bat" :rename_ "!k_clean!" "!src!"
		)
	)
	echo > "!rnamed!"

	@ call "funcs.bat" :end_rename_dir_msg "!param1!"
	pause
	

)
exit /b
