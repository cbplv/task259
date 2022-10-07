-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: skillfactorydb
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `comment_view`
--

DROP TABLE IF EXISTS `comment_view`;
/*!50001 DROP VIEW IF EXISTS `comment_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `comment_view` AS SELECT 
 1 AS `comment_id`,
 1 AS `text`,
 1 AS `db_created`,
 1 AS `author`,
 1 AS `picture_id`,
 1 AS `user_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` varchar(1028) NOT NULL DEFAULT '',
  `db_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `db_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  UNIQUE KEY `comment_id_UNIQUE` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (2,1,2,'second comment','2022-10-04 15:02:25','2022-10-04 15:02:25'),(7,1,4,'dasda','2022-10-05 13:29:14','2022-10-05 13:29:14'),(13,1,2,'new_test_proc_comm','2022-10-05 14:55:36','2022-10-05 14:55:36'),(14,1,2,'new_test_proc_comm','2022-10-05 14:55:41','2022-10-05 14:55:41'),(15,1,2,'new_test_proc_comm','2022-10-05 14:56:08','2022-10-05 14:56:08'),(16,1,2,'new_test_proc_comm','2022-10-05 14:56:25','2022-10-05 14:56:25'),(30,20,4,'phot3 comm 1','2022-10-07 12:25:25','2022-10-07 12:25:25'),(31,19,4,'sdasd','2022-10-07 12:25:49','2022-10-07 12:25:49'),(32,15,4,'eshe banana','2022-10-07 12:26:03','2022-10-07 12:26:03'),(33,1,10,'4e eta','2022-10-07 12:29:46','2022-10-07 12:29:46'),(35,1,10,'4e eta','2022-10-07 12:33:37','2022-10-07 12:33:37'),(36,1,10,'dada','2022-10-07 12:35:36','2022-10-07 12:35:36'),(37,1,4,'dada','2022-10-07 12:49:51','2022-10-07 12:49:51'),(39,15,11,'sada','2022-10-07 13:09:41','2022-10-07 13:09:41'),(40,19,11,'adasda','2022-10-07 13:09:45','2022-10-07 13:09:45'),(41,20,11,'aaaaaahyhhh','2022-10-07 13:09:50','2022-10-07 13:09:50');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_path` varchar(64) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`picture_id`),
  UNIQUE KEY `pictureid_UNIQUE` (`picture_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (1,'/storage/images/img1.jpg',3),(15,'/storage/images/IMG_0022.JPG',4),(19,'/storage/images/IMG_0021.JPG',4),(20,'/storage/images/IMG_0003.JPG',4);
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `gallery_view`
--

DROP TABLE IF EXISTS `gallery_view`;
/*!50001 DROP VIEW IF EXISTS `gallery_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gallery_view` AS SELECT 
 1 AS `picture_id`,
 1 AS `picture_path`,
 1 AS `author`,
 1 AS `user_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(30) NOT NULL,
  `user_password` varchar(64) NOT NULL,
  `user_hash` varchar(32) NOT NULL DEFAULT '',
  `user_ip` int(10) NOT NULL DEFAULT '0',
  `user_name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'cbp','10fc13dfa9ce482e7a24ac7362a403a7','23e68182ae6cb1865bf25aca0fea173c',2130706433,'cebepName'),(2,'midka','10fc13dfa9ce482e7a24ac7362a403a7','7554cb8858459cd3350ac2161b8cb9aa',2130706433,'midkaName'),(3,'aaa','10fc13dfa9ce482e7a24ac7362a403a7','79432ddca3b5bed682c576d1ddbbdaf1',2130706433,'aaaName'),(4,'ccc','10fc13dfa9ce482e7a24ac7362a403a7','6bb6c3764afd8422ea1ae89f08c21fc4',0,'cccName'),(7,'cc3','10fc13dfa9ce482e7a24ac7362a403a7','',0,''),(6,'cc2','10fc13dfa9ce482e7a24ac7362a403a7','',0,''),(8,'cc4','e6ed05426892956df56c9386c395eebb','afe3210a3548f18e5918d3219b825534',0,''),(9,'Pauk','7dfd4a3dae78f448428962c7988b027c','',0,''),(10,'zopazopa','fdb9041a0ecc3345e94336c60f77af78','b94f18231fb0eac04def00d499306583',0,''),(11,'ky2kep','10fc13dfa9ce482e7a24ac7362a403a7','791501dbc9d3a09afd7c46bf58758817',0,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `comment_view`
--

/*!50001 DROP VIEW IF EXISTS `comment_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comment_view` AS select `c`.`comment_id` AS `comment_id`,`c`.`text` AS `text`,`c`.`db_created` AS `db_created`,`u`.`user_login` AS `author`,`c`.`picture_id` AS `picture_id`,`c`.`user_id` AS `user_id` from (`comments` `c` left join `users` `u` on((`u`.`user_id` = `c`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gallery_view`
--

/*!50001 DROP VIEW IF EXISTS `gallery_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gallery_view` AS select `g`.`picture_id` AS `picture_id`,`g`.`picture_path` AS `picture_path`,`u`.`user_login` AS `author`,`g`.`user_id` AS `user_id` from (`gallery` `g` left join `users` `u` on((`u`.`user_id` = `g`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07 14:13:02
