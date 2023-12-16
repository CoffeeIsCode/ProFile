


#^ FILE AND PLACEMENT ###
$file = @{}; $app.file = $file;


### INDEX ###
$index = @{}; $app.index = $index;
$index.checked = $false; 
$program = @{}; $app.program = $program;
$task = @{ list = @{}; name = @{} }; $app.task = $task;

<#* Path / Files#>
$path = @{}; $app.path = $path;
$path.userdata = "$env:userprofile/userdata.dll";
$path.documents = $documents;

#& SYSTEM &#
$system = @{}; $app.system = $system;

#& Enviroment Locations &#




$path = @{
 
    
    programFiles32 = $programFiles32;
    winSys32       = $sys32;
    OneDrive       = $env:OneDrive;
    
};

<#! Program update list needs work#>
<# Program #>
$program = @{}; $app.program = $program; 

function program-list() {
    <# Change to save to file#>
    $program.list = wingt -search "";
}


function html() {
}

function say($str1, $str2, $mode) { 
    $mode = $mode.ToLower(); # convert str to lower case ("ABC" to "abc").
    $html = @{}; #html array
    $html += ""
    if ($null -eq $mode) { $html.type = $str } elseif ($mode -eq 1 -or "warn" -or "warning") { 
        $html.type = "Warning";
    }
    $html.start = "<html><head><title>ProFile $type Page!</title></head><body>";
    $html.end = "</body></html>";
    $html.body = "$str1"; # add to body
    $html.script = "<script>alert('$str2')</script>" 
    "<h1>WARNING!</h1>" >> "$env:USERPROFILE/Desktop/w.html"; 
} 

function check($a, $b, $c) {
    if ($b -eq "==") {
        // is equal
        if ($a -eq $c) {

        }
    }

}
function indexCheck() {}
function indexBuild() {};

function saveStrip() {
    ;

    

}
function checkIndex() {
    if (test-path $file.indexFile) {} else {}
}



$system = @{username = $env:USERNAME; computername = $env:COMPUTERNAME }; $app.system = $system;

<# Update after globals are called #>
function update-globals() {
    <# basic system vars to be updated #>
    $system.username = $env:username; $system.computer = $env:computername;
    $app.task = $task;
    $app.system = $system;
    $app.sys = $system;
    $app.vars = Get-Variable;
    $app.path = $path;
    $app.file = $file;
    $app.program = $program;
    $app.task = $task;
    $app.file = $file;
    $app.path = $path;
    $app.index = $index;
    $app.sytem = $system;
}
update-globals;


### FINISHED FUNCTIONS ###

function check-online() {
    <# check if device is on the internet #>
    "Checking to see if $system.computername is connected to the internet."
    $pong = ping 8.8.8.8;
    $pong2 = $pong[8].Split(" = ");
    $result = $pong2[2][0];
    if ($result -gt 0) { 
        $app.isOnline = $true; 
        "This device is connected to the internet." 
    }
    else { 
        $app.isOnline = $false; 
        "This device is having trouble connecting to the internet."; 
        "Please try again later.";  
    }
}

function wait($t) {
    if ($t -eq $null) { Start-Sleep 2 }
    if ($t -eq 1) { Start-Sleep 1 }
    if ($t -eq 4) { Start-Sleep 4 }
    if ($t -eq 3) { Start-Sleep 3 }
    if ($t -eq "enter") { timeout 5 }
    if ($t -eq "long") { timeout 10 }
}

function echo($str) {
    clear-screen;
    "$str"
}
function check-online() {
    <# check if device is on the internet #>
    "Checking to see if $system.computername is connected to the internet."
    $pong = ping 8.8.8.8;
    $p = $pong[8].Split(" = ");
    $result = $p[2][0];
    if ($result -gt 0) { $app.isOnline = $true; "This device is connected to the internet." } else { $app.isOnline = $false; "This device is having trouble connecting to the internet."; "Please try again later."; }
}

$time.end = Get-Date;
function timeDiff() {
    $time.diff = $time.end - $time.start;
}
timeDiff;

### MINIGAME TESTING ###
$player = @{score = 0; name = ""; hp = 100; memory = 0; };
function minigameOption($a, $b, $c) {
    $a = $a.tolower();
    if ($a -eq "help") { "You ask the operator for help, but he is stuck looking at you through a small black window, but can't see you." }

    minigameRandom
}
function minigameBad() {
    $r = Get-Random;
    if ($r[1] -eq 0) {}
    if ($r[1] -eq 1) {}
    if ($r[1] -eq 2) {}
    if ($r[1] -eq 3) {}
    if ($r[1] -eq 4) {}
    if ($r[1] -eq 5) {}
    if ($r[1] -eq 6) {}
}
function minigameRandom() {
    $r = Get-Random;
    $o = $r[1];
    if ($o -eq 0) { mini }

    if ($r[0] -ge 6) {
        "What you did helped you out"
    }
    else {
        ""
    }  
    
}

function minigameStory() {
    $r = Get-Random;
    $s = $r[1];   
}

function minigameCycle() {
    "You wake up in a forest and have no memory of how you got there.";
    minigameOption;


}

