@echo off
::Launching As Admin
if "%2"=="firstrun" exit
cmd /c "%0" null firstrun
if "%1"=="skipuac" goto skipuacstart
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%1'=='ELEV' (shift & goto gotPrivileges)
setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\elev.vbs"
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\elev.vbs"
"%temp%\elev.vbs"
exit /B
:gotPrivileges
setlocal & pushd .
cd /d %~dp0
cmd /c "%0" skipuac firstrun
cd /d %~dp0
:skipuacstart
if "%2"=="firstrun" exit


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: INFORMATION:                                                                     ::
:: This Makes Directory Where Will Gonna Be All Files                               ::                          
:: Main Downloads Location: %appdata%\Orange-Booster\                               ::              
:: color 4 = Red                                                                    ::
:: color 3 = Blue                                                                   ::                           
:: color 2 = Green                                                                  ::      
:: color 6 = Yellow                                                                 ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::Coded By TheAdas! thanks to: ZorsMatuxas, Gurgliu, Adziis for testing and helping!::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cd %appdata%
mkdir Orange-Booster
color 3
cls
title Orange Booster 5.0 - Made By TheAdas
:menu 
echo                    """""""""""""""""""""""""""""""""""""""""""""""""
echo                    "   ___                                         "
echo                    "  / _ \   _ __    __ _   _ __     __ _    ___  "
echo                    " | | | | | '__|  / _` | | '_ \   / _` |  / _ \ "
echo                    " | |_| | | |    | (_| | | | | | | (_| | |  __/ "
echo                    "  \___/  |_|     \__,_| |_| |_|  \__, |  \___| "
echo                    "                                 |___/         "
echo                    """""""""""""""""""""""""""""""""""""""""""""""""
echo +--------------------------------------------+-------------------------------------------+
echo +        Orange Booster           5.0        +      github.com/adasjusk   500. Debug     +
echo +--------------------------------------------+-------------------------------------------+
echo +             Booost Options                 +            Additional Tweaks              +
echo +--------------------------------------------+-------------------------------------------+
echo + 1.  Run Privacy Settings                   + 26. Change Wallpaper (Coming Soon !!!)    +
echo + 2.  Disable Telementry                     + 27. Enable Copilot AI                     +
echo + 3.  Disable Wifi Sense                     + 28. Disable Copilot AI + Cortana          +
echo + 4.  Disable Activity History               + 29. Disable Nagle Algorithm For Minecraft +
echo + 5.  Delete Temporary Files                 + 30. Disable Consumer Features             +
echo + 6.  Run Disk Cleanup                       + 31. Set Windows To Dark Mode              +
echo + 7.  Disable Location Tracking              + 32. Disable Bing Search in Start Menu     +
echo + 8.  Disable Storage Sense                  + 33. Set Classic Right-Click Menu          +
echo + 9.  Disable GameDVR                        + 34. Disable Ads In Windows                +
echo + 10. Disable Teredo                         + 35. Set File Explorer to Open This PC     +
echo + 11. Disable Unnecessary Services           + 35. Hide the Meet Now Button              +
echo + 12. Uninstall All Bloatware                + 36. Disable Spotlight Wallpapers          +
echo + 13. Uninstall Edge Browser                 + 37. Disable BitLocker Encription          +
echo + 14. Enable Game Mode                       + 38. Remove Meet Icon From Taskbar         +
echo + 15. Disable Background Apps                + 39. Enable Long File Paths                +
echo + 16. Add Ultimate Performance To Powerplan  + 40. Disable Error Reporting               +
echo + 17. Disable Delivery Optimization          + 41. Disables Cloud Optimized Content      +
echo + 18. Disable IPv6                           + 42. Set taskbar to left on Windows 11     +
echo + 19. Increase IRP stack size to 30          + 43. Disable Sticky Keys                   +
echo + 20. Clear Memory Page File at Shutdown     + 44. Remove Notifications                  +
echo + 21. Reset Internet Adapter (Restart Need)  + 45. Disable Mouse Acceleration            +
echo +--------------------------------------------+-------------------------------------------+
echo +           Orange Booster Update            +           Windows Updates                 +
echo +--------------------------------------------+-------------------------------------------+
echo + 22. Update Program To Newest Version       + 46. Set Windows Updates To Manual         +
echo + 23. Convert This Program Build To Preview  + 47. Set Windows Updates To Automatic      +
echo + 24. Convert This Program Build To Beta     + 48. Disable Driver Updating               +
echo + 25. Convert This Program Build To Main     + 49. Disable Updates (Not recommended)     +
echo +--------------------------------------------+-------------------------------------------+
set /p choice=choose from (1 to 49):


