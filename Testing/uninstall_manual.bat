:: Uninstall Windows 10 APPXS


@Echo Off & Color 0E


net sess>nul 2>&1||(powershell start cmd -ArgumentList """/c %~0""" -verb Runas & exit)

Cd %TMP%

:Choice

Cls 
Echo.
Echo 1. Reinstall and Re-Register All Windows Apps for Current Account Only
Echo.
Echo 2. Reinstall and Re-Register All Windows Apps for All Accounts
Echo.
Echo 3. Uninstall 3D Builder
Echo.
Echo 4. Uninstall 3D Viewer
Echo.
Echo 5. Uninstall Alarms and Clock
Echo.
Echo 6. Uninstall App Connector
Echo.
Echo 7. Uninstall Calculator
Echo.
Echo 8. Uninstall Calendar and Mail
Echo.
Echo 9. Uninstall Camera
Echo.
Echo 10. Uninstall Candy Crush Soda Saga
Echo.
Echo 11. Uninstall Contact Support
Echo.
Echo 12. Uninstall Drawboard PDF
Echo.
Echo 13. Uninstall Feedback Hub
Echo.
Echo 14. Uninstall Get Help
Echo.
Echo 15. Uninstall Get Office
Echo.
Echo 16. Uninstall Get Started
Echo.
Echo 17. Uninstall Groove Music
Echo.
Echo 18. Uninstall Mail and Calendar
Echo.
Echo 19. Uninstall Maps
Echo.
Echo 20. Uninstall Messaging
Echo.
Echo 21. Uninstall Microsoft Solitaire Collection
Echo.
Echo 22. Uninstall Microsoft Store
Echo.
Echo 23. Uninstall Microsoft Whiteboad
Echo.
Echo 24. Uninstall Mixed Reality Portal
Echo.
Echo 25. Uninstall Money
Echo.
Echo 26. Uninstall Movies and TV
Echo.
Echo 27. Uninstall News
Echo.
Echo 28. Uninstall OneDrive
Echo.
Echo 29. Uninstall OneNote
Echo.
Echo 30. Uninstall Paint 3D
Echo.
Echo 31. Uninstall Phone
Echo.
Echo 32. Uninstall Phone Companion
Echo.
Echo 33. Uninstall Photos
Echo.
Echo 34. Uninstall Skype
Echo.
Echo 35. Uninstall Snip and Sketch
Echo.
Echo 36. Uninstall Sports
Echo.
Echo 37. Uninstall Sticky Notes
Echo.
Echo 38. Uninstall Sway
Echo.
Echo 39. Uninstall Tips
Echo.
Echo 40. Uninstall Twitter
Echo.
Echo 41. Uninstall Voice Recorder
Echo.
Echo 42. Uninstall Weather
Echo.
Echo 43. Uninstall Xbox Console Companion
Echo.
Echo 44. Uninstall Xbox Game Bar
Echo.
Echo 45. Uninstall Xbox One SmartGlass
Echo.
Echo 46. Uninstall Your Phone
Echo.


Set /p input= Type a number: 

If %input%==1 Goto :Current
If %input%==2 Goto :All
If %input%==3 Goto :3DBuilder
If %input%==4 Goto :3DViewer
If %input%==5 Goto :Alarms
If %input%==6 Goto :Connector
If %input%==7 Goto :Calculator
If %input%==8 Goto :Communications
If %input%==9 Goto :Camera
If %input%==10 Goto :Candy
If %input%==11 Goto :ContactSupport
If %input%==12 Goto :DrawboardPDF
If %input%==13 Goto :FeedbackHub
If %input%==14 Goto :ContactSupport
If %input%==15 Goto :Office
If %input%==16 Goto :GetStarted
If %input%==17 Goto :ZuneMusic
If %input%==18 Goto :Communicationsapps
If %input%==19 Goto :Maps
If %input%==20 Goto :Messaging
If %input%==21 Goto :Solitaire
If %input%==22 Goto :Store
If %input%==23 Goto :Whiteboard
If %input%==24 Goto :MixedReality
If %input%==25 Goto :BingFinance
If %input%==26 Goto :ZuneVideo
If %input%==27 Goto :BingNews
If %input%==28 Goto :OneDrive
If %input%==29 Goto :OneNote
If %input%==30 Goto :MSPaint
If %input%==31 Goto :Phone
If %input%==32 Goto :WindowsPhone
If %input%==33 Goto :Photos
If %input%==34 Goto :Skype
If %input%==35 Goto :ScreenSketch
If %input%==36 Goto :BingSports
If %input%==37 Goto :StickyNotes
If %input%==38 Goto :Sway
If %input%==39 Goto :Tips
If %input%==40 Goto :Twitter
If %input%==41 Goto :SoundRecorder
If %input%==42 Goto :Weather
If %input%==43 Goto :XboxApp
If %input%==44 Goto :XboxGamingOverlay
If %input%==45 Goto :XboxOneSmartGlass
If %input%==46 Goto :YourPhone