function pow() { <# TO CMD FILE#> }

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
    desktop        = $desktop; 
    user           = $user; 
    winroot        = $env:windir;
    pictures       = $pictures; 
    pics           = $pictures;
    profileRoot    = $profileRoot; # profile path
    programFiles   = $programFiles;
    pf             = $pf;
    pf32           = $pf32;
    programFiles32 = $programFiles32;
    winSys32       = '$env:windir/System32/'; 
    OneDrive       = $env:OneDrive;
};

$file.ext = "exe", "dll";

$index = @{
    path    = @{};
    checked = @{};
    files   = @{};
    folders = @{};
    size    = @{};
    ext     = $file.ext;
};

$program = @{};
$task = @{};

function get-tasks() {
    $task.list = tasklist;
    $task.taskCount = $task.list.count;
    if ($task.taskCount -ge 150) { "There are too many programs running on your system at once. " }
    $task.memory = @{};
}
$drive = @{}; $app.drive = $drive;

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
}
$app.check = $check;

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

function title($str) { 
    $host.ui.rawui.windowTitle = "$str"; 
}

function logo() { 
    <# loads the basic logo to page #>
    "This function is not ready in this release..."
    Start-Sleep 2
    "Please update and try again."
    Start-Sleep 1
    "If you are running the latest version it may be a locked feature."
    Start-Sleep 1
    "For more information go to: "
    Start-Sleep 1
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
### SETTINGS ###
$settings = @{
    color = { fg="blue"; bg="red" }
    title = "Profile";
}

#!####################################################
#! WARNING - DO NOT MAKE CHANGES BEYOND THIS POINT   #
#! Making changes may cause problems to your device. #
#!####################################################

function set-settings() {}


function check-drive($letter) {
    $letter = $letter.tolower();
    
    if ($letter -eq "a") { if (Test-Path "A:/") {} }
}

function get-drives() {
    $drive = @{
        all = Get-Volume;
    }
    $drive.letter = @{};
    $drive.avail = @{
        a = check-drive
    }
    
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
# Update-Globals = Update globals.
# Load-Globals = Loads system variables for the current user and machine if exists. 
# Save-Globals = Saves important variables.
#& Develop a role to log all commands / functions.
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
    wait 2
    "Please update and try again."
    wait 1
    "If you are running the latest version it may be a locked feature."
    wait 1
    "For more information go to: "
    wait 1
    "www.github.com/coffeeiscode"
}

function start() {
    " " 
    "ProFile $app.version 2.2.1 - PowerShell Addon Loaded!"
    "Created by: CoffeeIsCode"
    $host.ui.rawui.windowTitle = $app.title + " - Ver " + $app.version + " Status: " + $app.status;
}



if ($file -ne 'undefined') {
    $file.tempCMD = "$env:userprofile/temp.cmd";
}
else {
    $file = @{
        tempCMD = "$env:userprofile/temp.cmd"
    };
}

# Maybe build file.list
function file-check($file) { 
    if (test-path $file) { };
}


$file.cmd = "$env:userprofile/temp.cmd";
function cmd($com) {
    if (Test-Path $file.cmd ) { 
        erase $path.tempCMD
    }
    $com > $env:userprofile/temp.cmd 
}

function add($name) {
	
}
### FUNCTIONS ADDED ###
function google($url) { Start-Process chrome.exe "$url" }

### SETTINGS ###
$settings = @{};
function set-settings() {}

#!#####################################################
#!  WARNING - DO NOT MAKE CHANGES BEYOND THIS POINT   #
#!  Making changes may cause problems to your device. #
#!#####################################################

#* Globals #
$app = @{creator = "CoffeeIsCode"; Version = "2.2.2"; functions = 0; variables = 0 };

#* Script Vars #

$uptime = @{}; $uptime = Get-Uptime; $uptime.formated = $uptime.TotalHours + ":" + $uptime.TotalMinutes + " : " + $uptime.TotalSeconds;
$program = @{};
$task = @{ list = @{}; name = @{} }

$desktop = "$env:userprofile/desktop";

$path = @{
    desktop = $desktop;
}

$file = @{ 
    updateLog = "$env:userprofile/desktop/Update.log"
};

#! Should look into an encryption method to store data #

$index = @{
    <# Get different types of files and store them here #>
    <# Also be sure to check file hashes for duplicate files. #>
};
$system = @{username = $env:USERNAME; computername = $env:COMPUTERNAME }


function check-online() {
    <# check if device is on the internet #>
    "Checking to see if $system.computername is connected to the internet."
    $pong = ping 8.8.8.8;
    $p = $pong[8].Split(" = ");
    $result = $p[2][0];
    if ($result -gt 0) { $app.isOnline = $true; "This device is connected to the internet." } else { $app.isOnline = $false; "This device is having trouble connecting to the internet."; "Please try again later."; }
}



$index = @{
    path    = @{};
    checked = @{};
    files   = @{};
    folders = @{};
    size    = @{};
    ext     = $file.ext;
};


$program = @{};
$task = @{};

function get-tasks() {
    $task.list = tasklist;
    $task.taskCount = $task.list.count;
    if ($task.taskCount -ge 150) { "There are too many programs running on your system at once. " }
    $task.memory = @{};
}
$drive = @{};

function get-drives() {    
    $drive.all = Get-Volume;
};
    

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

#* GLOBAL VARIABLES ENDS ###


function checker() {
    # check each file
    #^ Only checks ProFile, but it should check every file.
    
    $c = 0;
    $m = $file.count;
    if (Test-Path $file.profile) {
        "ProFile is currently installed on this system.";
        #! Should check the version and update if needed #
    }
    else {
        # ProFile doesn't exist on this system
        #^ Build an installer for ProFile
        #& Maybe use the cmd installer, but export it from the ProFile script
    }
}


<# NOTES COLOR CODES
## ====================
#* COMPLETED IMPORTANT 
## GOOD WORK DETAILS
#! BROKEN AND NEEDS WORK
#? CONCEPT OR IDEA TO BRAINSTORM
#& REQUIRED UPDATING


#* Update-Globals  = Updates important globals;

#^ Load-Globals    = Loads system variable from the past sessions. 
#^ Save-Globals    = Saves all system variables for loading later.
#^ Program-Updated =









# Update-Globals = Updates system variables
# Code-Profile   = 

#>

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

function logo() { 
    <# loads the basic logo to page #>
    "This function is not ready in this release..."
    wait 2
    "Please update and try again."
    wait 1
    "If you are running the latest version it may be a locked feature."
    wait 1
    "For more information go to: "
    wait 1
    "www.github.com/coffeeiscode"
}

function title() {
}

$hist = Get-History;
function save-history() {
    
}

function title($str) {
    <# Changes the window title #>
    if ($null -ne $str) { $host.ui.RawUI.WindowTitle = $str; } #if not null update to something else
    "ProFile $app.version - PowerShell Addon Loaded!"
    "Created by: CoffeeIsCode"
    $host.ui.rawui.windowTitle = $app.title + " - Ver " + $app.version + " Status: " + $app.status;
} title;




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
    #! CMD command required!
}
function add($name) {
}

