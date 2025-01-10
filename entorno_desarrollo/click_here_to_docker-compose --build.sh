#!/bin/bash

echo "Iniciando contenedores Docker..."
docker-compose up -d --build

#con este comando se construye los contenedores docker utilizando el proyecto "docker-compose.yml"

    # el -d (detached mode) sirve para que las cosas se ejecuten en segundo plano...
    # entonces, sin la -d significaría que el terminal muestra los logs de todos los servicios y si hago con CTRL + C se cierran los contenedores.

    # podriamos usar "docker-compose logs -f" para ver los logs mientras los servicios están corriendo en segundo plano.

echo "Contenedores en ejecución:"
docker ps

echo "Aplicación disponible en: http://localhost:8080"
