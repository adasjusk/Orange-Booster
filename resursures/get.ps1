$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

$CommonURLPart = 'bostr.bat'
$DownloadURL1 = 'https://raw.githubusercontent.com/adasjusk/Orange-Booster/main/' + $CommonURLPart

$URLs = @($DownloadURL1)
$RandomURL1 = Get-Random -InputObject $URLs

try {
    $response = Invoke-WebRequest -Uri $RandomURL1 -UseBasicParsing
    Write-Host "Successfully downloaded the script from $RandomURL1"
}
catch {
    Write-Host "Failed to download the script from $RandomURL1: $_"
    exit 1
}

$rand = Get-Random -Maximum 99999999
$FilePath = "$env:APPDATA\InerJava-Programs\bostr_$rand.bat"

# Ensure the directory exists
$Directory = Split-Path -Path $FilePath
if (-not (Test-Path -Path $Directory)) {
    New-Item -ItemType Directory -Path $Directory | Out-Null
    Write-Host "Created directory: $Directory"
} else {
    Write-Host "Directory already exists: $Directory"
}

$ScriptArgs = "$args "
$prefix = "@::: $rand `r`n"
$content = $prefix + $response.Content
Set-Content -Path $FilePath -Value $content -Encoding UTF8
Write-Host "Saved the script to: $FilePath"

# Execute the batch file with administrative privileges and redirect output to a log file
$LogFilePath = "$env:TEMP\bostr_$rand.log"
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $FilePath $ScriptArgs > $LogFilePath 2>&1" -Verb RunAs -Wait
Write-Host "Launched the batch file with administrative privileges. Output redirected to: $LogFilePath"

# Clean up the files
Remove-Item -Path $FilePath -Force
Write-Host "Cleaned up the batch file: $FilePath"
Remove-Item -Path $LogFilePath -Force
Write-Host "Cleaned up the log file: $LogFilePath"

Write-Host "Script execution completed."