function log($type, $mode) { }

# check time and record total runtime
function update-timeCheck() {
    $uptime = Get-Uptime;
    $uptime.formated = $uptime.Hours + ":" + $uptime.Minutes + ":" + $uptime.Seconds;
}

function get-runCount() {
    if (test-path $file.runcount) { 
        <# Runcount file exists#> 
        $runCount = type $file.runcount; 
        $runCount = $runCount + 1; 
        $system.runcount = $runCount; 
        $system.runcount > $file.runcount; 
    }
}

### FUNCTIONS ADDED ###
function google($url) { Start-Process chrome.exe "$url" }

function edge($url) { Start-Process edge.exe - $url }
### SETTINGS ###
$settings = @{
    # Display
    width          = 25;
    height         = 80;
    mode           = "normal" # Maximum or minimum also valid
    runHost        = "true" # have runHost in the background if not system doesn't check status
    cycleTime      = 60 # how many seconds before system checks to see if still running. 5 seconds or less may use a lot of resource.  
    username       = "CoffeeIsCode", "Handsome", "Mr. Developer", "Master" # As many as you want to follow this pattern. System will choose at random using the system hash codes.
    gender         = "false"
    fontColor      = "" <# #>
    theme          = "Coffee" <# Theme overrights font color. Leave as "" or "false" or "none" if not required #>
    firstRun       = "check" <# Check if this is first run #>
    hash1          = "A12DK3AD827"
    hash2          = "UTY67542JI7"
    settingsFile   = "settings_001.config"
    systemFile     = "system_001.config"
    installProFile = "" <# yes, no, true or false are all valid #>
    maxThreads     = 2 <# Only increase with higher resource machine 1-2 threads per core is the best standard. #>
    checkUpdates   = "false" <# if true system only updates apps that are installed #>
    systemScan     = "main" <# main if software is to scan your computers system. true if this is main, false if not. #>;
    mainDevice     = "check"; <# check asks you if this is your computer. True and False are also valid. #>
    debugMode      = $false;
    index          = "check"
    indexPriority  = "normal" # slow, medium, fast, max are all valid.
};

function setVocal() {
    $v = type.$vocalFile;
    $lines = 0;
    $max = $v.Count
    $phraseStart = "#l";
    $phraseType = "greeting", "ask", "response"
    while ($lines -lt $max) {
        $line = $v[0];
        $l2 = $line[0] + $line[0]; # simple check
        if ($l2 -eq "<#") { "no.." } 
        elseif ($l2 -eq "<v") {
            <# Action when this condition is true #>
        
        } 
        $lines = $lines + 1
    }
}

function choice($question, $mode, $a1, $a2, $a3) {

}



function greeting() {
    "Hello there how are you doing today?"
}

function load($status, $activity, $seconds, $percent) {
    if ($null -ne $seconds) {
        <# if seconds is valid #> 
        cls
        "Please wait."
        Write-Progress -Status $status -Activity $activity -SecondsRemaining $seconds

    }
    elseif ($null -ne $percent) {
        <# if percent is valid #> 
        cls
        "Please wait."
        Write-Progress -Status $status -Activity $activity -PercentComplete $percent
    }
}

function cleanDesktop() {
    "Checking file types on the desktop..."
    
}

function set-settings() {}

#!#####################################################
#!  WARNING - DO NOT MAKE CHANGES TO THIS SCRIPT      #
#!                                                    #
#!  Making changes may cause all kinds of  problems   #
#!  to your device.                                   #
#!#####################################################

#* Application Globals #
$app = @{creator = "CoffeeIsCode"; Version = "2.2.2"; functions = 0; variables = 0 };

