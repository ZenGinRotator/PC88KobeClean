
@ set "win_out=WINDOW_OUTPUT"
@ set brk=^



@ set "bar=##########################################################################################!brk!"

call %*

goto :eof





:before_search


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





:after_search_has
	

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



:after_search_none_post_fix



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




:after_search_none_no_fix

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