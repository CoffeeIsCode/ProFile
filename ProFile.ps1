# ProFile.ps1
# Version: 1.0.4
# Developed by: CoffeeIsCode
# Copyright (C) 2023 - Caffeinated Software Systems

<# Settings #> $settings = @{};
# Only make changes to this if you completely 
# understand what it is you are making changes to. #>
<# Background color #> $settings.backgroundColor = "black"; <# Options: red, orange, yellow, green, blue, purple, black, white, and much more. #>
<# Text color #> $settings.textColor = "white"; <# Options: red, orange, yellow, green, blue, purple, black, white, and much more. #>
<# Display size #> $settings.screen = { 
  width:"regular" <# Default width: regular#>
  height:"large" <# Default height: large#> 
}; <# Options (for both): sm,small, m, med,medium,reg,regular, l, large, xl, xlarge, m, mega #>
<# History file line count #> $settings.MaximumHistoryCount = 30000; <# 30000 is program default, 4096 is windows default #>

<#
# WARNING: DO NOT MAKE CHANGES PAST THIS POINT! 
# Making changes can cause serious problems to your machine.
#>

# Globals
$app = @{
  install_checked  = $false
  settings         = $settings
  title            = "ProFile.ps1"
  creator          = "Created by CoffeeIsCode"
  firstrun         = ""
  copyright        = "Copyright (C) 2023 - Caffeinated Software Systems - All Right Reserved"
  firstrun_checked = $false
}; 

$system = @{}; $sys = $system;
function get-system-data-basic() { 
  $system.computerName = $env:COMPUTERNAME # get computer name.
  $sys.user = $env:USERNAME;

}; get-system-data-basic

function get-system-data() {

  "Collecting system information."; "Please wait."
  $system.systeminfo = systeminfo.exe # get all system information.
}

function update-appdata() {
  "Updating the application data."; Start-Sleep 1; "Please wait."; 
  $app.dataFile = 
  Start-Sleep 3; "Almost done."; Start-Sleep 2;
}

function open() { Start-Process explorer .\ }

function onenote-data() {
  Set-Location "$env:USERPROFILE\AppData\Local\Microsoft\OneNote\"
  $d = Get-ChildItem -Name -Directory
  Get-ChildItem $d[0];
  open
}

function update-system() {
  'Updating powershell internal help files'
  update-help
  'Getting list of installed programs'
  $system.programs
}

function wipe() {
  Clear-Host;
  Get-ChildItem;
  $dir = input "Which directory would you like to erase?";
  if (Test-Path $dir) { 
    "Are you sure you want to erase this folder and all sub folders?";
  }
  else { 
    "That directory does not exist." 
  }
}
function clear-history-file() {
  
}

function redo() { 
  "Starting powershell"; 
  "Checking for later version of powershell"; 
  if (Test-Path "C:/Program Files/PowerShell/*/pwsh.exe") { 
    "Later version of powershell found"; 
    Start-Process pwsh.exe 
  } 
  else { 
    "Only older version of powershell found"; 
    Start-Process powershell.exe 
  }; 
  "ProFile is getting ready to close this shell \N"; 
  Start-Sleep 7; 
  exit; 
}

function search-file() {
}

function search($str) { 
  # function to search the whole computer for a file or contents of a file.
  "Starting search for $str"; " "
  "Part 1: File named $str";
  dir -Recurse -name -file -Path "C:/" | findstr "$str"
}

function cd...() { for ($c = 0; $c -le 20; $c++) { cd.. } }


$index = @{}; $PF.index = $index; $ix = $index;
$ix.folders = @{}; $ix.files = @{};
$ix.c = @{};
$ix.folderCount = 0; $ix.fileCount = 0;

function update-index() {
  # get index of root folder
  $index.folders = Get-ChildItem -Path "C:/" -Name
  $index.files = Get-ChildItem -Path "C:/" -File -Name
  # get folder count
  $index.folderCount = $index.folders.count
  "ProFile is now going to make a quick index."
}

function checkFile($fileName, $mode) {
  if ($mode -eq "1" -or $mode -eq $true) {
    if (Test-Path $fileName) { 
      "The file was found"; return $true
    }
    else {
      "The file can't be found."; return $false
    }
  }
  else {
    if (Test-Path $fileName) { return $true } else { return $false }
  }
}

