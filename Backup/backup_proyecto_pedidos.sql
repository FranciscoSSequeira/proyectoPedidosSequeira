CREATE DATABASE  IF NOT EXISTS `proyecto_pedidos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto_pedidos`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto_pedidos
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `IDCLIENTE` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) DEFAULT 'USUARIO_UNKNOW',
  `DNI` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(100) NOT NULL,
  PRIMARY KEY (`IDCLIENTE`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Morgen','170-74-3366','mpanton0@businessweek.com'),(2,'Allen','803-70-7655','astickel1@salon.com'),(3,'Haskell','269-85-4250','hlenglet2@nbcnews.com'),(4,'Dallis','640-44-5858','dhuccaby3@addthis.com'),(5,'Selestina','364-68-9879','sbuckell4@elpais.com'),(6,'Lee','514-36-7165','linnis5@vistaprint.com'),(7,'Karee','401-39-0619','kspitell6@examiner.com'),(8,'Rriocard','521-70-3578','rfisk7@yahoo.co.jp'),(9,'Alvy','487-75-2918','amahomet8@mapy.cz'),(10,'Torry','510-18-9496','tlarrett9@wp.com'),(11,'Maren','290-66-8559','mannakina@eventbrite.com'),(12,'Quint','330-64-6817','qfourmyb@bizjournals.com'),(13,'Brunhilda','426-34-6327','bkobierskic@ycombinator.com'),(14,'Juieta','513-66-6885','jgheerhaertd@yelp.com'),(15,'Maris','688-21-3405','mdouthwaitee@apache.org'),(16,'Ravi','320-47-9146','rriggollf@upenn.edu'),(17,'Celine','597-84-9063','castong@gnu.org'),(18,'Alexandro','119-72-1755','aprescoteh@indiegogo.com'),(19,'Karim','325-50-6368','kbrumptoni@ameblo.jp'),(20,'Kissee','149-73-1895','kvigoursj@hud.gov');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_cliente_trigger` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
    DECLARE email_count INT;

    SELECT COUNT(*) INTO email_count
        FROM CLIENTE
    WHERE EMAIL = NEW.EMAIL;

    IF email_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya está en uso.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `IDEMPLEADO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDEMPLEADO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Rad'),(2,'Collen'),(3,'Salaidh'),(4,'Katherina'),(5,'Michal'),(6,'Rad'),(7,'Collen'),(8,'Salaidh'),(9,'Katherina'),(10,'Michal');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `IDFACTURA` int NOT NULL AUTO_INCREMENT,
  `IDPEDIDO` int DEFAULT NULL,
  `NUMEROFACTURA` varchar(255) DEFAULT NULL,
  `FECHA` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDFACTURA`),
  KEY `FK_FACTURA_PEDIDO` (`IDPEDIDO`),
  CONSTRAINT `FK_FACTURA_PEDIDO` FOREIGN KEY (`IDPEDIDO`) REFERENCES `pedido` (`IDPEDIDO`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,NULL,'254','2023-11-20 06:07:14'),(2,NULL,'843','2024-04-24 20:42:51'),(3,NULL,'888','2024-05-07 11:23:09'),(4,NULL,'722','2023-11-09 04:52:47'),(5,NULL,'160','2023-10-15 15:29:32'),(6,NULL,'299','2024-03-15 18:42:23'),(7,NULL,'464','2024-05-08 13:14:48'),(8,NULL,'333','2023-11-27 15:59:06'),(9,NULL,'374','2024-05-30 23:51:32'),(10,NULL,'100','2023-11-10 05:33:26'),(11,NULL,'761','2024-06-16 21:27:21'),(12,NULL,'242','2024-02-06 18:56:46'),(13,NULL,'643','2024-05-03 13:35:42'),(14,NULL,'158','2024-06-18 03:05:03'),(15,NULL,'227','2023-09-01 23:10:54'),(16,NULL,'185','2023-11-19 19:09:33'),(17,NULL,'802','2023-09-16 07:51:24'),(18,NULL,'863','2024-01-15 01:13:52'),(19,NULL,'793','2024-03-29 01:59:37'),(20,NULL,'918','2023-12-27 02:41:41'),(21,NULL,'844','2024-06-07 06:16:41'),(22,NULL,'897','2024-03-13 23:23:58'),(23,NULL,'494','2023-11-06 13:51:42'),(24,NULL,'367','2023-12-10 07:45:05'),(25,NULL,'395','2024-06-22 01:06:10'),(26,NULL,'801','2024-04-25 01:55:18'),(27,NULL,'702','2024-04-07 17:28:14'),(28,NULL,'199','2023-11-25 17:07:51'),(29,NULL,'848','2024-05-31 08:27:13'),(30,NULL,'910','2023-12-03 22:50:12'),(31,NULL,'584','2023-12-21 16:53:27'),(32,NULL,'318','2024-06-17 08:20:26'),(33,NULL,'945','2024-05-26 23:36:59'),(34,NULL,'178','2023-08-20 07:02:16'),(35,NULL,'628','2024-03-26 15:18:57'),(36,NULL,'482','2024-07-11 09:29:57'),(37,NULL,'607','2023-10-17 00:20:49'),(38,NULL,'812','2023-12-30 14:19:24'),(39,NULL,'759','2024-07-09 06:47:37'),(40,NULL,'918','2024-02-28 20:55:00'),(41,NULL,'999','2023-09-29 09:31:39'),(42,NULL,'621','2024-07-24 20:47:55'),(43,NULL,'325','2023-08-28 13:48:19'),(44,NULL,'57','2024-06-21 20:32:05'),(45,NULL,'941','2024-02-04 16:51:03'),(46,NULL,'940','2024-01-25 23:51:46'),(47,NULL,'517','2024-04-28 04:25:03'),(48,NULL,'464','2023-11-28 04:57:49'),(49,NULL,'561','2023-11-01 02:49:05'),(50,NULL,'452','2024-05-11 20:54:50'),(51,NULL,'254','2023-11-20 06:07:14'),(52,NULL,'843','2024-04-24 20:42:51'),(53,NULL,'888','2024-05-07 11:23:09'),(54,NULL,'722','2023-11-09 04:52:47'),(55,NULL,'160','2023-10-15 15:29:32'),(56,NULL,'299','2024-03-15 18:42:23'),(57,NULL,'464','2024-05-08 13:14:48'),(58,NULL,'333','2023-11-27 15:59:06'),(59,NULL,'374','2024-05-30 23:51:32'),(60,NULL,'100','2023-11-10 05:33:26'),(61,NULL,'761','2024-06-16 21:27:21'),(62,NULL,'242','2024-02-06 18:56:46'),(63,NULL,'643','2024-05-03 13:35:42'),(64,NULL,'158','2024-06-18 03:05:03'),(65,NULL,'227','2023-09-01 23:10:54'),(66,NULL,'185','2023-11-19 19:09:33'),(67,NULL,'802','2023-09-16 07:51:24'),(68,NULL,'863','2024-01-15 01:13:52'),(69,NULL,'793','2024-03-29 01:59:37'),(70,NULL,'918','2023-12-27 02:41:41'),(71,NULL,'844','2024-06-07 06:16:41'),(72,NULL,'897','2024-03-13 23:23:58'),(73,NULL,'494','2023-11-06 13:51:42'),(74,NULL,'367','2023-12-10 07:45:05'),(75,NULL,'395','2024-06-22 01:06:10'),(76,NULL,'801','2024-04-25 01:55:18'),(77,NULL,'702','2024-04-07 17:28:14'),(78,NULL,'199','2023-11-25 17:07:51'),(79,NULL,'848','2024-05-31 08:27:13'),(80,NULL,'910','2023-12-03 22:50:12'),(81,NULL,'584','2023-12-21 16:53:27'),(82,NULL,'318','2024-06-17 08:20:26'),(83,NULL,'945','2024-05-26 23:36:59'),(84,NULL,'178','2023-08-20 07:02:16'),(85,NULL,'628','2024-03-26 15:18:57'),(86,NULL,'482','2024-07-11 09:29:57'),(87,NULL,'607','2023-10-17 00:20:49'),(88,NULL,'812','2023-12-30 14:19:24'),(89,NULL,'759','2024-07-09 06:47:37'),(90,NULL,'918','2024-02-28 20:55:00'),(91,NULL,'999','2023-09-29 09:31:39'),(92,NULL,'621','2024-07-24 20:47:55'),(93,NULL,'325','2023-08-28 13:48:19'),(94,NULL,'57','2024-06-21 20:32:05'),(95,NULL,'941','2024-02-04 16:51:03'),(96,NULL,'940','2024-01-25 23:51:46'),(97,NULL,'517','2024-04-28 04:25:03'),(98,NULL,'464','2023-11-28 04:57:49'),(99,NULL,'561','2023-11-01 02:49:05'),(100,NULL,'452','2024-05-11 20:54:50');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego`
--

DROP TABLE IF EXISTS `juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego` (
  `IDJUEGO` int NOT NULL AUTO_INCREMENT,
  `NOMBREJUEGO` varchar(300) DEFAULT NULL,
  `PLATAFORMA` varchar(50) DEFAULT NULL,
  `GENERO` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`IDJUEGO`)
) ENGINE=InnoDB AUTO_INCREMENT=991 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego`
--

