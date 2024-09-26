#   PF.ps1
#   Version: 2.2.8
#   Copyright © 2023-2024 - Caffeinated Software Systems - All Rights Reserved
#   Developed By: CoffeeIsCode
#   Updated: Sep, 26, 2024

# Get errors from console at start
$Err = [ordered]@{pre = $error.count; script = $null; end=$null}

function update-system-help{
    if (test-path C:\ProFile\Update.log) {
        $t = type update.log;
        if ($t -imatch "Updated help"){
            # help was already updated
        } else {
            update-help -UICulture "en-US"

            ""
        }
    }
    update-help -UICulture "en-US"
}

# Set version information
Set-Variable -Name "Build" -Value 2 -Option Constant
Set-Variable -Name "Revision" -Value 2 -Option Constant
Set-Variable -Name "Udate" -Value 8 -Option Constant

$Updates = @{};

# Write-Host changes
Set-Alias "Host" "write-host"
function green($str){Host -foregroundColor green "$str"}
function blue($str){Host -foregroundColor blue "$str"}
function red($str){Host -foregroundColor red "$str"}
function yellow($str){Host -foregroundColor yellow "$str"}
function magenta($str){Host -foregroundColor magenta "$str"}
function black($str){Host -foregroundColor black "$str"}
function white($str){Host -foregroundColor white "$str"}


function green-same($str){Host -foregroundColor green -nonewline "$str"}
function blue-same($str){Host -foregroundColor blue -nonewline "$str"}

function whats-new {
    Host -foregroundColor blue "+===========================================================+"
    Host -foregroundColor white -nonewline "    What's New in "
    Host -foregroundColor blue "2.2.8"
    Host -foregroundColor blue "+===========================================================+"

    Host -foregroundColor magenta "- Added function to check and log any errors. "
    Host -foregroundColor red "- Major bug fixes."
    Host -foregroundColor yellow "- Removed duplicate functions that were conflicting."
    Host -foregroundColor green "- Corrected typographical errors."
}

$updates = @{}
function updates($title,$details){
    $date = Get-Date;
    $time = Get-Date
    $updates[$updates.count] = "[$title]"
}

function parse(){}

### GLOBALS ###
$app = @{}
$app.devMode = $false
$app.debugMode = $false
$app.title = "ProFile"
$app.status = "Starting"

### SETTINGS ###
$setting = @{}
$app.setting = $setting

### TIME START ###
$time = @{}
$time.start = Get-Date

### FILE AND PLACEMENT ###
$file = @{}
$app.file = $file
$file.indexFile = "$env:USERPROFILE/index.log"

### INDEX ###
$index = @{}
$app.index = $index
$index.checked = $false

$path = @{}
$app.path = $path
$path.userdata = "$env:USERPROFILE/userdata.dll"

### ENVIRONMENT LOCATIONS ###
$system = @{}
$user = $env:USERPROFILE
$desktop = "$env:USERPROFILE/Desktop"
$pictures = "$env:USERPROFILE/pictures"
$documents = "$env:USERPROFILE/documents"
$OneDrive = "$env:USERPROFILE/OneDrive/"
$profileRoot = "$env:USERPROFILE/documents/powershell/"
$programFiles = $env:ProgramFiles
$programFiles32 = "${env:ProgramFiles(x86)}"

$path.desktop = $desktop
$path.user = $user
$path.winroot = $env:windir
$path.pictures = $pictures
$path.pics = $pictures
$path.profileRoot = $profileRoot
$path.programFiles = $programFiles
$path.pf = $programFiles
$path.pf32 = $programFiles32
$path.programFiles32 = $programFiles32
$path.winSys32 = "$env:WINDIR/System32/"
$path.OneDrive = $OneDrive

$file.ext = @("exe", "dll")

### SYSTEM ###
$system = @{
    username = $env:USERNAME
    computername = $env:COMPUTERNAME
}
$app.system = $system

