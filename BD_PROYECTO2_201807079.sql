CREATE DATABASE  IF NOT EXISTS `db1_proyecto2_201807079` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db1_proyecto2_201807079`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: db1_proyecto2_201807079
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acta`
--

DROP TABLE IF EXISTS `acta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `habilitado` int NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ACTA_HABILITADO_idx` (`habilitado`),
  CONSTRAINT `FK_ACTA_HABILITADO` FOREIGN KEY (`habilitado`) REFERENCES `habilitados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acta`
--

LOCK TABLES `acta` WRITE;
/*!40000 ALTER TABLE `acta` DISABLE KEYS */;
INSERT INTO `acta` VALUES (0,9,'2022-10-26 15:54:56');
/*!40000 ALTER TABLE `acta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_acta` AFTER INSERT ON `acta` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha creado una nueva acta.", "INSERT", "ACTA");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_acta` AFTER UPDATE ON `acta` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha actualizado un acta", "UPDATE", "ACTA");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (0,'Área Común'),(1,'Ingeniería en Ciencias y Sistemas'),(2,'Ingeniería Civil'),(3,'Ingeniería Mecáncia Industrial'),(4,'Ingeniería Industrial'),(5,'Ingeniería Electrica'),(6,'Ingeniería Mecáncia Eléctrica');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ingresarCarrera` AFTER INSERT ON `carrera` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha ingresado una nueva carrera.", "INSERT", "CARRERA");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `codigo` int NOT NULL,
  `carrera` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `creditosN` int NOT NULL,
  `creditosO` int NOT NULL,
  `obligatorio` bit(1) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_CURSO_CARRERA_idx` (`carrera`),
  CONSTRAINT `FK_CURSO_CARRERA` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (17,0,'Social Humanística 1',0,4,_binary ''),(39,0,'Deportes 1',0,1,_binary '\0'),(40,0,'Deportes 2',1,1,_binary '\0'),(69,0,'Técnica Complementaria 1',0,3,_binary ''),(80,2,'Topografía 1',0,6,_binary ''),(82,2,'Topografía 2',0,6,_binary ''),(101,0,'Matemática Básica 1',0,7,_binary ''),(103,0,'Matemática Básica 2',0,7,_binary ''),(147,0,'Física Básica',0,5,_binary ''),(204,5,'Circuítos Eléctricos 1',0,6,_binary ''),(206,5,'Circuítos Eléctricos 2',0,6,_binary ''),(210,5,'Teoría Eletromagnética 1',0,6,_binary ''),(218,6,'Líneas de transimisión',0,5,_binary ''),(232,5,'Electrónica 1',0,6,_binary ''),(250,2,'Mecánica de Fluídos',0,6,_binary ''),(300,2,'Resistencia de Materiales',0,5,_binary ''),(302,2,'Resistencia de Materiales 2',0,5,_binary ''),(390,3,'Termodinámica 1',0,5,_binary ''),(454,3,'Metalurgia y Metalografía',0,6,_binary ''),(455,6,'Metalurgia y Metalografía',0,6,_binary ''),(462,5,'Electricidad y electrónica básica',0,5,_binary ''),(520,4,'Procesos de Manufactura 1',0,3,_binary ''),(521,6,'Procesos de manufactura 1',0,3,_binary ''),(601,4,'Investigación de Operaciones 1',0,5,_binary ''),(632,4,'Ingeniería de Plantas',0,6,_binary ''),(650,6,'Contabilidad 1',30,3,_binary '\0'),(656,3,'Administración de Empresas 1',30,5,_binary ''),(658,3,'Administración de Personal',0,3,_binary ''),(660,3,'Mercadotécnia',0,3,_binary ''),(661,4,'Mercadotécnia',0,3,_binary ''),(665,4,'Microeconomía',0,3,_binary ''),(722,6,'Teoría de sistemas 1',0,5,_binary '\0'),(770,1,'Introduccion a la Programación y Computación 1',0,4,_binary ''),(771,1,'Introduccion a la Programación y Computación 2',0,5,_binary ''),(796,1,'Lenguajes Formales y de Programación',0,3,_binary ''),(960,1,'Mate Cómputo 1',33,5,_binary ''),(962,1,'Mate Cómputo 2',38,5,_binary '');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ingresarCurso` AFTER INSERT ON `curso` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha creado un nuevo curso.", "INSERT", "CURSO");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizarCurso` AFTER UPDATE ON `curso` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se han actualizado los valores de un curso", "UPDATE", "CURSO");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `curso_estudiante`
--

DROP TABLE IF EXISTS `curso_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_estudiante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` int NOT NULL,
  `carnet` bigint NOT NULL,
  `ciclo` varchar(2) NOT NULL,
  `seccion` char(1) NOT NULL,
  `añoActual` year NOT NULL,
  `tipo` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ASIGNACION_ESTUDIANTE_idx` (`carnet`),
  KEY `FK_ASIGNACION_CURSO_idx` (`codigo`),
  CONSTRAINT `FK_ASIGNACION_CURSO` FOREIGN KEY (`codigo`) REFERENCES `curso` (`codigo`),
  CONSTRAINT `FK_ASIGNACION_ESTUDIANTE` FOREIGN KEY (`carnet`) REFERENCES `estudiante` (`carnet`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_estudiante`
--

LOCK TABLES `curso_estudiante` WRITE;
/*!40000 ALTER TABLE `curso_estudiante` DISABLE KEYS */;
INSERT INTO `curso_estudiante` VALUES (1,770,201807079,'1S','A',2022,_binary '\0'),(2,770,201807085,'1S','A',2022,_binary '\0'),(3,39,201807085,'2S','A',2022,_binary '\0'),(4,39,201807079,'2S','A',2022,_binary ''),(5,147,201807079,'1S','A',2022,_binary ''),(6,147,201807080,'1S','A',2022,_binary '\0'),(7,147,201807085,'1S','A',2022,_binary ''),(8,147,201807081,'1S','A',2022,_binary ''),(9,147,201807083,'1S','A',2022,_binary ''),(10,147,201807086,'1S','A',2022,_binary '\0'),(11,147,201807089,'1S','A',2022,_binary '');
/*!40000 ALTER TABLE `curso_estudiante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_asignacionCurso` AFTER INSERT ON `curso_estudiante` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha asignado un estudiante.", "INSERT", "CURSO_ESTUDIANTE");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_asignacionCurso` AFTER UPDATE ON `curso_estudiante` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha desasignado un estudiante", "UPDATE", "CURSO_ESTUDIANTE");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `siif` bigint NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `correo` varchar(150) NOT NULL,
  `telefono` bigint NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `dpi` bigint NOT NULL,
  `fechaCreacion` date NOT NULL,
  PRIMARY KEY (`siif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (102934681,'Luis','Espino','1999-12-20','espinoLuis@gmail.com',12345678,'zona 10, Guatemala, Guatemala',2997589900112,'2022-10-26'),(112340123,'Diego','Araujo','1990-08-01','DiegoF@gmail.com',91764023,'zona 11, Guatemala, Guatemala',2997589900116,'2022-10-26'),(718239405,'Miguel','Pérez','1989-06-05','MiguelitoProfe@gmail.com',91234765,'zona 9, Guatemala, Guatemala',2997589900115,'2022-10-26'),(818123045,'Eni','Rivas','1984-05-12','eniCariasRivas@gmail.com',85937637,'zona 3, Guatemala, Guatemala',2997589900114,'2022-10-26'),(918450124,'Armando','Barrera','1988-01-29','barreraG0@gmail.com',87654321,'zona 2, Guatemala, Guatemala',2997589900113,'2022-10-26');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ingresarDocente` AFTER INSERT ON `docente` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha creado un nuevo docente.", "INSERT", "DOCENTE");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizarDocente` AFTER UPDATE ON `docente` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se han actualizado los datos de un docente", "UPDATE", "DOCENTE");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `carnet` bigint NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `correo` varchar(150) NOT NULL,
  `telefono` bigint NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `dpi` bigint NOT NULL,
  `carrera` int NOT NULL,
  `fechaCreacion` date NOT NULL,
  `creditos` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`carnet`),
  KEY `FK_ESTUDIANTE_CARRERA_idx` (`carrera`),
  CONSTRAINT `FK_ESTUDIANTE_CARRERA` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (201807079,'Daniel Estuardo','Chicas Carías','1999-12-20','chicasdaniel53@gmail.com',42578452,'manzana G, lote 15, residenciales las perlas',2997589900101,1,'2022-10-26',5),(201807080,'Pedro Pablo','López López','2001-09-21','pedroJuarez@gmail.com',98124841,'manzana H, lote 16, residenciales las perlas',2997589900102,2,'2022-10-26',0),(201807081,'Mario','Morataya','1998-10-25','Mario123@gmail.com',16452785,'manzana I, lote 17, residenciales las perlas',2997589900103,3,'2022-10-26',5),(201807082,'Luisa Fernanda','Rodríguez López','1988-05-12','luiRod@gmail.com',37590547,'manzana J, lote 18, residenciales las perlas',2997589900104,4,'2022-10-26',0),(201807083,'Grecia Marlem','Gonzáles Pérez','1997-02-15','grecia97@gmail.com',24689756,'manzana K, lote 19, residenciales las perlas',2997589900105,5,'2022-10-26',5),(201807084,'Jose Miguel','Pérez López','1985-10-01','josePerez85@gmail.com',34561234,'manzana L, lote 20, residenciales las perlas',2997589900106,6,'2022-10-26',0),(201807085,'Eva María','Orellana Cabrera','1998-09-21','evaMaria98@gmail.com',73457243,'manzana M, lote 21, residenciales las perlas',2997589900107,1,'2022-10-26',0),(201807086,'Milton Javier','Martínez Sánchez','1999-05-05','miltonMS@gmail.com',23409789,'manzana N, lote 22, residenciales las perlas',2997589900108,2,'2022-10-26',0),(201807087,'Paula María','Hernández López','2000-12-22','paulitaHernandez@gmail.com',57683463,'manzana O, lote 23, residenciales las perlas',2997589900109,3,'2022-10-26',0),(201807088,'Fernando José','Gonzáles Gonzáles','2001-03-21','GonzalesFernando01@gmail.com',63684246,'manzana P, lote 24, residenciales las perlas',2997589900110,4,'2022-10-26',0),(201807089,'Ana Hercilia','Sánchez Pérez','1995-04-02','anita95sp@gmail.com',12536745,'manzana Q, lote 25, residenciales las perlas',2997589900111,5,'2022-10-26',0);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ingresarEstudiante` AFTER INSERT ON `estudiante` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha ingresado un nuevo estudiante.", "INSERT", "ESTUDIANTE");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizarEstudiante` AFTER UPDATE ON `estudiante` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se han actualizado los datos de un estudiante", "UPDATE", "ESTUDIANTE");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `habilitados`
--

DROP TABLE IF EXISTS `habilitados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilitados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` int NOT NULL,
  `ciclo` varchar(2) NOT NULL,
  `docente` bigint NOT NULL,
  `cupo` int NOT NULL,
  `seccion` char(1) NOT NULL,
  `anioActual` year NOT NULL,
  `asignados` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_HABILITADO_CURSO_idx` (`codigo`),
  KEY `FK_HABILITADO_DOCENTE_idx` (`docente`),
  CONSTRAINT `FK_HABILITADO_CURSO` FOREIGN KEY (`codigo`) REFERENCES `curso` (`codigo`),
  CONSTRAINT `FK_HABILITADO_DOCENTE` FOREIGN KEY (`docente`) REFERENCES `docente` (`siif`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilitados`
--

LOCK TABLES `habilitados` WRITE;
/*!40000 ALTER TABLE `habilitados` DISABLE KEYS */;
INSERT INTO `habilitados` VALUES (1,650,'1S',102934681,150,'A',2022,0),(2,650,'1S',112340123,150,'B',2022,0),(3,39,'2S',818123045,50,'A',2022,1),(4,40,'2S',918450124,50,'B',2022,0),(5,101,'1S',918450124,100,'A',2022,0),(6,218,'1S',112340123,80,'A',2022,0),(7,770,'1S',718239405,90,'A',2022,0),(8,960,'1S',718239405,5,'A',2022,0),(9,147,'1S',818123045,5,'A',2022,5);
/*!40000 ALTER TABLE `habilitados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ingresarCursoHabilitado` AFTER INSERT ON `habilitados` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha habilitado un nuevo curso.", "INSERT", "HABILITADOS");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizarCursoHabilitado` AFTER UPDATE ON `habilitados` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se han actualizado los datos de un cruso habilitado", "UPDATE", "HABILITADOS");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `habilitado` int NOT NULL,
  `dia` int NOT NULL,
  `horario` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_HORARIO_HABILITADO_idx` (`habilitado`),
  CONSTRAINT `FK_HORARIO_HABILITADO` FOREIGN KEY (`habilitado`) REFERENCES `habilitados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,2,1,'12:00-13:40'),(2,3,5,'12:00-13:40'),(3,4,4,'12:00-13:40'),(4,7,3,'10:00-13:40'),(5,8,1,'11:00-12:40'),(6,9,1,'11:00-12:40');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ingresarHorario` AFTER INSERT ON `horario` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha creado un nuevo horario para un curso habilitado.", "INSERT", "HORARIO");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizarHorario` AFTER UPDATE ON `horario` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha actualizado un horario de un curso habilitado", "UPDATE", "HORARIO");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` int NOT NULL,
  `carnet` bigint NOT NULL,
  `ciclo` varchar(2) NOT NULL,
  `seccion` char(1) NOT NULL,
  `añoActual` year NOT NULL,
  `nota` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_NOTAS_ESTUDIANTE_idx` (`carnet`),
  KEY `FK_NOTAS_CURSO_idx` (`codigo`),
  CONSTRAINT `FK_NOTAS_CURSO` FOREIGN KEY (`codigo`) REFERENCES `curso` (`codigo`),
  CONSTRAINT `FK_NOTAS_ESTUDIANTE` FOREIGN KEY (`carnet`) REFERENCES `estudiante` (`carnet`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,39,201807079,'2S','A',2022,60),(2,147,201807079,'1S','A',2022,61),(3,147,201807085,'1S','A',2022,55),(4,147,201807081,'1S','A',2022,98),(5,147,201807083,'1S','A',2022,61),(6,147,201807089,'1S','A',2022,20);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_notas` AFTER INSERT ON `notas` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha ingresado una nota para un estudiante", "INSERT", "NOTAS");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_notas` AFTER UPDATE ON `notas` FOR EACH ROW BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha actualizado una nota de un estudiante", "UPDATE", "NOTAS");
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `tabla` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,'2022-10-26 14:59:15','Se ha ingresado una nueva carrera.','INSERT','CARRERA'),(2,'2022-10-26 14:59:16','Se ha ingresado una nueva carrera.','INSERT','CARRERA'),(3,'2022-10-26 14:59:17','Se ha ingresado una nueva carrera.','INSERT','CARRERA'),(4,'2022-10-26 14:59:19','Se ha ingresado una nueva carrera.','INSERT','CARRERA'),(5,'2022-10-26 14:59:21','Se ha ingresado una nueva carrera.','INSERT','CARRERA'),(6,'2022-10-26 14:59:22','Se ha ingresado una nueva carrera.','INSERT','CARRERA'),(7,'2022-10-26 14:59:23','Se ha ingresado una nueva carrera.','INSERT','CARRERA'),(8,'2022-10-26 15:39:11','Se ha ingresado un nuevo estudiante.','INSERT','ESTUDIANTE'),(9,'2022-10-26 15:39:12','Se ha ingresado un nuevo estudiante.','INSERT','ESTUDIANTE'),(10,'2022-10-26 15:39:15','Se ha ingresado un nuevo estudiante.','INSERT','ESTUDIANTE'),(11,'2022-10-26 15:39:17','Se ha ingresado un nuevo estudiante.','INSERT','ESTUDIANTE'),(12,'2022-10-26 15:39:18','Se ha ingresado un nuevo estudiante.','INSERT','ESTUDIANTE'),(13,'2022-10-26 15:39:20','Se ha ingresado un nuevo estudiante.','INSERT','ESTUDIANTE'),(14,'2022-10-26 15:39:22','Se ha ingresado un nuevo estudiante.','INSERT','ESTUDIANTE'),(15,'2022-10-26 15:39:24','Se ha ingresado un nuevo estudiante.','INSERT','ESTUDIANTE'),(16,'2022-10-26 15:39:26','Se ha ingresado un nuevo estudiante.','INSERT','ESTUDIANTE'),(17,'2022-10-26 15:39:27','Se ha ingresado un nuevo estudiante.','INSERT','ESTUDIANTE'),(18,'2022-10-26 15:39:28','Se ha ingresado un nuevo estudiante.','INSERT','ESTUDIANTE'),(19,'2022-10-26 15:39:33','Se ha creado un nuevo docente.','INSERT','DOCENTE'),(20,'2022-10-26 15:39:35','Se ha creado un nuevo docente.','INSERT','DOCENTE'),(21,'2022-10-26 15:39:39','Se ha creado un nuevo docente.','INSERT','DOCENTE'),(22,'2022-10-26 15:39:41','Se ha creado un nuevo docente.','INSERT','DOCENTE'),(23,'2022-10-26 15:39:44','Se ha creado un nuevo docente.','INSERT','DOCENTE'),(24,'2022-10-26 15:39:53','Se ha creado un nuevo curso.','INSERT','CURSO'),(25,'2022-10-26 15:39:53','Se ha creado un nuevo curso.','INSERT','CURSO'),(26,'2022-10-26 15:39:53','Se ha creado un nuevo curso.','INSERT','CURSO'),(27,'2022-10-26 15:39:53','Se ha creado un nuevo curso.','INSERT','CURSO'),(28,'2022-10-26 15:39:54','Se ha creado un nuevo curso.','INSERT','CURSO'),(29,'2022-10-26 15:39:54','Se ha creado un nuevo curso.','INSERT','CURSO'),(30,'2022-10-26 15:39:54','Se ha creado un nuevo curso.','INSERT','CURSO'),(31,'2022-10-26 15:40:05','Se ha creado un nuevo curso.','INSERT','CURSO'),(32,'2022-10-26 15:40:06','Se ha creado un nuevo curso.','INSERT','CURSO'),(33,'2022-10-26 15:40:06','Se ha creado un nuevo curso.','INSERT','CURSO'),(34,'2022-10-26 15:40:06','Se ha creado un nuevo curso.','INSERT','CURSO'),(35,'2022-10-26 15:40:06','Se ha creado un nuevo curso.','INSERT','CURSO'),(36,'2022-10-26 15:40:11','Se ha creado un nuevo curso.','INSERT','CURSO'),(37,'2022-10-26 15:40:12','Se ha creado un nuevo curso.','INSERT','CURSO'),(38,'2022-10-26 15:40:12','Se ha creado un nuevo curso.','INSERT','CURSO'),(39,'2022-10-26 15:40:12','Se ha creado un nuevo curso.','INSERT','CURSO'),(40,'2022-10-26 15:40:12','Se ha creado un nuevo curso.','INSERT','CURSO'),(41,'2022-10-26 15:40:23','Se ha creado un nuevo curso.','INSERT','CURSO'),(42,'2022-10-26 15:40:23','Se ha creado un nuevo curso.','INSERT','CURSO'),(43,'2022-10-26 15:40:23','Se ha creado un nuevo curso.','INSERT','CURSO'),(44,'2022-10-26 15:40:23','Se ha creado un nuevo curso.','INSERT','CURSO'),(45,'2022-10-26 15:40:23','Se ha creado un nuevo curso.','INSERT','CURSO'),(46,'2022-10-26 15:40:27','Se ha creado un nuevo curso.','INSERT','CURSO'),(47,'2022-10-26 15:40:27','Se ha creado un nuevo curso.','INSERT','CURSO'),(48,'2022-10-26 15:40:28','Se ha creado un nuevo curso.','INSERT','CURSO'),(49,'2022-10-26 15:40:28','Se ha creado un nuevo curso.','INSERT','CURSO'),(50,'2022-10-26 15:40:28','Se ha creado un nuevo curso.','INSERT','CURSO'),(51,'2022-10-26 15:40:31','Se ha creado un nuevo curso.','INSERT','CURSO'),(52,'2022-10-26 15:40:33','Se ha creado un nuevo curso.','INSERT','CURSO'),(53,'2022-10-26 15:40:33','Se ha creado un nuevo curso.','INSERT','CURSO'),(54,'2022-10-26 15:40:33','Se ha creado un nuevo curso.','INSERT','CURSO'),(55,'2022-10-26 15:40:33','Se ha creado un nuevo curso.','INSERT','CURSO'),(56,'2022-10-26 15:40:39','Se ha creado un nuevo curso.','INSERT','CURSO'),(57,'2022-10-26 15:40:39','Se ha creado un nuevo curso.','INSERT','CURSO'),(58,'2022-10-26 15:40:39','Se ha creado un nuevo curso.','INSERT','CURSO'),(59,'2022-10-26 15:40:39','Se ha creado un nuevo curso.','INSERT','CURSO'),(60,'2022-10-26 15:40:39','Se ha creado un nuevo curso.','INSERT','CURSO'),(61,'2022-10-26 15:40:45','Se ha habilitado un nuevo curso.','INSERT','HABILITADOS'),(62,'2022-10-26 15:40:47','Se ha habilitado un nuevo curso.','INSERT','HABILITADOS'),(63,'2022-10-26 15:40:51','Se ha habilitado un nuevo curso.','INSERT','HABILITADOS'),(64,'2022-10-26 15:40:55','Se ha habilitado un nuevo curso.','INSERT','HABILITADOS'),(65,'2022-10-26 15:40:57','Se ha habilitado un nuevo curso.','INSERT','HABILITADOS'),(66,'2022-10-26 15:40:59','Se ha habilitado un nuevo curso.','INSERT','HABILITADOS'),(67,'2022-10-26 15:41:00','Se ha habilitado un nuevo curso.','INSERT','HABILITADOS'),(68,'2022-10-26 15:41:02','Se ha habilitado un nuevo curso.','INSERT','HABILITADOS'),(69,'2022-10-26 15:41:03','Se ha habilitado un nuevo curso.','INSERT','HABILITADOS'),(70,'2022-10-26 15:41:08','Se ha creado un nuevo horario para un curso habilitado.','INSERT','HORARIO'),(71,'2022-10-26 15:45:16','Se ha creado un nuevo horario para un curso habilitado.','INSERT','HORARIO'),(72,'2022-10-26 15:45:20','Se ha creado un nuevo horario para un curso habilitado.','INSERT','HORARIO'),(73,'2022-10-26 15:46:28','Se ha creado un nuevo horario para un curso habilitado.','INSERT','HORARIO'),(74,'2022-10-26 15:46:42','Se ha creado un nuevo horario para un curso habilitado.','INSERT','HORARIO'),(75,'2022-10-26 15:46:53','Se ha creado un nuevo horario para un curso habilitado.','INSERT','HORARIO'),(76,'2022-10-26 15:46:54','Se ha creado un nuevo horario para un curso habilitado.','INSERT','HORARIO'),(77,'2022-10-26 15:46:55','Se ha creado un nuevo horario para un curso habilitado.','INSERT','HORARIO'),(78,'2022-10-26 15:46:56','Se ha creado un nuevo horario para un curso habilitado.','INSERT','HORARIO'),(79,'2022-10-26 15:46:57','Se ha creado un nuevo horario para un curso habilitado.','INSERT','HORARIO'),(80,'2022-10-26 15:46:58','Se ha creado un nuevo horario para un curso habilitado.','INSERT','HORARIO'),(81,'2022-10-26 15:47:25','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(82,'2022-10-26 15:47:25','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(83,'2022-10-26 15:47:26','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(84,'2022-10-26 15:47:26','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(85,'2022-10-26 15:47:27','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(86,'2022-10-26 15:47:28','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(87,'2022-10-26 15:47:29','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(88,'2022-10-26 15:47:30','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(89,'2022-10-26 15:47:33','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(90,'2022-10-26 15:47:34','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(91,'2022-10-26 15:47:35','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(92,'2022-10-26 15:47:36','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(93,'2022-10-26 15:47:37','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(94,'2022-10-26 15:47:37','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(95,'2022-10-26 15:47:40','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(96,'2022-10-26 15:47:40','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(97,'2022-10-26 15:47:42','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(98,'2022-10-26 15:47:43','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(99,'2022-10-26 15:48:16','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(100,'2022-10-26 15:48:17','Se ha desasignado un estudiante','UPDATE','CURSO_ESTUDIANTE'),(101,'2022-10-26 15:48:23','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(102,'2022-10-26 15:48:23','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(103,'2022-10-26 15:49:11','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(104,'2022-10-26 15:49:11','Se ha desasignado un estudiante','UPDATE','CURSO_ESTUDIANTE'),(105,'2022-10-26 15:49:14','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(106,'2022-10-26 15:49:14','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(107,'2022-10-26 15:50:44','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(108,'2022-10-26 15:50:44','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(109,'2022-10-26 15:50:45','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(110,'2022-10-26 15:50:45','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(111,'2022-10-26 15:50:46','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(112,'2022-10-26 15:50:46','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(113,'2022-10-26 15:50:48','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(114,'2022-10-26 15:50:48','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(115,'2022-10-26 15:51:38','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(116,'2022-10-26 15:51:49','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(117,'2022-10-26 15:51:57','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(118,'2022-10-26 15:52:10','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(119,'2022-10-26 15:52:10','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(120,'2022-10-26 15:52:11','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(121,'2022-10-26 15:52:11','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(122,'2022-10-26 15:52:13','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(123,'2022-10-26 15:52:13','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(124,'2022-10-26 15:52:14','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(125,'2022-10-26 15:52:14','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(126,'2022-10-26 15:52:15','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(127,'2022-10-26 15:52:16','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(128,'2022-10-26 15:52:17','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(129,'2022-10-26 15:52:18','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(130,'2022-10-26 15:52:19','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(131,'2022-10-26 15:52:19','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(132,'2022-10-26 15:52:20','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(133,'2022-10-26 15:52:21','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(134,'2022-10-26 15:52:23','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(135,'2022-10-26 15:52:23','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(136,'2022-10-26 15:52:32','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(137,'2022-10-26 15:52:33','Se ha desasignado un estudiante','UPDATE','CURSO_ESTUDIANTE'),(138,'2022-10-26 15:52:38','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(139,'2022-10-26 15:52:38','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(140,'2022-10-26 15:52:45','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(141,'2022-10-26 15:52:45','Se ha desasignado un estudiante','UPDATE','CURSO_ESTUDIANTE'),(142,'2022-10-26 15:52:47','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(143,'2022-10-26 15:52:47','Se ha asignado un estudiante.','INSERT','CURSO_ESTUDIANTE'),(144,'2022-10-26 15:52:55','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(145,'2022-10-26 15:52:55','Se ha desasignado un estudiante','UPDATE','CURSO_ESTUDIANTE'),(146,'2022-10-26 15:52:56','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(147,'2022-10-26 15:52:56','Se ha desasignado un estudiante','UPDATE','CURSO_ESTUDIANTE'),(148,'2022-10-26 15:52:57','Se han actualizado los datos de un cruso habilitado','UPDATE','HABILITADOS'),(149,'2022-10-26 15:52:58','Se ha desasignado un estudiante','UPDATE','CURSO_ESTUDIANTE'),(150,'2022-10-26 15:54:26','Se ha ingresado una nota para un estudiante','INSERT','NOTAS'),(151,'2022-10-26 15:54:44','Se han actualizado los datos de un estudiante','UPDATE','ESTUDIANTE'),(152,'2022-10-26 15:54:44','Se ha ingresado una nota para un estudiante','INSERT','NOTAS'),(153,'2022-10-26 15:54:46','Se ha ingresado una nota para un estudiante','INSERT','NOTAS'),(154,'2022-10-26 15:54:47','Se han actualizado los datos de un estudiante','UPDATE','ESTUDIANTE'),(155,'2022-10-26 15:54:47','Se ha ingresado una nota para un estudiante','INSERT','NOTAS'),(156,'2022-10-26 15:54:50','Se han actualizado los datos de un estudiante','UPDATE','ESTUDIANTE'),(157,'2022-10-26 15:54:50','Se ha ingresado una nota para un estudiante','INSERT','NOTAS'),(158,'2022-10-26 15:54:54','Se ha ingresado una nota para un estudiante','INSERT','NOTAS'),(159,'2022-10-26 15:54:56','Se ha creado una nueva acta.','INSERT','ACTA');
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db1_proyecto2_201807079'
--

--
-- Dumping routines for database 'db1_proyecto2_201807079'
--
/*!50003 DROP FUNCTION IF EXISTS `aumentarAsignados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `aumentarAsignados`(
		id INT
	 ) RETURNS int
    DETERMINISTIC
BEGIN 
		DECLARE valorRegresa INT;
		SELECT asignados FROM habilitados h WHERE h.id = id INTO valorRegresa;
		RETURN (valorRegresa+1);   
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `buscarCarnet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buscarCarnet`(
		carnet BIGINT
	 ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM estudiante e WHERE e.carnet = carnet) INTO exist;
        RETURN (exist);
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `buscarCarrera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buscarCarrera`(
		nombre VARCHAR(100)
	 ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM carrera c WHERE c.nombre = nombre) INTO exist;
        RETURN (exist);
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `buscarCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buscarCurso`(
		codigo INT
	 ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM curso c WHERE c.codigo = codigo) INTO exist;
        RETURN (exist);
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `buscarCursoHabilitado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buscarCursoHabilitado`(
		codigo INT,
        ciclo VARCHAR(2),
        seccion CHAR(1)
	 ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM habilitados h WHERE h.codigo = codigo AND h.ciclo = ciclo AND h.seccion = seccion ) INTO exist;
        RETURN (exist);
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `buscarIdCarrera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buscarIdCarrera`(
		id INT
	 ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM carrera c WHERE c.id = id) INTO exist;
        RETURN (exist);
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `buscarIdCursoHabilitado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buscarIdCursoHabilitado`(
		id INT
	 ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM habilitados h WHERE h.id = id) INTO exist;
        RETURN (exist);
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `buscarSiif` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buscarSiif`(
		siif BIGINT
	 ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM docente d WHERE d.siif = siif) INTO exist;
        RETURN (exist);
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `carreraCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `carreraCurso`(
		codigo BIGINT
	 ) RETURNS int
    DETERMINISTIC
BEGIN 
		DECLARE valorRegresa INT;
		SELECT carrera FROM curso c WHERE c.codigo = codigo INTO valorRegresa;
		RETURN (valorRegresa);   
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `carreraEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `carreraEstudiante`(
		carnet BIGINT
	 ) RETURNS int
    DETERMINISTIC
BEGIN 
		DECLARE valorRegresa INT;
		SELECT carrera FROM estudiante e WHERE e.carnet = carnet INTO valorRegresa;
		RETURN (valorRegresa);   
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `creditosActuales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `creditosActuales`(
		carnet BIGINT
	 ) RETURNS int
    DETERMINISTIC
BEGIN 
		DECLARE valorRegresa INT;
		SELECT creditos FROM estudiante e WHERE e.carnet = carnet INTO valorRegresa;
		RETURN (valorRegresa);  
	 
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `creditosNecesarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `creditosNecesarios`(
		codigoCurso INT
	 ) RETURNS int
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN;
		DECLARE valorRegresa INT;
		SELECT EXISTS(SELECT 1 FROM habilitados h WHERE h.codigo = codigoCurso ) INTO exist;
        IF(exist) THEN
			SELECT creditosN FROM curso c WHERE c.codigo = codigoCurso INTO valorRegresa;
			RETURN (valorRegresa);
        END IF;
			RETURN (-1);       
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `creditosOtorga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `creditosOtorga`(
		codigoCurso INT
	 ) RETURNS int
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN;
		DECLARE valorRegresa INT;
		SELECT EXISTS(SELECT 1 FROM habilitados h WHERE h.codigo = codigoCurso ) INTO exist;
        IF(exist) THEN
			SELECT creditosO FROM curso c WHERE c.codigo = codigoCurso INTO valorRegresa;
			RETURN (valorRegresa);
        END IF;
			RETURN (-1);       
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cupoAsignados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cupoAsignados`(
		id INT
	 ) RETURNS int
    DETERMINISTIC
BEGIN 
		DECLARE valorRegresa INT;
		SELECT cupo FROM habilitados h WHERE h.id = id INTO valorRegresa;
		RETURN (valorRegresa);   
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `disminuirAsignados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `disminuirAsignados`(
		id INT
	 ) RETURNS int
    DETERMINISTIC
BEGIN 
		DECLARE valorRegresa INT;
		SELECT asignados FROM habilitados h WHERE h.id = id INTO valorRegresa;
        
        IF(valorRegresa = 0)THEN
			RETURN (valorRegresa);    
        END IF;
        
		RETURN (valorRegresa-1);   
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `notaIngresada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `notaIngresada`(
		codigoCurso INT,
        ciclo VARCHAR(2),
        seccion CHAR(1),
        carnet BIGINT
	 ) RETURNS int
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN;
		DECLARE valorRegresa INT;
		SELECT EXISTS(SELECT 1 FROM notas n WHERE n.codigo = codigoCurso AND n.ciclo = ciclo AND n.seccion = seccion AND n.carnet = carnet ) INTO exist;
		RETURN (exist); 
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarCiclo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarCiclo`(
		cadena VARCHAR(100)
    ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^1S]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
                
        IF (SELECT REGEXP_INSTR(cadena, '[^VJ]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
        
        IF (SELECT REGEXP_INSTR(cadena, '[^VD]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarCiclo1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarCiclo1`(
		cadena VARCHAR(100)
    ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^1S]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarCiclo2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarCiclo2`(
		cadena VARCHAR(100)
    ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^2S]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarCiclo3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarCiclo3`(
		cadena VARCHAR(100)
    ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^VJ]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarCiclo4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarCiclo4`(
		cadena VARCHAR(100)
    ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^VD]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarCorreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarCorreo`(
		correo VARCHAR(150)
    ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT correo NOT REGEXP '^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,4}$') THEN
			SELECT FALSE INTO valido;
		ELSE
			SELECT TRUE INTO valido;
        END IF;
        RETURN (valido);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarDia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarDia`(
		dia INT
    ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN 
		DECLARE valido BOOLEAN; 
        IF(char_length(dia) > 1) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
        END IF;			
        
        IF (SELECT REGEXP_INSTR(dia, '[^[1-7]?]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarEnteroPositivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarEnteroPositivo`(
		cadena INT
    ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^0-9]')) THEN
			SELECT FALSE INTO valido;
		ELSE
			SELECT TRUE INTO valido;
        END IF; 
        RETURN (valido);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarHorario`(
		cadena VARCHAR(15)
    ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^0-9 :-]')) THEN
			SELECT FALSE INTO valido;
		ELSE
			SELECT TRUE INTO valido;
        END IF;
        
        RETURN (valido);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarIdCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarIdCurso`(
		codigoCurso INT,
        cicloCurso VARCHAR(2),
        seccionCurso CHAR(1)
	 ) RETURNS int
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN;
		DECLARE valorRegresa INT;
		SELECT EXISTS(SELECT 1 FROM habilitados h WHERE h.codigo = codigoCurso AND h.ciclo = cicloCurso AND h.seccion = seccionCurso ) INTO exist;
        IF(exist) THEN
			SELECT id FROM habilitados h WHERE h.codigo = codigoCurso AND h.ciclo = cicloCurso AND h.seccion = seccionCurso INTO valorRegresa;
			RETURN (valorRegresa);
        END IF;
			RETURN (-1);       
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarLetras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarLetras`(
		cadena VARCHAR(100)
    ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^a-zA-ZáéíóúÁÉÍÓÚ ]')) THEN
			SELECT FALSE INTO valido;
		ELSE
			SELECT TRUE INTO valido;
        END IF;
        
        RETURN (valido);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarNumeroPositivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarNumeroPositivo`(
		cadena DOUBLE
    ) RETURNS int
    DETERMINISTIC
BEGIN 
		DECLARE valido BOOLEAN; 
        DECLARE regresa INT;
        #IF (SELECT correo NOT REGEXP '^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,4}$') THEN
        
        IF (SELECT REGEXP_INSTR(cadena, '[^0-9. ]')) THEN
			RETURN (-1);
		ELSE
			SELECT ROUND(cadena) INTO REGRESA;
			RETURN (REGRESA); 
        END IF; 
        
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `yaAsignado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `yaAsignado`(
		codigoCurso INT,
        cicloCurso VARCHAR(2),
        seccionCurso CHAR(1),
        carneCurso BIGINT
	 ) RETURNS int
    DETERMINISTIC
BEGIN
		DECLARE exist BOOLEAN; 
		SELECT EXISTS(SELECT 1 FROM curso_estudiante ce WHERE ce.codigo = codigoCurso AND ce.ciclo = cicloCurso AND ce.carnet = carneCurso AND ce.añoActual = YEAR(NOW()) AND ce.tipo = 1) INTO exist;
 		RETURN (exist);       
	 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addCarrera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCarrera`(
		IN nombre_in VARCHAR(100)
    )
add_carrera: BEGIN
    
        /*VALIDAR LETRAS*/
        IF(NOT validarLetras(nombre_in)) THEN
			SELECT 'EL NOMBRE SOLO DEBE CONTENER LETRAS Y ESPACIOS' AS ERROR;
            LEAVE add_carrera;
        END IF;
        
		/*YA EXISTE*/
        IF(buscarCarrera(nombre_in)) THEN
			SELECT 'LA CARRERA YA EXISTE' AS ERROR;
            LEAVE add_carrera;
		END IF;
        
		INSERT INTO carrera (nombre) values (nombre_in);
        /* MENSAJE */
        SELECT CONCAT("Se ha creado la carrera '", nombre_in, "' exitosamente. :D") AS MENSAJE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCurso`(
		IN codigo_in INT,
        IN nombre_in VARCHAR(100),
        IN necesarios_in INT,
        IN otorga_in INT,
        IN carrera_in INT,
        IN obligatorio_in BIT
    )
add_curso: BEGIN 
        /*VALIDAR LETRAS*/
        
        
        IF(NOT validarEnteroPositivo(necesarios_in)) THEN
			SELECT 'LOS CRÉDITOS NECESARIOS DEBE SER UN ENTERO POSITIVO' AS ERROR;
            LEAVE add_curso;
        END IF;
        
        IF(NOT validarEnteroPositivo(otorga_in)) THEN
			SELECT 'LOS CRÉDITOS QUE OTORGA EL CURSO DEBE SER UN ENTERO POSITIVO' AS ERROR;
            LEAVE add_curso;
        END IF;
			
		IF(NOT buscarIdCarrera(carrera_in)) THEN
			SELECT 'NO SE ENCONTRÓ LA CARRERA A LA QUE PERTENECE EL CURSO' AS ERROR;
            LEAVE add_curso;
        END IF;
        
		IF(buscarCurso(codigo_in)) THEN
			SELECT 'EL CÓDIGO PARA EL CURSO YA ESTÁ EN USO' AS ERROR;
            LEAVE add_curso;
        END IF;
        
        INSERT INTO curso (codigo, nombre, creditosN, creditosO, carrera, obligatorio) 
        VALUES(codigo_in, nombre_in, necesarios_in, otorga_in, carrera_in, obligatorio_in);
        
        /* MENSAJE */
        SELECT CONCAT("Se ha ingresado el curso '", nombre_in, "' exitosamente. :D") AS MENSAJE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addDocente`(
		IN siif_in BIGINT,
        IN nombres_in VARCHAR(100),
		IN apellidos_in VARCHAR(100),
        IN fechaNacimiento_in DATE,
        IN correo_in VARCHAR(150),
        IN telefono_in BIGINT,
        IN direccion_in VARCHAR(150),
        IN dpi_in BIGINT
    )