#* Script Variables #
$uptime = @{}; $uptime = Get-Uptime; $uptime.formated = $uptime.TotalHours + ":" + $uptime.TotalMinutes + " : " + $uptime.TotalSeconds;
$program = @{};
$task = @{ list = @{}; name = @{} }

$desktop = "$env:userprofile/desktop";

$path = @{ desktop = $desktop; }

$file = @{ updateLog = "$env:userprofile/desktop/Update.log" };

#! Should look into an encryption method to store data securly #

$index = @{
    <# Get different types of files and store them here #>
    <# Also be sure to check file hashes for duplicate files. #>
};
$system = @{username = $env:USERNAME; computername = $env:COMPUTERNAME }

function firstIndex() {
    Set-Location $env:windir;
    cd...
}

function anyType($p, $a, $b, $c, $d) {
    <# Something to work on later when working on a command system loop model. #>
    if ($p -eq 0) { "Hello there!" }
    $input = Read-Host;
    if ($input -ne $null) { "..." }
}

function wipe() { 
    "ProFile is going to safely wipe this terminal."; "Press CTRL+C to cancel."; sleep 2; cls; clear-history; "History from terminal erased."; sleep 1; "Go code something amazing!"; "Like you just did but with more parameters, variables and functions..."; sleep 1; "or whatever...."; sleep 3; cls; Clear-History 
}

function update-globals() {

}
update-globals;

function ask($mode, $str) {
    if ($mode -eq 'program-updates') {
        "$str"    
    }
}

function check-online() {
    <# check if device is on the internet #>
    "Checking to see if $system.computername is connected to the internet."
    $pong = ping 8.8.8.8;
    $p = $pong[8].Split(" = ");
    $result = $p[2][0];
    if ($result -gt 0) { $app.isOnline = $true; "This device is connected to the internet." } else { $app.isOnline = $false; "This device is having trouble connecting to the internet."; "Please try again later."; }
}

function get-program-updates() {
    <#* Program Updates #>
    "ProFile is now going to check for outdated programs."; "This may take a minute.";
    $program.update = winget update;
    $count = $program.update.count;
    $updates = $program.update[$count - 1];
    $program.pending = "There are $updates";
    $program.update > $file.updateLog;
}
if ($app.mode -eq 'debug') { get-program-updates } else { ask program-updates }


### GLOBAL VARIABLES ###
$app = @{title = "ProFile"; version = "2.2.3"; status = "Trial"; debug = $true; copyright = "Copyright (c) 2022-2023 Caffeinated Software Systems - All Rights Reserved"; }
$task = @{}; $task.check = $false; 


$index = @{
    path    = @{};
    checked = @{};
    files   = @{};
    folders = @{};
    size    = @{};
    ext     = $file.ext;
};

$program = @{};
$task = @{};

function get-drives() {    
    $drive.all = Get-Volume;
};
    

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



