# Utiliza una imagen base oficial de PHP con Apache
FROM php:8.1-apache

# Instalar las dependencias necesarias para la conexión con MySQL
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo pdo_mysql

# Copiar el código fuente de la aplicación al contenedor
COPY app/ /var/www/html/

# Ajustar los permisos para Apache
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Habilitar el módulo rewrite de Apache (necesario para muchas aplicaciones PHP)
RUN a2enmod rewrite