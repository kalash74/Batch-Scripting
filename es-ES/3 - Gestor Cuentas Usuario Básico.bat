@echo off
setlocal
:menu
echo ===== Utilidad de cuentas =======
echo A) Ver las cuentas de usuario
echo B) Agregar una cuenta de usuario
echo C) Eliminar una cuenta de usuario
echo D) No realizar cambios
choice /C:abcd /M "Seleccione una opcion"
if errorlevel 4 goto sal4
if errorlevel 3 goto sal3
if errorlevel 2 goto sal2
if errorlevel 1 goto sal1

:sal1
net user
goto menu
:sal2
echo Introduce el nombre de usuario
set /p usuario=
net user /add %usuario% *
goto menu
:sal3
echo Introduce el nombre de usuario
set /p usuario=
net user %usuario% /delete
goto menu
:sal4
endlocal