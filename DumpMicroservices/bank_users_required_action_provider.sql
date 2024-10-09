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
-- Table structure for table `required_action_provider`
--

DROP TABLE IF EXISTS `required_action_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `required_action_provider` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `DEFAULT_ACTION` tinyint NOT NULL DEFAULT '0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `required_action_provider`
--

LOCK TABLES `required_action_provider` WRITE;
/*!40000 ALTER TABLE `required_action_provider` DISABLE KEYS */;
INSERT INTO `required_action_provider` VALUES ('002b6c84-93a3-45d7-aa9f-3c52a7886ca4','CONFIGURE_TOTP','Configure OTP','9cefdac7-411f-45ea-91cf-00ed934598e8',1,0,'CONFIGURE_TOTP',10),('00af47ea-2e0a-4017-8a9c-74d335718ddc','delete_credential','Delete Credential','9cefdac7-411f-45ea-91cf-00ed934598e8',1,0,'delete_credential',100),('035b3d1c-7bf1-4d8c-8763-5ca2cfc466cf','webauthn-register-passwordless','Webauthn Register Passwordless','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',1,0,'webauthn-register-passwordless',80),('064311c7-4bfc-45b7-b0ea-f8d1ce936856','CONFIGURE_TOTP','Configure OTP','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',1,0,'CONFIGURE_TOTP',10),('135c711a-544b-4059-943d-b0617f7d62a2','UPDATE_PROFILE','Update Profile','9cefdac7-411f-45ea-91cf-00ed934598e8',1,0,'UPDATE_PROFILE',40),('2b6d8224-6fec-43cc-8508-ef7832bff3ee','webauthn-register','Webauthn Register','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',1,0,'webauthn-register',70),('2c6d5b75-32a5-4692-930d-ca39ca28cfed','VERIFY_EMAIL','Verify Email','9cefdac7-411f-45ea-91cf-00ed934598e8',1,0,'VERIFY_EMAIL',50),('33406f0b-4cd5-4b45-a2e3-d7ae94f0e214','webauthn-register','Webauthn Register','9cefdac7-411f-45ea-91cf-00ed934598e8',1,0,'webauthn-register',70),('52335797-c1d4-48e6-96d2-a40be5e7af6d','webauthn-register-passwordless','Webauthn Register Passwordless','9cefdac7-411f-45ea-91cf-00ed934598e8',1,0,'webauthn-register-passwordless',80),('606993b9-414a-4401-8ef0-acd0c16a5562','VERIFY_EMAIL','Verify Email','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',1,0,'VERIFY_EMAIL',50),('64ab0cc7-08b4-4f0d-9cd5-7548c07500aa','webauthn-register-passwordless','Webauthn Register Passwordless','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',1,0,'webauthn-register-passwordless',80),('77f42789-5db6-426e-b5e5-d5b272612ada','update_user_locale','Update User Locale','9cefdac7-411f-45ea-91cf-00ed934598e8',1,0,'update_user_locale',1000),('7854f621-f8cd-45b2-bed3-15263e210efd','VERIFY_EMAIL','Verify Email','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',1,0,'VERIFY_EMAIL',50),('78e62363-6d28-46f1-81b3-960d86f1d709','UPDATE_PROFILE','Update Profile','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',1,0,'UPDATE_PROFILE',40),('7aa73197-4721-4038-9d3a-219b0115b2b2','UPDATE_PASSWORD','Update Password','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',1,0,'UPDATE_PASSWORD',30),('7b3237d9-5867-4b79-8fd1-683049316c15','update_user_locale','Update User Locale','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',1,0,'update_user_locale',1000),('92fdff2f-d5c9-43e5-bc88-58c3c5e34f51','delete_account','Delete Account','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',0,0,'delete_account',60),('9695942a-2928-4f3b-a088-a768fa7327f0','delete_account','Delete Account','9cefdac7-411f-45ea-91cf-00ed934598e8',0,0,'delete_account',60),('99586b8b-1c87-4ec5-a529-d27b89212955','webauthn-register','Webauthn Register','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',1,0,'webauthn-register',70),('9baceb5f-ac71-487b-a7a0-8e7657be43af','UPDATE_PASSWORD','Update Password','9cefdac7-411f-45ea-91cf-00ed934598e8',1,0,'UPDATE_PASSWORD',30),('a16ffd62-9a7a-491b-8401-6a6e77c19759','UPDATE_PROFILE','Update Profile','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',1,0,'UPDATE_PROFILE',40),('a2cd2832-3470-4494-9d9c-a84a6e1a055c','CONFIGURE_TOTP','Configure OTP','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',1,0,'CONFIGURE_TOTP',10),('afb81c09-552a-493e-aa8d-657ef18054f0','delete_credential','Delete Credential','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',1,0,'delete_credential',100),('b085329f-9733-429e-a0ee-a4d3659e6f5e','delete_account','Delete Account','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',0,0,'delete_account',60),('c1c29c83-7cc5-46fd-8c97-614f328f0632','TERMS_AND_CONDITIONS','Terms and Conditions','9cefdac7-411f-45ea-91cf-00ed934598e8',0,0,'TERMS_AND_CONDITIONS',20),('d72e897a-b6ee-4d0a-a78d-fd0eb1fdfc36','update_user_locale','Update User Locale','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',1,0,'update_user_locale',1000),('d85de80b-fc34-4cc8-a288-828e9b6162eb','delete_credential','Delete Credential','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',1,0,'delete_credential',100),('d9481fe4-96a9-459e-a787-e39648801718','UPDATE_PASSWORD','Update Password','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',1,0,'UPDATE_PASSWORD',30),('e50db307-1951-48dd-ac9f-ab50d59bc6c6','VERIFY_PROFILE','Verify Profile','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',1,0,'VERIFY_PROFILE',90),('e5e9981a-1f1c-4123-bbfd-0703f23861df','VERIFY_PROFILE','Verify Profile','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',1,0,'VERIFY_PROFILE',90),('eb430e76-6b56-4d0d-9399-b4f335f45305','TERMS_AND_CONDITIONS','Terms and Conditions','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',0,0,'TERMS_AND_CONDITIONS',20),('f8021b97-e0b2-4803-a782-c7ec8f9afd46','TERMS_AND_CONDITIONS','Terms and Conditions','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',0,0,'TERMS_AND_CONDITIONS',20),('fee92112-aa1d-4c5d-86c0-715c09dc8e91','VERIFY_PROFILE','Verify Profile','9cefdac7-411f-45ea-91cf-00ed934598e8',1,0,'VERIFY_PROFILE',90);
/*!40000 ALTER TABLE `required_action_provider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 12:44:07
