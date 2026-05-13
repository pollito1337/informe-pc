@echo off
color 0a
title                                    Informe Completo de Laptop - V0.2
echo.
echo                             ====================================================
echo                                 INFORME DETALLADO DE COMPONENTES Y BATERIA
echo                                              BY POLLITO1337
echo                             ====================================================
timeout /t 5 >nul
cls
echo.

echo                                     =========================================
echo                                           ABRIENDO CUENTA DE GITHUB
echo                                            github.com/pollito1337
echo                                     =========================================

start https://github.com/pollito1337

timeout /t 5 >nul
cls

:: Función para simular escritura
set "delay=echo."

echo [1/8] Cargando informacion general del sistema...
timeout /t 1 >nul
systeminfo > "%USERPROFILE%\Desktop\Informe_Laptop.txt"

echo [2/8] Obteniendo datos del Procesador (CPU)...
timeout /t 1 >nul
wmic cpu get name, numberofcores, numberoflogicalprocessors, currentclocksspeed, maxclockspeed >> "%USERPROFILE%\Desktop\Informe_Laptop.txt"

echo [3/8] Analizando Memoria RAM...
timeout /t 1 >nul
wmic memorychip get manufacturer, capacity, speed, partnumber >> "%USERPROFILE%\Desktop\Informe_Laptop.txt"
echo. >>  "%USERPROFILE%\Desktop\Informe_Laptop.txt"
wmic computersystem get totalphysicalmemory >> "%USERPROFILE%\Desktop\Informe_Laptop.txt"

echo [4/8] Revisando Discos (SSD/HDD)...
timeout /t 1 >nul
wmic diskdrive get model, size, status, mediatype >> "%USERPROFILE%\Desktop\Informe_Laptop.txt"

echo [5/8] Detectando Tarjeta Grafica...
timeout /t 1 >nul
wmic path win32_VideoController get name, adapterram, driverversion >> "%USERPROFILE%\Desktop\Informe_Laptop.txt"

echo [6/8] Obteniendo informacion de la Placa Base...
timeout /t 1 >nul
wmic baseboard get product, manufacturer, version >> "%USERPROFILE%\Desktop\Informe_Laptop.txt"

echo [7/8] Revisando adaptadores de red...
timeout /t 1 >nul
ipconfig /all >> "%USERPROFILE%\Desktop\Informe_Laptop.txt"

echo [8/8] Generando reporte detallado de bateria...
timeout /t 2 >nul
powercfg /batteryreport /output "%USERPROFILE%\Desktop\battery_report.html"

echo.
echo ==========================================
echo     ¡Informe completado con exito!
echo ==========================================
echo.
echo Se han creado los siguientes archivos en tu Escritorio:
echo.
echo ·Informe_Laptop.txt (Todos los componentes)
echo ·baterry_report.html (salud completa de la bateria)
echo.
echo Abriendo archivos...
timeout /t 2 >nul

start "" "%USERPROFILE%\Desktop\Informe_Laptop.txt"
start "" "%USERPROFILE%\Desktop\battery_report.html"

echo.
echo Listo. Puedes cerrar esta ventana.
pause