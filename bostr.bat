@echo off
::Coded By TheAdas
::Thanks To: ZorsMatuxas, Gurgliu
cls
title Orange Booster
::Menu
:menu 
cls
echo +-------------------------------------------+
echo +             Orange Booster                +
echo +-------------------------------------------+
echo +              Settings Booster             +
echo +-------------------------------------------+
echo  50. Set Color Green
echo  60. Set Color Blue
echo +-------------------------------------------+
echo +              Boost Tweaks                 +
echo +-------------------------------------------+
echo  1.  Run Privacy Settings
echo  2.  Disable Telementry
echo  3.  Disable Wifi-Sense
echo  4.  Disable Activity History
echo  5.  Delete Temporary Files
echo  6.  Run Disk Cleanup
echo  7.  Disable Location Tracking
echo  8.  Disable Storage Sense
echo  9.  Disable GameDVR
echo  10. Disable Teredo
echo  11. Disable Unnecessary Services
echo  12. Uninstall Unnecessary Apps
echo  13. Uninstall Edge Browser
echo  14. Enable Game Mode
echo +-------------------------------------------+
echo +              Advanced Tweaks              +
echo +-------------------------------------------+
echo  15. Add Take Ownership
echo  16. Disable Web Search In Taskbar
echo  17. Enable Copilot AI
echo  18. Disable Ads In Windows
echo +-------------------------------------------+
set /p choice=choose from (1 to 60):

::Main 
if "%choice%"=="1" goto pset
if "%choice%"=="2" goto dt
if "%choice%"=="3" goto wifi
if "%choice%"=="4" goto dah
if "%choice%"=="5" goto dtf
if "%choice%"=="6" goto rdc
if "%choice%"=="7" goto dlt
if "%choice%"=="8" goto dss
if "%choice%"=="9" goto dg
if "%choice%"=="10" goto distred
if "%choice%"=="11" goto dus
if "%choice%"=="12" goto uua
if "%choice%"=="13" goto ueb
if "%choice%"=="14" goto egm


::Advanced Tweaks
if "%choice%"=="15" goto ato
if "%choice%"=="16" goto dwsit
if "%choice%"=="17" goto eca
if "%choice%"=="18" goto daiw
::Colors
if "%choice%"=="50" goto green
if "%choice%"=="60" goto blue

:pset
@echo off
REM disable using your machine for sending windows updates to others
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DownloadMode /t REG_DWORD /d 0 /f
REM disable sending settings to cloud
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v DisableSettingSync /t REG_DWORD /d 2 /f
REM disable synchronizing files to cloud
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v DisableSettingSyncUserOverride /t REG_DWORD /d 1 /f
REM disable ad customization
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f
REM disable data collection and sending to MS
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
REM disable sending files to encrypted drives
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\EnhancedStorageDevices" /v TCGSecurityActivationDisabled /t REG_DWORD /d 0 /f
REM disable sync files to one drive
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f
REM disable certificate revocation check
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers" /v authenticodeenabled /t REG_DWORD /d 0 /f
REM disable send additional info with error reports
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v DontSendAdditionalData /t REG_DWORD /d 1 /f
REM disable cortana in windows search
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
REM disable location based info in searches
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f
REM disable language detection
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AlwaysUseAutoLangDetection /t REG_DWORD /d 0 /f
cls
pause
goto menu

:dt
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f

if '%1'=='ELEV' shift /1
setlocal & pushd .
cd /d %~dp0

sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
cls
pause
goto menu

:wifi
reg add "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\WcmSvc\\wifinetworkmanager\\config\\" /v AutoConnectAllowedOEM /t REG_DWORD /d 0 /f
cls
pause
goto menu

:dah
reg add "HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows\\System" /v PublishUserActivities /t REG_DWORD /d 0 /f
cls
pause
goto menu

:dtf
@echo off
del /s /f /q c:\windows\temp\*.*
del /s /f /q C:\windows\Prefetch\*.*
del /s /f /q %USERPROFILE%\AppData\Local\Temp\*.*
cls
pause
goto menu

:rdc
echo There Is Disk Cleanup program press OK 
cleanmgr.exe /LOWDISK /d C:
cls
pause
goto menu

