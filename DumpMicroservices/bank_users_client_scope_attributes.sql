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
-- Table structure for table `client_scope_attributes`
--

DROP TABLE IF EXISTS `client_scope_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_scope_attributes` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_scope_attributes`
--

LOCK TABLES `client_scope_attributes` WRITE;
/*!40000 ALTER TABLE `client_scope_attributes` DISABLE KEYS */;
INSERT INTO `client_scope_attributes` VALUES ('003e985a-9295-45d4-8902-acb92a086577','${addressScopeConsentText}','consent.screen.text'),('003e985a-9295-45d4-8902-acb92a086577','true','display.on.consent.screen'),('003e985a-9295-45d4-8902-acb92a086577','true','include.in.token.scope'),('0f9e39ce-38ba-417a-96f5-bc7b238cc053','${offlineAccessScopeConsentText}','consent.screen.text'),('0f9e39ce-38ba-417a-96f5-bc7b238cc053','true','display.on.consent.screen'),('16b2ba73-92f8-441d-9264-62f8984ebde7','${phoneScopeConsentText}','consent.screen.text'),('16b2ba73-92f8-441d-9264-62f8984ebde7','true','display.on.consent.screen'),('16b2ba73-92f8-441d-9264-62f8984ebde7','true','include.in.token.scope'),('2523a0ce-1c6d-4f3f-b794-59e047c19503','${emailScopeConsentText}','consent.screen.text'),('2523a0ce-1c6d-4f3f-b794-59e047c19503','true','display.on.consent.screen'),('2523a0ce-1c6d-4f3f-b794-59e047c19503','true','include.in.token.scope'),('28b6ca82-2408-434d-9847-0b68faf0f4f7','false','display.on.consent.screen'),('28b6ca82-2408-434d-9847-0b68faf0f4f7','false','include.in.token.scope'),('34a71e8f-e021-42b4-a7ef-0f1f7e58e986','${emailScopeConsentText}','consent.screen.text'),('34a71e8f-e021-42b4-a7ef-0f1f7e58e986','true','display.on.consent.screen'),('34a71e8f-e021-42b4-a7ef-0f1f7e58e986','true','include.in.token.scope'),('3de63102-fb43-49d5-afd3-59a1b72ed970','${addressScopeConsentText}','consent.screen.text'),('3de63102-fb43-49d5-afd3-59a1b72ed970','true','display.on.consent.screen'),('3de63102-fb43-49d5-afd3-59a1b72ed970','true','include.in.token.scope'),('40f18fdd-92b5-4f42-bc47-6e1bdbaa3abd','false','display.on.consent.screen'),('40f18fdd-92b5-4f42-bc47-6e1bdbaa3abd','true','include.in.token.scope'),('499371fa-dc42-43c7-8328-eef033e2c590','','consent.screen.text'),('499371fa-dc42-43c7-8328-eef033e2c590','false','display.on.consent.screen'),('499371fa-dc42-43c7-8328-eef033e2c590','false','include.in.token.scope'),('52fff742-80dd-4b74-a543-5ea974c553ef','${rolesScopeConsentText}','consent.screen.text'),('52fff742-80dd-4b74-a543-5ea974c553ef','true','display.on.consent.screen'),('52fff742-80dd-4b74-a543-5ea974c553ef','false','include.in.token.scope'),('6c48f893-4b5d-45f7-ade2-c0621faaf7e4','','consent.screen.text'),('6c48f893-4b5d-45f7-ade2-c0621faaf7e4','false','display.on.consent.screen'),('6c48f893-4b5d-45f7-ade2-c0621faaf7e4','false','include.in.token.scope'),('6ce5c7d3-a5fd-4be7-ad87-e934fa3efbe6','${offlineAccessScopeConsentText}','consent.screen.text'),('6ce5c7d3-a5fd-4be7-ad87-e934fa3efbe6','true','display.on.consent.screen'),('747ebce7-4a5b-4d99-9798-77811386f15c','${profileScopeConsentText}','consent.screen.text'),('747ebce7-4a5b-4d99-9798-77811386f15c','true','display.on.consent.screen'),('747ebce7-4a5b-4d99-9798-77811386f15c','true','include.in.token.scope'),('7ebfc64f-6554-41d4-8f1b-b2a984043e94','${profileScopeConsentText}','consent.screen.text'),('7ebfc64f-6554-41d4-8f1b-b2a984043e94','true','display.on.consent.screen'),('7ebfc64f-6554-41d4-8f1b-b2a984043e94','true','include.in.token.scope'),('84ae5bf3-2db3-41c1-82dc-df0a6eb8d27a','false','display.on.consent.screen'),('84ae5bf3-2db3-41c1-82dc-df0a6eb8d27a','true','include.in.token.scope'),('892b8d27-6480-4292-9ec9-0a8b6c9b8e62','false','display.on.consent.screen'),('892b8d27-6480-4292-9ec9-0a8b6c9b8e62','false','include.in.token.scope'),('960bb5f1-7943-45fc-86e9-3cf1db4aeb63','false','display.on.consent.screen'),('960bb5f1-7943-45fc-86e9-3cf1db4aeb63','false','include.in.token.scope'),('9a34c0af-6138-4842-bd40-37f6ecdde98d','${samlRoleListScopeConsentText}','consent.screen.text'),('9a34c0af-6138-4842-bd40-37f6ecdde98d','true','display.on.consent.screen'),('a0b21b37-48ea-490e-8cfc-3a945790181d','${phoneScopeConsentText}','consent.screen.text'),('a0b21b37-48ea-490e-8cfc-3a945790181d','true','display.on.consent.screen'),('a0b21b37-48ea-490e-8cfc-3a945790181d','true','include.in.token.scope'),('ae14c0a6-0988-4a5e-a80d-7b52ae4c60e4','${emailScopeConsentText}','consent.screen.text'),('ae14c0a6-0988-4a5e-a80d-7b52ae4c60e4','true','display.on.consent.screen'),('ae14c0a6-0988-4a5e-a80d-7b52ae4c60e4','true','include.in.token.scope'),('afcd840c-af83-4e06-8ac5-8cdc7e28a2bd','${addressScopeConsentText}','consent.screen.text'),('afcd840c-af83-4e06-8ac5-8cdc7e28a2bd','true','display.on.consent.screen'),('afcd840c-af83-4e06-8ac5-8cdc7e28a2bd','true','include.in.token.scope'),('b79cd401-1e9e-4af3-99dc-d1f6beed8404','${rolesScopeConsentText}','consent.screen.text'),('b79cd401-1e9e-4af3-99dc-d1f6beed8404','true','display.on.consent.screen'),('b79cd401-1e9e-4af3-99dc-d1f6beed8404','false','include.in.token.scope'),('bc5be4ce-8f88-4fa9-8aa0-73a0aef3d388','${rolesScopeConsentText}','consent.screen.text'),('bc5be4ce-8f88-4fa9-8aa0-73a0aef3d388','true','display.on.consent.screen'),('bc5be4ce-8f88-4fa9-8aa0-73a0aef3d388','false','include.in.token.scope'),('bd4069e3-f7b1-4e74-a65a-332875755cab','${samlRoleListScopeConsentText}','consent.screen.text'),('bd4069e3-f7b1-4e74-a65a-332875755cab','true','display.on.consent.screen'),('c17723d9-ae18-4c16-b7c1-3f19f8d53fa1','false','display.on.consent.screen'),('c17723d9-ae18-4c16-b7c1-3f19f8d53fa1','false','include.in.token.scope'),('c387f9b1-95b0-4f68-b4e3-343cbc7fa16d','false','display.on.consent.screen'),('c387f9b1-95b0-4f68-b4e3-343cbc7fa16d','true','include.in.token.scope'),('c3d98842-8d6d-4ce6-91f5-a2532a7e69f4','${profileScopeConsentText}','consent.screen.text'),('c3d98842-8d6d-4ce6-91f5-a2532a7e69f4','true','display.on.consent.screen'),('c3d98842-8d6d-4ce6-91f5-a2532a7e69f4','true','include.in.token.scope'),('c616cd4a-45e0-448c-a3e7-79345e86d871','${phoneScopeConsentText}','consent.screen.text'),('c616cd4a-45e0-448c-a3e7-79345e86d871','true','display.on.consent.screen'),('c616cd4a-45e0-448c-a3e7-79345e86d871','true','include.in.token.scope'),('d339c002-b99c-4579-808f-310c7e350514','','consent.screen.text'),('d339c002-b99c-4579-808f-310c7e350514','false','display.on.consent.screen'),('d339c002-b99c-4579-808f-310c7e350514','false','include.in.token.scope'),('df08b0c1-bc80-4081-be42-46afc00ffa06','false','display.on.consent.screen'),('df08b0c1-bc80-4081-be42-46afc00ffa06','false','include.in.token.scope'),('df43c24c-e7ac-4aff-a8e8-b8cc18452b7e','${offlineAccessScopeConsentText}','consent.screen.text'),('df43c24c-e7ac-4aff-a8e8-b8cc18452b7e','true','display.on.consent.screen'),('e5fa7166-80db-4dca-8d67-11d423f379b7','false','display.on.consent.screen'),('e5fa7166-80db-4dca-8d67-11d423f379b7','false','include.in.token.scope'),('eefe11b7-20d9-46a0-af9f-6b7fbf8f2554','${samlRoleListScopeConsentText}','consent.screen.text'),('eefe11b7-20d9-46a0-af9f-6b7fbf8f2554','true','display.on.consent.screen');
/*!40000 ALTER TABLE `client_scope_attributes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 12:43:50
