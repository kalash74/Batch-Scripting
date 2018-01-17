@echo off
echo Introduce el límite:
set /p limite
set /a cuenta=0
:bucle
set /a cuenta=%cuenta%+1
echo %cuenta% vuelta(s).
pause>null
REM Muy importante los espacios
if %cuenta%==%limite% (exit /b) else (goto :bucle)
