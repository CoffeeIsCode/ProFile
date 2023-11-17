### SETTINGS ###
$settings = @{
    color = { fg="blue"; bg="red" }
    title = "Profile";
}

######################################################
#  WARNING - DO NOT MAKE CHANGES BEYOND THIS POINT   #
#  Making changes may cause problems to your device. #
######################################################




function set-settings() {}



### GLOBAL VARIABLES ###
$app = @{title = "ProFile"; version = "2.2.1"; status = "Trial"; debug = $true; copyright = "Copyright (c) 2022-2023 Caffeinated Software Systems - All Rights Reserved"; }
$task = @{}; $task.check = $false; 
$system = @{}; 

$user = $env:userprofile; 
$desktop = "$env:userprofile/Desktop"; $desk = $desktop;
$pictures = "$env:userprofile/pictures"; $pics = $pictures; 
$documents = "$env:userprofile/documents"; $docs = $documents;
$OneDrive = "$env:userprofile/OneDrive/";
$profileRoot = "$env:userprofile/documents/powershell/";
$programFiles = $env:ProgramFiles; $pf = $programFiles;
$programFiles32 = "${env:ProgramFiles(x86)}"; $pf32 = $programFiles32;

$path = @{
    desktop     = $desktop; 
    user        = $user; 
    winroot     = $env:windir;
    pictures    = $pictures; 
    pics        = $pictures;
    profileRoot = $profileRoot; # profile path
    programFiles = $programFiles;
    pf = $pf;
    pf32 = $pf32;
    programFiles32 = $programFiles32;
    winSys32 = '$env:windir/System32/'; 
    OneDrive = $env:OneDrive;
};

$file.ext = "exe","dll";

$index = @{
    path = @{};
    checked = @{};
    files = @{};
    folders = @{};
    size = @{};
    ext = $file.ext;
};


$program = @{};
$task = @{};

function get-tasks() {
    $task.list = tasklist;
    $task.taskCount = $task.list.count;
    if ($task.taskCount -ge 150) { "There are too many programs running on your system at once. "}
    $task.memory = @{};
}
$drive = @{};

function get-drives() {
    
    $drive = @{
        all = Get-Volume;
    };
    
}

$program = @{
    chrome = $env:ProgramFiles
}

$file = @{
    tempCMD = "$env:userprofile/temp.cmd";
    runtime = "$env:userprofile/";
    profile = "$env:userprofile/documents/Microsoft.PowerShell_profile.ps1";    
}
$check = @{
    name   = @{};
    type   = @{};
    exists = @{};
    hash   = @{};
};

function checker() {
    # check each file
    $c = 0;
    $m = $file.count;
    if (Test-Path $file.profile) {
        "exists"
    }
    else {
        "doesn't exist"
    }
}




### GLOBAL VARIABLES ENDS ###












<# FINISHED FUNCTIONS #>
<#


Update-Globals = Update important system variables into place
Load-Globals = Loads system variables for the current user and machine if exists. 
Save-Globals = Saves important system variables



#>
#
#

# [x] - Update-Globals = Updates system variables
# [x] - Code-Profile   = 
# [ ] - 
# [ ]  -  Name           = Desc

function code-profile() { code $profile; } # open vscode with profile file.

function open($a, $b) {
    $op = $b.ToLower();
    $op = @{};
    $op[0] = $a; $op[1] = $b;

    <# Both NULL#>
    if ($null -eq $op[0] -and $null -eq $op[1] ) { 
        "Opening the current directory as there where no perameters given.";
        Start-Process .\ 
    }


    <# choice is not null #>
    if ($null -ne $op[0] ) {
        if ($op[0] -eq "/?" -or "-help") { 
            Clear-Host;
            "OPEN"; "====="; " "; 
            "Open is a simple way of quickly opening some very important locations and applications";
            "There are a lot of ways that you can use open";
            " ";
            "'OPEN /?' or 'OPEN -help'  = Shows this help page";
            "OPEN "
        
        }
    } 
}

function update-globals() {
    <# basic system vars to be updated #>
    $system.username = $env:username; $system.computer = $env:computername;
    $app.task = $task;
    $app.system = $system;
    $app.sys = $system;
    $app.vars = Get-Variable;
    $app.path = $path;
    $app.file = $file;
} 

