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
-- Table structure for table `client_attributes`
--

DROP TABLE IF EXISTS `client_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_attributes` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_attributes`
--

LOCK TABLES `client_attributes` WRITE;
/*!40000 ALTER TABLE `client_attributes` DISABLE KEYS */;
INSERT INTO `client_attributes` VALUES ('04d96dab-b902-427b-977f-e361f26c9136','post.logout.redirect.uris','+'),('144230bf-5d4b-4de2-bb6a-4701888acd6b','pkce.code.challenge.method','S256'),('144230bf-5d4b-4de2-bb6a-4701888acd6b','post.logout.redirect.uris','+'),('317d6a7f-e258-43a4-ba60-19b01572ddfd','pkce.code.challenge.method','S256'),('317d6a7f-e258-43a4-ba60-19b01572ddfd','post.logout.redirect.uris','+'),('3c38bccf-7a46-497a-83c2-6f49cfa05f4c','post.logout.redirect.uris','+'),('4993d73e-15e7-4246-9aee-2020bcde9d95','pkce.code.challenge.method','S256'),('4993d73e-15e7-4246-9aee-2020bcde9d95','post.logout.redirect.uris','+'),('4aedcf2c-9794-439f-8c3b-d245cd8b8bce','post.logout.redirect.uris','+'),('6d17ab90-758e-4891-818b-4d91943f0094','pkce.code.challenge.method','S256'),('6d17ab90-758e-4891-818b-4d91943f0094','post.logout.redirect.uris','+'),('797ad2bf-c832-4426-93e0-71d86d241818','backchannel.logout.revoke.offline.tokens','false'),('797ad2bf-c832-4426-93e0-71d86d241818','backchannel.logout.session.required','true'),('797ad2bf-c832-4426-93e0-71d86d241818','client.secret.creation.time','1727169886'),('797ad2bf-c832-4426-93e0-71d86d241818','oauth2.device.authorization.grant.enabled','false'),('797ad2bf-c832-4426-93e0-71d86d241818','oidc.ciba.grant.enabled','false'),('8952d9e6-6bdd-42f0-8f19-eae7e636b07a','pkce.code.challenge.method','S256'),('8952d9e6-6bdd-42f0-8f19-eae7e636b07a','post.logout.redirect.uris','+'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','acr.loa.map','{}'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','backchannel.logout.revoke.offline.tokens','false'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','backchannel.logout.session.required','true'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','client_credentials.use_refresh_token','false'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','client.introspection.response.allow.jwt.claim.enabled','false'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','client.secret.creation.time','1725829046'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','client.use.lightweight.access.token.enabled','false'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','display.on.consent.screen','false'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','oauth2.device.authorization.grant.enabled','false'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','oidc.ciba.grant.enabled','false'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','require.pushed.authorization.requests','false'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','tls.client.certificate.bound.access.tokens','false'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','token.response.type.bearer.lower-case','false'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','use.jwks.url','false'),('d1719de5-76e4-4b71-b6b2-a54aa4582f7b','use.refresh.tokens','true'),('e8437b5a-5d88-42fe-8e45-fd0c11d578a2','pkce.code.challenge.method','S256'),('e8437b5a-5d88-42fe-8e45-fd0c11d578a2','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `client_attributes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 12:43:58