function start() {
    ;
    "ProFile $app.version - PowerShell Addon Loaded!"
    "Created by: CoffeeIsCode"
    $host.ui.rawui.windowTitle = $app.title + " - Ver " + $app.version + " Status: " + $app.status;
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



function add($name) {
}

function log($type, $mode) { }

# check time and record total runtime
function update-timeCheck() {
    $uptime = Get-Uptime;
    $uptime.formated = $uptime.Hours + ":" + $uptime.Minutes + ":" + $uptime.Seconds;
}

function get-runCount() {
    if (test-path $file.runcount) { 
        <# Runcount file exists#> 
        $runCount = type $file.runcount; 
        $runCount = $runCount + 1; 
        $system.runcount = $runCount; 
        $system.runcount > $file.runcount; 
    }
}

### FUNCTIONS ADDED ###
function google($url) { Start-Process chrome.exe "$url" }

function edge($url) { Start-Process edge.exe - $url }
### SETTINGS ###
$settings = @{
    # Display
    width          = 25;
    height         = 80;
    mode           = "normal" # Maximum or minimum also valid
    runHost        = "true" # have runHost in the background if not system doesn't check status
    cycleTime      = 60 # how many seconds before system checks to see if still running. 5 seconds or less may use a lot of resource.  
    username       = "CoffeeIsCode", "Handsome", "Mr. Developer", "Master" # As many as you want to follow this pattern. System will choose at random using the system hash codes.
    gender         = "false"
    fontColor      = "" <# #>
    theme          = "Coffee" <# Theme overrights font color. Leave as "" or "false" or "none" if not required #>
    firstRun       = "check" <# Check if this is first run #>
    hash1          = "A12DK3AD827"
    hash2          = "UTY67542JI7"
    settingsFile   = "settings_001.config"
    systemFile     = "system_001.config"
    installProFile = "" <# yes, no, true or false are all valid #>
    maxThreads     = 2 <# Only increase with higher resource machine 1-2 threads per core is the best standard. #>
    checkUpdates   = "false" <# if true system only updates apps that are installed #>
    systemScan     = "main" <# main if software is to scan your computers system. true if this is main, false if not. #>;
    mainDevice     = "check"; <# check asks you if this is your computer. True and False are also valid. #>
    debugMode      = $false;
    index          = "check"
    indexPriority  = "normal" # slow, medium, fast, max are all valid.
};

function choice($question, $mode, $a1, $a2, $a3) {
}

function greeting() {
    "Hello there how are you doing today?"
}

function load($status, $activity, $seconds, $percent) {
    if ($null -ne $seconds) {
        <# if seconds is valid #> 
        cls
        "Please wait."
        Write-Progress -Status $status -Activity $activity -SecondsRemaining $seconds
    }
    elseif ($null -ne $percent) {
        <# if percent is valid #> 
        cls
        "Please wait."
        Write-Progress -Status $status -Activity $activity -PercentComplete $percent
    }
}

function cleanDesktop() {
    "Checking file types on the desktop..."
    
}

function set-settings() {}

#!#####################################################
#!  WARNING - DO NOT MAKE CHANGES TO THIS SCRIPT      #
#!                                                    #
#!  Making changes may cause all kinds of  problems   #
#!  to your device.                                   #
#!#####################################################

#* Application Globals #
$app = @{creator = "CoffeeIsCode"; Version = "2.2.2"; functions = 0; variables = 0 };

#* Script Variables #
$uptime = @{}; $uptime = Get-Uptime; $uptime.formated = $uptime.TotalHours + ":" + $uptime.TotalMinutes + " : " + $uptime.TotalSeconds;
$program = @{};
$task = @{ list = @{}; name = @{} }

$desktop = "$env:userprofile/desktop";

$path = @{ desktop = $desktop; }

$file = @{ updateLog = "$env:userprofile/desktop/Update.log" };

#! Should look into an encryption method to store data securly #

$index = @{
    <# Get different types of files and store them here #>
    <# Also be sure to check file hashes for duplicate files. #>
};
$system = @{username = $env:USERNAME; computername = $env:COMPUTERNAME }

function update-globals() {
    $app.program = $program;
    $app.task = $task;
    $app.file = $file;
    $app.path = $path;
    $app.index = $index;
    $app.sytem = $system;
    $app.uptime = Get-Uptime;
    $app.system.uptime = Get-Uptime;
}
update-globals;

function ask($mode) {
    if ($mode -eq 'program-updates') {
        "Would you like to check to see if any of the software on your system is outdated?"
    }
}

function check-online() {
    <# check if device is on the internet #>
    "Checking to see if $system.computername is connected to the internet."
    $pong = ping 8.8.8.8;
    $p = $pong[8].Split(" = ");
    $result = $p[2][0];
    if ($result -gt 0) { $app.isOnline = $true; "This device is connected to the internet." } else { $app.isOnline = $false; "This device is having trouble connecting to the internet."; "Please try again later."; }
}

function get-program-updates() {
    <#* Program Updates #>
    "ProFile is now going to check for outdated programs."; "This may take a minute.";
    $program.update = winget update;
    $count = $program.update.count;
    $updates = $program.update[$count - 1];
    $program.pending = "There are $updates";
    $program.update > $file.updateLog;
}
if ($app.mode -eq 'debug') { get-program-updates } else { ask program-updates }

### GLOBAL VARIABLES ###
$app = @{title = "ProFile"; version = "2.2.3"; status = "Trial"; debug = $true; copyright = "Copyright (c) 2022-2023 Caffeinated Software Systems - All Rights Reserved"; }
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
    desktop        = $desktop; 
    user           = $user; 
    winroot        = $env:windir;
    pictures       = $pictures; 
    pics           = $pictures;
    profileRoot    = $profileRoot; # profile path
    programFiles   = $programFiles;
    pf             = $pf;
    pf32           = $pf32;
    programFiles32 = $programFiles32;
    winSys32       = '$env:windir/System32/'; 
    OneDrive       = $env:OneDrive;
};
$file.ext = "exe", "dll";

$index = @{
    path    = @{};
    checked = @{};
    files   = @{};
    folders = @{};
    size    = @{};
    ext     = $file.ext;
};


$program = @{};
$task = @{};

function get-tasks() {
    $task.list = tasklist;
    $task.taskCount = $task.list.count;
    if ($task.taskCount -ge 150) { "There are too many programs running on your system at once. " }
    $task.memory = @{};
}
$drive = @{};

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

#* GLOBAL VARIABLES ENDS ###


function checker() {
    # check each file
    #^ Only checks ProFile, but it should check every file.
    
    $c = 0;
    $m = $file.count;
    if (Test-Path $file.profile) {
        "ProFile is currently installed on this system.";
        #! Should check the version and update if needed #
    }
    else {
        # ProFile doesn't exist on this system
        #^ Build an installer for ProFile
        #& Maybe use the cmd installer, but export it from the ProFile script
    }
}


<# NOTES COLOR CODES
## ====================
#* COMPLETED IMPORTANT 
## GOOD WORK DETAILS
#! BROKEN AND NEEDS WORK
#? CONCEPT OR IDEA TO BRAINSTORM
#& REQUIRED UPDATING


#* Update-Globals  = Updates important globals;

#^ Load-Globals    = Loads system variable from the past sessions. 
#^ Save-Globals    = Saves all system variables for loading later.
#^ Program-Updated =









# Update-Globals = Updates system variables
# Code-Profile   = 

#>

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






function logo() { 
    <# loads the basic logo to page #>
    "This is not ready in this release..."
    wait 2
    "Please update and try again."
    wait 1
    "If you are running the latest version it may be a locked feature."
    wait 1
    "For more information go to: "
    wait 1
    "www.github.com/coffeeiscode"
}

