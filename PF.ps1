#   ProFile -
#   Version: 2.2.7
#   Copyright © 2023-2024 - Caffeinated Software Systems - All Rights Reserved
#   Developed By: CoffeeIsCode
#   Updated: Dec, 15, 2024

$Err = [ordered]{ pre = $error.count; script = $null; }

# Function to run at en of script to get the differenec and see if there were any issues with loading the script.

function get-errors{
    # Check to see if data is already set
    if ($Err.script -ne $null -or $err.script -ne "") {
            $err.script = $error.count;
        } else {

        }

}

function help {
    Write-Host "+===========================================================+"
    Write-Host "    What's New in 2.2.7"
    Write-Host "+===========================================================+"
    Write-Host "- Major bug fixes."
    Write-Host "- Removed duplicate functions that were conflicting."
    Write-Host "- Corrected typographical errors."
     Write-Host "- Added function to check and log any errors. "
}

function parse(){}

### GLOBALS ###
$app = @{
    
}
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

function start {
    Write-Host ""
    Write-Host "ProFile $app.version 2.2.1 - PowerShell Addon Loaded!"
    Write-Host "Created by: CoffeeIsCode"
    $host.ui.rawui.windowTitle = "$app.title - Ver $app.version - Status: $app.status"
}

start