add_docente: BEGIN 
        /*VALIDAR LETRAS*/
        IF(NOT validarLetras(nombres_in)) THEN
			SELECT 'EL NOMBRE SOLO DEBE CONTENER LETRAS Y ESPACIOS' AS ERROR;
            LEAVE add_docente;
        END IF;
        
        IF(NOT validarLetras(apellidos_in)) THEN
			SELECT 'EL APELLIDO SOLO DEBE CONTENER LETRAS Y ESPACIOS' AS ERROR;
            LEAVE add_docente;
        END IF;
        
        IF(NOT validarCorreo(correo_in)) THEN
			SELECT 'EL FORMATO DEL CORREO ELECTRÓNICO NO ES VÁLIDO' AS ERROR;
            LEAVE add_docente;
        END IF;
			
		IF(buscarSiif(siif_in)) THEN
			SELECT 'YA SE HA UTILIZADO ESTE SIIF PARA UN DOCENTE' AS ERROR;
            LEAVE add_docente;
        END IF;
        
        INSERT INTO docente (siif, nombres, apellidos, fechaNacimiento, correo, telefono, direccion, dpi, fechaCreacion) 
        VALUES(siif_in, nombres_in, apellidos_in, fechaNacimiento_in, correo_in, telefono_in, direccion_in, dpi_in, sysdate());
        
        /* MENSAJE */
        SELECT CONCAT("Se ha ingresado el docente '", nombres_in, "' exitosamente. :D") AS MENSAJE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addEstudiante`(
		IN carnet_in BIGINT,
        IN nombres_in VARCHAR(100),
		IN apellidos_in VARCHAR(100),
        IN fechaNacimiento_in DATE,
        IN correo_in VARCHAR(150),
        IN telefono_in BIGINT,
        IN direccion_in VARCHAR(150),
        IN dpi_in BIGINT,
        IN carrera_in INT
    )
add_estudiante: BEGIN 
        /*VALIDAR LETRAS*/
        IF(NOT validarLetras(nombres_in)) THEN
			SELECT 'EL NOMBRE SOLO DEBE CONTENER LETRAS Y ESPACIOS' AS ERROR;
            LEAVE add_estudiante;
        END IF;
        
        IF(NOT validarLetras(apellidos_in)) THEN
			SELECT 'EL APELLIDO SOLO DEBE CONTENER LETRAS Y ESPACIOS' AS ERROR;
            LEAVE add_estudiante;
        END IF;
        
        IF(NOT validarCorreo(correo_in)) THEN
			SELECT 'EL FORMATO DEL CORREO ELECTRÓNICO NO ES VÁLIDO' AS ERROR;
            LEAVE add_estudiante;
        END IF;
        
        IF(NOT buscarIdCarrera(carrera_in)) THEN
			SELECT 'NO SE ENCONTRÓ EL ID DE LA CARRERA INGRESADA' AS ERROR;
            LEAVE add_estudiante;
        END IF;
		
		IF(buscarCarnet(carnet_in)) THEN
			SELECT 'YA SE HA UTILIZADO ESTE CARNET PARA UN ESTUDIANTE' AS ERROR;
            LEAVE add_estudiante;
        END IF;
        
        INSERT INTO estudiante (carnet, nombres, apellidos, fechaNacimiento, correo, telefono, direccion, dpi, carrera, fechaCreacion, creditos) 
        VALUES(carnet_in, nombres_in, apellidos_in, fechaNacimiento_in, correo_in, telefono_in, direccion_in, dpi_in, carrera_in, sysdate(), 0);
        
        /* MENSAJE */
        SELECT CONCAT("Se ha ingresado el estudiante '", nombres_in, "' exitosamente. :D") AS MENSAJE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `asignacionEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `asignacionEstudiante`(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN seccion_in CHAR(1),
        IN carnet_in BIGINT
    )