function save-history() {
    <# Function to save all history from terminal to desktop. #>
    $history = Get-History;
    $history = $history | select CommandLine > $path.desktop/history.ps1;
    "History was saved to desktop as history.ps1"
}

function start() {
    ;
    "ProFile $app.version - PowerShell Addon Loaded!"
    "Created by: CoffeeIsCode"
    $host.ui.rawui.windowTitle = $app.title + " - Ver " + $app.version + " Status: " + $app.status;
}

function loadBreak($seconds) {
    clear-host;
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
    #! CMD command required!
}
function add($name) {
}

function log($type, $mode) { }

# check time and record total runtime
function update-timeCheck() {
    $uptime = Get-Uptime;
    $uptime.formated = $uptime.Hours + ":" + $uptime.Minutes + ":" + $uptime.Seconds;
}

function get-runCount() {
    if (test-path $file.runcount) { 
        <# Runcount file exists#> 
        $runCount = type $file.runcount; 
        $runCount = $runCount + 1; 
        $system.runcount = $runCount; 
        $system.runcount > $file.runcount; 
    }
}


function edge($url) { Start-Process edge.exe - $url }


# NEEDS WORK
function check($a, $b, $c) {
    if ($b -eq "==") {
        // is equal
        if ($a -eq $c) {

        }
    }

}


function checkIndex() {
    if (test-path $file.indexFile) {} else {}
}

function buildIndex() {
}


$system = @{username = $env:USERNAME; computername = $env:COMPUTERNAME }; $app.system = $system;

<# Update after globals are called #>
function update-globals() {
    $app.program = $program;
    $app.task = $task;
    $app.file = $file;
    $app.path = $path;
    $app.index = $index;
    $app.sytem = $system;
}
update-globals;


### FINISHED FUNCTIONS ###

function program-updates() {
    <# * Program Updates could be expanded appon #>
    "ProFile is now going to check for outdated programs."; "This may take some time.";
    $program.update = winget update;
    $count = $program.update.count;
    "There were a total of $count update(s)"; wait 3;
    $updates = $program.update[$count - 1];
    $program.pending = "There are $updates";
    "$program.pending"
}

function check-online() {
    <# check if device is on the internet #>
    "Checking to see if $system.computername is connected to the internet."
    $pong = ping 8.8.8.8;
    $pong2 = $pong[8].Split(" = ");
    $result = $pong2[2][0];
    if ($result -gt 0) { 
        $app.isOnline = $true; 
        "This device is connected to the internet." 
    }
    else { 
        $app.isOnline = $false; 
        "This device is having trouble connecting to the internet."; 
        "Please try again later.";  
    }
}

function wait($t) {
    if ($t -eq $null) { Start-Sleep 2 }
    if ($t -eq 1) { Start-Sleep 1 }
    if ($t -eq 4) { Start-Sleep 4 }
    if ($t -eq 3) { Start-Sleep 3 }
    if ($t -eq "short") { timeout 2 }
    if ($t -eq "s") { timeout 2 }
    if ($t -eq "long") { timeout 10 }
    if ($t -eq "l") { timeout 10 }
}

function echo($str) {
    clear-screen;
    "$str"
}

