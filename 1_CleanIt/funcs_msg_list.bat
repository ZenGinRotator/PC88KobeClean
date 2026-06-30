setlocal EnableDelayedExpansion
@ set "win_out=WINDOW_OUTPUT"
@ set brk=^



@ set "bar=##########################################################################################!brk!"

call %*

goto :eof




:before_list


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
:after_list
	

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