$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

$CommonURLPart = 'bostr.bat'
$DownloadURL1 = 'https://raw.githubusercontent.com/adasjusk/Orange-Booster/main/' + $CommonURLPart

$URLs = @($DownloadURL1)
$RandomURL1 = Get-Random -InputObject $URLs

try {
    $response = Invoke-WebRequest -Uri $RandomURL1 -UseBasicParsing
}
catch {
    Write-Host "Failed to download the script from $RandomURL1"
    exit 1
}

$rand = Get-Random -Maximum 99999999
$FilePath = "$env:APPDATA\InerJava-Programs\bostr_$rand.bat"

# Ensure the directory exists
$Directory = Split-Path -Path $FilePath
if (-not (Test-Path -Path $Directory)) {
    New-Item -ItemType Directory -Path $Directory | Out-Null
}

$ScriptArgs = "$args "
$prefix = "@::: $rand `r`n"
$content = $prefix + $response
Set-Content -Path $FilePath -Value $content

Start-Process -FilePath "cmd.exe" -ArgumentList "/c $FilePath $ScriptArgs" -Verb RunAs -Wait