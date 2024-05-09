-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: bookingcounts_grafana
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `YAS_Bookings_Quotes_Count_Report`
--

DROP TABLE IF EXISTS `YAS_Bookings_Quotes_Count_Report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `YAS_Bookings_Quotes_Count_Report` (
  `RECORD_ID` int NOT NULL AUTO_INCREMENT,
  `YEAR` int DEFAULT NULL,
  `MONTH` varchar(3) DEFAULT NULL,
  `BOOKING_COUNT` int DEFAULT NULL,
  `PAX_COUNT` int DEFAULT NULL,
  `QUOTE_COUNT` int DEFAULT NULL,
  `QUOTE_PAX_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`RECORD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `YAS_Bookings_Quotes_Count_Report`
--

LOCK TABLES `YAS_Bookings_Quotes_Count_Report` WRITE;
/*!40000 ALTER TABLE `YAS_Bookings_Quotes_Count_Report` DISABLE KEYS */;
INSERT INTO `YAS_Bookings_Quotes_Count_Report` VALUES (63,2022,'JAN',569,1695,13,34),(64,2022,'FEB',1160,3625,35,112),(65,2022,'MAR',2225,7348,31,122),(66,2022,'APR',2707,9953,67,361),(67,2022,'MAY',3506,13073,75,335),(68,2021,'JUN',1178,4131,31,91),(69,2022,'JUN',3944,14520,76,262),(70,2021,'JUL',2346,8764,18,98),(71,2022,'JUL',6578,25824,85,392),(72,2021,'AUG',1807,7136,11,38),(73,2022,'AUG',6179,26979,102,485),(74,2022,'SEP',3129,12626,80,472),(75,2021,'SEP',906,2982,20,65),(76,2022,'OCT',3245,14378,102,459),(77,2021,'OCT',1814,6558,35,191),(78,2021,'NOV',1892,6454,52,191),(79,2022,'NOV',2992,12044,71,327),(80,2022,'DEC',4847,21719,93,632),(81,2021,'DEC',1607,5423,32,71);
/*!40000 ALTER TABLE `YAS_Bookings_Quotes_Count_Report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `YAS_Bookings_Quotes_Surf_or_TBX_Central_Pax_Counts`
--

DROP TABLE IF EXISTS `YAS_Bookings_Quotes_Surf_or_TBX_Central_Pax_Counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `YAS_Bookings_Quotes_Surf_or_TBX_Central_Pax_Counts` (
  `RECORD_ID` int NOT NULL AUTO_INCREMENT,
  `YEAR` int DEFAULT NULL,
  `MONTH` varchar(3) DEFAULT NULL,
  `BOOKING_COUNT` int DEFAULT NULL,
  `PAX_COUNT` int DEFAULT NULL,
  `QUOTE_COUNT` int DEFAULT NULL,
  `QUOTE_PAX_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`RECORD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `YAS_Bookings_Quotes_Surf_or_TBX_Central_Pax_Counts`
--

LOCK TABLES `YAS_Bookings_Quotes_Surf_or_TBX_Central_Pax_Counts` WRITE;
/*!40000 ALTER TABLE `YAS_Bookings_Quotes_Surf_or_TBX_Central_Pax_Counts` DISABLE KEYS */;
INSERT INTO `YAS_Bookings_Quotes_Surf_or_TBX_Central_Pax_Counts` VALUES (1,2022,'JAN',567,1690,13,34),(2,2022,'FEB',1156,3610,35,112),(3,2022,'MAR',2211,7315,31,122),(4,2022,'APR',2707,9953,67,361),(5,2022,'MAY',3502,13065,75,335),(6,2021,'JUN',1176,4128,30,90),(7,2022,'JUN',3940,14490,76,262),(8,2021,'JUL',2346,8764,18,98),(9,2022,'JUL',6571,25807,84,388),(10,2021,'AUG',1806,7134,11,38),(11,2022,'AUG',6175,26963,102,485),(12,2022,'SEP',3129,12626,80,472),(13,2021,'SEP',899,2966,20,65),(14,2022,'OCT',3245,14378,102,459),(15,2021,'OCT',1808,6539,35,191),(16,2021,'NOV',1885,6425,52,191),(17,2022,'NOV',2992,12044,71,327),(18,2022,'DEC',4846,21715,93,632),(19,2021,'DEC',1599,5409,29,65);
/*!40000 ALTER TABLE `YAS_Bookings_Quotes_Surf_or_TBX_Central_Pax_Counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `YAS_Component_Booking_Counts`
--