function debugMode() {

    # Positive Testing
    if ($app.debugMode -eq "true" -or $true -or "yes") { program-updates }
    if ($app.devMode -eq "true" -or $true -or "yess") { clear-host; echo "Dev Mode: ON"; sleep 2; echo "Checking program updates"; sleep 1; program-updates }

    # Negitive Testing
    if ($app.debugMode -eq "false" -or $false -or "no") { <# DEBUG MODE OFF #> }
    if ($app.devMode -eq "false" -or $false -or "no") { <# DEV MODE OFF #> }
}
debugMode

function check-online() {
    <# check if device is on the internet #>
    "Checking to see if $system.computername is connected to the internet."
    $pong = ping 8.8.8.8;
    $p = $pong[8].Split(" = ");
    $result = $p[2][0];
    if ($result -gt 0) { $app.isOnline = $true; "This device is connected to the internet." } else { $app.isOnline = $false; "This device is having trouble connecting to the internet."; "Please try again later."; }
}

$time.end = Get-Date;
function timeDiff() {
    $time.diff = $time.end - $time.start;
}
timeDiff;

function loadData() {
    if (test-path $env:USERPROFILE/userdata.dll) {
        "User data file was found loading now."; wait 3;
    }
    else {
        "User data file was not found."; wait 1;
        "Saving new userdata file."; wait 2;
    }
}


function flash() {
    "BANG";
}

$player = @{score = 0; name = ""; hp = 100; memory = 0; };

function minigameOption($a, $b, $c) {

    $a = $a.tolower();
    if ($a -eq "help") { 
        "You ask the operator for help, but he is stuck looking at you through a small black window, but can't see you." 
    }

    minigameRandom

}

function minigameBad() {
    $r = Get-Random;
    if ($r[1] -eq 0) {}
    if ($r[1] -eq 1) {}
    if ($r[1] -eq 2) {}
    if ($r[1] -eq 3) {}
    if ($r[1] -eq 4) {}
    if ($r[1] -eq 5) {}
    if ($r[1] -eq 6) {}
}

function minigameRandom() {
    $r = Get-Random;
    $o = $r[1];
    if ($o -eq 0) { mini }

    if ($r[0] -ge 6) {
        "What you did helped you out"
    }
    else {
        ""
    }  
    
}

function minigameStory() {
    $r = Get-Random;
    $s = $r[1];
    
}

function minigameCycle() {
    "You wake up in a forest and have no memory of how you got there.";
    minigameOption;


}

# ProFile.ps1
# Developed by: CoffeeIsCode
# Copyright (C) 2023 - Caffeinated Software Systems
$App = @{};
$PF = $App;

<# Settings #> $settings = @{};
# Only make changes to the beginning of this file if you 
# understand what it is exactly you are making changes to. #>
# Improper changes to the settings can cause serious damage to your machine.

<# Text color #> $settings.textColor = "white"; <# Options: red, orange, yellow, green, blue, purple, black, white, and much more. #>
<# Display size #> $settings.screen = { 
    width:"regular" <# Default width: regular#>
    height:"large" <# Default height: large#> 
}; <# Options (for both width and height): sm,small, m, med,medium,reg,regular, l, large, xl, xlarge, m, mega #>
<# History file line count (total amount of data PowerShell saves to file.) #> 
$settings.MaximumHistoryCount = 30000; <# 30000 is current program default, 4096 is windows default. This doesn't cause problems unless the computer you are using has low computer specs. #>

<# Username #> $settings.username = "" 
<# Password #> $settings.password = "" <# Remember this get encrpyted and overwrites this file for security #>
# If you want to change the password more securly type: "protect" or "users".

<#
# WARNING: DO NOT MAKE CHANGES PAST THIS POINT! 
# Making changes can cause serious problems to your machine.
#>               $pf.settings = @{}; $pf.settings.username = $settings.username; $pf.settings.password = $settings.password;

function userpass() {
    "So it looks like you want to make some changes to your account. What would you like to change?"
    if (Test-Path $userpassdata) { "There is already a Username and Password set in this system. " } else {} "1. Username and Password"
}

function setpass() {
    $pf.password
}
$userpassdata = "$env:USERPROFILE/" <# Need to make a safe location to story username and password data. #>

# Globals / Local Variables
$pf = @{}; # aray to store all the programs information.
$pf.settings = $settings; # copy settings to main variable.

# Globals
$pf.install_checked = $false
$pf.settings = $settings
$pf.title = "ProFile.ps1"
$pf.creator = "Created by CoffeeIsCode"
$pf.firstrun = ""
$pf.copyright = "Copyright (C) 2023 - Caffeinated Software Systems - All Right Reserved"
$pf.firstrun_checked = $false

$pf.update = 6;
$pf.revision = 2;
$pf.build = 1;
$pf.version = "1.0.5" # ProFile applicaion version

$system = @{}; $pf.system = $system;
function get-system() { 
    $pf.pcName = $env:COMPUTERNAME # get computer name.
    $pf.username = $env:USERNAME;
} get-system

function get-advanced-system() {
    "Collecting more system information."; "Please wait."; " "
    $system.systeminfo = systeminfo.exe # get all system information.
} 

function update-appdata() {
    "Updating the application data."; wait 1; "Please wait."; 
    $pf.dataFile = 
    wait 3; "Almost done."; wait 2;
}

function pop() { Start-Process explorer .\ }

function open-onenote() {
    Set-Location "$env:USERPROFILE\AppData\Local\Microsoft\OneNote\"
    $d = Get-ChildItem -Name -Directory
    Get-ChildItem $d[0];
}

function open($dir) {
    # Function for opening folders quickly in explorer.
    if ($null -eq $dir) { Start-Process explorer .\ } # if directory is empty then open the current root.
    if ($dir -eq "desktop" -or "desk") { Set-Location "$env:USERPROFILE/Desktop/"; open }
}

function download($name) {
    $pf.appSearch = winget search $name # check to see if there are any results for the program
    if ($pf.appSearch[0] -ne $null) {}
}

$programs = @{};
function programs() {
    $programs.list = winget list
    $programs.listed = winget listwing
}

function update-system() {
    'Updating powershell internal help files'
    update-help
    'Getting list of installed programs'
    $system.programs
}

function clear-history-file() {
  
}

function downer($time) {
    shutdown /f /s /t $time
}

function bye() { downer 0 }

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
    wait 7; 
    exit; 
}

function search-file() {
}

function search($str) { 
    # function to search the whole computer for a file or contents of a file.
    "Starting search for $str"; " "
    "Part 1: File named $str";
    Get-ChildItem -Recurse -name -file -Path "C:/" | findstr "$str"
}

$index = @{}; 
$PF.index = $index;
$index.folders = @{}; $index.files = @{};
$index.c = @{};
$index.folderCount = 0; $index.fileCount = 0;

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
$build = 1; $b = $build; $pf.build = $build;
$revision = 0; $r = $revision; $pf.revision = $revision;
$update = 1; $u = $update; $pf.update = $update;
$version = "$b.$r.$u"; 
$pf.version = $version;

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

