DELETE DATABASE IF NOT EXISTS entorno_desarrollo_esquema_bd
CREATE DATABASE IF NOT EXISTS entorno_desarrollo_esquema_bd;

USE entorno_desarrollo_esquema_bd;

-- Crear tabla de usuarios
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Insertar un usuario de prueba
INSERT INTO users (username, password) 
VALUES ('admin', '1234');  -- Recuerda: la contraseña en texto plano debe cambiarse por algo más seguro en producción
