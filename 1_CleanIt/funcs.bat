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


















:start_rename_msg


	@ set type=
	@ set src=
	@ set k_all=
	@ set k_dirty=
	@ set k_clean=


	for /f "tokens=1 delims=|" %%i in ("%~1") do (
		@ set "type=%%i"
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



	

	@ set "targ=file"

	if "!type!" equ "DIR" (
		@ set "targ=directory"
	)


	@ set "m1=* Press a button to remove the exclamation marks ^! from !targ! names listed in the !src!, using the file names listed in the !k_clean! directory (the latter having'^^^!' pairs).!brk!"

	echo "!brk!!brk!!bar!!brk!!m1!!brk!!bar!!brk!!brk!"
	echo !brk!!brk!!bar!!brk!!m1!!brk!!bar!!brk!!brk! > "!win_out!_!type!_5_RENAME_STARTING.txt"
	
exit /b




:end_rename_dir_msg



	@ set type=
	@ set src=
	@ set k_all=
	@ set k_dirty=
	@ set k_clean=

	for /f "tokens=1 delims=|" %%i in ("%~1") do (
		@ set "type=%%i"
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




	@ set "targ=file"

	if "!type!" equ "DIR" (
		@ set "targ=directory"
	)
	
	
	@ set "cong=                      Congratulations^!^!^! :)                               !brk!"
	@ set "m1=* Exclamation marks ^! in !targ! names belonging to the !src! directory have been successfully removed.!brk!"
	@ set "m2=* Next, we will use this same script to gradually remove exclamation marks (^!) from the names of archived 7z files contained within each 'cleaned' directory name from the !src! directory.!brk!"

	echo "!brk!!brk!!bar!!brk!!cong!!brk!!m1!!brk!!m2!!bar!!brk!!brk!"
	echo !brk!!brk!!bar!!brk!!cong!!brk!!m1!!brk!!m2!!bar!!brk!!brk! > "!win_out!_!type!_6_RENAME_STOPPED.txt"

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