Goto :EOF
























:Current



Echo Get-AppXPackage ^| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"} > Current.ps1

Powershell -ExecutionPolicy ByPass -File Current.ps1

Del Current.ps1

Goto :Choice

:All



Echo Get-AppXPackage -AllUsers ^| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"} > All.ps1

Powershell -ExecutionPolicy ByPass -File All.ps1

Del All.ps1

Goto :Choice

:3DBuilder

Echo Get-AppxPackage *3DBuilder* ^| Remove-AppxPackage > 3DBuilder.ps1

Powershell -ExecutionPolicy ByPass -File 3DBuilder.ps1

Del 3DBuilder.ps1

Goto :Choice


:3DViewer

Echo Get-AppxPackage *Microsoft3DViewer* ^| Remove-AppxPackage > 3DViewer.ps1

Powershell -ExecutionPolicy ByPass -File 3DViewer.ps1

Del 3DViewer.ps1

Goto :Choice



:Alarms

Echo Get-AppxPackage *WindowsAlarms* ^| Remove-AppxPackage > Alarms.ps1

Powershell -ExecutionPolicy ByPass -File Alarms.ps1

Del Alarms.ps1

Goto :Choice



:Connector

Echo Get-AppxPackage *AppConnector* ^| Remove-AppxPackage > Connector.ps1

Powershell -ExecutionPolicy ByPass -File Connector.ps1

Del Connector.ps1

Goto :Choice



:Calculator

Echo Get-AppxPackage *WindowsCalculator* ^| Remove-AppxPackage > Calculator.ps1

Powershell -ExecutionPolicy ByPass -File Calculator.ps1

Del Calculator.ps1

Goto :Choice


:Communications

Echo Get-AppxPackage *windowscommunicationsapps* ^| Remove-AppxPackage > Communications.ps1

Powershell -ExecutionPolicy ByPass -File Communications.ps1

Del Communications.ps1

Goto :Choice



:Camera

Echo Get-AppxPackage *WindowsCamera* ^| Remove-AppxPackage > Camera.ps1

Powershell -ExecutionPolicy ByPass -File Camera.ps1

Del Camera.ps1

Goto :Choice




:Candy

Echo Get-AppxPackage *CandyCrushSodaSaga* ^| Remove-AppxPackage > Candy.ps1

Powershell -ExecutionPolicy ByPass -File Candy.ps1

Del Candy.ps1

Goto :Choice




:ContactSupport

Echo Get-AppxPackage *ContactSupport* ^| Remove-AppxPackage > ContactSupport.ps1

Powershell -ExecutionPolicy ByPass -File ContactSupport.ps1

Del ContactSupport.ps1

Goto :Choice





:DrawboardPDF

Echo Get-AppxPackage *DrawboardPDF* ^| Remove-AppxPackage > DrawboardPDF.ps1

Powershell -ExecutionPolicy ByPass -File DrawboardPDF.ps1

Del DrawboardPDF.ps1

Goto :Choice



:FeedbackHub

Echo Get-AppxPackage *WindowsFeedbackHub* ^| Remove-AppxPackage > FeedbackHub.ps1

Powershell -ExecutionPolicy ByPass -File FeedbackHub.ps1

Del FeedbackHub.ps1

Goto :Choice




:ContactSupport

Echo Get-AppxPackage *ContactSupport* ^| Remove-AppxPackage > ContactSupport.ps1

