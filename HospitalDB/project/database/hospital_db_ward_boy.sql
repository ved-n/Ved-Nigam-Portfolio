-- MySQL dump 10.13  Distrib 8.0.32, for macos13 (x86_64)
--
-- Host: localhost    Database: hospital_db
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `ward_boy`
--

DROP TABLE IF EXISTS `ward_boy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ward_boy` (
  `essn` int NOT NULL,
  `departmentId` int NOT NULL DEFAULT '0',
  `roomId` int NOT NULL DEFAULT '0',
  `reportId` int DEFAULT NULL,
  PRIMARY KEY (`essn`),
  KEY `wardboyFKConstraint` (`departmentId`),
  KEY `roomFKConstraint` (`roomId`),
  KEY `wbToReportFKConstraint` (`reportId`),
  CONSTRAINT `roomFKConstraint` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE SET DEFAULT ON UPDATE CASCADE,
  CONSTRAINT `wardboyFKConstraint` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`) ON DELETE SET DEFAULT ON UPDATE CASCADE,
  CONSTRAINT `wbToReportFKConstraint` FOREIGN KEY (`reportId`) REFERENCES `report` (`reportId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_boy`
--

LOCK TABLES `ward_boy` WRITE;
/*!40000 ALTER TABLE `ward_boy` DISABLE KEYS */;
INSERT INTO `ward_boy` VALUES (188450099,5,25,10067),(251817688,3,13,10022),(264413513,2,11,10042),(290106497,4,24,10013),(790778459,1,8,10051);
/*!40000 ALTER TABLE `ward_boy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-16 14:25:27
