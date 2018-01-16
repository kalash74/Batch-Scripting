@echo off
echo Apagado automatico del equipo
echo =======================
:menu
echo A) Apagar en una hora
echo B) Apagar en dos horas
echo C) Elegir cuando apagar
echo D) Cancelar el apagado
echo E) Salir
choice /C abcde /M "Elige una opcion"
if errorlevel 5 goto sal1
if errorlevel 4 goto sal2
if errorlevel 3 goto sal3
if errorlevel 2 goto sal4
if errorlevel 1 goto sal5
:sal5
shutdown /s /t 3600
goto sal1
:sal4
shutdown /s /t 7200
goto sal1
:sal3
echo Introduce el tiempo que debe esperar para apagarse en minutos
set /p mitiempo=
set /a mitiempo=mitiempo*60
if %mitiempo%.==. echo No has introducido un tiempo válido
if %mitiempo%.==. echo No has introducido un tiempo válido
shutdown /s /t %mitiempo%
if errorlevel 1 echo Algo salio mal &pause > nul & echo Pulsa una tecla para volver al menú &goto menu
goto sal1
:sal2
shutdown /a
if errorlevel 1 pause
:sal1
exit /B
