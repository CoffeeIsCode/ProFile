#* Organize-Drive
#~ Version: 1.0.2
#
# 1.0.2 Updates were posted to ChangeLog.md
#
# A part of the ProFile PowerShell Addon
# Developed by: CoffeeIsCode
#
# Check out the open source project at: 
# www.GitHub.com/CoffeeIsCode/ProFile/
#

$Organize = @{
	Version=@{
		Build=1;
		Revision=0;
		Update=1
	}
	Updates=@{
		0="Basic idea and stucture."
		1=""
	}
}

$logFile = Join-Path -Path $drivePath -ChildPath "$env:userprofile/CIC/Organization.log"

if (test-path "$env:temp/Organization.log") {
	erase "$env:temp/Organization.log"
}
function Log-Message {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logFile -Value "$timestamp - $message"
    Add-Content -Path "$env:temp/Organization.log" -Value "$timestamp - $message"
}

$drivePath = Read-Host "Enter the path to the drive you want to organize"

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Clear-Host
	Write-Host -foregroundColor red "WARNING:"
	Write-Host -foregroundColor red "This PowerShell terminal is running without administrator priveleges and may have unexpected resualts."
    Write-Host -foregroundColor red "You can continue to use this program, but it is highly recommended that you open PowerShell as an administrator if possible. "
	timeout /t 15
	start-process PowerShell -verb runas
}

$welcome = @"
Welcome to ProFile Organized-Drive Powershell script. 
With this script you're able to Organize all of the 
files on a removable drive or the host drive. in event 
that there is an issue you can use the log to recover 
files and folders to their original places. 

Comming Soon
[ ] - Automatic recovery in the even of an Issue.
[ ] - Shows Pre-Log of the changes that are 
"@

$termsOfService = @"
Terms of Service:
1. This script will organize your files and folders in many differnt ways and all actions performed will be logged so that in the even something goes wrong you can revert your system back to normal.
2. Diagnostic data and logs may be collected from random clients to develop updates that are optimized for performance with features that will work on all machines.
3. By proceeding to use this software, you agree to these terms.

Do you agree to the terms of service? (Y/N)
"@
if (!(test-path "$env:userprofile/CIC/ToS.txt")) {
	$agreement = Read-Host $termsOfService	
	if ($agreement -ne "Y") {
		Write-Host -foregroundColor red "You did not agree to the terms of service. Exiting script."
		timeout /t 15
	}	 
	
	if ($agreement -eq "Y") {
		md "$env:userprofile/CIC/"
		if (!(test-path "$env:userprofile/CIC/")){
			Log-Message "There was an issue trying to create a folder at $env:userprofile/CIC/ and script can not continue."
		} else {
			
		Log-Message "CIC folder was created on $env:computername by $env:username"
		}
		Push-Location "$env:userprofile/CIC/"
		$termsOfService > "$env:userprofile/CIC/ToS.txt"
		$termsOfService > "$env:temp"
		
		$datestamp = Get-Date -Format "MMMM d yyyy"
		$timestamp = get-date -Format "hh:mm:ss"
		Log-Message "Terms of Service Agreement was agreed to by $env:username on device named $env:computername on $datestamp at $timestamp and stored at $env:temp"
		Pop-Location
	}
}

$folders = @{
    "Documents" = @("*.txt", "*.doc", "*.docx", "*.pdf", "*.xls", "*.xlsx", "*.ppt", "*.pptx", "*.odt", "*.ods", "*.odp")
    "Images" = @("*.jpg", "*.jpeg", "*.png", "*.gif", "*.svg", "*.webp", "*.jfif", "*.bmp", "*.tiff")
    "Audio" = @("*.mp3", "*.wav", "*.flac", "*.aac", "*.ogg", "*.wma")
    "Videos" = @("*.mp4", "*.avi", "*.mkv", "*.mov", "*.wmv", "*.flv")
    "Archives" = @("*.zip", "*.rar", "*.7z", "*.iso", "*.tar", "*.gz")
    "Executables" = @("*.exe", "*.cmd", "*.bat", "*.msi")
    "Scripts" = @("*.ps1", "*.sh", "*.py", "*.ipynb", "*.rb", "*.js", "*.php", "*.pl")
    "Installers" = @("*.msi", "*.exe")
    "WebFiles" = @("*.html", "*.css", "*.js", "*.crdownload", "*.php", "*.asp", "*.aspx")
    "Configuration" = @("*.xml", "*.json", "*.yaml", "*.yml", "*.ini", "*.cfg")
}

