@echo off

chcp 65001

echo.
echo ===================================================================================
echo.
echo Bienvenido a la aplicación para borrar Contenedores, Imágenes, Volúmenes, y Builds
echo Si borrarlos desde la aplicación de docker es imposible, desde aquí SI.
echo.
echo ===================================================================================
echo.
set /p respuesta=¿Deseas eliminar todos los contenedores, imágenes, volúmenes y limpiar el build cache? (si/no): 

if /i "%respuesta%"=="si" (
	:: Elimina los contenedores detenidos
	FOR /F "tokens=*" %%i IN ('docker ps -aq') DO (
   		echo Eliminando contenedor %%i
   	 	docker rm -f %%i
	)

	:: Elimina las imágenes de Docker
	FOR /F "tokens=*" %%i IN ('docker images -aq') DO (
    		echo Eliminando imagen %%i
    		docker rmi -f %%i
	)

	:: Elimina los volúmenes de Docker
	FOR /F "tokens=*" %%i IN ('docker volume ls -q') DO (
   		echo Eliminando volumen %%i
    	docker volume rm %%i
	)

	:: Limpia el build cache
	docker builder prune -f
) else (
    echo Operación cancelada.
)
:: Pausa al final para poder leer los resultados
pause
