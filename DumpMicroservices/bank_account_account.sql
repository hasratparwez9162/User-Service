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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) NOT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `balance` decimal(38,2) NOT NULL,
  `date_opened` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_66gkcp94endmotfwb8r4ocxm9` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'2024351612','SAVING',0.00,'2024-09-17','mritunjai@gmail.com','7894444474',5,'Mritunjai Kumar'),(2,'2024218495','SAVING',0.00,'2024-09-17','harisvar@gmail.com','9756258535',1,'Harishvar Kumar'),(3,'2024525416',NULL,0.00,'2024-09-25','Chirag@gmail.com','7846546784',2,'Chirag  B'),(4,'2024131614',NULL,0.00,'2024-09-25','jfsg@gmail.com','546787878',4,'adafa akhfjf'),(5,'2024887306',NULL,0.00,'2024-09-25','eink@gmail.com','9893784675',5,'Welcome to'),(6,'2024225902',NULL,0.00,'2024-09-25','regr@gmail.com','7876576676',6,'rgre rg'),(7,'2024148105',NULL,0.00,'2024-09-25','yogi@gmail.com','9988776655',7,'yogi seth'),(8,'2024521598',NULL,0.00,'2024-09-25','Rahul@gmail.com','9678901234',8,'Rahul Kumar'),(9,'2024685165',NULL,0.00,'2024-09-25','aditya@gmail.com','4564687764',9,'Aditya Kumar'),(10,'2024509922',NULL,20000120.00,'2024-09-25','bhanu@gmail.com','7841687865',10,'Bhanu Kumar'),(11,'2024630712','SAVING',99070.00,'2024-09-26','praneeth@gmail.com','7896541230',11,'Praneeth Kumar'),(12,'2024404295','SAVING',1000.00,'2024-10-01','krishan@gmail.com','7895642132',12,'Krishan Kumar'),(13,'2024182074','SAVING',1000.00,'2024-10-04','arun@gmail.com','7896541231',13,'Arun Kumar'),(14,'2024624779','SAVING',2980.00,'2024-10-04','rahul1@gmail.com','89465668764',16,'Rahul Kumar');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
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
