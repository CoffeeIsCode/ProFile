# Cryption.ps1
# A powerful encryption and decryption tool.
#
# Features: 
# [ ] 
#
# Developed by: CoffeeIsCode
#
# Check out the open source project at: www.GitHub.com/CoffeeIsCode/ProFile/

$Encryption = @{}
$Decryption = @{}

# Function to generate a random key and IV
function Generate-KeyAndIV {
  $aes = [System.Security.Cryptography.Aes]::Create()
  $aes.GenerateKey()
  $aes.GenerateIV()
  return [Convert]::ToBase64String($aes.Key), [Convert]::ToBase64String($aes.IV)
}

# Function to get Key and IV as byte arrays
function Get-KeyAndIV {
  param ([string]$Key, [string]$IV)
  return [System.Convert]::FromBase64String($Key), [System.Convert]::FromBase64String($IV)
}

# Function to encrypt data
function Encrypt-Data {
  param ([string]$data, [byte[]]$Key, [byte[]]$IV)
  $aes = [System.Security.Cryptography.Aes]::Create()
  $aes.Key, $aes.IV = $Key, $IV
  $encryptor = $aes.CreateEncryptor($aes.Key, $aes.IV)
  $ms = New-Object System.IO.MemoryStream
  $cs = New-Object System.Security.Cryptography.CryptoStream($ms, $encryptor, [System.Security.Cryptography.CryptoStreamMode]::Write)
  $sw = New-Object System.IO.StreamWriter($cs)
  $sw.Write($data); $sw.Close()
  return [Convert]::ToBase64String($ms.ToArray())
}

# Function to decrypt data
function Decrypt-Data {
  param ([string]$encryptedData, [byte[]]$Key, [byte[]]$IV)
  $aes = [System.Security.Cryptography.Aes]::Create()
  $aes.Key, $aes.IV = $Key, $IV
  $decryptor = $aes.CreateDecryptor($aes.Key, $aes.IV)
  $ms = New-Object System.IO.MemoryStream([Convert]::FromBase64String($encryptedData))
  $cs = New-Object System.Security.Cryptography.CryptoStream($ms, $decryptor, [System.Security.Cryptography.CryptoStreamMode]::Read)
  $sr = New-Object System.IO.StreamReader($cs)
  return $sr.ReadToEnd()
}

# Function to log activities
function Log-Activity {
  param ([string]$message)
  $logFilePath = "encryption_log.txt"
  $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
  Add-Content -Path $logFilePath -Value "$timestamp - $message"
}

# Function to encrypt user input data
function Encrypt {
  Clear-Host
  Write-Host -ForegroundColor Blue "Encryption"
  $data = Read-Host -Prompt "Data"
  try {
    $key, $iv = Generate-KeyAndIV
    $Key, $IV = Get-KeyAndIV -Key $key -IV $iv
    if ($data.Length -gt 1) {
      $encryptedData = Encrypt-Data -data $data -Key $Key -IV $IV
      $Encryption[$data] = $encryptedData
      Write-Host -ForegroundColor Green "Encrypted Data: $encryptedData"
      Log-Activity -message "Encrypted data: $data"
    }
    else {
      Write-Host -ForegroundColor Red "Invalid data length."
    }
  }
  catch {
    Write-Host -ForegroundColor Red "Error: $_"
    Log-Activity -message "Error encrypting data: $_"
  }
}

# Function to decrypt user input data
function Decrypt {
  Clear-Host
  Write-Host -ForegroundColor Blue "Decryption"
  $encryptedData = Read-Host -Prompt "Encrypted Data"
  $key = Read-Host -Prompt "Key"
  $iv = Read-Host -Prompt "IV"
  try {
    $Key, $IV = Get-KeyAndIV -Key $key -IV $iv
    if ($encryptedData.Length -gt 1) {
      $decryptedData = Decrypt-Data -encryptedData $encryptedData -Key $Key -IV $IV
      $Decryption[$encryptedData] = $decryptedData
      Write-Host -ForegroundColor Green "Decrypted Data: $decryptedData"
      Log-Activity -message "Decrypted data: $decryptedData"
    }
    else {
      Write-Host -ForegroundColor Red "Invalid data length."
    }
  }
  catch {
    Write-Host -ForegroundColor Red "Error: $_"
    Log-Activity -message "Error decrypting data: $_"
  }
}

