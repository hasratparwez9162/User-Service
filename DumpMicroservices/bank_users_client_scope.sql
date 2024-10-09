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
-- Table structure for table `client_scope`
--

DROP TABLE IF EXISTS `client_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_scope` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_scope`
--

LOCK TABLES `client_scope` WRITE;
/*!40000 ALTER TABLE `client_scope` DISABLE KEYS */;
INSERT INTO `client_scope` VALUES ('003e985a-9295-45d4-8902-acb92a086577','address','9cefdac7-411f-45ea-91cf-00ed934598e8','OpenID Connect built-in scope: address','openid-connect'),('0f9e39ce-38ba-417a-96f5-bc7b238cc053','offline_access','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','OpenID Connect built-in scope: offline_access','openid-connect'),('16b2ba73-92f8-441d-9264-62f8984ebde7','phone','9cefdac7-411f-45ea-91cf-00ed934598e8','OpenID Connect built-in scope: phone','openid-connect'),('2523a0ce-1c6d-4f3f-b794-59e047c19503','email','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','OpenID Connect built-in scope: email','openid-connect'),('28b6ca82-2408-434d-9847-0b68faf0f4f7','acr','9cefdac7-411f-45ea-91cf-00ed934598e8','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('34a71e8f-e021-42b4-a7ef-0f1f7e58e986','email','9cefdac7-411f-45ea-91cf-00ed934598e8','OpenID Connect built-in scope: email','openid-connect'),('3de63102-fb43-49d5-afd3-59a1b72ed970','address','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','OpenID Connect built-in scope: address','openid-connect'),('40f18fdd-92b5-4f42-bc47-6e1bdbaa3abd','microprofile-jwt','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','Microprofile - JWT built-in scope','openid-connect'),('499371fa-dc42-43c7-8328-eef033e2c590','web-origins','9cefdac7-411f-45ea-91cf-00ed934598e8','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('52fff742-80dd-4b74-a543-5ea974c553ef','roles','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','OpenID Connect scope for add user roles to the access token','openid-connect'),('6c48f893-4b5d-45f7-ade2-c0621faaf7e4','web-origins','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('6ce5c7d3-a5fd-4be7-ad87-e934fa3efbe6','offline_access','9cefdac7-411f-45ea-91cf-00ed934598e8','OpenID Connect built-in scope: offline_access','openid-connect'),('747ebce7-4a5b-4d99-9798-77811386f15c','profile','9cefdac7-411f-45ea-91cf-00ed934598e8','OpenID Connect built-in scope: profile','openid-connect'),('7ebfc64f-6554-41d4-8f1b-b2a984043e94','profile','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','OpenID Connect built-in scope: profile','openid-connect'),('84ae5bf3-2db3-41c1-82dc-df0a6eb8d27a','microprofile-jwt','9cefdac7-411f-45ea-91cf-00ed934598e8','Microprofile - JWT built-in scope','openid-connect'),('892b8d27-6480-4292-9ec9-0a8b6c9b8e62','acr','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('960bb5f1-7943-45fc-86e9-3cf1db4aeb63','basic','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','OpenID Connect scope for add all basic claims to the token','openid-connect'),('9a34c0af-6138-4842-bd40-37f6ecdde98d','role_list','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','SAML role list','saml'),('a0b21b37-48ea-490e-8cfc-3a945790181d','phone','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','OpenID Connect built-in scope: phone','openid-connect'),('ae14c0a6-0988-4a5e-a80d-7b52ae4c60e4','email','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','OpenID Connect built-in scope: email','openid-connect'),('afcd840c-af83-4e06-8ac5-8cdc7e28a2bd','address','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','OpenID Connect built-in scope: address','openid-connect'),('b79cd401-1e9e-4af3-99dc-d1f6beed8404','roles','9cefdac7-411f-45ea-91cf-00ed934598e8','OpenID Connect scope for add user roles to the access token','openid-connect'),('bc5be4ce-8f88-4fa9-8aa0-73a0aef3d388','roles','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','OpenID Connect scope for add user roles to the access token','openid-connect'),('bd4069e3-f7b1-4e74-a65a-332875755cab','role_list','9cefdac7-411f-45ea-91cf-00ed934598e8','SAML role list','saml'),('c17723d9-ae18-4c16-b7c1-3f19f8d53fa1','basic','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','OpenID Connect scope for add all basic claims to the token','openid-connect'),('c387f9b1-95b0-4f68-b4e3-343cbc7fa16d','microprofile-jwt','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','Microprofile - JWT built-in scope','openid-connect'),('c3d98842-8d6d-4ce6-91f5-a2532a7e69f4','profile','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','OpenID Connect built-in scope: profile','openid-connect'),('c616cd4a-45e0-448c-a3e7-79345e86d871','phone','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','OpenID Connect built-in scope: phone','openid-connect'),('d339c002-b99c-4579-808f-310c7e350514','web-origins','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('df08b0c1-bc80-4081-be42-46afc00ffa06','basic','9cefdac7-411f-45ea-91cf-00ed934598e8','OpenID Connect scope for add all basic claims to the token','openid-connect'),('df43c24c-e7ac-4aff-a8e8-b8cc18452b7e','offline_access','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','OpenID Connect built-in scope: offline_access','openid-connect'),('e5fa7166-80db-4dca-8d67-11d423f379b7','acr','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('eefe11b7-20d9-46a0-af9f-6b7fbf8f2554','role_list','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','SAML role list','saml');
/*!40000 ALTER TABLE `client_scope` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 12:43:55
