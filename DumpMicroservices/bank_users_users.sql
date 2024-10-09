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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `alternate_phone_number` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UK_9q63snka3mdh91as4io72espi` (`phone_number`),
  UNIQUE KEY `UK_USER_EMAIL` (`email`),
  UNIQUE KEY `UK_USER_PHONE_NUMBER` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'4th StreetJaipur','','2024-09-17 19:16:55.891271','1999-06-08','harisvar@gmail.com','Harishvar','Male','Kumar','2024-09-17 19:16:55.891271','9756258535','Rajasthan ','302001'),(2,'At- Bangalore','6544797984','2024-09-25 16:53:54.609048',NULL,'Chirag@gmail.com','Chirag ','Male','B','2024-09-25 16:53:54.609048','7846546784','Karnataka',NULL),(4,'sfkhalg','798798786','2024-09-25 16:58:15.530444',NULL,'jfsg@gmail.com','adafa','Male','akhfjf','2024-09-25 16:58:15.530444','546787878','skgjkdkgskg',NULL),(5,'jfjknejr','','2024-09-25 18:37:56.776436',NULL,'eink@gmail.com','Welcome','Male','to','2024-09-25 18:37:56.776436','9893784675','up',NULL),(6,'gfdhghgj','','2024-09-25 18:44:03.854118',NULL,'regr@gmail.com','rgre','Male','rg','2024-09-25 18:44:03.854118','7876576676','fgghhj',NULL),(7,'bangalore','','2024-09-25 20:07:18.388969',NULL,'yogi@gmail.com','yogi','Male','seth','2024-09-25 20:07:18.388969','9988776655','goa',NULL),(8,'jaipur','09876545741','2024-09-25 20:51:57.842765',NULL,'Rahul@gmail.com','Rahul','Male','Kumar','2024-09-25 20:51:57.842765','9678901234','Rajsthan',NULL),(9,'At- Bangalore','4879794658','2024-09-25 20:56:14.564898',NULL,'aditya@gmail.com','Aditya','Male','Kumar','2024-09-25 20:56:14.564898','4564687764','Karnataka',NULL),(10,'At- Bangalore','4897897657','2024-09-25 21:01:24.757305',NULL,'bhanu@gmail.com','Bhanu','Male','Kumar','2024-09-25 21:01:24.757305','7841687865','Karnataka ',NULL),(11,'Hyderabad','7812365490','2024-09-26 22:38:33.011358',NULL,'praneeth@gmail.com','Praneeth','Male','Kumar','2024-09-26 22:38:33.011358','7896541230','Hyderabad',NULL),(12,'Haryana ','7895642132','2024-10-01 13:16:13.834799',NULL,'krishan@gmail.com','Krishan','Male','Kumar','2024-10-01 13:16:13.834799','7895642132','Haryana','562110'),(13,'Rampur','7896541231','2024-10-04 00:53:26.862369',NULL,'arun@gmail.com','Arun','Male','Kumar','2024-10-04 00:53:26.862369','7896541231','Bihar','841311'),(16,'Abc','67874878654','2024-10-04 14:34:43.936273',NULL,'rahul1@gmail.com','Rahul','Male','Kumar','2024-10-04 14:34:43.936273','89465668764','Karnakata','560045');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
