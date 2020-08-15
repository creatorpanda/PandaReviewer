@ECHO OFF
TITLE PandaReviewer
cls
color 0F
ECHO An experienced panda engineer will now make a cool list of this PC's specs!
ECHO This may take a while..
ECHO (Hotfix list is disabled. run the "systeminfo" command in a cmd to see all)
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO Basic Info:
ECHO.
ECHO -------------- WINDOWS LICENSE DESCRIPTION --------------
ECHO.
ECHO RETAIL: Best key: you can use it again on this device if you ever consider a format 
ECHO + you're not going to lose activation if you change PC parts
ECHO.
ECHO OEM: Only available for this PC: You also cannot change PC parts (despite HDD/SSD and RAMs) or you will lose activation.
ECHO.
ECHO VOLUME: Please consider finding another Windows Key. This key type can even be a tracked, cracked, or hacked Windows version!!!
ECHO.
ECHO -------------- WINDOWS LICENSE DESCRIPTION --------------
ECHO Please close pop-up windows to continue..
ECHO.
slmgr -dli
ECHO.
wmic bios get serialnumber
ECHO.
wmic path softwarelicensingservice get OA3xOriginalProductKey
ECHO.
systeminfo | find /V /I "hotfix" | find /V "KB"
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO Motherboard Information:
ECHO.
wmic baseboard get Name, product, Manufacturer, Version, Status
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO CPU Information:
ECHO.
wmic cpu get Name
ECHO.
wmic cpu get Version, deviceid, Status
ECHO.
wmic cpu get architecture,  datawidth, StatusInfo,family
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO RAM Information:
ECHO.
wmic MemoryChip get Name, BankLabel, Capacity, MemoryType, TypeDetail, Speed
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO GPU Information:
ECHO.
wmic path win32_VideoController get Name, Status
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO Storage Information:
ECHO.
wmic logicaldisk get  Deviceid, description, filesystem, size,  freespace
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO Screen Information:
ECHO.
wmic desktopmonitor get name, status
ECHO.
FOR /F "DELIMS=" %%# IN  ('"wmic path Win32_VideoController  get CurrentHorizontalResolution,CurrentVerticalResolution /format:value"') do (
  set "%%#">nul
)
ECHO Resolution
ECHO %CurrentHorizontalResolution% x %CurrentVerticalResolution%
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO Network Information:
ECHO.
ipconfig/all
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO GitHub: creatorpanda
ECHO creation of 2017
ECHO.
ECHO Check done! Scroll up to check this PC's specs,
set /p temp="or Press ENTER to close this window!"