LOCK TABLES `juego` WRITE;
/*!40000 ALTER TABLE `juego` DISABLE KEYS */;
INSERT INTO `juego` VALUES (1,'Anne Frank Remembered','Samsung','Documentary'),(2,'Set Me Free (Emporte-moi)','Sharp','Drama'),(3,'Welcome to L.A.','Nokia','Drama|Musical'),(4,'Ingmar Bergman Makes a Movie (Ingmar Bergman gör en film)','Coolpad','Documentary'),(5,'Mr. Troop Mom','Micromax','Children|Comedy'),(6,'Radio Free Albemuth','ZTE','Drama|Sci-Fi'),(7,'War Dance','ZTE','Documentary'),(8,'Sharpe\'s Gold','Allview','Action|Adventure|War'),(9,'Grace of My Heart','HTC','Comedy|Drama'),(10,'Nine Months','Lenovo','Comedy|Romance'),(11,'Jab We Met','Oppo','Comedy|Drama|Romance'),(12,'It\'s in the Water','Archos','Comedy'),(13,'In the Hands of the Gods','Honor','Documentary'),(14,'Tremors 3: Back to Perfection','Sony','Comedy|Horror|Sci-Fi'),(15,'Poison Ivy','Samsung','Drama|Thriller'),(16,'Moonfleet','Vertu','Adventure|Drama'),(17,'Miffo','BenQ-Siemens','Comedy|Drama|Romance'),(18,'Dead of Winter','ZTE','Horror|Thriller'),(19,'Food Stamped','Amoi','Documentary'),(20,'Questo piccolo grande amore','Samsung','Comedy|Romance'),(21,'Hard Times','Eten','Action|Drama'),(22,'Monster, The','Lenovo','Comedy|Horror|Mystery|Sci-Fi'),(23,'The Woodcarver','Lava','Drama'),(24,'Simple-Minded Murder, The (Enfaldige mördaren, Den)','Orange','Drama'),(25,'Sleepwalk with Me','Samsung','Comedy|Drama'),(26,'The Facts of Murder','Asus','Crime|Drama'),(27,'End of St. Petersburg, The (Konets Sankt-Peterburga)','Motorola','Drama'),(28,'Good Evening, Mr. Wallenberg (God afton, Herr Wallenberg)','QMobile','Drama|War'),(29,'Amazon Women on the Moon','Vodafone','Comedy|Sci-Fi'),(30,'Calamity Jane','HTC','Musical|Western'),(31,'Pronto','Philips','Comedy|Crime|Thriller'),(32,'Taking Care of Business','LG','Comedy'),(33,'Christmas in August (Palwolui Christmas)','Lava','Drama|Romance'),(34,'Boy, Did I Get a Wrong Number!','Sewon','Comedy'),(35,'Natural, The','HTC','Drama'),(36,'Madame Sousatzka','Acer','Drama'),(37,'Hell (L\'enfer)','Coolpad','Drama'),(38,'What? (Che?)','Micromax','Comedy'),(39,'Juno and the Paycock','BLU','Drama'),(40,'Oh, God! You Devil','Motorola','Comedy'),(41,'Troll Hunter, The (Trolljegeren)','vivo','Fantasy|Horror'),(42,'Scarlet and the Black, The','LG','Action|Drama|War'),(43,'Handsome Harry','Sagem','Crime|Drama'),(44,'The Adventurers','ZTE','Action|Adventure|Drama'),(45,'Bagdad Cafe (Out of Rosenheim)','Icemobile','Comedy|Drama'),(46,'Intruder, The','Xiaomi','Drama|Mystery|Romance|Thriller'),(47,'Wind Chill','alcatel','Drama|Horror|Thriller'),(48,'Birds, the Bees and the Italians, The (Signore & signori)','Samsung','Comedy'),(49,'Cry_Wolf (a.k.a. Cry Wolf)','Orange','Drama|Horror|Mystery|Thriller'),(50,'Big Bounce, The','O2','Comedy|Crime|Thriller'),(51,'Buccaneer, The','Motorola','Adventure|Drama|Romance|War'),(52,'Summer Hours (Heure d\'été, L\')','alcatel','Drama'),(53,'Hidden Face, The (La cara oculta)','Kyocera','Thriller'),(54,'Race with the Devil','Xiaomi','Action|Horror|Mystery'),(55,'Leaving (Partir)','Micromax','Drama|Romance'),(56,'Young Törless, The (Junge Törless, Der)','Gigabyte','Drama'),(57,'In Like Flint','Apple','Action|Adventure|Comedy'),(58,'Nelly & Monsieur Arnaud','Asus','Drama'),(59,'Mr. Blandings Builds His Dream House','Gigabyte','Comedy'),(60,'Flight of the Navigator','Samsung','Adventure|Children|Sci-Fi'),(61,'Standing Still','Celkon','Comedy|Drama|Romance'),(62,'Crazy People','Kyocera','Comedy'),(63,'United','ZTE','Drama'),(64,'Lucky 7','Samsung','Comedy|Romance'),(65,'Paul','alcatel','Adventure|Comedy|Sci-Fi'),(66,'Russell Peters: Outsourced','Sony','Comedy|Documentary'),(67,'Asterix & Obelix: God Save Britannia (Astérix et Obélix: Au service de Sa Majesté)','Infinix','Adventure|Comedy'),(68,'Drowning Mona','Meizu','Comedy'),(69,'Big White, The','BlackBerry','Comedy|Crime|Drama'),(70,'Undercover Brother','Samsung','Comedy'),(71,'Horseman, The','alcatel','Crime|Thriller'),(72,'Now and Then','Kyocera','Children|Drama'),(73,'Russians Are Coming, the Russians Are Coming, The','Wiko','Comedy|War'),(74,'Without Love','HTC','Comedy|Romance'),(75,'Breaking the Rules','Lava','Comedy|Drama'),(76,'Transcendence','Sony','Drama|Sci-Fi|IMAX'),(77,'Duck Season (Temporada de patos)','Realme','Comedy'),(78,'Occurrence at Owl Creek Bridge, An (La rivière du hibou)','Nokia','Drama|War'),(79,'Hansel & Gretel','Huawei','Horror'),(80,'\'Hellboy\': The Seeds of Creation','Asus','Action|Adventure|Comedy|Documentary|Fantasy'),(81,'The Day That Lasted 21 Years','BLU','Documentary'),(82,'Call of the Wild, The','Nokia','Action|Adventure|Drama|Romance|Western'),(83,'Confiance règne, La','Nokia','Comedy'),(84,'One Tough Cop','Wiko','Action|Crime'),(85,'Outfit, The','QMobile','Crime|Drama|Thriller'),(86,'Winter Passing','Micromax','Drama'),(87,'Afternoon of a Torturer, The (Dupa-amiaza unui tortionar)','BlackBerry','Drama'),(88,'Arsène Lupin','Samsung','Mystery|Romance'),(89,'Summer Magic','Maxwest','Children|Comedy|Musical'),(90,'Year One','QMobile','Adventure|Comedy'),(91,'Hombre','HTC','Western'),(92,'Two Hands','Honor','Comedy|Crime|Thriller'),(93,'Who Killed the Electric Car?','Motorola','Documentary'),(94,'Normal Adolescent Behavior','Samsung','Drama|Romance'),(95,'Billu','Sony','Comedy|Drama|Musical'),(96,'Silver Bullet (Stephen King\'s Silver Bullet)','Samsung','Adventure|Drama|Horror|Mystery|Thriller'),(97,'Dance with the Devil (Perdita Durango)','Lava','Action|Crime|Drama|Romance'),(98,'Deathmaker, The (Totmacher, Der)','ZTE','Crime|Drama'),(99,'State Fair','ZTE','Comedy|Drama|Romance'),(100,'Glitterbug','Huawei','(no genres listed)'),(101,'Next Karate Kid, The','Samsung','Action|Children|Romance'),(102,'Signal, The','Siemens','Horror|Sci-Fi|Thriller'),(103,'Most Beautiful, The (Ichiban utsukushiku)','Sony','Drama'),(104,'WWII IN HD','Celkon','(no genres listed)'),(105,'Man on High Heels','Spice','Action|Comedy'),(106,'Good Burger','verykool','Children|Comedy'),(107,'Buud Yam','Samsung','Drama'),(108,'The Loft','BLU','Thriller'),(109,'Village, The','Sony','Drama|Mystery|Thriller'),(110,'Words and Pictures','Allview','Comedy|Drama|Romance'),(111,'High School Musical 3: Senior Year','Panasonic','Musical'),(112,'Christmas Carol: The Movie','Lava','Animation|Children'),(113,'Silent Partner','Samsung','Action|Mystery|Thriller'),(114,'Iraq for Sale: The War Profiteers','QMobile','Documentary'),(115,'Climate of Change','Ulefone','Documentary'),(116,'The Army','Plum','Drama'),(117,'Princesas','Siemens','Drama'),(118,'King Lear','Maxon','Comedy|Drama|Sci-Fi'),(119,'Three and Out (Deal Is a Deal, A)','Panasonic','Comedy|Drama'),(120,'Doomsday','HTC','Action|Drama|Sci-Fi|Thriller'),(121,'Monterey Pop','LG','Documentary|Musical'),(122,'Üvegtigris','vivo','Comedy'),(123,'Weird Science','Philips','Comedy|Fantasy|Sci-Fi'),(124,'Trick \'r Treat','Micromax','Comedy|Horror|Thriller'),(125,'Tingler, The','LG','Horror'),(126,'Hollywood Canteen','Samsung','Comedy|Musical|Romance'),(127,'Hours, The','LG','Drama|Romance'),(128,'Forger, The','Telit','Drama'),(129,'Red Salute','Lava','Comedy|Romance'),(130,'Murder by Numbers','Samsung','Crime|Thriller'),(131,'Gigot','MWg','Comedy'),(132,'Faster','HTC','Action|Crime|Drama'),(133,'Dream a Little Dream','Apple','Comedy|Drama|Romance'),(134,'Card Player, The (Il cartaio)','alcatel','Crime|Horror|Mystery|Thriller'),(135,'Day, The','Micromax','Drama|Sci-Fi|Thriller'),(136,'Operation Homecoming: Writing the Wartime Experience','Honor','Documentary'),(137,'Mr. Accident','Philips','Comedy'),(138,'Hoosiers (a.k.a. Best Shot)','Huawei','Drama|Romance'),(139,'Basic Instinct','Allview','Crime|Mystery|Thriller'),(140,'Three Fugitives','Oppo','Action|Comedy'),(141,'She-Devil','Spice','Comedy'),(142,'No Highway in the Sky','Samsung','Drama|Thriller'),(143,'Holes in My Shoes','Allview','Documentary'),(144,'Whisper of the Heart (Mimi wo sumaseba)','Haier','Animation|Drama|Romance'),(145,'Aladdin and the King of Thieves','Motorola','Animation|Children|Comedy|Fantasy|Musical|Romance'),(146,'Saturday Night and Sunday Morning','Tecno','Drama'),(147,'Summer\'s Tale, A (Conte d\'été)','XOLO','Comedy|Drama|Romance'),(148,'Che: Part One','HTC','Drama|War'),(149,'Fanny','Pantech','Drama|Romance'),(150,'Equilibrium','Lenovo','Action|Sci-Fi|Thriller'),(151,'Vali','Sony','Action|Drama'),(152,'Food of the Gods II','Asus','Horror|Sci-Fi'),(153,'Great Day in Harlem, A','LG','Documentary'),(154,'Moomins on the Riviera (Muumit Rivieralla)','Honor','Animation|Children|Comedy'),(155,'Shanghai Triad (Yao a yao yao dao waipo qiao)','BLU','Crime|Drama'),(156,'House','Motorola','Drama|Horror|Thriller'),(157,'Eighth Day, The (Den Åttonde dagen)','Mitac','Children|Drama'),(158,'Pennies from Heaven','LG','Musical|Romance'),(159,'Butcher Boys (Bone Boys)','Wiko','Action|Comedy|Horror|Thriller'),(160,'Stuart: A Life Backward','BLU','Drama'),(161,'Notorious Landlady, The','Nokia','Comedy|Mystery'),(162,'Shock','Allview','Film-Noir|Thriller'),(163,'Note by Note: The Making of Steinway L1037','Celkon','Documentary'),(164,'Mater and the Ghostlight','Cat','Animation|Children|Comedy'),(165,'Pardes','LG','Action|Comedy|Musical|Romance'),(166,'Gypsy 83','Lenovo','Drama'),(167,'Prom Night in Mississippi','alcatel','Documentary'),(168,'Eat','Asus','Documentary'),(169,'Judgment at Nuremberg','LG','Drama'),(170,'Last Play at Shea, The','Philips','Documentary|Musical'),(171,'Tormento','WND','Drama'),(172,'Shunning, The','Nokia','Drama'),(173,'Kanal','Asus','Drama|War'),(174,'Dunwich Horror, The','Vodafone','Horror'),(175,'Incendiary','BLU','Drama|Mystery|Romance|Thriller'),(176,'Benji the Hunted','Allview','Adventure|Children'),(177,'Jumbo (Billy Rose\'s Jumbo)','Bird','Comedy|Musical|Romance'),(178,'Saw','Motorola','Horror|Mystery|Thriller'),(179,'Other Woman, The','BenQ-Siemens','Comedy|Romance'),(180,'Big Knife, The','LG','Film-Noir'),(181,'Lair of the White Worm, The','Pantech','Horror'),(182,'Pussy Riot: A Punk Prayer','YU','Documentary'),(183,'Every Day','Micromax','Comedy|Drama'),(184,'Secret World of Arrietty, The (Kari-gurashi no Arietti)','Acer','Animation|Children|Fantasy'),(185,'Human Capital (Il capitale umano)','LG','Drama'),(186,'Blaze','Nokia','Comedy|Drama'),(187,'R','BLU','Drama'),(188,'Thieves (Voleurs, Les)','LG','Crime|Drama|Romance'),(189,'Bomb It','Celkon','Documentary'),(190,'Bigger Than Life','Lava','Drama|Mystery|Thriller'),(191,'She Does Not Drink, Smoke or Flirt But... She Talks','Xiaomi','Comedy'),(192,'Barcelona','Oppo','Comedy|Romance'),(193,'In Passing','Celkon','Drama|Fantasy|Mystery'),(194,'November Man, The','Panasonic','Action|Crime|Thriller'),(195,'State of the Union','Lava','Comedy|Drama'),(196,'Blue Dahlia, The','Sagem','Crime|Drama|Film-Noir|Mystery|Thriller'),(197,'Footloose','verykool','Drama'),(198,'11 Harrowhouse','alcatel','Comedy|Crime'),(199,'Hell\'s Kitchen','Samsung','Drama'),(200,'Lemming','Sagem','Drama|Mystery|Thriller'),(201,'Concepción Arenal, la visitadora de cárceles','alcatel','Drama'),(202,'7 Khoon Maaf','Vodafone','Drama|Mystery|Thriller'),(203,'Bandits (Bandidos)','Yezz','Action|Adventure|War'),(204,'I Remember (Eu Me Lembro)','vivo','Drama'),(205,'Phantom Lover, The (Ye ban ge sheng)','Asus','Drama|Mystery|Romance'),(206,'Dreams of  a Life','QMobile','Documentary'),(207,'Naked Gun 33 1/3: The Final Insult','Spice','Action|Comedy'),(208,'Al-risâlah','verykool','Adventure|Drama|War'),(209,'3-Iron (Bin-jip)','Telit','Drama|Romance'),(210,'Music and Lyrics','BQ','Comedy|Romance'),(211,'Revengers Tragedy','Huawei','Comedy|Horror'),(212,'Melancholia','Celkon','Drama|Sci-Fi'),(213,'Our Summer in Provence','Vodafone','Comedy|Drama'),(214,'Loving You','Samsung','Drama|Musical'),(215,'Mortal Kombat','Asus','Action|Adventure|Fantasy'),(216,'Carmen Jones','Samsung','Drama|Musical'),(217,'Misérables in Concert, Les','Samsung','Drama|Musical'),(218,'Family Thing, A','Samsung','Comedy|Drama'),(219,'Dark, The','Huawei','Horror|Mystery|Thriller'),(220,'Wind Chill','i-mobile','Drama|Horror|Thriller'),(221,'Pruitt-Igoe Myth, The','Samsung','Documentary|Drama'),(222,'Portrait of a Lady, The','Nokia','Drama'),(223,'Union, The','Celkon','Documentary'),(224,'Internship, The','Apple','Comedy'),(225,'Babylon 5: The Gathering','verykool','Sci-Fi'),(226,'Cujo','LG','Horror|Thriller'),(227,'Moon Over Parador','Philips','Comedy'),(228,'Sunburn','Allview','Action|Comedy|Crime'),(229,'Criminal Lovers','alcatel','Crime|Drama|Romance|Thriller'),(230,'Godzilla\'s Revenge (Gojira-Minira-Gabara: Oru Kaijû Daishingeki) (All Monsters Attack)','Spice','Children'),(231,'Tin Pan Alley','Apple','Drama|Musical|Romance'),(232,'Finding Vivian Maier','Lava','Documentary'),(233,'I Saw the Sun (Günesi gördüm)','HTC','Drama'),(234,'Zatoichi and the Chess Expert (Zatôichi Jigoku tabi) (Zatôichi 12)','Lenovo','Action|Drama'),(235,'Junior Bonner','Eten','Comedy|Drama|Western'),(236,'So Long Letty','Samsung','Comedy|Musical'),(237,'Hunters, The','Dell','Drama|War'),(238,'Adventures of Robin Hood, The','LG','Action|Adventure|Romance'),(239,'Hardcore','Pantech','Crime|Drama'),(240,'Mr. Saturday Night','Motorola','Comedy|Drama'),(241,'Unprecedented: The 2000 Presidential Election','Siemens','Documentary'),(242,'Kill for Me','Honor','Drama|Thriller'),(243,'Firm, The','Motorola','Drama'),(244,'Nomad (Köshpendiler)','Celkon','Drama|War'),(245,'Set-Up, The','Sony','Drama|Film-Noir|Romance'),(246,'Vamp','Allview','Comedy|Horror'),(247,'Half Life of Timofey Berezin, The (PU-239)','alcatel','Drama'),(248,'Empty Mirror, The','Oppo','Drama'),(249,'Devil\'s Knot','Philips','Crime|Drama|Thriller'),(250,'Think Fast, Mr. Moto','Allview','Crime|Drama|Mystery|Thriller'),(251,'Christmas Carol, A (Scrooge)','Samsung','Drama|Fantasy'),(252,'\'R Xmas','Apple','Crime|Drama'),(253,'Along the Ridge (Anche libero va bene)','T-Mobile','Drama'),(254,'Kandahar (Safar e Ghandehar)','Sendo','Drama'),(255,'Geography Club','Plum','Comedy|Drama|Romance'),(256,'Garbage Warrior','Lenovo','Documentary'),(257,'Last Run','Ericsson','Action|Crime|Thriller'),(258,'Back to the Secret Garden','Siemens','Adventure|Children|Fantasy'),(259,'In the Edges: The \'Grizzly Man\' Session ','verykool','Documentary'),(260,'Birdman','Nokia','Comedy|Drama'),(261,'39 Steps, The','Panasonic','Drama|Mystery|Thriller'),(262,'Embracing','Celkon','Documentary'),(263,'Earth Trembles, The (Terra trema: Episodio del mare, La)','Gigabyte','Drama'),(264,'O Brother, Where Art Thou?','Allview','Adventure|Comedy|Crime'),(265,'Tomb of Ligeia, The','NEC','Horror'),(266,'Short Film About John Bolton, A','HP','Fantasy|Horror|Mystery'),(267,'Hundred-Foot Journey, The','XOLO','Drama'),(268,'Born in Flames','Energizer','Comedy|Drama|Fantasy|Sci-Fi'),(269,'Poison','Gigabyte','Comedy'),(270,'Margaret','Huawei','Drama'),(271,'Looking Forward','BLU','Drama'),(272,'Lambada','LG','Drama'),(273,'Asylum Blackout','vivo','Horror|Thriller'),(274,'Decampitated','LG','Comedy|Horror'),(275,'Thing, The','Sonim','Horror|Mystery|Sci-Fi|Thriller'),(276,'Goodbye, South, Goodbye (Nan guo zai jian, nan guo)','NIU','Crime|Drama'),(277,'Trick','QMobile','Action|Crime'),(278,'Puppet Master vs. Demonic Toys (Puppet Master 9)','Huawei','Comedy|Fantasy|Horror|Sci-Fi|Thriller'),(279,'Pride and Prejudice','Sewon','Comedy|Drama|Romance'),(280,'Topo, El','BLU','Fantasy|Western'),(281,'White Reindeer, The (Valkoinen peura)','LG','Drama|Fantasy|Horror'),(282,'And the Pursuit of Happiness (La poursuite du bonheur)','Huawei','Documentary'),(283,'The Devil and the Holy Water','Wiko','Comedy'),(284,'Burnt Money (Plata Quemada)','Lava','Action|Crime|Drama|Romance|Thriller'),(285,'Harvie Krumpet','Xiaomi','Animation|Comedy|Drama'),(286,'Arabesque','Huawei','Adventure|Drama|Romance|Thriller'),(287,'God is Great, I\'m Not (Dieu est grand, je suis toute petite)','Haier','Comedy|Romance'),(288,'Jonathan Livingston Seagull','Asus','Drama'),(289,'Bullies','Tecno','Action|Drama|Thriller'),(290,'Life of Aleksis Kivi, The (Aleksis Kiven elämä)','Toshiba','Drama'),(291,'The Harmony Game','Samsung','Documentary'),(292,'Hello Down There','Sagem','Comedy|Sci-Fi'),(293,'Cannery Row','Prestigio','Drama'),(294,'Wind Chill','Amoi','Drama|Horror|Thriller'),(295,'National Security','Samsung','Action|Comedy'),(296,'Music Man, The','Asus','Children|Comedy|Musical|Romance'),(297,'Donner Pass','LG','Horror'),(298,'Lover\'s Knot','alcatel','Comedy'),(299,'Trailer Park of Terror','Plum','Horror|Thriller'),(300,'Meet the Parents','Samsung','Comedy'),(301,'Trick','Nokia','Action|Crime'),(302,'The Lego Movie','Honor','Action|Adventure|Animation|Children|Comedy|Fantasy'),(303,'Cell Count','Motorola','Horror|Sci-Fi'),(304,'Old Joy','Acer','Drama'),(305,'Common Threads: Stories from the Quilt','BLU','Documentary'),(306,'Television Under the Swastika (Das Fernsehen unter dem Hakenkreuz)','LG','Documentary'),(307,'Lisbela e o Prisioneiro (Lisbela and the Prisoner)','Apple','Comedy|Romance'),(308,'Hunter, The','Apple','Thriller'),(309,'Flaming Creatures','Nokia','Drama'),(310,'Paperboy, The','Nokia','Thriller'),(311,'Miguel and William (Miguel y William)','Lenovo','Comedy|Romance'),(312,'Naked City, The','Samsung','Crime|Drama|Film-Noir|Mystery'),(313,'Key Largo','Samsung','Crime|Drama|Film-Noir|Thriller'),(314,'Return of Swamp Thing, The','Allview','Comedy|Horror|Sci-Fi'),(315,'Canon','Intex','Animation'),(316,'Gojoe: Spirit War Chronicle (Gojo reisenki: Gojoe)','Panasonic','Drama'),(317,'My Gun is Quick','Sagem','Mystery'),(318,'Princess Raccoon (Operetta tanuki goten)','Asus','Comedy|Fantasy|Musical|Romance'),(319,'Ice Men','Samsung','Drama'),(320,'Almost You','Pantech','Comedy|Drama'),(321,'Adventures of Don Juan','Vodafone','Adventure|Romance'),(322,'What the Day Owes the Night','BLU','Drama|Romance'),(323,'Mean Girls','Samsung','Comedy'),(324,'Tokyo!','Toshiba','Drama'),(325,'Bridge to Terabithia','Lenovo','Adventure|Children|Fantasy'),(326,'Black Rose Ascension (Kurobara shôten)','Celkon','Drama'),(327,'New Police Story (Xin jing cha gu shi)','Lava','Action|Crime|Drama'),(328,'Shadow of the Holy Book (Pyhän kirjan varjo)','Samsung','Documentary'),(329,'Silent Night','Xiaomi','Horror'),(330,'War Is Over, The (Guerre est finie, La)','BQ','Drama'),(331,'Eyes Wide Shut','Gionee','Drama|Mystery|Thriller'),(332,'Disfigured','Lenovo','Drama'),(333,'This Boy\'s Life','Spice','Drama'),(334,'Latitudes','ZTE','Drama|Romance'),(335,'Blackout','vivo','Action|Thriller'),(336,'Extreme Measures','Huawei','Drama|Thriller'),(337,'Get Out of My Room','Motorola','Comedy'),(338,'Vamps','Samsung','Comedy|Horror|Romance'),(339,'Leopard Man, The','T-Mobile','Drama|Horror|Mystery|Thriller'),(340,'The Count of Monte Cristo','Huawei','Adventure|Drama|Romance'),(341,'Six of a Kind','Xiaomi','Comedy'),(342,'Harold & Kumar Escape from Guantanamo Bay','Coolpad','Adventure|Comedy'),(343,'Delivery Man','Maxwest','Comedy'),(344,'Eternal Sunshine of the Spotless Mind','BlackBerry','Drama|Romance|Sci-Fi'),(345,'A-Haunting We Will Go','Yezz','Comedy'),(346,'Taking Off','Samsung','Comedy|Drama'),(347,'Sexual Dependency (Dependencia sexual)','Meizu','Drama'),(348,'Mudge Boy, The','ZTE','Drama'),(349,'Mercury Rising','Meizu','Action|Drama|Thriller'),(350,'Man of the West','Samsung','Western'),(351,'Cranes Are Flying, The (Letyat zhuravli)','Ulefone','Drama|Romance|War'),(352,'Gettysburg','BQ','Drama|War'),(353,'Seven Brides for Seven Brothers','Celkon','Comedy|Musical|Romance|Western'),(354,'Rocky Saga: Going the Distance, The','Huawei','Documentary'),(355,'War Room, The','Samsung','Documentary'),(356,'Saving Sarah Cain','vivo','Drama'),(357,'Quackser Fortune Has a Cousin in the Bronx','BLU','Comedy|Drama|Romance'),(358,'Snow Cake','Spice','Drama'),(359,'Carmen Jones','alcatel','Drama|Musical'),(360,'At Middleton','Nokia','Comedy|Romance'),(361,'Criminal Life of Archibaldo de la Cruz, The (Ensayo de un crimen)','Philips','Comedy|Crime|Drama'),(362,'Last Man, The','Spice','Comedy|Romance|Sci-Fi'),(363,'Eminem AKA ','Spice','Documentary'),(364,'Ondine','Motorola','Drama|Fantasy|Romance'),(365,'Won Ton Ton: The Dog Who Saved Hollywood','QMobile','Comedy'),(366,'By the Pricking of My Thumbs (Mon petit doigt m\'a dit...)','Huawei','Comedy|Mystery'),(367,'Burden of Dreams','Samsung','Documentary'),(368,'Glory to the Filmmaker! (Kantoku · Banzai!)','LG','Comedy|Drama'),(369,'Diana Vreeland: The Eye Has to Travel','Samsung','Documentary'),(370,'Bilitis','Samsung','Drama|Romance'),(371,'This Girl\'s Life','verykool','Drama'),(372,'Ceremony','Cat','Comedy'),(373,'Talhotblond:','Samsung','Documentary|Thriller'),(374,'Nina Takes a Lover','Lenovo','Comedy|Romance'),(375,'Mahabharata, The','Gionee','Action|Drama|War'),(376,'Thirst (Bakjwi)','Nokia','Drama|Horror'),(377,'Bloodbrothers','Philips','Drama'),(378,'Champ, The','Samsung','Drama'),(379,'Fullmetal Alchemist the Movie: Conqueror of Shamballa (Gekijô-ban hagane no renkinjutsushi: Shanbara wo yuku mono)','Siemens','Action|Adventure|Animation|Drama'),(380,'Heart and Souls','Samsung','Comedy|Fantasy'),(381,'Toys','Prestigio','Comedy|Fantasy'),(382,'Mea Maxima Culpa: Silence in the House of God','LG','Documentary'),(383,'War Game, The','Huawei','Documentary|Drama|War'),(384,'Secret of NIMH 2: Timmy to the Rescue, The','Siemens','Adventure|Animation|Children|Musical'),(385,'Walk the Line','QMobile','Drama|Musical|Romance'),(386,'Little Engine That Could, The','alcatel','Animation|Children'),(387,'Simpsons Movie, The','Gionee','Animation|Comedy'),(388,'Corridor, The (Koridorius)','Xiaomi','Drama'),(389,'Farsan','Samsung','Comedy'),(390,'God Is the Bigger Elvis','ZTE','Documentary'),(391,'Remo Williams: The Adventure Begins','Motorola','Action|Comedy|Crime|Thriller'),(392,'Liz & Dick ','alcatel','Drama'),(393,'Praise','Samsung','Drama'),(394,'Chances Are','Xiaomi','Comedy|Romance'),(395,'Whatever It Takes','verykool','Comedy|Romance'),(396,'Blind (Beul-la-in-deu)','LG','Drama|Horror|Thriller'),(397,'Who Is Cletis Tout?','Samsung','Comedy'),(398,'Little Fridolf Becomes a Grandfather','Siemens','Comedy'),(399,'My Wife, A Body to Love','Nokia','(no genres listed)'),(400,'Into the Sun','Samsung','Action|Adventure|Thriller'),(401,'Brooklyn','Motorola','Comedy|Drama|Romance'),(402,'Om Shanti Om','Spice','Action|Drama|Musical|Romance'),(403,'Slipper and the Rose, The','Allview','Adventure|Musical|Romance'),(404,'Wing and the Thigh, The (L\'aile ou la cuisse)','Lenovo','Comedy'),(405,'She\'s the Man','HTC','Comedy|Romance'),(406,'In Harm\'s Way','ZTE','Drama|War'),(407,'Puppet Master 4','Pantech','Horror|Sci-Fi|Thriller'),(408,'No Time for Nuts','Oppo','Adventure|Animation|Comedy'),(409,'Helter Skelter','Nokia','Crime|Drama|Thriller'),(410,'No Logo','Yezz','Documentary'),(411,'Camp','LG','Comedy|Musical'),(412,'4:44 Last Day on Earth','Lenovo','Drama|Fantasy|Sci-Fi'),(413,'America\'s Sweethearts','Motorola','Comedy|Romance'),(414,'Tuvalu','Motorola','Comedy'),(415,'What Goes Up','LG','Drama'),(416,'Chak De India!','Nokia','Drama'),(417,'Cutie Honey','Motorola','Action'),(418,'Mahler','TCL','Drama'),(419,'Lord of the Rings: The Return of the King, The','Celkon','Action|Adventure|Drama|Fantasy'),(420,'Johnny Dangerously','Vodafone','Comedy'),(421,'Pearl Jam: Immagine in Cornice - Live in Italy 2006','Sony','Documentary|Musical'),(422,'On Her Majesty\'s Secret Service','Samsung','Action|Adventure|Romance|Thriller'),(423,'Subject Was Roses, The','Sharp','Drama'),(424,'90 Minutes (90 minutter)','Amoi','Drama'),(425,'Blind Faith','HTC','Drama'),(426,'Kangaroo Jack','Asus','Action|Comedy'),(427,'Insidious','Acer','Fantasy|Horror|Thriller'),(428,'Wreck of the Mary Deare, The','Bird','Drama|Thriller'),(429,'Sid and Nancy','Infinix','Drama'),(430,'Silent Wedding (Nunta Muta)','Lenovo','Comedy|Drama'),(431,'Groove','Siemens','Drama'),(432,'Guide to Recognizing Your Saints, A','Energizer','Crime|Drama'),(433,'Star Wreck: In the Pirkinning','Nokia','Action|Comedy|Sci-Fi'),(434,'Ms. 45 (a.k.a. Angel of Vengeance)','vivo','Crime|Drama'),(435,'Stalker','Kyocera','Drama|Mystery|Sci-Fi'),(436,'Dumplings (Gaau ji)','Nokia','Drama|Horror|Thriller'),(437,'Abyss, The','Asus','Action|Adventure|Sci-Fi|Thriller'),(438,'Thanks for Sharing','Icemobile','Comedy|Drama'),(439,'Pay It Forward','HTC','Drama'),(440,'Blitz','Samsung','Action|Crime|Thriller'),(441,'Taking Care of Business','Samsung','Comedy'),(442,'Leonard Part 6','Huawei','Comedy|Sci-Fi'),(443,'Rocking Horse Winner, The','Gionee','Drama|Horror'),(444,'Police Academy 5: Assignment: Miami Beach','Samsung','Comedy|Crime'),(445,'All About My Mother (Todo sobre mi madre)','Vodafone','Drama'),(446,'Tales from Earthsea (Gedo Senki)','Telit','Adventure|Animation|Fantasy'),(447,'Love, Wedding, Marriage','BLU','Comedy|Romance'),(448,'Princess Yang Kwei Fei (Yôkihi)','Unnecto','Drama|Romance'),(449,'Inn of the Sixth Happiness, The','Huawei','Adventure|Drama'),(450,'The Orkly Kid','Samsung','Comedy'),(451,'In a Glass Cage (Tras el cristal)','Micromax','Drama|Horror'),(452,'Oxygen','verykool','Drama|Musical'),(453,'Diverted','Motorola','Drama'),(454,'Wildest Dream, The','Huawei','Documentary'),(455,'Saratoga Trunk','Samsung','Drama|Romance'),(456,'Midnight Madness','Micromax','Comedy'),(457,'Dernier Combat, Le (Last Battle, The)','Sagem','Drama|Sci-Fi'),(458,'All the President\'s Men','Prestigio','Drama|Thriller'),(459,'Incredible Melting Man, The','LG','Horror|Sci-Fi'),(460,'Striptease','verykool','Comedy|Crime'),(461,'Black Angel','Lenovo','Drama|Film-Noir|Mystery'),(462,'Xala','Apple','Comedy'),(463,'Big Trouble','Yezz','Comedy|Crime'),(464,'Unlawful Entry','Samsung','Crime|Thriller'),(465,'American Wedding (American Pie 3)','Samsung','Comedy'),(466,'Michael Shayne: Private Detective','Apple','Comedy|Drama|Mystery'),(467,'Whole','Huawei','Documentary'),(468,'Division III: Football\'s Finest','Energizer','Comedy|Romance'),(469,'Ruggles of Red Gap','Acer','Comedy|Romance'),(470,'Junior Prom','Huawei','Documentary'),(471,'White Frog','Samsung','Drama'),(472,'Cat Came Back, The','Micromax','Action|Animation|Comedy'),(473,'My Man Godfrey','Huawei','Comedy|Romance'),(474,'Pete Seeger: The Power of Song','alcatel','Documentary'),(475,'Delirious','HTC','Comedy'),(476,'C.H.U.D.','Samsung','Horror'),(477,'Tree Grows in Brooklyn, A','LG','Drama'),(478,'Hansel & Gretel: Witch Hunters','vivo','Action|Fantasy|Horror|IMAX'),(479,'Bending the Rules','Haier','Action|Drama'),(480,'Dog Problem, The','Motorola','Comedy'),(481,'Grizzly Man','Motorola','Documentary'),(482,'King\'s Speech, The','Meizu','Drama'),(483,'Little Monsters','Motorola','Comedy'),(484,'Keoma','Xiaomi','Action|Drama|Western'),(485,'Flirting With Disaster','Lenovo','Comedy'),(486,'Keeping the Faith','QMobile','Comedy|Drama|Romance'),(487,'Verbo','BLU','Adventure|Fantasy'),(488,'Blue Swallow (Cheong yeon)','LG','Drama|Romance'),(489,'Delta Force 2 (Delta Force 2: The Colombian Connection)','Nokia','Action|Adventure|Thriller|War'),(490,'Gamera the Brave','Huawei','Action|Sci-Fi'),(491,'Gregory Go Boom','Nokia','Comedy'),(492,'Trog','Huawei','Horror|Sci-Fi'),(493,'Boy Upside Down','Samsung','Drama'),(494,'Pardes','alcatel','Action|Comedy|Musical|Romance'),(495,'House of Small Cubes, The (Tsumiki no ie)','LG','Animation|Drama'),(496,'Anne Frank Remembered','Samsung','Documentary'),(497,'Set Me Free (Emporte-moi)','Sharp','Drama'),(498,'Welcome to L.A.','Nokia','Drama|Musical'),(499,'Ingmar Bergman Makes a Movie (Ingmar Bergman gör en film)','Coolpad','Documentary'),(500,'Mr. Troop Mom','Micromax','Children|Comedy'),(501,'Radio Free Albemuth','ZTE','Drama|Sci-Fi'),(502,'War Dance','ZTE','Documentary'),(503,'Sharpe\'s Gold','Allview','Action|Adventure|War'),(504,'Grace of My Heart','HTC','Comedy|Drama'),(505,'Nine Months','Lenovo','Comedy|Romance'),(506,'Jab We Met','Oppo','Comedy|Drama|Romance'),(507,'It\'s in the Water','Archos','Comedy'),(508,'In the Hands of the Gods','Honor','Documentary'),(509,'Tremors 3: Back to Perfection','Sony','Comedy|Horror|Sci-Fi'),(510,'Poison Ivy','Samsung','Drama|Thriller'),(511,'Moonfleet','Vertu','Adventure|Drama'),(512,'Miffo','BenQ-Siemens','Comedy|Drama|Romance'),(513,'Dead of Winter','ZTE','Horror|Thriller'),(514,'Food Stamped','Amoi','Documentary'),(515,'Questo piccolo grande amore','Samsung','Comedy|Romance'),(516,'Hard Times','Eten','Action|Drama'),(517,'Monster, The','Lenovo','Comedy|Horror|Mystery|Sci-Fi'),(518,'The Woodcarver','Lava','Drama'),(519,'Simple-Minded Murder, The (Enfaldige mördaren, Den)','Orange','Drama'),(520,'Sleepwalk with Me','Samsung','Comedy|Drama'),(521,'The Facts of Murder','Asus','Crime|Drama'),(522,'End of St. Petersburg, The (Konets Sankt-Peterburga)','Motorola','Drama'),(523,'Good Evening, Mr. Wallenberg (God afton, Herr Wallenberg)','QMobile','Drama|War'),(524,'Amazon Women on the Moon','Vodafone','Comedy|Sci-Fi'),(525,'Calamity Jane','HTC','Musical|Western'),(526,'Pronto','Philips','Comedy|Crime|Thriller'),(527,'Taking Care of Business','LG','Comedy'),(528,'Christmas in August (Palwolui Christmas)','Lava','Drama|Romance'),(529,'Boy, Did I Get a Wrong Number!','Sewon','Comedy'),(530,'Natural, The','HTC','Drama'),(531,'Madame Sousatzka','Acer','Drama'),(532,'Hell (L\'enfer)','Coolpad','Drama'),(533,'What? (Che?)','Micromax','Comedy'),(534,'Juno and the Paycock','BLU','Drama'),(535,'Oh, God! You Devil','Motorola','Comedy'),(536,'Troll Hunter, The (Trolljegeren)','vivo','Fantasy|Horror'),(537,'Scarlet and the Black, The','LG','Action|Drama|War'),(538,'Handsome Harry','Sagem','Crime|Drama'),(539,'The Adventurers','ZTE','Action|Adventure|Drama'),(540,'Bagdad Cafe (Out of Rosenheim)','Icemobile','Comedy|Drama'),(541,'Intruder, The','Xiaomi','Drama|Mystery|Romance|Thriller'),(542,'Wind Chill','alcatel','Drama|Horror|Thriller'),(543,'Birds, the Bees and the Italians, The (Signore & signori)','Samsung','Comedy'),(544,'Cry_Wolf (a.k.a. Cry Wolf)','Orange','Drama|Horror|Mystery|Thriller'),(545,'Big Bounce, The','O2','Comedy|Crime|Thriller'),(546,'Buccaneer, The','Motorola','Adventure|Drama|Romance|War'),(547,'Summer Hours (Heure d\'été, L\')','alcatel','Drama'),(548,'Hidden Face, The (La cara oculta)','Kyocera','Thriller'),(549,'Race with the Devil','Xiaomi','Action|Horror|Mystery'),(550,'Leaving (Partir)','Micromax','Drama|Romance'),(551,'Young Törless, The (Junge Törless, Der)','Gigabyte','Drama'),(552,'In Like Flint','Apple','Action|Adventure|Comedy'),(553,'Nelly & Monsieur Arnaud','Asus','Drama'),(554,'Mr. Blandings Builds His Dream House','Gigabyte','Comedy'),(555,'Flight of the Navigator','Samsung','Adventure|Children|Sci-Fi'),(556,'Standing Still','Celkon','Comedy|Drama|Romance'),(557,'Crazy People','Kyocera','Comedy'),(558,'United','ZTE','Drama'),(559,'Lucky 7','Samsung','Comedy|Romance'),(560,'Paul','alcatel','Adventure|Comedy|Sci-Fi'),(561,'Russell Peters: Outsourced','Sony','Comedy|Documentary'),(562,'Asterix & Obelix: God Save Britannia (Astérix et Obélix: Au service de Sa Majesté)','Infinix','Adventure|Comedy'),(563,'Drowning Mona','Meizu','Comedy'),(564,'Big White, The','BlackBerry','Comedy|Crime|Drama'),(565,'Undercover Brother','Samsung','Comedy'),(566,'Horseman, The','alcatel','Crime|Thriller'),(567,'Now and Then','Kyocera','Children|Drama'),(568,'Russians Are Coming, the Russians Are Coming, The','Wiko','Comedy|War'),(569,'Without Love','HTC','Comedy|Romance'),(570,'Breaking the Rules','Lava','Comedy|Drama'),(571,'Transcendence','Sony','Drama|Sci-Fi|IMAX'),(572,'Duck Season (Temporada de patos)','Realme','Comedy'),(573,'Occurrence at Owl Creek Bridge, An (La rivière du hibou)','Nokia','Drama|War'),(574,'Hansel & Gretel','Huawei','Horror'),(575,'\'Hellboy\': The Seeds of Creation','Asus','Action|Adventure|Comedy|Documentary|Fantasy'),(576,'The Day That Lasted 21 Years','BLU','Documentary'),(577,'Call of the Wild, The','Nokia','Action|Adventure|Drama|Romance|Western'),(578,'Confiance règne, La','Nokia','Comedy'),(579,'One Tough Cop','Wiko','Action|Crime'),(580,'Outfit, The','QMobile','Crime|Drama|Thriller'),(581,'Winter Passing','Micromax','Drama'),(582,'Afternoon of a Torturer, The (Dupa-amiaza unui tortionar)','BlackBerry','Drama'),(583,'Arsène Lupin','Samsung','Mystery|Romance'),(584,'Summer Magic','Maxwest','Children|Comedy|Musical'),(585,'Year One','QMobile','Adventure|Comedy'),(586,'Hombre','HTC','Western'),(587,'Two Hands','Honor','Comedy|Crime|Thriller'),(588,'Who Killed the Electric Car?','Motorola','Documentary'),(589,'Normal Adolescent Behavior','Samsung','Drama|Romance'),(590,'Billu','Sony','Comedy|Drama|Musical'),(591,'Silver Bullet (Stephen King\'s Silver Bullet)','Samsung','Adventure|Drama|Horror|Mystery|Thriller'),(592,'Dance with the Devil (Perdita Durango)','Lava','Action|Crime|Drama|Romance'),(593,'Deathmaker, The (Totmacher, Der)','ZTE','Crime|Drama'),(594,'State Fair','ZTE','Comedy|Drama|Romance'),(595,'Glitterbug','Huawei','(no genres listed)'),(596,'Next Karate Kid, The','Samsung','Action|Children|Romance'),(597,'Signal, The','Siemens','Horror|Sci-Fi|Thriller'),(598,'Most Beautiful, The (Ichiban utsukushiku)','Sony','Drama'),(599,'WWII IN HD','Celkon','(no genres listed)'),(600,'Man on High Heels','Spice','Action|Comedy'),(601,'Good Burger','verykool','Children|Comedy'),(602,'Buud Yam','Samsung','Drama'),(603,'The Loft','BLU','Thriller'),(604,'Village, The','Sony','Drama|Mystery|Thriller'),(605,'Words and Pictures','Allview','Comedy|Drama|Romance'),(606,'High School Musical 3: Senior Year','Panasonic','Musical'),(607,'Christmas Carol: The Movie','Lava','Animation|Children'),(608,'Silent Partner','Samsung','Action|Mystery|Thriller'),(609,'Iraq for Sale: The War Profiteers','QMobile','Documentary'),(610,'Climate of Change','Ulefone','Documentary'),(611,'The Army','Plum','Drama'),(612,'Princesas','Siemens','Drama'),(613,'King Lear','Maxon','Comedy|Drama|Sci-Fi'),(614,'Three and Out (Deal Is a Deal, A)','Panasonic','Comedy|Drama'),(615,'Doomsday','HTC','Action|Drama|Sci-Fi|Thriller'),(616,'Monterey Pop','LG','Documentary|Musical'),(617,'Üvegtigris','vivo','Comedy'),(618,'Weird Science','Philips','Comedy|Fantasy|Sci-Fi'),(619,'Trick \'r Treat','Micromax','Comedy|Horror|Thriller'),(620,'Tingler, The','LG','Horror'),(621,'Hollywood Canteen','Samsung','Comedy|Musical|Romance'),(622,'Hours, The','LG','Drama|Romance'),(623,'Forger, The','Telit','Drama'),(624,'Red Salute','Lava','Comedy|Romance'),(625,'Murder by Numbers','Samsung','Crime|Thriller'),(626,'Gigot','MWg','Comedy'),(627,'Faster','HTC','Action|Crime|Drama'),(628,'Dream a Little Dream','Apple','Comedy|Drama|Romance'),(629,'Card Player, The (Il cartaio)','alcatel','Crime|Horror|Mystery|Thriller'),(630,'Day, The','Micromax','Drama|Sci-Fi|Thriller'),(631,'Operation Homecoming: Writing the Wartime Experience','Honor','Documentary'),(632,'Mr. Accident','Philips','Comedy'),(633,'Hoosiers (a.k.a. Best Shot)','Huawei','Drama|Romance'),(634,'Basic Instinct','Allview','Crime|Mystery|Thriller'),(635,'Three Fugitives','Oppo','Action|Comedy'),(636,'She-Devil','Spice','Comedy'),(637,'No Highway in the Sky','Samsung','Drama|Thriller'),(638,'Holes in My Shoes','Allview','Documentary'),(639,'Whisper of the Heart (Mimi wo sumaseba)','Haier','Animation|Drama|Romance'),(640,'Aladdin and the King of Thieves','Motorola','Animation|Children|Comedy|Fantasy|Musical|Romance'),(641,'Saturday Night and Sunday Morning','Tecno','Drama'),(642,'Summer\'s Tale, A (Conte d\'été)','XOLO','Comedy|Drama|Romance'),(643,'Che: Part One','HTC','Drama|War'),(644,'Fanny','Pantech','Drama|Romance'),(645,'Equilibrium','Lenovo','Action|Sci-Fi|Thriller'),(646,'Vali','Sony','Action|Drama'),(647,'Food of the Gods II','Asus','Horror|Sci-Fi'),(648,'Great Day in Harlem, A','LG','Documentary'),(649,'Moomins on the Riviera (Muumit Rivieralla)','Honor','Animation|Children|Comedy'),(650,'Shanghai Triad (Yao a yao yao dao waipo qiao)','BLU','Crime|Drama'),(651,'House','Motorola','Drama|Horror|Thriller'),(652,'Eighth Day, The (Den Åttonde dagen)','Mitac','Children|Drama'),(653,'Pennies from Heaven','LG','Musical|Romance'),(654,'Butcher Boys (Bone Boys)','Wiko','Action|Comedy|Horror|Thriller'),(655,'Stuart: A Life Backward','BLU','Drama'),(656,'Notorious Landlady, The','Nokia','Comedy|Mystery'),(657,'Shock','Allview','Film-Noir|Thriller'),(658,'Note by Note: The Making of Steinway L1037','Celkon','Documentary'),(659,'Mater and the Ghostlight','Cat','Animation|Children|Comedy'),(660,'Pardes','LG','Action|Comedy|Musical|Romance'),(661,'Gypsy 83','Lenovo','Drama'),(662,'Prom Night in Mississippi','alcatel','Documentary'),(663,'Eat','Asus','Documentary'),(664,'Judgment at Nuremberg','LG','Drama'),(665,'Last Play at Shea, The','Philips','Documentary|Musical'),(666,'Tormento','WND','Drama'),(667,'Shunning, The','Nokia','Drama'),(668,'Kanal','Asus','Drama|War'),(669,'Dunwich Horror, The','Vodafone','Horror'),(670,'Incendiary','BLU','Drama|Mystery|Romance|Thriller'),(671,'Benji the Hunted','Allview','Adventure|Children'),(672,'Jumbo (Billy Rose\'s Jumbo)','Bird','Comedy|Musical|Romance'),(673,'Saw','Motorola','Horror|Mystery|Thriller'),(674,'Other Woman, The','BenQ-Siemens','Comedy|Romance'),(675,'Big Knife, The','LG','Film-Noir'),(676,'Lair of the White Worm, The','Pantech','Horror'),(677,'Pussy Riot: A Punk Prayer','YU','Documentary'),(678,'Every Day','Micromax','Comedy|Drama'),(679,'Secret World of Arrietty, The (Kari-gurashi no Arietti)','Acer','Animation|Children|Fantasy'),(680,'Human Capital (Il capitale umano)','LG','Drama'),(681,'Blaze','Nokia','Comedy|Drama'),(682,'R','BLU','Drama'),(683,'Thieves (Voleurs, Les)','LG','Crime|Drama|Romance'),(684,'Bomb It','Celkon','Documentary'),(685,'Bigger Than Life','Lava','Drama|Mystery|Thriller'),(686,'She Does Not Drink, Smoke or Flirt But... She Talks','Xiaomi','Comedy'),(687,'Barcelona','Oppo','Comedy|Romance'),(688,'In Passing','Celkon','Drama|Fantasy|Mystery'),(689,'November Man, The','Panasonic','Action|Crime|Thriller'),(690,'State of the Union','Lava','Comedy|Drama'),(691,'Blue Dahlia, The','Sagem','Crime|Drama|Film-Noir|Mystery|Thriller'),(692,'Footloose','verykool','Drama'),(693,'11 Harrowhouse','alcatel','Comedy|Crime'),(694,'Hell\'s Kitchen','Samsung','Drama'),(695,'Lemming','Sagem','Drama|Mystery|Thriller'),(696,'Concepción Arenal, la visitadora de cárceles','alcatel','Drama'),(697,'7 Khoon Maaf','Vodafone','Drama|Mystery|Thriller'),(698,'Bandits (Bandidos)','Yezz','Action|Adventure|War'),(699,'I Remember (Eu Me Lembro)','vivo','Drama'),(700,'Phantom Lover, The (Ye ban ge sheng)','Asus','Drama|Mystery|Romance'),(701,'Dreams of  a Life','QMobile','Documentary'),(702,'Naked Gun 33 1/3: The Final Insult','Spice','Action|Comedy'),(703,'Al-risâlah','verykool','Adventure|Drama|War'),(704,'3-Iron (Bin-jip)','Telit','Drama|Romance'),(705,'Music and Lyrics','BQ','Comedy|Romance'),(706,'Revengers Tragedy','Huawei','Comedy|Horror'),(707,'Melancholia','Celkon','Drama|Sci-Fi'),(708,'Our Summer in Provence','Vodafone','Comedy|Drama'),(709,'Loving You','Samsung','Drama|Musical'),(710,'Mortal Kombat','Asus','Action|Adventure|Fantasy'),(711,'Carmen Jones','Samsung','Drama|Musical'),(712,'Misérables in Concert, Les','Samsung','Drama|Musical'),(713,'Family Thing, A','Samsung','Comedy|Drama'),(714,'Dark, The','Huawei','Horror|Mystery|Thriller'),(715,'Wind Chill','i-mobile','Drama|Horror|Thriller'),(716,'Pruitt-Igoe Myth, The','Samsung','Documentary|Drama'),(717,'Portrait of a Lady, The','Nokia','Drama'),(718,'Union, The','Celkon','Documentary'),(719,'Internship, The','Apple','Comedy'),(720,'Babylon 5: The Gathering','verykool','Sci-Fi'),(721,'Cujo','LG','Horror|Thriller'),(722,'Moon Over Parador','Philips','Comedy'),(723,'Sunburn','Allview','Action|Comedy|Crime'),(724,'Criminal Lovers','alcatel','Crime|Drama|Romance|Thriller'),(725,'Godzilla\'s Revenge (Gojira-Minira-Gabara: Oru Kaijû Daishingeki) (All Monsters Attack)','Spice','Children'),(726,'Tin Pan Alley','Apple','Drama|Musical|Romance'),(727,'Finding Vivian Maier','Lava','Documentary'),(728,'I Saw the Sun (Günesi gördüm)','HTC','Drama'),(729,'Zatoichi and the Chess Expert (Zatôichi Jigoku tabi) (Zatôichi 12)','Lenovo','Action|Drama'),(730,'Junior Bonner','Eten','Comedy|Drama|Western'),(731,'So Long Letty','Samsung','Comedy|Musical'),(732,'Hunters, The','Dell','Drama|War'),(733,'Adventures of Robin Hood, The','LG','Action|Adventure|Romance'),(734,'Hardcore','Pantech','Crime|Drama'),(735,'Mr. Saturday Night','Motorola','Comedy|Drama'),(736,'Unprecedented: The 2000 Presidential Election','Siemens','Documentary'),(737,'Kill for Me','Honor','Drama|Thriller'),(738,'Firm, The','Motorola','Drama'),(739,'Nomad (Köshpendiler)','Celkon','Drama|War'),(740,'Set-Up, The','Sony','Drama|Film-Noir|Romance'),(741,'Vamp','Allview','Comedy|Horror'),(742,'Half Life of Timofey Berezin, The (PU-239)','alcatel','Drama'),(743,'Empty Mirror, The','Oppo','Drama'),(744,'Devil\'s Knot','Philips','Crime|Drama|Thriller'),(745,'Think Fast, Mr. Moto','Allview','Crime|Drama|Mystery|Thriller'),(746,'Christmas Carol, A (Scrooge)','Samsung','Drama|Fantasy'),(747,'\'R Xmas','Apple','Crime|Drama'),(748,'Along the Ridge (Anche libero va bene)','T-Mobile','Drama'),(749,'Kandahar (Safar e Ghandehar)','Sendo','Drama'),(750,'Geography Club','Plum','Comedy|Drama|Romance'),(751,'Garbage Warrior','Lenovo','Documentary'),(752,'Last Run','Ericsson','Action|Crime|Thriller'),(753,'Back to the Secret Garden','Siemens','Adventure|Children|Fantasy'),(754,'In the Edges: The \'Grizzly Man\' Session ','verykool','Documentary'),(755,'Birdman','Nokia','Comedy|Drama'),(756,'39 Steps, The','Panasonic','Drama|Mystery|Thriller'),(757,'Embracing','Celkon','Documentary'),(758,'Earth Trembles, The (Terra trema: Episodio del mare, La)','Gigabyte','Drama'),(759,'O Brother, Where Art Thou?','Allview','Adventure|Comedy|Crime'),(760,'Tomb of Ligeia, The','NEC','Horror'),(761,'Short Film About John Bolton, A','HP','Fantasy|Horror|Mystery'),(762,'Hundred-Foot Journey, The','XOLO','Drama'),(763,'Born in Flames','Energizer','Comedy|Drama|Fantasy|Sci-Fi'),(764,'Poison','Gigabyte','Comedy'),(765,'Margaret','Huawei','Drama'),(766,'Looking Forward','BLU','Drama'),(767,'Lambada','LG','Drama'),(768,'Asylum Blackout','vivo','Horror|Thriller'),(769,'Decampitated','LG','Comedy|Horror'),(770,'Thing, The','Sonim','Horror|Mystery|Sci-Fi|Thriller'),(771,'Goodbye, South, Goodbye (Nan guo zai jian, nan guo)','NIU','Crime|Drama'),(772,'Trick','QMobile','Action|Crime'),(773,'Puppet Master vs. Demonic Toys (Puppet Master 9)','Huawei','Comedy|Fantasy|Horror|Sci-Fi|Thriller'),(774,'Pride and Prejudice','Sewon','Comedy|Drama|Romance'),(775,'Topo, El','BLU','Fantasy|Western'),(776,'White Reindeer, The (Valkoinen peura)','LG','Drama|Fantasy|Horror'),(777,'And the Pursuit of Happiness (La poursuite du bonheur)','Huawei','Documentary'),(778,'The Devil and the Holy Water','Wiko','Comedy'),(779,'Burnt Money (Plata Quemada)','Lava','Action|Crime|Drama|Romance|Thriller'),(780,'Harvie Krumpet','Xiaomi','Animation|Comedy|Drama'),(781,'Arabesque','Huawei','Adventure|Drama|Romance|Thriller'),(782,'God is Great, I\'m Not (Dieu est grand, je suis toute petite)','Haier','Comedy|Romance'),(783,'Jonathan Livingston Seagull','Asus','Drama'),(784,'Bullies','Tecno','Action|Drama|Thriller'),(785,'Life of Aleksis Kivi, The (Aleksis Kiven elämä)','Toshiba','Drama'),(786,'The Harmony Game','Samsung','Documentary'),(787,'Hello Down There','Sagem','Comedy|Sci-Fi'),(788,'Cannery Row','Prestigio','Drama'),(789,'Wind Chill','Amoi','Drama|Horror|Thriller'),(790,'National Security','Samsung','Action|Comedy'),(791,'Music Man, The','Asus','Children|Comedy|Musical|Romance'),(792,'Donner Pass','LG','Horror'),(793,'Lover\'s Knot','alcatel','Comedy'),(794,'Trailer Park of Terror','Plum','Horror|Thriller'),(795,'Meet the Parents','Samsung','Comedy'),(796,'Trick','Nokia','Action|Crime'),(797,'The Lego Movie','Honor','Action|Adventure|Animation|Children|Comedy|Fantasy'),(798,'Cell Count','Motorola','Horror|Sci-Fi'),(799,'Old Joy','Acer','Drama'),(800,'Common Threads: Stories from the Quilt','BLU','Documentary'),(801,'Television Under the Swastika (Das Fernsehen unter dem Hakenkreuz)','LG','Documentary'),(802,'Lisbela e o Prisioneiro (Lisbela and the Prisoner)','Apple','Comedy|Romance'),(803,'Hunter, The','Apple','Thriller'),(804,'Flaming Creatures','Nokia','Drama'),(805,'Paperboy, The','Nokia','Thriller'),(806,'Miguel and William (Miguel y William)','Lenovo','Comedy|Romance'),(807,'Naked City, The','Samsung','Crime|Drama|Film-Noir|Mystery'),(808,'Key Largo','Samsung','Crime|Drama|Film-Noir|Thriller'),(809,'Return of Swamp Thing, The','Allview','Comedy|Horror|Sci-Fi'),(810,'Canon','Intex','Animation'),(811,'Gojoe: Spirit War Chronicle (Gojo reisenki: Gojoe)','Panasonic','Drama'),(812,'My Gun is Quick','Sagem','Mystery'),(813,'Princess Raccoon (Operetta tanuki goten)','Asus','Comedy|Fantasy|Musical|Romance'),(814,'Ice Men','Samsung','Drama'),(815,'Almost You','Pantech','Comedy|Drama'),(816,'Adventures of Don Juan','Vodafone','Adventure|Romance'),(817,'What the Day Owes the Night','BLU','Drama|Romance'),(818,'Mean Girls','Samsung','Comedy'),(819,'Tokyo!','Toshiba','Drama'),(820,'Bridge to Terabithia','Lenovo','Adventure|Children|Fantasy'),(821,'Black Rose Ascension (Kurobara shôten)','Celkon','Drama'),(822,'New Police Story (Xin jing cha gu shi)','Lava','Action|Crime|Drama'),(823,'Shadow of the Holy Book (Pyhän kirjan varjo)','Samsung','Documentary'),(824,'Silent Night','Xiaomi','Horror'),(825,'War Is Over, The (Guerre est finie, La)','BQ','Drama'),(826,'Eyes Wide Shut','Gionee','Drama|Mystery|Thriller'),(827,'Disfigured','Lenovo','Drama'),(828,'This Boy\'s Life','Spice','Drama'),(829,'Latitudes','ZTE','Drama|Romance'),(830,'Blackout','vivo','Action|Thriller'),(831,'Extreme Measures','Huawei','Drama|Thriller'),(832,'Get Out of My Room','Motorola','Comedy'),(833,'Vamps','Samsung','Comedy|Horror|Romance'),(834,'Leopard Man, The','T-Mobile','Drama|Horror|Mystery|Thriller'),(835,'The Count of Monte Cristo','Huawei','Adventure|Drama|Romance'),(836,'Six of a Kind','Xiaomi','Comedy'),(837,'Harold & Kumar Escape from Guantanamo Bay','Coolpad','Adventure|Comedy'),(838,'Delivery Man','Maxwest','Comedy'),(839,'Eternal Sunshine of the Spotless Mind','BlackBerry','Drama|Romance|Sci-Fi'),(840,'A-Haunting We Will Go','Yezz','Comedy'),(841,'Taking Off','Samsung','Comedy|Drama'),(842,'Sexual Dependency (Dependencia sexual)','Meizu','Drama'),(843,'Mudge Boy, The','ZTE','Drama'),(844,'Mercury Rising','Meizu','Action|Drama|Thriller'),(845,'Man of the West','Samsung','Western'),(846,'Cranes Are Flying, The (Letyat zhuravli)','Ulefone','Drama|Romance|War'),(847,'Gettysburg','BQ','Drama|War'),(848,'Seven Brides for Seven Brothers','Celkon','Comedy|Musical|Romance|Western'),(849,'Rocky Saga: Going the Distance, The','Huawei','Documentary'),(850,'War Room, The','Samsung','Documentary'),(851,'Saving Sarah Cain','vivo','Drama'),(852,'Quackser Fortune Has a Cousin in the Bronx','BLU','Comedy|Drama|Romance'),(853,'Snow Cake','Spice','Drama'),(854,'Carmen Jones','alcatel','Drama|Musical'),(855,'At Middleton','Nokia','Comedy|Romance'),(856,'Criminal Life of Archibaldo de la Cruz, The (Ensayo de un crimen)','Philips','Comedy|Crime|Drama'),(857,'Last Man, The','Spice','Comedy|Romance|Sci-Fi'),(858,'Eminem AKA ','Spice','Documentary'),(859,'Ondine','Motorola','Drama|Fantasy|Romance'),(860,'Won Ton Ton: The Dog Who Saved Hollywood','QMobile','Comedy'),(861,'By the Pricking of My Thumbs (Mon petit doigt m\'a dit...)','Huawei','Comedy|Mystery'),(862,'Burden of Dreams','Samsung','Documentary'),(863,'Glory to the Filmmaker! (Kantoku · Banzai!)','LG','Comedy|Drama'),(864,'Diana Vreeland: The Eye Has to Travel','Samsung','Documentary'),(865,'Bilitis','Samsung','Drama|Romance'),(866,'This Girl\'s Life','verykool','Drama'),(867,'Ceremony','Cat','Comedy'),(868,'Talhotblond:','Samsung','Documentary|Thriller'),(869,'Nina Takes a Lover','Lenovo','Comedy|Romance'),(870,'Mahabharata, The','Gionee','Action|Drama|War'),(871,'Thirst (Bakjwi)','Nokia','Drama|Horror'),(872,'Bloodbrothers','Philips','Drama'),(873,'Champ, The','Samsung','Drama'),(874,'Fullmetal Alchemist the Movie: Conqueror of Shamballa (Gekijô-ban hagane no renkinjutsushi: Shanbara wo yuku mono)','Siemens','Action|Adventure|Animation|Drama'),(875,'Heart and Souls','Samsung','Comedy|Fantasy'),(876,'Toys','Prestigio','Comedy|Fantasy'),(877,'Mea Maxima Culpa: Silence in the House of God','LG','Documentary'),(878,'War Game, The','Huawei','Documentary|Drama|War'),(879,'Secret of NIMH 2: Timmy to the Rescue, The','Siemens','Adventure|Animation|Children|Musical'),(880,'Walk the Line','QMobile','Drama|Musical|Romance'),(881,'Little Engine That Could, The','alcatel','Animation|Children'),(882,'Simpsons Movie, The','Gionee','Animation|Comedy'),(883,'Corridor, The (Koridorius)','Xiaomi','Drama'),(884,'Farsan','Samsung','Comedy'),(885,'God Is the Bigger Elvis','ZTE','Documentary'),(886,'Remo Williams: The Adventure Begins','Motorola','Action|Comedy|Crime|Thriller'),(887,'Liz & Dick ','alcatel','Drama'),(888,'Praise','Samsung','Drama'),(889,'Chances Are','Xiaomi','Comedy|Romance'),(890,'Whatever It Takes','verykool','Comedy|Romance'),(891,'Blind (Beul-la-in-deu)','LG','Drama|Horror|Thriller'),(892,'Who Is Cletis Tout?','Samsung','Comedy'),(893,'Little Fridolf Becomes a Grandfather','Siemens','Comedy'),(894,'My Wife, A Body to Love','Nokia','(no genres listed)'),(895,'Into the Sun','Samsung','Action|Adventure|Thriller'),(896,'Brooklyn','Motorola','Comedy|Drama|Romance'),(897,'Om Shanti Om','Spice','Action|Drama|Musical|Romance'),(898,'Slipper and the Rose, The','Allview','Adventure|Musical|Romance'),(899,'Wing and the Thigh, The (L\'aile ou la cuisse)','Lenovo','Comedy'),(900,'She\'s the Man','HTC','Comedy|Romance'),(901,'In Harm\'s Way','ZTE','Drama|War'),(902,'Puppet Master 4','Pantech','Horror|Sci-Fi|Thriller'),(903,'No Time for Nuts','Oppo','Adventure|Animation|Comedy'),(904,'Helter Skelter','Nokia','Crime|Drama|Thriller'),(905,'No Logo','Yezz','Documentary'),(906,'Camp','LG','Comedy|Musical'),(907,'4:44 Last Day on Earth','Lenovo','Drama|Fantasy|Sci-Fi'),(908,'America\'s Sweethearts','Motorola','Comedy|Romance'),(909,'Tuvalu','Motorola','Comedy'),(910,'What Goes Up','LG','Drama'),(911,'Chak De India!','Nokia','Drama'),(912,'Cutie Honey','Motorola','Action'),(913,'Mahler','TCL','Drama'),(914,'Lord of the Rings: The Return of the King, The','Celkon','Action|Adventure|Drama|Fantasy'),(915,'Johnny Dangerously','Vodafone','Comedy'),(916,'Pearl Jam: Immagine in Cornice - Live in Italy 2006','Sony','Documentary|Musical'),(917,'On Her Majesty\'s Secret Service','Samsung','Action|Adventure|Romance|Thriller'),(918,'Subject Was Roses, The','Sharp','Drama'),(919,'90 Minutes (90 minutter)','Amoi','Drama'),(920,'Blind Faith','HTC','Drama'),(921,'Kangaroo Jack','Asus','Action|Comedy'),(922,'Insidious','Acer','Fantasy|Horror|Thriller'),(923,'Wreck of the Mary Deare, The','Bird','Drama|Thriller'),(924,'Sid and Nancy','Infinix','Drama'),(925,'Silent Wedding (Nunta Muta)','Lenovo','Comedy|Drama'),(926,'Groove','Siemens','Drama'),(927,'Guide to Recognizing Your Saints, A','Energizer','Crime|Drama'),(928,'Star Wreck: In the Pirkinning','Nokia','Action|Comedy|Sci-Fi'),(929,'Ms. 45 (a.k.a. Angel of Vengeance)','vivo','Crime|Drama'),(930,'Stalker','Kyocera','Drama|Mystery|Sci-Fi'),(931,'Dumplings (Gaau ji)','Nokia','Drama|Horror|Thriller'),(932,'Abyss, The','Asus','Action|Adventure|Sci-Fi|Thriller'),(933,'Thanks for Sharing','Icemobile','Comedy|Drama'),(934,'Pay It Forward','HTC','Drama'),(935,'Blitz','Samsung','Action|Crime|Thriller'),(936,'Taking Care of Business','Samsung','Comedy'),(937,'Leonard Part 6','Huawei','Comedy|Sci-Fi'),(938,'Rocking Horse Winner, The','Gionee','Drama|Horror'),(939,'Police Academy 5: Assignment: Miami Beach','Samsung','Comedy|Crime'),(940,'All About My Mother (Todo sobre mi madre)','Vodafone','Drama'),(941,'Tales from Earthsea (Gedo Senki)','Telit','Adventure|Animation|Fantasy'),(942,'Love, Wedding, Marriage','BLU','Comedy|Romance'),(943,'Princess Yang Kwei Fei (Yôkihi)','Unnecto','Drama|Romance'),(944,'Inn of the Sixth Happiness, The','Huawei','Adventure|Drama'),(945,'The Orkly Kid','Samsung','Comedy'),(946,'In a Glass Cage (Tras el cristal)','Micromax','Drama|Horror'),(947,'Oxygen','verykool','Drama|Musical'),(948,'Diverted','Motorola','Drama'),(949,'Wildest Dream, The','Huawei','Documentary'),(950,'Saratoga Trunk','Samsung','Drama|Romance'),(951,'Midnight Madness','Micromax','Comedy'),(952,'Dernier Combat, Le (Last Battle, The)','Sagem','Drama|Sci-Fi'),(953,'All the President\'s Men','Prestigio','Drama|Thriller'),(954,'Incredible Melting Man, The','LG','Horror|Sci-Fi'),(955,'Striptease','verykool','Comedy|Crime'),(956,'Black Angel','Lenovo','Drama|Film-Noir|Mystery'),(957,'Xala','Apple','Comedy'),(958,'Big Trouble','Yezz','Comedy|Crime'),(959,'Unlawful Entry','Samsung','Crime|Thriller'),(960,'American Wedding (American Pie 3)','Samsung','Comedy'),(961,'Michael Shayne: Private Detective','Apple','Comedy|Drama|Mystery'),(962,'Whole','Huawei','Documentary'),(963,'Division III: Football\'s Finest','Energizer','Comedy|Romance'),(964,'Ruggles of Red Gap','Acer','Comedy|Romance'),(965,'Junior Prom','Huawei','Documentary'),(966,'White Frog','Samsung','Drama'),(967,'Cat Came Back, The','Micromax','Action|Animation|Comedy'),(968,'My Man Godfrey','Huawei','Comedy|Romance'),(969,'Pete Seeger: The Power of Song','alcatel','Documentary'),(970,'Delirious','HTC','Comedy'),(971,'C.H.U.D.','Samsung','Horror'),(972,'Tree Grows in Brooklyn, A','LG','Drama'),(973,'Hansel & Gretel: Witch Hunters','vivo','Action|Fantasy|Horror|IMAX'),(974,'Bending the Rules','Haier','Action|Drama'),(975,'Dog Problem, The','Motorola','Comedy'),(976,'Grizzly Man','Motorola','Documentary'),(977,'King\'s Speech, The','Meizu','Drama'),(978,'Little Monsters','Motorola','Comedy'),(979,'Keoma','Xiaomi','Action|Drama|Western'),(980,'Flirting With Disaster','Lenovo','Comedy'),(981,'Keeping the Faith','QMobile','Comedy|Drama|Romance'),(982,'Verbo','BLU','Adventure|Fantasy'),(983,'Blue Swallow (Cheong yeon)','LG','Drama|Romance'),(984,'Delta Force 2 (Delta Force 2: The Colombian Connection)','Nokia','Action|Adventure|Thriller|War'),(985,'Gamera the Brave','Huawei','Action|Sci-Fi'),(986,'Gregory Go Boom','Nokia','Comedy'),(987,'Trog','Huawei','Horror|Sci-Fi'),(988,'Boy Upside Down','Samsung','Drama'),(989,'Pardes','alcatel','Action|Comedy|Musical|Romance'),(990,'House of Small Cubes, The (Tsumiki no ie)','LG','Animation|Drama');
/*!40000 ALTER TABLE `juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediosdepago`
--

DROP TABLE IF EXISTS `mediosdepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediosdepago` (
  `IDMEDIODEPAGO` int NOT NULL AUTO_INCREMENT,
  `IDPEDIDO` int DEFAULT NULL,
  `VISA` varchar(300) DEFAULT NULL,
  `MASTERCARD` varchar(300) DEFAULT NULL,
  `AMEX` varchar(300) DEFAULT NULL,
  `TRANSFERENCIABANCARIA` varchar(300) DEFAULT NULL,
  `TRANSFERENCIAMERCADOPAGO` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`IDMEDIODEPAGO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediosdepago`
--

LOCK TABLES `mediosdepago` WRITE;
/*!40000 ALTER TABLE `mediosdepago` DISABLE KEYS */;
INSERT INTO `mediosdepago` VALUES (1,NULL,'4065-2530-1830','4172-2880-6020','4872-2410-6030','2918',' 547'),(2,NULL,'4065-2530-1830','4172-2880-6020','4872-2410-6030','2918',' 547');
/*!40000 ALTER TABLE `mediosdepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `IDPEDIDO` int NOT NULL AUTO_INCREMENT,
  `IDFACTURA` int DEFAULT NULL,
  `IDCLIENTE` int DEFAULT NULL,
  `IDJUEGO` int DEFAULT NULL,
  `IDEMPLEADO` int DEFAULT NULL,
  `IDMEDIODEPAGO` int DEFAULT NULL,
  `IDPROMOCION` int DEFAULT NULL,
  `FECHA` datetime DEFAULT NULL,
  `NUMEROPEDIDO` int DEFAULT NULL,
  `PRODUCTO` int DEFAULT NULL,
  `CANTIDAD` int DEFAULT NULL,
  `CANCELACION` datetime DEFAULT NULL,
  PRIMARY KEY (`IDPEDIDO`),
  KEY `FK_PEDIDO_FACTURA` (`IDFACTURA`),
  KEY `FK_PEDIDO_CLIENTE` (`IDCLIENTE`),
  KEY `FK_PEDIDO_JUEGO` (`IDJUEGO`),
  KEY `FK_PEDIDO_EMPLEADO` (`IDEMPLEADO`),
  CONSTRAINT `FK_PEDIDO_CLIENTE` FOREIGN KEY (`IDCLIENTE`) REFERENCES `cliente` (`IDCLIENTE`),
  CONSTRAINT `FK_PEDIDO_EMPLEADO` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`),
  CONSTRAINT `FK_PEDIDO_FACTURA` FOREIGN KEY (`IDFACTURA`) REFERENCES `factura` (`IDFACTURA`),
  CONSTRAINT `FK_PEDIDO_JUEGO` FOREIGN KEY (`IDJUEGO`) REFERENCES `juego` (`IDJUEGO`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-03 02:14:53',5913593,437420487,13,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-19 19:23:45',434060004,4093505,19,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-12 18:11:31',54305909,52125618,4,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-07 14:06:14',650444812,52641300,16,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-09 07:43:39',11564002,492880592,6,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-04 04:52:07',68084480,55390391,19,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-26 17:47:20',65841626,4096141,3,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-19 16:59:21',369871819,51345109,6,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-16 17:51:23',7812167,605050033,3,NULL),(10,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-06 05:15:49',59115089,6031587,19,NULL),(11,NULL,NULL,NULL,NULL,NULL,NULL,'2023-10-20 20:02:18',551545740,538080831,2,NULL),(12,NULL,NULL,NULL,NULL,NULL,NULL,'2024-07-19 17:07:14',645250549,61077038,7,NULL),(13,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-21 10:15:23',64980302,1130110,1,NULL),(14,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-30 00:58:37',9045832,59970176,1,NULL),(15,NULL,NULL,NULL,NULL,NULL,NULL,'2024-07-19 01:54:23',650441342,63187032,2,NULL),(16,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-26 08:43:15',37205617,780438,8,NULL),(17,NULL,NULL,NULL,NULL,NULL,NULL,'2023-09-04 11:26:44',11701025,540290,3,NULL),(18,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-19 22:11:59',621850006,575200327,17,NULL),(19,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-07 05:28:18',42211203,548684254,13,NULL),(20,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-08 20:45:41',937244,626704403,20,NULL),(21,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-08 11:04:21',489513101,47593362,20,NULL),(22,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-01 19:12:15',9045847,24236166,12,NULL),(23,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-12 22:56:58',50438106,504369988,10,NULL),(24,NULL,NULL,NULL,NULL,NULL,NULL,'2024-07-16 07:36:14',43063122,538080768,12,NULL),(25,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-10 09:05:50',7034014,35356946,10,NULL),(26,NULL,NULL,NULL,NULL,NULL,NULL,'2023-10-13 09:51:02',4092596,543730,2,NULL),(27,NULL,NULL,NULL,NULL,NULL,NULL,'2024-04-20 09:03:01',49035127,76328332,5,NULL),(28,NULL,NULL,NULL,NULL,NULL,NULL,'2023-10-22 15:12:03',68647112,687889831,16,NULL),(29,NULL,NULL,NULL,NULL,NULL,NULL,'2024-07-25 12:29:11',3014167,37808047,20,NULL),(30,NULL,NULL,NULL,NULL,NULL,NULL,'2023-09-29 23:56:48',6031587,55316666,16,NULL),(31,NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-07 00:11:25',68220022,35356387,1,NULL),(32,NULL,NULL,NULL,NULL,NULL,NULL,'2024-07-15 19:27:05',369871751,52584418,4,NULL),(33,NULL,NULL,NULL,NULL,NULL,NULL,'2023-10-23 08:37:20',515140304,43345004,11,NULL),(34,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-05 14:07:10',636293545,4407465,19,NULL),(35,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-10 14:44:33',37000065,98132124,12,NULL),(36,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-24 01:18:12',636291528,63667503,12,NULL),(37,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-18 23:24:30',7815283,49483328,20,NULL),(38,NULL,NULL,NULL,NULL,NULL,NULL,'2023-11-05 00:33:19',575200094,551546877,7,NULL),(39,NULL,NULL,NULL,NULL,NULL,NULL,'2023-11-30 05:27:14',37000251,76123120,15,NULL),(40,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-20 09:56:55',655882210,437420020,4,NULL),(41,NULL,NULL,NULL,NULL,NULL,NULL,'2023-10-29 04:30:25',63776450,548685663,17,NULL),(42,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-14 16:04:19',37012550,63323386,14,NULL),(43,NULL,NULL,NULL,NULL,NULL,NULL,'2023-11-14 07:43:53',492880381,43419855,17,NULL),(44,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-22 00:17:18',489511061,492880649,14,NULL),(45,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-03 03:05:39',4097077,545690199,16,NULL),(46,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-26 16:19:30',55289055,42291711,3,NULL),(47,NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-11 15:33:49',30056006,55319069,1,NULL),(48,NULL,NULL,NULL,NULL,NULL,NULL,'2023-09-12 20:00:53',33342045,66116428,3,NULL),(49,NULL,NULL,NULL,NULL,NULL,NULL,'2023-09-20 00:22:13',557144430,687889951,8,NULL),(50,NULL,NULL,NULL,NULL,NULL,NULL,'2023-09-10 19:59:05',59011420,50021237,20,NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pedidoporcliente`
--

DROP TABLE IF EXISTS `pedidoporcliente`;
/*!50001 DROP VIEW IF EXISTS `pedidoporcliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pedidoporcliente` AS SELECT 
 1 AS `Cliente`,
 1 AS `TotalPedidoPorCliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pedidosporfecha`
--

DROP TABLE IF EXISTS `pedidosporfecha`;
/*!50001 DROP VIEW IF EXISTS `pedidosporfecha`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pedidosporfecha` AS SELECT 
 1 AS `Fecha`,
 1 AS `TotalPedidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `IDPROMOCION` int NOT NULL AUTO_INCREMENT,
  `IDPEDIDO` int DEFAULT NULL,
  `NOMBREDEPROMOCION` varchar(300) DEFAULT NULL,
  `DESCUENTO` int DEFAULT NULL,
  PRIMARY KEY (`IDPROMOCION`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,NULL,'DiaGamer',20),(2,NULL,'DiaGamer',20);
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores_de_juegos`
--

DROP TABLE IF EXISTS `proveedores_de_juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores_de_juegos` (
  `IDPROVEEDORES` int NOT NULL AUTO_INCREMENT,
  `IDJUEGO` int DEFAULT NULL,
  `EMPRESAPROVEEDORA` varchar(300) DEFAULT NULL,
  `NOMBREPROVEEDOR` varchar(300) DEFAULT NULL,
  `APELLIDOPROVEEDOR` varchar(300) DEFAULT NULL,
  `EMAILPROVEEDOR` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`IDPROVEEDORES`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores_de_juegos`
--

LOCK TABLES `proveedores_de_juegos` WRITE;
/*!40000 ALTER TABLE `proveedores_de_juegos` DISABLE KEYS */;
INSERT INTO `proveedores_de_juegos` VALUES (1,NULL,' JuegosOnLine','Franco','Gomez','francogomez@gmail.com'),(2,NULL,' JuegosPepito','Marcos','Oscar','moscar@hotmail.com'),(3,NULL,' JuegosOnLine','Franco','Gomez','francogomez@gmail.com'),(4,NULL,' JuegosPepito','Marcos','Oscar','moscar@hotmail.com');
/*!40000 ALTER TABLE `proveedores_de_juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'proyecto_pedidos'
--

--
-- Dumping routines for database 'proyecto_pedidos'
--
/*!50003 DROP FUNCTION IF EXISTS `contar_pedidos_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `contar_pedidos_cliente`(cliente_id INT, fecha_inicio DATETIME, fecha_fin DATETIME) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE pedidos_count INT;

    SELECT COUNT(*) INTO pedidos_count
    FROM PEDIDO
    WHERE IDCLIENTE = cliente_id
    AND FECHA >= fecha_inicio
    AND FECHA <= fecha_fin;

    RETURN pedidos_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_listado_pedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_listado_pedidos`()
BEGIN
	SELECT *   FROM PROYECTO_PEDIDOS.PEDIDO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `pedidoporcliente`
--

/*!50001 DROP VIEW IF EXISTS `pedidoporcliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedidoporcliente` AS select `pedido`.`IDCLIENTE` AS `Cliente`,count(0) AS `TotalPedidoPorCliente` from `pedido` group by `pedido`.`IDCLIENTE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pedidosporfecha`
--

/*!50001 DROP VIEW IF EXISTS `pedidosporfecha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedidosporfecha` AS select cast(`pedido`.`FECHA` as date) AS `Fecha`,count(0) AS `TotalPedidos` from `pedido` group by cast(`pedido`.`FECHA` as date) */;
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

-- Dump completed on 2024-08-30 13:53:51