function Get-UniquePath {
    param (
        [string]$path
    )
    $counter = 1
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($path)
    $extension = [System.IO.Path]::GetExtension($path)
    $directory = [System.IO.Path]::GetDirectoryName($path)
    $newPath = $path

    while (Test-Path -Path $newPath) {
        $newPath = Join-Path -Path $directory -ChildPath "$baseName($counter)$extension"
        $counter++
    }
    return $newPath
}

foreach ($folder in $folders.Keys) {
    $folderPath = Join-Path -Path $drivePath -ChildPath $folder
    if (-not (Test-Path -Path $folderPath)) {
        New-Item -Path $folderPath -ItemType Directory
    }
}

$backupPath = Join-Path -Path $drivePath -ChildPath "backup_$(Get-Date -Format 'yyyyMMddHHmmss')"
Copy-Item -Path $drivePath -Destination $backupPath -Recurse
Log-Message "Backup created at $backupPath"

foreach ($folder in $folders.Keys) {
    foreach ($extension in $folders[$folder]) {
        Get-ChildItem -Path $drivePath -Filter $extension -Recurse | ForEach-Object {
            try {
                $destination = Join-Path -Path $drivePath -ChildPath $folder
                $destination = Get-UniquePath -path (Join-Path -Path $destination -ChildPath $_.Name)
                Move-Item -Path $_.FullName -Destination $destination -Force
                Log-Message "Moved $($_.FullName) to $destination"
            } catch {
                Log-Message "Error moving $($_.FullName): $_"
            }
        }
    }
}

Get-ChildItem -Path $drivePath -Filter "*.html" -Recurse | ForEach-Object {
    try {
        $htmlFile = $_
        $htmlContent = Get-Content -Path $htmlFile.FullName
        $linkedFiles = Select-String -InputObject $htmlContent -Pattern 'href="([^"]+\.css)"|src="([^"]+\.js)"' -AllMatches | ForEach-Object { $_.Matches.Groups[1].Value, $_.Matches.Groups[2].Value } | Where-Object { $_ }
        $destination = Join-Path -Path $drivePath -ChildPath "WebFiles"
        $destination = Get-UniquePath -path (Join-Path -Path $destination -ChildPath $htmlFile.Name)
        Move-Item -Path $htmlFile.FullName -Destination $destination -Force
        Log-Message "Moved $($htmlFile.FullName) to $destination"
        foreach ($linkedFile in $linkedFiles) {
            $linkedFilePath = Join-Path -Path $drivePath -ChildPath $linkedFile
            if (Test-Path -Path $linkedFilePath) {
                $linkedFileDestination = Join-Path -Path (Split-Path -Path $destination -Parent) -ChildPath (Split-Path -Path $linkedFile -Leaf)
                $linkedFileDestination = Get-UniquePath -path $linkedFileDestination
                Move-Item -Path $linkedFilePath -Destination $linkedFileDestination -Force
                Log-Message "Moved linked file $linkedFilePath to $linkedFileDestination"
            }
        }
    } catch {
        Log-Message "Error processing HTML file $($_.FullName): $_"
    }
}

$miscFolder = Join-Path -Path $drivePath -ChildPath "Miscellaneous"
if (-not (Test-Path -Path $miscFolder)) {
    New-Item -Path $miscFolder -ItemType Directory
}

Get-ChildItem -Path $drivePath -Directory | Where-Object { $_.Name -notin $folders.Keys } | ForEach-Object {
    try {
        Move-Item -Path $_.FullName -Destination $miscFolder -Force
        Log-Message "Moved directory $($_.FullName) to $miscFolder"
    } catch {
        Log-Message "Error moving directory $($_.FullName): $_"
    }
}

$emptyFolders = Get-ChildItem -Path $drivePath -Directory -Recurse | Where-Object { -not (Get-ChildItem -Path $_.FullName -Recurse) }
$emptyFolders | ForEach-Object {
    Log-Message "Empty folder found: $($_.FullName)"
}

if ($emptyFolders.Count -gt 0) {
	$emptyFoldersPath = "$env:temp/EmptyFoldersList.log"
	$emptyFolders > $emptyFoldersPath;
	Log-Message "EmptyFoldersList.log was created in $env:temp"
	$emptyFolders > "$env:userprofile/CIC/EmptyFoldersList.log"
	Log-Message "EmptyFoldersList.log was created in CIC folder"
	Clear-Host
	Write-Host -foregroundColor yellow "Some empty folders were found and the list of files was saved to"
    $confirmation = Read-Host "Do you want to remove empty folders? (Y/N)"
    if ($confirmation -eq "Y") {
        $emptyFolders | Remove-Item -Recurse -Force
        Log-Message "Empty folders removed"
    }
}
Log-Message "File and folder organization completed."
Write-Host "File organization completed. Check the log file at $logFile for details of the processes performed. ."