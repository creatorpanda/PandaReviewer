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
systeminfo | find /V /I "hotfix" | find /V "KB"
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO Motherboard's Information:
ECHO.
wmic baseboard get Name, product, Manufacturer, Version
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO CPU's Information:
ECHO.
wmic cpu get Name
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO RAM's Information:
ECHO.
wmic MemoryChip get Name, BankLabel, Capacity, MemoryType, TypeDetail, Speed
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO GPU's Information:
ECHO.
wmic path win32_VideoController get Name
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO GitHub: creatorpanda
ECHO creation of 2017
ECHO.
ECHO Check done! Scroll up to check this PC's specs,
set /p temp="or Press ENTER to close this window!"