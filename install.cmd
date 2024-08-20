@echo off
color e0
title ProFile Installer - Ver:1.0.7

cls
echo.
echo ===============================
echo       ProFile Installer
echo          Ver: 1.0.7
echo ===============================
echo.

if not exist PF.ps1 (goto error) else (goto install);

:error
echo Sorry, but something went wrong...
echo.
pause
exit

:install
cls
echo.
echo ===============================
echo       ProFile Installer
echo          Ver: 1.0.7
echo ===============================
echo.

echo This installer may not work properly as it is still in early stages of development.
echo The original idea was to make the PowerShell script 
echo write out files to where they need to go and run the files in the 
echo background.
echo.
echo This can still be achieved but think it's something that should be
echo saved for later versions as this installer file is simple yet more complex
echo than it needs to be so porting it over to PowerShell should be a breeze.
echo.

pause

cls
echo ===============================
echo       ProFile Installer
echo          Ver: 1.0.7
echo ===============================
echo.
echo  Features
echo  --------
echo.
echo Here's what's new with the latest version of ProFile:
echo.
echo - Checks to see if you are connected to the internet
echo - Performs a quick network speedtest
echo - Scans your network and scans devices on the network
echo - Checks drives that are connected and makes sure they are healthy
echo - Optimizes your main hard drive
echo - Logs every process and reads it for the next time
echo - Checks if the system has a battery and gathers battery data if so
echo - Gathers system information and information about the users
echo - Checks tasks and services that are installed
echo - Monitors which ones are running
echo - Removes programs from startup
echo - Organizes files on your desktop and other places
echo - Replaces commonly used files with shortcuts
echo - Records a backup of all the apps you have installed
echo - Checks for updates on frequently used applications
echo.
echo And so much more...
echo.
echo.
pause

set installpath="%userprofile%\Documents\PowerShell\"

set p1 = "%userprofile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
set p2 = "%userprofile%\Documents\PowerShell\Microsoft.VSCode_profile.ps1"
set p3 = "%userprofile%\Documents\PowerShell\Microsoft.PowerShellISE_profile.ps1"

if not exist "%installpath%" (
    md "%userprofile%\Documnents\PowerShell\"
) else (
    if exist "%userprofile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" erase "%userprofile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
)

if exist PF.ps1 (
    copy "PF.ps1" "%userprofile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    copy "PF.ps1" "%userprofile%\Documents\PowerShell\Microsoft.VSCode_profile.ps1"
    copy "PF.ps1" "%userprofile%\Documents\PowerShell\Microsoft.PowerShellISE_profile.ps1"
    echo PF.ps1 has been copied to all profile locations.
) else (
    echo Installation aborted due to a critical issue:
    echo Installation files that were required for installation were not found.
    echo Make sure to place PF.ps1 in the correct directory and try again.
)

:end
pause
exit
