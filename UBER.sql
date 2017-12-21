-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.29-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for serviciouber
DROP DATABASE IF EXISTS `serviciouber`;
CREATE DATABASE IF NOT EXISTS `serviciouber` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `serviciouber`;

-- Dumping structure for procedure serviciouber.insertar_cliente
DROP PROCEDURE IF EXISTS `insertar_cliente`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_cliente`(
	IN `dpic` INT,
	IN `nom` VARCHAR(50),
	IN `dir` VARCHAR(50),
	IN `tel` INT
)
BEGIN
INSERT INTO tcliente(DPI,nombre,direccion,telefono)
VALUES(dpic,nom,dir,tel);
END//
DELIMITER ;

-- Dumping structure for table serviciouber.tbicicleta
DROP TABLE IF EXISTS `tbicicleta`;
CREATE TABLE IF NOT EXISTS `tbicicleta` (
  `IDbici` int(10) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL DEFAULT '0',
  `NoServicio1` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IDbici`),
  KEY `noservicio1` (`NoServicio1`),
  CONSTRAINT `noservicio1` FOREIGN KEY (`NoServicio1`) REFERENCES `tservicio` (`NoServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table serviciouber.tbicicleta: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbicicleta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbicicleta` ENABLE KEYS */;

-- Dumping structure for table serviciouber.tcarro
DROP TABLE IF EXISTS `tcarro`;
CREATE TABLE IF NOT EXISTS `tcarro` (
  `IDcarro` int(10) NOT NULL,
  `marca` varchar(15) NOT NULL,
  PRIMARY KEY (`IDcarro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table serviciouber.tcarro: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcarro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcarro` ENABLE KEYS */;

-- Dumping structure for table serviciouber.tcliente
DROP TABLE IF EXISTS `tcliente`;
CREATE TABLE IF NOT EXISTS `tcliente` (
  `DPI` int(13) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` int(8) NOT NULL,
  PRIMARY KEY (`DPI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table serviciouber.tcliente: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcliente` ENABLE KEYS */;

-- Dumping structure for table serviciouber.tconductor
DROP TABLE IF EXISTS `tconductor`;
CREATE TABLE IF NOT EXISTS `tconductor` (
  `IDconductor` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `horario` int(10) NOT NULL DEFAULT '0',
  `telefono` int(8) NOT NULL DEFAULT '0',
  `DPI2` int(13) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IDconductor`),
  KEY `dpi2` (`DPI2`),
  CONSTRAINT `dpi2` FOREIGN KEY (`DPI2`) REFERENCES `tcliente` (`DPI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table serviciouber.tconductor: ~0 rows (approximately)
/*!40000 ALTER TABLE `tconductor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tconductor` ENABLE KEYS */;

-- Dumping structure for table serviciouber.thelicoptero
DROP TABLE IF EXISTS `thelicoptero`;
CREATE TABLE IF NOT EXISTS `thelicoptero` (
  `IDhelicoptero` int(10) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL DEFAULT '0',
  `NoServicio2` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IDhelicoptero`),
  KEY `noservicio2` (`NoServicio2`),
  CONSTRAINT `noservicio2` FOREIGN KEY (`NoServicio2`) REFERENCES `tservicio` (`NoServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table serviciouber.thelicoptero: ~0 rows (approximately)
/*!40000 ALTER TABLE `thelicoptero` DISABLE KEYS */;
/*!40000 ALTER TABLE `thelicoptero` ENABLE KEYS */;

-- Dumping structure for table serviciouber.tservicio
DROP TABLE IF EXISTS `tservicio`;
CREATE TABLE IF NOT EXISTS `tservicio` (
  `NoServicio` int(10) NOT NULL AUTO_INCREMENT,
  `DPI3` int(13) NOT NULL DEFAULT '0',
  PRIMARY KEY (`NoServicio`),
  KEY `dpi3` (`DPI3`),
  CONSTRAINT `dpi3` FOREIGN KEY (`DPI3`) REFERENCES `tcliente` (`DPI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table serviciouber.tservicio: ~0 rows (approximately)
/*!40000 ALTER TABLE `tservicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tservicio` ENABLE KEYS */;

-- Dumping structure for table serviciouber.tserviciocarro
DROP TABLE IF EXISTS `tserviciocarro`;
CREATE TABLE IF NOT EXISTS `tserviciocarro` (
  `DPI1` int(13) NOT NULL DEFAULT '0',
  `IDCarro1` int(10) NOT NULL DEFAULT '0',
  KEY `dpi1` (`DPI1`),
  KEY `idcarro1` (`IDCarro1`),
  CONSTRAINT `dpi1` FOREIGN KEY (`DPI1`) REFERENCES `tcliente` (`DPI`),
  CONSTRAINT `idcarro1` FOREIGN KEY (`IDCarro1`) REFERENCES `tcarro` (`IDcarro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table serviciouber.tserviciocarro: ~0 rows (approximately)
/*!40000 ALTER TABLE `tserviciocarro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tserviciocarro` ENABLE KEYS */;

-- Dumping structure for table serviciouber.tserviciomensajero
DROP TABLE IF EXISTS `tserviciomensajero`;
CREATE TABLE IF NOT EXISTS `tserviciomensajero` (
  `IDmensajero` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `telefono` int(8) NOT NULL DEFAULT '0',
  `DPI4` int(13) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IDmensajero`),
  KEY `dpi4` (`DPI4`),
  CONSTRAINT `dpi4` FOREIGN KEY (`DPI4`) REFERENCES `tcliente` (`DPI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table serviciouber.tserviciomensajero: ~0 rows (approximately)
/*!40000 ALTER TABLE `tserviciomensajero` DISABLE KEYS */;
/*!40000 ALTER TABLE `tserviciomensajero` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
