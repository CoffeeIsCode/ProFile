# Cryption Module

# Variables
$Encryption = @{}
$Decryption = @{}

# Generate a random key and IV for AES encryption
$Key = [System.Text.Encoding]::UTF8.GetBytes("A very strong key!") # 16 bytes for AES-128
$IV = [System.Text.Encoding]::UTF8.GetBytes("An init vector123") # 16 bytes for AES

function Encrypt($data) {
  Clear-Host
  Write-Host -ForegroundColor Blue -BackgroundColor White "Encryption"
  $data = Read-Host -Prompt "Data" # get data from the terminal

  # Check if no data was entered.
  if ($null -eq $data) {
    Write-Host -ForegroundColor Red -BackgroundColor Black "No data was entered. Please try again."
  }
  else {
    # Data was entered
    if ($data.Length -gt 1) {
      Write-Host -ForegroundColor Green -BackgroundColor Black "Data is valid for encryption."
      # AES Encryption logic
      $aes = [System.Security.Cryptography.Aes]::Create()
      $aes.Key = $Key
      $aes.IV = $IV
      $encryptor = $aes.CreateEncryptor($aes.Key, $aes.IV)
      $ms = New-Object System.IO.MemoryStream
      $cs = New-Object System.Security.Cryptography.CryptoStream($ms, $encryptor, [System.Security.Cryptography.CryptoStreamMode]::Write)
      $sw = New-Object System.IO.StreamWriter($cs)
      $sw.Write($data)
      $sw.Close()
      $encryptedData = [Convert]::ToBase64String($ms.ToArray())
      $Encryption[$data] = $encryptedData
      Write-Host -ForegroundColor Green -BackgroundColor Black "Encrypted Data: $encryptedData"
    }
    else {
      Write-Host -ForegroundColor Red -BackgroundColor Black "There was an issue reading the data given. Please try running the command again."
    }
  }
}

function Decrypt($encryptedData) {
  Clear-Host
  Write-Host -ForegroundColor Blue -BackgroundColor White "Decryption"
  $encryptedData = Read-Host -Prompt "Encrypted Data" # get encrypted data from the terminal

  # Check if no data was entered.
  if ($null -eq $encryptedData) {
    Write-Host -ForegroundColor Red -BackgroundColor Black "No data was entered. Please try again."
  }
  else {
    # Data was entered
    if ($encryptedData.Length -gt 1) {
      Write-Host -ForegroundColor Green -BackgroundColor Black "Data is valid for decryption."
      # AES Decryption logic
      $aes = [System.Security.Cryptography.Aes]::Create()
      $aes.Key = $Key
      $aes.IV = $IV
      $decryptor = $aes.CreateDecryptor($aes.Key, $aes.IV)
      $ms = New-Object System.IO.MemoryStream([Convert]::FromBase64String($encryptedData))
      $cs = New-Object System.Security.Cryptography.CryptoStream($ms, $decryptor, [System.Security.Cryptography.CryptoStreamMode]::Read)
      $sr = New-Object System.IO.StreamReader($cs)
      $decryptedData = $sr.ReadToEnd()
      $Decryption[$encryptedData] = $decryptedData
      Write-Host -ForegroundColor Green -BackgroundColor Black "Decrypted Data: $decryptedData"
    }
    else {
      Write-Host -ForegroundColor Red -BackgroundColor Black "There was an issue reading the data given. Please try running the command again."
    }
  }
}

function Save-EncryptedDataToFile($filePath) {
  Clear-Host
  Write-Host -ForegroundColor Blue -BackgroundColor White "Saving Encrypted Data to File"
  $filePath = Read-Host -Prompt "File Path" # get file path from the terminal
  $Encryption.GetEnumerator() | ForEach-Object {
    Add-Content -Path $filePath -Value "$($_.Key):$($_.Value)"
  }
  Write-Host -ForegroundColor Green -BackgroundColor Black "Encrypted data saved to $filePath"
}

function Load-EncryptedDataFromFile($filePath) {
  Clear-Host
  Write-Host -ForegroundColor Blue -BackgroundColor White "Loading Encrypted Data from File"
  $filePath = Read-Host -Prompt "File Path" # get file path from the terminal
  $Encryption.Clear()
  Get-Content -Path $filePath | ForEach-Object {
    $parts = $_ -split ":"
    $Encryption[$parts[0]] = $parts[1]
  }
  Write-Host -ForegroundColor Green -BackgroundColor Black "Encrypted data loaded from $filePath"
}
