@echo off
chcp 65001 > nul
cls

:menu
cls
echo.
echo ==============================================================
echo Bienvenido al Script para crear el entorno de desarrollo PHP
echo ==============================================================
echo Por favor, seleccione una opción:
echo.
echo 1 - Iniciar el script y crear el entorno
echo 2 - Eliminar SÓLO los contenedores del entorno PHP (docker-compose down -v)
echo 3 - Salir de este script
echo 4 - Acceder al contenedor de la Base de Datos (User:User Password:Password)
echo 5 - Acceder al contenedor de la Página Web
echo 6 - Ver todos los contenedores que FUNCIONAN (docker ps)
echo 7 - Ver todos los contenedores QUE FUNCIONAN Y NO FUNCIONAN (docker ps -a)
echo.
set /p opcion=Por favor, selecciona una opción (1/2/3/4/5/6/7): 

REM Acción según la opción elegida
if "%opcion%"=="1" (
    cls
    echo Has seleccionado: Iniciar el script y crear el entorno.
    echo Iniciando contenedores Docker...
    docker-compose up -d --build || echo Error: Docker Compose falló.
    echo.
    echo Contenedores en ejecución:
    docker ps || echo Error: No se pueden listar los contenedores.
    echo.
    echo Aplicación disponible en: http://localhost:8080
    pause
    goto menu
)

if "%opcion%"=="2" (
    cls
    echo Has seleccionado: Eliminar los contenedores.
    docker-compose down -v || echo Error: Fallo al eliminar los contenedores.
    pause
    goto menu
)

if "%opcion%"=="3" (
    cls
    echo Has seleccionado: Salir del Script. ¡Hasta luego!
    pause
    exit /b
)

if "%opcion%"=="4" (
    cls
    echo Has seleccionado: Acceder al contenedor de la Base de Datos.
    docker exec -it mysql-db-entorno-desarrollo-v1 mysql -u user -p || echo Error: Fallo al acceder al contenedor.
    pause
    goto menu
)

if "%opcion%"=="5" (
    cls
    echo Has seleccionado: Acceder al contenedor de la Página Web.
    docker exec -it php-web-entorno-desarrollo-v1 bash || echo Error: Fallo al acceder al contenedor de la página web.
    pause
    goto menu
)

if "%opcion%"=="6" (
    cls
    echo Has seleccionado: Mostrar los contenedores que funcionan.
    docker ps || echo Error: Fallo al listar los contenedores que funcionan.
    pause
    goto menu
)

if "%opcion%"=="7" (
    cls
    echo Has seleccionado: Mostrar todos los contenedores (funcionen o no).
    docker ps -a > nul 2>&1
    if %errorlevel% neq 0 (
        echo Error: Fallo al listar todos los contenedores.
    ) else (
        docker ps -a
    )
    pause
    goto menu
)

REM Si la opción no es válida
echo Opción no válida. Por favor selecciona una opción del 1 al 7.
pause
goto menu

