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
-- Temporary view structure for view `administratorinfoview`
--

DROP TABLE IF EXISTS `administratorinfoview`;
/*!50001 DROP VIEW IF EXISTS `administratorinfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `administratorinfoview` AS SELECT 
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `phoneNumber`,
 1 AS `dateOfBirth`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrators` (
  `essn` int NOT NULL,
  PRIMARY KEY (`essn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (122999126),(124534627),(550110669),(692059235),(873496451);
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointmentId` int NOT NULL,
  `time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`appointmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (42,'11:30:00','2001-01-01'),(320,'09:30:00','2001-01-01'),(378,'07:00:00','2001-01-01'),(4932,'12:30:00','2001-01-01'),(9387,'08:30:00','2001-01-01'),(12321,'08:00:00','2001-01-01'),(15322,'01:00:00','2001-01-01'),(22134,'11:00:00','2001-01-01'),(23134,'10:00:00','2001-01-01'),(50392,'01:30:00','2001-01-01');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_specialist`
--

DROP TABLE IF EXISTS `billing_specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_specialist` (
  `essn` int NOT NULL,
  `billingInfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`essn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_specialist`
--

LOCK TABLES `billing_specialist` WRITE;
/*!40000 ALTER TABLE `billing_specialist` DISABLE KEYS */;
INSERT INTO `billing_specialist` VALUES (193726581,'Cash'),(207955916,'Insurance'),(631806149,'Credit'),(810763928,'Insurance'),(814566557,'Credit');
/*!40000 ALTER TABLE `billing_specialist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `billingspecialistinfoview`
--

DROP TABLE IF EXISTS `billingspecialistinfoview`;
/*!50001 DROP VIEW IF EXISTS `billingspecialistinfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `billingspecialistinfoview` AS SELECT 
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `phoneNumber`,
 1 AS `dateOfBirth`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentId` int NOT NULL,
  `departmentName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Cardiology'),(2,'Oncology'),(3,'Neurology'),(4,'Pediatrics'),(5,'Internal Medicine');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `essn` int NOT NULL,
  `departmentId` int DEFAULT NULL,
  `roomId` int NOT NULL DEFAULT '0',
  `reportId` int DEFAULT NULL,
  PRIMARY KEY (`essn`),
  KEY `roomFK` (`roomId`),
  KEY `drToReportFK` (`reportId`),
  CONSTRAINT `drToReportFK` FOREIGN KEY (`reportId`) REFERENCES `report` (`reportId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `roomFK` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (135801141,5,24,10067),(218443429,4,17,10051),(365968732,1,1,10039),(370674578,3,11,10005),(558773369,1,2,10005),(638924880,5,25,10078),(639038304,2,8,10022),(660114793,3,13,10035),(703022573,4,16,10042),(898481494,2,6,10013);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `doctorinfoview`
--

DROP TABLE IF EXISTS `doctorinfoview`;
/*!50001 DROP VIEW IF EXISTS `doctorinfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `doctorinfoview` AS SELECT 
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `phoneNumber`,
 1 AS `dateOfBirth`,
 1 AS `email`,
 1 AS `departmentId`,
 1 AS `roomId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `essn` int NOT NULL,
  `firstname` varchar(70) DEFAULT NULL,
  `lastname` varchar(70) DEFAULT NULL,
  `username` varchar(70) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `phoneNumber` varchar(70) DEFAULT NULL,
  `dateOfBirth` varchar(70) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`essn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (122999126,'Emmie','Macknish','emacknishe','mDo7PXh','4045385135','1984-07-21','emacknishe@cornell.edu'),(124534627,'Kristin','Pareman','kparemana','arvoCKrQe','5739085649','1990-08-27','kparemana@over-blog.com'),(135801141,'Sheppard','Hulcoop','shulcoops','RO5zbu0xVZ99','5425365964','1999-02-04','shulcoops@wordpress.com'),(188450099,'Romola','Madders','rmaddersy','TgEi3l2q','8332362164','1998-09-19','rmaddersy@ocn.ne.jp'),(193726581,'Madeline','Sheldrake','msheldrakez','MItJSwelGqyl','7946578531','1994-02-14','msheldrakez@google.com.br'),(207955916,'Margy','Streatfeild','mstreatfeild12','kQMT5KJdq1UZ','8976070347','1989-12-31','mstreatfeild12@bizjournals.com'),(218443429,'Hy','Itzkovici','hitzkovicir','UZD8u9zg','1971164585','2001-10-14','hitzkovicir@scientificamerican.com'),(251817688,'Karilynn','Swaffer','kswafferw','LGSyo13','6492414803','1985-02-21','kswafferw@redcross.org'),(264413513,'Link','Behagg','lbehaggv','p7eppb6AR','1244428763','1995-04-05','lbehaggv@prlog.org'),(282761427,'Caprice','Killingworth','ckillingworth2','HoONQ4BVo0G','3907870987','1995-10-09','ckillingworth2@wiley.com'),(282949625,'Germayne','Henkmann','ghenkmann0','UbtKinCpdZH2','1361971016','1994-04-02','ghenkmann0@dot.gov'),(289493574,'Agosto','Grosvener','agrosvener1','ZEnuEJlb5lrm','7849738318','1984-12-24','agrosvener1@narod.ru'),(290106497,'Zsazsa','Hambright','zhambrightx','FJjZbiF4','3118837065','1992-02-25','zhambrightx@shinystat.com'),(299453984,'Vivienne','Braisher','vbraisher8','uCDfviTkACiu','7035574251','1987-12-06','vbraisher8@webnode.com'),(349355959,'Roldan','Goldby','rgoldby2','XMF1bz3b2','1395081395','1999-09-22','rgoldby2@icio.us'),(365968732,'Fara','Karel','fkarelj','OuE9jVcngNNW','7013536910','1996-06-08','fkarelj@thetimes.co.uk'),(370674578,'Selle','McGill','smcgillo','DnISuA','1279968728','1992-01-06','smcgillo@pcworld.com'),(428526280,'Anna-diane','Papen','apapen3','o9aPAo4','3575782604','1989-02-27','apapen3@taobao.com'),(445108868,'Linda','Seldner','lseldner3','nLnTfK04','8397342190','2004-07-22','lseldner3@cafepress.com'),(514035765,'Kris','Jiggle','kjigglei','jORR6Wha','9163338530','1995-12-03','kjigglei@chronoengine.com'),(535875897,'Steffen','Dufour','sdufour6','Oo38dBU0k','5763541812','1992-12-28','sdufour6@cnbc.com'),(550110669,'Geneva','Barck','gbarckc','MREAQ9nE','2493917385','1990-08-14','gbarckc@fastcompany.com'),(558773369,'Ellissa','Scawn','escawnl','BPdnifw','8179939284','2001-09-19','escawnl@gizmodo.com'),(564196262,'Fannie','Slinn','fslinn4','kzYi1PJ','8573585817','2000-01-05','fslinn4@va.gov'),(613843230,'Lavinia','Batcock','lbatcock7','MYpnrDys8','4858064292','1992-12-28','lbatcock7@ca.gov'),(631806149,'Melania','Danielou','mdanielou10','FKIhtH','8783112472','2002-08-16','mdanielou10@yelp.com'),(633693251,'Hurlee','Ruckman','hruckman5','RQ1jWj5l','7749725243','1984-01-19','hruckman5@drupal.org'),(638924880,'Farleigh','Vedeshkin','fvedeshkint','YRe2Ak','9559181506','1995-12-31','fvedeshkint@forbes.com'),(639038304,'Ulrike','Brade','ubraden','RWS1w5o9ld76','4262153674','2005-02-12','ubraden@tinypic.com'),(660114793,'Dalila','Woolsey','dwoolseyp','LU50Vh','7787598231','1991-10-19','dwoolseyp@freewebs.com'),(676284134,'Leann','Boller','lboller9','BplZrX4g','4047735472','1985-09-15','lboller9@free.fr'),(680030878,'Lock','Ternott','lternott4','2ttFSbnCKuLl','8975790002','1984-09-17','lternott4@yahoo.com'),(682567919,'Tildi','Brasher','tbrasherf','Yxds5g','4152061506','1995-04-28','tbrasherf@answers.com'),(683377572,'Janna','Rapp','jrapp0','THkYFsF','8425199291','1984-01-09','jrapp0@mtv.com'),(692059235,'Demetri','Rafter','drafterb','MREAQ9nE','8091888486','1996-09-08','drafterb@fda.gov'),(703022573,'Burke','Coton','bcotonq','MpLXgBkrR8f','6213221321','1996-03-08','bcotonq@last.fm'),(790778459,'Babbie','Worthing','bworthingu','Ysg0Dg','7833004518','1998-04-04','bworthingu@cocolog-nifty.com'),(810763928,'Alica','Stormouth','astormouth11','AivSkf','9014987891','1990-01-09','astormouth11@artisteer.com'),(814566557,'Nancey','Dunniom','ndunniom13','NoKODBjdEZi','8549340564','1983-08-07','ndunniom13@delicious.com'),(853398644,'Myrta','Diehn','mdiehnh','rlSPNj','9491958119','1983-06-02','mdiehnh@ning.com'),(858980174,'Esta','Vaz','evazg','xKCf0UCcli','3054496142','2000-08-07','evazg@naver.com'),(873496451,'Celine','Dorsett','cdorsettd','Tbp6qjg6fBT','6697868966','1991-12-14','cdorsettd@hhs.gov'),(882773628,'Shana','Pickford','spickford1','cCgfQGe','5166413759','1988-08-18','spickford1@nyu.edu'),(898481494,'Mina','Houston','mhoustonm','uuhkuWORgw','4998600650','1994-12-05','mhoustonm@123-reg.co.uk');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employeeinfoview`
--

DROP TABLE IF EXISTS `employeeinfoview`;
/*!50001 DROP VIEW IF EXISTS `employeeinfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeeinfoview` AS SELECT 
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `phoneNumber`,
 1 AS `dateOfBirth`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lab_assistant`
--

DROP TABLE IF EXISTS `lab_assistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_assistant` (
  `essn` int NOT NULL,
  `reportId` int DEFAULT NULL,
  PRIMARY KEY (`essn`),
  KEY `reportIdFK` (`reportId`),
  CONSTRAINT `reportIdFK` FOREIGN KEY (`reportId`) REFERENCES `report` (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_assistant`
--

LOCK TABLES `lab_assistant` WRITE;
/*!40000 ALTER TABLE `lab_assistant` DISABLE KEYS */;
INSERT INTO `lab_assistant` VALUES (676284134,10005),(633693251,10022),(535875897,10051),(613843230,10067),(299453984,10091);
/*!40000 ALTER TABLE `lab_assistant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `labassistantinfoview`
--

DROP TABLE IF EXISTS `labassistantinfoview`;
/*!50001 DROP VIEW IF EXISTS `labassistantinfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `labassistantinfoview` AS SELECT 
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `phoneNumber`,
 1 AS `dateOfBirth`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `medical_condition`
--

DROP TABLE IF EXISTS `medical_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_condition` (
  `conditionId` int NOT NULL,
  `conditionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`conditionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_condition`
--

LOCK TABLES `medical_condition` WRITE;
/*!40000 ALTER TABLE `medical_condition` DISABLE KEYS */;
INSERT INTO `medical_condition` VALUES (20,'Covid-19'),(21,'Heart attack/stroke'),(22,'Alzheimers/Dementia'),(23,'Post-operation'),(24,'Pneumonia'),(25,'Transplant');
/*!40000 ALTER TABLE `medical_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medicineId` int NOT NULL,
  `reportId` int DEFAULT NULL,
  `medicineName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`medicineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (93421,10001,'Ibuprofen'),(195839,10004,'Zyrtec'),(6843910,10003,'Tylenol'),(7321936,10005,'Xanax'),(9384501,10002,'Amoxicillin');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `essn` int NOT NULL,
  `departmentId` int DEFAULT NULL,
  `roomId` int NOT NULL DEFAULT '0',
  `reportId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`essn`),
  KEY `nurseToRoomFKConstraint` (`roomId`),
  KEY `nurseToReportFKConstraint` (`reportId`),
  CONSTRAINT `nurseToReportFKConstraint` FOREIGN KEY (`reportId`) REFERENCES `report` (`reportId`) ON DELETE SET DEFAULT ON UPDATE CASCADE,
  CONSTRAINT `nurseToRoomFKConstraint` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (282761427,1,2,10051),(289493574,2,7,10078),(445108868,1,2,10067),(680030878,1,2,10039),(683377572,1,2,10035);
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nurseinfoview`
--

DROP TABLE IF EXISTS `nurseinfoview`;
/*!50001 DROP VIEW IF EXISTS `nurseinfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nurseinfoview` AS SELECT 
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `phoneNumber`,
 1 AS `dateOfBirth`,
 1 AS `email`,
 1 AS `roomId`,
 1 AS `departmentId`*/;
