@ setlocal EnableDelayedExpansion

call %*

goto :eof


:archv_list

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
		for %%j in ("%%i\*") do (
		
			
			@ rem removing ..\..\ from path for src
			@ rem need to include ..\..\ for path of src in :rename_ function
			for /f "tokens=3 delims=\" %%k in ("%%j") do (
				@ set "src=%%k"
				
			)

			@ set "temp=!src!\%%~nxi"
			
			
			@ call "funcs.bat" :key_dir_write "%k_all%\!temp!" "%%~nj"

			if not exist "%%j" (
			
				@ call "funcs.bat" :key_dir_write "%k_dirty%\!temp!" "%%~nxj"
				@ call "funcs.bat" :key_dir_write "%k_clean%\!temp!" "%%~nxj"
				@ set /a qty+=1
			)
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

	@ rem remove ..\..\ from path for source
	for /f "tokens=3 delims=\" %%i in ("!src!") do (
		@ set "k_src=%%i"

	)

	@ set /a qty=0
	for /d %%i in ("!k_clean!\!k_src!\*") do (
	
		@ set "p=!src!\%%~nxi"
		
		for %%j in ("%%i\*") do (

			if not exist "!p!\%%~nxj" (
				@ set /a qty+=1
				@ call "funcs.bat" :key_dir_write "!do_clean_errs!" "!k_clean!_%%~nxj"
			)
		)
	)

	if !qty! gtr 0 (
		@ call "funcs_msg_exclm_srch.bat" :after_search_has "%~1" "!do_clean_errs!|!qty!"
	) else (
		@ call "funcs.bat" :delete_errs "!do_clean_errs!"
		echo > "!no_err!"

		@ call "funcs_msg_exclm_srch.bat" :after_search_none_post_fix "%~1" "!do_clean_errs!|!qty!"

	)
exit /b


:rename_
@ set is_dir=
	
	@ rem remove ..\..\ from path for src
	@ set k_src=
	for /f "tokens=3 delims=\" %%i in ("%~2") do (
		@ set "k_src=%%i"
		
	)
	for /d %%i in ("%~1\!k_src!\*") do (
		

		for %%j in ("%%i\*") do (
			
			@ set o=
			@ set p=
			@ set q=

			for /f "tokens=1 delims=!" %%k in ("%%~nxj") do (
				@ set "o=%%k"
			)

			for /f "tokens=2 delims=!" %%k in ("%%~nxj") do (
				@ set "p=%%k"
			)

			for /f "tokens=3 delims=!" %%k in ("%%~nxj") do (
				@ set "q=%%k"
			)

	
			@ set "revised=!o!!p!!q!"
			@ ren "%~2\%%~nxi\%%~nxj" "!revised!"

		)
	)
exit /b

