@echo off
chcp 65001
cls

REM Tiene que ser ejecutado desde CMD o PowerShell, no exclusivamente uno de los dos.

echo.
echo ==============================================================
echo.
echo Bienvenido al Script para crear el entorno de desarrollo PHP
echo.
echo ==============================================================
echo.
echo ¿Qué es lo que deseas hacer?
echo.
echo 1 - Iniciar el script y crear el entorno.
echo 2 - Eliminar los contenedores (docker-compose down -v)
echo 3 - Salir de este script
echo.
echo SOLO ESCRIBA EL NÚMERO, NADA MÁS
echo.
set /p opcion="Por favor, selecciona una opción (1/2/3): "

if "%opcion%"=="1" (
    echo.
    echo ==============================================================
    echo Has seleccionado: Iniciar el script y crear el entorno.
    echo ==============================================================
    echo.

    echo Iniciando contenedores Docker...
    docker-compose up -d --build

    REM El -d (detached mode) sirve para que las cosas se ejecuten en segundo plano...

    echo Contenedores en ejecución:
    docker ps

    echo Aplicación disponible en: http://localhost:8080
) 
if "%opcion%"=="2" (
    echo.
    echo ==============================================================
    echo Has seleccionado: Eliminar los contenedores (docker-compose down -v).
    echo ==============================================================
    echo.

    docker-compose down -v

    REM Pausa de 3 segundos en PowerShell
    timeout /t 3 /nobreak >nul

    echo "Contenedores Eliminados"
)

if "%opcion%"=="3" (
    echo.
    echo ==============================================================
    echo Has seleccionado: Salir del Script, adiós.
    echo ==============================================================
    echo.

    exit /b 0
)

REM Si se elige una opción no válida
echo.
echo ==============================================================
echo Opción no válida. Por favor, selecciona 1, 2 o 3.
echo ==============================================================
echo.

REM Esta línea asegura que la ventana no se cierre inmediatamente
pause