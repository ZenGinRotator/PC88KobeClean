@ setlocal EnableDelayedExpansion

call %*

goto :eof


@ rem What if every directory in source does not have an exclamation point?
@ rem Need a counter and if ctr equ 0, then make the flag-file referred to in caretted errors
:dir_list


	@ set is_dir=
	@ set src=
	@ set k_all=
	@ set k_dirty=
	@ set k_clean=


	for /f "tokens=1 delims=|" %%i in ("%~1") do (
		@ set "is_dir=%%i"
	)
	for /f "tokens=2 delims=|" %%i in ("%~1") do (
		@ set "src=%%i"
	)
	for /f "tokens=3 delims=|" %%i in ("%~1") do (
		@ set "k_all=%%i"
	)
	for /f "tokens=4 delims=|" %%i in ("%~1") do (
		@ set "k_dirty=%%i"
	)
	for /f "tokens=5 delims=|" %%i in ("%~1") do (
		@ set "k_clean=%%i"
	)


	@ set no_err=
	@ set do_clean_errs=
	@ set dlm=
	for /f "tokens=1 delims=|" %%i in ("%~2") do (
		@ set "no_err=%%i"
	)
	for /f "tokens=2 delims=|" %%i in ("%~2") do (
		@ set "do_clean_errs=%%i"
	)
	for /f "tokens=3 delims=|" %%i in ("%~2") do (
		@ set "dlm=%%i"
	)

	

	@ set /a qty=0
	for /d %%i in ("%src%\*") do (
		@ set "dir=%%~nxi"
	
		@ call "funcs.bat" :key_dir_write "!k_all!" "!dir!"
	
		if not exist "%%i" (
			@ call "funcs.bat" :key_dir_write "!k_dirty!" "!dir!"
			@ call "funcs.bat" :key_dir_write "!k_clean!" "!dir!"
			@ set /a qty+=1
		)
	)

	@ set "param2=!do_clean_errs!|!dlm!"

	if !qty! equ 0 (
		echo > "!no_err!"
		echo > "%~3"
		@ call "funcs_msg_exclm_srch.bat" :after_search_none_no_fix "%~1" "!param2!"

	) else (
		@ call "funcs_msg_list.bat" :after_list "%~1" "!param2!"
	)

exit /b




:careted_errors

	@ set is_dir=
	@ set src=
	@ set k_all=
	@ set k_dirty=
	@ set k_clean=


	for /f "tokens=1 delims=|" %%i in ("%~1") do (
		@ set "is_dir=%%i"
	)
	for /f "tokens=2 delims=|" %%i in ("%~1") do (
		@ set "src=%%i"
	)
	for /f "tokens=3 delims=|" %%i in ("%~1") do (
		@ set "k_all=%%i"
	)
	for /f "tokens=4 delims=|" %%i in ("%~1") do (
		@ set "k_dirty=%%i"
	)
	for /f "tokens=5 delims=|" %%i in ("%~1") do (
		@ set "k_clean=%%i"
	)


	@ set no_err=
	@ set do_clean_errs=
	@ set dlm=
	for /f "tokens=1 delims=|" %%i in ("%~2") do (
		@ set "no_err=%%i"
	)
	for /f "tokens=2 delims=|" %%i in ("%~2") do (
		@ set "do_clean_errs=%%i"
	)
	for /f "tokens=3 delims=|" %%i in ("%~2") do (
		@ set "dlm=%%i"
	)


	@ REM Counter for instances where manually including ^! pairs in
	@ REM "KEY_EXCLAMATED_DIRS_CARETED\<file> occurred 
	@ REM If counter > 0, then check your change to <file (title)>
	@ set /a titl_chng_err_qty=0
	

	for %%i in ("!k_clean!\*") do (


		if not exist "!src!\%%~nxi" (
			@ set /a titl_chng_err_qty+=1
			@ call "funcs.bat" :key_dir_write "!do_clean_errs!" "%k_clean%_%%~nxi"			
		)
	)

	if !titl_chng_err_qty! gtr 0 (

		@ call "funcs_msg_exclm_srch.bat" :after_search_has "%~1" "!do_clean_errs!|!titl_chng_err_qty!"

	) else (
		@ call "funcs.bat" :delete_errs "!do_clean_errs!"
		echo > "!no_err!"

		@ call "funcs_msg_exclm_srch.bat" :after_search_none_post_fix "%~1" "!do_clean_errs!|!titl_chng_err_qty!"
	)


exit /b



:rename_

for %%i in ("%~1\*") do (
	
	@ set o=
	@ set p=
	@ set q=

	for /f "tokens=1 delims=!" %%j in ("%%~nxi") do (
		@ set "o=%%j"
	)

	for /f "tokens=2 delims=!" %%j in ("%%~nxi") do (
		@ set "p=%%j"
	)

	for /f "tokens=3 delims=!" %%j in ("%%~nxi") do (
		@ set "q=%%j"
	)

	@ set "cleaned=%%~nxi"
	
	@ set "revised=!o!!p!!q!"
	

	@ ren "%~2\%%~nxi" "!revised!"
)
exit /b