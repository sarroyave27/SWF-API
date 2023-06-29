-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2023 a las 02:22:46
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

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
DROP PROCEDURE IF EXISTS `spConsultUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultUser` (IN `_CORREO` VARCHAR(50), IN `_CONTRASENA` LONGTEXT)  BEGIN
	SELECT CORREO,CONTRASENA,NOMBRES FROM usuario WHERE CORREO =_CORREO &&  CONTRASENA=_CONTRASENA;
END$$

DROP PROCEDURE IF EXISTS `spCreateAssis`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreateAssis` (IN `_FECHA` DATE)  BEGIN 
	INSERT INTO asistencia(FECHA) VALUES (_FECHA);
END$$

DROP PROCEDURE IF EXISTS `spCreatePlan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreatePlan` (IN `_NOMBRE` VARCHAR(100), IN `_DESCRIPCION` VARCHAR(100))  BEGIN 
INSERT INTO plan(NOMBRE,DESCRIPCION) VALUES (_NOMBRE,_DESCRIPCION);
END$$

DROP PROCEDURE IF EXISTS `spCreateRecipes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreateRecipes` (IN `_NOMBRE` VARCHAR(100), IN `_DESCRIPCION` LONGTEXT, IN `_COD_USUARIO` INT(100))  BEGIN 
INSERT INTO recetas(NOMBRE,DESCRIPCION,COD_USUARIO) VALUES (_NOMBRE,_DESCRIPCION,_COD_USUARIO);
END$$

DROP PROCEDURE IF EXISTS `spCreateUsers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreateUsers` (IN `_NOMBRES` VARCHAR(50), IN `_APELLIDOS` VARCHAR(50), IN `_CORREO` VARCHAR(50), IN `_CELULAR` INT(10), IN `_FECHA_NACIMIENTO` DATE, IN `_CONTRASENA` LONGTEXT, IN `_COD_ROL` INT(10))  BEGIN 
INSERT INTO usuario(NOMBRES,APELLIDOS,CORREO,CELULAR,FECHA_NACIMIENTO,CONTRASENA,COD_ROL) VALUES (_NOMBRES,_APELLIDOS,_CORREO,_CELULAR,_FECHA_NACIMIENTO,_CONTRASENA, _COD_ROL);
END$$

DROP PROCEDURE IF EXISTS `spDeletePlan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletePlan` (IN `_COD_PLAN` INT(10))  BEGIN
	DELETE FROM plan WHERE COD_PLAN = _COD_PLAN; 
END$$

DROP PROCEDURE IF EXISTS `spDisablePlan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDisablePlan` (IN `_COD_PLAN` BOOLEAN, IN `_ESTADO` BOOLEAN)  BEGIN
	UPDATE plan SET ESTADO = _ESTADO WHERE COD_PLAN= _COD_PLAN;
END$$

DROP PROCEDURE IF EXISTS `spDisableRecipe`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDisableRecipe` (IN `_COD_RECETA` INT(100), IN `_ESTADO` BOOLEAN)  BEGIN
	UPDATE recetas SET ESTADO = _ESTADO WHERE COD_RECETA= _COD_RECETA;
END$$

DROP PROCEDURE IF EXISTS `spDisableUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDisableUser` (IN `_COD_USUARIO` INT(100), IN `_ESTADO` BOOLEAN)  BEGIN
	UPDATE usuario SET ESTADO = _ESTADO WHERE COD_USUARIO= _COD_USUARIO;
END$$

DROP PROCEDURE IF EXISTS `spEditPlan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spEditPlan` (IN `_COD_PLAN` INT(10), IN `_DESCRIPCION` VARCHAR(100))  BEGIN
	UPDATE plan SET DESCRIPCION = _DESCRIPCION WHERE COD_PLAN= _COD_PLAN;
END$$

DROP PROCEDURE IF EXISTS `spEditRecipes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spEditRecipes` (IN `_COD_RECETA` INT(100), IN `_NOMBRE` VARCHAR(100), IN `_DESCRIPCION` LONGTEXT)  BEGIN
	UPDATE recetas SET NOMBRE = _NOMBRE, DESCRIPCION =_DESCRIPCION  WHERE COD_RECETA = _COD_RECETA;
END$$

DROP PROCEDURE IF EXISTS `spEditUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spEditUser` (IN `_COD_USUARIO` INT(100), IN `_CONTRASENA` LONGTEXT, IN `_CELULAR` INT(20))  BEGIN
	UPDATE usuario SET CELULAR =_CELULAR AND CONTRASENA =_CONTRASENA  WHERE COD_USUARIO= _COD_USUARIO;
END$$

