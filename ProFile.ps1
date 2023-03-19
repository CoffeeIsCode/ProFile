# ProFile.ps1
# Created by CoffeeIsCode
# Copyright (C) 2023 - Caffeinated Software Systems


# Globals
$app = @{};
$app.creator = "Created by CoffeeIsCode"
$app.copyright = "Copyright (C) 2023 - Caffeinated Software Systems - All Right Reserved"
$app.firstrun
$app.firstrun_checked = $false

$system = @{}; $sys = $system
$sys.computer_name = $env:COMPUTERNAME
$sys.systeminfo = systeminfo.exe

$index = @{}

$path = @{}
$path.install = "C:\Program Files\ProFile\"

# Version Data W/ Shorts
$build = 1; $b = $build
$revisions = 0; $r = $revisions
$upadate = 1; $u = $upadate

# Settings
function settings() {
  $host.UI.RawUI.WindowTitle = "ProFile Ver:$b.$r.$u"
} settings

# Logo
function hr() { "============================================" }
function br() { " " } 
hr; br;
"$app.title"
"$app.copyright"
br; hr; br

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
    "Welcome to "
  }
} check-first


function write-index() {
  $index.new = Get-ChildItem -Path "$env:USERPROFILE" -Name -Recurse
}