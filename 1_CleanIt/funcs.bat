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

:list_make_msg


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
	

	@ set "plural=files"
	@ set "singular=file"
	if "!type!" equ "DIR" (
		@ set "plural=directories"
		@ set "singular=directory"
	)
	
	
	@ set "press=* Press any key to scan the !src! directory and to create the following directories:!brk!"



	@ set "k_all_def=    - !k_all! - contains files where each file represents a !singular! found in the !src! directory.!brk!"


	@ set "k_dirty_def=    - !k_dirty! - contains files where each file represents a !singular! found in the !src! directory having at least 1 exclamation mark (^!), but the exclamation mark (^!) is unfortunately missing from the file name.!brk!"
	@ set "k_clean_def=    - !k_clean! - same as !k_dirty!, but we will use each file in this directory to remove all exclamation marks (^!) from each !singular! in the !src! directory.!brk!"
	

	

	@ set "m1=!press!!brk!!k_all_def!!brk!!k_dirty_def!!brk!!k_clean_def!!brk!"

	echo "!brk!!brk!!bar!!m1!!bar!!brk!!brk!" 

	echo !brk!!brk!!bar!!m1!!bar!!brk!!brk! > "%win_out%_!type!_1_SCAN_STARTING.txt"
exit /b

@ REM Use for directories & archives
:list_made_msg
	

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



	@ set error_dir=
	@ set dlm=
	
	for /f "tokens=1 delims=|" %%i in ("%~2") do (
		@ set "error_dir=%%i"
	)
	for /f "tokens=2 delims=|" %%i in ("%~2") do (
		@ set "dlm=%%i"
	)
	
	
	
	@ set "list_targ=file"
	@ set "singular=file"
	@ set "plural=files"
	if "!type!" equ "DIR" (
		@ set "list_targ=directory"
		@ set "singular=directory"
		@ set "plural=directories"
	)
	


	@ set "done_ml=*** Finished making the !k_all!, !k_dirty!, and !k_clean! directories. ***!brk!"

	@ set "TT=* Now edit each file name within the !k_clean! directory by:!brk!"

	@ set "look=  1. Looking for the similarly named !singular! within the !src! directory.!brk!"

	@ set "remb=  2. Remembering the location of an exclamation mark (^!) within the name of that !singular!,!brk!"

	@ set "and=  3. And placing a ^^^! pair at the same location within the file name belonging to the !k_clean! directory.!brk!"
	
	
	@ set "run=  4. Run this script again to determine if the name of the !singular! with the exclamation mark (^!) matches the name of the file with the ^^^! pair.!brk!"

 	@ set "note=  Note that we are comparing the !singular! names listed within the !src! directory, with the file name listed within the !k_clean! directory.!brk!"
	@ set "if=  If there are any wording or punctuation differences between the two names, then these differences must be resolved.!brk!"

	

	@ set "m1=!TT!!brk!!look!!brk!!remb!!brk!!and!!brk!!run!!brk!!note!!if!!brk!"

	


	@ set "if=* If errors continue to appear appear within the !error_dir! directory after re-running this script,!brk!"
	@ set "then=    then review your changes to each file name within the !k_clean! directory for other errors, and re-run this script!brk!"
	@ set "until=    until no more errors appear in the !error_dir! directory.!brk!"
	@ set "m3=!if!!then!!until!"


	@ set "to=* If you wish to recreate the !k_all!, !k_dirty!, and/or !k_clean! directories,!brk!"
	@ set "del=    delete the unwanted directory, delete the !dlm! file, and make a new version of the %src% directory (if name changes have been applied to %src%), before running this script again.!brk!"

	@ set "m4=!to!!del!"

	echo "!brk!!brk!!bar!!done_ml!!brk!!m1!!brk!!m3!!brk!!m4!!brk!!bar!!brk!!brk!"

	echo !brk!!brk!!bar!!done_ml!!brk!!m1!!brk!!m3!!brk!!m4!!brk!!bar!!brk!!brk! > "!win_out!_!type!_2_SCAN_STOPPED.txt"
	

exit /b



:delete_errs

	if exist "%~1" (
		for %%i in ("%~1\*") do (
			@ del "%%i"
		)
		@ rd "%~1"
	)

exit /b






:start_car_err_msg


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



	
	
	@ set do_clean_ers=

	for /f "tokens=1 delims=|" %%i in ("%~2") do (
		@ set "do_clean_ers=%%i"
	)

	@ set "st_car_f=file"
	
	if "!type!" equ "DIR" (
		@ set "st_car_f=directory"
		
	)
	@ set "prs=* Press any key to begin searching for mismatches between each !st_car_f! name within the !src! directory (with exclamation mark ^!) with its similary named file in the !k_clean! directory (with ^^^! pairs added).!brk!"

	@ set "if_close=* If you have not yet added the required ^^^! pairs to all file names within the !k_clean! directory, close this command window and perform those changes before re-running this script.!brk!"


	@ set "any=* Any remaining !st_car_f!-name-to-file-name mismatches will appear inside the !do_clean_ers! directory (review this for errors).!brk!"


	@ set "we=* We cannot use this script to for future processing until all required ^^^! pairs have been!brk!"

	@ set "corr=    correctly placed in the aforementioned file name in the !k_clean! directory.!brk!"

	@ set "m1=!prs!"
	@ set "m2=!if_close!"
	@ set "m3=!any!"
	@ set "m4=!we!!corr!"

	echo "!brk!!brk!!bar!!brk!!m1!!brk!!m2!!brk!!m3!!brk!!m4!!bar!!brk!!brk!"

	echo !brk!!brk!!bar!!m1!!brk!!m2!!brk!!m3!!brk!!m4!!bar!!brk!!brk! > "!win_out!_!type!_3_CAR_ERR_STARTING.txt"