function update-globals {
    $app.program = $program
    $app.task = $task
    $app.file = $file
    $app.path = $path
    $app.index = $index
    $app.system = $system
}
update-globals

### PROGRAM FUNCTIONS ###
function program-updates {
    Write-Host "ProFile is now going to check for outdated programs. This may take a minute."
    $program.update = winget update
    $count = $program.update.count
    $updates = $program.update[$count - 1]
    $program.pending = "There are $updates"
    Write-Host "$program.pending"
}

function check-online {
    Write-Host "Checking to see if $system.computername is connected to the internet."
    $pong = Test-Connection -ComputerName 8.8.8.8 -Count 1 -Quiet
    if ($pong) {
        $app.isOnline = $true
        Write-Host "This device is connected to the internet."
    } else {
        $app.isOnline = $false
        Write-Host "This device is having trouble connecting to the internet. Please try again later."
    }
}

function wait($t) {
    if ($null -eq $t) {
        Start-Sleep -Seconds 2
    } elseif ($t -eq 1) {
        Start-Sleep -Seconds 1
    } elseif ($t -eq 4) {
        Start-Sleep -Seconds 4
    } elseif ($t -eq 3) {
        Start-Sleep -Seconds 3
    } elseif ($t -eq "enter") {
        Start-Sleep -Seconds 5
    } elseif ($t -eq "long") {
        Start-Sleep -Seconds 10
    }
}

function echo($str) {
    Clear-Host
    Write-Host "$str"
}

function debugMode {
    if ($app.debugMode -or $true) {
        program-updates
    }
    if ($app.devMode -or $true) {
        Clear-Host
        echo "Dev Mode: ON"
        Start-Sleep -Seconds 2
        echo "Checking program updates"
        Start-Sleep -Seconds 1
        program-updates
    }
}

function saveStrip {}

function checkIndex {
    if (Test-Path $file.indexFile) {
        Write-Host "Index file exists."
    } else {
        Write-Host "Index file does not exist."
    }
}

function buildIndex {

}



$time.end = Get-Date

function timeDiff {
    $time.diff = $time.end - $time.start
}
timeDiff

### MAIN CALL LOOP ###
Write-Host "ProFile 2.2.6 addon has been loaded."

if ($file -ne 'undefined') {
    $file.tempCMD = "$env:USERPROFILE/temp.cmd"
} else {
    $file = @{
        tempCMD = "$env:USERPROFILE/temp.cmd"
    }
}

### ADDITIONAL CLEARED FUNCTIONS ###
function get-tasks {
    $task.list = tasklist
    $task.taskCount = $task.list.count
    if ($task.taskCount -ge 150) {
        Write-Host "There are too many programs running on your system at once."
    }
}

function get-drives {
    $drive.all = Get-Volume
}

function google($url) {

    Start-Process chrome.exe -ArgumentList $url
}

function edge($url) {
    Start-Process msedge.exe -ArgumentList $url
}

function cmd($com) {
    if (Test-Path $file.tempCMD) {
        Remove-Item $file.tempCMD
    }
    $com > $file.tempCMD
}

function Profile-Head {
    $app.status = "Running";
    Clear-Host
    Write-Host ""
    Write-Host "ProFile $app.version 2.2.1 - PowerShell Addon Loaded!"
    Write-Host "Created by: CoffeeIsCode"
    $host.ui.rawui.windowTitle = "$app.title - Ver $app.version - Status: $app.status"
}

Profile-Head

$File

# Get end error count
function get-errors{
    # check to see if end count exists.
    if ($null -eq $err.end) {
        "Getting error information and saving information to ProFile log."
        $err.end = $error.count
        if ($err.end -gt $err.pre){
            # there were some errors in the script...
            $err.script = $err.end - $err.pre;
        } else {
            # there were no errors
            $err.script = 0;
        }
    } 
    # if there were errors
}

get-errors;
