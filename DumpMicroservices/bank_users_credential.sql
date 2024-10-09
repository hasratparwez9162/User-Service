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
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credential` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential`
--

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
INSERT INTO `credential` VALUES ('042ac335-7620-4f3f-8589-8398e6259936',NULL,'password','58d592d9-650b-4e7f-af46-089a439b5e49',1728032747823,NULL,'{\"value\":\"hzXVR+08NogvTMcczjWamCjNOF0Xm7gdw2WTz4EMqf4=\",\"salt\":\"mu21VjFnjMZHACvN9rZbcw==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),('338500df-1529-4dfd-b191-ad08462a1a9b',NULL,'password','284165a1-1cb2-49cd-86a7-13d9d3cadccd',1727263188670,NULL,'{\"value\":\"cZmifgYmvZOPk/Hb0bJUDwt0zMQWu0CLranoGfBwK+g=\",\"salt\":\"5HMiiPeO6dd5pawAgP4/hg==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),('3de48331-6599-4843-9409-f73d258f4455',NULL,'password','80fbb973-3139-457a-9a9f-15dd76e421be',1728290935347,NULL,'{\"value\":\"ci/95bwBScWpsv3Uk6QImhrmwVLW2CNTOuggW9Aakgk=\",\"salt\":\"JZyQ5jTkt4ZSavJZV5ATaw==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),('4ca8d0cb-a045-4b6c-95ce-e2a786f88e84',NULL,'password','eaafc56d-63f2-4307-aed8-c3249a0fae69',1727370619449,NULL,'{\"value\":\"qiVsPrblqWvfAjPLcE2MnG9PvFBwSVuMrfC0wmX26qg=\",\"salt\":\"8CBHqWQmwAW4rqAblxsBVA==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),('5ee99702-1cb2-42d6-933d-fa88a9dff16d',NULL,'password','9c040a89-ff4b-4643-a08e-95a01eb8dff5',1727278676335,NULL,'{\"value\":\"oESCF2Gk80eiAEYoOGRpqYOyLwOCNhk7Z0ijXbXmEf8=\",\"salt\":\"wXGlJGJsy8Bh4JG2ichMmw==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),('8e19ff90-28d7-43b9-9586-d1e9f749167e',NULL,'password','eb7fee9b-0165-49e8-92eb-df9472457a47',1727768938648,NULL,'{\"value\":\"rQQUcTfIF6rnElRAnsIqQFUSTTSearRuQT5Pp4kAh2Q=\",\"salt\":\"0jIwuCyAZEDcyPjYkdGRfw==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),('989cf4fc-8ab8-4da4-9a66-4525d85cd337',NULL,'password','e762744d-76b7-494d-9535-f5b4441a9091',1725828279797,NULL,'{\"value\":\"a/Mtndymc/jK6wvGdAYb+5m/UOT0rP2O1gjkgK/XfNg=\",\"salt\":\"OXPgrh0fofgvNAJr6L2wJQ==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),('a91dd8c9-c51d-44db-b328-31e996f5dc6e',NULL,'password','0dd25054-6c48-4c7f-b69c-ddd15061ffc6',1727983475491,NULL,'{\"value\":\"mxoVbH4qn6FBzSKS3NyZfLOFqvidu37JxUX91yAJkOE=\",\"salt\":\"KAtPhDxtBW8P6hj3u8cTWg==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),('c623eb77-230b-4ae8-8b18-bdcca6c084b0',NULL,'password','824eb0a2-7f8d-45da-8393-d2beef74a29f',1727204929578,NULL,'{\"value\":\"bQYtBTySdzekwb11XI6/ISTfeGRYpHsOm7ub7f0SQmM=\",\"salt\":\"PVuMfcGoC6oFRFhmrYSkzQ==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),('e446a03f-6e2b-4ed2-91f5-5a0ff6dce623',NULL,'password','48b48894-a3aa-48a3-b224-6e11aa52263a',1725829264370,'My password','{\"value\":\"SG5AkHoz5RF4NcvjyFlZ6kEUD01AiT2YoHoHaVG8jcM=\",\"salt\":\"EX3BS2Qsbwo44YAR8N/9rA==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),('f94ab54b-1f86-44d3-93de-596b22eeb4a7',NULL,'password','da751716-317b-4dab-8cdb-7cec53a20420',1727276289805,NULL,'{\"value\":\"slwx9rjE1HSLqpAgti9PhR/dN33+3YdtJrF6GLMv+so=\",\"salt\":\"XWDQuQ3Nmualebe02Zwo8Q==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10);
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
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
