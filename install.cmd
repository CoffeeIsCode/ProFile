:settings
@echo off
color e0
title ProFIle Installer - Ver:1.0.1

:Install_Check
# check file is in local area
REM - CHECK PROFILE and install it if needed
if exist "%userprofile%/Documents/PowerShell/Microsoft.PowerShell_profile.ps1" set ProFile=1 && REM - ProFile EXISTS
if not exist "%userprofile%/Documents/PowerShell/Microsoft.PowerShell_profile.ps1" set ProFile=0 && REM ProFile MISSING
if %ProFile%==1 goto profile_exists && if %profile%==0 goto profile_notfound

:profile_exists
REM - The profile exists so there has to be a backup, uninstall and overwrite.
goto uninstall
:profile_notfound


:uninstall
set "%userprofile%/Documents/PowerShell/Version.dll"
echo "It seems like there is already an installation of ProFile on this computer. "
echo "Would you like to uninstall ProFile and reinstall this version? Program saves won't be lost."



:yes_profile


:no_profile

:yes_profile
move ProFile.ps1



if exist Profile.ps1 