DROP PROCEDURE IF EXISTS `spFindAllPlans`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllPlans` ()  BEGIN
	SELECT COD_PLAN, NOMBRE, DESCRIPCION, ESTADO FROM plan;
END$$

DROP PROCEDURE IF EXISTS `spFindAllUsers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllUsers` ()  BEGIN
	SELECT COD_USUARIO, NOMBRES, APELLIDOS, FECHA_NACIMIENTO,CORREO,COD_ROL,ESTADO,CELULAR,CONTRASENA FROM usuario;
END$$

DROP PROCEDURE IF EXISTS `spFindAPlan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAPlan` (IN `_COD_PLAN` INT(10))  BEGIN
	SELECT NOMBRE,DESCRIPCION, ESTADO FROM plan WHERE COD_PLAN =_COD_PLAN;
END$$

DROP PROCEDURE IF EXISTS `spFindUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindUser` (IN `_COD_USUARIO` INT(10))  BEGIN
	SELECT COD_USUARIO,NOMBRES,APELLIDOS,CORREO,CELULAR,FECHA_NACIMIENTO FROM usuario WHERE COD_USUARIO =_COD_USUARIO;
END$$

DROP PROCEDURE IF EXISTS `spGetAllPlanUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetAllPlanUser` ()  BEGIN 
SELECT A.COD_USERPLAN, A.COD_USUARIO, U.CORREO, A.COD_PLAN, P.NOMBRE, P.DESCRIPCION, P.ESTADO FROM planusuario A INNER JOIN PLAN P ON A.COD_PLAN = P.COD_PLAN INNER JOIN USUARIO U ON A.COD_USUARIO = U.COD_USUARIO;
END$$

DROP PROCEDURE IF EXISTS `spGetRecipe`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetRecipe` ()  BEGIN
SELECT R.COD_RECETA, R.NOMBRE, R.DESCRIPCION, R.COD_USUARIO, U.CORREO, R.ESTADO FROM recetas R INNER JOIN usuario U ON R.COD_USUARIO = U.COD_USUARIO;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

DROP TABLE IF EXISTS `plan`;
CREATE TABLE IF NOT EXISTS `plan` (
  `COD_PLAN` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `DESCRIPCION` longtext NOT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`COD_PLAN`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`COD_PLAN`, `NOMBRE`, `DESCRIPCION`, `ESTADO`) VALUES
(4, 'Recomposicion corporal', 'Entrenamiento basado en dietas para la recomposicion corporal y ejercicios aerobicos', 1),
(5, 'Deficit calorico', 'Plan desarrollado para personas en sobre peso; basado en entrenamientos aerobicos y de perdida de calorias', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `planusuario`
--

INSERT INTO `planusuario` (`COD_USERPLAN`, `COD_USUARIO`, `COD_PLAN`) VALUES
(1, 14, 4),
(2, 10, 4),
(3, 18, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

DROP TABLE IF EXISTS `recetas`;
CREATE TABLE IF NOT EXISTS `recetas` (
  `COD_RECETA` int(100) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `DESCRIPCION` longtext NOT NULL,
  `COD_USUARIO` int(100) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`COD_RECETA`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`),
  KEY `COD_USUARIO` (`COD_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`COD_RECETA`, `NOMBRE`, `DESCRIPCION`, `COD_USUARIO`, `ESTADO`) VALUES
(3, 'Limonada de coco', 'Baja 80 Kilos ahora!', 1, 1),
(4, 'Baja Kilos 3000', 'Baja 20 kilos en media hora', 2, 0),
(5, 'Banana Coco', 'Baja 80kilos', 2, 1),
(12, 'Banano Monstruo', 'Baja Grasita', 2, 0),
(14, 'Banano Exotico', 'Que se lo que dios quiera', 1, 1),
(15, '200g carbohidratos', 'arroz y pasta', 1, 1),
(17, 'arroz', 'carbohidratos', 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`COD_USUARIO`, `NOMBRES`, `APELLIDOS`, `CORREO`, `CELULAR`, `FECHA_NACIMIENTO`, `CONTRASENA`, `COD_ROL`, `ESTADO`) VALUES
(1, 'Kevin', 'Alocer', 'kevin123@gmail.com', '2147483647', '2002-05-02', '2002', 1, 1),
(2, 'Carmen', 'Valdibia', 'Maricarmen@gmail.com', '3134141', '2002-03-02', '123', 1, 1),
(8, 'Alejandro', 'Carcia', 'kevin@gmail.com', '32058327', '2002-05-03', 'kevin12', 1, 1),
(10, 'Mariano', 'Garcia', 'KevinPro@gmail.com', '314573', '2002-04-03', '123123', 1, 1),
(12, 'Mariano', 'Garcia', 'KevinPro123@gmail.com', '0', '2002-04-09', 'sebastianpro', 1, 1),
(13, 'Kevin Alberto', 'Valencia', 'kevinalg2020@gmail.com', '313457323', '2023-06-06', 'KevinLO3', 1, 1),
(14, 'Kevin Julian', 'Zaragoza', 'Kevincae@gmail.com', '31313', '2000-06-14', '40404', 2, 1),
(15, 'Kevin Julian', 'Garcia', 'kevin1203@gmail.com', '31321', '2023-06-12', '1234', 1, 1),
(16, 'Antonio', 'Marcos', 'Maricarmensa@gmail.com', '3131', '2023-06-06', 'test1', 1, 1),
(17, 'Arnoldo', 'Cabal', 'ArCabal@gmail.com', '313433', '2023-06-05', '987', 1, 1),
(18, 'Avaro', 'Guitierez', 'Alva@gmail.com', '314141', '2023-06-13', '123v', 1, 1),
(19, 'Isabella', 'Hernandez', 'isabella@gmail.com', '423825556', '2005-05-04', '123', 1, 1);

--
-- Restricciones para tablas volcadas
--

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
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`COD_ROL`) REFERENCES `rol` (`COD_ROL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
