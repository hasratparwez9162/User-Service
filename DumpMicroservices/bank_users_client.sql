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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FULL_SCOPE_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` tinyint NOT NULL DEFAULT '0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` tinyint NOT NULL DEFAULT '0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` tinyint NOT NULL DEFAULT '0',
  `CONSENT_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` tinyint NOT NULL DEFAULT '1',
  `IMPLICIT_FLOW_ENABLED` tinyint NOT NULL DEFAULT '0',
  `DIRECT_ACCESS_GRANTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `ALWAYS_DISPLAY_IN_CONSOLE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('04d96dab-b902-427b-977f-e361f26c9136',1,0,'account',0,1,NULL,'/realms/master/account/',0,NULL,0,'9cefdac7-411f-45ea-91cf-00ed934598e8','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('144230bf-5d4b-4de2-bb6a-4701888acd6b',1,0,'security-admin-console',0,1,NULL,'/admin/aditi/console/',0,NULL,0,'c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('222b6ca0-8ca5-4a55-a559-b271a3bd3dab',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'dff2298c-a195-4f4c-85ff-5f73d42fe5e4','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('2a73f9b7-8dd9-4331-aa49-050782ba0965',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'9cefdac7-411f-45ea-91cf-00ed934598e8','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('317d6a7f-e258-43a4-ba60-19b01572ddfd',1,0,'account-console',0,1,NULL,'/realms/banking-auth/account/',0,NULL,0,'dff2298c-a195-4f4c-85ff-5f73d42fe5e4','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('3c38bccf-7a46-497a-83c2-6f49cfa05f4c',1,0,'account',0,1,NULL,'/realms/aditi/account/',0,NULL,0,'c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('4728b764-5762-4b6c-9a1a-ae910a1a7de4',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('4993d73e-15e7-4246-9aee-2020bcde9d95',1,0,'account-console',0,1,NULL,'/realms/master/account/',0,NULL,0,'9cefdac7-411f-45ea-91cf-00ed934598e8','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('4aedcf2c-9794-439f-8c3b-d245cd8b8bce',1,0,'account',0,1,NULL,'/realms/banking-auth/account/',0,NULL,0,'dff2298c-a195-4f4c-85ff-5f73d42fe5e4','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('5de04b88-76b5-4b29-a091-889458c4aa30',1,0,'banking-auth-realm',0,0,NULL,NULL,1,NULL,0,'9cefdac7-411f-45ea-91cf-00ed934598e8',NULL,0,0,0,'banking-auth Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('6d17ab90-758e-4891-818b-4d91943f0094',1,0,'security-admin-console',0,1,NULL,'/admin/master/console/',0,NULL,0,'9cefdac7-411f-45ea-91cf-00ed934598e8','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('74a170ea-e9cd-4836-b20c-b35e322f11be',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'9cefdac7-411f-45ea-91cf-00ed934598e8','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('797ad2bf-c832-4426-93e0-71d86d241818',1,1,'banking-auth',0,0,'WhCSpLhP7W9uS9XnabfAM4cMrlm728F1','http://127.0.0.1:8080',0,'http://127.0.0.1:8080',0,'dff2298c-a195-4f4c-85ff-5f73d42fe5e4','openid-connect',-1,1,0,'banking-auth',1,'client-secret','http://127.0.0.1:8080','banking-auth',NULL,0,0,0,0),('8952d9e6-6bdd-42f0-8f19-eae7e636b07a',1,0,'security-admin-console',0,1,NULL,'/admin/banking-auth/console/',0,NULL,0,'dff2298c-a195-4f4c-85ff-5f73d42fe5e4','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('9a3e8570-adc8-40b9-aee8-c1835520c984',1,0,'master-realm',0,0,NULL,NULL,1,NULL,0,'9cefdac7-411f-45ea-91cf-00ed934598e8',NULL,0,0,0,'master Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('a11ab8c8-1b17-45b8-9539-bb99d58c550a',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'dff2298c-a195-4f4c-85ff-5f73d42fe5e4','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('b87e659b-77db-453f-b6ce-096a26c53ace',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','openid-connect',0,0,0,'${client_realm-management}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('caa00f83-9746-4f0f-85f4-24da4cc45bab',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'dff2298c-a195-4f4c-85ff-5f73d42fe5e4','openid-connect',0,0,0,'${client_realm-management}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b',1,1,'aditi-bank',0,0,'CzaYhuk31GPdOkmyPtWxj4JSXP64K1l5','',0,'',0,'c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','openid-connect',-1,1,0,'Banking Application',0,'client-secret','','',NULL,1,0,1,0),('dc7eb033-f3d5-499b-8f93-25bd7814e918',1,0,'aditi-realm',0,0,NULL,NULL,1,NULL,0,'9cefdac7-411f-45ea-91cf-00ed934598e8',NULL,0,0,0,'aditi Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('e8437b5a-5d88-42fe-8e45-fd0c11d578a2',1,0,'account-console',0,1,NULL,'/realms/aditi/account/',0,NULL,0,'c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('e8d6f27c-16d2-4c8c-b67e-26644cac8b25',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 12:43:56
