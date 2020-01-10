@echo off
title Admin Tools
color 0a
echo You're in the Matrix Neo
timeout /t 2 > nul
echo You take the blue pill and the story ends. You wake in your bed and you believe whatever you want to believe. You take the red pill and you stay in Wonderland and I show you how deep the rabbit-hole goes.
timeout /t 2 > nul
set /p answer= ([1] Red or [2] Blue?)
if /i "%answer%" == "1" (
color 0C
goto :Tools
) 
if /i "%answer%" NEQ "1" (
color 0B
goto :End
)
echo

:Tools
cd C:\DIRECTORY\SCRIPTS
setlocal enabledelayedexpansion
set index=1
FOR %%f in (*.*) DO (
	set file!index!=%%f
	echo !index! - %%f
	SET /A index=!index!+1
)

set /p answer=Enter the number of the script you would like to run: 
set count=1
FOR %%i in (*.*) DO (
	set !count!=%%i
	IF "!count!" equ "%answer%" Powershell.exe -noprofile -ExecutionPolicy Bypass -File C:\DIRECTORY\SCRIPTS\%%i
	set /a count=!count!+1		
)
pause
echo Would you like to execute another script? :
set /p answer2= ([y] or [n]?)
if /i "%answer2%" == "y" (
goto :Tools
) 
if /i "%answer2%" NEQ "y" (
color 0B
goto :End
)
cmd /k echo "Script Complete"

:End
cmd /k echo "Batch Complete"
timeout /t 3 > nul
