CREATE DATABASE  IF NOT EXISTS `universita` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universita`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: universita
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aula` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (3,'Delta 1B'),(4,'Aula Magna'),(5,'Zeta C'),(6,'Alpha');
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corso_laurea`
--

DROP TABLE IF EXISTS `corso_laurea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corso_laurea` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `percorso` varchar(45) NOT NULL,
  `coordinatore` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_corso_laurea_docente1_idx` (`coordinatore`),
  CONSTRAINT `fk_corso_laurea_docente1` FOREIGN KEY (`coordinatore`) REFERENCES `docente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corso_laurea`
--

LOCK TABLES `corso_laurea` WRITE;
/*!40000 ALTER TABLE `corso_laurea` DISABLE KEYS */;
INSERT INTO `corso_laurea` VALUES (1,'Informatica','Triennale',1),(2,'Lingue','Magistrale',2);
/*!40000 ALTER TABLE `corso_laurea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corso_materia`
--

DROP TABLE IF EXISTS `corso_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corso_materia` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cfu` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `aula_id` int unsigned NOT NULL,
  `esercitatore` int unsigned NOT NULL,
  `corso_laurea_id` int unsigned NOT NULL,
  `docente_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_corso_materia_aula1_idx` (`aula_id`),
  KEY `fk_corso_materia_studente1_idx` (`esercitatore`),
  KEY `fk_corso_materia_corso_laurea1_idx` (`corso_laurea_id`),
  KEY `fk_corso_materia_docente1_idx` (`docente_id`),
  CONSTRAINT `fk_corso_materia_aula1` FOREIGN KEY (`aula_id`) REFERENCES `aula` (`id`),
  CONSTRAINT `fk_corso_materia_corso_laurea1` FOREIGN KEY (`corso_laurea_id`) REFERENCES `corso_laurea` (`id`),
  CONSTRAINT `fk_corso_materia_docente1` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id`),
  CONSTRAINT `fk_corso_materia_studente1` FOREIGN KEY (`esercitatore`) REFERENCES `studente` (`matricola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corso_materia`
--

LOCK TABLES `corso_materia` WRITE;
/*!40000 ALTER TABLE `corso_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `corso_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'Elena','Vivan'),(2,'Fabio','Pittarello');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esame`
--

DROP TABLE IF EXISTS `esame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esame` (
  `studente_matricola` int unsigned NOT NULL,
  `corso_materia_id` int unsigned NOT NULL,
  `voto` int NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`studente_matricola`,`corso_materia_id`),
  KEY `fk_studente_has_corso_materia_corso_materia1_idx` (`corso_materia_id`),
  KEY `fk_studente_has_corso_materia_studente1_idx` (`studente_matricola`),
  CONSTRAINT `fk_studente_has_corso_materia_corso_materia1` FOREIGN KEY (`corso_materia_id`) REFERENCES `corso_materia` (`id`),
  CONSTRAINT `fk_studente_has_corso_materia_studente1` FOREIGN KEY (`studente_matricola`) REFERENCES `studente` (`matricola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esame`
--

LOCK TABLES `esame` WRITE;
/*!40000 ALTER TABLE `esame` DISABLE KEYS */;
/*!40000 ALTER TABLE `esame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rimborso`
--

DROP TABLE IF EXISTS `rimborso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rimborso` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `euro` int NOT NULL,
  `docente_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rimborso_docente_idx` (`docente_id`),
  CONSTRAINT `fk_rimborso_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rimborso`
--

LOCK TABLES `rimborso` WRITE;
/*!40000 ALTER TABLE `rimborso` DISABLE KEYS */;
INSERT INTO `rimborso` VALUES (1,100,1),(2,150,1);
/*!40000 ALTER TABLE `rimborso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studente`
--

DROP TABLE IF EXISTS `studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studente` (
  `matricola` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `corso_laurea_id` int unsigned NOT NULL,
  PRIMARY KEY (`matricola`),
  KEY `fk_studente_corso_laurea1_idx` (`corso_laurea_id`),
  CONSTRAINT `fk_studente_corso_laurea1` FOREIGN KEY (`corso_laurea_id`) REFERENCES `corso_laurea` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studente`
--

LOCK TABLES `studente` WRITE;
/*!40000 ALTER TABLE `studente` DISABLE KEYS */;
INSERT INTO `studente` VALUES (1,'Lorenzo','Soligo',1),(2,'Renè','Ferretti',2),(3,'Duccio','Patanè',1),(4,'Stanis','La Rochelle',1),(5,'Guido','Sermonti',2);
/*!40000 ALTER TABLE `studente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-23 10:38:57