# Function to encrypt a file
function Encrypt-File {
  param ([string]$filePath)
  Clear-Host
  Write-Host -ForegroundColor Blue "File Encryption"
  try {
    $key, $iv = Generate-KeyAndIV
    $Key, $IV = Get-KeyAndIV -Key $key -IV $iv
    $data = Get-Content -Path $filePath -Raw
    $encryptedData = Encrypt-Data -data $data -Key $Key -IV $IV
    $encryptedFilePath = "$filePath.enc"
    Set-Content -Path $encryptedFilePath -Value "$encryptedData`n$key`n$iv"
    Write-Host -ForegroundColor Green "File encrypted and saved as $encryptedFilePath"
    Log-Activity -message "Encrypted file: $filePath"
  }
  catch {
    Write-Host -ForegroundColor Red "Error: $_"
    Log-Activity -message "Error encrypting file: $_"
  }
}

# Function to decrypt a file
function Decrypt-File {
  param ([string]$encryptedFilePath)
  Clear-Host
  Write-Host -ForegroundColor Blue "File Decryption"
  try {
    $content = Get-Content -Path $encryptedFilePath -Raw
    $encryptedData, $key, $iv = $content -split "`n"
    $Key, $IV = Get-KeyAndIV -Key $key -IV $iv
    $decryptedData = Decrypt-Data -encryptedData $encryptedData -Key $Key -IV $IV
    $decryptedFilePath = $encryptedFilePath -replace '\.enc$', ''
    Set-Content -Path $decryptedFilePath -Value $decryptedData
    Write-Host -ForegroundColor Green "File decrypted and saved as $decryptedFilePath"
    Log-Activity -message "Decrypted file: $encryptedFilePath"
  }
  catch {
    Write-Host -ForegroundColor Red "Error: $_"
    Log-Activity -message "Error decrypting file: $_"
  }
}

# Function to encrypt all files in a directory
function Encrypt-Directory {
  param ([string]$directoryPath)
  Clear-Host
  Write-Host -ForegroundColor Blue "Directory Encryption"
  try {
    $files = Get-ChildItem -Path $directoryPath -File
    $totalFiles = $files.Count
    $currentFile = 0
    foreach ($file in $files) {
      $currentFile++
      Write-Progress -Activity "Encrypting Directory" -Status "Processing $($file.Name)" -PercentComplete (($currentFile / $totalFiles) * 100)
      Encrypt-File -filePath $file.FullName
    }
    Write-Host -ForegroundColor Green "Directory encrypted."
    Log-Activity -message "Encrypted directory: $directoryPath"
  }
  catch {
    Write-Host -ForegroundColor Red "Error: $_"
    Log-Activity -message "Error encrypting directory: $_"
  }
}


# Function to decrypt all files in a directory
function Decrypt-Directory {
  param ([string]$directoryPath)
  Clear-Host
  Write-Host -ForegroundColor Blue "Directory Decryption"
  try {
    $files = Get-ChildItem -Path $directoryPath -File -Filter *.enc
    $totalFiles = $files.Count
    $currentFile = 0
    foreach ($file in $files) {
      $currentFile++
      Write-Progress -Activity "Decrypting Directory" -Status "Processing $($file.Name)" -PercentComplete (($currentFile / $totalFiles) * 100)
      Decrypt-File -encryptedFilePath $file.FullName
    }
    Write-Host -ForegroundColor Green "Directory decrypted."
    Log-Activity -message "Decrypted directory: $directoryPath"
  }
  catch {
    Write-Host -ForegroundColor Red "Error: $_"
    Log-Activity -message "Error decrypting directory: $_"
  }
}

# Function to save encrypted data to a file
function Save-EncryptedDataToFile {
  Clear-Host
  Write-Host -ForegroundColor Blue "Saving Encrypted Data to File"
  $filePath = Read-Host -Prompt "File Path"
  try {
    $Encryption.GetEnumerator() | ForEach-Object {
      Add-Content -Path $filePath -Value "$($_.Key):$($_.Value)"
    }
    Write-Host -ForegroundColor Green "Encrypted data saved to $filePath"
    Log-Activity -message "Saved encrypted data to file: $filePath"
  }
  catch {
    Write-Host -ForegroundColor Red "Error: $_"
    Log-Activity -message "Error saving encrypted data: $_"
  }
}

# Function to load encrypted data from a file
function Load-EncryptedDataFromFile {
  Clear-Host
  Write-Host -ForegroundColor Blue "Loading Encrypted Data from File"
  $filePath = Read-Host -Prompt "File Path"
  try {
    $Encryption.Clear()
    Get-Content -Path $filePath | ForEach-Object {
      $parts = $_ -split ":"
      $Encryption[$parts[0]] = $parts[1]
    }
    Write-Host -ForegroundColor Green "Encrypted data loaded from $filePath"
    Log-Activity -message "Loaded encrypted data from file: $filePath"
  }
  catch {
    Write-Host -ForegroundColor Red "Error: $_"
    Log-Activity -message "Error loading encrypted data: $_"
  }
}