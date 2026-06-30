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
@ set "kless_dirty_dirs=KEYLESS_DIRS_DIRTY"
@ set "kless_clean_dirs=KEYLESS_DIRS_CLEAN"

@ set "src=APPLY_ON_ORIG"
@ set "src=..\..\ARCHV_DIRTY"

@ set "is_dir=T"


@ set "param1=%is_dir%|%src%|%kless_all_dirs%|%kless_dirty_dirs%|%kless_clean_dirs%"

@ set "do_clean_errs=DO_CLEAN_DIR_ERRORS"

@ set "no_err=DIR_NO_ERRORS"
@ set "dir_named=DIR_RENAMED"
@ set "dlm=DIR_LIST_MADE"
@ set "msg_test=F"
@ set "param2=%no_err%|%do_clean_errs%|%dlm%"


@ set "mpd=DIR"

if exist "%dir_named%" (
	@ set "mpd=ARCHV"
)
@ call "funcs_dir_then_archv.bat" :init "%mpd%" "%src%"
echo -- END OF main_clean.bat --
pause

goto :eof



