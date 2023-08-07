@echo off & setlocal
:: please insert your password in md5 format after "=" sign:
:: the  default password is 1234
set password=81dc9bdb52d04dc20036dbd8313ed055

:start
:: start messages
echo Wellcome to file locker!
echo\this project made by kuroshg3
echo\ this plugin lock and unlocks a folder called "Locker"
if NOT EXIST Locker md Locker
:converter
set /p userpass=input your password (or exit):
if %userpass% equ exit (goto exit)
set "file=%temp%\%~n0.tmp"
set md5=

if exist "%userpass%" (
    set "file=%userpass%"
) else for %%I in ("%file%") do if %%~zI equ 0 (
    <NUL >"%file%" set /P "=%userpass%"
)

for /f "skip=1 delims=" %%I in ('certutil -hashfile "%file%" MD5') do (
    if not defined md5 set "md5=%%I"
)

2>NUL del "%temp%\%~n0.tmp"

:menu 
echo\you can use this features in this program:
echo\"1=> LOCK or UNLOCK the locker folder"
echo\"2=> hash converter"
echo\"3=> exit"
set /p userinput=insert the menu num:

if %userinput% == 1 (goto locker)
if %userinput% == 2 (goto hasher)
if %userinput% == 3 (goto exit)
if %userinput% equ exit (goto exit)
goto menu

:hasher
echo\ here is your hashed password:
echo\ %md5: =%
goto converter

:locker
if %md5: =% equ %password% ( goto correct) else ( goto  failed)

:correct
echo Hurrah!you cracked the password it was %userpass%
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" (
	attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
	ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Locker
	echo\ folder "Locker" UNlocked successfuly!
) else (
	ren Locker "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
	attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
	echo\ folder "Locker" locked successfuly!
)
goto converter
:failed
echo Wrong pass
goto converter

:exit