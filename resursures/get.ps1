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
    Write-Host "Failed to download the script from $RandomURL1: $_.Exception.Message"
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

# Execute the batch file with administrative privileges in a new Command Prompt window
$Command = "/k start cmd.exe /c $FilePath $ScriptArgs"
Start-Process -FilePath "cmd.exe" -ArgumentList $Command -Verb RunAs -Wait
Write-Host "Launched the batch file with administrative privileges in a new Command Prompt window"

# Clean up the file
Remove-Item -Path $FilePath -Force
Write-Host "Cleaned up the batch file: $FilePath"

Write-Host "Script execution completed."
