-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: alibaba
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `body`
--

DROP TABLE IF EXISTS `body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `body` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `overall_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `name` text,
  `description` text,
  `category` varchar(45) DEFAULT NULL,
  `image` varchar(200) DEFAULT 'assets/img/logo/default/placeholder.png',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body`
--

LOCK TABLES `body` WRITE;
/*!40000 ALTER TABLE `body` DISABLE KEYS */;
INSERT INTO `body` VALUES (4,1,3,'Vision','To start-up and establish a wide-ranging presence and set point of reference for a manufacturing company by implementing constant development in work standard to provide the utmost customer satisfaction, taking on-board the top and foremost course of action, quality and ethical standards, and establishing a long-term connection value, both to our internal and external customers as we deliver our products and services on time and on budget.',NULL,'assets/img/logo/default/placeholder.png','2018-02-04 16:14:15'),(5,1,3,'Mission','To start-up and establish a wide-ranging presence and set point of reference for a manufacturing company by implementing constant development in work standard to provide the utmost customer satisfaction, taking on-board the top and foremost course of action, quality and ethical standards, and establishing a long-term connection value, both to our internal and external customers as we deliver our products and services on time and on budget.',NULL,'assets/img/logo/default/placeholder.png','2018-02-04 16:14:15'),(6,1,2,'Raw Materials','Only selected finest corn, fresh from harvest is used to manufacture our products. We now produce 50,000 kg of sweet yellow corn and 20,000 kgs of white corn, daily.',NULL,'assets/img/logo/default/placeholder.png','2017-12-24 16:22:16'),(7,1,2,'Corn Cooking and Washing','Rice Husk is used as fuel to Boiler that would generate the heat required for Cooking. As responsible citizen of the planet, the company uses only ZERO Carbon Foot print fuel.',NULL,'assets/img/logo/default/placeholder.png','2017-12-24 16:22:16'),(8,1,2,'Packing and Storage','Warehouse Management is strictly enforced to sustain FIFO. Manually and carefully packed into bundles by highly skilled and trained workers.',NULL,'assets/img/logo/default/placeholder.png','2017-12-24 16:22:16'),(9,1,2,'Loading',NULL,NULL,'assets/img/logo/default/placeholder.png','2017-12-24 16:22:16'),(20,1,1,'Alibaba Green Peas',NULL,'food','assets/img/logo/sample/alibaba-greenpeas.png','2018-04-15 04:55:22'),(21,1,1,'Alibaba Snack Mix',NULL,'food','assets/img/logo/sample/alibaba-snackmix.png','2018-04-15 04:55:22'),(40,1,1,'Alibaba Corn Chips - Barbeque - Small','','food','assets/img/logo/sample/alibaba-barbeque-small.png','2018-04-19 03:43:31'),(41,1,1,'Alibaba Corn Chips - Barbeque - Large','','food','assets/img/logo/sample/alibaba-barbeque-large.png','2018-04-19 03:43:31'),(42,1,1,'Alibaba Corn Chips - Sweet Corn - Small','','food','assets/img/logo/sample/alibaba-sweetcorn-small.png','2018-04-19 03:43:31'),(43,1,1,'Alibaba Corn Chips - Sweet Corn - Large',NULL,'food','assets/img/logo/sample/alibaba-sweetcorn-large.png','2018-04-19 03:43:31'),(44,1,1,'Alibaba Corn Chips - Nacho Flavor',NULL,'food','assets/img/logo/sample/alibaba-nachoflavor.png','2018-04-19 03:43:31'),(45,1,1,'Alibaba Corn Chips - Spicy',NULL,'food','assets/img/logo/sample/alibaba-spicy.png','2018-04-19 03:43:31'),(46,1,1,'Alibaba Corn Chips - Cheddar',NULL,'food','assets/img/logo/sample/alibaba-cheddar.png','2018-04-19 03:43:32'),(47,1,1,'Alibaba Corn Chips - Roast Beef',NULL,'food','assets/img/logo/sample/alibaba-roastbeef.png','2018-04-19 03:43:32'),(48,1,1,'Alibaba Corn Chips - Fried Chicken',NULL,'food','assets/img/logo/sample/alibaba-friedchicken.png','2018-04-19 03:43:32');
/*!40000 ALTER TABLE `body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telephone` text,
  `mobile` text,
  `email` text,
  `address` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'+632 5422842 / +63 25422847','+63 9178001968','fdsf_faam@yahoo.com','Rm 4-a 1409 Alvarado ext. Tondo, Manila','2018-02-04 14:28:32');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `overall_id` int(11) NOT NULL,
  `title` text,
  `link` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,'what we offer','products','2017-12-24 15:55:52'),(2,1,'how we do things','process','2017-12-24 15:55:53'),(3,1,'our vision','vision','2017-12-24 15:55:53');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home`
--

DROP TABLE IF EXISTS `home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `body` text,
  `image` varchar(200) DEFAULT 'assets/img/logo/default/placeholder.png',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home`
--

