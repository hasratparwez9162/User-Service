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
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES ('064f95cc-09e7-4e0f-bf9f-f6d815dc084c','rsa-enc-generated','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','rsa-enc-generated','org.keycloak.keys.KeyProvider','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',NULL),('081ccefa-8d2d-4a93-975e-422b0117f197','Allowed Protocol Mapper Types','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','authenticated'),('0c6c3766-ad64-4eb0-bb1b-d5cf2441ca0e','Full Scope Disabled','9cefdac7-411f-45ea-91cf-00ed934598e8','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9cefdac7-411f-45ea-91cf-00ed934598e8','anonymous'),('12384cf0-f68b-49a3-9506-6436b5cd2a2a','rsa-generated','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','rsa-generated','org.keycloak.keys.KeyProvider','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',NULL),('1bfb4d61-cfd9-4e03-b612-8c428ea3b498','Allowed Client Scopes','9cefdac7-411f-45ea-91cf-00ed934598e8','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9cefdac7-411f-45ea-91cf-00ed934598e8','authenticated'),('22e29415-3a58-41c5-9249-9d15f0c0ebd7','Consent Required','9cefdac7-411f-45ea-91cf-00ed934598e8','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9cefdac7-411f-45ea-91cf-00ed934598e8','anonymous'),('2418f651-1b91-402b-81dd-433526f23e58','aes-generated','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','aes-generated','org.keycloak.keys.KeyProvider','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',NULL),('2fbee35e-9980-4f7f-bfc6-d66815a3ee09','Allowed Protocol Mapper Types','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','authenticated'),('3b4d6303-9197-4f79-aeed-83ad5ffc0dff','Max Clients Limit','9cefdac7-411f-45ea-91cf-00ed934598e8','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9cefdac7-411f-45ea-91cf-00ed934598e8','anonymous'),('48827c35-2cbb-4b5f-bd86-605263c7ffaf','Allowed Protocol Mapper Types','9cefdac7-411f-45ea-91cf-00ed934598e8','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9cefdac7-411f-45ea-91cf-00ed934598e8','authenticated'),('5694bf27-90f0-45b0-b6a7-a67c6394d637','hmac-generated-hs512','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','hmac-generated','org.keycloak.keys.KeyProvider','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',NULL),('5a620775-33fe-4ee3-b527-f0dc1d978c73','aes-generated','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','aes-generated','org.keycloak.keys.KeyProvider','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',NULL),('5da81d54-f5cb-4a20-997b-bcacf0214074','rsa-generated','9cefdac7-411f-45ea-91cf-00ed934598e8','rsa-generated','org.keycloak.keys.KeyProvider','9cefdac7-411f-45ea-91cf-00ed934598e8',NULL),('5f95daeb-17f7-406a-bb4a-84caa5ae34ab','Allowed Protocol Mapper Types','9cefdac7-411f-45ea-91cf-00ed934598e8','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9cefdac7-411f-45ea-91cf-00ed934598e8','anonymous'),('618297ca-853a-4272-966b-5096419c7764','Consent Required','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','anonymous'),('69278789-5cc0-4642-89f8-bef2ac8c938c','Full Scope Disabled','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','anonymous'),('6da1d2da-9cd2-42aa-92e1-e18749dd10e6','Allowed Client Scopes','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','authenticated'),('79af8b24-0479-4bc5-83df-ecb960417f54','Max Clients Limit','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','anonymous'),('7fbf19e7-cf74-479b-9919-e4c69cdfb3d3',NULL,'9cefdac7-411f-45ea-91cf-00ed934598e8','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','9cefdac7-411f-45ea-91cf-00ed934598e8',NULL),('97361b38-b085-468c-bf89-f3e2d07900d5','Max Clients Limit','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','anonymous'),('9c8c0a14-ccde-45fc-8500-13cc9e8695da','rsa-enc-generated','9cefdac7-411f-45ea-91cf-00ed934598e8','rsa-enc-generated','org.keycloak.keys.KeyProvider','9cefdac7-411f-45ea-91cf-00ed934598e8',NULL),('afa09f24-7c72-49d7-8403-6da6bd8feca5','Trusted Hosts','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','anonymous'),('b8a023d4-fbac-4b57-bbbb-f69cbde3b826','rsa-enc-generated','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','rsa-enc-generated','org.keycloak.keys.KeyProvider','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',NULL),('b98e70d2-1120-4ad7-9d43-52443cf82d90','aes-generated','9cefdac7-411f-45ea-91cf-00ed934598e8','aes-generated','org.keycloak.keys.KeyProvider','9cefdac7-411f-45ea-91cf-00ed934598e8',NULL),('bf11be3d-7d38-413b-add5-f41a3a5dc09c','Full Scope Disabled','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','anonymous'),('c96c73da-0ebb-4b6c-a23b-c6347e76c1cb','Allowed Protocol Mapper Types','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','anonymous'),('cea31016-f321-49b7-b714-cad7e384b1bb','Allowed Client Scopes','9cefdac7-411f-45ea-91cf-00ed934598e8','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9cefdac7-411f-45ea-91cf-00ed934598e8','anonymous'),('d34549cd-826d-458a-9f4f-5f230914b718','Allowed Client Scopes','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','anonymous'),('d3d0747d-b6f5-4e6e-8b4f-ef079c4088ed','Trusted Hosts','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','anonymous'),('d4dd5f24-d5d5-43b0-856d-00b7fe5c11a5','rsa-generated','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','rsa-generated','org.keycloak.keys.KeyProvider','dff2298c-a195-4f4c-85ff-5f73d42fe5e4',NULL),('d6b7ed17-f279-449e-b506-8a37002511da','Consent Required','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','anonymous'),('daeb0d30-1e55-45f5-8550-7d31b8711ccc','Allowed Protocol Mapper Types','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','anonymous'),('e03abc3b-8c3a-4e39-9bd0-9f31aa050990','Allowed Client Scopes','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','anonymous'),('e2c99b26-f3a5-4ce3-83c4-5f4b7cad64eb','Trusted Hosts','9cefdac7-411f-45ea-91cf-00ed934598e8','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9cefdac7-411f-45ea-91cf-00ed934598e8','anonymous'),('edccd97d-2ed8-42d0-bd84-c2436d44aae0','Allowed Client Scopes','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','dff2298c-a195-4f4c-85ff-5f73d42fe5e4','authenticated'),('fb4f8315-7ae7-4bf1-9a32-4d5be6c4def7','hmac-generated-hs512','9cefdac7-411f-45ea-91cf-00ed934598e8','hmac-generated','org.keycloak.keys.KeyProvider','9cefdac7-411f-45ea-91cf-00ed934598e8',NULL),('fbbdc375-6f7c-45b6-ad1b-de296982453d','hmac-generated-hs512','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8','hmac-generated','org.keycloak.keys.KeyProvider','c0f57bf4-34dd-44d0-9f9a-ba30d20142e8',NULL);
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 12:43:57