::# for 26. Change Wallpaper From Boring One  (Coming Soon !!!)  Make A Program
::Booost Options
if "%choice%"=="1" goto PRIVACY
if "%choice%"=="2" goto TELEMETRY
if "%choice%"=="3" goto WIFI_SENSE
if "%choice%"=="4" goto ACTIVITY_HISTORY
if "%choice%"=="5" goto TEMPORARY
if "%choice%"=="6" goto DISK_CLEANUP
if "%choice%"=="7" goto LOCATION_TRACKING
if "%choice%"=="8" goto STORAGE_SENSE
if "%choice%"=="9" goto DISABLE_DVR
if "%choice%"=="10" goto DISABLE_TEREDO
if "%choice%"=="11" goto DISABLE_UNNECESSERY_SERVC
if "%choice%"=="12" goto UNINST_ALL_BLOAT
if "%choice%"=="13" goto UNINSTALL_EDGE
if "%choice%"=="14" goto GAME_MODE
if "%choice%"=="15" goto DISABLE_BACKG_APPS
if "%choice%"=="16" goto ADD_ULTIMATE_PERFORMANCE
if "%choice%"=="17" goto DISABLE_DELIVERY_OPTIMIZATION
if "%choice%"=="18" goto DISABLE_IPV6
if "%choice%"=="19" goto INCREASE_IRP
if "%choice%"=="20" goto CLEAR_MEM_PAGE
if "%choice%"=="21" goto RESET_INT_ADAPTER

::Orange Booster Update
if "%choice%"=="22" goto CHECK_UPDATES
if "%choice%"=="23" goto PREVIEW
if "%choice%"=="24" goto BETA
if "%choice%"=="25" goto MAIN

::Additional Tweaks
if "%choice%"=="26" goto WALLPAPERS
if "%choice%"=="27" goto ENABLE_AI
if "%choice%"=="28" goto DISABLE_AI_CORTANA
if "%choice%"=="29" goto DISABLE_NAGLE
if "%choice%"=="30" goto COSTUMER_FETRS
if "%choice%"=="31" goto DARK
if "%choice%"=="32" goto SEARCH
if "%choice%"=="33" goto RIGHT_CLICK_MENU
if "%choice%"=="34" goto ADS
if "%choice%"=="35" goto THIS_PC
if "%choice%"=="36" goto SPOTLIGHT
if "%choice%"=="37" goto BITLOCKER
if "%choice%"=="38" goto MEET
if "%choice%"=="39" goto LONG_PATHS_FILES
if "%choice%"=="40" goto ERROR
if "%choice%"=="41" goto CLOUD
if "%choice%"=="42" goto TASKBAR_LEFT
if "%choice%"=="43" goto STICKY_KEYS
if "%choice%"=="44" goto REMOVE_NOTIF
if "%choice%"=="45" goto DISABLE_ACCELERATION

::Windows Updates
if "%choice%"=="46" goto MANUAL
if "%choice%"=="47" goto AUTO
if "%choice%"=="48" goto DRIVER
if "%choice%"=="49" goto NO_UPDATES
if "%choice%"=="0" goto Winver
if "%choice%"=="500" goto debug


:: Main Part: Engine

