-- MySQL dump 10.13  Distrib 8.0.30, for macos12.5 (arm64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `bandMembers`
--

DROP TABLE IF EXISTS `bandMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bandMembers` (
  `memberID` int NOT NULL AUTO_INCREMENT,
  `bandID` int DEFAULT NULL,
  `memberName` varchar(255) DEFAULT NULL,
  `memberSurname` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `hasCriminalRecord` tinyint DEFAULT NULL,
  PRIMARY KEY (`memberID`),
  KEY `bandID` (`bandID`),
  CONSTRAINT `bandmembers_ibfk_1` FOREIGN KEY (`bandID`) REFERENCES `battleOfTheBands` (`bandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bandMembers`
--

LOCK TABLES `bandMembers` WRITE;
/*!40000 ALTER TABLE `bandMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bandMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battleOfTheBands`
--

DROP TABLE IF EXISTS `battleOfTheBands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battleOfTheBands` (
  `bandID` int NOT NULL AUTO_INCREMENT,
  `bandFee` int DEFAULT NULL,
  `bandName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bandID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battleOfTheBands`
--

LOCK TABLES `battleOfTheBands` WRITE;
/*!40000 ALTER TABLE `battleOfTheBands` DISABLE KEYS */;
INSERT INTO `battleOfTheBands` VALUES (1,5000,'Eagles');
/*!40000 ALTER TABLE `battleOfTheBands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concerts`
--

DROP TABLE IF EXISTS `concerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concerts` (
  `ticketID` int NOT NULL AUTO_INCREMENT,
  `amountOfTickets` int DEFAULT NULL,
  `concertName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ticketID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concerts`
--

LOCK TABLES `concerts` WRITE;
/*!40000 ALTER TABLE `concerts` DISABLE KEYS */;
INSERT INTO `concerts` VALUES (1,10000,'Punk Afro 2022');
/*!40000 ALTER TABLE `concerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchandise`
--

DROP TABLE IF EXISTS `merchandise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchandise` (
  `merchID` int NOT NULL AUTO_INCREMENT,
  `merchandiseName` varchar(255) DEFAULT NULL,
  `merchandiseStock` int DEFAULT NULL,
  PRIMARY KEY (`merchID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchandise`
--

LOCK TABLES `merchandise` WRITE;
/*!40000 ALTER TABLE `merchandise` DISABLE KEYS */;
INSERT INTO `merchandise` VALUES (1,'Mug',800),(2,'T-Shirts',800),(3,'Hoodies',700),(4,'Headsets',200);
/*!40000 ALTER TABLE `merchandise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rankings`
--

DROP TABLE IF EXISTS `rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rankings` (
  `rankID` int NOT NULL AUTO_INCREMENT,
  `ranking` int DEFAULT NULL,
  `bandID` int DEFAULT NULL,
  PRIMARY KEY (`rankID`),
  KEY `bandID` (`bandID`),
  CONSTRAINT `rankings_ibfk_1` FOREIGN KEY (`bandID`) REFERENCES `battleOfTheBands` (`bandID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rankings`
--

LOCK TABLES `rankings` WRITE;
/*!40000 ALTER TABLE `rankings` DISABLE KEYS */;
INSERT INTO `rankings` VALUES (1,1,1);
/*!40000 ALTER TABLE `rankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transactionID` int NOT NULL AUTO_INCREMENT,
  `merchID` int DEFAULT NULL,
  `ticketID` int DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`transactionID`),
  KEY `merchID` (`merchID`),
  KEY `userID` (`userID`),
  KEY `ticketID` (`ticketID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`merchID`) REFERENCES `merchandise` (`merchID`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`ticketID`) REFERENCES `concerts` (`ticketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `userSurname` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userGender` char(1) DEFAULT NULL,
  `userDOB` varchar(10) DEFAULT NULL,
  `userAddress` varchar(255) DEFAULT NULL,
  `userCountryOfBirth` varchar(255) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `userIdentityNumber` varchar(255) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'admin-mandla','admin-chavarika','admin@admin.com','O','010112','Headquaters Road','South Africa',1,'0101125705083','admin123'),(5,'Mandla','Chavarika','mandlac12@gmail.com','M','010112','50 Kernick Avenue','South Africa',0,'0101125705083','admin123'),(6,'admin-zoe','admin-bulle','admin2@admin.com','O','010101','Headquaters','South Africa',1,'0101013001301','admin123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-01 15:14:10