DROP TABLE IF EXISTS `YAS_Component_Booking_Counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `YAS_Component_Booking_Counts` (
  `RECORD_ID` int NOT NULL AUTO_INCREMENT,
  `YEAR` int DEFAULT NULL,
  `MONTH` varchar(3) DEFAULT NULL,
  `BOOKING_COUNT` int DEFAULT NULL,
  `PRODUCT_CODE` varchar(50) DEFAULT NULL,
  `CITY_CODE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RECORD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `YAS_Component_Booking_Counts`
--

LOCK TABLES `YAS_Component_Booking_Counts` WRITE;
/*!40000 ALTER TABLE `YAS_Component_Booking_Counts` DISABLE KEYS */;
INSERT INTO `YAS_Component_Booking_Counts` VALUES (1,2018,'JUL',1,'GEN','AUH\r'),(2,2018,'AUG',16,'GEN','AUH\r'),(3,2018,'AUG',2,'HTL','AUH\r'),(4,2018,'SEP',14,'GEN','AUH\r'),(5,2018,'OCT',53,'GEN','AUH\r'),(6,2018,'NOV',21,'GEN','AUH\r'),(7,2018,'NOV',1,'HTL','null\r'),(8,2018,'DEC',80,'GEN','AUH\r'),(9,2019,'JAN',46,'GEN','AUH\r'),(10,2019,'JAN',6,'HTL','AUH\r'),(11,2019,'JAN',3,'HTL','null\r'),(12,2019,'FEB',26,'GEN','AUH\r'),(13,2019,'FEB',3,'HTL','null\r'),(14,2019,'FEB',1,'HTL','AUH\r'),(15,2019,'MAR',13,'GEN','AUH\r'),(16,2019,'MAR',2,'HTL','AUH\r'),(17,2019,'APR',22,'GEN','AUH\r'),(18,2019,'APR',3,'MAN','null\r'),(19,2019,'MAY',49,'GEN','AUH\r'),(20,2019,'MAY',4,'HTL','AUH\r'),(21,2019,'MAY',10,'MAN','null\r'),(22,2019,'JUN',34,'GEN','AUH\r'),(23,2019,'JUN',5,'MAN','null\r'),(24,2019,'JUL',153,'GEN','AUH\r'),(25,2019,'JUL',51,'HTL','AUH\r'),(26,2019,'JUL',1,'HTL','DXB\r'),(27,2019,'JUL',2,'MAN','null\r'),(28,2019,'AUG',178,'GEN','AUH\r'),(29,2019,'AUG',12,'HTL','AUH\r'),(30,2019,'AUG',7,'MAN','null\r'),(31,2019,'SEP',51,'GEN','AUH\r'),(32,2019,'SEP',17,'HTL','AUH\r'),(33,2019,'SEP',13,'MAN','null\r'),(34,2019,'OCT',1,'GEN','null\r'),(35,2019,'OCT',49,'GEN','AUH\r'),(36,2019,'OCT',6,'HTL','AUH\r'),(37,2019,'OCT',26,'MAN','null\r'),(38,2019,'NOV',29,'GEN','AUH\r'),(39,2019,'NOV',22,'HTL','AUH\r'),(40,2019,'NOV',24,'MAN','null\r'),(41,2019,'DEC',53,'GEN','AUH\r'),(42,2020,'JAN',11,'GEN','null\r'),(43,2020,'JAN',19,'GEN','AUH\r'),(44,2020,'JAN',2,'HTL','AUH\r'),(45,2020,'JAN',2,'MAN','null\r'),(46,2020,'FEB',19,'GEN','AUH\r'),(47,2020,'MAR',2,'GEN','AUH\r'),(48,2020,'MAR',1,'HTL','AUH\r'),(49,2020,'JUN',8,'GEN','null\r'),(50,2020,'JUN',4,'GEN','AUH\r'),(51,2020,'JUN',21,'HTL','AUH\r'),(52,2020,'AUG',1,'HTL','AUH\r'),(53,2020,'SEP',7,'HTL','AUH\r'),(54,2020,'NOV',1,'GEN','null\r'),(55,2020,'NOV',3,'HTL','AUH\r'),(56,2020,'DEC',1,'GEN','null\r'),(57,2021,'FEB',1,'GEN','AUH\r'),(58,2021,'APR',1,'GEN','null\r'),(59,2021,'APR',2,'GEN','AUH\r'),(60,2021,'MAY',2,'GEN','null\r'),(61,2021,'MAY',3,'GEN','AUH\r'),(62,2021,'MAY',1,'HTL','AUH\r'),(63,2021,'JUN',17,'GEN','AUH\r'),(64,2021,'JUN',53,'HTL','AUH\r'),(65,2021,'JUL',4,'GEN','null\r'),(66,2021,'JUL',18,'GEN','AUH\r'),(67,2021,'JUL',29,'HTL','AUH\r'),(68,2021,'AUG',17,'GEN','AUH\r'),(69,2021,'AUG',3,'GEN','null\r'),(70,2021,'AUG',6,'HTL','AUH\r'),(71,2021,'AUG',1,'MAN','null\r'),(72,2021,'SEP',3,'GEN','AUH\r'),(73,2021,'SEP',1,'GEN','null\r'),(74,2021,'SEP',5,'HTL','DXB\r'),(75,2021,'SEP',14,'HTL','AUH\r'),(76,2021,'SEP',7,'MAN','null\r'),(77,2021,'OCT',8,'GEN','null\r'),(78,2021,'OCT',11,'GEN','AUH\r'),(79,2021,'OCT',1,'HTL','AUH\r'),(80,2021,'OCT',18,'MAN','null\r'),(81,2021,'NOV',5,'GEN','AUH\r'),(82,2021,'NOV',2,'GEN','null\r'),(83,2021,'NOV',2,'HTL','AUH\r'),(84,2021,'NOV',24,'MAN','null\r'),(85,2021,'DEC',6,'GEN','null\r'),(86,2021,'DEC',8,'GEN','AUH\r'),(87,2021,'DEC',1,'HTL','AUH\r'),(88,2021,'DEC',1,'MAN','null\r'),(89,2022,'JAN',7,'GEN','null\r'),(90,2022,'JAN',2,'GEN','AUH\r'),(91,2022,'FEB',5,'GEN','AUH\r'),(92,2022,'FEB',4,'GEN','null\r'),(93,2022,'MAR',5,'GEN','null\r'),(94,2022,'MAR',22,'GEN','AUH\r'),(95,2022,'MAR',2,'HTL','AUH\r'),(96,2022,'APR',2,'GEN','null\r'),(97,2022,'APR',31,'GEN','AUH\r'),(98,2022,'APR',1,'HTL','AUH\r'),(99,2022,'APR',1,'MAN','null\r'),(100,2022,'MAY',2,'GEN','null\r'),(101,2022,'MAY',27,'GEN','AUH\r'),(102,2022,'MAY',6,'MAN','null\r'),(103,2022,'JUN',19,'GEN','null\r'),(104,2022,'JUN',26,'GEN','AUH\r'),(105,2022,'JUN',5,'HTL','AUH\r'),(106,2022,'JUN',1,'MAN','null\r'),(107,2022,'JUL',27,'GEN','null\r'),(108,2022,'JUL',52,'GEN','AUH\r'),(109,2022,'JUL',8,'HTL','AUH\r'),(110,2022,'JUL',2,'MAN','null\r'),(111,2022,'AUG',36,'GEN','AUH\r'),(112,2022,'AUG',14,'GEN','null\r'),(113,2022,'AUG',3,'HTL','AUH\r'),(114,2022,'AUG',4,'MAN','null\r'),(115,2022,'SEP',18,'GEN','AUH\r'),(116,2022,'SEP',7,'GEN','null\r'),(117,2022,'SEP',16,'HTL','AUH\r'),(118,2022,'SEP',4,'MAN','null\r'),(119,2022,'OCT',26,'GEN','AUH\r'),(120,2022,'OCT',17,'GEN','null\r'),(121,2022,'OCT',40,'HTL','AUH\r'),(122,2022,'OCT',3,'MAN','null\r'),(123,2022,'NOV',12,'GEN','AUH\r'),(124,2022,'NOV',30,'GEN','null\r'),(125,2022,'NOV',36,'HTL','AUH\r'),(126,2022,'NOV',4,'MAN','null\r'),(127,2022,'DEC',23,'GEN','null\r'),(128,2022,'DEC',11,'GEN','AUH\r'),(129,2022,'DEC',58,'HTL','AUH');
/*!40000 ALTER TABLE `YAS_Component_Booking_Counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `YAS_Package_Bookings_Pre_builds_EP_and_DP`
--

DROP TABLE IF EXISTS `YAS_Package_Bookings_Pre_builds_EP_and_DP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `YAS_Package_Bookings_Pre_builds_EP_and_DP` (
  `RECORD_ID` int NOT NULL AUTO_INCREMENT,
  `YEAR` int DEFAULT NULL,
  `MONTH` varchar(3) DEFAULT NULL,
  `DP_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`RECORD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `YAS_Package_Bookings_Pre_builds_EP_and_DP`
--

LOCK TABLES `YAS_Package_Bookings_Pre_builds_EP_and_DP` WRITE;
/*!40000 ALTER TABLE `YAS_Package_Bookings_Pre_builds_EP_and_DP` DISABLE KEYS */;
INSERT INTO `YAS_Package_Bookings_Pre_builds_EP_and_DP` VALUES (1,2021,'NOV',1535),(2,2022,'MAR',1932),(3,2022,'AUG',5639),(4,2022,'SEP',2772),(5,2022,'MAY',3090),(6,2021,'SEP',722),(7,2022,'OCT',2834),(8,2022,'APR',2323),(9,2022,'DEC',4418),(10,2022,'NOV',2703),(11,2021,'JUL',1898),(12,2021,'OCT',1549),(13,2021,'DEC',1335),(14,2022,'JAN',445),(15,2021,'JUN',876),(16,2022,'JUN',3480),(17,2021,'AUG',1557),(18,2022,'FEB',955),(19,2022,'JUL',5877);
/*!40000 ALTER TABLE `YAS_Package_Bookings_Pre_builds_EP_and_DP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `YAS_TBX_Bookings_Quotes_Count_Reports`
--

DROP TABLE IF EXISTS `YAS_TBX_Bookings_Quotes_Count_Reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `YAS_TBX_Bookings_Quotes_Count_Reports` (
  `RECORD_ID` int NOT NULL AUTO_INCREMENT,
  `YEAR` int DEFAULT NULL,
  `MONTH` varchar(3) DEFAULT NULL,
  `BOOKING_COUNT` int DEFAULT NULL,
  `PAX_COUNT` int DEFAULT NULL,
  `QUOTE_COUNT` int DEFAULT NULL,
  `QUOTE_PAX_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`RECORD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `YAS_TBX_Bookings_Quotes_Count_Reports`
--

LOCK TABLES `YAS_TBX_Bookings_Quotes_Count_Reports` WRITE;
/*!40000 ALTER TABLE `YAS_TBX_Bookings_Quotes_Count_Reports` DISABLE KEYS */;
INSERT INTO `YAS_TBX_Bookings_Quotes_Count_Reports` VALUES (1,2022,'JAN',2,5,0,0),(2,2022,'FEB',2,6,0,0),(3,2022,'JUN',4,30,0,0),(4,2021,'JUN',2,3,1,1),(5,2022,'JUL',3,7,1,4),(6,2022,'AUG',2,10,0,0),(7,2021,'AUG',1,2,0,0),(8,2021,'SEP',6,14,0,0),(9,2021,'OCT',1,5,0,0),(10,2021,'NOV',5,23,0,0),(11,2021,'DEC',7,12,3,6),(12,2022,'DEC',1,4,0,0);
/*!40000 ALTER TABLE `YAS_TBX_Bookings_Quotes_Count_Reports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-03  5:07:58
