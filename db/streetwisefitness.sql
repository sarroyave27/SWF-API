-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-05-2023 a las 07:33:21
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `streetwisefitness`
--
CREATE DATABASE IF NOT EXISTS `streetwisefitness` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `streetwisefitness`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `spCreateUsers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreateUsers` (IN `_NOMBRES` VARCHAR(50), IN `_APELLIDOS` VARCHAR(50), IN `_CORREO` VARCHAR(50), IN `_CELULAR` INT(10), IN `_FECHA_NACIMIENTO` DATE, IN `_CONTRASENA` LONGTEXT)   BEGIN 
INSERT INTO usuario(NOMBRES,APELLIDOS,CORREO,CELULAR,FECHA_NACIMIENTO,CONTRASEÑA) VALUES (_NOMBRES,_APELLIDOS,_CORREO,_CELULAR,_FECHA_NACIMIENTO,_CONTRASENA);
END$$

DROP PROCEDURE IF EXISTS `spFindAllUsers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllUsers` ()   BEGIN
	SELECT COD_USUARIO, NOMBRES, APELLIDOS, FECHA_NACIMIENTO FROM usuario;
END$$

DROP PROCEDURE IF EXISTS `spFindUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindUser` (IN `_COD_USUARIO` INT(10))   BEGIN
	SELECT COD_USUARIO,NOMBRES,APELLIDOS,CORREO,CELULAR,FECHA_NACIMIENTO FROM usuario WHERE COD_USUARIO =_COD_USUARIO;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `COD_USUARIO` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRES` varchar(50) NOT NULL,
  `APELLIDOS` varchar(50) NOT NULL,
  `CORREO` varchar(50) NOT NULL,
  `CELULAR` int(10) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `CONTRASEÑA` longtext NOT NULL,
  PRIMARY KEY (`COD_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`COD_USUARIO`, `NOMBRES`, `APELLIDOS`, `CORREO`, `CELULAR`, `FECHA_NACIMIENTO`, `CONTRASEÑA`) VALUES
(1, 'Kevin Alexander', 'Londoño', 'kevin@gmail.com', 12345678, '2002-04-19', 'kevinbonito'),
(3, 'Kevin', 'El mas lindo', 'kevin19@gmail.com', 12345679, '2002-06-19', 'kevinbonitos212'),
(4, 'Sara', 'La hermosa', 'sara08@gmail.com', 313454, '2006-06-20', 'kevinhermosobonitos212'),
(5, 'Saris', 'La preciosa', 'sara08@gmail.com', 313454, '2006-06-20', 'kevinhermosobonitos212');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
