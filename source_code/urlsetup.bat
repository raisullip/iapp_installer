@echo off
:: CLEAN CMD
cls
:MENU
:: GO TO C:\
cd %HOMEDRIVE%\
:: MAKE ME PRETY
mode con:cols=50 lines=35
color 1F

ECHO                       __                         
ECHO                      /\ \__         __           
ECHO  _ __   __  __    ___\ \ ,_\  _ __ /\_\  ____    
ECHO /\`'__\/\ \/\ \ /' _ `\ \ \/ /\`'__\/\ \/\_ ,`\  
ECHO \ \ \/ \ \ \_\ \/\ \/\ \ \ \_\ \ \/ \ \ \/_/  /_ 
ECHO  \ \_\  \ \____/\ \_\ \_\ \__\\ \_\  \ \_\/\____\
ECHO   \/_/   \/___/  \/_/\/_/\/__/ \/_/   \/_/\/____/
ECHO.
ECHO                                   URL SETUP V 2.0
ECHO.
ECHO +-----------------------------------------------+
ECHO *               www.runtriz.com                 *
ECHO +-----------------------------------------------+
ECHO.


ECHO ENTER SHORTCODE:
SET /P shortcode=
ECHO.


ECHO ENTER PROPERTY ID:
SET /P id=
ECHO.

ECHO CHOOSE SCREEN TYPE:
ECHO.
ECHO [A] - Bartender
ECHO [B] - Server
ECHO.
SET /P M=Type your choice and press ENTER:
IF %M%==A IF EXIST "%PROGRAMFILES(X86)%" GOTO BARTENDER64 
IF %M%==B IF EXIST "%PROGRAMFILES(X86)%" GOTO SERVER64 
IF %M%==a IF EXIST "%PROGRAMFILES(X86)%" GOTO BARTENDER64 
IF %M%==b IF EXIST "%PROGRAMFILES(X86)%" GOTO SERVER64
IF %M%==A IF NOT EXIST "%PROGRAMFILES(X86)%" GOTO BARTENDER 
IF %M%==B IF NOT EXIST "%PROGRAMFILES(X86)%" GOTO SERVER
IF %M%==a IF NOT EXIST "%PROGRAMFILES(X86)%" GOTO BARTENDER 
IF %M%==b IF NOT EXIST "%PROGRAMFILES(X86)%" GOTO SERVER 
IF NOT %M%==A GOTO MENU
IF NOT %M%==B GOTO MENU
IF NOT %M%==a GOTO MENU
IF NOT %M%==b GOTO MENU
ECHO.




:: 64###########################################################################################################



:BARTENDER64

ECHO.
ECHO ENTER SCREEN NUMBER (ENTER 1 or 2):
SET /P Z=


dir /s /b chrome.exe > tmpchrome
set /p chromepath= < tmpchrome
"%ProgramFiles(x86)%\Runtriz\bin\make_url.exe" "%UserProfile%\Desktop\Runtriz_Casino" "%chromepath%" "--allow-running-insecure-content -kiosk http://mobilebev.com/%shortcode%/www/v2/bar_screen.php?ID=%id%&screenID=%Z%&viewonly=0" /q "" "" "" "%programfiles%\Runtriz\ico\runtriz.ico" 
C:\windows\system32\REG ADD HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run /v runtrizurl /d "%chromepath% --allow-running-insecure-content -kiosk https://mobilebev.com/%shortcode%/www/v2/bar_screen.php?ID=%id%&screenID=%Z%&viewonly=0" /f

del /s /q tmpchrome >NUL

pause
EXIT /B


:SERVER64
dir /s /b chrome.exe > tmpchrome
set /p chromepath= < tmpchrome
"%ProgramFiles(x86)%\Runtriz\bin\make_url.exe" "%UserProfile%\Desktop\Runtriz_Casino" "%chromepath%" "--allow-running-insecure-content -kiosk http://mobilebev.com/%shortcode%/www/v2/server_screen_pooled.php?ID=%id%" /q "" "" "" "%programfiles%\Runtriz\ico\runtriz.ico" 
C:\windows\system32\REG ADD HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run /v runtrizurl /d "%chromepath% --allow-running-insecure-content -kiosk https://mobilebev.com/%shortcode%/www/v2/server_screen_pooled.php?ID=%id%" /f

del /s /q tmpchrome >NUL

pause
EXIT /B



    
::32#########################################################################################################



:BARTENDER

ECHO.
ECHO ENTER SCREEN NUMBER (ENTER 1 or 2):
SET /P Z=


dir /s /b chrome.exe > tmpchrome
set /p chromepath= < tmpchrome
"%ProgramFiles%\Runtriz\bin\make_url.exe" "%UserProfile%\Desktop\Runtriz_Casino" "%chromepath%" "--allow-running-insecure-content -kiosk http://mobilebev.com/%shortcode%/www/v2/bar_screen.php?ID=%id%&screenID=%Z%&viewonly=0" /q "" "" "" "%programfiles%\Runtriz\ico\runtriz.ico" 
C:\windows\system32\REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v runtrizurl /d "%chromepath% --allow-running-insecure-content -kiosk https://mobilebev.com/%shortcode%/www/v2/bar_screen.php?ID=%id%&screenID=%Z%&viewonly=0" /f

del /s /q tmpchrome >NUL

pause
EXIT /B


:SERVER
dir /s /b chrome.exe > tmpchrome
set /p chromepath= < tmpchrome
"%ProgramFiles%\Runtriz\bin\make_url.exe" "%UserProfile%\Desktop\Runtriz_Casino" "%chromepath%" "--allow-running-insecure-content -kiosk http://mobilebev.com/%shortcode%/www/v2/server_screen_pooled.php?ID=%id%" /q "" "" "" "%programfiles%\Runtriz\ico\runtriz.ico" 
C:\windows\system32\REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v runtrizurl /d "%chromepath% --allow-running-insecure-content -kiosk https://mobilebev.com/%shortcode%/www/v2/server_screen_pooled.php?ID=%id%" /f

del /s /q tmpchrome >NUL

pause
EXIT /B