Powershell -ExecutionPolicy ByPass -File ContactSupport.ps1

Del ContactSupport.ps1

Goto :Choice



:Office

Echo Get-AppxPackage *MicrosoftOfficeHub* ^| Remove-AppxPackage > Office.ps1

Powershell -ExecutionPolicy ByPass -File Office.ps1

Del Office.ps1

Goto :Choice




:GetStarted

Echo Get-AppxPackage *GetStarted* ^| Remove-AppxPackage > GetStarted.ps1

Powershell -ExecutionPolicy ByPass -File GetStarted.ps1

Del GetStarted.ps1

Goto :Choice



:ZuneMusic

Echo Get-AppxPackage *ZuneMusic* ^| Remove-AppxPackage > ZuneMusic.ps1

Powershell -ExecutionPolicy ByPass -File ZuneMusic.ps1

Del ZuneMusic.ps1

Goto :Choice



:Communicationsapps

Echo Get-AppxPackage *windowscommunicationsapps* ^| Remove-AppxPackage > Communicationsapps.ps1

Powershell -ExecutionPolicy ByPass -File Communicationsapps.ps1

Del Communicationsapps.ps1

Goto :Choice



:Maps

Echo Get-AppxPackage *WindowsMaps* ^| Remove-AppxPackage > Maps.ps1

Powershell -ExecutionPolicy ByPass -File Maps.ps1

Del Maps.ps1

Goto :Choice





:Messaging

Echo Get-AppxPackage *Messaging* ^| Remove-AppxPackage > Messaging.ps1

Powershell -ExecutionPolicy ByPass -File Messaging.ps1

Del Messaging.ps1

Goto :Choice






:Solitaire


Echo Get-AppxPackage *MicrosoftSolitaireCollection* ^| Remove-AppxPackage > Solitaire.ps1

Powershell -ExecutionPolicy ByPass -File Solitaire.ps1

Del Solitaire.ps1

Goto :Choice



:Store

Echo Get-AppxPackage *WindowsStore* ^| Remove-AppxPackage > Store.ps1

Powershell -ExecutionPolicy ByPass -File Store.ps1

Del Store.ps1

Goto :Choice





:Whiteboard

Echo Get-AppxPackage *Microsoft.Whiteboard* ^| Remove-AppxPackage > Whiteboard.ps1

Powershell -ExecutionPolicy ByPass -File Whiteboard.ps1

Del Whiteboard.ps1

Goto :Choice




:MixedReality

Echo Get-AppxPackage *Microsoft.MixedReality.Portal* ^| Remove-AppxPackage > MixedReality.ps1

Powershell -ExecutionPolicy ByPass -File MixedReality.ps1

Del MixedReality.ps1

Goto :Choice




:BingFinance

Echo Get-AppxPackage *BingFinance* ^| Remove-AppxPackage > BingFinance.ps1

Powershell -ExecutionPolicy ByPass -File BingFinance.ps1

Del BingFinance.ps1

Goto :Choice




:ZuneVideo


Echo Get-AppxPackage *ZuneVideo* ^| Remove-AppxPackage > ZuneVideo.ps1

Powershell -ExecutionPolicy ByPass -File ZuneVideo.ps1

Del ZuneVideo.ps1

Goto :Choice





:BingNews

Echo Get-AppxPackage *BingNews* ^| Remove-AppxPackage > BingNews.ps1

Powershell -ExecutionPolicy ByPass -File BingNews.ps1

Del BingNews.ps1

Goto :Choice




:OneDrive

Echo Get-AppxPackage *microsoft.microsoftskydrive* ^| Remove-AppxPackage > OneDrive.ps1

Powershell -ExecutionPolicy ByPass -File OneDrive.ps1

Del OneDrive.ps1

Goto :Choice






:OneNote

Echo Get-AppxPackage *Office.OneNote* ^| Remove-AppxPackage > OneNote.ps1

Powershell -ExecutionPolicy ByPass -File OneNote.ps1

Del OneNote.ps1

Goto :Choice




:MSPaint

Echo Get-AppxPackage *MSPaint* ^| Remove-AppxPackage > MSPaint.ps1

Powershell -ExecutionPolicy ByPass -File MSPaint.ps1

Del MSPaint.ps1

Goto :Choice





