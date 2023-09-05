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
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `roomID` int DEFAULT NULL,
  `patientId` int NOT NULL,
  `username` varchar(70) DEFAULT NULL,
  `PASSWORD` varchar(70) DEFAULT NULL,
  `phoneNumber` varchar(10) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `pharmacy` varchar(70) DEFAULT NULL,
  `reportID` int DEFAULT NULL,
  `billingInfo` varchar(255) DEFAULT NULL,
  `appointmentId` int DEFAULT NULL,
  `dateOfBirth` varchar(70) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `conditionId` int DEFAULT NULL,
  PRIMARY KEY (`patientId`),
  KEY `patientToReportFKConstraint` (`reportID`),
  KEY `patientToAppointmentFKConstraint` (`appointmentId`),
  KEY `patientToConditionFKConstraint` (`conditionId`),
  CONSTRAINT `patientToAppointmentFKConstraint` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`appointmentId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `patientToConditionFKConstraint` FOREIGN KEY (`conditionId`) REFERENCES `medical_condition` (`conditionId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `patientToReportFKConstraint` FOREIGN KEY (`reportID`) REFERENCES `report` (`reportId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,11220,'ddecopeman0','diioFP','6071053878','98227 Blue Bill Park Alley','CVS',10035,'insurance',15322,'02-06-1965','mlyddy0@tumblr.com',20),(2,11221,'jseabrook1','PUZrs2bd','2474581076','5 Bultman Drive','Walgreens',10042,'credit card',9387,'05-23-1985','pbourgeois1@mtv.com',21),(3,11222,'eokerin2','dIVLJdZ3V','3106025694','9 Fisk Pass','Walmart',10022,'cash',22134,'10-15-1950','sheyworth2@youtu.be',22),(4,11223,'gdiddams3','rUKSEPXIrjUF','2095516469','1 Buena Vista Place','CVS',10067,'insurance',42,'03-12-1958','rubiks@cube.com',23),(5,11224,'ccossum4','vg1o6AOIZkQ','6943459074','283 Welch Park','Kroger',10051,'insurance',50392,'03-24-1974','mdowdney4@google.co.uk',24),(5,11225,'mvanvelde5','v7FNr1S5bJ','7198826004','251 Cardinal Plaza','CVS',10078,'insurance',378,'10-16-1988','tonolan5@washington.edu',25),(6,11226,'cfogt6','MWp49LJa','4142527685','44 Mayer Street','Walgreens',10005,'credit card',4932,'05-03-1976','sdicte6@marketwatch.com',22),(7,11227,'rsatford7','GDyaSjz','6008176810','46067 Claremont Crossing','Walgreens',10042,'insurance',12321,'11-09-1972','mgillet7@tamu.edu',21),(9,11228,'gcadge8','Z3bOJ0JwXO','7871548061','734 Brentwood Road','CVS',10013,'credit card',320,'08-09-1984','ckearn8@addtoany.com',25),(10,11229,'thorburgh9','inmmleY','9934069763','78799 Cardinal Junction','Walmart',10091,'insurance',23134,'06-30-2000','atellenbrok9@tripod.com',22);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
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
