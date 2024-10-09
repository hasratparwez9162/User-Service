-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_users
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
-- Table structure for table `user_entity`
--

DROP TABLE IF EXISTS `user_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_entity` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` tinyint NOT NULL DEFAULT '0',
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_entity`
--

LOCK TABLES `user_entity` WRITE;
/*!40000 ALTER TABLE `user_entity` DISABLE KEYS */;
INSERT INTO `user_entity` VALUES ('09348c5a-0c31-4712-af41-5c0fba6a5139',NULL,'3e65ac44-2dba-4c80-84ff-a71c8d84af16',0,1,NULL,NULL,NULL,'dff2298c-a195-4f4c-85ff-5f73d42fe5e4','service-account-banking-auth',1725859982016,'797ad2bf-c832-4426-93e0-71d86d241818',0),('0dd25054-6c48-4c7f-b69c-ddd15061ffc6','arun@gmail.com','arun@gmail.com',0,1,NULL,'Arun','Kumar','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','arun123',1727983475451,NULL,0),('284165a1-1cb2-49cd-86a7-13d9d3cadccd','harisvar@gmail.com','harisvar@gmail.com',0,1,NULL,'Harishvar','Kumar','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','harishvarkumar',1727263188633,NULL,0),('48b48894-a3aa-48a3-b224-6e11aa52263a','hasrat@gmail.com','hasrat@gmail.com',0,1,NULL,'Hasrat','Parwez','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','hasrat',1725829237325,NULL,0),('58d592d9-650b-4e7f-af46-089a439b5e49','rahul1@gmail.com','rahul1@gmail.com',0,1,NULL,'Rahul','Kumar','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','rahul12345',1728032747780,NULL,0),('80fbb973-3139-457a-9a9f-15dd76e421be','hasratparwezies@gmail.com','hasratparwezies@gmail.com',1,1,NULL,'Hasrat','Parwez','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','hasratparwez',1728288219694,NULL,0),('824eb0a2-7f8d-45da-8393-d2beef74a29f','parwez@example.com','parwez@example.com',0,1,NULL,'Parwez','Alam','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','parwezalam',1727204929549,NULL,0),('9c040a89-ff4b-4643-a08e-95a01eb8dff5','bhanu@gmail.com','bhanu@gmail.com',0,1,NULL,'Bhanu','Kumar','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','bhanu12',1727278676271,NULL,0),('da751716-317b-4dab-8cdb-7cec53a20420','yogi@gmail.com','yogi@gmail.com',0,1,NULL,'Yogi','Seth','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','yogi123',1727276289779,NULL,0),('e762744d-76b7-494d-9535-f5b4441a9091','hasratparwezies@gmail.com','hasratparwezies@gmail.com',0,1,NULL,'Hasrat','Parwez','9cefdac7-411f-45ea-91cf-00ed934598e8','admin',1725828279648,NULL,0),('eaafc56d-63f2-4307-aed8-c3249a0fae69','praneeth@gmail.com','praneeth@gmail.com',0,1,NULL,'Praneeth','Kumar','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','praneeth1',1727370619402,NULL,0),('eb7fee9b-0165-49e8-92eb-df9472457a47','krishan@gmail.com','krishan@gmail.com',0,1,NULL,'Krishan','Kumar','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','krishan123',1727768938601,NULL,0);
/*!40000 ALTER TABLE `user_entity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 12:44:01
