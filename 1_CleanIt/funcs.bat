setlocal EnableDelayedExpansion
@ set "win_out=WINDOW_OUTPUT"
@ set brk=^



@ set "bar=##########################################################################################!brk!"

call %*

goto :eof


:key_dir_write
	call :no_dir_make "%~1"
	call :no_file_make "%~1" "%~2"
exit /b



:no_dir_make
	if not exist "%~1" (
		@ md "%~1"
	)
exit /b


:no_file_make
	if not exist "%~1\%~2" (
		echo > "%~1\%~2"
	)
exit /b






:delete_errs

	if exist "%~1" (
		for %%i in ("%~1\*") do (
			@ del "%%i"
		)
		@ rd "%~1"
	)

exit /b

















:general_err_qty

	@ set /a dqty=0
	@ set /a aqty=0
	for /d %%i in ("%~1\*") do (
		
		if not exist "%%i" (
			@ set /a dqty+=1
		)
		for /d %%j in ("%%i\*") do (
			if not exist "%%j" (
				@ set /a aqty+=1
			)

		)		

	)

	echo "!dqty! DIR NAMES WITH ^! and !aqty! FILE NAMES WITH ^!"
pause
exit /b


:overwrite_extract
	@ rem path to extract: "%~1"
	@ rem output extracted to: "%~2"

	@ "C:\Program Files\7-Zip\7z.exe" e -aou "%~1" -o"%~2" -y
	@ del "%~1"

exit /b

:keep_extract
	@ "C:\Program Files\7-Zip\7z.exe" e "%~1" -o"%~2" -y
exit /b