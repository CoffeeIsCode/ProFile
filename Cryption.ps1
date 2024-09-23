# Encryption Module

# Variables
$Encryption = @{}
$Decryption = @{}

function Get-KeyAndIV {
    param (
        [string]$Key,
        [string]$IV
    )
    if ($Key.Length -ne 16 -or $IV.Length -ne 16) {
        throw "Key and IV must be 16 characters long."
    }
    return [System.Text.Encoding]::UTF8.GetBytes($Key), [System.Text.Encoding]::UTF8.GetBytes($IV)
}

function Encrypt-Data {
    param (
        [string]$data,
        [byte[]]$Key,
        [byte[]]$IV
    )
    $aes = [System.Security.Cryptography.Aes]::Create()
    $aes.Key = $Key
    $aes.IV = $IV
    $encryptor = $aes.CreateEncryptor($aes.Key, $aes.IV)
    $ms = New-Object System.IO.MemoryStream
    $cs = New-Object System.Security.Cryptography.CryptoStream($ms, $encryptor, [System.Security.Cryptography.CryptoStreamMode]::Write)
    $sw = New-Object System.IO.StreamWriter($cs)
    $sw.Write($data)
    $sw.Close()
    return [Convert]::ToBase64String($ms.ToArray())
}

function Decrypt-Data {
    param (
        [string]$encryptedData,
        [byte[]]$Key,
        [byte[]]$IV
    )
    $aes = [System.Security.Cryptography.Aes]::Create()
    $aes.Key = $Key
    $aes.IV = $IV
    $decryptor = $aes.CreateDecryptor($aes.Key, $aes.IV)
    $ms = New-Object System.IO.MemoryStream([Convert]::FromBase64String($encryptedData))
    $cs = New-Object System.Security.Cryptography.CryptoStream($ms, $decryptor, [System.Security.Cryptography.CryptoStreamMode]::Read)
    $sr = New-Object System.IO.StreamReader($cs)
    return $sr.ReadToEnd()
}

function Encrypt {
    Clear-Host
    Write-Host -ForegroundColor Blue -BackgroundColor White "Encryption"
    $data = Read-Host -Prompt "Data" # get data from the terminal
    $key = Read-Host -Prompt "Key (16 characters)" # get key from the terminal
    $iv = Read-Host -Prompt "IV (16 characters)" # get IV from the terminal

    try {
        $Key, $IV = Get-KeyAndIV -Key $key -IV $iv
        if ($data.Length -gt 1) {
            Write-Host -ForegroundColor Green -BackgroundColor Black "Data is valid for encryption."
            $encryptedData = Encrypt-Data -data $data -Key $Key -IV $IV
            $Encryption[$data] = $encryptedData
            Write-Host -ForegroundColor Green -BackgroundColor Black "Encrypted Data: $encryptedData"
        }
        else {
            Write-Host -ForegroundColor Red -BackgroundColor Black "There was an issue reading the data given. Please try running the command again."
        }
    }
    catch {
        Write-Host -ForegroundColor Red -BackgroundColor Black "Error: $_"
    }
}

function Decrypt {
    Clear-Host
    Write-Host -ForegroundColor Blue -BackgroundColor White "Decryption"
    $encryptedData = Read-Host -Prompt "Encrypted Data" # get encrypted data from the terminal
    $key = Read-Host -Prompt "Key (16 characters)" # get key from the terminal
    $iv = Read-Host -Prompt "IV (16 characters)" # get IV from the terminal

    try {
        $Key, $IV = Get-KeyAndIV -Key $key -IV $iv
        if ($encryptedData.Length -gt 1) {
            Write-Host -ForegroundColor Green -BackgroundColor Black "Data is valid for decryption."
            $decryptedData = Decrypt-Data -encryptedData $encryptedData -Key $Key -IV $IV
            $Decryption[$encryptedData] = $decryptedData
            Write-Host -ForegroundColor Green -BackgroundColor Black "Decrypted Data: $decryptedData"
        }
        else {
            Write-Host -ForegroundColor Red -BackgroundColor Black "There was an issue reading the data given. Please try running the command again."
        }
    }
    catch {
        Write-Host -ForegroundColor Red -BackgroundColor Black "Error: $_"
    }
}

