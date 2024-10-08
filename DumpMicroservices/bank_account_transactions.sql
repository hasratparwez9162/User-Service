-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_account
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) DEFAULT NULL,
  `amount` decimal(38,2) DEFAULT NULL,
  `balance_after_transaction` decimal(38,2) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'2024630712',120.00,100220.00,'2024-09-27 00:21:30.042906','CREDIT'),(2,'2024630712',20.00,100240.00,'2024-09-27 00:21:43.817872','CREDIT'),(3,'2024630712',20.00,100260.00,'2024-09-27 00:33:50.178243','CREDIT'),(4,'2024630712',40.00,100220.00,'2024-09-27 00:36:59.224150','WITHDRAW'),(5,'2024630712',20.00,100240.00,'2024-09-27 01:06:08.825303','CREDIT'),(6,'2024630712',20.00,100260.00,'2024-09-27 01:06:55.104732','CREDIT'),(7,'2024630712',40.00,100220.00,'2024-09-27 01:29:41.614719','WITHDRAW'),(8,'2024630712',99.00,100121.00,'2024-09-27 01:30:16.913670','WITHDRAW'),(9,'2024630712',120.00,100001.00,'2024-10-01 10:47:05.590662','WITHDRAW'),(10,'2024630712',20.00,100021.00,'2024-10-01 10:48:55.344935','CREDIT'),(11,'2024630712',1.00,100020.00,'2024-10-01 10:49:33.851357','WITHDRAW'),(12,'2024630712',1.00,100019.00,'2024-10-01 10:57:04.652581','WITHDRAW'),(13,'2024630712',20.00,100039.00,'2024-10-01 12:34:32.129974','CREDIT'),(14,'2024630712',20.00,100059.00,'2024-10-01 12:35:52.820973','CREDIT'),(15,'2024630712',20.00,100079.00,'2024-10-01 16:11:16.791288','CREDIT'),(16,'2024630712',1000.00,99079.00,'2024-10-01 18:21:49.125958','WITHDRAW'),(17,'2024630712',1000.00,100079.00,'2024-10-03 09:30:11.345411','CREDIT'),(18,'2024182074',1000.00,1000.00,'2024-10-04 01:00:16.862839','CREDIT'),(19,'2024624779',1000.00,1000.00,'2024-10-04 14:36:46.755859','CREDIT'),(20,'2024624779',20.00,980.00,'2024-10-04 14:37:33.013091','WITHDRAW'),(21,'2024624779',1000.00,1980.00,'2024-10-08 16:15:03.024983','CREDIT'),(22,'2024624779',1000.00,2980.00,'2024-10-08 16:16:35.704407','CREDIT'),(23,'2024630712',79.00,100000.00,'2024-10-08 16:21:33.112837','WITHDRAW'),(24,'2024630712',10.00,99990.00,'2024-10-08 16:23:51.082041','WITHDRAW'),(25,'2024630712',10.00,99980.00,'2024-10-08 16:30:40.031701','WITHDRAW'),(26,'2024630712',10.00,99970.00,'2024-10-08 16:33:08.593787','WITHDRAW'),(27,'2024404295',10.00,10.00,'2024-10-08 17:18:57.711082','CREDIT'),(28,'2024630712',10.00,99960.00,'2024-10-08 17:18:57.711082','WITHDRAW'),(29,'2024630712',100.00,100060.00,'2024-10-08 17:30:34.778089','CREDIT'),(30,'2024630712',500.00,99560.00,'2024-10-08 19:37:36.681386','WITHDRAW'),(31,'2024404295',500.00,510.00,'2024-10-08 19:37:36.713320','CREDIT'),(32,'2024630712',500.00,99060.00,'2024-10-08 19:39:40.686660','WITHDRAW'),(33,'2024404295',500.00,1010.00,'2024-10-08 19:39:40.688595','CREDIT'),(34,'2024404295',500.00,510.00,'2024-10-08 19:41:24.418837','WITHDRAW'),(35,'2024630712',500.00,99560.00,'2024-10-08 19:41:24.423435','CREDIT'),(36,'2024404295',10.00,500.00,'2024-10-08 19:45:00.330170','WITHDRAW'),(37,'2024630712',10.00,99570.00,'2024-10-08 19:45:00.334316','CREDIT'),(38,'2024630712',500.00,99070.00,'2024-10-09 12:31:08.632243','WITHDRAW'),(39,'2024404295',500.00,1000.00,'2024-10-09 12:31:08.737332','CREDIT');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 12:44:10
