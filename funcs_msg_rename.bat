setlocal EnableDelayedExpansion
@ set "win_out=WINDOW_OUTPUT"
@ set brk=^



@ set "bar=##########################################################################################!brk!"

call %*

goto :eof



:before_rename


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




:after_rename



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

	@ set "targ=archived .7z"
	@ set "from=directory"
	if "!type!" equ "ARCHV" (
		@ set "targ=extracted"
		@ set "from=archived .7z file"
	)

	@ set "m2=* Next, we will use this same script to gradually remove exclamation marks (^!) from the names of !targ! files contained within each 'cleaned' !from! name from the !src! directory.!brk!"

	if "!type!" equ "FILE" (
		@ set "m2=You have finished cleaning all directories & files within the %~1 directory.!brk!"

	)

	echo "!brk!!brk!!bar!!brk!!cong!!brk!!m1!!brk!!m2!!bar!!brk!!brk!"
	echo !brk!!brk!!bar!!brk!!cong!!brk!!m1!!brk!!m2!!bar!!brk!!brk! > "!win_out!_!type!_6_RENAME_STOPPED.txt"

exit /b


:end_clean
	@ set "t=You have finished cleaning all directories & files within the %~1 directory.!brk!"
	echo "!brk!!brk!!bar!!t!!bar!!brk!!brk!"
exit /b