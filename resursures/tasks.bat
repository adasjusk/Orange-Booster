@echo off
cd %appdata%
mkdir InerJava-Programs
chcp 65001 >null
:menu 
title Orange Tasks B/5.0
MODE 60,40
color 4
echo.
echo.
echo       ██████╗ ██████╗  █████╗ ███╗   ██╗ ██████╗ ███████╗
echo      ██╔═══██╗██╔══██╗██╔══██╗████╗  ██║██╔════╝ ██╔════╝
echo      ██║   ██║██████╔╝███████║██╔██╗ ██║██║  ███╗█████╗  
echo      ██║   ██║██╔══██╗██╔══██║██║╚██╗██║██║   ██║██╔══╝  
echo      ╚██████╔╝██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗
echo       ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
echo          ╔═══════════════════════════════════════════╗
echo          ║ 1.  Delete Temporary Files                ║
echo          ║ 2.  Disable Consumer Features             ║
echo          ║ 3.  Disable Telemetry Of Taskbar          ║
echo          ║ 4.  Set Classic Right-Click Menu          ║
echo          ║ 5.  Disable Ads In Windows                ║
echo          ║ 6.  Set File Explorer to Open This PC     ║
echo          ║ 7.  Disable BitLocker Encription          ║
echo          ║ 8.  Disable Error Reporting               ║
echo          ║ 9.  Set taskbar to left on Windows 11     ║
echo          ║ 10. Disable My People                     ║
echo          ║ 11. Disable Fax And Print                 ║
echo          ║ 12. Remove OneDrive                       ║
echo          ║ 13. Disable Intel MM (vPro LMS)           ║
echo          ║ 14. Detailed BSOD                         ║
echo          ║ 15. Turn Off Snap Assist And Window       ║
echo          ║ 16. Enable Num Lock On Starup             ║
echo          ║ 17. Show Files Extension                  ║
echo          ║ 18. Disable Razer Software Installers     ║
echo          ║ 19. Activate Windows Massgravel Script    ║
echo          ╠═══════════════════════════════════════════╣
echo          ║           Windows Updates                 ║
echo          ╠═══════════════════════════════════════════╣
echo          ║ 20. Set Windows Updates To Manual         ║
echo          ║ 21. Set Windows Updates To Automatic      ║
echo          ║ 22. Disable Driver Updating               ║
echo          ║ 23. Disable Updates (Not recommended)     ║
echo          ╠═══════════════════════════════════════════╝
set /p input=%BS% [38;2;255;0;0m         ╚══════^>[0m 
if "%input%"=="1" goto TEMPORARY
if "%input%"=="2" goto COSTUMER_FETRS
if "%input%"=="3" goto START_TELEM
if "%input%"=="4" goto RIGHT_CLICK_MENU
if "%input%"=="5" goto ADS
if "%input%"=="6" goto THIS_PC
if "%input%"=="7" goto BITLOCKERS
if "%input%"=="8" goto ERROR
if "%input%"=="9" goto TASKBAR_LEFT
if "%input%"=="10" goto MY_PEOPLE
if "%input%"=="11" goto FAX_PRIN
if "%input%"=="12" goto SKYDRIVE
if "%input%"=="13" goto Intel_MM
if "%input%"=="14" goto BSOD
if "%input%"=="15" goto SNAP
if "%input%"=="16" goto NUM_LOCK
if "%input%"=="17" goto EXT
if "%input%"=="18" goto UPDATE_RAZER_INSTALLERS
if "%input%"=="19" goto MASSGRAVEL
if "%input%"=="20" goto MANUAL
if "%input%"=="21" goto AUTO
if "%input%"=="22" goto DRIVER
if "%input%"=="23" goto NO_UPDATES
:: Main Part: Engine

:TEMPORARY
del /s /f /q C:\WINDOWS\Temp\*.*
del /s /f /q C:\WINDOWS\Prefetch\*.*
del /s /f /q %USERPROFILE%\AppData\Local\Temp\*.*
pause
cls
goto menu

:COSTUMER_FETRS
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
cls
pause
goto menu

:RIGHT_CLICK_MENU
reg.exe add "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /t REG_SZ /d "" /f
cls
pause
goto menu

:THIS_PC
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f
cls
pause
goto menu

:BITLOCKER
@echo off

:: Check if the script is running with administrator privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :disableBitLocker
) else (
    echo Please run this script with administrator privileges.
    pause
    goto menu
)

:disableBitLocker
:: Disable BitLocker on all fixed drives
for /f "tokens=2 delims=:" %%D in ('wmic logicaldisk where "drivetype=3" get deviceid ^| findstr /r /v "^$"') do (
    manage-bde -off %%D -ctype full
)

echo BitLocker has been disabled on all fixed drives.
pause
goto menu

:MEET
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f
pause
goto menu

:ERROR
@echo off

:: Check if the script is running with administrator privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :disableWindowsErrorReporting
) else (
    echo Please run this script with administrator privileges.
    pause
    exit /b 1
)

