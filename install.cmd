@echo off
color e0
setlocal
title ProFile Installer - Ver:1.0.6 - Packs a bigger punch than Godzilla
mode con: lines=20 cols=80
doskey #=REM
cls

:INTRO
echo ProFile Installer (A.K.A installer.cmd) Readme
echo.
echo This installer may not work properly as it is still in early stages of development.
echo The original idea was to make the PowerShell script 
echo write out to a terminal and run the files in the background.
echo This can still be achieved but think it's something that should be
echo saved for later versions as this installer file is simple yet more complex
echo than it needs to be so porting it over to PowerShell should be a breeze.
echo.
echo Anyway...
echo.
echo Here's What's New in Ver: 1.0.6
echo -------------------------------
echo.
echo 1. Checks to see if PF.ps1 is already installed 
echo on the system and copies it to all PowerShell profile locations.
echo.

:DOS_KEYS
set installpath="%userprofile%\Documents\PowerShell\"
set onedrive="%userprofile%\OneDrive"

:main
call :Install_Check
goto :EOF

:Install_Check
if exist "%installpath%PF.ps1" (
    echo "PF.ps1 found. Proceeding with installation..."
    call :Copy_Profile
) else (
    echo "PF.ps1 not found. Installation aborted."
    goto :EOF
)

:Copy_Profile
REM Copy PF.ps1 to all PowerShell profile locations
copy "%installpath%PF.ps1" "%userprofile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
copy "%installpath%PF.ps1" "%userprofile%\Documents\PowerShell\Microsoft.VSCode_profile.ps1"
copy "%installpath%PF.ps1" "%userprofile%\Documents\PowerShell\Microsoft.PowerShellISE_profile.ps1"
copy "%installpath%PF.ps1" "%userprofile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

echo "PF.ps1 has been copied to all profile locations."
goto :EOF

:EOF
endlocal
