-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2023 a las 00:33:24
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

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
DROP PROCEDURE IF EXISTS `spCreatePlan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreatePlan` (IN `_NOMBRE` VARCHAR(100), IN `_DESCRIPCION` VARCHAR(100))   BEGIN 
INSERT INTO plan(NOMBRE,DESCRIPCION) VALUES (_NOMBRE,_DESCRIPCION);
END$$

DROP PROCEDURE IF EXISTS `spCreateUsers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreateUsers` (IN `_NOMBRES` VARCHAR(50), IN `_APELLIDOS` VARCHAR(50), IN `_CORREO` VARCHAR(50), IN `_CELULAR` INT(10), IN `_FECHA_NACIMIENTO` DATE, IN `_CONTRASENA` LONGTEXT, IN `_COD_ROL` INT(10))   BEGIN 
INSERT INTO usuario(NOMBRES,APELLIDOS,CORREO,CELULAR,FECHA_NACIMIENTO,CONTRASENA,COD_ROL) VALUES (_NOMBRES,_APELLIDOS,_CORREO,_CELULAR,_FECHA_NACIMIENTO,_CONTRASENA, _COD_ROL);
END$$

DROP PROCEDURE IF EXISTS `spDisableUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDisableUser` (IN `_COD_USUARIO` INT(100), IN `_ESTADO` BOOLEAN)   BEGIN
	UPDATE usuario SET ESTADO = _ESTADO WHERE COD_USUARIO= _COD_USUARIO;
END$$

DROP PROCEDURE IF EXISTS `spEditPlan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spEditPlan` (IN `_COD_PLAN` INT(10), IN `_DESCRIPCION` VARCHAR(100))   BEGIN
	UPDATE plan SET DESCRIPCION = _DESCRIPCION WHERE COD_PLAN= _COD_PLAN;
END$$

DROP PROCEDURE IF EXISTS `spFindAllPlans`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllPlans` ()   BEGIN
	SELECT COD_PLAN, NOMBRE, DESCRIPCION FROM plan;
END$$

DROP PROCEDURE IF EXISTS `spFindAllUsers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllUsers` ()   BEGIN
	SELECT COD_USUARIO, NOMBRES, APELLIDOS, FECHA_NACIMIENTO,COD_ROL,ESTADO,CELULAR FROM usuario;
END$$

DROP PROCEDURE IF EXISTS `spFindUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindUser` (IN `_COD_USUARIO` INT(10))   BEGIN
	SELECT COD_USUARIO,NOMBRES,APELLIDOS,CORREO,CELULAR,FECHA_NACIMIENTO FROM usuario WHERE COD_USUARIO =_COD_USUARIO;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE IF NOT EXISTS `asistencia` (
  `COD_ASIS` int(100) NOT NULL AUTO_INCREMENT,
  `FECHA` date NOT NULL,
  `COD_USERPLAN` int(100) DEFAULT NULL,
  PRIMARY KEY (`COD_ASIS`),
  KEY `COD_USERPLAN` (`COD_USERPLAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

