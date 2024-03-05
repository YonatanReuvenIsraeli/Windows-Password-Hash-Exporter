@echo off
setlocal
title Windows Password Hash Exporter
echo Please run this batch file as an administrator.
goto :Start

:Start
echo.
set /p HashPath="Where do you want to save the Windows password hashes to? "
if not exist "%HashPath%" goto :HashPathNotExist
md "%HashPath%\Windows Password Hashes"
reg save HKLM\SAM "%HashPath%\Windows Password Hashes\SAM.save"
reg save HKLM\SYSTEM "%HashPath%\Windows Password Hashes\SYSTEM.save"
echo.
echo Use impacket-secretsdump in Kali Linux to extract the hashes from "%HashPath%\Windows Password Hashes".
goto :Done

:HashPathNotExist
echo %HashPath% does not exist. Please try again.
goto :Start

:Done
endlocal
pause
exit