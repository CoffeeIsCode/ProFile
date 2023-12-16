<#
    ProFile - Version: 2.2.6
    Created by: CoffeeIsCode
    Updated: Dec, 15, 2023    
#>

# NOTES COLOR CODES
# ====================
#* Section start and titles.
## Comments and work details
#^ To be worked on later, interesting.
#! Warning, broken or needs work.
#? Concept, information or idea to brainstorm.
#& Debuging or needs to be updated or moved.

#^ SETTINGS #
#? Get settings from saved file that user can edit?
Clear-Host #& Clear-Host right from the beginning. 

#* TIME #
$time = [ordered]@{ start = Get-Date; end = $null; }; 

#* GLOBALS #
$app = @{};
$app.appList = @{};
$app.time = $time;
$app.title = "ProFile";
$app.status = "Starting";
$app.debug = $false; #^ DEBUG MODE BOOLEAN FOR LATER.
$task = @{ list = @{}; name = @{} }; $app.task = $task;
$path = @{}; $app.path = $path;
$system = @{}; $sys = $system;
$sys.username = $env:USERNAME;
$file = @{}; $app.file = $file;
$file.indexFile = "$env:userprofile/index.log"; #! make better spot for file?
$file.filetype = "exe", "dll"; #^ Needs more file types.
$index = @{}; $app.index = $index;
$index.checked = $false; 
#& $index.exists = checkIndex;

#* RAW LOCATIONS #
$user = $env:userprofile;
$desktop = "$env:userprofile/Desktop"; 
$pictures = "$env:userprofile/pictures"; 
$music = "$env:USERPROFILE/music/";
$documents = "$env:userprofile/documents"; 
$OneDrive = "$env:userprofile/OneDrive/";
$programFiles = $env:ProgramFiles; $pf = $programFiles;
$profileRoot = "$env:userprofile/documents/powershell/";
$programFiles = $env:ProgramFiles; 
$programFiles32 = "${env:ProgramFiles(x86)}"; $pf32 = $programFiles32;
$system32 = "$env:dir/system32/";

#* PATH LOCATIONS #
# Pointers to Raw Locations
#? Put them into lines above in future versions.
$path.documents = $documents;
$path.pictures = $pictures;
$path.music = $music;
$path.OneDrive = $OneDrive;
$path.ProFileRoot = $profileRoot;
$path.desktop = $desktop; 
$path.user = $user; 
$path.winroot = $env:windir;
$path.programFiles = $programFiles;
$path.pf = $pf;
$path.pf32 = $pf32;
$path.system32 = $system32;
$path.windows = $env:windir;
# ProFile paths.
$path.ProFile = "$env:USERPROFILE/Desktop/ProFile/"
$path.systemFile = "$env:USERPROFILE/Desktop/ProFile/systemdata.dll";
$path.userdata = "$env:userprofile/userdata.dll";
$file.systemFile = "$env:USERPROFILE/Desktop/ProFile/systemdata.dll";
$file.indexFile = "$env:userprofile/index.log"

#* Index, Task, Folder and Drive  #
$index = @{path = @{}; checked = @{}; files = @{}; folders = @{}; size = @{}; ext = $file.ext; }
$drive = @{ checked = @{}; size = @{} };
$task = @{};

#* FUNCTIONS #
# br
# get-tasks
# cmd($com)
# about
# checker
# code-profile
# update-globals
# task($op)
# loadBreak

function br() { " " };

function get-tasks() {
    $task.list = tasklist;
    $task.taskCount = $task.list.count;
    if ($task.taskCount -ge 150) { "There are too many programs running on your system at once. " }
    $task.memory = @{};
}
function sort() {
    # file clean-up processs.
    #& sort files by filetype within main folder.
    #? Asks if files should be moved to user folders.
    #? Keeps a log of all moved folders
}

function cmd($com) {
    if (Test-Path $env:userprofile/temp.cmd) { 
        erase $path.tempCMD
    }
    $com > $env:userprofile/temp.cmd 
    #! CMD command required!
}

function get-apps() { $pf.appList = winget list }

function code-profile() { code $profile; } # open vscode with profile file.

function about() {
    # output about
    "+===========================================================+"
    "    What's New in 2.2.6"
    "+===========================================================+"
    "[x] - Major bug fixes";
    "[x] - Mixed set of differen't functions that have been added."
    "[ ] - Combined multiple starting points into one file."
    ""
}

function checker() {
    <# check files from path as well as installation files. #>
    #^ Checks ProFile, but it should check every file.

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
    $app.uptime = Get-Uptime;
    $app.system.uptime = Get-Uptime;
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

function loadBreak($seconds) {
    clear-host;
    $remaining = $seconds;

    while ($remaining -gt 0) {
        Clear-Host
        Write-Progress -Status "Status" -Activity "Activity" -SecondsRemaining "$remaining";
        $remaining = $remaining - 1;
        start-sleep 1; 
    }
}
