#ESTE SCRIPT ES UN .sh NO UN .bat, ESTO SE EJECUTA CON EL GITBASH, NO CON EL CMD, ESTO ES DE LINUX, NO WINDOWS.
clear

echo " "
echo " "
echo " "
echo "=============================================================="
echo " "
echo "Bienvenido al Script para crear el entorno de desarrollo PHP"
echo " "
echo "=============================================================="
echo " "
echo "¿Qué es lo que deseas hacer?"
echo " "
echo "1 - Iniciar el script y crear el entorno."
echo "2 - Eliminar los contenedores (docker-compose down -v)"
echo "3 - Salir de este script"
echo " "
echo "SOLO ESCRIBA EL NÚMERO, NADA MÁS"
echo " "
read -p "Por favor, selecciona una opción (1/2/3): " opcion

# Acción según la opción elegida
case $opcion in
    1)  echo " "
        echo " "
        echo " "
        echo "======================================================================="
        echo "Has seleccionado: Iniciar el script y crear el entorno."
        echo "======================================================================="
        echo " "
        echo " "
        echo " "
       
        echo "Iniciando contenedores Docker..."
        docker-compose up -d --build

        #con este comando se construye los contenedores docker utilizando el proyecto "docker-compose.yml"

            # el -d (detached mode) sirve para que las cosas se ejecuten en segundo plano...
            # entonces, sin la -d significaría que el terminal muestra los logs de todos los servicios y si hago con CTRL + C se cierran los contenedores.

            # podriamos usar "docker-compose logs -f" para ver los logs mientras los servicios están corriendo en segundo plano.

        echo "Contenedores en ejecución:"
        docker ps

        echo "Aplicación disponible en: http://localhost:8080"

        ;;
    2)  echo " "
        echo " "
        echo " "
        echo "======================================================================="
        echo "Has seleccionado: Eliminar los contenedores (docker-compose down -v)."
        echo "======================================================================="
        echo " "
        echo " "

        docker-compose down -v
        ;;
    3)
        echo " "
        echo " "
        echo " "
        echo "======================================================================="
        echo "Has seleccionado: Salir del Script, adiós."
        echo "======================================================================="
        echo " "
        echo " "
        exit 0
        ;;
    *)
        echo " "
        echo " "
        echo " "
        echo "======================================================================="
        echo "Opción no válida. Por favor, selecciona 1, 2 o 3."
        echo "======================================================================="
        echo " "
        echo " "
        ;;
esac