:PRIVACY
bitsadmin /transfer OOSU10 /download /priority high https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe %appdata%\Orange-Booster\OOSU10.exe
START %appdata%\Orange-Booster\OOSU10.exe
cls
pause
goto menu

:TELEMETRY
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
cls
pause
goto menu

:WIFI_SENSE
reg.exe add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v Value /t REG_DWORD /d 0 /f
reg.exe add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v Value /t REG_DWORD /d 0 /f
cls
pause
goto menu

:ACTIVITY_HISTORY
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f
cls
pause
goto menu

:TEMPORARY
del /s /f /q C:\WINDOWS\Temp\*.*
del /s /f /q C:\WINDOWS\Prefetch\*.*
del /s /f /q %USERPROFILE%\AppData\Local\Temp\*.*
pause
cls
goto menu

:DISK_CLEANUP
cleanmgr.exe /LOWDISK /d C:
cls
pause
goto menu

:LOCATION_TRACKING
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v Value /t REG_SZ /d Deny /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v Status /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SYSTEM\Maps" /v AutoUpdateEnabled /t REG_DWORD /d 0 /f
cls
pause
goto menu

:STORAGE_SENSE
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v 01 /t REG_DWORD /d 0 /f
cls
pause
goto menu

:DISABLE_DVR
reg.exe add "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f
reg.exe add "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg.exe add "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 1 /f
reg.exe add "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f
reg.exe add "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_EFSEFeatureFlags /t REG_DWORD /d 0 /f
cls
pause
goto menu

:DISABLE_TREDO
netsh interface teredo set state disabled
cls
pause
goto menu