:disableWindowsErrorReporting
:: Disable Windows Error Reporting
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f

echo Windows Error Reporting has been disabled.
pause
goto menu

:TASKBAR_LEFT
@echo off

:: Check if the script is running with administrator privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :alignTaskbar
) else (
    echo Please run this script with administrator privileges.
    pause
    exit /b 1
)

:alignTaskbar
:: Align the taskbar to the left
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /f

echo Taskbar has been aligned to the left.
pause
goto menu

:START_TELEM
:: Disable Cortana
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f

:: Disable search suggestions
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchSuggestionsEnabled" /t REG_DWORD /d 0 /f

:: Disable web search on the taskbar
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f

:: Disable web search in the Start menu
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f

:: Widgets
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f
cls
pause
goto menu
 
:MY_PEOPLE
:: Disable My People on the taskbar
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "PeopleBand" /t REG_DWORD /d 0 /f
cls
pause
goto menu
 
:FAX_PRIN
:: Disable Fax service
sc config fax stop
sc config fax start= disabled

:: Disable Print Spooler service
sc config spooler stop
sc config spooler start= disabled
cls
pause
goto menu
 
:SKYDRIVE
bitsadmin /transfer Skydrive_Disabler /download /priority high https://gist.githubusercontent.com/adasjusk/f49f1d9582ec1c9fa839105d6584a9b3/raw/594a77be5956b5b6cc4dcca9463f18338e2cb447/onedrive.bat %appdata%\InerJava-Programs\onedrive.bat
cmd /k %appdata%\InerJava-Programs\onedrive.bat
cls
pause
goto menu


:Intel_MM
bitsadmin /transfer Disabler /download /priority high https://raw.githubusercontent.com/bartblaze/Disable-Intel-AMT/master/sources/DisableAMT.bat %appdata%\InerJava-Programs\MM.bat
cmd /k %appdata%\InerJava-Programs\MM.bat
cls
pause
goto menu
 
:BSOD
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d 1 /f
cls
pause
goto menu
 
:SNAP
:: Disable WindowArrangementActive
reg add "HKCU\Control Panel\Desktop" /v "WindowArrangementActive" /t REG_SZ /d "0" /f

:: Disable EnableSnapAssistFlyout
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableSnapAssistFlyout" /t REG_DWORD /d 0 /f

:: Disable EnableSnapBar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableSnapBar" /t REG_DWORD /d 0 /f
cls
pause
goto menu
 
:NUM_LOCK
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_DWORD /d 2147483650 /f
cls
pause
goto menu
 
:EXT
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
cls
pause
goto menu
 
:UPDATE_RAZER_INSTALLERS
set "RazerPath=C:\Windows\Installer\Razer"

:: Disable driver auto-install via registry
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Installer" /v "DisableCoInstallers" /t REG_DWORD /d 1 /f

:: Remove and lock install directory
rmdir /s /q "%RazerPath%"
mkdir "%RazerPath%"
icacls "%RazerPath%" /deny "NT AUTHORITY\SYSTEM":(W)
cls
pause
goto menu
 
:MASSGRAVEL
bitsadmin /transfer Activator /download /priority high https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/master/MAS/Separate-Files-Version/Activators/HWID_Activation.cmd %appdata%\InerJava-Programs\HWID.bat
cmd /k %appdata%\InerJava-Programs\HWID.bat
cls
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