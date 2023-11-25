@echo off
REM === SETTINGS ===
color e0
setlocal
cls
REM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
title ProFile Installer - Ver:1.0.3 - Packs a bigger punch than Pacman
title ProFile Installer - Ver:1.0.4 - Packs a bigger punch than One Punch Man
title ProFile Installer - Ver:1.0.4 - Packs a bigger punch than Godzilla

mode con: lines=20 cols=75
cls

REM === INTRO ===
echo ProFile Installer (A.K.A installer.cmd) Readme
echo.
echo This installer may not work properly as it is still in early stages of development.
echo The original idea was to make the PowerShell script 
echo write out to a terminal and run the files in the background.
echo This can still be acheived but think it's something that should be
echo saved for later versions as this installer file is simple yet more complex
echo than it needs to be so porting it over to PowerShell should be a breaze.
echo.
echo Anyway...
echo.
echo Here's What's New in Ver: 1.0.4
echo -------------------------------
echo.
echo 1. check's to see if ProFile is already installed 
echo on the system so that if it is, it won't erase 
echo saved files, nor will it update to a never version
echo version yet.


REM === DOS KEYS ===
doskey #=REM

REM === Configuration ===
set installpath="%userprofile%/Documents/PowerShell/"
set onedrive=%userprofile%/OneDrive"

REM === Installing Application ===
:main
call install_Check

:Install_Check
if exist ProFile.ps1 set file_path=1
REM # CHECK PROFILE and install it if needed
cd /d %userprofile%/Documents/PowerShell
if exist Microsoft.PowerShell_profile.ps1 set file_exists=1

if %file_path%


if exist "%userprofile%/Documents/PowerShell/Microsoft.PowerShell_profile.ps1" set ProFile=1 && REM - ProFile EXISTS
if not exist "%userprofile%/Documents/PowerShell/Microsoft.PowerShell_profile.ps1" set ProFile=0 && REM - ProFile EXISTS

if %ProFile%==1 goto profile_exists && if %profile%==0 goto profile_notfound

:profile_exists
REM - The profile exists so there has to be a backup, uninstall and overwrite.
goto uninstall

:profile_notfound


:uninstall
set "%userprofile%/Documents/PowerShell/Version.dll"

echo "It seems like there is already an installation of ProFile on this computer. "
echo "Like to uninstall ProFile and reinstall this version? Program saves won't be lost."

if ("%userprofile%/Documents/PowerShell/Version"); { Clear-Host -

:no_profile
if exist "%userprofile%/Documents/PowerShell/" goto finished 

:yes_profile
move ProFile.ps1

if exist Profile.ps1 