:DISABLE_UNNECESSERY_SERVC
sc config "AJRouter" start= disabled
sc config "ALG" start= demand
sc config "AppIDSvc" start= demand
sc config "AppMgmt" start= demand
sc config "AppReadiness" start= demand
sc config "AppVClient" start= disabled
sc config "AppXSvc" start= demand
sc config "Appinfo" start= demand
sc config "AssignedAccessManagerSvc" start= disabled
sc config "AudioEndpointBuilder" start= auto
sc config "AudioSrv" start= auto
sc config "Audiosrv" start= auto
sc config "AxInstSV" start= demand
sc config "BDESVC" start= demand
sc config "BFE" start= auto
sc config "BITS" start= demand
sc config "BTAGService" start= demand
sc config "BcastDVRUserService_*" start= demand
sc config "BrokerInfrastructure" start= auto
sc config "Browser" start= demand
sc config "BthAvctpSvc" start= auto
sc config "BthHFSrv" start= auto
sc config "CDPSvc" start= demand
sc config "CDPUserSvc_*" start= auto
sc config "COMSysApp" start= demand
sc config "CaptureService_*" start= demand
sc config "CertPropSvc" start= demand
sc config "ClipSVC" start= demand
sc config "ConsentUxUserSvc_*" start= demand
sc config "CoreMessagingRegistrar" start= auto
sc config "CredentialEnrollmentManagerUserSvc_*" start= demand
sc config "CryptSvc" start= auto
sc config "CscService" start= demand
sc config "DPS" start= auto
sc config "DcomLaunch" start= auto
sc config "DcpSvc" start= demand
sc config "DevQueryBroker" start= demand
sc config "DeviceAssociationBrokerSvc_*" start= demand
sc config "DeviceAssociationService" start= demand
sc config "DeviceInstall" start= demand
sc config "DevicePickerUserSvc_*" start= demand
sc config "DevicesFlowUserSvc_*" start= demand
sc config "Dhcp" start= auto
sc config "DiagTrack" start= disabled
sc config "DialogBlockingService" start= disabled
sc config "DispBrokerDesktopSvc" start= auto
sc config "DisplayEnhancementService" start= demand
sc config "DmEnrollmentSvc" start= demand
sc config "Dnscache" start= auto
sc config "DoSvc" start= demand
sc config "DsSvc" start= demand
sc config "DsmSvc" start= demand
sc config "DusmSvc" start= auto
sc config "EFS" start= demand
sc config "EapHost" start= demand
sc config "EntAppSvc" start= demand
sc config "EventLog" start= auto
sc config "EventSystem" start= auto
sc config "FDResPub" start= demand
sc config "Fax" start= demand
sc config "FontCache" start= auto
sc config "FrameServer" start= demand
sc config "FrameServerMonitor" start= demand
sc config "GraphicsPerfSvc" start= demand
sc config "HomeGroupListener" start= demand
sc config "HomeGroupProvider" start= demand
sc config "HvHost" start= demand
sc config "IEEtwCollectorService" start= demand
sc config "IKEEXT" start= demand
sc config "InstallService" start= demand
sc config "InventorySvc" start= demand
sc config "IpxlatCfgSvc" start= demand
sc config "KeyIso" start= auto
sc config "KtmRm" start= demand
sc config "LSM" start= auto
sc config "LanmanServer" start= auto
sc config "LanmanWorkstation" start= auto
sc config "LicenseManager" start= demand
sc config "LxpSvc" start= demand
sc config "MSDTC" start= demand
sc config "MSiSCSI" start= demand
sc config "MapsBroker" start= demand
sc config "McpManagementService" start= demand
sc config "MessagingService_*" start= demand
sc config "MicrosoftEdgeElevationService" start= demand
sc config "MixedRealityOpenXRSvc" start= demand
sc config "MpsSvc" start= auto
sc config "MsKeyboardFilter" start= demand
sc config "NPSMSvc_*" start= demand
sc config "NaturalAuthentication" start= demand
sc config "NcaSvc" start= demand
sc config "NcbService" start= demand
sc config "NcdAutoSetup" start= demand
sc config "NetSetupSvc" start= demand
sc config "NetTcpPortSharing" start= disabled
sc config "Netlogon" start= auto
sc config "Netman" start= demand
sc config "NgcCtnrSvc" start= demand
sc config "NgcSvc" start= demand
sc config "NlaSvc" start= demand
sc config "OneSyncSvc_*" start= auto
sc config "P9RdrService_*" start= demand
sc config "PNRPAutoReg" start= demand
sc config "PNRPsvc" start= demand
sc config "PcaSvc" start= demand
sc config "PeerDistSvc" start= demand
sc config "PenService_*" start= demand
sc config "PerfHost" start= demand
sc config "PhoneSvc" start= demand
sc config "PimIndexMaintenanceSvc_*" start= demand
sc config "PlugPlay" start= demand
sc config "PolicyAgent" start= demand
sc config "Power" start= auto
sc config "PrintNotify" start= demand
sc config "PrintWorkflowUserSvc_*" start= demand
sc config "ProfSvc" start= auto
sc config "PushToInstall" start= demand
sc config "QWAVE" start= demand
sc config "RasAuto" start= demand
sc config "RasMan" start= demand
sc config "RemoteAccess" start= disabled
sc config "RemoteRegistry" start= disabled
sc config "RetailDemo" start= demand
sc config "RmSvc" start= demand
sc config "RpcEptMapper" start= auto
sc config "RpcLocator" start= demand
sc config "RpcSs" start= auto
sc config "SCPolicySvc" start= demand
sc config "SCardSvr" start= demand
sc config "SDRSVC" start= demand
sc config "SEMgrSvc" start= demand
sc config "SENS" start= auto
sc config "SNMPTRAP" start= demand
sc config "SNMPTrap" start= demand
sc config "SSDPSRV" start= demand
sc config "SamSs" start= auto
sc config "ScDeviceEnum" start= demand
sc config "Schedule" start= auto
sc config "SecurityHealthService" start= demand
sc config "Sense" start= demand
sc config "SensorDataService" start= demand
sc config "SensorService" start= demand
sc config "SensrSvc" start= demand
sc config "SessionEnv" start= demand
sc config "SgrmBroker" start= auto
sc config "SharedAccess" start= demand
sc config "SharedRealitySvc" start= demand
sc config "ShellHWDetection" start= auto
sc config "SmsRouter" start= demand
sc config "Spooler" start= auto
sc config "SstpSvc" start= demand
sc config "StateRepository" start= demand
sc config "StiSvc" start= demand
sc config "StorSvc" start= demand
sc config "SysMain" start= auto
sc config "SystemEventsBroker" start= auto
sc config "TabletInputService" start= demand
sc config "TapiSrv" start= demand
sc config "TermService" start= auto
sc config "TextInputManagementService" start= demand
sc config "Themes" start= auto
sc config "TieringEngineService" start= demand
sc config "TimeBroker" start= demand
sc config "TimeBrokerSvc" start= demand
sc config "TokenBroker" start= demand
sc config "TrkWks" start= auto
sc config "TroubleshootingSvc" start= demand
sc config "TrustedInstaller" start= demand
sc config "UI0Detect" start= demand
sc config "UdkUserSvc_*" start= demand
sc config "UevAgentService" start= disabled
sc config "UmRdpService" start= demand
sc config "UnistoreSvc_*" start= demand
sc config "UserDataSvc_*" start= demand
sc config "UserManager" start= auto
sc config "UsoSvc" start= demand
sc config "VGAuthService" start= auto
sc config "VMTools" start= auto
sc config "VSS" start= demand
sc config "VacSvc" start= demand
sc config "VaultSvc" start= auto
sc config "W32Time" start= demand
sc config "WEPHOSTSVC" start= demand
sc config "WFDSConMgrSvc" start= demand
sc config "WMPNetworkSvc" start= demand
sc config "WManSvc" start= demand
sc config "WPDBusEnum" start= demand
sc config "WSService" start= demand
sc config "WSearch" start= demand
sc config "WaaSMedicSvc" start= demand
sc config "WalletService" start= demand
sc config "WarpJITSvc" start= demand
sc config "WbioSrvc" start= demand
sc config "Wcmsvc" start= auto
sc config "WcsPlugInService" start= demand
sc config "WdNisSvc" start= demand
sc config "WdiServiceHost" start= demand
sc config "WdiSystemHost" start= demand
sc config "WebClient" start= demand
sc config "Wecsvc" start= demand
sc config "WerSvc" start= demand
sc config "WiaRpc" start= demand
sc config "WinDefend" start= auto
sc config "WinHttpAutoProxySvc" start= demand
sc config "WinRM" start= demand
sc config "Winmgmt" start= auto
sc config "WlanSvc" start= auto
sc config "WpcMonSvc" start= demand
sc config "WpnService" start= demand
sc config "WpnUserService_*" start= auto
sc config "WwanSvc" start= demand
sc config "XblAuthManager" start= demand
sc config "XblGameSave" start= demand
sc config "XboxGipSvc" start= demand
sc config "XboxNetApiSvc" start= demand
sc config "autotimesvc" start= demand
sc config "bthserv" start= demand
sc config "camsvc" start= demand
sc config "cbdhsvc_*" start= demand
sc config "cloudidsvc" start= demand
sc config "dcsvc" start= demand
sc config "defragsvc" start= demand
sc config "diagnosticshub.standardcollector.service" start= demand
sc config "diagsvc" start= demand
sc config "dmwappushservice" start= demand
sc config "dot3svc" start= demand
sc config "edgeupdate" start= demand
sc config "edgeupdatem" start= demand
sc config "embeddedmode" start= demand
sc config "fdPHost" start= demand
sc config "fhsvc" start= demand
sc config "gpsvc" start= auto
sc config "hidserv" start= demand
sc config "icssvc" start= demand
sc config "iphlpsvc" start= auto
sc config "lfsvc" start= demand
sc config "lltdsvc" start= demand
sc config "lmhosts" start= demand
sc config "mpssvc" start= auto
sc config "msiserver" start= demand
sc config "netprofm" start= demand
sc config "nsi" start= auto
sc config "p2pimsvc" start= demand
sc config "p2psvc" start= demand
sc config "perceptionsimulation" start= demand
sc config "pla" start= demand
sc config "seclogon" start= demand
sc config "shpamsvc" start= disabled
sc config "smphost" start= demand
sc config "spectrum" start= demand
sc config "sppsvc" start= demand
sc config "ssh-agent" start= disabled
sc config "svsvc" start= demand
sc config "swprv" start= demand
sc config "tiledatamodelsvc" start= auto
sc config "tzautoupdate" start= disabled
sc config "uhssvc" start= disabled
sc config "upnphost" start= demand
sc config "vds" start= demand
sc config "vm3dservice" start= demand
sc config "vmicguestinterface" start= demand
sc config "vmicheartbeat" start= demand
sc config "vmickvpexchange" start= demand
sc config "vmicrdv" start= demand
sc config "vmicshutdown" start= demand
sc config "vmictimesync" start= demand
sc config "vmicvmsession" start= demand
sc config "vmicvss" start= demand
sc config "vmvss" start= demand
sc config "wbengine" start= demand
sc config "wcncsvc" start= demand
sc config "webthreatdefsvc" start= demand
sc config "webthreatdefusersvc_*" start= auto
sc config "wercplsupport" start= demand
sc config "wisvc" start= demand
sc config "wlidsvc" start= demand
sc config "wlpasvc" start= demand
sc config "wmiApSrv" start= demand
sc config "workfolderssvc" start= demand
sc config "wscsvc" start= demand
sc config "wuauserv" start= demand
sc config "wudfsvc" start= demand
echo Disabled
pause
cls
goto menu

