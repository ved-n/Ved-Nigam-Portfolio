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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-16 14:25:27
