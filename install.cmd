:settings
@echo off
color e0
setlocal
title ProFile Installer - Ver:1.0.7
cls

:main
echo.
echo ===============================
echo       ProFile Installer
echo          Ver: 1.0.7
echo ===============================
echo.

timeout /t 30

cls
echo ==================================
echo               ProFile
echo ==================================
echo.

echo This installer may not work properly as it is still in early develop
echo early stages of development. The original idea was to make the PowerShell 
echo script write out files to where they need to go and run the files in the 
echo. background.
echo.
echo.
echo This can still be achieved but think it's something that should be
echo saved for later versions as this installer file is simple yet more complex.
echo than it needs to be so porting it over to PowerShell should be a breeze.
echo.
timeout /t 60

cls
echo ==================================
echo               ProFile
echo ==================================
echo.
echo Heres what's new with the latest version of ProFile:
echo.
echo - Checks to see if you are connected to the internet
echo - Performs a quick network speedtest
echo - Scans your network and scans devices on the network.
echo - Checks drives that are connected and makes sure they healthy.
echo - Optimizes your main hard drive
echo - Every process that it does is logged and read by the system for the next time.
echo - Checks if the system has a battery and gathers battery data if so.
echo - Gathers system information and information about the users.
echo - Checks tasks and services that are installed
echo - Monitors which ones are running.
echo - Removes programs from startup.
echo - Organizes files that are on your desktop and other places.
echo - Replaces commonly used files with shortcuts.
echo - Records a backup of all the apps that you have installed
echo - Checks for updates on frequently used applications.
echo.
echo And so much more...
echo.
echo.


echo on the system and if not copies it to all multiple locations
echo to ensure that when you run PowerShell on your system ProFile
echo functionality and commands as well as shortcuts and background
echo services that help manage your machine to make it run better
echo for you without you having to type anything.
echo.


echo.

if exist PF.ps1 (
    echo "PF.ps1 found. Proceeding with installation..."
    copy "%installpath%PF.ps1" "%userprofile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    copy "%installpath%PF.ps1" "%userprofile%\Documents\PowerShell\Microsoft.VSCode_profile.ps1"
    copy "%installpath%PF.ps1" "%userprofile%\Documents\PowerShell\Microsoft.PowerShellISE_profile.ps1"
    echo "PF.ps1 has been copied to all profile locations."
) else (
    echo "Installation aborted due to a critical issue:"
    echo "Installation files that were required for installation were not found."
    echo "Make sure to runt"
)

endlocal