:UNINST_ALL_BLOAT
PRESS "OK" BOTTOM RIGHT AND DONE
bitsadmin /transfer Unbloater_Bat /download /priority high https://raw.githubusercontent.com/adasjusk/Orange-Booster/main/Uninstaller/bloat.bat %appdata%\Orange-Booster\bloat.bat
bitsadmin /transfer Unbloater_PS1 /download /priority high https://raw.githubusercontent.com/adasjusk/Orange-Booster/main/Uninstaller/bloat.ps1 %appdata%\Orange-Booster\bloat.ps1
cmd /k %appdata%\Orange-Booster\bloat.bat
pause
goto menu

:UNINSTALL_EDGE
bitsadmin /transfer Edge /download /priority high https://raw.githubusercontent.com/adasjusk/Orange-Booster/main/edge.bat %appdata%\Orange-Booster\edge.bat
cmd /k %appdata%\Orange-Booster\edge.bat
cls
pause
goto menu


:GAME_MODE
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f
cls
pause
goto menu

:DISABLE_BACKG_APPS
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
cls
pause
goto menu

:ADD_ULTIMATE_PERFORMANCE
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61
cls
pause
goto menu

:DISABLE_DELIVERY_OPTIMIZATION
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f
cls
pause
goto menu

:DISABLE_IPV6
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponents /t REG_DWORD /d 255 /f
netsh interface ipv6 set interface * admin=disable
cls
pause
goto menu