asignacion_curso: BEGIN  
		DECLARE valido INT; 
        DECLARE creditosN INT;
        DECLARE creditosA INT;
		DECLARE carreraE INT;
        DECLARE carreraC INT;
        DECLARE aumento INT;
        DECLARE cupo INT;
        
        SELECT validarIdCurso(codigo_in, ciclo_in, UPPER(seccion_in)) INTO valido;
		SELECT creditosNecesarios(codigo_in) INTO creditosN;
		SELECT creditosActuales(carnet_in) INTO creditosA;
		SELECT carreraCurso(codigo_in) INTO carreraC;
		SELECT carreraEstudiante(carnet_in) INTO carreraE;
        SELECT aumentarAsignados(valido) INTO aumento;
        SELECT cupoAsignados(valido) INTO cupo;
        
        
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE asignacion_curso;
					END IF;
				END IF;
			END IF; 
        END IF;
                
        IF(NOT(carreraC = 0))THEN
			IF(NOT(carreraC = carreraE))THEN 
				SELECT CONCAT("EL ESTUDIANTE NO PUEDE ASIGNARSE A CURSOS QUE NO SON DE SU CARRERA O DE ÁREA COMÚN.") AS ERROR;
				LEAVE asignacion_curso; 
			END IF;
        END IF;
          
		IF(valido = -1) THEN
			SELECT CONCAT("EL CURSO CON EL CÓDIGO: '", codigo_in, "', PARA EL CICLO '",UPPER(ciclo_in),"' Y SECCION '",UPPER(seccion_in),"', NO HA SIDO HABILITADO.") AS ERROR;
            LEAVE asignacion_curso;
        END IF; 
        
        IF(aumento > cupo) THEN
			SELECT CONCAT("EL CURSO HA LLEGADO A SU CUPO :(.") AS ERROR;
			LEAVE asignacion_curso;  
        END IF;
        
		IF(yaAsignado(codigo_in, ciclo_in, seccion_in, carnet_in)) THEN
			SELECT CONCAT("EL ESTUDIANTE: '", carnet_in, "' YA ESTÁ ASIGNADO A ESTE CURSO.") AS ERROR;
            LEAVE asignacion_curso;
        END IF;
        
        IF(creditosN = -1) THEN
			SELECT CONCAT("NO SE ENCONTRÓ EL CURSO CON EL CÓDIGO: '", codigo_in, "'.") AS ERROR;
            LEAVE asignacion_curso;
        END IF; 
        
        IF(creditosN > creditosA)THEN
			SELECT CONCAT("EL ESTUDIANTE: '", carnet_in, "' NO CUENTA CON LOS CRÉDITOS NECESARIOS PARA ASIGNARSE A ESTE CURSO.") AS ERROR;
            LEAVE asignacion_curso; 
        END IF;      
         
        UPDATE habilitados SET asignados = aumento WHERE habilitados.id = valido;
        INSERT INTO curso_estudiante (codigo, carnet, ciclo, seccion, añoActual, tipo) VALUES (codigo_in, carnet_in, UPPER(ciclo_in), UPPER(seccion_in), YEAR(NOW()), 1);
        
        /* MENSAJE */
        SELECT CONCAT("SE HA ASIGNADO AL CARNET: '", carnet_in, "' AL CURSO '",codigo_in, "' exitosamente. :D") AS MENSAJE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cActas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cActas`(
		IN codigo_in INT
    )
actas: BEGIN     
    
        IF(NOT buscarCurso(codigo_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO EL CURSO CON EL CÓDIGO: ', codigo_in) AS ERROR;
            LEAVE actas;
        END IF;
		
        SELECT h.codigo, h.seccion, 
		(case when h.ciclo = '1S' then 'PRIMER SEMESTRE'  when h.ciclo = '2S' then 'SEGUNDO SEMESTRE' when h.ciclo = 'VJ' then 'VACACIONES DE JUNIO' when h.ciclo = 'VD' then 'VACACIONES DE DICIEMRE' end) as 'CICLO',
		h.anioActual, h.asignados, a.fechaCreacion 
		FROM habilitados h, acta a where h.codigo = codigo_in and a.habilitado = h.id 
		ORDER BY a.fechaCreacion ASC
		;
        
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cAprobaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cAprobaciones`(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN anio VARCHAR(4),
        IN seccion CHAR(1)
    )