LOCK TABLES `home` WRITE;
/*!40000 ALTER TABLE `home` DISABLE KEYS */;
INSERT INTO `home` VALUES (1,'FRANK AND DAVID FOOD MANUFACTURING CORPORATION','Our company Frank and David Food Manufacturing Corporation is the maker of “Alibaba” Brand Corn chips and “Bawang na Bawang (BNB) Cornick and Green Peas.','assets/img/bg/others/homepage.jpg','2018-04-19 04:02:03');
/*!40000 ALTER TABLE `home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overall`
--

DROP TABLE IF EXISTS `overall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `home_id` tinyint(4) DEFAULT NULL,
  `contact_id` tinyint(4) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overall`
--

LOCK TABLES `overall` WRITE;
/*!40000 ALTER TABLE `overall` DISABLE KEYS */;
INSERT INTO `overall` VALUES (1,1,1,'2017-12-24 15:42:55',1);
/*!40000 ALTER TABLE `overall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(45) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login_timestamp` timestamp NULL DEFAULT NULL,
  `logout_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (6,'bb5c9731cd0f59b5d54ffbeb57ea4a13','2018-04-09 15:34:34',NULL,NULL);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `overall_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `body_id` int(11) DEFAULT NULL,
  `name` text,
  `description` text,
  `image` text,
  `sub` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step`
--

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;
INSERT INTO `step` VALUES (1,1,2,6,NULL,NULL,NULL,'[\"Yellow Corn\", \"White Corn\", \"Palm Oil / Coco Oil\", \"Garlic\", \"Green Peas\", \"Lime\", \"Flavorings\"]','2018-01-03 15:42:19'),(2,1,2,7,NULL,'Corn is cooked together with lime,  to gelatinize its starch , remove the corn skin and sanitized using lime. It is then washed to clean ready for grinding corn.','assets/img/logo/default/placeholder.png',NULL,'2018-01-03 06:48:59'),(3,1,2,7,'Sheeter',NULL,'assets/img/logo/default/placeholder.png','[\"Line 1: 1,000 KG/HOUR\", \"Line 1: 1,200 KG/HOUR\"]','2018-01-03 15:42:19'),(4,1,2,7,'Frier','German Brand: Burner','assets/img/logo/default/placeholder.png','[\"Fully Automated\", \"Horizontal Burner\", \"Fuel: LPG\"]','2018-01-03 15:42:19'),(5,1,2,8,'Small Packing Machine','120 Units','assets/img/logo/default/placeholder.png','[\"Packing Capacity: 120 units X 50packs/hr = 6000 packs / hour\", \"Precision Technology\"]','2018-01-03 15:41:38'),(6,1,2,8,'Ishida Weigher','10 Units','assets/img/logo/default/placeholder.png','[\"Packing Capacity: 60packs / hr x 10 units = 600 pack / hour\", \"Horizontal Burner\", \"Fully Automated\", \"Highly Reliable Machine\", \"99.99% Weight Accuracy\"]','2018-01-03 15:41:38'),(7,1,2,9,'Loading','Loading is done systematically, to preserve products and  achieve OTIF at all times.','assets/img/logo/default/placeholder.png',NULL,'2018-01-03 06:52:14');
/*!40000 ALTER TABLE `step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub`
--

DROP TABLE IF EXISTS `sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `overall_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `body_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `detail` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub`
--

LOCK TABLES `sub` WRITE;
/*!40000 ALTER TABLE `sub` DISABLE KEYS */;
INSERT INTO `sub` VALUES (1,1,2,8,6,'Packing Capacity: 60packs / hr x 10 units = 600 pack / hour','2018-01-03 07:58:10'),(2,1,2,8,6,'Horizontal Burner','2018-01-03 07:58:10'),(3,1,2,8,6,'Fully Automated','2018-01-03 07:58:10'),(4,1,2,8,6,'Highly Reliable Machine','2018-01-03 07:58:10'),(5,1,2,8,6,'99.99% Weight Accuracy','2018-01-03 07:58:10'),(6,1,2,8,5,'Packing Capacity: 120 units X 50packs/hr = 6000 packs / hour','2018-01-03 08:24:25'),(7,1,2,8,5,'Precision Technology','2018-01-03 08:24:25'),(8,1,2,7,4,'Fully Automated','2018-01-03 08:25:41'),(9,1,2,7,4,'Horizontal Burner','2018-01-03 08:25:41'),(10,1,2,7,4,'Fuel: LPG','2018-01-03 08:25:41'),(11,1,2,7,3,'Line 1: 1,000 KG/HOUR','2018-01-03 08:26:08'),(12,1,2,7,3,'Line 1: 1,200 KG/HOUR','2018-01-03 08:26:08'),(13,1,2,6,1,'Yellow Corn','2018-01-03 08:28:13'),(14,1,2,6,1,'White Corn','2018-01-03 08:28:13'),(15,1,2,6,1,'Palm Oil / Coco Oil','2018-01-03 08:28:13'),(16,1,2,6,1,'Garlic','2018-01-03 08:28:13'),(17,1,2,6,1,'Green Peas','2018-01-03 08:28:13'),(18,1,2,6,1,'Lime','2018-01-03 08:28:13'),(19,1,2,6,1,'Flavorings','2018-01-03 08:28:13');
/*!40000 ALTER TABLE `sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'administrator','c52d369e5bb96f3f745eab7936c7402c','2018-04-05 05:31:35');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-19 12:24:27