### RUN FUNCTIONS IN ORDER OF IMPORTANCE ###
update-globals # important



<# FINISHED FUNCTIONS - END #>



function redo($a, $b) {

    # lower case conversion
    $b = $b.ToLower();
    $a = $a.ToLower();

    

    if ($null -ne $a) {
        <# first choice typed #>
        

        # if first word is 'in' or 'with'
        if ($a -eq "in" -or $a -eq "with") {
            if ($b -eq "powershell") { Start-Process powershell }
            if ($b -eq "powershell_ise") { Start-Process powershell_ise }
            if ($b -eq "pwsh_ise") { Start-Process powershell_ise }
            if ($b -eq "ise") { Start-Process powershell_ise }
            if ($b -eq "pwsh") { Start-Process pwsh }
        }

        # if first choice is powershell 
        if ($a -eq "powershell") { Start-Process powershell }
        if ($a -eq "pwsh") { Start-Process pwsh }
        if ($a -eq "powershell_ise" -or "ise") { Start-Process powershell_ise }
    }

}



function set-globals() {
    if ($app.debug -eq $true) { "Globals were loaded to system."; } 
}
set-globals <# RUN ONCE #>

function task($op) {
    #$lower = $op.tolower();
    if ($null -eq $op) {
        "TASK"; "Please add more perameters after the command.";
        "For more type 'TASK -HELP' or 'TASK /?'";
        return;
    }
    if ($op -eq "-HELP" -or $op -eq "-help") {
        "TASK FUNCTION"; " "; "TASK is used for many different reasons.";
        "One reason one might use task is to capture a screenshot of all applications runniing on the machine."; 
        "This can be done using: TASK -list"
        return;
    } 
    <#to store and save the tasks to file#>
    if ($op -eq "-list") { $task.list = tasklist; $task.count = $task.list.count; };
}



function profile($a) {
    <# for profile specific commands #><# if choice is blank #> 
    if ($null -eq $a) { 
        Clear-Host; 
        "Profile - Version $app.version "; "==========="; " "; 
        "Profile is an addon to any version of PowerShell and allows you to do things with PowerShell that are extremly effiecient such as navigation, file transfers and even file compression and so much more."; 
        "Profile is safe and free to use";
        " "; "anyone can make contributions." 
    } 
}

function title($str) { 
    $host.ui.rawui.windowTitle = "$str"; 
}

function logo() { 
    <# loads the basic logo to page #>
    "This function is not ready in this release..."
    sleep 2
    "Please update and try again."
    sleep 1
    "If you are running the latest version it may be a locked feature."
    sleep 1
    "For more information go to: "
    sleep 1
    "www.github.com/coffeeiscode"
}

function start() {
    " " 
    "ProFile $app.version 2.2.1 - PowerShell Addon Loaded!"
    "Created by: CoffeeIsCode"
    $host.ui.rawui.windowTitle = $app.title + " - Ver " + $app.version + " Status: " + $app.status;
}

function loadBreak($seconds) {
    clear-host

    $start = $seconds;
    $remaining = $seconds;

    while ($remaining -gt 0) {
        $remaining = $remaining - 1;
        Write-Progress -Status "Status" -Activity "Activity" -SecondsRemaining "$remaining";
    }

}

function redo() {
    "Starting new shell";
    Start-Process pwsh.exe; 
    timeout 5
    exit; exit; exit;
    title CLOSE

}

function get-apps() {
    $wingetApps = winget list
}

function build($op) {
    if ($op -eq "function") {
        $function
        $fname = "";
    }
}

###  MAIN CALL LOOP ###
"ProFile 2.2.1 addon has been loaded."

function loopCheck() {
    <# checked on each loop #>
}

if ($file -ne 'undefined') {
    $file.tempCMD = "$env:userprofile/temp.cmd";
}
else {
    $file = @{
        tempCMD = "$env:userprofile/temp.cmd"
    };
}

function cmd($com) {
	
    if (Test-Path $env:userprofile/temp.cmd) { 
        erase $path.tempCMD
	    

    }
    
    $com > $env:userprofile/temp.cmd 
}

function add($name) {
	
}
### FUNCTIONS ADDED ###
function google($url) { Start-Process chrome.exe "$url" }