aprobados: BEGIN     
    
        IF(NOT buscarCurso(codigo_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO EL CURSO CON EL CÓDIGO: ', codigo_in) AS ERROR;
            LEAVE aprobados;
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE aprobados;
					END IF;
				END IF;
			END IF; 
        END IF;
                     
		SELECT n.codigo, n.carnet, concat(e.nombres, ' ', e.apellidos) AS 'nombre completo', (case when n.nota >= 61 then 'APROBADO'  when n.nota < 61 then 'REPROBADO' end) as 'APROBADO/REPROBADO' 
		from notas n, estudiante e where n.codigo = codigo_in and n.ciclo = ciclo_in and n.añoActual = anio and n.seccion = seccion and n.carnet = e.carnet;
        
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cDocente`(
		IN siif_in INT
    )
docente: BEGIN   
		IF(not buscarSiif(siif_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO AL DOCENTE CON EL SIIF: ', siif_in) AS ERROR;
            LEAVE docente;
        END IF;
           select e.siif, CONCAT(e.nombres, ' ', apellidos) AS 'nombre completo', e.fechaNacimiento, e.correo, e.telefono, e.direccion, e.dpi  
           from docente e where e.siif = siif_in;
    
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cEstudiante`(
		IN carnet_in INT
    )
estudiante: BEGIN   
		IF(not buscarCarnet(carnet_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO AL ESTUDIANTE CON EL CARNÉT: ', carnet_in) AS ERROR;
            LEAVE estudiante;
        END IF;
           select e.carnet, CONCAT(e.nombres, ' ', apellidos) AS 'nombre completo', e.fechaNacimiento, e.correo, e.telefono, e.direccion, e.dpi, e.carrera, e.creditos as 'creditos que posee' 
           from estudiante e where e.carnet = carnet_in;
    
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cEstudiantesAsignados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cEstudiantesAsignados`(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN anio VARCHAR(4),
        IN seccion CHAR(1)
    )
estudiantesA: BEGIN     
    
        IF(NOT buscarCurso(codigo_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO EL CURSO CON EL CÓDIGO: ', codigo_in) AS ERROR;
            LEAVE estudiantesA;
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE estudiantesA;
					END IF;
				END IF;
			END IF; 
        END IF;
                                
        SELECT e.carnet, concat(e.nombres, ' ', e.apellidos) as 'nombre completo', e.creditos 
		FROM curso_estudiante ce, estudiante e where ce.codigo = codigo_in AND ce.ciclo = ciclo_in AND ce.añoActual = anio AND ce.seccion = seccion AND ce.carnet = e.carnet and ce.tipo = 1;
         
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cPensum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cPensum`(
		IN codigo INT
    )
pensum: BEGIN   
		IF(not buscarIdCarrera(codigo)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO LA CARRERA CON EL ID: ', codigo) AS ERROR;
            LEAVE pensum;
        END IF;
           
		select c.codigo , c.nombre ,  (case when c.obligatorio = 1 then 'Si'  when c.obligatorio = 0 then 'No' end) as 'obligatorio', c.creditosN AS 'Créditos Necesarios'	
		from curso c where c.carrera = codigo OR c.carrera = 0;
    
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cTasaDesasignacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cTasaDesasignacion`(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN anio VARCHAR(4),
        IN seccion CHAR(1)
    )
tasa: BEGIN     
    
        IF(NOT buscarCurso(codigo_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO EL CURSO CON EL CÓDIGO: ', codigo_in) AS ERROR;
            LEAVE tasa;
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE tasa;
					END IF;
				END IF;
			END IF; 
        END IF;
        
        SELECT ce.codigo, ce.seccion, 
		(case when ce.ciclo = '1S' then 'PRIMER SEMESTRE'  when ce.ciclo = '2S' then 'SEGUNDO SEMESTRE' when ce.ciclo = 'VJ' then 'VACACIONES DE JUNIO' when ce.ciclo = 'VD' then 'VACACIONES DE DICIEMRE' end) as 'CICLO',
		ce.añoActual, SUM(ce.tipo = 1) as 'asignados', SUM(ce.tipo=0) as 'desasignados', ((SUM(ce.tipo = 0)/SUM(ce.tipo=0 or ce.tipo=1))*100) as 'porcentaje de desasignados'
		FROM curso_estudiante ce, habilitados h where h.codigo = ce.codigo AND h.codigo = codigo_in AND h.ciclo = ciclo_in AND h.anioActual = anio AND h.seccion = seccion;
        
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `desasignacionEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `desasignacionEstudiante`(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN seccion_in CHAR(1),
        IN carnet_in BIGINT
    )
desasignacion_curso: BEGIN  
		DECLARE valido INT;   
        DECLARE disminuye INT; 
        
        SELECT validarIdCurso(codigo_in, ciclo_in, UPPER(seccion_in)) INTO valido;   
        SELECT disminuirAsignados(valido) INTO disminuye;   
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE desasignacion_curso;
					END IF;
				END IF;
			END IF; 
        END IF;
        
		IF(NOT yaAsignado(codigo_in, ciclo_in, seccion_in, carnet_in)) THEN
			SELECT CONCAT("EL ESTUDIANTE: '", carnet_in, "' AÚN NO ESTÁ ASIGNADO A ESTE CURSO.") AS ERROR;
            LEAVE desasignacion_curso;
        END IF;         
		
		IF(valido = -1) THEN
			SELECT CONCAT("EL CURSO CON EL CÓDIGO: '", codigo_in, "', PARA EL CICLO '",UPPER(ciclo_in),"' Y SECCION '",UPPER(seccion_in),"', NO HA SIDO HABILITADO.") AS ERROR;
            LEAVE desasignacion_curso;
        END IF; 
        
        UPDATE habilitados SET asignados = disminuye  WHERE habilitados.id = valido;
        UPDATE curso_estudiante SET tipo = 0 WHERE curso_estudiante.codigo = codigo_in AND curso_estudiante.carnet = carnet_in AND curso_estudiante.ciclo = ciclo_in AND curso_estudiante.seccion = seccion_in;
        
        /* MENSAJE */
        SELECT CONCAT("SE HA DESASIGNADO AL CARNET: '", carnet_in, "' AL CURSO '",codigo_in, "' exitosamente. :D") AS MENSAJE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `habilitarCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `habilitarCurso`(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN docente_in BIGINT,
        IN cupo_in INT,
        IN seccion_in CHAR(1)
    )
habilitar_curso: BEGIN  
    
		IF(NOT buscarCurso(codigo_in)) THEN
			SELECT CONCAT("NO SE HA CREADO NINGÚN CURSO CON EL CÓDIGO '", codigo_in, "'.") AS ERROR;
            LEAVE habilitar_curso;
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE habilitar_curso;
					END IF;
				END IF;
			END IF; 
        END IF;
	
		IF(NOT buscarSiif(docente_in)) THEN
			SELECT CONCAT("NO SE RECONOCE EL DOCENTE CON EL SIIF:'", docente_in, "'.") AS ERROR;
            LEAVE habilitar_curso;
        END IF;
         
        IF(NOT validarEnteroPositivo(cupo_in)) THEN
			SELECT 'EL CUPO DEBE SER UN ENTERO POSITIVO' AS ERROR;
            LEAVE habilitar_curso;
        END IF;
        
        IF(buscarCursoHabilitado(codigo_in, ciclo_in, seccion_in)) THEN
			SELECT 'EL CURSO YA HA SIDO HABILITADO EN EL MISMO CICLO Y EN LA MISMA SECCIÓN' AS ERROR;
            LEAVE habilitar_curso;
        END IF;
        
         INSERT INTO habilitados (codigo, ciclo, docente, cupo, seccion, anioActual, asignados) VALUES (codigo_in, ciclo_in, docente_in, cupo_in, UPPER(seccion_in), YEAR(NOW()), 0);
         
        /* MENSAJE */
        SELECT CONCAT("Se ha habilitado el curso con el código '", codigo_in, "' exitosamente. :D") AS MENSAJE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `horarioCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `horarioCurso`(
		IN habilitado_in INT,
        IN dia_in INT,
        IN horario_in VARCHAR(15)
    )
horario_curso: BEGIN  
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM horario h WHERE h.habilitado = habilitado_in AND h.dia = dia_in AND h.horario = horario_in ) INTO exist;
    
		IF(exist) THEN
			SELECT CONCAT("EL CURSO Y SECCIÓN YA CUENTA CON UN HORARIO.") AS ERROR;
            LEAVE horario_curso; 
        END IF;
    
		IF(NOT buscarIdCursoHabilitado(habilitado_in)) THEN
			SELECT CONCAT("NO SE ENCONTRÓ EL ID DEL CURSO HABILITADO '", habilitado_in, "'.") AS ERROR;
            LEAVE horario_curso;
        END IF;
              
		IF(NOT validarDia(dia_in)) THEN
			SELECT CONCAT("SOLO SE PERMITEN NÚMEROS DEL 1 AL 7 PARA REPRESENTAR LOS DÍAS DE LA SEMANA, NO SE ACEPTA EL NÚMERO: '", dia_in, "'.") AS ERROR;
            LEAVE horario_curso;
        END IF;
        
		IF(NOT validarHorario(horario_in)) THEN
			SELECT CONCAT("EL FORMATO PARA EL HORARIO: '", horario_in, "' NO ES ACEPTADO.") AS ERROR;
            LEAVE horario_curso;
        END IF;
        
         INSERT INTO horario (habilitado, dia, horario) VALUES (habilitado_in, dia_in, horario_in);
         
        /* MENSAJE */
        SELECT CONCAT("Se ha creado el horario para el curso con el id de habilitación: '", habilitado_in, "' exitosamente. :D") AS MENSAJE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingresoActa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresoActa`(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN seccion_in CHAR(1)
    )
acta_curso: BEGIN  
		DECLARE valido INT;
        DECLARE estudiantesI INT;
        DECLARE notasCreadas INT;
        DECLARE exist BOOLEAN;
        
        SELECT validarIdCurso(codigo_in, ciclo_in, UPPER(seccion_in)) INTO valido;  
		SELECT EXISTS(SELECT 1 FROM acta a WHERE a.habilitado = valido) INTO exist;
        
        IF(exist)THEN 
			SELECT CONCAT("YA SE CREÓ UN ACTA PARA EL CURSO: '",codigo_in,"', EN EL CICLO: '", ciclo_in, "', Y SECCIÓN: '",seccion_in,"'.") AS ERROR;
			LEAVE acta_curso;
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE acta_curso;
					END IF;
				END IF;
			END IF; 
        END IF;
        
        SELECT asignados FROM habilitados where habilitados.id = valido INTO estudiantesI;
        SELECT count(*) FROM notas ce where ce.codigo = codigo_in AND ce.ciclo = ciclo_in AND ce.seccion = seccion_in INTO notasCreadas;
        
        if(NOT estudiantesI = notasCreadas) THEN 
			SELECT CONCAT("AÚN NO SE HAN INGRESADO TODAS LAS NOTAS PARA EL CURSO '", codigo_in, "'.") AS ERROR;
			LEAVE acta_curso;
        END IF;
        
        /* MENSAJE */
        INSERT INTO acta (habilitado, fechaCreacion) VALUES(valido, SYSDATE());
        SELECT CONCAT("SE HA CREADO EL ACTA DEL CURSO: '", codigo_in, "' exitosamente. :D ") AS MENSAJE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingresoNotas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresoNotas`(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN seccion_in CHAR(1),
        IN carnet_in BIGINT,
        IN nota_in DOUBLE
    )
nota_curso: BEGIN  
		DECLARE valido INT;    
        DECLARE notaR INT;
        DECLARE creditosA INT;
        DECLARE creditosO INT;
        
		SELECT creditosActuales(carnet_in) INTO creditosA;
        SELECT validarIdCurso(codigo_in, ciclo_in, UPPER(seccion_in)) INTO valido;   
		SELECT validarNumeroPositivo(nota_in) INTO notaR;
        SELECT creditosOtorga(codigo_in) INTO creditosO;
        
        IF(notaIngresada(codigo_in, ciclo_in, seccion_in, carnet_in)) THEN 
			SELECT CONCAT("YA SE INGRESÓ LA NOTA PARA EL ESTUDIANTE '", carnet_in, "'.") AS ERROR;
			LEAVE nota_curso; 
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE nota_curso;
					END IF;
				END IF;
			END IF; 
        END IF;
        
		IF(NOT yaAsignado(codigo_in, ciclo_in, seccion_in, carnet_in)) THEN
			SELECT CONCAT("EL ESTUDIANTE: '", carnet_in, "' NO ESTÁ ASIGNADO A ESTE CURSO.") AS ERROR;
            LEAVE nota_curso;
        END IF;         
		
		IF(valido = -1) THEN
			SELECT CONCAT("EL CURSO CON EL CÓDIGO: '", codigo_in, "', PARA EL CICLO '",UPPER(ciclo_in),"' Y SECCION '",UPPER(seccion_in),"', NO HA SIDO HABILITADO.") AS ERROR;
            LEAVE nota_curso;
        END IF;
        
		IF(notaR= -1) THEN
			SELECT CONCAT("EL FORMATO DE LA NOTA '",nota_in,"' NO ES ACEPTADO.") AS ERROR;
            LEAVE nota_curso;
        END IF;
        
        IF(notaR >= 61) THEN
			UPDATE estudiante SET creditos = creditosA+creditosO WHERE estudiante.carnet = carnet_in;
        END IF;
        
        INSERT INTO notas (codigo, carnet, ciclo, seccion, añoActual, nota) VALUES(codigo_in, carnet_in, UPPER(ciclo_in), UPPER(seccion_in), YEAR(NOW()), notaR);
        
        /* MENSAJE */
        SELECT CONCAT("SE HA INGRESADO LA NOTA AL CARNET: '", carnet_in, "' exitosamente. :D ") AS MENSAJE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-26 18:47:53