function get-index() { <# Check to see if the file exists #> }

$path = @{}
$path.install = "C:\Program Files\ProFile\"
$path.local = "$env:USERPROFILE\.Profile\"
$path.indexFile = "$env:USERPROFILE\.ProFile\index.db"

# Version Data W/ Shorts
$build = 1; $b = $build; $app.build = $build;
$revision = 0; $r = $revision; $app.revision = $revision;
$update = 1; $u = $update; $app.update = $update;
$version = "$b.$r.$u"; 
$app.version = $version;

<#
# Settings
#
# Safe Settings
# Only make changes to this if you completely 
# understand what it is you are making changes to.
#>

$settings = @{};
$settings.backgroundColor = "black"; <# Options: red, orange, yellow, green, blue, purple, black, white, and much more. #>
$settings.textColor = "white"; <# Options: red, orange, yellow, green, blue, purple, black, white, and much more. #>
$settings.screen = { 
  width:"regular" <# Default width: regular#>
  height:"large" <# Default height: large#> 
}; <# Options: sm,small, m, med,medium,reg,regular, l, large, xl, xlarge, mega #>
$settings.MaximumHistoryCount = 30000; <# 30000 is program default, 4096 is windows default #>

#


# Globals / Local Variables
$PF = @{}; # aray to store all the programs information.
$PF.settings = $settings; # copy settings to main variable.

function screenSize() {
  # Width
  if ($screen.width -eq "small") { mode con: cols=50 }
  if ($screen.width -eq "s") { mode con: cols=50 }
  if ($screen.width -eq "sm") { mode con: cols=50 }
  if ($screen.width -eq "m") { mode con: cols=100 }
  if ($screen.width -eq "med") { mode con: cols=100 }
  if ($screen.width -eq "medium") { mode con: cols=100 }
  if ($screen.width -eq "r") { mode con: cols=100 }
  if ($screen.width -eq "reg") { mode con: cols=100 }
  if ($screen.width -eq "regular") { mode con: cols=100 }
  if ($screen.width -eq "l") { mode con: cols=150 }
  if ($screen.width -eq "lrg") { mode con: cols=150 }
  if ($screen.width -eq "large") { mode con: cols=150 }
  if ($screen.width -eq "extralarga") { mode con: cols=200 }
  if ($screen.width -eq "xlarge") { mode con: cols=200 }
  if ($screen.width -eq "xl") { mode con: cols=200 }
  # Height
  if ($screen.height -eq "small") { mode con: lines=10 }
  if ($screen.height -eq "s") { mode con: lines=10 }
  if ($screen.height -eq "m") { mode con: lines=10 }
  if ($screen.height -eq "med") { mode con: lines=20 }
  if ($screen.height -eq "medium") { mode con: lines=20 }
  if ($screen.height -eq "r") { mode con: lines=20 }
  if ($screen.height -eq "reg") { mode con: lines=20 }
  if ($screen.height -eq "regular") { mode con: lines=20 }
  if ($screen.height -eq "l") { mode con: lines=30 }
  if ($screen.height -eq "lrg") { mode con: lines=30 }
  if ($screen.height -eq "large") { mode con: lines=30 }
  if ($screen.height -eq "extralarga") { mode con: lines=40 }
  if ($screen.height -eq "xlarge") { mode con: lines=40 }
  if ($screen.height -eq "xl") { mode con: lines=40 }
  if ($screen.height -eq "mega") { mode con: lines=900 }
}

$in = @{}; $PF.input = $in;
function secure-input($propmt) { $in[$in.count] = Read-Host -Prompt "$propmt" -MaskInput }
function input($prompt, $secure) { 
  if ($secure -eq $true) { secure-input "$prompt" } else {
    if ($prompt -eq $null -or $prompt -eq 'undefined' -or $prompt -eq $false) { 
      $in[$in.count] = Read-Host 
    }
    else {
      $in[$in.count] = Read-Host -Prompt "$prompt"
    }
    return
  }    
}

function hr($count) {
  $line = 0;
  if ($null -eq $count) { $count = 20 }
  for ($x = 0; $x -le $count; $x++) { $line += "=" }
  "$line"
}

function windowName() {
  $host.UI.RawUI.WindowTitle = "ProFile.ps1 Version:$version"
} windowName

function title($t) { $Host.UI.RawUI.WindowTitle = "$t" };

function br() { ""; } 

function index-loader() { 
  $index.c = dir -name -Directory -path "C:/";
  $dc = $i.d.count;
  $dl = @{}

  $keys = '/', '\', '-'
  $o = 0;
  for ($x = 0; $x -le $count; $x++) { 
    cls; 
    $a = $keys[$o];
    $p = ($x / $dc) * 100; 
    "$a  - $x of $count  [$p %] Complete "; 
    sleep .3
    if ($o -lt 2) { $o = $o + 1 } else { $o = 0 } 
  }
}

function install-profile() {
  md $path.install > $null;
  if (Test-Path $path.install) {} else { "There was an issue installing ProFile."; "Error code: MDPF1"; "Please try again."; "If you contiue seeing this error contact support on https://www.GitHub.com/CoffeeIsCode" }
}

function uninstall-profile() {
}

# Check First Run
function firstrun() {
  $app.firstrun_checked = $true;
  if (Test-Path $path.install) {
    # Not first run
    $app.firstrun = $false
    return 
  }
  else {
    # First Run Install
    $app.firstrun = $true 
    "Welcome to ProFile!"
    install-profile
  }
} firstrun

function write-index() { $index.new = Get-ChildItem -Path "$env:USERPROFILE" -Name -Recurse }

function pretty($filePath) {}

<#
File: ProFile.ps1
Version: 1.0.4
Developed by: CoffeeIsCode
#>


### WARNING: DO NOT MAKE CHANGES BELOW THIS POINT ###
#   Making changes to this file past this point can cause serious damage to your system. ###

# ApplicationGlobals / Local Variables
$PF = @{}; $APP = $PF; # aray to store all the programs information.
$PF.settings = $settings; # copy settings to main variable.

function screenSize() {
  # Width
  if ($screen.width -eq "small") { mode con: cols=50 }
  if ($screen.width -eq "s") { mode con: cols=50 }
  if ($screen.width -eq "sm") { mode con: cols=50 }
  if ($screen.width -eq "m") { mode con: cols=100 }
  if ($screen.width -eq "med") { mode con: cols=100 }
  if ($screen.width -eq "medium") { mode con: cols=100 }
  if ($screen.width -eq "r") { mode con: cols=100 }
  if ($screen.width -eq "reg") { mode con: cols=100 }
  if ($screen.width -eq "regular") { mode con: cols=100 }
  if ($screen.width -eq "l") { mode con: cols=150 }
  if ($screen.width -eq "lrg") { mode con: cols=150 }
  if ($screen.width -eq "large") { mode con: cols=150 }
  if ($screen.width -eq "extralarga") { mode con: cols=200 }
  if ($screen.width -eq "xlarge") { mode con: cols=200 }
  if ($screen.width -eq "xl") { mode con: cols=200 }
  # Height
  if ($screen.height -eq "small") { mode con: lines=10 }
  if ($screen.height -eq "s") { mode con: lines=10 }
  if ($screen.height -eq "m") { mode con: lines=10 }
  if ($screen.height -eq "med") { mode con: lines=20 }
  if ($screen.height -eq "medium") { mode con: lines=20 }
  if ($screen.height -eq "r") { mode con: lines=20 }
  if ($screen.height -eq "reg") { mode con: lines=20 }
  if ($screen.height -eq "regular") { mode con: lines=20 }
  if ($screen.height -eq "l") { mode con: lines=30 }
  if ($screen.height -eq "lrg") { mode con: lines=30 }
  if ($screen.height -eq "large") { mode con: lines=30 }
  if ($screen.height -eq "extralarga") { mode con: lines=40 }
  if ($screen.height -eq "xlarge") { mode con: lines=40 }
  if ($screen.height -eq "xl") { mode con: lines=40 }
  if ($screen.height -eq "mega") { mode con: lines=900 }
}

$in = @{}; $PF.input = $in;
function secure-input($propmt) { $in[$in.count] = Read-Host -Prompt "$propmt" -MaskInput }

function input($prompt, $secure) {
  if ($secure -eq $true) { 
    secure-input $prompt
  }
  else {
    if ($prompt -eq $null -or $prompt -eq 'undefined') { $in[$in.count] = Read-Host }
    $in[$in.count] = Read-Host -Prompt "$prompt"
    return
  }    
}


function hr($count) { $o = 0; for ($x = 0; $x -le $count; $x++) { $o = $o + 1; } } # creates a bar effect in the console
function hb($count) { hr $count; br; }

### MAIN PROGRAM SECTION ###
hb 25;



### MAIN RUNNING SECTION ###
hr; br; # Line and break
$app.title
$app.copyright
br; hb;
