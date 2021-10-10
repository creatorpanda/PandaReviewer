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
ECHO RETAIL: You can transfer the product key to another computer, as long as you deactivate the old device.
ECHO.
ECHO OEM: Should only be provided by system Builders and it is a legit licence. If that licence came pre-installed on your PC, you can use that to re-install Windows on that PC any number of times.
ECHO.
ECHO VOLUME: Designed for a large business, education, and government scenario. Usually, it allows organizations to use one master product key to activate any installation of Windows.
ECHO.
ECHO -------------- WINDOWS LICENSE DESCRIPTION --------------
ECHO Please close pop-up windows to continue..
ECHO.
slmgr -dli
ECHO.
ECHO Device's Serial Number
wmic bios get serialnumber
ECHO.
ECHO Windows Product Key (Activation Key)
reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v BackupProductKeyDefault
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