exit /b







:has_car_errs_msg
	

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





	@ set do_clean_ers=
	@ set /a err_qty=0
	
	
	for /f "tokens=1 delims=|" %%i in ("%~2") do (
		@ set "do_clean_ers=%%i"
	)
	@ set /a err_qty=0
	for /f "tokens=2 delims=|" %%i in ("%~2") do (
		@ set /a "err_qty=%%i"
	)
	
	

	@ set "has_err_obj=file"
	if "!type!" equ "DIR" (
		@ set "has_err_obj=directory"
	)

	@ set plural_s=

	if !err_qty! gtr 1 (
		@ set "plural_s=s"
	)

	@ set "warn=                      WARNING^!^!^!^! We have !err_qty! error!plural_s!^!!brk!"
	@ set "m1=* Check the !do_clean_ers! directory for mismatches between the !has_err_obj! name in the !src! directory and the file name in the !k_clean! directory.!brk!"

	@ set "m1m=* Mismatches can be:!brk!"
	@ set "m1one= 1. A missing, extra, or mistyped letter/space/character when attempting to add ^^^! pairs to file names for the !k_clean! directory.!brk!"
	@ set "m1two= 2. An incorrect placement of ^^^! pairs in file names for the !k_clean! directory, when accounting for exclamation marks (^!) in !has_err_obj! names belonging to the !src! directory.!brk!"

	@ set "m2=* Each file within the !do_clean_ers! directory refers to that same file within the !k_clean! directory, so the !do_clean_ers! directory is a good starting point to fix mismatching errors.!brk!"

	@ set "to_fix=* To fix these errors, make sure the !has_err_obj!- and file-names for these respective directories have the same wording and similar placement of exclamation marks (^! vs ^^^!).!brk!"


	
	echo "!brk!!brk!!bar!!brk!!warn!!brk!!m1!!brk!!m1m!!m1one!!brk!!m1two!!brk!!to_fix!!brk!!m2!!brk!!bar!!brk!!brk!"

	echo !brk!!brk!!bar!!brk!!warn!!brk!!m1!!brk!!m1m!!m1one!!m1two!!brk!!to_fix!!brk!!m2!!brk!!bar!!brk!!brk! > "!win_out!_!type!_4_CAR_ERR_STOPPED_HAS_ERRORS.txt"

exit /b










:no_car_errs_msg



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





	@ set do_clean_dirs=
	@ set /a qty=0
	
	for /f "tokens=1 delims=|" %%i in ("%~2") do (
		@ set "do_clean_dirs=%%i"
	)

	for /f "tokens=2 delims=|" %%i in ("%~2") do (
		@ set /a qty=%%i
	)


	@ set "no_car_ob=file"
	
	if "!type!" equ "DIR" (
		@ set "no_car_ob=directory"
	)
	

	@ set "good=                 GOOD NEWS^! We have !qty! errors.!brk!"
	@ set "m1=* The !do_clean_dirs! directory was not created because no errors were found within the !k_clean! directory.!brk!"


	@ set "m2=* Now press any key to remove exclamation marks ^! from all !no_car_ob! names within the !src! directory.!brk!"


	echo "!brk!!brk!!bar!!brk!!good!!brk!!m1!!brk!!m2!!bar!!brk!!brk!"
	echo !brk!!brk!!bar!!brk!!good!!brk!!m1!!brk!!m2!!bar!!brk!!brk! > "!win_out!_!type!_4_CAR_ERR_STOPPED_NO_ERRORS.txt"

exit /b



:no_err_repo

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





	@ set do_clean_dirs=
	@ set /a qty=0
	
	for /f "tokens=1 delims=|" %%i in ("%~2") do (
		@ set "do_clean_dirs=%%i"
	)

	for /f "tokens=2 delims=|" %%i in ("%~2") do (
		@ set /a qty=%%i
	)


	@ set "no_car_ob=file"
	@ set "tag=ARCHV"

	if "!is_dir!" equ "T" (
		@ set "no_car_ob=directory"
		@ set "tag=DIR"
	)
	

	@ set "good=                 GOOD NEWS^! We have !qty! errors.!brk!"
	@ set "m1=* The !do_clean_dirs! directory and the !k_clean! directory were not created because no exclamation marks (^!) were found within the !src! directory.!brk!"

	@ set "m2=* There is no need to rename each !no_car_ob! within the "!src!" directory."

	@ rem Use this script again on to repeat cleaning, extract, & renaming on archives????????????

	echo "!brk!!brk!!bar!!good!!brk!!m1!!brk!!m2!!brk!!bar!!brk!!brk!"
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