:Phone

Echo Get-AppxPackage *CommsPhone* ^| Remove-AppxPackage > Phone.ps1

Powershell -ExecutionPolicy ByPass -File Phone.ps1

Del Phone.ps1

Goto :Choice



:WindowsPhone

Echo Get-AppxPackage *WindowsPhone* ^| Remove-AppxPackage > WindowsPhone.ps1

Powershell -ExecutionPolicy ByPass -File WindowsPhone.ps1

Del WindowsPhone.ps1

Goto :Choice




:Photos

Echo Get-AppxPackage *Photos* ^| Remove-AppxPackage > Photos.ps1

Powershell -ExecutionPolicy ByPass -File Photos.ps1

Del Photos.ps1

Goto :Choice






:Skype

Echo Get-AppxPackage *SkypeApp* ^| Remove-AppxPackage > Skype.ps1

Powershell -ExecutionPolicy ByPass -File Skype.ps1

Del Skype.ps1

Goto :Choice



:ScreenSketch


Echo Get-AppxPackage *Microsoft.ScreenSketch* ^| Remove-AppxPackage > ScreenSketch.ps1

Powershell -ExecutionPolicy ByPass -File ScreenSketch.ps1

Del ScreenSketch.ps1

Goto :Choice



:BingSports

Echo Get-AppxPackage *BingSports* ^| Remove-AppxPackage > BingSports.ps1

Powershell -ExecutionPolicy ByPass -File BingSports.ps1

Del BingSports.ps1

Goto :Choice




:StickyNotes

Echo Get-AppxPackage *MicrosoftStickyNotes* ^| Remove-AppxPackage > StickyNotes.ps1

Powershell -ExecutionPolicy ByPass -File StickyNotes.ps1

Del StickyNotes.ps1

Goto :Choice



:Sway

Echo Get-AppxPackage *Office.Sway* ^| Remove-AppxPackage > Sway.ps1

Powershell -ExecutionPolicy ByPass -File Sway.ps1

Del Sway.ps1

Goto :Choice





:Tips

Echo Get-AppxPackage *Microsoft.Getstarted* ^| Remove-AppxPackage > Tips.ps1

Powershell -ExecutionPolicy ByPass -File Tips.ps1

Del Tips.ps1

Goto :Choice




:Twitter

Echo Get-AppxPackage *Twitter* ^| Remove-AppxPackage > Twitter.ps1

Powershell -ExecutionPolicy ByPass -File Twitter.ps1

Del Twitter.ps1

Goto :Choice




:SoundRecorder

Echo Get-AppxPackage *WindowsSoundRecorder* ^| Remove-AppxPackage > SoundRecorder.ps1

Powershell -ExecutionPolicy ByPass -File SoundRecorder.ps1

Del SoundRecorder.ps1

Goto :Choice





:Weather

Echo Get-AppxPackage *BingWeather* ^| Remove-AppxPackage > Weather.ps1

Powershell -ExecutionPolicy ByPass -File Weather.ps1

Del Weather.ps1

Goto :Choice





:XboxApp

Echo Get-AppxPackage *XboxApp* ^| Remove-AppxPackage > XboxApp.ps1

Powershell -ExecutionPolicy ByPass -File XboxApp.ps1

Del XboxApp.ps1

Goto :Choice





:XboxGamingOverlay

Echo Get-AppxPackage *Microsoft.XboxGamingOverlay* ^| Remove-AppxPackage > XboxGamingOverlay.ps1

Powershell -ExecutionPolicy ByPass -File XboxGamingOverlay.ps1

Del XboxGamingOverlay.ps1

Goto :Choice





:XboxOneSmartGlass

Echo Get-AppxPackage *XboxOneSmartGlass* ^| Remove-AppxPackage > XboxOneSmartGlass.ps1

Powershell -ExecutionPolicy ByPass -File XboxOneSmartGlass.ps1

Del XboxOneSmartGlass.ps1

Goto :Choice





:YourPhone

Echo Get-AppxPackage *Microsoft.YourPhone* ^| Remove-AppxPackage > YourPhone.ps1

Powershell -ExecutionPolicy ByPass -File YourPhone.ps1

Del YourPhone.ps1

Goto :Choice