:dlt
reg add "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\location" /v Value /t REG_SZ /d Deny /f
cls
pause
goto menu

:dss
reg add "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\StorageSense\\Parameters\\StoragePolicy" /v 01 /t REG_DWORD /d 0 /f
cls
pause
goto menu

:dg
reg add "HKLM\\Software\\Policies\\Microsoft\\Windows\\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f
cls
pause
goto menu

:distred
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\TCPIP6\\Parameters" /v "DisabledComponents" /t REG_DWORD /d 8 /f
cls
pause
goto menu


:dus
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\AssignedAccessManagerSvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\BDESVC" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\AudioEndpointBuilder" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\bthserv" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\DiagTrack" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\DiagSvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\DPS" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\WdiServiceHost" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\lfsvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\MapsBroker" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Netlogon" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\defragsvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\WPCSvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\PhoneSvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Spooler" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\TermService" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\UmRdpService" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\SensrSvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\SCardSvr" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\SCPolicySvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\WbioSrvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\WerSvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\workfolderssvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\XblAuthManager" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\XblGameSave" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\XboxNetApiSvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\wisvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Fax" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\WalletService" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\icssvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\TabletInputService" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\DevicePickerUserSvc" /v Start /t REG_DWORD /d 3 /f

cls
pause
goto menu

:uua
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command "& {
    Start-Process -Verb RunAs powershell -ExecutionPolicy Bypass
    Get-AppxPackage -AllUsers *ActiproSoftwareLLC* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage
    Get-AppxPackage -AllUsers Microsoft.BingNews* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *CandyCrush* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *Duolingo* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *EclipseManager* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *Facebook* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *king.com.FarmHeroesSaga* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *Flipboard* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *HiddenCityMysteryofShadows* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *HuluLLC.HuluPlus* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *Pandora* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *Plex* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *ROBLOXCORPORATION.ROBLOX* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *Spotify* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *Netflix* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *Microsoft.SkypeApp* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *Twitter* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *Wunderlist* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.549981C3F5F10* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.BingWeather* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.GetHelp* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.Getstarted* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.Microsoft3DViewer* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.MixedReality.Portal* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.Office.OneNote* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.People* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.Print3D* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.ScreenSketch* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.SkypeApp* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.WindowsAlarms* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.WindowsCamera* | Remove-AppxPackage
    Get-AppxPackage -allusers microsoft.windowscommunicationsapps* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.WindowsFeedbackHub* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.WindowsMaps* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.WindowsSoundRecorder* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.Xbox.TCUI* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.XboxApp* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.XboxGameOverlay* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.XboxGamingOverlay* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.YourPhone* | Remove-AppxPackage
    Get-AppxPackage -allusers Microsoft.ZuneVideo* | Remove-AppxPackage
}"
cls
pause
goto menu

:ueb
bitsadmin /transfer myDownloadJob /download /priority normal https://raw.githubusercontent.com/adasjusk/Orange-Booster/main/edge.bat %USERPROFILE%\AppData\Local\Temp\edge.bat
cmd /k %USERPROFILE%\AppData\Local\Temp\edge.bat
cls
pause
goto menu


:egm
@echo off
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f
cls
pause
goto menu

::Advanced Tweaks
:ato
reg add "HKCR\*\shell\runas" /v "" /t REG_SZ /d "Take Ownership" /f
reg add "HKCR\*\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
reg add "HKCR\*\shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /grant administrators:F" /f
reg add "HKCR\*\shell\runas\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /grant administrators:F" /f
reg add "HKCR\Directory\shell\runas" /v "" /t REG_SZ /d "Take Ownership" /f
reg add "HKCR\Directory\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
reg add "HKCR\Directory\shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t" /f
reg add "HKCR\Directory\shell\runas\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t" /f
cls
pause
goto menu

:dwsit

reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f
cls
pause
goto menu

:eca
timeout /t 1
reg add "HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat" /v IsUserEligible /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Copilot" /v IsCopilotAvailable /t REG_DWORD /d 1 /f
timeout /t 1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 0 /f
timeout /t 1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 1 /f
cls
pause
goto menu

:daiw
@echo off
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d 0 /f
cls
pause
goto menu

::Color
:green
color 2
cls
pause
goto menu

:blue
color 1
cls
pause
goto menu






