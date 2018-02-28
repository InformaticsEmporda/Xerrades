-- MySQL dump 10.16  Distrib 10.2.12-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: colors
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text,
  `rgb` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Aiguamarina','#7FFFD4'),(2,'Albercoc','#FBCEB1'),(3,'Amarant','#E52B50'),(4,'Ambre','#FFBF00'),(5,'Ametista','#9966CC'),(6,'Atzur','#007FFF'),(7,'Beix','#F5F5DC'),(8,'Bistre','#3D2B1F'),(9,'Blanc','#FFFFFF'),(10,'Blat','#F5DEB3'),(11,'Blau','#0000FF'),(12,'Blau cel','#77B5FE'),(13,'Blau de cobalt','#0047AB'),(14,'Blau de França','#318CE7'),(15,'Blau de Prússia','#003153'),(16,'Blau fosc','#00008B'),(17,'Blau marí','#000080'),(18,'Blau reial','#002366'),(19,'Blauet','#003399'),(20,'Bronze','#CD7F32'),(21,'Camussa','#F0DC82'),(22,'Canyella','#D2B48C'),(23,'Caqui','#C3B091'),(24,'Cardenal','#C41E3A'),(25,'Carmesí','#DC143C'),(26,'Carmí','#960018'),(27,'Carnació','#FEC3AC'),(28,'Castany rogenc','#CC8899'),(29,'Celadont','#2F847C'),(30,'Ceruli','#007BA7'),(31,'Chartreuse','#7FFF00'),(32,'Cian','#00FFFF'),(33,'Cirera','#DE3163'),(34,'Corall','#FF7F50'),(35,'Coure','#B87333'),(36,'Crema','#FFFDD0'),(37,'Escarlata','#FF2400'),(38,'Fúcsia','#E13571'),(39,'Granat','#800000'),(40,'Gris','#AAAAAA'),(41,'Gris fosc','#808080'),(42,'Groc','#FFFF00'),(43,'Heliotropi','#DF73FF'),(44,'Indi','#4B0082'),(45,'Jade','#00A86B'),(46,'Lavanda','#E6E6FA'),(47,'Lila','#660099'),(48,'Llima','#CCFF00'),(49,'Magenta','#FF00FF'),(50,'Malva','#E0B0FF'),(51,'Marró','#964B00'),(52,'Morat','#C54B8C'),(53,'Negre','#000000'),(54,'Ocre','#CC7722'),(55,'Or','#FFD700'),(56,'Orquídia','#DA70D6'),(57,'Panotxa','#CC5500'),(58,'Plata','#C0C0C0'),(59,'Porpra','#800080'),(60,'Préssec','#FFE5B4'),(61,'Pruna','#660066'),(62,'Rosa','#FFC0CB'),(63,'Salmó','#FF8C69'),(64,'Sèpia','#704214'),(65,'Taronja','#FF7F00'),(66,'Turquesa','#30D5C8'),(67,'Verd','#00FF00'),(68,'Verd maragda','#50C878'),(69,'Verd oliva','#808000'),(70,'Verd veronès','#40826D'),(71,'Vermell','#FF0000'),(72,'Vermell fosc','#8B0000'),(73,'Vermelló','#E34234'),(74,'Vinca','#CCCCFF'),(75,'Violat','#8B00FF'),(76,'Vori','#FFFFF0'),(77,'Xarxet','#008080');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-17 16:21:52
