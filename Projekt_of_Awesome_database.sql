-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: schoolhelp
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `author` int(11) NOT NULL,
  `summary_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  KEY `summary` (`summary_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`author`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`summary_id`) REFERENCES `summaries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Maths'),(2,'English'),(3,'Biology'),(4,'Technology'),(5,'Swedish'),(6,'History'),(7,'Religion');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summaries`
--

DROP TABLE IF EXISTS `summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header` varchar(32) NOT NULL,
  `author` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL,
  `subject` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summaries`
--

LOCK TABLES `summaries` WRITE;
/*!40000 ALTER TABLE `summaries` DISABLE KEYS */;
INSERT INTO `summaries` VALUES (1,'Test 1',2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tincidunt pharetra augue, in varius elit feugiat eget. Sed adipiscing enim cursus risus varius commodo. Donec pharetra nisi sed justo blandit porttitor. Suspendisse sagittis rutrum mi non malesuada. Aliquam consectetur metus quis elit egestas ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vivamus posuere eros at laoreet molestie. Sed feugiat tincidunt justo, at tristique justo cursus eget. Etiam laoreet laoreet congue. Nullam a eleifend lorem. Etiam non purus id arcu vestibulum molestie vitae sit amet nibh. Morbi a nunc porttitor lectus congue suscipit. In sapien justo, accumsan sed ipsum quis, viverra hendrerit metus. In eget pretium odio.','2014-04-01 00:00:00',1),(2,'Test 2',1,'Sed ut odio aliquam, semper tellus in, elementum enim. Suspendisse ac porttitor mauris. Maecenas eleifend sapien nec erat malesuada, non consequat purus convallis. Curabitur eu ornare turpis. Quisque pretium sollicitudin nisi. Cras a nunc vestibulum, venenatis arcu vitae, consectetur justo. Quisque cursus tortor eu ornare placerat. Nulla mauris dui, placerat nec leo nec, consequat adipiscing tortor. Vivamus adipiscing sit amet dolor eu vehicula. Nam nec sapien vel velit luctus viverra.','2014-04-09 00:00:00',2),(3,'Test 3',1,'Phasellus felis augue, scelerisque a pulvinar sit amet, gravida sed purus. Nam non bibendum odio. Pellentesque et metus lectus. Donec vel libero sit amet velit vulputate vulputate. In ut sapien eleifend orci dapibus gravida. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet, nisl nec tempor placerat, urna dui tincidunt dolor, vel posuere mauris erat eu neque. Vestibulum mollis sagittis lacinia. Phasellus elementum sem id libero condimentum, sed elementum enim ultricies. Donec dictum enim eu congue lobortis.','2014-04-22 14:26:39',5),(4,'Test 4',2,'Donec purus nibh, ornare eu placerat non, consectetur sed magna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In hac habitasse platea dictumst. Proin ac libero mauris. Integer porta ut mi vitae rhoncus. Cras viverra ut mi ac molestie. Nulla facilisi. Morbi feugiat neque id ante faucibus porta. Praesent sit amet metus mattis, interdum ligula quis, ultrices urna. Vestibulum ac purus iaculis magna ornare hendrerit. Sed placerat odio dui, at lobortis est malesuada quis.','2014-06-01 16:19:38',5),(14,'Test 5',1,'Nulla vel pulvinar elit. Morbi porttitor aliquet libero, vitae venenatis tortor pellentesque sit amet. Ut vulputate non erat et vehicula. Nulla semper nulla turpis, at tristique est rutrum eu. Praesent sit amet pharetra eros. Fusce porttitor vitae felis in auctor. Phasellus euismod adipiscing mauris, vel rhoncus lectus pharetra dignissim. Pellentesque rutrum nec nisl at dictum. Integer mollis diam non nulla aliquam, sit amet consectetur mauris sagittis. Nulla vulputate eu nibh nec accumsan. Fusce vitae dolor justo. Curabitur molestie tristique sollicitudin. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam tempor tortor leo, id cursus odio scelerisque eget. Nulla gravida eleifend sem, id dignissim nulla egestas sit amet. Suspendisse vel aliquam mauris.','2014-06-03 10:25:34',1),(16,'Test 6',0,'Etiam fringilla, ligula ac dapibus porta, est dolor convallis metus, ut tempus nisi tellus placerat lorem. Nunc sit amet mauris at augue elementum dictum. Pellentesque in neque ut mi adipiscing imperdiet vitae vel metus. Sed eleifend eleifend lectus id luctus. Maecenas tempus velit quis porttitor pharetra. Aenean venenatis enim bibendum neque elementum, vitae porttitor felis vehicula. Donec consequat, libero at malesuada pharetra, turpis massa lobortis erat, at eleifend libero sapien vitae ligula. Morbi vitae sem vitae tellus sodales ultricies eu eu purus. Praesent metus ante, tempor vel posuere non, facilisis eget enim.','2014-06-04 08:57:53',4),(17,'Bööf',3,'Jag gillar bööf!!&#34;Asd&#34;-abraham lincoln &#62;.&#60;&#13;&#10;','2014-06-04 09:05:28',1),(18,'Hello World',0,'This is a test-post','2014-06-09 08:24:34',4);
/*!40000 ALTER TABLE `summaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `karma` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Coffedrinker',0),(2,'Axianamos',0),(3,'Lingie',0);
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

-- Dump completed on 2014-06-09 16:32:02