:INCREASE_IRP
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v IRPStackSize /t REG_DWORD /d 30 /f
cls
pause
goto menu

:CLEAR_MEM_PAGE
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f
cls
pause
goto menu

:RESET_INT_ADAPTER
ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew
netsh winsock reset
cls
pause
goto menu

::Orange Booster Update

:CHECK_UPDATES
echo Downloading Latest Update
timeout /t 1
echo BTW It's Just Downloading Stable Release Everytime This Program Dont Check Versions
timeout /t 1
cls
echo..
timeout /t 1
cls
echo...
timeout /t 1
cls
echo....
timeout /t 1
cls
echo.....
timeout /t 1
cls
echo......
timeout /t 1
cls
echo.......
timeout /t 1
bitsadmin /transfer Update /download /priority high https://raw.githubusercontent.com/adasjusk/Orange-Booster/main/bostr.bat %appdata%\Orange-Booster\bostr.bat
cmd /k %appdata%\Orange-Booster\bostr.bat
pause
goto menu

:PREVIEW
echo Downloading Unstable Update
timeout /t 2
timeout /t 1
cls
echo..
timeout /t 1
cls
echo...
timeout /t 1
cls
echo....
timeout /t 1
cls
echo.....
timeout /t 1
cls
echo......
timeout /t 1
cls
echo.......
timeout /t 1
bitsadmin /transfer Preview_Build /download /priority high https://raw.githubusercontent.com/adasjusk/Orange-Booster/preview/preview_bostr.bat %appdata%\Orange-Booster\preview_bostr.bat
%appdata%\Orange-Booster\preview_bostr.bat
pause
goto menu

