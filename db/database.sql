CREATE DATABASE streetwise COLLATE utf8_general_ci;

USE steetwise; 

CREATE TABLE usuario (
    COD_USUARIO INT (12) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NOMBRES VARCHAR(50) NOT NULL,
    APELLIDOS VARCHAR(50) NOT NULL,
    CORREO VARCHAR(50) NOT NULL,
    CELULAR INT(12) NOT NULL,
    FECHA_NACIMIENTO DATE NOT NULL,
    CONTRASENA LONGTEXT NOT NULL
)

INSERT INTO usuario VALUES
("Sara", "Londoño", "sara@gmail.com", 3142345643, "2023-05-03", "Sara12345")