SET character_set_client = @saved_cs_client;

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

--
-- Temporary view structure for view `patientinfoview`
--

DROP TABLE IF EXISTS `patientinfoview`;
/*!50001 DROP VIEW IF EXISTS `patientinfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patientinfoview` AS SELECT 
 1 AS `roomId`,
 1 AS `patientId`,
 1 AS `phoneNumber`,
 1 AS `address`,
 1 AS `pharmacy`,
 1 AS `appointmentId`,
 1 AS `dateOfBirth`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receptionist` (
  `essn` varchar(10) NOT NULL,
  `departmentId` int NOT NULL DEFAULT '0',
  `appointmentId` int DEFAULT NULL,
  PRIMARY KEY (`essn`),
  KEY `departmentFK` (`departmentId`),
  KEY `appointmentFK` (`appointmentId`),
  CONSTRAINT `appointmentFK` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`appointmentId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `departmentFK` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionist`
--

LOCK TABLES `receptionist` WRITE;
/*!40000 ALTER TABLE `receptionist` DISABLE KEYS */;
INSERT INTO `receptionist` VALUES ('365968732',5,50392),('514035765',4,15322),('682567919',1,320),('853398644',3,12321),('858980174',2,4932);
/*!40000 ALTER TABLE `receptionist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `receptionistinfoview`
--

DROP TABLE IF EXISTS `receptionistinfoview`;
/*!50001 DROP VIEW IF EXISTS `receptionistinfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `receptionistinfoview` AS SELECT 
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `phoneNumber`,
 1 AS `dateOfBirth`,
 1 AS `email`,
 1 AS `departmentId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `record_keeper`
--

DROP TABLE IF EXISTS `record_keeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_keeper` (
  `essn` int NOT NULL,
  PRIMARY KEY (`essn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_keeper`
--

LOCK TABLES `record_keeper` WRITE;
/*!40000 ALTER TABLE `record_keeper` DISABLE KEYS */;
INSERT INTO `record_keeper` VALUES (282949625),(349355959),(428526280),(564196262),(882773628);
/*!40000 ALTER TABLE `record_keeper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `recordkeeperinfoview`
--

DROP TABLE IF EXISTS `recordkeeperinfoview`;
/*!50001 DROP VIEW IF EXISTS `recordkeeperinfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recordkeeperinfoview` AS SELECT 
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `phoneNumber`,
 1 AS `dateOfBirth`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `reportId` int NOT NULL,
  `labResults` varchar(50) DEFAULT NULL,
  `medicineId` int DEFAULT NULL,
  PRIMARY KEY (`reportId`),
  KEY `reportFKConstraint` (`medicineId`),
  CONSTRAINT `reportFKConstraint` FOREIGN KEY (`medicineId`) REFERENCES `medicine` (`medicineId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (10005,'pending',7321936),(10013,'reviewed',93421),(10022,'in review',6843910),(10035,'pending',9384501),(10039,'in review',195839),(10042,'pending',93421),(10051,'reviewed',9384501),(10067,'in review',195839),(10078,'reviewed',7321936),(10091,'reviewed',195839);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomId` int NOT NULL,
  `departmentId` int NOT NULL DEFAULT '0',
  `roomNo` int DEFAULT NULL,
  PRIMARY KEY (`roomId`),
  KEY `departmentFKConstraint` (`departmentId`),
  CONSTRAINT `departmentFKConstraint` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,1,11),(2,1,12),(3,1,13),(4,1,14),(5,1,15),(6,2,21),(7,2,22),(8,2,23),(9,2,24),(10,2,25),(11,3,31),(12,3,32),(13,3,33),(14,3,34),(15,3,35),(16,4,41),(17,4,42),(18,4,43),(19,4,44),(20,4,45),(21,5,51),(22,5,52),(23,5,53),(24,5,54),(25,5,55);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Temporary view structure for view `wardboyinfoview`
--

DROP TABLE IF EXISTS `wardboyinfoview`;
/*!50001 DROP VIEW IF EXISTS `wardboyinfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wardboyinfoview` AS SELECT 
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `phoneNumber`,
 1 AS `dateOfBirth`,
 1 AS `email`,
 1 AS `departmentId`,
 1 AS `roomId`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `administratorinfoview`
--

/*!50001 DROP VIEW IF EXISTS `administratorinfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `administratorinfoview` AS select distinct `employee`.`firstname` AS `firstname`,`employee`.`lastname` AS `lastname`,`employee`.`phoneNumber` AS `phoneNumber`,`employee`.`dateOfBirth` AS `dateOfBirth`,`employee`.`email` AS `email` from (`administrators` join `employee`) where (`administrators`.`essn` = `employee`.`essn`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `billingspecialistinfoview`
--

/*!50001 DROP VIEW IF EXISTS `billingspecialistinfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `billingspecialistinfoview` AS select distinct `employee`.`firstname` AS `firstname`,`employee`.`lastname` AS `lastname`,`employee`.`phoneNumber` AS `phoneNumber`,`employee`.`dateOfBirth` AS `dateOfBirth`,`employee`.`email` AS `email` from (`billing_specialist` join `employee`) where (`billing_specialist`.`essn` = `employee`.`essn`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `doctorinfoview`
--

/*!50001 DROP VIEW IF EXISTS `doctorinfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctorinfoview` AS select distinct `employee`.`firstname` AS `firstname`,`employee`.`lastname` AS `lastname`,`employee`.`phoneNumber` AS `phoneNumber`,`employee`.`dateOfBirth` AS `dateOfBirth`,`employee`.`email` AS `email`,`doctor`.`departmentId` AS `departmentId`,`doctor`.`roomId` AS `roomId` from (`doctor` join `employee`) where (`doctor`.`essn` = `employee`.`essn`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeeinfoview`
--

/*!50001 DROP VIEW IF EXISTS `employeeinfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeeinfoview` AS select `employee`.`firstname` AS `firstname`,`employee`.`lastname` AS `lastname`,`employee`.`phoneNumber` AS `phoneNumber`,`employee`.`dateOfBirth` AS `dateOfBirth`,`employee`.`email` AS `email` from `employee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `labassistantinfoview`
--

/*!50001 DROP VIEW IF EXISTS `labassistantinfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `labassistantinfoview` AS select distinct `employee`.`firstname` AS `firstname`,`employee`.`lastname` AS `lastname`,`employee`.`phoneNumber` AS `phoneNumber`,`employee`.`dateOfBirth` AS `dateOfBirth`,`employee`.`email` AS `email` from (`lab_assistant` join `employee`) where (`lab_assistant`.`essn` = `employee`.`essn`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nurseinfoview`
--

/*!50001 DROP VIEW IF EXISTS `nurseinfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nurseinfoview` AS select distinct `employee`.`firstname` AS `firstname`,`employee`.`lastname` AS `lastname`,`employee`.`phoneNumber` AS `phoneNumber`,`employee`.`dateOfBirth` AS `dateOfBirth`,`employee`.`email` AS `email`,`nurse`.`roomId` AS `roomId`,`nurse`.`departmentId` AS `departmentId` from (`nurse` join `employee`) where (`nurse`.`essn` = `employee`.`essn`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patientinfoview`
--

/*!50001 DROP VIEW IF EXISTS `patientinfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patientinfoview` AS select `patient`.`roomID` AS `roomId`,`patient`.`patientId` AS `patientId`,`patient`.`phoneNumber` AS `phoneNumber`,`patient`.`address` AS `address`,`patient`.`pharmacy` AS `pharmacy`,`patient`.`appointmentId` AS `appointmentId`,`patient`.`dateOfBirth` AS `dateOfBirth`,`patient`.`email` AS `email` from `patient` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `receptionistinfoview`
--

/*!50001 DROP VIEW IF EXISTS `receptionistinfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `receptionistinfoview` AS select distinct `employee`.`firstname` AS `firstname`,`employee`.`lastname` AS `lastname`,`employee`.`phoneNumber` AS `phoneNumber`,`employee`.`dateOfBirth` AS `dateOfBirth`,`employee`.`email` AS `email`,`receptionist`.`departmentId` AS `departmentId` from (`receptionist` join `employee`) where (`receptionist`.`essn` = `employee`.`essn`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recordkeeperinfoview`
--

/*!50001 DROP VIEW IF EXISTS `recordkeeperinfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recordkeeperinfoview` AS select distinct `employee`.`firstname` AS `firstname`,`employee`.`lastname` AS `lastname`,`employee`.`phoneNumber` AS `phoneNumber`,`employee`.`dateOfBirth` AS `dateOfBirth`,`employee`.`email` AS `email` from (`record_keeper` join `employee`) where (`record_keeper`.`essn` = `employee`.`essn`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wardboyinfoview`
--

/*!50001 DROP VIEW IF EXISTS `wardboyinfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wardboyinfoview` AS select distinct `employee`.`firstname` AS `firstname`,`employee`.`lastname` AS `lastname`,`employee`.`phoneNumber` AS `phoneNumber`,`employee`.`dateOfBirth` AS `dateOfBirth`,`employee`.`email` AS `email`,`ward_boy`.`departmentId` AS `departmentId`,`ward_boy`.`roomId` AS `roomId` from (`ward_boy` join `employee`) where (`ward_boy`.`essn` = `employee`.`essn`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-17 20:39:40
