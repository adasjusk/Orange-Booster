$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

$CommonURLPart = 'bostr.bat'
$DownloadURL1 = 'https://raw.githubusercontent.com/adasjusk/Orange-Booster/main/' + $CommonURLPart

try {
    $response = Invoke-WebRequest -Uri $DownloadURL1 -UseBasicParsing
} catch {
    Write-Host "Failed to download the script from $DownloadURL1"
    Write-Host "Error: $_"
    exit 1
}

$rand = Get-Random -Maximum 99999999
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

$AppDataPath = Join-Path -Path $env:APPDATA -ChildPath 'InerJava-Programs'
if (-not (Test-Path -Path $AppDataPath)) {
    New-Item -Path $AppDataPath -ItemType Directory | Out-Null
}
$FilePath = Join-Path -Path $AppDataPath -ChildPath "bostr_$rand.bat"

$ScriptArgs = "$args "
$prefix = "@::: $rand `r`n"
$content = $prefix + $response.Content

# Use UTF8 encoding to preserve ASCII characters
Set-Content -Path $FilePath -Value $content -Encoding UTF8

# Start the batch file as an administrator
Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$FilePath`" $ScriptArgs" -Verb RunAs -Wait