:BETA
echo downloading latest beta update for testers!
timeout /t 2
cls
echo..
timeout /t 1
cls
echo...
timeout /t 1
cls
echo....
timeout /t 1
cls
echo.....
timeout /t 1
cls
echo......
timeout /t 1
cls
echo.......
timeout /t 1
bitsadmin /transfer Beta_Build /download /priority high https://raw.githubusercontent.com/adasjusk/Orange-Booster/beta/beta_bostr.bat %appdata%\Orange-Booster\beta_bostr.bat
%appdata%\Orange-Booster\beta_bostr.bat
pause
goto menu

:MAIN
bitsadmin /transfer Main_Release /download /priority high https://raw.githubusercontent.com/adasjusk/Orange-Booster/main/bostr.bat %appdata%\Orange-Booster\bostr.bat
%appdata%\Orange-Booster\bostr.bat
pause
goto menu

::Additional Tweaks

:WALLPAPERS
echo coming soon!!! check out https://github.com/adasjusk/Wallpapers
::bitsadmin /transfer Changer /download /priority high https://raw.githubusercontent.com/adasjusk/Wallpapers-Changer/main/Walpaper_Cng.bat %appdata%\Orange-Booster\Walpaper_Cng.bat
::%appdata%\Orange-Booster\Walpaper_Cng.bat
pause
goto menu

:ENABLE_AI
bitsadmin /transfer Copilot /download /priority high https://raw.githubusercontent.com/adasjusk/Copilot-Enable/main/Copilot.bat %USERPROFILE%\Copilot.bat

set "CustomCommand=%USERPROFILE%\Copilot.bat"
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Copilot" /t REG_SZ /d "%CustomCommand%" /f

cmd /k %USERPROFILE%\Copilot.bat
cls
pause
goto menu

:DISABLE_AI_CORTANA
reg add "HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat" /v IsUserEligible /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Copilot" /v IsCopilotAvailable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 0 /f
reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
taskkill /f /im SearchApp.exe
pause
goto menu

:DISABLE_NAGLE
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpNoDelay /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /t REG_DWORD /d 0 /f
cls
pause
goto menu

:COSTUMER_FETRS
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
cls
pause
goto menu

:DARK
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
cls
pause
goto menu

:SEARCH
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f
cls
pause
goto menu

:RIGHT_CLICK_MENU
reg.exe add "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /t REG_SZ /d "" /f
cls
pause
goto menu

:ADS
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OEMPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d 0 /f
reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Subscriptions" /f
reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v IsMiEnabled /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSyncProviderNotifications /t REG_DWORD /d 0 /f
cls
pause
goto menu

:THIS_PC
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f
cls
pause
goto menu

:SPOTLIGHT
:: Disable Windows Spotlight and set the normal Windows Picture as the desktop background
:: Disable Windows Spotlight on the lock screen
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsSpotlightOnLockScreen /t REG_DWORD /d 1 /f
:: Disable Windows Spotlight suggestions, tips, tricks, and more on the lock screen
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
:: Disable Windows Spotlight on Settings
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsSpotlightActiveUser /t REG_DWORD /d 1 /f
:: Set desktop background to a normal Windows picture
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v Wallpaper /t REG_SZ /d "C:\Windows\Web\Wallpaper\Windows\img0.jpg" /f
pause
goto menu