function Encrypt-File {
    param (
        [string]$filePath,
        [string]$key,
        [string]$iv
    )
    Clear-Host
    Write-Host -ForegroundColor Blue -BackgroundColor White "File Encryption"
    try {
        $Key, $IV = Get-KeyAndIV -Key $key -IV $iv
        $data = Get-Content -Path $filePath -Raw
        $encryptedData = Encrypt-Data -data $data -Key $Key -IV $IV
        $encryptedFilePath = "$filePath.enc"
        Set-Content -Path $encryptedFilePath -Value $encryptedData
        Write-Host -ForegroundColor Green -BackgroundColor Black "File encrypted and saved as $encryptedFilePath"
    }
    catch {
        Write-Host -ForegroundColor Red -BackgroundColor Black "Error: $_"
    }
}

function Decrypt-File {
    param (
        [string]$encryptedFilePath,
        [string]$key,
        [string]$iv
    )
    Clear-Host
    Write-Host -ForegroundColor Blue -BackgroundColor White "File Decryption"
    try {
        $Key, $IV = Get-KeyAndIV -Key $key -IV $iv
        $encryptedData = Get-Content -Path $encryptedFilePath -Raw
        $decryptedData = Decrypt-Data -encryptedData $encryptedData -Key $Key -IV $IV
        $decryptedFilePath = $encryptedFilePath -replace '\.enc$', ''
        Set-Content -Path $decryptedFilePath -Value $decryptedData
        Write-Host -ForegroundColor Green -BackgroundColor Black "File decrypted and saved as $decryptedFilePath"
    }
    catch {
        Write-Host -ForegroundColor Red -BackgroundColor Black "Error: $_"
    }
}

function Encrypt-Directory {
    param (
        [string]$directoryPath,
        [string]$key,
        [string]$iv
    )
    Clear-Host
    Write-Host -ForegroundColor Blue -BackgroundColor White "Directory Encryption"
    try {
        Get-ChildItem -Path $directoryPath -File | ForEach-Object {
            Encrypt-File -filePath $_.FullName -key $key -iv $iv
        }
        Write-Host -ForegroundColor Green -BackgroundColor Black "Directory encrypted."
    }
    catch {
        Write-Host -ForegroundColor Red -BackgroundColor Black "Error: $_"
    }
}

function Decrypt-Directory {
    param (
        [string]$directoryPath,
        [string]$key,
        [string]$iv
    )
    Clear-Host
    Write-Host -ForegroundColor Blue -BackgroundColor White "Directory Decryption"
    try {
        Get-ChildItem -Path $directoryPath -File -Filter *.enc | ForEach-Object {
            Decrypt-File -encryptedFilePath $_.FullName -key $key -iv $iv
        }
        Write-Host -ForegroundColor Green -BackgroundColor Black "Directory decrypted."
    }
    catch {
        Write-Host -ForegroundColor Red -BackgroundColor Black "Error: $_"
    }
}

function Save-EncryptedDataToFile {
    Clear-Host
    Write-Host -ForegroundColor Blue -BackgroundColor White "Saving Encrypted Data to File"
    $filePath = Read-Host -Prompt "File Path" # get file path from the terminal
    try {
        $Encryption.GetEnumerator() | ForEach-Object {
            Add-Content -Path $filePath -Value "$($_.Key):$($_.Value)"
        }
        Write-Host -ForegroundColor Green -BackgroundColor Black "Encrypted data saved to $filePath"
    }
    catch {
        Write-Host -ForegroundColor Red -BackgroundColor Black "Error: $_"
    }
}

function Load-EncryptedDataFromFile {
    Clear-Host
    Write-Host -ForegroundColor Blue -BackgroundColor White "Loading Encrypted Data from File"
    $filePath = Read-Host -Prompt "File Path" # get file path from the terminal
    try {
        $Encryption.Clear()
        Get-Content -Path $filePath | ForEach-Object {
            $parts = $_ -split ":"
            $Encryption[$parts[0]] = $parts[1]
        }
        Write-Host -ForegroundColor Green -BackgroundColor Black "Encrypted data loaded from $filePath"
    }
    catch {
        Write-Host -ForegroundColor Red -BackgroundColor Black "Error: $_"
    }
}