DROP TABLE IF EXISTS `plan`;
CREATE TABLE IF NOT EXISTS `plan` (
  `COD_PLAN` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  PRIMARY KEY (`COD_PLAN`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`COD_PLAN`, `NOMBRE`, `DESCRIPCION`) VALUES
(1, 'Tren Superior', '¡Presentamos el \"Plan del Tren Superior\"! Un programa de entrenamiento focalizado diseñado para fort'),
(2, 'Tren Inferior', '¡Descubre el \"Plan de Tren Inferior\"! Este programa de entrenamiento se enfoca en fortalecer y tonif'),
(3, 'Plan General', '¡Bienvenido al \"Plan Total de Acondicionamiento\"! Este programa de entrenamiento integral está diseñ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planusuario`
--

DROP TABLE IF EXISTS `planusuario`;
CREATE TABLE IF NOT EXISTS `planusuario` (
  `COD_USERPLAN` int(100) NOT NULL AUTO_INCREMENT,
  `COD_USUARIO` int(100) DEFAULT NULL,
  `COD_PLAN` int(10) DEFAULT NULL,
  PRIMARY KEY (`COD_USERPLAN`),
  KEY `COD_USUARIO` (`COD_USUARIO`),
  KEY `COD_PLAN` (`COD_PLAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

DROP TABLE IF EXISTS `recetas`;
CREATE TABLE IF NOT EXISTS `recetas` (
  `COD_RECETA` int(100) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `COD_USUARIO` int(100) DEFAULT NULL,
  PRIMARY KEY (`COD_RECETA`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`),
  KEY `COD_USUARIO` (`COD_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas_usuarios`
--

DROP TABLE IF EXISTS `recetas_usuarios`;
CREATE TABLE IF NOT EXISTS `recetas_usuarios` (
  `COD_RECETA_USUARIO` int(100) NOT NULL AUTO_INCREMENT,
  `COD_RECETA` int(100) DEFAULT NULL,
  `COD_USUARIO` int(100) DEFAULT NULL,
  PRIMARY KEY (`COD_RECETA_USUARIO`),
  KEY `COD_RECETA` (`COD_RECETA`),
  KEY `COD_USUARIO` (`COD_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `COD_ROL` int(10) NOT NULL,
  `ROL` varchar(100) NOT NULL,
  PRIMARY KEY (`COD_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`COD_ROL`, `ROL`) VALUES
(1, 'Usuario'),
(2, 'Entrenador'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `COD_USUARIO` int(100) NOT NULL AUTO_INCREMENT,
  `NOMBRES` varchar(50) NOT NULL,
  `APELLIDOS` varchar(50) NOT NULL,
  `CORREO` varchar(50) NOT NULL,
  `CELULAR` varchar(20) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `CONTRASENA` longtext NOT NULL,
  `COD_ROL` int(10) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`COD_USUARIO`),
  UNIQUE KEY `CORREO` (`CORREO`),
  UNIQUE KEY `CELULAR` (`CELULAR`),
  KEY `COD_ROL` (`COD_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`COD_USUARIO`, `NOMBRES`, `APELLIDOS`, `CORREO`, `CELULAR`, `FECHA_NACIMIENTO`, `CONTRASENA`, `COD_ROL`, `ESTADO`) VALUES
(1, 'Kevin', 'Alocer', 'kevin123@gmail.com', '2147483647', '2002-05-02', '2002', 1, 1),
(2, 'Carmen', 'Valdibia', 'Maricarmen@gmail.com', '3134141', '2002-03-02', '123', 1, 1),
(8, 'Alejandro', 'Carcia', 'kevin@gmail.com', '32058327', '2002-05-03', 'kevin12', 1, 1),
(10, 'Mariano', 'Garcia', 'KevinPro@gmail.com', '314573', '2002-04-03', '123123', 1, 1),
(12, 'Mariano', 'Garcia', 'KevinPro123@gmail.com', '38', '2002-04-09', '12', 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`COD_USERPLAN`) REFERENCES `planusuario` (`COD_USERPLAN`);

--
-- Filtros para la tabla `planusuario`
--
ALTER TABLE `planusuario`
  ADD CONSTRAINT `planusuario_ibfk_1` FOREIGN KEY (`COD_USUARIO`) REFERENCES `usuario` (`COD_USUARIO`),
  ADD CONSTRAINT `planusuario_ibfk_2` FOREIGN KEY (`COD_PLAN`) REFERENCES `plan` (`COD_PLAN`);

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`COD_USUARIO`) REFERENCES `usuario` (`COD_USUARIO`);

--
-- Filtros para la tabla `recetas_usuarios`
--
ALTER TABLE `recetas_usuarios`
  ADD CONSTRAINT `recetas_usuarios_ibfk_1` FOREIGN KEY (`COD_RECETA`) REFERENCES `recetas` (`COD_RECETA`),
  ADD CONSTRAINT `recetas_usuarios_ibfk_2` FOREIGN KEY (`COD_USUARIO`) REFERENCES `usuario` (`COD_USUARIO`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`COD_ROL`) REFERENCES `rol` (`COD_ROL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
