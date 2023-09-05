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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-16 14:25:27
