@echo off
chcp 65001 >nul
title POLLITO1337 SYSTEM ANALYZER
color 0A
mode con: cols=100 lines=35

:: =========================================================
:: VARIABLES
:: =========================================================
set "REPORT=%USERPROFILE%\Desktop\Informe_Laptop.txt"
set "BATTERY=%USERPROFILE%\Desktop\battery_report.html"

:: =========================================================
:: INTRO MATRIX
:: =========================================================
:matrix
cls
echo.
echo  ██▓███   ▒█████   ██▓     ██▓     ██▓▄▄▄█████▓ ▒█████
echo ▓██░  ██▒▒██▒  ██▒▓██▒    ▓██▒    ▓██▒▓  ██▒ ▓▒▒██▒  ██▒
echo ▓██░ ██▓▒▒██░  ██▒▒██░    ▒██░    ▒██▒▒ ▓██░ ▒░▒██░  ██▒
echo ▒██▄█▓▒ ▒▒██   ██░▒██░    ▒██░    ░██░░ ▓██▓ ░ ▒██   ██░
echo ▒██▒ ░  ░░ ████▓▒░░██████▒░██████▒░██░  ▒██▒ ░ ░ ████▓▒░
echo ▒▓▒░ ░  ░░ ▒░▒░▒░ ░ ▒░▓  ░░ ▒░▓  ░░▓    ▒ ░░   ░ ▒░▒░▒░
echo ░▒ ░       ░ ▒ ▒░ ░ ░ ▒  ░░ ░ ▒  ░ ▒ ░    ░      ░ ▒ ▒░
echo ░░       ░ ░ ░ ▒    ░ ░     ░ ░    ▒ ░  ░      ░ ░ ░ ▒
echo               ░ ░      ░  ░    ░  ░ ░               ░ ░
echo.
echo ===============================================================
echo              ADVANCED SYSTEM ANALYZER v2.0
echo ===============================================================
echo.
echo              INITIALIZING MODULES...
echo.

timeout /t 2 >nul

:: =========================================================
:: GITHUB
:: =========================================================
echo [+] OPENING GITHUB PROFILE...
start https://github.com/pollito1337
timeout /t 3 >nul

:: =========================================================
:: BORRAR REPORTES ANTERIORES
:: =========================================================
if exist "%REPORT%" del "%REPORT%"
if exist "%BATTERY%" del "%BATTERY%"

cls
echo.
echo ===============================================================
echo                 SYSTEM SCAN IN PROGRESS
echo ===============================================================
echo.

:: =========================================================
:: ESCANEO
:: =========================================================
call :progress "ANALYZING SYSTEM"
systeminfo > "%REPORT%"

call :progress "SCANNING CPU"
wmic cpu get name,numberofcores,numberoflogicalprocessors,maxclockspeed >> "%REPORT%"

call :progress "CHECKING MEMORY"
wmic memorychip get manufacturer,capacity,speed,partnumber >> "%REPORT%"
echo. >> "%REPORT%"
wmic computersystem get totalphysicalmemory >> "%REPORT%"

call :progress "ANALYZING STORAGE"
wmic diskdrive get model,size,status,mediatype >> "%REPORT%"

call :progress "DETECTING GPU"
wmic path win32_VideoController get name,adapterram,driverversion >> "%REPORT%"

call :progress "READING MOTHERBOARD"
wmic baseboard get manufacturer,product,version >> "%REPORT%"

call :progress "CHECKING NETWORK"
ipconfig /all >> "%REPORT%"

call :progress "GENERATING BATTERY REPORT"
powercfg /batteryreport /output "%BATTERY%" >nul

:: =========================================================
:: FINAL
:: =========================================================
cls
color 0B

echo.
echo ===============================================================
echo                    SCAN COMPLETED SUCCESSFULLY
echo ===============================================================
echo.
echo   [✓] SYSTEM REPORT GENERATED
echo   [✓] BATTERY REPORT GENERATED
echo.
echo ---------------------------------------------------------------
echo   FILES LOCATION:
echo ---------------------------------------------------------------
echo.
echo   %REPORT%
echo   %BATTERY%
echo.
echo ===============================================================
echo.

timeout /t 2 >nul

echo [+] OPENING REPORTS...
start "" "%REPORT%"
start "" "%BATTERY%"

echo.
echo ===============================================================
echo                  ALL TASKS FINISHED
echo ===============================================================
echo.

pause
exit

:: =========================================================
:: BARRA ANIMADA
:: =========================================================
:progress
cls
echo.
echo ===============================================================
echo                  SYSTEM SCAN IN PROGRESS
echo ===============================================================
echo.
echo   %~1
echo.

<nul set /p=   [
timeout /t 1 >nul
<nul set /p=■■■■■
timeout /t 1 >nul
<nul set /p=■■■■■
timeout /t 1 >nul
<nul set /p=■■■■■
timeout /t 1 >nul
echo ■■■■■] 100%%
echo.

exit /b
