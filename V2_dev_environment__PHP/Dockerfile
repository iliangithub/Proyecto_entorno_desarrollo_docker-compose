# Usamos la imagen base de PHP con Apache
FROM php:8.2-apache

# Instalación de Python y herramientas
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    curl \
    bash

# Instalación de Node.js y npm
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Habilitar mod_rewrite en Apache (si lo necesitas)
RUN a2enmod rewrite

# Instalación de extensiones PHP necesarias para MySQL y PDO
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Establecer el directorio de trabajo (para que el contenedor use este como raíz)
WORKDIR /var/www/html

# Copiar el código de tu aplicación al contenedor
COPY ./app/ /var/www/html/

# Instalación de dependencias de Node.js (si tienes un frontend con Node.js)
WORKDIR /var/www/html/frontend
RUN npm install

# Puerto del contenedor (por defecto Apache en el contenedor usa el puerto 80)
EXPOSE 80

# Comando para iniciar Apache, lo que mantendrá el contenedor activo
CMD ["apache2-foreground"]
