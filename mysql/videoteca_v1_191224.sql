-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: videoteca
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `affiti`
--

DROP TABLE IF EXISTS `affiti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiti` (
  `id_affitto` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_film` int DEFAULT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  PRIMARY KEY (`id_affitto`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `affiti_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clienti` (`matricola`),
  CONSTRAINT `affiti_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiti`
--

LOCK TABLES `affiti` WRITE;
/*!40000 ALTER TABLE `affiti` DISABLE KEYS */;
INSERT INTO `affiti` VALUES (1,1,1,'2014-09-22','2015-06-06'),(2,2,3,'2017-05-13','2017-09-30'),(3,3,2,'2020-01-06','2020-01-21');
/*!40000 ALTER TABLE `affiti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `matricola` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_film` int NOT NULL,
  PRIMARY KEY (`matricola`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `clienti_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'marco','rossi','marcorossi@gmail.com',1),(2,'giulia','bianchi','giulietta05@gmail.com',2),(3,'giorgio','verdi','gio_verdi@gmail.it',2),(4,'martina','gialli','marty_99@gmail.it',2);
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `titolo` varchar(100) NOT NULL,
  `anno_uscita` year DEFAULT NULL,
  `durata_minuti` int DEFAULT NULL,
  `genere` varchar(100) DEFAULT NULL,
  `id_regista` int DEFAULT NULL,
  PRIMARY KEY (`id_film`),
  KEY `id_regista` (`id_regista`),
  CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_regista`) REFERENCES `registi` (`id_registi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'1984',1984,110,'sci-fi',NULL),(2,'titanic',1997,194,'romantico',NULL),(3,'la carica dei 101',1961,79,'per famiglie',NULL),(4,'peter pan',1953,76,'per famiglie',NULL),(5,'nemo',2003,100,'per famiglie',NULL);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genere`
--

DROP TABLE IF EXISTS `genere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genere` (
  `id_genere` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genere`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genere`
--

LOCK TABLES `genere` WRITE;
/*!40000 ALTER TABLE `genere` DISABLE KEYS */;
INSERT INTO `genere` VALUES (1,'sci-fi'),(2,'romantico'),(3,'per famiglie');
/*!40000 ALTER TABLE `genere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registi`
--

DROP TABLE IF EXISTS `registi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registi` (
  `id_registi` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `nazionalita` varchar(50) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  `data_morte` date DEFAULT NULL,
  PRIMARY KEY (`id_registi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registi`
--

LOCK TABLES `registi` WRITE;
/*!40000 ALTER TABLE `registi` DISABLE KEYS */;
INSERT INTO `registi` VALUES (1,'George Orwell','Inglese','1903-06-25','1950-01-21'),(2,'James Cameron','Canadese','1954-08-16',NULL),(3,'Wolfgang Reitherman','statunitense','1909-06-26','1985-05-07'),(4,'J. M. Barrie','britannico','1860-05-09','1937-06-19'),(5,'Andrew Stanton','statunitense','1965-12-03',NULL);
/*!40000 ALTER TABLE `registi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-19  8:36:41



 mysql -u root videoteca < videoteca_v1_191224.sql 
 mysql -u root