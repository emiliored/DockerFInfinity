-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: payaradb
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `APRECIO`
--

DROP TABLE IF EXISTS `APRECIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APRECIO` (
  `idUsuario` int(8) NOT NULL,
  `idRecurso` int(8) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`idUsuario`,`idRecurso`),
  KEY `fk_aprecio_recurso_recurso` (`idRecurso`),
  CONSTRAINT `fk_aprecio_recurso_recurso` FOREIGN KEY (`idRecurso`) REFERENCES `RECURSO` (`idRecurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_aprecio_recurso_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `USUARIO` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APRECIO`
--

LOCK TABLES `APRECIO` WRITE;
/*!40000 ALTER TABLE `APRECIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `APRECIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMENTARIO`
--

DROP TABLE IF EXISTS `COMENTARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMENTARIO` (
  `idUsuario` int(8) NOT NULL,
  `idRecurso` int(8) NOT NULL,
  `fecha` datetime NOT NULL,
  `texto` text NOT NULL,
  PRIMARY KEY (`idUsuario`,`idRecurso`,`fecha`),
  KEY `fk_comentario_recurso` (`idRecurso`),
  CONSTRAINT `fk_comentario_recurso` FOREIGN KEY (`idRecurso`) REFERENCES `RECURSO` (`idRecurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comentario_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `USUARIO` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMENTARIO`
--

LOCK TABLES `COMENTARIO` WRITE;
/*!40000 ALTER TABLE `COMENTARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMENTARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ETIQUETA`
--

DROP TABLE IF EXISTS `ETIQUETA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ETIQUETA` (
  `idUsuario` int(8) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idUsuario`,`nombre`),
  CONSTRAINT `fk_etiqueta_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `USUARIO` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ETIQUETA`
--

LOCK TABLES `ETIQUETA` WRITE;
/*!40000 ALTER TABLE `ETIQUETA` DISABLE KEYS */;
/*!40000 ALTER TABLE `ETIQUETA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECURSO`
--

DROP TABLE IF EXISTS `RECURSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RECURSO` (
  `idRecurso` int(8) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(8) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `filehash` varchar(43) NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `visibilidad` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idRecurso`,`idUsuario`),
  KEY `fk_recurso_usuario` (`idUsuario`),
  CONSTRAINT `fk_recurso_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `USUARIO` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECURSO`
--

LOCK TABLES `RECURSO` WRITE;
/*!40000 ALTER TABLE `RECURSO` DISABLE KEYS */;
INSERT INTO `RECURSO` VALUES (1,1,'1544777592_679099_1544990800_noticia_normal.zip','El elefante y el ser humano.','sE8+6PXkP6OxYpgbULty/hrKuzM=','/home/usuario/Escritorio/ArchivosServidor/1544777592_679099_1544990800_noticia_normal.zip',1),(2,1,'aa-1.zip','Guerra de felinos.','sE8+6PXkP6OxYpgbULty/hrKuzM=','/home/usuario/Escritorio/ArchivosServidor/aa-1.zip',1),(3,1,'maxresdefault.zip','La tierna y dulce ardilla.','sE8+6PXkP6OxYpgbULty/hrKuzM=','/home/usuario/Escritorio/ArchivosServidor/maxresdefault.zip',1),(4,1,'wordpressphoto-naturaleza.zip','Las consecuencias de la contaminacion.','sE8+6PXkP6OxYpgbULty/hrKuzM=','/home/usuario/Escritorio/ArchivosServidor/wordpressphoto-naturaleza.zip',1);
/*!40000 ALTER TABLE `RECURSO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO` (
  `idUsuario` int(8) NOT NULL AUTO_INCREMENT,
  `apodo` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `contrasena` varchar(86) NOT NULL,
  `usersalt` varchar(86) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `apodo` (`apodo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES (1,'Águila','María Teresa','Aguirre Covarrubias','GjAJ8TVvbwQ=','uGazRpPuxI0=');
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VISIBILIDAD`
--

DROP TABLE IF EXISTS `VISIBILIDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VISIBILIDAD` (
  `idUsuario` int(8) NOT NULL,
  `nomEtiqueta` varchar(50) NOT NULL,
  `idRecurso` int(8) NOT NULL,
  `visibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idUsuario`,`nomEtiqueta`,`idRecurso`),
  KEY `fk_visibilidadecurso_recurso` (`idRecurso`),
  CONSTRAINT `fk_visibilidad_etiqueta` FOREIGN KEY (`idUsuario`, `nomEtiqueta`) REFERENCES `ETIQUETA` (`idUsuario`, `nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_visibilidadecurso_recurso` FOREIGN KEY (`idRecurso`) REFERENCES `RECURSO` (`idRecurso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VISIBILIDAD`
--

LOCK TABLES `VISIBILIDAD` WRITE;
/*!40000 ALTER TABLE `VISIBILIDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `VISIBILIDAD` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-20 18:59:53
