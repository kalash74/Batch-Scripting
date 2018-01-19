@echo off
setlocal
:inicio
cls
echo === Identificacion ===
echo Introduce tu usuario. (Default: root)
set /p nombre_usuario=
if %nombre_usuario%.==. set nombre_usuario=root
:ip
cls
echo == Conexion ==
echo "La direccion por defecto es 127.0.0.1"
echo A) Conexion defecto
echo B) Elegir una nueva direccion
choice /C:ab /M "Selecciona una opcion"
if errorlevel 2 goto b
if errorlevel 1 goto a
:b
echo "Introduce la nueva direccion"
set /p fqdn_bd=
goto menu
:a
set fqdn_bd=127.0.0.1
:menu
cls
echo == Menu Principal ==
echo.
echo La direccion actual es: %fqdn_bd% el usuario: %nombre_usuario%
echo.
echo A) Ver la ayuda de mysql
echo B) Entrar en la aplicacion
echo C) Cambiar las credenciales
echo D) Elegir otra direccion para mysql
echo E) Ejecutar fichero por lotes
echo F) Ver la salida del fichero por lotes
echo G) Sacame de aqui
choice /C:abcdefg /M "Selecciona una opcion"
if errorlevel 7 goto sal7
if errorlevel 6 goto sal6
if errorlevel 5 goto sal5
if errorlevel 4 goto sal4
if errorlevel 3 goto sal3
if errorlevel 2 goto sal2
if errorlevel 1 goto sal1
REM Anyadi las opciones E y F para ejecutar un script
:sal1
C:\xampp\mysql\bin\mysql.exe --help | more
goto menu
:sal2
echo (Default: sin password)
C:\xampp\mysql\bin\mysql.exe -h %fqdn_bd% -u %nombre_usuario% -p
goto menu
:sal3
cls
echo === Identificacion ===
echo Introduce tu usuario.
set /p nombre_usuario=
goto menu
:sal4
goto ip
:sal5
echo Introduce la ruta del script
set /p script=
if not exist %script% echo No existe el fichero, comprueba que la ruta sea correcta &pause > nul &echo Pulsa una tecla para volver al menu &goto menu
echo == Salida del fichero %script%, Fecha %DATE%, Hora %TIME%, usuario %nombre_usuario% == >> salida
C:\xampp\mysql\bin\mysql.exe -h %fqdn_bd% -u %nombre_usuario% -p -t < %script% >> salida
goto menu
:sal6
if exist salida (type salida | more) else echo No existe el fichero de salida, se crea en la carpeta actual al ejecutar un script &pause &goto menu
pause
goto menu
:sal7
set fqdn_bd=
set nombre_usuario=
set script=
endlocal
exit /B