function inpu($prompt, $secure) { 
    <# Useful function that can be used for command model later #>
    if ($null -eq $prompt) { $in[$in.count] = Read-Host; return }
    if ($secure -eq $true) { secure-input "$prompt" } else {
        if ($prompt -eq $null -or $prompt -eq 'undefined' -or $prompt -eq $false) { 
            $in[$in.count] = Read-Host
            return
        }
        else {
            $in[$in.count] = Read-Host -Prompt "$prompt"
            return
        }
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
    #should be used to grab simple dirs and build a rough map.
    $index.c = Get-ChildItem -name -Directory -path "C:/";
    $dc = $i.d.count;
    $dl = @{};
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
    $pf.firstrun_checked = $true;
    if (Test-Path $path.install) {
        # Not first run
        $pf.firstrun = $false
        return 
    }
    else {
        # First Run Install
        $pf.firstrun = $true 
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
$PF = @{}; $pf = $PF; # aray to store all the programs information.
$PF.settings = $settings; # copy settings to main variable.


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


$PF = @{}; 
if ($null -eq $app) { <# App wasn't assigned #> $App = @{}; $PF = $App; } else { <# App was assigned #> }
$PF.Copyright = "Copyright (c) 2023 - Caffienated Software Systems - All Rights Reserved."
$PF.Title = "ProFile"
$app.Version = { update=1; build=1; revision=0 };

$Path = @{}; $PF.Path = $Path;
$Path.desktop = "$env:USERPROFILE/Desktop";

function save() {

}

<# Asks the user a question #>
function ask($q) {
    # asks the user a question
    if ($null -eq $q) {
        $answer = Read-Host;
        response($answer);
    }
    else {
        $answer = Read-Host -prompt "$q"
        reponse($answer);
    }
}

function hr() {}
function br() {}

function get-name() {
    "Hello and welcome to ProFile"; 
}

function get-apps() {
    "ProFile is now going to check your applications."
    $App.List = winget list;
    $PF.AppList = $App.List;
    $PF.AppCount = $App.count - 10;
}

function get-app-updates() {
    $App.Updates
}

function a($q) {
    if ($null -eq $q) { "The question cannot be left empty. Please try again. Please try again."; } else {
        $answer = Read-Host -prompt "$q"  
    }
}

function question($question, $answer, $a, $b, $c, $d) {
    $q = $question; 
    $answer = read-host -prompt "$q"
    # check
    if ($answer -eq $a) {}
    if ($answer -eq $b) {}
    if ($answer -eq $c) {}
    if ($answer -eq $d) {}

}

function response($answer) {
    if ($null -eq $a) { "Your response was not understood... Please try again"; } <# If the answer is empty. #>
    # Desktop
    if ($answer -eq "desk" -or "Desk" -or "Desktop" -or "desktop") { Set-Location "$env:USERPROFILE/Desktop"; }
    
}

function desktop() {
    Set-Location "$env:USERPROFILE/Desktop";
    Clear-Host
    get-childItem -Name
}

function clean($dir) {
    if ($null -eq $dir) { <# Clean this dir #> } else {
        Set-Location $dir; <# Clean this location #>
    }
}

function question($question, $answer, $a, $b, $c, $d) {
    $q = $question; 
    $answer = read-host -prompt "$q"
    # check
    if ($answer -eq $a) {}
    if ($answer -eq $b) {}
    if ($answer -eq $c) {}
    if ($answer -eq $d) {}

}

<#
TIMER SHOULD BE MERGED TO THE MAIN PROFILE.PS1
#>

# Check to see if the variables have been assigned already
if ($null -eq $App) { $App = @{}; $time = @{}; } else {  }
# check to see time.start is already running.
if ($null -eq $time.start) { <# There's already a start time #> } else { $time.start = @{}; <# Creat a start time#> }
$time.current = @{};
$app.time = $time;




function add-file-sizes() {
    $dataSize = 0;
    for ($x = 3; $x -le $f.count; $x++) {
        
        if ($f[$x].Length -eq 0) { "Zero" } else {
            $new = $f[$x].Length
            
            $dataSize + $new
            
            "Size was $new of new file making the total $dataSize"
        }
    }
}

<# Check to see time data stored #>
function set-time-file() {
    if (Test-Path $path.System) { <# File exists #> } else { <#File doesn't exist#> }
}

function runcount() {
    if (test-path $path.Profile/sync.dll) {  }
}

function startTimer() {

}

function start-timer() {
    $time.all = Get-Date; # store all the info in all
    $time.day = Get-Date -Format "dddd" # gives day like 'Friday'
    $time.hour = Get-Date -Format "hh";
    $time.min = Get-Date -Format "mm";
    $time.sec = Get-Date -Format "ss";
    $time.month = Get-Date -Format "MM";
    $time.day = Get-Date -Format "dd";
    $time.year = Get-Date -Format "yyyy";
    
    <# Alternate methods to get date information 
        $time.unformated = get-date -Format "d"
        $time.split = $time.unformated.Split('-');
        $time.year = $time.split[0];
        $time.month = $time.split[1];
        $time.day = $time.split[2];
    #>
}

function update-time() {
    # time.new is to be checked against start time
    $time.new = @{};
    $time.new.day = Get-Date -Format "dddd" # gives day like 'Friday'
    $time.new.hour = Get-Date -Format "hh";
    $time.new.min = Get-Date -Format "mm";
    $time.new.sec = Get-Date -Format "ss";
    $time.new.month = Get-Date -Format "MM";
    $time.new.day = Get-Date -Format "dd";
    $time.new.year = Get-Date -Format "yyyy";
}

function date-formating-example() {
    Get-Date -Format "dddd MM/dd/yyyy HH:mm K"
}















<# MAIN START#>
function start() {
    get-tasks
}
start 