:BITLOCKER
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\BitLocker" /v "PreventDeviceEncryption" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EnhancedStorageDevices" /v TCGSecurityActivationDisabled /t REG_DWORD /d 1 /f
pause
goto menu

:MEET
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f
pause
goto menu

:LONG_PATHS_FILES
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v LongPathsEnabled /t REG_DWORD /d 1 /f
pause
goto menu

:ERROR
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
pause
goto menu

:CLOUD
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d 1 /f
pause
goto menu

:TASKBAR_LEFT
reg.exe add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /f
pause
goto menu

:STICKY_KEYS
reg.exe add "HKEY_LOCAL_MACHINE\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d "506" /f
reg.exe add "HKEY_LOCAL_MACHINE\Control Panel\Accessibility\StickyKeys" /v HotkeyFlags /t REG_SZ /d "58" /f
pause
goto menu

:REMOVE_NOTIF
reg.exe add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f
pause
goto menu

:DISABLE_ACCELERATION
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseSensitivity /t REG_DWORD /d 0 /f
pause
goto menu

::Windows Updates

:MANUAL
sc config wuauserv start= auto
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Win32k" /v DisableMeteredUpdates /t REG_DWORD /d 1 /f
pause
goto menu

:AUTO
sc config wuauserv start= auto
sc config UsoSvc start= auto
sc config uhssvc start= delayed-auto
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v FailureActions /t REG_BINARY /d 840300000000000000000000030000001400000001000000c0d4010001000000e09304000000000000000000 /f
reg delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /f
sc start wuauserv
pause
goto menu

:DRIVER
@echo off
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Update" /v ExcludeWUDriversInQualityUpdate /t REG_DWORD /d 0x00000001 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Update" /v ExcludeWUDriversInQualityUpdate /t REG_DWORD /d 0x00000001 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v ExcludeWUDriversInQualityUpdate /t REG_DWORD /d 0x00000001 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate /t REG_DWORD /d 0x00000001 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Update\ExcludeWUDriversInQualityUpdate" /v value /t REG_DWORD /d 0x00000001 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 0x00000001 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0x00000000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v DontSearchWindowsUpdate /t REG_DWORD /d 0x00000001 /f
pause
goto menu

::#Restore Windows Updates It's An Last Resort For Fixing Windows Updates But If That Dont work Just Run Troubleshooter Or Reinstall Windows
::ALLOW_UPDATES
::sc config wuauserv start= auto
::sc config UsoSvc start= auto
::sc config uhssvc start= delayed-auto
::reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 3 /f
::reg delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /f
::powershell -command "Get-ScheduledTask -TaskPath '\Microsoft\Windows\InstallService\*' | Enable-ScheduledTask; Get-ScheduledTask -TaskPath '\Microsoft\Windows\UpdateOrchestrator\*' | Enable-ScheduledTask; Get-ScheduledTask -TaskPath '\Microsoft\Windows\UpdateAssistant\*' | Enable-ScheduledTask; Get-ScheduledTask -TaskPath '\Microsoft\Windows\WaaSMedic\*' | Enable-ScheduledTask; Get-ScheduledTask -TaskPath '\Microsoft\Windows\WindowsUpdate\*' | Enable-ScheduledTask; Get-ScheduledTask -TaskPath '\Microsoft\WindowsUpdate\*' | Enable-ScheduledTask"

:NO_UPDATES
for %%i in (wuauserv, UsoSvc, uhssvc, WaaSMedicSvc) do (
	net stop %%i
	sc config %%i start= disabled
	sc failure %%i reset= 0 actions= ""
)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v FailureActions /t REG_BINARY /d 000000000000000000000000030000001400000000000000c0d4010000000000e09304000000000000000000 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
pause
goto menu

:debug
START C:\Windows\System32\cmd.exe /k title CMD cd C:\
::End Of The Script!
::Btw Im not responsible for :NO_UPDATES Script use at your own risk ask for help at my Discord: adasjusk
