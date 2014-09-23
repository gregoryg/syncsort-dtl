@echo off 

set APACHE_WEBLOGS_DIR=D:\data\apache2-CLEANSED
set WORKSPACE_DIR=C:\cygwin\tmp
dmexpress /run M10-read-weblogs.dtl
if errorlevel 1 goto failed
    echo Hey it was a success
    exit /b
:failed
    echo Oh bummer it failed
    pause
