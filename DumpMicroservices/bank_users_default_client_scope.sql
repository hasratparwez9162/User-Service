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
-- Table structure for table `default_client_scope`
--

DROP TABLE IF EXISTS `default_client_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_client_scope` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_client_scope`
--

LOCK TABLES `default_client_scope` WRITE;
/*!40000 ALTER TABLE `default_client_scope` DISABLE KEYS */;
INSERT INTO `default_client_scope` VALUES ('9cefdac7-411f-45ea-91cf-00ed934598e8','003e985a-9295-45d4-8902-acb92a086577',0),('9cefdac7-411f-45ea-91cf-00ed934598e8','16b2ba73-92f8-441d-9264-62f8984ebde7',0),('9cefdac7-411f-45ea-91cf-00ed934598e8','28b6ca82-2408-434d-9847-0b68faf0f4f7',1),('9cefdac7-411f-45ea-91cf-00ed934598e8','34a71e8f-e021-42b4-a7ef-0f1f7e58e986',1),('9cefdac7-411f-45ea-91cf-00ed934598e8','499371fa-dc42-43c7-8328-eef033e2c590',1),('9cefdac7-411f-45ea-91cf-00ed934598e8','6ce5c7d3-a5fd-4be7-ad87-e934fa3efbe6',0),('9cefdac7-411f-45ea-91cf-00ed934598e8','747ebce7-4a5b-4d99-9798-77811386f15c',1),('9cefdac7-411f-45ea-91cf-00ed934598e8','84ae5bf3-2db3-41c1-82dc-df0a6eb8d27a',0),('9cefdac7-411f-45ea-91cf-00ed934598e8','b79cd401-1e9e-4af3-99dc-d1f6beed8404',1),('9cefdac7-411f-45ea-91cf-00ed934598e8','bd4069e3-f7b1-4e74-a65a-332875755cab',1),('9cefdac7-411f-45ea-91cf-00ed934598e8','df08b0c1-bc80-4081-be42-46afc00ffa06',1),('c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','0f9e39ce-38ba-417a-96f5-bc7b238cc053',0),('c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','52fff742-80dd-4b74-a543-5ea974c553ef',1),('c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','7ebfc64f-6554-41d4-8f1b-b2a984043e94',1),('c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','960bb5f1-7943-45fc-86e9-3cf1db4aeb63',1),('c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','9a34c0af-6138-4842-bd40-37f6ecdde98d',1),('c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','ae14c0a6-0988-4a5e-a80d-7b52ae4c60e4',1),('c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','afcd840c-af83-4e06-8ac5-8cdc7e28a2bd',0),('c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','c387f9b1-95b0-4f68-b4e3-343cbc7fa16d',0),('c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','c616cd4a-45e0-448c-a3e7-79345e86d871',0),('c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','d339c002-b99c-4579-808f-310c7e350514',1),('c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','e5fa7166-80db-4dca-8d67-11d423f379b7',1),('dff2298c-a195-4f4c-85ff-5f73d42fe5e4','2523a0ce-1c6d-4f3f-b794-59e047c19503',1),('dff2298c-a195-4f4c-85ff-5f73d42fe5e4','3de63102-fb43-49d5-afd3-59a1b72ed970',0),('dff2298c-a195-4f4c-85ff-5f73d42fe5e4','40f18fdd-92b5-4f42-bc47-6e1bdbaa3abd',0),('dff2298c-a195-4f4c-85ff-5f73d42fe5e4','6c48f893-4b5d-45f7-ade2-c0621faaf7e4',1),('dff2298c-a195-4f4c-85ff-5f73d42fe5e4','892b8d27-6480-4292-9ec9-0a8b6c9b8e62',1),('dff2298c-a195-4f4c-85ff-5f73d42fe5e4','a0b21b37-48ea-490e-8cfc-3a945790181d',0),('dff2298c-a195-4f4c-85ff-5f73d42fe5e4','bc5be4ce-8f88-4fa9-8aa0-73a0aef3d388',1),('dff2298c-a195-4f4c-85ff-5f73d42fe5e4','c17723d9-ae18-4c16-b7c1-3f19f8d53fa1',1),('dff2298c-a195-4f4c-85ff-5f73d42fe5e4','c3d98842-8d6d-4ce6-91f5-a2532a7e69f4',1),('dff2298c-a195-4f4c-85ff-5f73d42fe5e4','df43c24c-e7ac-4aff-a8e8-b8cc18452b7e',0),('dff2298c-a195-4f4c-85ff-5f73d42fe5e4','eefe11b7-20d9-46a0-af9f-6b7fbf8f2554',1);
/*!40000 ALTER TABLE `default_client_scope` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 12:44:05
