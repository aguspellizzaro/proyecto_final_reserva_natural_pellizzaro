CREATE DATABASE  IF NOT EXISTS `reservas_naturales` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `reservas_naturales`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: reservas_naturales
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `animales`
--

DROP TABLE IF EXISTS `animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animales` (
  `id_animal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_fallecimiento` date DEFAULT NULL,
  `peso` decimal(10,2) DEFAULT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  `id_especie` int NOT NULL,
  `id_genero` int NOT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `fk_animales_especie` (`id_especie`),
  KEY `fk_animales_genero` (`id_genero`),
  KEY `idx_animales_nombre` (`nombre`),
  CONSTRAINT `fk_animales_especie` FOREIGN KEY (`id_especie`) REFERENCES `especies` (`id_especie`),
  CONSTRAINT `fk_animales_genero` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animales`
--

LOCK TABLES `animales` WRITE;
/*!40000 ALTER TABLE `animales` DISABLE KEYS */;
INSERT INTO `animales` VALUES (1,'Tigre1','2010-05-15',NULL,200.50,1.20,1,1),(2,'Tigre2','2012-07-20',NULL,180.00,1.10,1,2),(3,'Elefante1','2005-03-10',NULL,3000.00,3.00,2,1),(4,'León1','2015-09-25',NULL,190.00,1.00,3,1),(5,'León2','2016-02-12',NULL,180.00,0.90,3,2),(6,'Elefante2','2010-12-01',NULL,2800.00,2.80,2,2),(7,'Tigre3','2011-08-30',NULL,190.00,1.00,1,1),(8,'Cebra1','2013-10-20',NULL,200.00,1.50,4,1),(9,'Cebra2','2014-01-15',NULL,190.00,1.40,4,2),(10,'Jirafa1','2010-07-01',NULL,1500.00,5.50,5,1),(11,'Jirafa2','2012-09-05',NULL,1400.00,5.30,5,2),(12,'Puma1','2015-04-10',NULL,70.00,0.80,6,1),(13,'Puma2','2016-06-20',NULL,65.00,0.70,6,2),(14,'Jaguar1','2014-03-15',NULL,90.00,0.90,7,1),(15,'Jaguar2','2015-05-25',NULL,85.00,0.80,7,2),(16,'Gorila1','2008-12-12',NULL,180.00,1.70,8,1),(17,'Gorila2','2010-02-18',NULL,170.00,1.60,8,2),(18,'PavoReal1','2019-06-05',NULL,5.00,0.40,9,1),(19,'PavoReal2','2020-08-10',NULL,4.50,0.40,9,2),(20,'Avestruz1','2017-04-01',NULL,100.00,2.00,10,1),(21,'Avestruz2','2018-05-15',NULL,95.00,1.90,10,2);
/*!40000 ALTER TABLE `animales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animales_por_habitats`
--

DROP TABLE IF EXISTS `animales_por_habitats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animales_por_habitats` (
  `id_animal` int NOT NULL,
  `id_habitat` int NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id_animal`,`id_habitat`),
  KEY `fk_animales_por_habitats_habitat` (`id_habitat`),
  CONSTRAINT `fk_animales_por_habitats_animal` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`),
  CONSTRAINT `fk_animales_por_habitats_habitat` FOREIGN KEY (`id_habitat`) REFERENCES `habitats` (`id_habitat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animales_por_habitats`
--

LOCK TABLES `animales_por_habitats` WRITE;
/*!40000 ALTER TABLE `animales_por_habitats` DISABLE KEYS */;
INSERT INTO `animales_por_habitats` VALUES (1,1,'2014-01-01'),(2,1,'2015-03-01'),(3,2,'2016-06-15'),(4,2,'2017-08-01'),(5,3,'2018-10-15'),(6,3,'2019-12-01'),(7,1,'2020-02-15'),(8,1,'2021-04-01'),(9,4,'2014-05-01'),(10,4,'2015-07-01'),(11,5,'2016-08-01'),(12,5,'2017-10-01'),(13,5,'2018-11-01'),(14,5,'2019-12-01'),(15,5,'2020-01-01'),(16,5,'2021-02-01'),(17,5,'2022-03-01'),(18,5,'2023-04-01'),(19,5,'2024-05-01'),(20,5,'2025-06-01');
/*!40000 ALTER TABLE `animales_por_habitats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuidadores`
--

DROP TABLE IF EXISTS `cuidadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuidadores` (
  `id_cuidador` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cuidador`),
  KEY `fk_cuidadores_persona` (`id_persona`),
  CONSTRAINT `fk_cuidadores_persona` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuidadores`
--

LOCK TABLES `cuidadores` WRITE;
/*!40000 ALTER TABLE `cuidadores` DISABLE KEYS */;
INSERT INTO `cuidadores` VALUES (1,1,'2010-01-01','Felinos'),(2,2,'2012-03-15','Grandes herbívoros'),(3,3,'2015-06-01','Aves'),(4,4,'2018-09-01','Primates');
/*!40000 ALTER TABLE `cuidadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuidadores_por_habitats`
--

DROP TABLE IF EXISTS `cuidadores_por_habitats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuidadores_por_habitats` (
  `id_cuidador` int NOT NULL,
  `id_habitat` int NOT NULL,
  PRIMARY KEY (`id_cuidador`,`id_habitat`),
  KEY `fk_cuidadores_por_habitats_habitat` (`id_habitat`),
  CONSTRAINT `fk_cuidadores_por_habitats_cuidador` FOREIGN KEY (`id_cuidador`) REFERENCES `cuidadores` (`id_cuidador`),
  CONSTRAINT `fk_cuidadores_por_habitats_habitat` FOREIGN KEY (`id_habitat`) REFERENCES `habitats` (`id_habitat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuidadores_por_habitats`
--

LOCK TABLES `cuidadores_por_habitats` WRITE;
/*!40000 ALTER TABLE `cuidadores_por_habitats` DISABLE KEYS */;
INSERT INTO `cuidadores_por_habitats` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `cuidadores_por_habitats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especies`
--

DROP TABLE IF EXISTS `especies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especies` (
  `id_especie` int NOT NULL AUTO_INCREMENT,
  `nombre_comun` varchar(100) NOT NULL,
  `nombre_cientifico` varchar(100) NOT NULL,
  `descripcion` text,
  `estado_conservacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_especie`),
  KEY `idx_especies_nombre_comun` (`nombre_comun`),
  KEY `idx_especies_nombre_cientifico` (`nombre_cientifico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especies`
--

LOCK TABLES `especies` WRITE;
/*!40000 ALTER TABLE `especies` DISABLE KEYS */;
INSERT INTO `especies` VALUES (1,'Tigre','Panthera tigris','Descripción del tigre','En Peligro'),(2,'Elefante','Loxodonta africana','Descripción del elefante','Vulnerable'),(3,'León','Panthera leo','Descripción del león','Vulnerable'),(4,'Cebra','Equus quagga','Descripción de la cebra','Preocupación menor'),(5,'Jirafa','Giraffa camelopardalis','Descripción de la jirafa','Vulnerable'),(6,'Puma','Puma concolor','Descripción del puma','Preocupación menor'),(7,'Jaguar','Panthera onca','Descripción del jaguar','Casi amenazado'),(8,'Gorila','Gorilla gorilla','Descripción del gorila','En Peligro'),(9,'Pavo real','Pavo cristatus','Descripción del pavo real','No evaluado'),(10,'Avestruz','Struthio camelus','Descripción del avestruz','Preocupación menor');
/*!40000 ALTER TABLE `especies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `genero` varchar(10) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Macho'),(2,'Hembra');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guias`
--

DROP TABLE IF EXISTS `guias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guias` (
  `id_guia` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_guia`),
  KEY `fk_guias_persona` (`id_persona`),
  CONSTRAINT `fk_guias_persona` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guias`
--

LOCK TABLES `guias` WRITE;
/*!40000 ALTER TABLE `guias` DISABLE KEYS */;
INSERT INTO `guias` VALUES (1,1,'2010-01-01','Safari africano'),(2,2,'2012-03-15','Jirafas y elefantes'),(3,3,'2015-06-01','Aves exóticas'),(4,4,'2018-09-01','Primates americanos');
/*!40000 ALTER TABLE `guias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitats`
--

DROP TABLE IF EXISTS `habitats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitats` (
  `id_habitat` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `tipo` varchar(50) DEFAULT NULL,
  `superficie` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_habitat`),
  KEY `idx_habitats_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitats`
--

LOCK TABLES `habitats` WRITE;
/*!40000 ALTER TABLE `habitats` DISABLE KEYS */;
INSERT INTO `habitats` VALUES (1,'Habitat Tigres','Habitat para tigres','Jaula',100.00),(2,'Habitat Leones','Habitat para leones','Jaula',120.00),(3,'Habitat Avestruces','Habitat para avestruces','Jaula',80.00),(4,'Habitat Pumas','Habitat para pumas','Jaula',90.00),(5,'Habitat Jirafas','Habitat para jirafas','Jaula',200.00);
/*!40000 ALTER TABLE `habitats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitats_por_zonas`
--

DROP TABLE IF EXISTS `habitats_por_zonas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitats_por_zonas` (
  `id_habitat` int NOT NULL,
  `id_zona` int NOT NULL,
  PRIMARY KEY (`id_habitat`,`id_zona`),
  KEY `fk_habitats_por_zonas_zona` (`id_zona`),
  CONSTRAINT `fk_habitats_por_zonas_habitat` FOREIGN KEY (`id_habitat`) REFERENCES `habitats` (`id_habitat`),
  CONSTRAINT `fk_habitats_por_zonas_zona` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitats_por_zonas`
--

LOCK TABLES `habitats_por_zonas` WRITE;
/*!40000 ALTER TABLE `habitats_por_zonas` DISABLE KEYS */;
INSERT INTO `habitats_por_zonas` VALUES (1,1),(2,1),(5,1),(3,2),(4,3);
/*!40000 ALTER TABLE `habitats_por_zonas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios_apertura`
--

DROP TABLE IF EXISTS `horarios_apertura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios_apertura` (
  `id_horario` int NOT NULL AUTO_INCREMENT,
  `dia_semana` varchar(20) NOT NULL,
  `horario_apertura` time DEFAULT NULL,
  `horario_cierre` time DEFAULT NULL,
  `id_reserva` int NOT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `fk_horarios_apertura_reserva` (`id_reserva`),
  KEY `idx_horarios_apertura_dia_semana` (`dia_semana`),
  CONSTRAINT `fk_horarios_apertura_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_apertura`
--

LOCK TABLES `horarios_apertura` WRITE;
/*!40000 ALTER TABLE `horarios_apertura` DISABLE KEYS */;
INSERT INTO `horarios_apertura` VALUES (1,'Lunes','08:00:00','18:00:00',1),(2,'Martes','08:00:00','18:00:00',1),(3,'Miércoles','08:00:00','18:00:00',1),(4,'Jueves','08:00:00','18:00:00',1),(5,'Viernes','08:00:00','18:00:00',1),(6,'Sábado','08:00:00','20:00:00',1),(7,'Domingo','08:00:00','20:00:00',1);
/*!40000 ALTER TABLE `horarios_apertura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios_recorridos`
--

DROP TABLE IF EXISTS `horarios_recorridos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios_recorridos` (
  `id_recorrido` int NOT NULL,
  `id_guia` int NOT NULL,
  `dia` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id_recorrido`,`id_guia`,`dia`,`hora`),
  KEY `fk_horarios_recorridos_guia` (`id_guia`),
  KEY `idx_horarios_recorridos_dia_hora` (`dia`,`hora`),
  CONSTRAINT `fk_horarios_recorridos_guia` FOREIGN KEY (`id_guia`) REFERENCES `guias` (`id_guia`),
  CONSTRAINT `fk_horarios_recorridos_recorrido` FOREIGN KEY (`id_recorrido`) REFERENCES `recorridos` (`id_recorrido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_recorridos`
--

LOCK TABLES `horarios_recorridos` WRITE;
/*!40000 ALTER TABLE `horarios_recorridos` DISABLE KEYS */;
INSERT INTO `horarios_recorridos` VALUES (1,1,'2023-01-01','10:00:00'),(1,1,'2023-01-01','14:00:00'),(3,1,'2023-01-01','11:00:00'),(3,1,'2023-01-01','13:00:00'),(1,2,'2023-01-01','12:00:00'),(1,2,'2023-01-01','16:00:00'),(3,2,'2023-01-01','10:00:00'),(3,2,'2023-01-01','12:00:00'),(2,3,'2023-01-01','09:00:00'),(2,3,'2023-01-01','11:00:00'),(4,3,'2023-01-01','10:30:00'),(4,3,'2023-01-01','12:00:00'),(2,4,'2023-01-01','13:00:00'),(2,4,'2023-01-01','15:00:00'),(4,4,'2023-01-01','11:00:00'),(4,4,'2023-01-01','13:00:00');
/*!40000 ALTER TABLE `horarios_recorridos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `id_sexo` int NOT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `dni` (`dni`),
  KEY `fk_personas_sexo` (`id_sexo`),
  KEY `idx_personas_dni` (`dni`),
  CONSTRAINT `fk_personas_sexo` FOREIGN KEY (`id_sexo`) REFERENCES `sexos` (`id_sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Vanya','Crosse','1994-12-23','3637 Mitchell Point','7999382925','vcrosse0@amazon.co.jp','41697470',1),(2,'Alfred','Bohills','1972-03-26','90 South Place','1904698699','abohills1@yellowbook.com','44126392',2),(3,'Teddie','Fulford','1975-10-30','78 Mccormick Parkway','9787361108','tfulford2@flickr.com','40552403',1),(4,'Rahel','Mowat','1958-05-30','03182 Dayton Plaza','5113143817','rmowat3@comcast.net','49260599',1),(5,'Chaddie','Gridon','1955-11-30','3595 Forster Trail','3366949397','cgridon4@delicious.com','42044474',2),(6,'Obadiah','Strelitzki','1963-03-22','61626 Sage Pass','3673476280','ostrelitzki5@patch.com','41670125',2),(7,'Ardeen','Bentson','1984-04-23','801 Debra Trail','8336808175','abentson6@theatlantic.com','45634099',1),(8,'Keefer','Youtead','1988-12-07','11 Canary Terrace','4278250220','kyoutead7@wix.com','42356526',2),(9,'Eleanora','Duchenne','1972-04-26','741 Pleasure Terrace','9424977332','educhenne8@wikipedia.org','40283678',2),(10,'Archaimbaud','McGann','1972-08-19','9984 Independence Alley','7086050081','amcgann9@spotify.com','40735035',2),(11,'Dion','Rodda','1968-03-15','8091 Arizona Avenue','9418672020','droddaa@imdb.com','41443526',2),(12,'Randa','Hullot','1996-03-13','7098 Bashford Trail','3999131261','rhullotb@gmpg.org','46097790',2),(13,'Wilton','Calladine','1992-06-28','42 Miller Parkway','7483119896','wcalladinec@domainmarket.com','42965023',1),(14,'Roth','Lynd','1989-02-01','763 Manley Place','3531380941','rlyndd@webnode.com','43742990',1),(15,'Torin','Kerman','1978-12-13','3207 Rigney Terrace','8597460739','tkermane@sakura.ne.jp','40866305',2),(16,'Efren','Coumbe','1993-01-09','788 Prentice Circle','6337378192','ecoumbef@java.com','48082367',2),(17,'Charo','Gawthorpe','1951-02-12','2 Corry Terrace','5884412949','cgawthorpeg@google.nl','48105465',1),(18,'Petronia','Frye','1985-09-13','4592 Summer Ridge Junction','6549185204','pfryeh@wikispaces.com','45585239',1),(19,'Mauricio','Giacoboni','1985-08-28','1 Sycamore Trail','1695567740','mgiacobonii@dropbox.com','47197997',2),(20,'Timothy','Rubinchik','1979-08-09','5 Forster Junction','9846753099','trubinchikj@paypal.com','43059907',2),(21,'Gerhard','Calderhead','1994-08-24','39 Truax Crossing','4697823954','gcalderheadk@joomla.org','40787948',1),(22,'Franzen','Greatham','1976-09-29','89 Fordem Street','6041306791','fgreathaml@microsoft.com','47617479',1),(23,'Tamiko','Iskov','1968-12-17','2 Del Sol Junction','7169221512','tiskovm@answers.com','45149131',2),(24,'Karlie','Avory','1954-02-05','732 Amoth Alley','5579320608','kavoryn@auda.org.au','46715237',2),(25,'Gianina','Swainston','1965-12-03','8 Ridgeview Avenue','6987600415','gswainstono@nasa.gov','46436309',1),(26,'Birgit','Essam','1998-11-20','6461 Porter Court','5325941704','bessamp@europa.eu','49474204',2),(27,'Merill','Rainsden','1975-05-21','9482 Sugar Place','7878236976','mrainsdenq@indiatimes.com','46479482',2),(28,'Tate','Ryall','1970-02-17','6678 Monterey Way','9798573265','tryallr@prlog.org','44659443',2),(29,'Ailey','Stollberg','1989-11-15','998 Arizona Crossing','9556296907','astollbergs@deliciousdays.com','41160923',2),(30,'Ellen','Balsdone','1982-06-06','1550 Jackson Junction','3175913007','ebalsdonet@hostgator.com','48888164',2),(31,'Darcy','Stovin','1999-07-08','4 Huxley Parkway','7071610762','dstovinu@blogtalkradio.com','42015556',1),(32,'Cary','Miskimmon','1999-03-14','692 Myrtle Place','7903298718','cmiskimmonv@paypal.com','45443405',1),(33,'Matilde','Charker','1992-06-30','91 Porter Avenue','7384875746','mcharkerw@microsoft.com','47894444',2),(34,'Sven','Castagnaro','1967-05-29','71096 Sunfield Court','5318128050','scastagnarox@businesswire.com','47604998',1),(35,'Dorena','Christopher','1977-02-26','178 Cascade Trail','3085101594','dchristophery@forbes.com','49371018',1),(36,'Zena','Salan','1973-05-04','5446 Moland Terrace','7426761728','zsalanz@yelp.com','43609688',2),(37,'Shell','Vousden','1971-11-14','886 Burning Wood Center','6432646847','svousden10@chron.com','41113690',1),(38,'Ingeborg','Tustin','1992-09-18','7227 Graceland Plaza','6944321439','itustin11@dmoz.org','44110976',1),(39,'Raeann','Westberg','1982-11-28','348 Erie Crossing','6167001338','rwestberg12@yale.edu','40985005',1),(40,'Joane','Botte','1955-05-10','720 Vidon Trail','3296475845','jbotte13@usnews.com','46032340',2),(41,'Lucas','Leming','1954-10-24','80374 Lake View Circle','6947449813','lleming14@sun.com','46889555',1),(42,'Johnny','Blakesley','1976-07-20','78 Prairie Rose Court','5356200087','jblakesley15@google.es','42284404',1),(43,'Rica','Cholwell','1951-02-18','42987 Delaware Parkway','8896693150','rcholwell16@buzzfeed.com','46943377',2),(44,'Padget','Burge','1968-11-22','3416 Towne Junction','9303578874','pburge17@cyberchimps.com','40995380',2),(45,'Karlik','Mustchin','1976-10-20','352 Kedzie Alley','2303969779','kmustchin18@stanford.edu','43536877',2),(46,'Robers','Duxbarry','1956-03-24','236 Hooker Pass','7302612977','rduxbarry19@icq.com','40661835',2),(47,'Isis','Kloss','1982-08-07','717 Tennyson Place','3922532228','ikloss1a@eventbrite.com','42804115',2),(48,'Bert','Primarolo','1962-03-12','3346 Stoughton Pass','9176302652','bprimarolo1b@fastcompany.com','46263427',1),(49,'Laverne','Chartman','1995-06-10','2527 Di Loreto Drive','7325423429','lchartman1c@ft.com','41684510',1),(50,'Martyn','Lutas','1973-08-28','82 Monument Junction','8288571103','mlutas1d@live.com','40482591',1),(51,'Jemmy','Densie','1998-11-08','400 Carberry Place','4666265149','jdensie1e@eepurl.com','47579035',2),(52,'Robyn','Rigney','1950-03-08','8088 Karstens Drive','1545901302','rrigney1f@sphinn.com','45630861',2),(53,'Shurlocke','Trenchard','1961-04-16','8924 Ridge Oak Road','8209045403','strenchard1g@globo.com','48346445',2),(54,'Ware','Mc Trusty','1966-05-01','52970 South Trail','4644983149','wmctrusty1h@google.nl','48719685',1),(55,'Dorri','Klimczak','1981-09-20','3573 Carioca Parkway','1218481466','dklimczak1i@stanford.edu','40267969',2),(56,'Papagena','Kisby','1996-10-03','7 Anhalt Road','9203051677','pkisby1j@google.ru','43679327',2),(57,'Norah','Worton','1966-02-18','60 Granby Parkway','9714297268','nworton1k@newyorker.com','46085308',2),(58,'Imelda','Raymond','1980-03-11','7812 Hollow Ridge Plaza','7813932902','iraymond1l@sourceforge.net','43078594',2),(59,'Joan','Tatem','1950-07-26','46410 Mcbride Pass','4391997630','jtatem1m@bloglines.com','45554410',1),(60,'Livvie','Pettegree','1983-01-31','876 Kensington Road','6717487272','lpettegree1n@omniture.com','48496416',1),(61,'Lynde','Golde','1995-05-01','88 Northfield Circle','7047822997','lgolde1o@networkadvertising.org','49819019',1),(62,'Diena','de Clerq','1981-04-23','22133 Center Point','8688610521','ddeclerq1p@mayoclinic.com','47978683',2),(63,'Demeter','Trousdell','1972-08-13','26828 Straubel Pass','7709386344','dtrousdell1q@drupal.org','49999198',1),(64,'Nora','Truelock','1993-07-08','407 Ryan Trail','4117414161','ntruelock1r@umich.edu','42520583',2),(65,'Hamlen','Price','1989-09-17','73 Stoughton Junction','9649218842','hprice1s@disqus.com','47584867',1),(66,'Addison','Lanegran','1989-05-16','87 Waubesa Park','9857186805','alanegran1t@webnode.com','43519496',1),(67,'Milly','Gallyhaock','1968-12-08','829 6th Circle','8608873270','mgallyhaock1u@wix.com','40680589',2),(68,'Hagen','Tessier','1970-07-30','9580 Vernon Point','7297212262','htessier1v@amazon.de','47106905',2),(69,'Berny','Renne','1957-01-13','642 Elgar Point','9125278786','brenne1w@symantec.com','49425537',1),(70,'Emelita','Eastam','1980-01-30','43399 Transport Alley','2188744098','eeastam1x@smugmug.com','43122374',1),(71,'Bev','Ambrozewicz','1966-09-10','77 John Wall Pass','1974798078','bambrozewicz1y@scribd.com','45630743',1),(72,'Charlie','Bootes','1955-08-26','75 Lakewood Gardens Lane','1112492306','cbootes1z@booking.com','42286544',2),(73,'Rutter','Checci','1988-11-03','6596 Pleasure Street','2271638665','rchecci20@goo.ne.jp','46325215',2),(74,'Lynnet','Bachs','1963-06-24','63189 South Place','1164398269','lbachs21@ibm.com','43332048',1),(75,'Catha','Mansford','1967-09-02','01365 Scofield Terrace','1595009732','cmansford22@desdev.cn','44624650',1),(76,'Akim','Davidsen','1950-04-16','7 Onsgard Trail','3676258047','adavidsen23@sciencedaily.com','44186285',2),(77,'Dimitry','Wand','1973-11-28','947 Carberry Terrace','9536717044','dwand24@jalbum.net','44676991',2),(78,'Stormy','Minnette','1967-02-21','0 Twin Pines Drive','8459900501','sminnette25@dailymail.co.uk','46428348',2),(79,'Lorelei','Itschakov','1963-07-20','8 Iowa Crossing','9254872694','litschakov26@myspace.com','47031482',2),(80,'Jacky','Buzzing','1974-02-01','7264 8th Avenue','3483984117','jbuzzing27@yellowpages.com','48493160',1),(81,'Iver','Turnock','1970-06-28','2297 Anzinger Road','1907734796','iturnock28@so-net.ne.jp','43186986',2),(82,'Willamina','Mohring','1997-09-14','5 West Crossing','4239044721','wmohring29@nhs.uk','43623261',1),(83,'Odelle','Goodliffe','1974-04-21','133 Fair Oaks Pass','8403931146','ogoodliffe2a@odnoklassniki.ru','49608775',2),(84,'Alidia','Oager','1984-07-02','9339 School Place','5718911136','aoager2b@shinystat.com','44553280',2),(85,'Gerrard','Jackways','1989-06-10','2 Lawn Alley','9512626023','gjackways2c@jugem.jp','45075203',2),(86,'Gustave','Beddie','1975-11-14','728 Shoshone Drive','4706787597','gbeddie2d@biblegateway.com','47127753',1),(87,'Tucky','Livsey','1971-12-06','65722 Helena Avenue','5557198751','tlivsey2e@technorati.com','49905134',1),(88,'Ewart','Haruard','1996-02-16','33099 Doe Crossing Place','6575533493','eharuard2f@who.int','43495186',1),(89,'Egbert','Martins','1963-02-11','67800 Knutson Lane','8122844987','emartins2g@thetimes.co.uk','42728461',1),(90,'Nola','MacVagh','1965-09-20','16263 5th Way','6067456880','nmacvagh2h@theatlantic.com','41115817',1),(91,'Brittne','Limming','1996-05-16','5032 Colorado Place','9608434159','blimming2i@businesswire.com','45355881',1),(92,'Emmy','Catto','1954-05-16','31 Talisman Parkway','8457840752','ecatto2j@imdb.com','49450169',2),(93,'Emylee','Freke','1971-05-25','819 Beilfuss Lane','8467261833','efreke2k@netlog.com','45600641',1),(94,'Jessamyn','Dominico','1967-02-21','3669 Shoshone Junction','7789223151','jdominico2l@digg.com','43575435',2),(95,'Tan','Solman','1985-03-07','6208 Heffernan Crossing','2251474613','tsolman2m@mapy.cz','44641749',1),(96,'Dimitri','Cureton','1955-11-10','17580 Towne Drive','6092979526','dcureton2n@earthlink.net','41534769',2),(97,'Clarine','Bullar','1977-10-04','7 Pierstorff Parkway','3388225000','cbullar2o@behance.net','43837611',1),(98,'Tades','Klesel','1985-12-11','3 Golf Way','3279313960','tklesel2p@indiatimes.com','49673434',2),(99,'Flemming','Segebrecht','1961-11-02','53158 Gina Road','5727526284','fsegebrecht2q@amazonaws.com','42349659',1),(100,'Nolie','Elesander','1986-02-18','41564 West Avenue','1517283367','nelesander2r@amazon.co.jp','45384778',2),(101,'Fayina','Leades','1951-01-01','9237 Roth Pass','7047630408','fleades2s@fda.gov','49558870',2),(102,'Stanleigh','Steed','1960-02-19','20682 Loeprich Drive','2347035875','ssteed2t@ox.ac.uk','46932576',1),(103,'Patrizio','Gladdolph','1994-05-23','251 Bluestem Trail','4694750638','pgladdolph2u@imdb.com','46921965',2),(104,'Lance','Flintuff','1997-12-13','59 Sutteridge Pass','6153561948','lflintuff2v@ebay.com','48693382',1),(105,'Butch','Baskeyfied','1972-10-24','655 Marcy Avenue','1366389338','bbaskeyfied2w@unesco.org','49454628',2),(106,'Bart','Segot','1993-02-10','71317 Ramsey Trail','1577988633','bsegot2x@networkadvertising.org','43494837',2),(107,'Elset','Tesimon','1967-06-01','3 Valley Edge Plaza','7432089888','etesimon2y@example.com','42058166',1),(108,'Jillie','McLean','1975-10-13','8806 Golf Trail','7009676812','jmclean2z@behance.net','43195832',2),(109,'Rhetta','Dauney','1970-04-21','30 Hazelcrest Parkway','1119730346','rdauney30@vk.com','43919945',2),(110,'Kevina','Beardsworth','1974-05-11','6 Melvin Avenue','3953734410','kbeardsworth31@npr.org','44613391',1),(111,'Eddie','O\'Dreain','1965-12-02','93472 Golf Course Trail','7171812689','eodreain32@tripadvisor.com','46558271',2),(112,'Latrina','Vowdon','1957-09-28','2 Magdeline Plaza','5052342124','lvowdon33@macromedia.com','42420905',1),(113,'Margo','Cossom','1997-05-27','632 Northview Junction','8844345842','mcossom34@apple.com','49746708',1),(114,'Marline','Winsome','1984-02-24','6000 Buena Vista Park','8191687226','mwinsome35@is.gd','47383969',1),(115,'Elonore','Pennone','1985-03-05','96 Corry Pass','5727253064','epennone36@blogger.com','46645629',2),(116,'Lucretia','Glandon','1951-04-29','62 Weeping Birch Way','6676723382','lglandon37@scribd.com','48665125',2),(117,'Ronalda','Kauschke','1995-09-15','41894 Ronald Regan Point','9851787879','rkauschke38@yellowpages.com','47929901',2),(118,'Heywood','Galton','1974-02-18','1 Anzinger Street','9575315220','hgalton39@businesswire.com','41885335',2),(119,'Rene','Laxon','1950-07-26','309 Kipling Junction','1027603516','rlaxon3a@trellian.com','47915502',2),(120,'Ralf','Golledge','1998-04-15','7890 Independence Road','7988423068','rgolledge3b@booking.com','42528175',1),(121,'Klarrisa','Rachuig','1981-03-08','9 Evergreen Street','6873874568','krachuig3c@merriam-webster.com','49847745',1),(122,'Trent','Karpets','1966-06-22','3098 Talisman Circle','7036276656','tkarpets3d@state.gov','42938629',1),(123,'Janeen','De Gowe','1964-01-13','7 Aberg Point','8113620550','jdegowe3e@google.ru','44592734',2),(124,'Doloritas','Tethcote','1969-07-29','7465 Park Meadow Place','4809554356','dtethcote3f@symantec.com','44364566',1),(125,'Nathalia','Croker','1988-05-18','792 Cambridge Center','4189763992','ncroker3g@goodreads.com','46352878',1),(126,'Lottie','Kordovani','1973-05-31','712 Rusk Way','6557987137','lkordovani3h@creativecommons.org','44292757',2),(127,'Darwin','Poker','1995-04-13','3 Maple Wood Parkway','9707255754','dpoker3i@sourceforge.net','47413009',1),(128,'Paula','Silberschatz','1999-11-23','08876 Vidon Hill','9925381366','psilberschatz3j@engadget.com','42382871',1),(129,'Jemimah','Sach','1961-01-18','52633 Bluejay Junction','8726544570','jsach3k@facebook.com','42472386',2),(130,'Emmery','Ortega','1984-10-03','75 Lakeland Plaza','1372696833','eortega3l@youtube.com','48264055',2),(131,'Cristionna','Klimes','1960-12-22','9266 Warner Pass','6338135923','cklimes3m@npr.org','43826304',2),(132,'Tessi','Culshew','1950-10-02','7 Grim Hill','3176835855','tculshew3n@usa.gov','42250230',2),(133,'Serge','Sedworth','1994-10-27','4717 Miller Alley','8595459230','ssedworth3o@github.io','44251558',2),(134,'Eliot','Zimmer','1966-09-23','3 Columbus Place','5293821892','ezimmer3p@wufoo.com','44026003',2),(135,'Mack','Prene','1957-05-03','695 Harbort Crossing','6762923673','mprene3q@myspace.com','42237466',1),(136,'Gennifer','Frier','1952-01-07','98 Daystar Alley','2255998979','gfrier3r@parallels.com','47722060',2),(137,'Margret','Atchly','1974-09-15','0 Clove Way','1986276259','matchly3s@admin.ch','40109999',2),(138,'Piper','McKinie','1973-05-19','615 Victoria Street','4022025487','pmckinie3t@reuters.com','46332517',1),(139,'Shaylynn','Sifflett','1994-06-13','328 Thackeray Avenue','7072254718','ssifflett3u@yale.edu','46874291',1),(140,'Jake','Gerrets','1987-07-15','002 Nevada Plaza','1656174475','jgerrets3v@theglobeandmail.com','45657844',2),(141,'Calla','Bartlomiejczyk','1994-01-13','4 Anhalt Park','5033325533','cbartlomiejczyk3w@drupal.org','40706777',1),(142,'Paquito','Merrien','1997-05-30','6155 Browning Avenue','4678022854','pmerrien3x@facebook.com','41977971',2),(143,'Georgina','Bound','1997-10-16','04169 Atwood Center','6943149016','gbound3y@posterous.com','49126709',2),(144,'Hinda','Waberer','1992-10-02','31 Karstens Crossing','9022465702','hwaberer3z@cbc.ca','41418543',1),(145,'Howey','Bartod','1990-03-09','890 Ruskin Place','5411112117','hbartod40@state.tx.us','41843341',2),(146,'Jere','Southway','1966-12-01','3 Mariners Cove Street','3858641254','jsouthway41@cornell.edu','43856376',2),(147,'Fran','Attride','1971-06-15','3 Bultman Point','5684394828','fattride42@cnn.com','48868005',2),(148,'Maxy','Cockley','1958-02-06','03 Park Meadow Road','1344791811','mcockley43@skyrock.com','46979770',1),(149,'Mariellen','Breede','1969-03-16','9 Brickson Park Way','6677324761','mbreede44@godaddy.com','44556575',1),(150,'Pedro','Lilloe','1957-04-26','940 Northport Hill','3576659810','plilloe45@google.cn','41229075',2),(151,'Joey','Kaplin','1975-08-08','19 Elka Street','6231308556','jkaplin46@seesaa.net','43890015',1),(152,'Valli','Willstrop','1971-03-03','61 Forest Plaza','8465501311','vwillstrop47@a8.net','41866780',1),(153,'Jolee','Wadham','1964-04-15','218 Bultman Parkway','3409225523','jwadham48@booking.com','41314530',1),(154,'Ashien','Gilburt','1969-09-28','5669 Gateway Alley','4125996666','agilburt49@ifeng.com','43715955',1),(155,'Daryle','De Michele','1966-10-08','5 Stang Way','1484007150','ddemichele4a@cbc.ca','42004727',2),(156,'Lisetta','Bywaters','1993-12-12','132 Sachs Crossing','7471579399','lbywaters4b@comsenz.com','42379939',2),(157,'Daniela','Steed','1967-11-09','4 Hanson Park','6993570995','dsteed4c@yellowpages.com','41890590',2),(158,'Cheri','Clawsley','1952-09-01','6746 Melody Road','3467965963','cclawsley4d@google.cn','46543990',1),(159,'Shandie','Wheowall','1967-09-19','09 School Pass','1672655902','swheowall4e@twitter.com','46722671',2),(160,'Ezmeralda','Belmont','1984-02-16','13 Springview Court','5836348377','ebelmont4f@slate.com','48460797',1),(161,'Merwin','Skentelbury','1969-12-08','1 International Parkway','8524870698','mskentelbury4g@nifty.com','45743133',2),(162,'Janeen','Riggoll','1956-06-28','5995 Bashford Circle','7013804262','jriggoll4h@paginegialle.it','43241746',1),(163,'Freemon','Vogele','1995-10-19','534 Myrtle Trail','2768139720','fvogele4i@github.com','40420196',2),(164,'Bernhard','Neeve','1992-01-14','93 Hanson Street','8664442179','bneeve4j@google.de','43844791',1),(165,'Edmund','Gravenell','1977-12-18','15 Nancy Alley','4598987185','egravenell4k@free.fr','49667158',2),(166,'Stephana','Snasel','1971-06-13','3345 Ridge Oak Way','4873440442','ssnasel4l@nationalgeographic.com','40518133',2),(167,'Stormi','Jellicorse','1970-11-02','486 Veith Lane','2621489248','sjellicorse4m@bloglines.com','45010884',2),(168,'Holly-anne','Dodle','1993-03-08','3186 Cardinal Avenue','5696218959','hdodle4n@pagesperso-orange.fr','46429364',2),(169,'Benjamen','Allison','1979-01-30','551 Eggendart Point','1072999648','ballison4o@guardian.co.uk','49165192',2),(170,'Northrop','Garlinge','1985-03-17','4 Goodland Crossing','2478179497','ngarlinge4p@pbs.org','42888548',1),(171,'Rosalie','Ronchi','1953-02-14','927 Chinook Place','3249513862','rronchi4q@huffingtonpost.com','48113082',2),(172,'Cobbie','Chilles','1957-03-03','675 Meadow Valley Parkway','8865735836','cchilles4r@blinklist.com','45020458',2),(173,'Rivi','Crawley','1961-04-04','5647 Kim Lane','5239739300','rcrawley4s@surveymonkey.com','46141667',2),(174,'Anett','Lanchester','1961-09-08','60328 Cascade Avenue','5726076189','alanchester4t@bravesites.com','44477905',1),(175,'Leoine','Mair','1988-03-27','503 Graceland Court','9461640851','lmair4u@opensource.org','47182765',1),(176,'Walker','Newband','1980-11-15','1722 Butterfield Way','7538054500','wnewband4v@so-net.ne.jp','47514805',1),(177,'Merissa','Vannini','1993-06-13','51 Evergreen Street','2113560197','mvannini4w@japanpost.jp','41268671',2),(178,'Evyn','Backes','1992-06-30','1818 Hintze Avenue','4456037057','ebackes4x@issuu.com','42091351',1),(179,'Sauveur','Daughtery','1959-08-31','85816 Harbort Junction','7959083678','sdaughtery4y@discovery.com','43933995',1),(180,'Jannel','McLugish','1984-07-04','2 Dryden Park','6885857523','jmclugish4z@goo.gl','48081643',2),(181,'Jard','Flooks','1955-02-11','480 Montana Alley','6296762436','jflooks50@typepad.com','43642398',1),(182,'Celisse','Coath','1964-01-04','479 Anniversary Center','7213152468','ccoath51@ebay.co.uk','42640365',1),(183,'Gavan','Wroath','1952-11-06','38546 Elmside Way','5196424550','gwroath52@wordpress.org','40124445',1),(184,'Nicola','Dewett','1965-02-03','08 Glendale Circle','3506285639','ndewett53@auda.org.au','43041461',1),(185,'Bev','Delahunty','1951-04-24','49729 Dakota Plaza','1955209499','bdelahunty54@cyberchimps.com','46759318',1),(186,'Friederike','Wickie','1990-06-21','7 Division Place','1656165252','fwickie55@unblog.fr','45754573',1),(187,'Rosa','Elsbury','1998-12-27','603 Meadow Ridge Center','2915420215','relsbury56@phoca.cz','40074296',1),(188,'Gene','Sayre','1956-06-02','30460 Northport Drive','6769844742','gsayre57@prnewswire.com','43042971',1),(189,'Chad','Jurgensen','1981-07-14','731 Alpine Way','2441819173','cjurgensen58@livejournal.com','43617853',2),(190,'Ivy','Pickring','1986-12-14','559 Randy Drive','5592780960','ipickring59@mozilla.org','46799914',2),(191,'Ninetta','Dearle-Palser','1972-05-29','23875 Hovde Hill','9373982095','ndearlepalser5a@archive.org','41152374',1),(192,'Jeana','Perfitt','1986-05-25','749 Scott Street','1425092348','jperfitt5b@europa.eu','40124585',2),(193,'Dore','Elsley','1952-07-22','83739 Talisman Plaza','4514913895','delsley5c@scribd.com','48213144',2),(194,'Luella','Cettell','1983-04-20','45 Glacier Hill Park','6792358199','lcettell5d@va.gov','41044668',1),(195,'Neila','Carpenter','1974-06-26','3 Waxwing Pass','3756912602','ncarpenter5e@biblegateway.com','45842825',2),(196,'Lin','Howes','1991-12-13','1 Buena Vista Circle','6816652347','lhowes5f@google.nl','41494009',1),(197,'Toby','D\'Aguanno','1995-07-09','1 Bashford Crossing','6381047153','tdaguanno5g@nytimes.com','44149314',2),(198,'Nikos','Cushworth','1957-06-29','7439 Service Court','1779836541','ncushworth5h@google.com.hk','41681072',1),(199,'Linette','Leven','1996-07-13','6 Bultman Road','8574758148','lleven5i@list-manage.com','44353185',2),(200,'Karel','Younghusband','1971-06-16','96 Declaration Junction','9609849087','kyounghusband5j@naver.com','47006641',1),(201,'Odele','Helmke','1962-08-15','6 Spohn Way','4893611396','ohelmke5k@furl.net','47979735',1),(202,'Storm','Wiltshier','1998-04-26','8771 Fieldstone Terrace','3635086974','swiltshier5l@bigcartel.com','47561413',1),(203,'Micheline','Stennine','1960-02-26','18 Tennyson Park','1441299079','mstennine5m@mayoclinic.com','44295655',2),(204,'Elbertine','Sterland','1975-02-11','62 Crowley Center','1096563017','esterland5n@telegraph.co.uk','46063930',2),(205,'Lon','Chanders','1961-07-12','2970 Basil Way','8965896623','lchanders5o@cafepress.com','41698434',1),(206,'Moise','Manass','1990-11-18','3584 Basil Hill','7079278804','mmanass5p@soup.io','47130656',1),(207,'Bernette','Foden','1964-02-03','17 Grim Drive','4578357157','bfoden5q@unblog.fr','46476876',1),(208,'Collin','Maddrah','1956-09-20','3 Florence Trail','8399105001','cmaddrah5r@oakley.com','49165153',1),(209,'Elsy','O\'Mara','1950-02-17','75360 Nelson Circle','7137014918','eomara5s@disqus.com','47764531',1),(210,'Salomo','Domone','1998-05-17','54 Sunnyside Junction','3721218424','sdomone5t@theatlantic.com','47056747',2),(211,'Maud','Chesshyre','1974-05-28','1 Glacier Hill Crossing','9892259686','mchesshyre5u@admin.ch','40232149',2),(212,'Hillyer','Kubica','1982-06-22','2119 Iowa Alley','1058454837','hkubica5v@constantcontact.com','41684789',1),(213,'Rodney','Zelake','1989-05-08','106 Northport Point','5627624561','rzelake5w@php.net','49661014',1),(214,'Cyndie','Henzer','1976-09-15','26537 Elmside Trail','8686718474','chenzer5x@list-manage.com','43581080',2),(215,'Sharline','O\'Crigane','1996-11-05','60 Dawn Circle','6251693530','socrigane5y@abc.net.au','46569984',1),(216,'Redford','Segebrecht','1963-05-01','82 Dwight Crossing','9587019100','rsegebrecht5z@miibeian.gov.cn','40460826',2),(217,'Otto','Klement','1967-11-01','893 8th Center','1594826862','oklement60@de.vu','47895522',2),(218,'Farr','Hornbuckle','1975-11-13','58320 Towne Crossing','9833732832','fhornbuckle61@upenn.edu','41047634',1),(219,'Margaretha','Agate','1985-04-12','66 Graedel Street','4996295693','magate62@virginia.edu','44064557',1),(220,'Zeke','Fairchild','1965-12-18','71929 Montana Park','2692368587','zfairchild63@miibeian.gov.cn','44116927',2),(221,'Karney','Duffy','1985-09-27','8 Schiller Pass','8489299741','kduffy64@vimeo.com','46059536',1),(222,'Pearla','Sancto','1994-06-20','4 Summerview Avenue','9652128611','psancto65@mediafire.com','44841957',2),(223,'Morrie','Kimble','1965-08-24','087 Dakota Drive','6928760648','mkimble66@ocn.ne.jp','41485546',1),(224,'Cara','Gorgl','1975-02-04','89204 American Park','5756479507','cgorgl67@hostgator.com','41513774',2),(225,'Ashely','Chstney','1950-11-30','9 Dawn Drive','9724611287','achstney68@de.vu','41154233',2),(226,'Caprice','Teulier','1954-06-15','8 Summerview Way','6028747710','cteulier69@cnn.com','49354326',2),(227,'La verne','Chatainier','1988-02-22','0066 Hintze Lane','1144165887','lchatainier6a@harvard.edu','42078559',2),(228,'Lewie','Rentz','1992-02-05','902 Gale Circle','2027603376','lrentz6b@google.de','47551363',1),(229,'Anselma','McMillan','1981-08-07','443 North Terrace','4171047554','amcmillan6c@google.cn','49907891',1),(230,'Rowe','Luxton','1999-05-17','3319 Maryland Alley','3918213535','rluxton6d@aboutads.info','41899701',2),(231,'Pernell','Hallihane','1964-08-03','78 Dottie Street','6426202937','phallihane6e@wiley.com','49419031',2),(232,'Elia','Tiptaft','1966-12-04','3 Duke Trail','6796133576','etiptaft6f@tiny.cc','41412092',1),(233,'Germana','Parken','1963-09-15','790 Harbort Parkway','2198016993','gparken6g@usnews.com','49619105',1),(234,'Annelise','Deniske','1958-04-14','71955 Reinke Drive','8562265263','adeniske6h@wikipedia.org','40715612',2),(235,'Turner','Boorman','1984-05-22','27066 Garrison Lane','5617575837','tboorman6i@cdc.gov','42888025',1),(236,'Joey','Aery','1975-04-21','7412 Columbus Park','6298293431','jaery6j@t.co','43314312',2),(237,'Meghan','Thornebarrow','1993-07-26','254 Brown Way','3386195526','mthornebarrow6k@sitemeter.com','47648439',1),(238,'Shepperd','Stute','1968-10-28','0 Armistice Avenue','3373717506','sstute6l@ca.gov','42642508',1),(239,'Bord','Alldritt','1973-06-11','74 Heffernan Drive','9209290657','balldritt6m@psu.edu','45571783',1),(240,'Friedrick','Kiffin','1956-10-31','21491 Utah Park','1429214210','fkiffin6n@webmd.com','44560887',1),(241,'Dolley','Carine','1951-10-27','89 Morrow Parkway','6502759639','dcarine6o@nyu.edu','46729608',1),(242,'Ivor','Dimmne','1987-11-19','162 Bashford Parkway','2915473618','idimmne6p@people.com.cn','46801346',1),(243,'Ilsa','Brody','1985-09-13','46456 Namekagon Circle','3237107126','ibrody6q@typepad.com','42033638',2),(244,'Lesley','Olivi','1985-11-07','8204 Drewry Hill','6643791106','lolivi6r@ow.ly','41203545',2),(245,'Christin','Grigson','1976-07-15','70599 Sunnyside Road','1952191148','cgrigson6s@google.fr','47178201',1),(246,'Tatum','Paley','1980-05-02','27 Farwell Hill','9648416154','tpaley6t@free.fr','48990008',1),(247,'Kendre','Kershow','1973-01-12','9087 Autumn Leaf Terrace','2974065582','kkershow6u@pbs.org','42276662',1),(248,'Marcelle','Beausang','1985-05-27','95052 Eastwood Street','8034155928','mbeausang6v@google.fr','47990958',1),(249,'Devin','Healey','1989-12-07','3058 Almo Parkway','6899489355','dhealey6w@imgur.com','44730495',2),(250,'Nigel','Wiggington','1988-04-26','4 Service Avenue','4983554783','nwiggington6x@barnesandnoble.com','41212076',1),(251,'Angel','Tellett','1987-10-22','7935 Oak Way','2794338165','atellett6y@networksolutions.com','42188702',1),(252,'Jilly','Rannald','1959-04-17','767 Spenser Circle','8338209608','jrannald6z@constantcontact.com','48874637',2),(253,'Helaina','Di Lucia','1998-02-22','38 Oriole Plaza','9997731489','hdilucia70@so-net.ne.jp','46659678',2),(254,'Jaimie','Fewlass','1992-02-29','6931 Ilene Center','5082984003','jfewlass71@blogger.com','42346920',1),(255,'Kerr','Easey','1974-01-05','1 Sage Crossing','1988636562','keasey72@sitemeter.com','43872615',1),(256,'Abbot','Dunne','1971-08-15','0 Sommers Trail','8505834119','adunne73@bloomberg.com','49488923',1),(257,'Camilla','Hullot','1967-08-09','100 Hoffman Plaza','7047451367','chullot74@typepad.com','44843358',1),(258,'Gerrard','Brodnecke','1992-01-09','45057 Sundown Terrace','1462497602','gbrodnecke75@chronoengine.com','46951264',2),(259,'Joshua','Speeding','1985-01-26','5 Algoma Road','8923996618','jspeeding76@fotki.com','43243933',2),(260,'Pincus','Godfree','1956-08-26','7 Coleman Avenue','6475843597','pgodfree77@washingtonpost.com','45258087',1),(261,'Jeremy','Gudeman','1958-03-02','484 Dwight Road','2233092485','jgudeman78@businesswire.com','49063889',2),(262,'Ezequiel','Brisker','1998-05-15','19286 Banding Street','7803326642','ebrisker79@twitpic.com','45220146',2),(263,'Romona','Willwood','1972-04-05','6604 Summit Avenue','6619194184','rwillwood7a@w3.org','48822176',2),(264,'Ailis','Adamsen','1960-06-12','0 Dakota Trail','5072851874','aadamsen7b@unicef.org','42872937',2),(265,'Starla','Size','1975-05-21','8 Huxley Place','6871338673','ssize7c@webnode.com','48632889',2),(266,'Elinore','Rilton','1985-02-20','27055 Ludington Point','6804717939','erilton7d@artisteer.com','47334468',1),(267,'Horten','Aynold','1967-10-31','384 Spaight Court','4225134402','haynold7e@epa.gov','42753189',1),(268,'Josy','Eykelhof','1979-04-21','45619 Pawling Court','4549183797','jeykelhof7f@goodreads.com','46038756',2),(269,'Carmelina','Fiske','1963-05-10','58670 Emmet Court','6157965263','cfiske7g@reverbnation.com','40469488',1),(270,'Marni','Grent','1956-04-21','14604 Bashford Pass','2386853644','mgrent7h@wunderground.com','44548160',2),(271,'Dugald','Readshall','1981-09-29','80 Donald Terrace','9756845667','dreadshall7i@aboutads.info','43195508',2),(272,'Cooper','Falvey','1990-04-10','6 Lerdahl Center','7757663182','cfalvey7j@businessweek.com','41701550',2),(273,'Devinne','Feechum','1976-08-03','950 Gateway Junction','4888971308','dfeechum7k@nationalgeographic.com','42767187',2),(274,'Corney','Dando','1969-08-30','14738 Lakewood Avenue','6218959645','cdando7l@seattletimes.com','42425668',1),(275,'Sharline','Cove','1958-09-18','3 Fordem Crossing','7148140402','scove7m@sphinn.com','45860256',2),(276,'Fair','Brickhill','1969-06-29','18546 Lyons Pass','4997764905','fbrickhill7n@tumblr.com','47666912',2),(277,'Daune','Clemmen','1980-08-23','89 Pepper Wood Road','6719636640','dclemmen7o@berkeley.edu','45318495',1),(278,'Ursula','Coopman','1990-12-04','81 Moulton Junction','2745532041','ucoopman7p@dailymail.co.uk','45326688',2),(279,'Davey','Cogdon','1976-07-31','96 Esker Road','4137081928','dcogdon7q@studiopress.com','40075164',2),(280,'Flossie','Eastes','1965-09-24','3 Waywood Center','3274138453','feastes7r@godaddy.com','43676773',2),(281,'Rozalie','Mackelworth','1993-07-18','156 Sage Place','1246469737','rmackelworth7s@skyrock.com','41708622',1),(282,'Ranique','O\'Sheils','1986-10-04','5838 Granby Hill','7252789558','rosheils7t@moonfruit.com','42860711',1),(283,'Tobie','Whitehurst','1985-07-19','78849 Bunting Drive','1114215875','twhitehurst7u@sina.com.cn','43510631',1),(284,'Kathye','Lampkin','1999-01-01','591 Burrows Way','5396152665','klampkin7v@soundcloud.com','44210595',2),(285,'Avrom','Colchett','1954-02-27','91539 Waywood Drive','3428672153','acolchett7w@salon.com','40872045',1),(286,'Ivar','Cafe','1986-07-19','42 Merry Place','8407787893','icafe7x@europa.eu','49419386',1),(287,'Sumner','Alford','1977-08-14','8 Wayridge Court','6682760937','salford7y@cnbc.com','48150637',2),(288,'Jessie','McDermid','1950-08-05','34 Grim Trail','6085194148','jmcdermid7z@theatlantic.com','40164019',2),(289,'Keen','Clayborn','1982-01-16','3 Hermina Place','8124169958','kclayborn80@tinypic.com','42927201',1),(290,'Darcy','Cheeke','1980-07-08','8397 Maywood Hill','6654999499','dcheeke81@microsoft.com','46505839',1),(291,'Basia','Unger','1981-10-01','54180 Schmedeman Circle','5193136247','bunger82@arizona.edu','49484823',1),(292,'Bertha','Deverick','1969-11-18','294 Arizona Junction','7144932952','bdeverick83@weather.com','40946031',2),(293,'Madelle','Ramsbottom','1994-01-16','113 Waxwing Road','3668573429','mramsbottom84@gizmodo.com','43423399',1),(294,'Marc','Peacey','1966-08-17','5312 Dennis Pass','7788340893','mpeacey85@chron.com','48159295',2),(295,'Guthry','Grief','1998-12-01','6 Morningstar Trail','1513557079','ggrief86@geocities.jp','43038321',1),(296,'Eddie','Ship','1994-11-05','68 Cascade Trail','4729480766','eship87@miitbeian.gov.cn','44407049',1),(297,'Osbert','Sikora','1967-08-05','217 Carpenter Point','7201901431','osikora88@shutterfly.com','47713546',1),(298,'Gabriela','Richen','1963-11-23','4 Acker Circle','1406468868','grichen89@i2i.jp','45582873',2),(299,'Chryste','Skaife d\'Ingerthorpe','1981-03-05','0 Evergreen Parkway','2606378919','cskaifedingerthorpe8a@sfgate.com','43832118',2),(300,'Arliene','Hunston','1972-08-02','2686 Merry Center','2703348845','ahunston8b@va.gov','40069010',1),(301,'Henri','Plumbridge','1986-05-01','4005 Center Alley','7485636259','hplumbridge8c@pagesperso-orange.fr','40156724',2),(302,'Carmina','Fielding','1978-07-03','171 Killdeer Avenue','2885977692','cfielding8d@dedecms.com','49476266',2),(303,'Konstantin','Creyke','1988-01-27','98818 Almo Lane','9823577285','kcreyke8e@51.la','49186385',2),(304,'Fenelia','Brockest','1954-09-22','2989 Buena Vista Junction','9918110368','fbrockest8f@google.es','49705889',2),(305,'Antonetta','McIlrath','1998-11-22','42607 Prentice Terrace','9432336238','amcilrath8g@redcross.org','46683962',1),(306,'Minnnie','Mowne','1984-11-18','60863 Forest Run Court','2212165530','mmowne8h@tinyurl.com','49461807',2),(307,'Carce','Carrivick','1968-11-26','07177 Westridge Street','8151960093','ccarrivick8i@taobao.com','45488787',2),(308,'Shellie','Cardenoso','1964-07-21','0 Crest Line Park','8896391436','scardenoso8j@deviantart.com','48562353',2),(309,'Michel','Loughton','1967-03-15','6280 Garrison Place','9392725511','mloughton8k@tripadvisor.com','47537515',1),(310,'Vince','Costigan','1978-11-30','627 Menomonie Road','6422080479','vcostigan8l@fastcompany.com','48020727',2),(311,'Spence','Cossor','1985-07-24','78 Manley Center','9139063179','scossor8m@patch.com','47599753',1),(312,'Welbie','Kield','1962-11-22','4653 Nova Place','4202410175','wkield8n@goodreads.com','47450549',2),(313,'Martie','Churcher','1981-09-14','2 Green Junction','1842628145','mchurcher8o@ucsd.edu','43050193',2),(314,'Laurene','Hallbird','1991-11-11','628 Corben Center','2109292590','lhallbird8p@ning.com','44016611',1),(315,'Emlyn','Isakowicz','1998-04-12','48 Coleman Lane','7743768316','eisakowicz8q@sitemeter.com','45629067',2),(316,'Maggee','Jimenez','1989-02-08','25 Meadow Valley Place','4332849282','mjimenez8r@geocities.jp','46619283',2),(317,'Aurea','Verduin','1952-08-29','169 Rowland Road','7233356661','averduin8s@vinaora.com','42287804',2),(318,'Dwain','Pudsey','1987-04-21','2 American Ash Point','7401281083','dpudsey8t@japanpost.jp','40871010',1),(319,'Greggory','McAlester','1989-07-05','80 La Follette Center','4105846533','gmcalester8u@dagondesign.com','40053661',1),(320,'Roldan','Whichelow','1977-04-04','26772 Tomscot Plaza','7707921732','rwhichelow8v@state.gov','41314507',2),(321,'Rosalia','McNee','1971-09-20','1 Bobwhite Drive','7103522318','rmcnee8w@who.int','45070213',2),(322,'Merrile','Headly','1988-01-07','7 Scoville Road','5272552833','mheadly8x@weather.com','40978167',2),(323,'Berti','Tilberry','1959-03-15','327 Stang Point','9987922002','btilberry8y@hugedomains.com','44045028',2),(324,'Louie','Ianizzi','1985-10-12','5792 Kings Lane','7777693715','lianizzi8z@soup.io','45967266',2),(325,'Diannne','Bollini','1950-07-05','1795 Sugar Drive','1887623497','dbollini90@vimeo.com','48594819',2),(326,'Titus','Tollett','1973-03-04','1 Stang Pass','1214071856','ttollett91@state.tx.us','45178776',2),(327,'Kassi','Shilladay','1956-10-24','1 Mallory Court','7816024518','kshilladay92@gizmodo.com','46986709',2),(328,'Wilek','Mergue','1976-02-03','1905 Moland Court','8362435011','wmergue93@accuweather.com','42851274',1),(329,'Judi','Scotcher','1952-06-20','4151 Hoffman Road','7801345916','jscotcher94@latimes.com','48464290',1),(330,'Frankie','Kellert','1985-04-18','0483 Norway Maple Avenue','1608657844','fkellert95@princeton.edu','41052174',1),(331,'Bill','McRannell','1985-01-31','657 Hanover Pass','6713368719','bmcrannell96@ameblo.jp','42411724',2),(332,'Dominique','Lutsch','1970-06-02','32497 Prairie Rose Avenue','4721833909','dlutsch97@shop-pro.jp','43548997',1),(333,'Min','Medley','1992-05-13','00 Comanche Trail','4511468655','mmedley98@unesco.org','45926769',2),(334,'Hephzibah','Bucher','1976-07-27','5429 Blue Bill Park Terrace','8855759077','hbucher99@ibm.com','47723382',2),(335,'Raimund','Logan','1969-05-09','4435 Lotheville Park','3825402452','rlogan9a@foxnews.com','44622888',2),(336,'Torr','Daftor','1981-08-27','59 Eastlawn Plaza','9345263036','tdaftor9b@behance.net','41357513',2),(337,'Irv','Embury','1962-02-17','82767 Straubel Plaza','2044806214','iembury9c@purevolume.com','47505215',2),(338,'Rosabelle','Bony','1972-08-26','7 Dunning Parkway','3726390274','rbony9d@nationalgeographic.com','42064603',1),(339,'Michelle','Skellington','1986-02-20','162 Talmadge Plaza','5363469113','mskellington9e@addtoany.com','41849855',1),(340,'Waldon','Ploughwright','1994-10-25','85518 Hayes Drive','8477668527','wploughwright9f@istockphoto.com','43670055',1),(341,'Annamaria','Heyworth','1969-03-25','61415 Grayhawk Court','6205664226','aheyworth9g@hp.com','49271773',2),(342,'Urban','Pietzner','1958-08-13','8954 Tomscot Center','8591257639','upietzner9h@sohu.com','47808245',1),(343,'Lianne','Garratt','1958-01-12','6807 Blue Bill Park Park','6902807203','lgarratt9i@drupal.org','49374332',2),(344,'Klaus','Buyers','1981-06-17','4439 Surrey Park','1227504352','kbuyers9j@intel.com','48891358',2),(345,'Brooks','Kebell','1970-12-29','63 Arrowood Trail','4196779819','bkebell9k@myspace.com','47303314',2),(346,'Hobard','Gennerich','1996-02-27','585 Merrick Point','2424920081','hgennerich9l@domainmarket.com','44347985',1),(347,'Sidonia','Templeman','1955-07-04','40191 Gale Way','5956420265','stempleman9m@sfgate.com','46942587',1),(348,'Ker','Wannop','1984-06-22','5 Sunbrook Plaza','5638306210','kwannop9n@cargocollective.com','41828346',2),(349,'Rusty','Storkes','1958-03-22','06766 Hagan Hill','5991718539','rstorkes9o@rediff.com','43764757',1),(350,'Alyse','Eddowes','1990-11-08','5724 Northview Hill','8013128136','aeddowes9p@va.gov','45267066',1),(351,'Otes','Chipps','1975-11-18','6 Scoville Hill','6188684328','ochipps9q@wunderground.com','47240336',2),(352,'Aldric','Edsall','1989-08-29','4066 Emmet Parkway','6967036146','aedsall9r@twitter.com','42027362',2),(353,'Cointon','Caslett','1987-08-23','754 Judy Parkway','9453561695','ccaslett9s@opensource.org','49555568',2),(354,'Svend','Withams','1999-07-12','01372 Kenwood Plaza','7922808677','swithams9t@telegraph.co.uk','43197838',1),(355,'Toby','Starzaker','1954-12-06','8504 Hazelcrest Place','7981911289','tstarzaker9u@google.com.hk','46990579',1),(356,'Annabela','Sebrook','1982-12-06','444 Saint Paul Way','8711567334','asebrook9v@chronoengine.com','49611364',1),(357,'Ethe','Spaven','1990-10-13','9300 Melvin Park','4863891840','espaven9w@google.it','40484965',1),(358,'Lamont','Pettigrew','1971-03-21','893 Coolidge Plaza','2456590926','lpettigrew9x@dropbox.com','49992424',1),(359,'Carley','Braganza','1985-02-04','41003 Forest Run Center','3285368984','cbraganza9y@bigcartel.com','49465301',2),(360,'Derwin','Rennles','1991-09-18','2 Sommers Pass','4958720106','drennles9z@prweb.com','41115278',2),(361,'Karna','Pawelec','1969-09-13','9 Rusk Center','4001096966','kpaweleca0@yahoo.com','44823041',2),(362,'Allegra','De Vries','1955-11-23','15633 Toban Pass','3943042830','adevriesa1@sina.com.cn','42940533',1),(363,'Guillema','Cellier','1969-02-14','676 Valley Edge Junction','3519194909','gcelliera2@mozilla.org','44936294',1),(364,'Darrelle','Garland','1970-07-05','63850 Gateway Road','4676023658','dgarlanda3@naver.com','49724942',1),(365,'Jay','Sorbey','1988-10-19','9 Grover Place','6771480259','jsorbeya4@hud.gov','48103764',1),(366,'Yard','Dietz','1973-05-20','80512 Schurz Terrace','4172005676','ydietza5@deliciousdays.com','48554940',1),(367,'Julina','Raine','1999-06-05','500 Hintze Way','6086339131','jrainea6@freewebs.com','41155823',1),(368,'Abigale','Shernock','1957-11-20','0837 Farmco Alley','4595963626','ashernocka7@eepurl.com','41716054',1),(369,'Ninon','Whyborne','1999-09-28','3045 Old Shore Terrace','7531304442','nwhybornea8@goodreads.com','40737181',1),(370,'Kort','Shyram','1955-06-14','735 Artisan Court','4098895878','kshyrama9@epa.gov','40298541',1),(371,'Ainslie','Dooly','1977-02-26','805 Corben Court','9455006830','adoolyaa@prlog.org','47099788',1),(372,'Shurlock','Glassopp','1993-07-27','11903 Bayside Pass','6041468589','sglassoppab@engadget.com','45942926',1),(373,'Carrissa','Stroband','1981-07-25','116 Drewry Street','8382596499','cstrobandac@livejournal.com','42512908',2),(374,'Abner','Mussetti','1977-01-03','56869 Sherman Court','1453603232','amussettiad@istockphoto.com','48093402',2),(375,'Bren','Cockran','1997-09-13','723 Mesta Pass','1872919867','bcockranae@google.pl','49811328',1),(376,'Edlin','Ghelardoni','1968-05-08','5307 Onsgard Road','6595151078','eghelardoniaf@mozilla.com','49952493',1),(377,'Brander','Crowhurst','1978-07-03','86913 Dahle Pass','5546919113','bcrowhurstag@marketwatch.com','42096551',1),(378,'Lotty','Patey','1957-12-31','51 Petterle Drive','5012710879','lpateyah@merriam-webster.com','41519996',2),(379,'Case','Gillitt','1972-12-02','05470 Jana Avenue','8851491716','cgillittai@sourceforge.net','49643331',2),(380,'Clair','Allnatt','1950-08-14','132 Sullivan Pass','1363783077','callnattaj@salon.com','49825978',2),(381,'Marty','Logesdale','1990-01-31','067 Dahle Plaza','5995787307','mlogesdaleak@redcross.org','47241672',2),(382,'Derk','Melburg','1983-01-13','31 Susan Road','3252738481','dmelburgal@woothemes.com','42076943',2),(383,'Temple','Figin','1955-12-13','94 Graedel Drive','2698611501','tfiginam@joomla.org','45578775',2),(384,'Dani','Weatherell','1974-07-10','2634 Vidon Crossing','3673663407','dweatherellan@desdev.cn','41882953',1),(385,'Alisander','Brotheridge','1988-11-04','93597 Rieder Pass','4779109514','abrotheridgeao@360.cn','40913546',2),(386,'Emalia','Crimmins','1992-09-11','50414 Mallard Pass','7047749099','ecrimminsap@4shared.com','44089559',2),(387,'Corinne','Flockhart','1992-07-17','0259 Drewry Alley','6871457207','cflockhartaq@booking.com','43176301',1),(388,'Lock','Riccardo','1991-09-29','5121 John Wall Junction','1103279137','lriccardoar@jugem.jp','40470513',2),(389,'Lockwood','Errichi','1951-01-17','11 Delaware Alley','9996869301','lerrichias@xing.com','43627232',1),(390,'Liam','Turfrey','1983-10-30','0769 Holy Cross Alley','7257284154','lturfreyat@google.com.hk','40070008',2),(391,'Davidson','Gebbe','1950-05-28','62987 Nobel Lane','8892292144','dgebbeau@naver.com','43477520',2),(392,'Evangelina','McAtamney','1961-04-28','8 South Place','1504212299','emcatamneyav@cbsnews.com','45033863',2),(393,'Merola','Catlow','1995-04-30','26046 Erie Alley','7343395325','mcatlowaw@auda.org.au','41739840',1),(394,'Barbara-anne','Inns','1952-08-29','4 Miller Alley','8156337810','binnsax@cmu.edu','40950126',1),(395,'Brett','Purselow','1958-03-30','48238 Crownhardt Alley','8558328519','bpurseloway@eventbrite.com','46171708',2),(396,'Erminia','Ardron','1974-11-19','827 Beilfuss Street','8182430076','eardronaz@shinystat.com','42526086',2),(397,'Kirby','Endle','1952-05-15','2 Fisk Lane','9766271072','kendleb0@posterous.com','42982070',1),(398,'Bobine','Rue','1992-08-08','83 Laurel Point','4083006012','brueb1@canalblog.com','47065399',2),(399,'Alphard','Griniov','1983-01-19','893 Waxwing Plaza','7698642550','agriniovb2@smh.com.au','47085903',2),(400,'Gusty','McGeachie','1959-05-22','0287 Vera Street','4405498078','gmcgeachieb3@cnn.com','44033703',2),(401,'Earl','Curley','1958-10-18','83342 Loeprich Junction','2669380658','ecurleyb4@go.com','42851428',1),(402,'Krisha','Goakes','1997-09-04','40 Mallard Court','5616796874','kgoakesb5@ning.com','44165130',1),(403,'Nicky','Sargison','1995-02-04','1 Rusk Road','4501037411','nsargisonb6@umn.edu','42607940',1),(404,'Vanni','Cliss','1994-12-07','6621 Packers Point','7792327177','vclissb7@squidoo.com','45430866',2),(405,'Bernie','Nisby','1970-05-25','685 Mallory Alley','7673570898','bnisbyb8@mapy.cz','44408945',2),(406,'Clo','Rasell','1997-01-29','9 Thompson Road','1662498400','crasellb9@usa.gov','40359543',1),(407,'Fanchon','Skarr','1985-05-29','71295 Moose Plaza','9287831431','fskarrba@ocn.ne.jp','43576999',1),(408,'Carmina','Bickle','1980-04-22','96 Thierer Point','2826643831','cbicklebb@va.gov','48537509',2),(409,'Asia','Everingham','1959-12-14','053 Coolidge Circle','7855246909','aeveringhambc@themeforest.net','42008290',1),(410,'Kai','Purdon','1978-05-13','137 Oriole Point','7675388422','kpurdonbd@typepad.com','46984127',2),(411,'Stafani','Sprionghall','1990-11-03','0 Milwaukee Hill','8535100149','ssprionghallbe@psu.edu','42852118',1),(412,'Morry','Dran','1988-05-13','5 Lakewood Parkway','6351845971','mdranbf@miitbeian.gov.cn','47620811',2),(413,'Ashlee','Westall','1992-07-02','77058 Starling Plaza','6951226778','awestallbg@vimeo.com','47470690',1),(414,'Ingra','Larcombe','1950-04-02','51 La Follette Avenue','8159338741','ilarcombebh@angelfire.com','45458276',1),(415,'Yevette','Jopling','1952-06-23','8 Coolidge Circle','1771111310','yjoplingbi@youtube.com','43495943',1),(416,'Ailina','Smewings','1976-03-30','2 Katie Road','7518549831','asmewingsbj@wired.com','46508187',1),(417,'Gill','Sayre','1973-02-02','73 Eagle Crest Center','3354188598','gsayrebk@qq.com','40725267',2),(418,'Amery','Dawtre','1953-11-10','86132 Eagle Crest Lane','9579249051','adawtrebl@hc360.com','40264430',1),(419,'Lon','Langman','1965-05-17','08 Judy Place','4062131983','llangmanbm@networksolutions.com','43446608',1),(420,'Colly','Judd','1997-10-14','5414 Walton Circle','9602028928','cjuddbn@flickr.com','46233415',2),(421,'Farah','Overell','1955-06-13','90 Marcy Junction','8631941573','foverellbo@bizjournals.com','42713776',2),(422,'Phineas','Aleshkov','1981-08-03','2393 Green Ridge Drive','7859254636','paleshkovbp@google.co.uk','48095226',2),(423,'Aurel','Angrave','1998-06-18','757 Westport Pass','1466128469','aangravebq@patch.com','49092780',2),(424,'Toni','Cumberland','1968-09-18','54444 Carpenter Trail','5877750069','tcumberlandbr@devhub.com','44857796',1),(425,'Sabrina','Halstead','1975-11-04','9 Summer Ridge Parkway','7147055872','shalsteadbs@liveinternet.ru','40577434',2),(426,'Alvan','Aizik','1982-03-03','0 Dwight Place','7222601383','aaizikbt@reverbnation.com','47659609',1),(427,'Zorana','Manach','1986-12-17','898 Mcguire Junction','9433494186','zmanachbu@joomla.org','42999739',1),(428,'Rusty','Leate','1984-04-19','5473 Welch Parkway','2402965198','rleatebv@reddit.com','46428267',2),(429,'Ken','Jimeno','1979-12-09','12317 Leroy Parkway','7816632165','kjimenobw@tiny.cc','41094565',1),(430,'Dario','Nealy','1966-08-16','5203 Ramsey Way','8896692812','dnealybx@gnu.org','47047202',2),(431,'Billye','Vedntyev','1994-11-21','2610 Trailsway Drive','5556777394','bvedntyevby@chronoengine.com','46090181',1),(432,'Verile','Hanway','1982-03-10','179 Twin Pines Place','3096640453','vhanwaybz@discuz.net','45171438',1),(433,'Pebrook','Shine','1993-03-08','3 Esch Junction','2715892698','pshinec0@google.co.uk','46291656',1),(434,'Byrann','Birtwell','1952-02-14','249 Amoth Plaza','9728290784','bbirtwellc1@google.es','40328163',2),(435,'Jory','Pietraszek','1999-02-27','71969 Pearson Circle','3827730339','jpietraszekc2@360.cn','44075904',1),(436,'Sumner','Napoli','1974-09-22','884 Thierer Court','1077991353','snapolic3@weebly.com','40229092',1),(437,'Lind','O\'Kuddyhy','1956-02-26','06 Shasta Hill','4201139983','lokuddyhyc4@dell.com','44521287',2),(438,'Carolina','Cowan','1976-01-23','9586 Lawn Circle','6115550856','ccowanc5@shinystat.com','49491373',1),(439,'Gerty','Stroud','1970-12-02','5 Eliot Terrace','2138947045','gstroudc6@reference.com','40422137',1),(440,'Berna','Monkley','1961-05-03','761 Northland Street','9455956028','bmonkleyc7@github.com','43598099',1),(441,'Bo','Ferrario','1991-01-13','39487 Linden Avenue','4789362480','bferrarioc8@hostgator.com','45122493',2),(442,'Marisa','Herrieven','1962-05-30','053 Hermina Plaza','1854504181','mherrievenc9@wordpress.com','44293285',2),(443,'Dyna','Hanniger','1967-12-15','76952 International Court','7143397222','dhannigerca@qq.com','40120145',1),(444,'Mada','Luckman','1961-08-08','40 Independence Court','8246483288','mluckmancb@symantec.com','44498812',2),(445,'Neilla','Jacobovitz','1978-12-15','0 Kennedy Place','7813963277','njacobovitzcc@thetimes.co.uk','42142066',1),(446,'Etheline','Master','1959-12-21','9 Gateway Circle','3147667697','emastercd@nps.gov','48585648',2),(447,'Isabelita','Philippon','1966-04-24','99 Lighthouse Bay Court','1372039424','iphilipponce@issuu.com','41050763',2),(448,'Brock','Lister','1954-03-30','9 Porter Pass','7374163049','blistercf@yahoo.co.jp','41552060',2),(449,'Aldwin','Rizon','1987-04-21','280 Northview Drive','4038965339','arizoncg@webmd.com','47212287',1),(450,'Mattie','Fortescue','1990-08-29','2858 Clemons Terrace','7263060874','mfortescuech@bloomberg.com','46356053',1),(451,'Sheff','Fearby','1988-07-09','8 Knutson Junction','4414250429','sfearbyci@businessinsider.com','44252718',1),(452,'Godiva','Matussevich','1998-10-10','919 Warrior Hill','7262799449','gmatussevichcj@eventbrite.com','44990404',1),(453,'Hercules','Sexton','1958-04-22','76 Linden Parkway','7659187536','hsextonck@xinhuanet.com','41471350',1),(454,'Henrik','Pilsbury','1993-09-18','03694 Kingsford Place','2395786710','hpilsburycl@nasa.gov','49572278',2),(455,'Danya','Collis','1956-06-27','18806 Valley Edge Park','5067719417','dcolliscm@sun.com','40646369',1),(456,'Ashby','Offner','1976-02-12','5270 Harbort Park','5743589312','aoffnercn@opensource.org','47053006',2),(457,'Melania','Spittle','1951-02-20','5 Sloan Pass','6125592803','mspittleco@photobucket.com','45897062',2),(458,'Jody','Kenningham','1987-06-20','9240 Hoard Junction','8104021018','jkenninghamcp@jimdo.com','47884724',2),(459,'Peggie','Cottem','1996-09-14','0016 Duke Circle','5433398699','pcottemcq@ask.com','48791857',2),(460,'Terza','Ream','1976-01-05','7 Prairie Rose Center','8607314694','treamcr@newsvine.com','48733371',1),(461,'Kinnie','Snugg','1952-02-18','7 Stoughton Park','4013313652','ksnuggcs@i2i.jp','45502282',2),(462,'Jada','Zoren','1970-06-18','540 Weeping Birch Park','4859846440','jzorenct@meetup.com','46008133',1),(463,'Kean','Betke','1974-08-21','5091 Evergreen Point','3751608572','kbetkecu@wikimedia.org','43243197',2),(464,'Madalyn','McKeefry','1975-05-10','39 Lukken Street','2846362233','mmckeefrycv@deliciousdays.com','45305321',2),(465,'Guss','Rockell','1974-04-03','99 Alpine Lane','8007527643','grockellcw@seesaa.net','45848831',1),(466,'Garik','Antosik','1965-06-06','17 Loftsgordon Circle','4082013879','gantosikcx@hao123.com','40492453',1),(467,'Giovanna','Jenckes','1950-05-07','4 Crowley Hill','4154647417','gjenckescy@yolasite.com','46641562',2),(468,'Justine','Jowsey','1999-11-14','76196 Wayridge Junction','8018148723','jjowseycz@google.com','41147122',1),(469,'Bobbi','Trim','1969-10-26','0646 Dryden Lane','2541931128','btrimd0@opensource.org','45058297',1),(470,'Thedrick','Gorrie','1950-08-19','6455 Lake View Parkway','8357806094','tgorried1@google.cn','45176670',2),(471,'Nataline','Cloke','1971-01-08','992 Manufacturers Crossing','1918124004','ncloked2@trellian.com','49277876',2),(472,'Benji','Cashell','1966-10-07','6384 Transport Center','5762331439','bcashelld3@comcast.net','47568739',1),(473,'Fannie','Stainer','1982-08-26','259 Graedel Crossing','9948995023','fstainerd4@amazon.co.uk','46549803',1),(474,'Geneva','Sor','1985-06-08','4667 Sullivan Road','6845655988','gsord5@gmpg.org','46734158',2),(475,'Curr','Jeannenet','1952-08-03','912 Sauthoff Drive','8593062476','cjeannenetd6@ustream.tv','43490993',1),(476,'Raffarty','Pounsett','1967-05-26','7320 Corben Plaza','7207965428','rpounsettd7@addthis.com','49059857',1),(477,'Cyndy','Petruska','1962-09-18','8 Aberg Terrace','7538478647','cpetruskad8@mlb.com','48843959',2),(478,'Oralee','Lecount','1965-07-22','60 Emmet Crossing','1281317351','olecountd9@fema.gov','40718974',2),(479,'Rich','Bibby','1989-11-29','83 Victoria Park','8923149623','rbibbyda@rediff.com','49327793',1),(480,'Benn','Crate','1965-12-04','542 Clemons Drive','7452655296','bcratedb@princeton.edu','42281478',1),(481,'Sophey','Bartlam','1964-03-02','0 Farwell Trail','3841374036','sbartlamdc@last.fm','42827830',1),(482,'Tessy','Stilly','1992-01-02','13753 Pankratz Circle','5089540652','tstillydd@symantec.com','45202070',2),(483,'Jamey','Cymper','1950-12-09','13083 Annamark Parkway','3214702797','jcymperde@joomla.org','45482781',1),(484,'Curt','Lodder','1978-12-07','17 Schlimgen Terrace','6436060773','clodderdf@ocn.ne.jp','42047216',2),(485,'Audrye','Pickles','1974-04-15','2 Graceland Circle','2135443486','apicklesdg@epa.gov','46138891',2),(486,'Kara-lynn','Swanton','1985-07-01','78857 Straubel Center','7743260074','kswantondh@addthis.com','40632416',1),(487,'Horatia','Szymanski','1951-07-07','0 Arapahoe Terrace','3697952506','hszymanskidi@omniture.com','44186291',2),(488,'Kelsey','Stanford','1970-07-07','93917 Harper Terrace','3651373655','kstanforddj@amazon.com','42053143',2),(489,'Gabe','Merriott','1970-04-13','6021 Kensington Point','4722056961','gmerriottdk@phoca.cz','41847965',1),(490,'Gavrielle','Vidineev','1951-07-09','7 Becker Junction','4823599845','gvidineevdl@fotki.com','43032374',2),(491,'Genny','Batchelder','1991-12-28','1 Cambridge Drive','3187945581','gbatchelderdm@squarespace.com','47366225',2),(492,'Jehu','Grimsdyke','1983-11-01','40801 Starling Point','5903959959','jgrimsdykedn@ovh.net','48429850',2),(493,'Oran','Arton','1994-07-31','90 Barby Circle','7668393035','oartondo@naver.com','45268431',2),(494,'Fran','Eccersley','1960-07-07','038 Rusk Point','9281830544','feccersleydp@youtu.be','47896236',2),(495,'Fraze','London','1983-07-03','830 Charing Cross Place','3095385897','flondondq@hubpages.com','47931019',2),(496,'Addy','Cousans','1976-03-18','250 Crownhardt Park','5457772761','acousansdr@woothemes.com','47061787',1),(497,'Raye','Wrate','1964-07-30','006 Gerald Crossing','3772477976','rwrateds@latimes.com','44258000',2),(498,'Lane','Beames','1973-11-26','586 Westport Street','2748341298','lbeamesdt@so-net.ne.jp','40581017',2),(499,'Celinka','Mokes','1980-10-24','4314 Arrowood Trail','8918728317','cmokesdu@boston.com','40914280',1),(500,'Cora','Gowthrop','1976-08-29','952 Dennis Court','2918430659','cgowthropdv@statcounter.com','42549092',1),(501,'Lusa','MacAlaster','1965-11-02','090 Nancy Drive','7589512662','lmacalasterdw@amazon.co.jp','48769138',1),(502,'Georgi','Farens','1976-05-25','56043 Erie Pass','8029884623','gfarensdx@kickstarter.com','48479382',1),(503,'Melisent','Legen','1963-03-31','31425 Meadow Vale Trail','6986143194','mlegendy@cmu.edu','44869139',1),(504,'Hilliary','McBay','1965-06-22','94889 Clarendon Hill','3946925974','hmcbaydz@howstuffworks.com','41615800',1),(505,'Felice','Maylam','1959-07-24','39104 Spaight Circle','3629332746','fmaylame0@sbwire.com','46331123',1),(506,'Lesya','Weller','1981-07-29','7 Tomscot Alley','7299853464','lwellere1@chicagotribune.com','47609771',1),(507,'Roxie','Claiden','1977-12-25','94615 Westridge Place','6772351705','rclaidene2@usa.gov','43206493',2),(508,'Blaine','Chantree','1970-11-26','4 Oak Drive','2311068690','bchantreee3@usa.gov','47767574',1),(509,'Brunhilda','Joskowicz','1989-02-16','17209 Moulton Lane','5975047298','bjoskowicze4@biblegateway.com','44719734',1),(510,'Adolpho','Farington','1963-08-17','728 Judy Street','5076959801','afaringtone5@myspace.com','44955036',2),(511,'Ann-marie','Fronsek','1970-09-25','74753 Mifflin Drive','4623767286','afronseke6@china.com.cn','43529795',2),(512,'Abdul','Sommerled','1952-05-11','10 Fisk Court','4759785383','asommerlede7@netvibes.com','48114581',1),(513,'Falkner','Fleckness','1956-08-22','0505 Bellgrove Terrace','5552267715','fflecknesse8@myspace.com','48221625',1),(514,'Merrel','Blackader','1964-07-12','98 Becker Crossing','1746493695','mblackadere9@t.co','47168871',2),(515,'Libbey','Kerwick','1970-11-03','8 Morning Avenue','8328046571','lkerwickea@psu.edu','41836755',2),(516,'Raleigh','Parsley','1969-06-20','45 Brickson Park Street','5262482327','rparsleyeb@nationalgeographic.com','41615541',2),(517,'Fanchette','Poole','1981-03-01','335 Del Sol Lane','4751077412','fpooleec@e-recht24.de','48312718',2),(518,'Pate','Densell','1983-11-20','01 Merchant Parkway','4917003236','pdenselled@cpanel.net','40778550',2),(519,'Novelia','Godmer','1979-09-02','6 Pennsylvania Terrace','3568150350','ngodmeree@livejournal.com','49844428',2),(520,'Petronella','Battisson','1990-04-25','309 Merry Terrace','1669433298','pbattissonef@techcrunch.com','44757043',2),(521,'Sol','Van Oort','1973-02-24','12 Atwood Drive','1845766708','svanoorteg@yellowpages.com','41722699',1),(522,'Horten','Scarsbrick','1974-10-28','08343 Gina Drive','4857075035','hscarsbrickeh@nymag.com','41918187',1),(523,'Marmaduke','Learmonth','1979-02-23','8 Anthes Parkway','5095205495','mlearmonthei@networksolutions.com','45928251',1),(524,'Sibylle','Nicol','1972-02-21','8540 Hoard Hill','6787270588','snicolej@goo.ne.jp','47557216',1),(525,'Miriam','Beak','1958-04-03','91094 Commercial Road','8553543020','mbeakek@example.com','46770731',2),(526,'Georgiana','Muzzollo','1963-04-21','9 Eggendart Drive','7499532649','gmuzzolloel@ca.gov','40425253',1),(527,'Aili','Volkes','1985-03-04','6 Northwestern Court','1187173032','avolkesem@newsvine.com','42244285',2),(528,'Tristan','Cleaves','1993-04-13','560 Annamark Place','7466939887','tcleavesen@aol.com','41047018',1),(529,'Shae','Eshmade','1978-02-02','46 Donald Plaza','7578517911','seshmadeeo@gov.uk','49203220',2),(530,'Ahmed','Laurent','1986-01-09','3 Tennessee Circle','4474478889','alaurentep@cyberchimps.com','47184730',2),(531,'Charmane','Tripony','1984-04-25','6 Melvin Plaza','9931725379','ctriponyeq@skyrock.com','42686531',1),(532,'Brennen','Goodridge','1989-02-06','31623 Talisman Street','7266964983','bgoodridgeer@cdc.gov','47196804',1),(533,'Kale','Dyer','1974-09-25','2 Summit Crossing','8802075383','kdyeres@technorati.com','46067993',1),(534,'Birdie','Sacchetti','1951-09-16','0 Darwin Center','2805285158','bsacchettiet@gizmodo.com','47558736',2),(535,'Nicoli','Covolini','1981-07-21','19103 Paget Pass','6715325044','ncovolinieu@ifeng.com','47842286',1),(536,'Coralyn','McCrum','1953-06-21','35 Anthes Park','4627419980','cmccrumev@seattletimes.com','45815565',2),(537,'Inessa','Woodrough','1999-06-24','77 Anderson Point','7226176999','iwoodroughew@ox.ac.uk','47973348',2),(538,'Philippe','Raubenheimer','1950-08-30','75177 Orin Point','2071130061','praubenheimerex@domainmarket.com','41152395',2),(539,'Gram','Ruberti','1970-12-01','0862 Katie Road','1749281433','grubertiey@princeton.edu','46550198',1),(540,'Karin','Beaves','1965-03-10','1571 Birchwood Drive','5798928534','kbeavesez@cnet.com','49138900',2),(541,'Reece','Broomhead','1961-11-04','76 Chinook Crossing','6222197926','rbroomheadf0@nature.com','45901267',1),(542,'Joceline','Doidge','1981-11-22','70 Morrow Place','6381894004','jdoidgef1@livejournal.com','42531728',1),(543,'Tadeas','Serginson','1994-03-06','67681 Pennsylvania Park','3093859859','tserginsonf2@google.com.au','42609434',1),(544,'Cary','Lauritsen','1969-09-21','59843 Marquette Road','5053294677','clauritsenf3@google.pl','40465787',1),(545,'Trenton','Rudeforth','1989-09-03','9800 Manley Hill','5308905915','trudeforthf4@utexas.edu','44442915',2),(546,'Warden','Cristol','1972-09-04','1 2nd Parkway','2025758828','wcristolf5@live.com','41107863',2),(547,'Obidiah','Flowith','1968-06-07','60 Mallory Drive','3689459046','oflowithf6@oaic.gov.au','40413287',1),(548,'Stormie','Tween','1999-04-10','1 Corben Parkway','1489038782','stweenf7@typepad.com','48165245',1),(549,'Guthrey','Hurren','1953-12-01','36 Stang Crossing','5895036142','ghurrenf8@yelp.com','42212428',1),(550,'Dannye','Fishbourne','1990-01-19','32 Spenser Parkway','3397974854','dfishbournef9@ustream.tv','41681696',1),(551,'Alla','Suddell','1979-06-17','015 Goodland Center','9031879012','asuddellfa@godaddy.com','40973152',1),(552,'Cordey','Cleiment','1962-02-23','67 Bunting Parkway','2865966719','ccleimentfb@instagram.com','49369531',2),(553,'Veronique','Spinello','1952-06-03','03 Golf View Way','6314081338','vspinellofc@dagondesign.com','45602239',2),(554,'Egbert','Fairrie','1991-04-19','2 Old Shore Lane','8639954247','efairriefd@apple.com','41828897',1),(555,'Fallon','Fogel','1960-12-28','119 Namekagon Hill','2564312425','ffogelfe@baidu.com','45698216',1),(556,'Mortie','Kattenhorn','1951-10-24','80908 Oneill Parkway','3021713158','mkattenhornff@msu.edu','45255645',1),(557,'Brynne','Arter','1989-07-19','8031 Mcguire Road','8262299757','barterfg@addthis.com','44476931',2),(558,'Stillman','Hitscher','1954-03-28','8282 Reinke Road','4879131915','shitscherfh@nih.gov','41930877',2),(559,'Avery','Eadon','1965-01-25','024 Knutson Hill','7063581659','aeadonfi@timesonline.co.uk','41566702',2),(560,'Elianora','Meeson','1991-11-12','30544 Eliot Court','7161542753','emeesonfj@multiply.com','49332730',2),(561,'Karie','Filippello','1977-03-13','716 Cherokee Hill','3664366426','kfilippellofk@sphinn.com','47029305',1),(562,'Marley','Jerrans','1997-12-31','581 Bunker Hill Park','5675418991','mjerransfl@netscape.com','48899453',1),(563,'Clem','Josilowski','1997-07-18','2355 Sugar Avenue','9893466079','cjosilowskifm@trellian.com','49269740',1),(564,'Celestine','Keizman','1971-09-15','54 Sunbrook Way','8547968059','ckeizmanfn@alexa.com','43873119',1),(565,'Harmon','Rosone','1966-09-06','7260 Pleasure Point','7706537761','hrosonefo@merriam-webster.com','48289855',2),(566,'Dennet','Kase','1978-11-23','27 School Alley','3926993640','dkasefp@theatlantic.com','48127214',1),(567,'Malory','Milborn','1982-02-09','6 Loftsgordon Plaza','4068550662','mmilbornfq@ca.gov','49773942',2),(568,'Tatiania','Barrowclough','1951-11-30','18 Elmside Park','6545959291','tbarrowcloughfr@diigo.com','46671535',1),(569,'Nanon','Kyle','1953-01-29','6799 Shopko Road','3339447180','nkylefs@vinaora.com','46484685',2),(570,'Daron','Tomaschke','1965-07-24','8169 Larry Lane','9658718077','dtomaschkeft@amazonaws.com','48957585',1),(571,'Jermayne','Ambrosoli','1969-04-09','9805 Becker Crossing','3822124849','jambrosolifu@google.com.br','48140513',1),(572,'Bing','Polle','1958-09-02','77118 Delladonna Park','6743344878','bpollefv@reuters.com','48034425',1),(573,'Leena','Sawyer','1953-12-28','5 Merry Place','7076289919','lsawyerfw@163.com','40699830',1),(574,'Andros','Dulin','1987-07-03','397 Pine View Place','5171139857','adulinfx@skyrock.com','40690880',2),(575,'Travis','Birtwhistle','1956-05-03','14 Tomscot Parkway','6957642238','tbirtwhistlefy@census.gov','45910987',1),(576,'Isak','Slocombe','1967-01-10','425 Dorton Road','7603675258','islocombefz@businessweek.com','49236497',1),(577,'Jacqueline','Jeffries','1955-03-28','0 Bartelt Junction','6099893179','jjeffriesg0@bloglovin.com','47856250',2),(578,'Lotty','Dighton','1976-06-10','5 Elka Avenue','6578393624','ldightong1@tinyurl.com','43343516',2),(579,'Shea','Parry','1950-12-10','92 Montana Terrace','4702006805','sparryg2@google.it','42656040',1),(580,'Andriette','Tonner','1975-03-08','06329 Jana Plaza','3567463347','atonnerg3@vistaprint.com','43996418',1),(581,'Claudina','Metzke','1974-11-07','99 Dryden Pass','8272110826','cmetzkeg4@youtube.com','41015494',2),(582,'Laurice','Meadowcroft','1996-05-24','0776 Sutherland Court','5106335093','lmeadowcroftg5@quantcast.com','43421810',2),(583,'Sergio','Pimlett','1973-08-29','0 Crowley Court','5217763995','spimlettg6@arstechnica.com','40899951',1),(584,'Georgeanne','Gutierrez','1992-05-20','77 Lillian Avenue','6027683057','ggutierrezg7@hugedomains.com','44696409',2),(585,'Eva','Dytham','1958-04-26','3 Cottonwood Alley','1989735959','edythamg8@youtube.com','42438689',2),(586,'Huntington','Noddles','1955-04-23','8929 Golf Course Trail','9791565250','hnoddlesg9@yahoo.com','45193923',2),(587,'Sheryl','Ebi','1968-12-23','64095 Rutledge Pass','9951077437','sebiga@ezinearticles.com','40524146',1),(588,'Elga','Shill','1987-07-17','41968 Maple Wood Trail','6072017078','eshillgb@google.com.hk','44265870',1),(589,'Rory','Osgerby','1951-07-05','2512 Graceland Crossing','1707459300','rosgerbygc@1und1.de','47403333',2),(590,'Aigneis','Kulvear','1998-10-03','93865 Sage Street','6927826537','akulveargd@ed.gov','47065066',2),(591,'Katrinka','Priden','1966-04-14','39 Blue Bill Park Park','5229518083','kpridenge@dailymail.co.uk','41815305',1),(592,'Starlene','Stores','1993-05-07','87976 Straubel Drive','6167214029','sstoresgf@mediafire.com','43333065',1),(593,'Francoise','Frankcombe','1976-03-15','6606 Bartelt Road','8384746343','ffrankcombegg@ucoz.ru','45110218',1),(594,'Si','Planque','1963-08-18','09835 Swallow Circle','9375934399','splanquegh@nbcnews.com','41366167',1),(595,'Ardelis','Wickerson','1961-05-02','9305 Parkside Junction','2361101415','awickersongi@google.com.hk','44656028',1),(596,'Brinna','Stammirs','1980-08-03','8 Rusk Point','2302104188','bstammirsgj@earthlink.net','49523568',2),(597,'Betsy','Fernier','1953-05-17','77 Red Cloud Drive','6547532754','bferniergk@sakura.ne.jp','49325484',2),(598,'Cleon','Plank','1966-08-24','27 Westend Trail','9902298422','cplankgl@wix.com','43528083',2),(599,'Sharon','Atyea','1983-12-30','62045 Montana Point','7476811564','satyeagm@sogou.com','41060563',1),(600,'Ynez','Limbert','1955-09-02','5517 Redwing Avenue','1208602460','ylimbertgn@parallels.com','46654077',1),(601,'Somerset','Martinek','1996-01-09','1910 Almo Terrace','8281034002','smartinekgo@theguardian.com','47293875',1),(602,'Den','Sheerman','1951-06-07','86065 Melody Alley','8201219200','dsheermangp@seesaa.net','46925071',1),(603,'Wren','Hulkes','1989-12-09','7 Tennyson Plaza','6101798608','whulkesgq@seesaa.net','47216518',1),(604,'Sigmund','Larvent','1970-12-17','5368 Pankratz Alley','3088743338','slarventgr@desdev.cn','49817488',1),(605,'Jan','Gipp','1983-11-22','6 Corscot Alley','2035163960','jgippgs@instagram.com','43939778',2),(606,'Albert','McGowan','1977-07-09','4 Bluejay Road','5706433266','amcgowangt@spiegel.de','46257963',2),(607,'Danice','Lowden','1986-01-08','3 Sommers Avenue','6856384327','dlowdengu@squidoo.com','45545111',2),(608,'Julianne','Clissell','1962-06-23','12874 Norway Maple Lane','3627003406','jclissellgv@tiny.cc','49929274',1),(609,'Sandro','Dougal','1964-05-07','0497 Hudson Terrace','8915832388','sdougalgw@globo.com','43861731',1),(610,'Lacee','Dilkes','1964-02-11','5 Forest Run Pass','7133437309','ldilkesgx@msu.edu','43972106',2),(611,'Octavius','Dow','1968-06-16','51527 Maple Circle','5682912477','odowgy@booking.com','49841540',1),(612,'Carilyn','Mullan','1966-07-21','30 Superior Junction','6841405219','cmullangz@paypal.com','45666281',2),(613,'Becka','Hebbron','1987-02-16','385 Dennis Drive','3844030070','bhebbronh0@cnet.com','45387537',1),(614,'Gail','Loveland','1980-08-23','493 Westend Court','6119767957','glovelandh1@nymag.com','48808897',1),(615,'Gayel','De Lasci','1959-12-01','6021 Bluestem Alley','7419187290','gdelascih2@twitter.com','49066212',2),(616,'Aggy','Glaum','1974-05-10','0 Homewood Court','8122901741','aglaumh3@rediff.com','47779502',1),(617,'Norine','Bussens','1954-09-13','7480 Forster Park','4865168051','nbussensh4@usa.gov','44653008',2),(618,'Butch','Attryde','1995-11-02','4 Schiller Point','1769304944','battrydeh5@arizona.edu','43930854',1),(619,'Odille','Forgan','1959-11-29','9 Arizona Trail','9612833908','oforganh6@elpais.com','40478063',1),(620,'Lilah','Roderigo','1962-03-25','1114 Bunting Drive','2593192343','lroderigoh7@google.nl','45033148',1),(621,'Juditha','Loyd','1962-02-02','31 Park Meadow Terrace','3664596875','jloydh8@mtv.com','42045654',2),(622,'Doll','Tisor','1956-03-03','13770 Mendota Avenue','3521722666','dtisorh9@digg.com','47243220',1),(623,'Merridie','Misselbrook','1957-11-03','7213 American Ash Court','6918525248','mmisselbrookha@comsenz.com','46180950',2),(624,'Leone','Wisson','1957-03-04','749 Algoma Plaza','4789382834','lwissonhb@hugedomains.com','43944237',1),(625,'Kris','Murrey','1989-04-20','062 Clarendon Circle','9131365167','kmurreyhc@booking.com','46758251',1),(626,'Kenn','Reihill','1989-11-12','3814 Old Shore Alley','6134826516','kreihillhd@unesco.org','47515143',2),(627,'Constantin','Mc Giffin','1950-01-13','936 Donald Road','6189359394','cmcgiffinhe@omniture.com','48867746',1),(628,'Ariel','Dewen','1989-10-12','3146 Longview Plaza','1364680979','adewenhf@sitemeter.com','41301222',1),(629,'Bondon','Landes','1972-08-28','16371 Waywood Crossing','9807148771','blandeshg@twitter.com','41440523',1),(630,'Malorie','Critcher','1957-12-02','380 Bellgrove Road','6862599745','mcritcherhh@washingtonpost.com','44274647',1),(631,'Adara','Hucke','1966-12-18','43454 Truax Drive','6082065482','ahuckehi@list-manage.com','43855226',1),(632,'Thebault','Berryman','1977-07-27','8990 Cascade Lane','6487250227','tberrymanhj@live.com','47874630',1),(633,'Kristi','Le Sieur','1993-04-08','0118 Fallview Point','6378347763','klesieurhk@ucsd.edu','45700617',1),(634,'Elvin','Garey','1952-12-17','8125 Buell Place','6882838436','egareyhl@icio.us','42265364',1),(635,'Obediah','Nunes Nabarro','1961-02-22','2 Charing Cross Avenue','6962332236','onunesnabarrohm@buzzfeed.com','42228944',2),(636,'Cahra','Linskey','1967-12-05','29 Messerschmidt Drive','5484165979','clinskeyhn@usgs.gov','48672937',1),(637,'Cad','Trusler','1963-10-30','7054 Clyde Gallagher Circle','1819271959','ctruslerho@prlog.org','42459410',2),(638,'Anatole','Logie','1999-09-15','40708 Oxford Plaza','9208381529','alogiehp@dagondesign.com','47348256',2),(639,'Gertrude','Hodgon','1957-08-24','5 Pine View Alley','3333290308','ghodgonhq@whitehouse.gov','41219946',2),(640,'Daisey','Duffy','1977-04-13','14 Amoth Point','5746595563','dduffyhr@nature.com','45047365',1),(641,'Drew','Shirrell','1977-01-17','09786 Saint Paul Point','1868126090','dshirrellhs@nydailynews.com','40648016',2),(642,'Jena','Fromant','1952-08-08','903 Buena Vista Alley','3476137759','jfromantht@wsj.com','49281098',1),(643,'Kristien','Lawlee','1956-09-22','341 Fairview Way','7081627462','klawleehu@google.com.br','49031116',2),(644,'Solly','Garie','1992-02-27','4754 Rieder Alley','1331746144','sgariehv@cnn.com','41937917',1),(645,'Phyllys','Faulder','1970-07-25','670 Waubesa Crossing','5018753280','pfaulderhw@loc.gov','48857745',1),(646,'Kriste','Bullock','1964-10-11','2 Prairieview Crossing','4411713229','kbullockhx@bigcartel.com','47752697',2),(647,'Iormina','Eddicott','1995-01-30','76 Homewood Alley','9974789049','ieddicotthy@cpanel.net','45212066',2),(648,'Alphard','Freeborn','1979-03-07','257 Scott Parkway','6864161629','afreebornhz@scribd.com','42024707',2),(649,'Jere','Stollberg','1979-11-24','1735 Boyd Road','7509059054','jstollbergi0@epa.gov','48513026',2),(650,'Ludovico','Reede','1953-03-12','3506 Nova Circle','4474481517','lreedei1@ftc.gov','43082502',1),(651,'Nanni','Madill','1991-07-24','6 Grasskamp Drive','9543324772','nmadilli2@utexas.edu','43990050',2),(652,'Sarette','Badman','1985-03-19','3 Weeping Birch Lane','3185910686','sbadmani3@marketwatch.com','42237923',1),(653,'Lorrin','Westman','1954-09-18','0127 Forest Junction','8884990135','lwestmani4@usa.gov','44069696',2),(654,'Keary','Howie','1955-02-03','25035 Old Shore Circle','4136446980','khowiei5@woothemes.com','42904168',1),(655,'Jsandye','Sketch','1971-07-01','36 Spaight Junction','5852435495','jsketchi6@google.co.jp','40342984',1),(656,'Ursala','Godmer','1959-03-29','24298 Raven Drive','1667252608','ugodmeri7@redcross.org','49320140',1),(657,'Tallulah','Deplacido','1992-08-05','42 Randy Place','1693214216','tdeplacidoi8@last.fm','48207416',1),(658,'June','Flexman','1952-08-31','6 Farragut Way','4375019462','jflexmani9@ifeng.com','40178603',2),(659,'Bordie','Moorwood','1953-08-15','6 Di Loreto Park','9222107241','bmoorwoodia@nasa.gov','49231982',2),(660,'Terrell','Breslane','1974-09-24','6495 Bobwhite Center','3409209418','tbreslaneib@over-blog.com','46634025',2),(661,'Kahlil','Spraberry','1978-09-11','79 Dunning Trail','5976821171','kspraberryic@posterous.com','43967058',2),(662,'Danella','Strathman','1999-08-09','04 Chinook Court','7746856851','dstrathmanid@hugedomains.com','41569506',1),(663,'Verna','Linnit','1976-12-19','3 Bay Drive','3806757621','vlinnitie@google.com.br','40339644',1),(664,'Wendie','Elwin','1972-08-10','41 Fisk Way','7502824625','welwinif@mysql.com','46036253',2),(665,'Laney','Wilder','1980-06-22','04 Esch Trail','9735222484','lwilderig@goodreads.com','41334716',2),(666,'Ashia','Mackstead','1972-04-22','9 Arrowood Trail','1164220168','amacksteadih@goo.gl','46125228',1),(667,'Frederico','Goodinge','1998-08-21','59 Talmadge Way','7942642639','fgoodingeii@spiegel.de','41584598',2),(668,'Borden','Borgnet','1953-10-24','96 Hermina Lane','3817959255','bborgnetij@fema.gov','41609588',2),(669,'Gardner','Cochrane','1980-02-05','64 Vahlen Point','5676531373','gcochraneik@stumbleupon.com','49422313',1),(670,'Lemar','Blaycock','1997-12-15','18 Hoepker Terrace','3248660437','lblaycockil@booking.com','45660914',2),(671,'Umberto','Boydell','1965-01-08','1104 Susan Road','9527217904','uboydellim@ox.ac.uk','49592900',1),(672,'Margo','Blueman','1994-10-18','0 Moulton Terrace','6142167919','mbluemanin@youtube.com','46916221',1),(673,'Cy','Heckney','1986-05-31','4569 Gateway Alley','1815983735','checkneyio@latimes.com','45639683',2),(674,'Hillyer','Trehearne','1963-08-25','742 Forster Way','8043119293','htrehearneip@dailymail.co.uk','47740219',2),(675,'Art','Boughey','1950-08-01','1449 Sunbrook Place','7112824564','abougheyiq@wp.com','49892202',2),(676,'Corene','Odegaard','1977-07-25','8 Fisk Street','6412934290','codegaardir@gov.uk','42271885',2),(677,'Opaline','Prendeguest','1954-11-20','1679 Quincy Street','2134074487','oprendeguestis@cafepress.com','44698164',1),(678,'Gisele','Bortolotti','1979-06-03','3852 Meadow Valley Junction','3074734948','gbortolottiit@prnewswire.com','42249750',2),(679,'Ibbie','Wyld','1954-10-06','777 Kenwood Avenue','3198600479','iwyldiu@weibo.com','47045432',1),(680,'Breena','McGriffin','1964-01-06','52237 Utah Park','5828356587','bmcgriffiniv@huffingtonpost.com','47428173',2),(681,'Theadora','Ogers','1969-08-31','37100 Jackson Junction','7486745918','togersiw@altervista.org','46433891',2),(682,'Garner','Maude','1997-03-27','50672 Brickson Park Way','7234273558','gmaudeix@macromedia.com','46142894',2),(683,'Chiquia','Castillou','1993-08-03','0057 Ronald Regan Pass','9034824644','ccastillouiy@webmd.com','47128842',1),(684,'Leland','Goodlife','1997-04-08','26915 Green Court','7636559648','lgoodlifeiz@paypal.com','49230242',2),(685,'Colleen','Fieldhouse','1984-12-04','7617 Bultman Court','2351922484','cfieldhousej0@elpais.com','40288364',1),(686,'Frederica','Olley','1959-11-10','8611 Everett Center','3852081230','folleyj1@elpais.com','43978511',2),(687,'Corly','Gathwaite','1950-07-04','87094 Raven Hill','3306719081','cgathwaitej2@home.pl','41600647',2),(688,'Gamaliel','Blackbrough','1957-09-09','1 Chinook Circle','8167769047','gblackbroughj3@odnoklassniki.ru','41450115',2),(689,'Alberik','Allbones','1982-12-25','18 Lakeland Center','8553758843','aallbonesj4@moonfruit.com','44436750',2),(690,'Jamill','Roslen','1997-03-12','6 Mosinee Junction','9517168972','jroslenj5@creativecommons.org','46998830',2),(691,'Ranice','Loades','1988-12-31','33 Village Green Lane','7074430482','rloadesj6@paypal.com','44909600',2),(692,'Armin','Hartill','1956-12-01','84083 Hanson Hill','7683377214','ahartillj7@imageshack.us','43929224',2),(693,'Lisle','Pelfer','1991-05-07','12 Morningstar Court','1021369660','lpelferj8@jiathis.com','44609629',1),(694,'Amalie','Mungane','1989-10-08','5 Bluestem Way','9866992985','amunganej9@slate.com','41379864',1),(695,'Raimondo','Maryan','1979-02-25','8380 Moulton Road','1954122865','rmaryanja@e-recht24.de','44524683',1),(696,'Geoff','Bonhan','1973-05-20','56 Oriole Plaza','3106848373','gbonhanjb@ucoz.ru','49934123',2),(697,'Fabiano','MacGow','1987-11-14','31817 Mayer Alley','4736217754','fmacgowjc@prweb.com','41827112',1),(698,'Lydia','Scritch','1968-02-14','79 Schlimgen Center','5405058818','lscritchjd@sciencedirect.com','49076347',2),(699,'Lewes','Coolican','1976-03-14','57608 Londonderry Road','8992120235','lcoolicanje@webnode.com','42814576',1),(700,'Arvie','Lawrie','1992-02-29','965 Carberry Alley','7941440525','alawriejf@ocn.ne.jp','49521142',1),(701,'Briana','Schaffler','1966-06-24','6 Ridgeway Place','4121009280','bschafflerjg@wordpress.org','48992927',1),(702,'Jessika','Hardie','1965-05-18','74 Monica Street','8895793147','jhardiejh@redcross.org','41941674',2),(703,'Romola','Lownes','1974-06-14','5 Mosinee Place','7776546627','rlownesji@blinklist.com','49895785',1),(704,'Arlin','Dyball','1956-09-04','32499 Sage Avenue','3926777437','adyballjj@ed.gov','42157565',1),(705,'Kristos','Cumine','1990-08-13','64901 Ramsey Hill','5548979485','kcuminejk@go.com','41542497',1),(706,'Misti','Milmoe','1955-01-12','89 Eagan Junction','8823653130','mmilmoejl@nationalgeographic.com','40876780',1),(707,'Jdavie','Kenworthey','1983-09-16','7264 Londonderry Plaza','3247415333','jkenwortheyjm@nsw.gov.au','48946386',2),(708,'Michell','Calderhead','1976-11-04','2916 Hoepker Plaza','6143394836','mcalderheadjn@npr.org','46620030',1),(709,'Katherine','Crecy','1962-04-02','25 Meadow Vale Parkway','6101858628','kcrecyjo@businessweek.com','46528223',1),(710,'Janelle','Beckitt','1970-09-13','67736 Oakridge Drive','2516958814','jbeckittjp@addthis.com','41455427',2),(711,'Beniamino','Dacombe','1983-02-08','41949 Commercial Street','5026284349','bdacombejq@geocities.com','48864296',2),(712,'Misha','Fenne','1972-07-08','48 Victoria Terrace','8897773072','mfennejr@washingtonpost.com','41062429',2),(713,'Davida','Moggie','1962-06-14','26 Briar Crest Junction','2722151902','dmoggiejs@hhs.gov','42159632',2),(714,'Ferrel','McNeigh','1982-04-30','21346 Golden Leaf Avenue','9914207862','fmcneighjt@slate.com','42207450',2),(715,'Emmy','Cowthard','1974-05-16','333 Drewry Way','4068490611','ecowthardju@nbcnews.com','45606285',2),(716,'Marline','Dunderdale','1959-05-26','4 Montana Crossing','8496126479','mdunderdalejv@bloomberg.com','49000754',1),(717,'Rod','Shawel','1957-09-12','95 Stephen Point','1149781201','rshaweljw@vimeo.com','41526682',2),(718,'Delora','Muschette','1961-10-01','30911 Harper Road','9504998953','dmuschettejx@omniture.com','40329936',2),(719,'Waylan','Parrott','1966-10-13','927 Carey Center','9862013143','wparrottjy@youtu.be','41771964',1),(720,'Laurella','Lahrs','1958-03-13','0 Shelley Parkway','4238836593','llahrsjz@harvard.edu','43848188',1),(721,'Carlene','Growcock','1988-10-30','35 Springs Parkway','3652531953','cgrowcockk0@cnn.com','49922267',1),(722,'Garfield','Benazet','1976-11-18','39 Browning Plaza','9577187782','gbenazetk1@nationalgeographic.com','42366335',2),(723,'Milo','Rozec','1998-09-04','23 Jackson Trail','6866420050','mrozeck2@ezinearticles.com','40193142',2),(724,'Wiley','Lammie','1999-09-17','71306 Glendale Pass','7794742459','wlammiek3@accuweather.com','41645739',2),(725,'Rebecka','Sprionghall','1993-03-02','51388 Ridgeview Pass','6856391045','rsprionghallk4@biglobe.ne.jp','44926497',1),(726,'Valentine','Tippett','1954-03-17','3205 Muir Terrace','9646989103','vtippettk5@mapquest.com','48026189',1),(727,'Aundrea','Northley','1993-09-07','75 Ruskin Parkway','9932587048','anorthleyk6@w3.org','47639949',2),(728,'Brigham','Slate','1956-03-31','0821 Crest Line Plaza','8288270004','bslatek7@businessinsider.com','40639309',1),(729,'Chrisy','Whinray','1965-04-28','831 Commercial Terrace','1216088010','cwhinrayk8@mit.edu','40894115',1),(730,'Bernardine','Marshfield','1979-05-30','1 Dawn Lane','3552632635','bmarshfieldk9@uol.com.br','42491056',1),(731,'Leighton','Mantha','1954-02-07','482 Dexter Pass','2021772916','lmanthaka@topsy.com','43255495',2),(732,'Dacy','Asp','1986-01-13','79618 Gina Way','6729372105','daspkb@columbia.edu','48715592',2),(733,'Krishnah','Hoggin','1996-03-13','703 Grasskamp Road','2184040543','khogginkc@cam.ac.uk','46431506',1),(734,'Doris','Farreil','1989-12-13','1348 Fieldstone Street','8382547205','dfarreilkd@hc360.com','49036637',2),(735,'Bren','Tesh','1981-01-09','222 Florence Trail','8003171569','bteshke@aol.com','42764276',2),(736,'Thorny','Gittings','1953-08-16','34191 Susan Hill','6579728524','tgittingskf@patch.com','42934821',1),(737,'Beatriz','Crinson','1993-09-17','87339 Holmberg Drive','9043977169','bcrinsonkg@acquirethisname.com','41042125',1),(738,'Northrop','Neasham','1981-07-22','6 Bunker Hill Parkway','4362327254','nneashamkh@hexun.com','49130023',1),(739,'Keenan','Coonan','1996-08-11','115 Dottie Junction','8573618102','kcoonanki@wordpress.org','47609999',2),(740,'Sarita','Stilwell','1970-05-03','222 Farragut Lane','9259522506','sstilwellkj@oakley.com','42085143',2),(741,'Nicholle','Simmell','1968-10-06','93305 Union Parkway','2291818330','nsimmellkk@flickr.com','49605770',2),(742,'Jaye','Fairfoull','1997-05-10','471 Oxford Circle','3669861455','jfairfoullkl@admin.ch','42088219',2),(743,'Sheri','Limpenny','1967-06-09','3 Mifflin Pass','9698531554','slimpennykm@army.mil','49616002',2),(744,'Rozamond','Western','1963-06-29','815 Corry Alley','8934407910','rwesternkn@reference.com','44283593',2),(745,'Lonnie','Kingswood','1968-08-15','0 Boyd Way','7388821541','lkingswoodko@tiny.cc','48618476',1),(746,'Rufe','Ceccoli','1980-04-18','2 Sachs Circle','3621519492','rceccolikp@ustream.tv','49937033',1),(747,'Candis','Glasner','1962-10-18','5240 Lien Circle','6171795550','cglasnerkq@tuttocitta.it','47272943',1),(748,'Mavis','Fitzsymon','1978-05-21','53020 American Junction','3871410829','mfitzsymonkr@creativecommons.org','48073531',1),(749,'Laurie','Richie','1956-06-05','140 Victoria Alley','9693010853','lrichieks@tmall.com','45196167',2),(750,'Allina','Cheak','1959-11-15','1458 Elmside Center','1238495408','acheakkt@irs.gov','45752569',1),(751,'Jasen','Aizikov','1967-02-19','17399 Macpherson Center','8703981014','jaizikovku@ustream.tv','48371986',1),(752,'Janith','Riggott','1997-01-12','21 Nobel Plaza','8887156534','jriggottkv@privacy.gov.au','47802847',2),(753,'Mathe','Craiker','1987-07-05','87 Esch Pass','9538284233','mcraikerkw@gizmodo.com','49302646',1),(754,'Kania','Attenbarrow','1956-07-30','714 Golf Center','5405874876','kattenbarrowkx@stumbleupon.com','47552899',1),(755,'Beverie','Allwood','1951-09-21','8 Riverside Point','4428940428','ballwoodky@github.io','40986874',2),(756,'Jarrad','O\'Brogan','1969-02-17','634 Briar Crest Street','5234837176','jobrogankz@nasa.gov','49206585',2),(757,'Bourke','Norcutt','1961-01-16','5140 Swallow Lane','4996310900','bnorcuttl0@amazon.de','49688214',2),(758,'Ingelbert','Petti','1991-08-03','729 Service Crossing','3259737646','ipettil1@topsy.com','45639406',2),(759,'Caddric','MacQueen','1993-08-03','2 Merchant Trail','9686553844','cmacqueenl2@devhub.com','48441300',1),(760,'Burr','Tacon','1954-06-08','7863 Farwell Place','6846124054','btaconl3@usda.gov','46186233',1),(761,'Barbra','Axelbey','1987-08-26','042 Talisman Lane','4282209834','baxelbeyl4@prnewswire.com','42640299',1),(762,'Truda','Jaime','1960-06-12','59967 Pawling Court','7237123641','tjaimel5@imdb.com','48460369',2),(763,'Leora','Ditty','1995-02-02','551 Carioca Lane','8853969198','ldittyl6@jimdo.com','41517635',2),(764,'Bert','Sanney','1988-03-30','724 Sherman Drive','2258338791','bsanneyl7@cornell.edu','47001505',2),(765,'Palm','Whelpton','1952-11-30','94 Brentwood Plaza','3199977278','pwhelptonl8@wired.com','44378187',2),(766,'Corney','Schober','1987-05-20','11 Pond Junction','3859963917','cschoberl9@nasa.gov','47821698',1),(767,'Reine','Curness','1969-09-16','8 Mendota Lane','3493654016','rcurnessla@github.io','42307997',2),(768,'Rochella','Collcutt','1991-11-13','8 Carey Court','1786419831','rcollcuttlb@networksolutions.com','42576672',2),(769,'Siegfried','Mollison','1977-01-22','396 Utah Crossing','6516298710','smollisonlc@goodreads.com','40716327',1),(770,'Willie','Escofier','1963-01-03','20 Tennessee Avenue','6571451346','wescofierld@msn.com','44441014',1),(771,'Idelle','Paulino','1965-12-30','14748 Valley Edge Crossing','6992922722','ipaulinole@oaic.gov.au','44478511',1),(772,'Elke','Erwin','1967-04-14','62465 4th Drive','4491036519','eerwinlf@discovery.com','42114919',1),(773,'Glenn','Wolsey','1974-07-14','025 Mariners Cove Hill','3363783595','gwolseylg@aol.com','48945679',1),(774,'Mamie','Petre','1951-11-20','439 Drewry Alley','4042510296','mpetrelh@guardian.co.uk','45434888',1),(775,'Emelia','Sprowles','1962-11-27','753 Golf View Lane','6781046720','esprowlesli@icq.com','42472404',2),(776,'Michaeline','McPheat','1957-09-21','2087 Birchwood Avenue','8919296771','mmcpheatlj@accuweather.com','43278910',2),(777,'Helga','Ricciardelli','1971-05-06','09 Laurel Park','1088608837','hricciardellilk@imdb.com','46058249',1),(778,'Derick','Roach','1991-10-18','92157 Farmco Circle','9662743831','droachll@google.ca','49300963',2),(779,'Steve','Boribal','1990-04-23','697 Tony Court','6374076792','sboriballm@lycos.com','43342115',2),(780,'Stafani','Walkingshaw','1975-04-03','9 Kipling Lane','9507041345','swalkingshawln@dmoz.org','43559514',1),(781,'Daron','Barca','1984-04-21','9301 Forest Center','5371302448','dbarcalo@mozilla.org','45020655',1),(782,'Nestor','Megarry','1992-12-25','054 Golden Leaf Pass','6183984994','nmegarrylp@technorati.com','42726338',2),(783,'Saunder','Belz','1977-09-05','0507 Elka Drive','6666630406','sbelzlq@japanpost.jp','44058338',2),(784,'Alexis','Chatainier','1988-04-22','2 Corry Lane','7092676504','achatainierlr@apple.com','46674542',1),(785,'Britt','Ballintyne','1955-08-25','36 Menomonie Avenue','7958117825','bballintynels@baidu.com','44666077',2),(786,'Mordecai','Jordin','1983-05-16','30 Mallard Park','7701569815','mjordinlt@bbc.co.uk','45390741',2),(787,'Jeramey','Dawidowsky','1986-09-23','1433 Iowa Center','1314135596','jdawidowskylu@youku.com','48178665',1),(788,'Kania','Yandle','1988-10-13','01 Center Lane','7863694608','kyandlelv@craigslist.org','45515029',1),(789,'Daffie','Swepstone','1952-11-20','1 Doe Crossing Circle','9838674137','dswepstonelw@ehow.com','47330851',2),(790,'Shanon','Leaf','1970-11-13','2 Hauk Street','9586286387','sleaflx@imdb.com','46018229',1),(791,'Marilyn','Riddoch','1953-07-01','3027 Crest Line Crossing','2947212989','mriddochly@miitbeian.gov.cn','47737171',2),(792,'Mirabel','Romanski','1973-05-24','516 Waubesa Place','6484724924','mromanskilz@cloudflare.com','45128249',2),(793,'Hyacinth','Brothwood','1997-11-10','34 American Parkway','5485225297','hbrothwoodm0@unicef.org','41699361',1),(794,'Jay','Kivits','1991-06-03','1369 Lighthouse Bay Junction','6291268279','jkivitsm1@bbc.co.uk','45469044',1),(795,'Kerstin','Wingar','1983-12-06','07214 Golf Park','6168535766','kwingarm2@epa.gov','49471970',1),(796,'Reilly','Wilcocks','1962-11-15','45 Ryan Terrace','8696124621','rwilcocksm3@flickr.com','40015871',1),(797,'Ailey','Kirtley','1992-02-16','7 Garrison Trail','5676616525','akirtleym4@newyorker.com','40038687',2),(798,'Lu','Saggs','1957-05-05','24475 Meadow Ridge Drive','8655102953','lsaggsm5@google.com.au','42489942',1),(799,'Arv','Stiant','1965-03-02','35 Kropf Terrace','6629564131','astiantm6@bigcartel.com','41235034',2),(800,'Celisse','Jankiewicz','1984-04-18','66252 Pierstorff Park','3612348946','cjankiewiczm7@sakura.ne.jp','41424092',2),(801,'Boot','Verchambre','1972-09-09','44 Muir Center','4223889309','bverchambrem8@comcast.net','45086256',2),(802,'Byrle','O\'Canavan','1988-12-12','74380 Quincy Way','3816217498','bocanavanm9@hibu.com','46434077',1),(803,'Gerhardt','Otto','1987-12-17','28 Killdeer Way','7021700666','gottoma@ox.ac.uk','43230501',1),(804,'Benedetta','Fetherston','1954-10-19','547 Bunker Hill Hill','8298188982','bfetherstonmb@foxnews.com','46279723',1),(805,'Mandy','Burrass','1992-11-19','0833 Ilene Drive','4037270060','mburrassmc@miibeian.gov.cn','43163039',2),(806,'Noah','Beagen','1964-01-18','5 Kedzie Hill','2276702307','nbeagenmd@yellowbook.com','44908207',1),(807,'Ceil','Arni','1953-07-29','4488 Marcy Trail','9276244531','carnime@mac.com','40801873',2),(808,'Carri','McBayne','1962-02-02','867 Summit Hill','9405880556','cmcbaynemf@theglobeandmail.com','48435477',1),(809,'Tabbie','Oles','1999-10-18','614 Gerald Court','7003538130','tolesmg@i2i.jp','42065926',2),(810,'Lorie','Tremontana','1973-10-05','10918 Fuller Street','3928880394','ltremontanamh@wordpress.com','41005443',1),(811,'Barris','Newall','1969-04-29','355 Sommers Alley','4435939709','bnewallmi@princeton.edu','44348158',1),(812,'Farah','Bettenay','1991-01-01','93 Upham Point','6118253359','fbettenaymj@shareasale.com','44772984',1),(813,'Juliet','Brenton','1972-11-15','8 Oxford Park','9803561592','jbrentonmk@wunderground.com','46731755',2),(814,'Jo-ann','Bordis','1979-07-08','6674 Bartillon Place','9988922239','jbordisml@blinklist.com','44968285',1),(815,'Arlana','Ferrarello','1965-09-25','0 Valley Edge Alley','3033287485','aferrarellomm@oakley.com','45034886',2),(816,'Ricoriki','Inskipp','1992-03-04','74942 Glacier Hill Parkway','2291349880','rinskippmn@cloudflare.com','41881373',1),(817,'Maribelle','Massot','1996-05-23','6 Jenna Way','7164314975','mmassotmo@uol.com.br','48796914',1),(818,'Merwin','Orteu','1969-08-20','0112 Farragut Park','3363076528','morteump@fda.gov','46588892',2),(819,'Libby','Dudenie','1988-09-21','15 Bellgrove Point','1468245673','ldudeniemq@dyndns.org','48983599',1),(820,'Ailene','Houlridge','1952-08-04','61 Merrick Avenue','3655540088','ahoulridgemr@a8.net','49495259',1),(821,'Victoir','Thiese','1952-02-22','1007 New Castle Hill','8283106725','vthiesems@ihg.com','40796268',1),(822,'Modesty','Northcliffe','1980-08-07','667 Stuart Center','8098370374','mnorthcliffemt@imgur.com','43832920',1),(823,'Linn','Danat','1964-12-08','88416 2nd Terrace','2242547911','ldanatmu@telegraph.co.uk','43868235',2),(824,'Mannie','Minichillo','1977-01-11','11034 Evergreen Crossing','3738185396','mminichillomv@google.ru','43563745',1),(825,'Andy','Crosland','1980-09-22','4230 Hayes Circle','2342662525','acroslandmw@51.la','48795152',1),(826,'Lynn','Wolver','1989-09-04','76734 Del Sol Way','7123311897','lwolvermx@bizjournals.com','45965615',1),(827,'Gothart','Scown','1965-11-17','33870 Sachtjen Drive','2386412012','gscownmy@arstechnica.com','46988793',2),(828,'Cristionna','Lourens','1989-04-03','56 Vidon Avenue','1422549421','clourensmz@examiner.com','45782618',2),(829,'Archambault','Harpin','1970-11-15','8 Morningstar Court','5168592764','aharpinn0@ucoz.ru','42652882',2),(830,'Cash','Grzelczyk','1991-10-11','6734 Spenser Alley','1882946431','cgrzelczykn1@wp.com','47337530',1),(831,'Roxanna','Andraud','1971-08-21','89082 Sauthoff Center','8334418522','randraudn2@arstechnica.com','41805374',2),(832,'Pierce','Yaakov','1997-03-23','5 Hudson Circle','7562013995','pyaakovn3@blogs.com','47676290',2),(833,'Sheri','Swatheridge','1998-04-16','376 Shasta Park','3312773899','sswatheridgen4@cnet.com','45987638',2),(834,'Josefina','Crisall','1996-01-24','68924 Tomscot Point','4836490244','jcrisalln5@themeforest.net','46506303',2),(835,'Merry','Lesmonde','1979-07-21','39439 Hauk Street','8355488386','mlesmonden6@youtu.be','43984528',2),(836,'Leeann','Setchfield','1952-04-13','6256 West Court','2429002958','lsetchfieldn7@berkeley.edu','43424551',1),(837,'Bridget','Eakeley','1953-04-22','23936 Orin Street','5188514279','beakeleyn8@mysql.com','41352942',1),(838,'Timothee','McSporrin','1984-10-21','1 Namekagon Place','2632395758','tmcsporrinn9@goo.ne.jp','48998357',1),(839,'Flory','Jessep','1951-03-14','689 Buena Vista Plaza','7411387444','fjessepna@i2i.jp','43511294',1),(840,'Joellen','Seager','1997-01-05','76 Homewood Trail','8749093220','jseagernb@sciencedirect.com','45897469',2),(841,'Kylie','Shieldon','1977-08-27','2 Mockingbird Lane','7572048808','kshieldonnc@clickbank.net','49138293',1),(842,'Bert','Paulson','1992-11-24','7 Mosinee Junction','1999595272','bpaulsonnd@soundcloud.com','43105245',2),(843,'Janith','Emmanuele','1974-12-24','4 Delladonna Center','8315409664','jemmanuelene@youku.com','42142021',2),(844,'Ardelle','Sommerlin','1974-03-16','7 Algoma Road','2344155454','asommerlinnf@tinyurl.com','48556206',2),(845,'Sile','Merriman','1975-01-08','568 Texas Parkway','3747727791','smerrimanng@e-recht24.de','47629508',2),(846,'Karoline','Moorcraft','1977-04-09','8 Messerschmidt Street','1364516213','kmoorcraftnh@comcast.net','45374117',1),(847,'Mort','Swafield','1984-02-06','8 Cambridge Circle','2558652902','mswafieldni@1und1.de','44838432',2),(848,'Renault','Eidelman','1969-09-30','40 Bultman Pass','4479836832','reidelmannj@stanford.edu','44152823',1),(849,'Carola','Brounsell','1966-03-03','2733 Kings Park','4072450249','cbrounsellnk@vistaprint.com','46626845',2),(850,'Torry','Wogan','1985-06-23','39 Springview Trail','4608640612','twogannl@i2i.jp','49138629',2),(851,'Gannie','Olenin','1956-04-02','2 Prairieview Way','2216032517','goleninnm@twitpic.com','43581617',1),(852,'Georgiana','Wiggins','1968-04-20','02 Park Meadow Place','9813014233','gwigginsnn@apple.com','43274128',1),(853,'Lise','Halston','1959-10-11','78515 Sheridan Place','6349083473','lhalstonno@multiply.com','42389371',2),(854,'Poul','McCurt','1968-04-30','831 Mitchell Court','1743317892','pmccurtnp@fc2.com','40783992',1),(855,'Kiah','Goldingay','1987-12-07','10 Nevada Parkway','3841724598','kgoldingaynq@multiply.com','48824131',1),(856,'Tremain','Abercrombie','1981-07-07','567 Grayhawk Park','4197462118','tabercrombienr@bbc.co.uk','47997647',2),(857,'Annette','Scoterbosh','1961-08-08','12 Onsgard Street','2328491250','ascoterboshns@mediafire.com','46843335',1),(858,'Loreen','MacAvaddy','1972-08-25','232 Oak Place','6885579261','lmacavaddynt@godaddy.com','41545420',1),(859,'Antonino','Richten','1999-12-06','4347 Darwin Way','6229913214','arichtennu@java.com','44757151',2),(860,'Clio','Greenin','1999-12-16','5751 Leroy Lane','2249552642','cgreeninnv@squarespace.com','48084911',1),(861,'Margy','Ogers','1954-08-19','804 Arapahoe Plaza','9416835564','mogersnw@vk.com','46177895',1),(862,'Brant','Darwood','1959-09-06','57602 Lillian Pass','5707086486','bdarwoodnx@wsj.com','48468402',2),(863,'Skipp','Burchall','1998-02-25','459 Loeprich Terrace','7623844576','sburchallny@bbb.org','48065564',2),(864,'Aggie','Brennans','1987-09-18','8 Brickson Park Trail','9802357917','abrennansnz@virginia.edu','41185935',2),(865,'Julian','Twinborne','1960-10-20','60888 Lyons Lane','4284714020','jtwinborneo0@un.org','43185761',2),(866,'Ansley','Bardnam','1952-12-10','14 Basil Trail','4152578861','abardnamo1@goodreads.com','48287200',2),(867,'Lammond','Fetherstonhaugh','1955-09-08','2399 Mesta Circle','9223917229','lfetherstonhaugho2@earthlink.net','49629263',1),(868,'Jeth','Ply','1993-02-03','7252 Sachtjen Crossing','6969656615','jplyo3@wikimedia.org','44525003',1),(869,'Clevie','Guyot','1964-04-28','337 Gale Parkway','5856300605','cguyoto4@tripod.com','40477231',2),(870,'Carmencita','Wignall','1968-11-22','0 Portage Way','9173741864','cwignallo5@weebly.com','41921720',1),(871,'Caesar','Brice','1970-12-31','3979 Autumn Leaf Plaza','2729593674','cbriceo6@newyorker.com','49102047',2),(872,'Abeu','Vaggers','1992-08-14','3411 Hallows Street','6384804303','avaggerso7@who.int','46522979',2),(873,'Loralee','McLaine','1975-12-18','11 Milwaukee Point','4831693576','lmclaineo8@bandcamp.com','48200729',1),(874,'Staffard','Blodget','1963-10-18','91808 1st Pass','3497907284','sblodgeto9@dagondesign.com','49151912',2),(875,'Netti','Ebbitt','1960-05-21','95 Park Meadow Place','8771343882','nebbittoa@creativecommons.org','48502212',2),(876,'Chelsea','Kort','1967-08-09','34 Fuller Pass','7732712381','ckortob@aboutads.info','41886582',1),(877,'Corene','Kinney','1995-04-13','39210 Summit Trail','6451847698','ckinneyoc@parallels.com','41736776',1),(878,'Malia','Fenny','1995-11-14','72054 Delladonna Park','4356578547','mfennyod@people.com.cn','40029213',2),(879,'Perla','Shadfourth','1980-05-15','5 8th Alley','6296310602','pshadfourthoe@bizjournals.com','45021509',1),(880,'Finlay','Matzkaitis','1996-03-20','5576 Dryden Terrace','2923161926','fmatzkaitisof@wired.com','44510383',1),(881,'Georgetta','Gorgler','1997-09-24','3 Fairview Plaza','8055115318','ggorglerog@nsw.gov.au','49843789',2),(882,'Humberto','Oswald','1962-10-30','1171 Rusk Point','8154715836','hoswaldoh@surveymonkey.com','46461396',1),(883,'Marcelia','O\'Lennane','1986-04-09','42689 Crest Line Avenue','9774287668','molennaneoi@freewebs.com','44727661',1),(884,'Burg','De Minico','1962-05-24','50 Sundown Circle','1214227957','bdeminicooj@youtube.com','43139743',1),(885,'Obidiah','Berkery','1961-05-21','2890 Shopko Hill','6394349688','oberkeryok@printfriendly.com','49677253',2),(886,'Nicoli','Troyes','1983-10-26','68 Oakridge Avenue','1681613821','ntroyesol@princeton.edu','48524793',1),(887,'Jan','Skillett','1988-11-03','4 Rowland Avenue','1945703095','jskillettom@tumblr.com','44905458',1),(888,'Korry','Bearne','1964-06-21','4853 Village Center','3763805849','kbearneon@mashable.com','48690532',1),(889,'Martha','Schimoni','1978-02-24','3843 Burning Wood Avenue','3297293666','mschimonioo@gizmodo.com','44331498',1),(890,'Nicholle','Shearsby','1992-06-02','26 David Alley','6617933328','nshearsbyop@hhs.gov','41952795',1),(891,'Iseabal','McQuaid','1988-11-25','20 Vidon Hill','2189669827','imcquaidoq@blog.com','41665544',1),(892,'Elianora','Geere','1964-11-13','599 Brickson Park Junction','1347880248','egeereor@illinois.edu','43620486',2),(893,'John','Arnull','1985-10-30','2656 Village Green Circle','2153520652','jarnullos@google.de','44835167',2),(894,'Aggy','Thombleson','1978-12-25','56456 Lunder Park','2786820868','athomblesonot@columbia.edu','47497295',2),(895,'Kevin','Maddra','1965-02-05','794 Elgar Parkway','8467768230','kmaddraou@comcast.net','45641803',2),(896,'Roman','Manthorpe','1975-05-21','86 Carpenter Hill','1187575642','rmanthorpeov@a8.net','45925566',1),(897,'Guillemette','Baltrushaitis','1965-07-14','7 Nova Street','8097924370','gbaltrushaitisow@liveinternet.ru','40546511',2),(898,'Curry','Zavattiero','1992-12-27','945 4th Circle','6463040886','czavattieroox@github.io','40519722',2),(899,'Zorina','Antalffy','1987-03-28','4 Londonderry Plaza','7575081863','zantalffyoy@hugedomains.com','47310918',2),(900,'Cora','Seemmonds','1994-06-12','93073 Redwing Court','6351158703','cseemmondsoz@discovery.com','41247040',2),(901,'Libbi','Retallack','1984-11-09','7 Burrows Park','2691250110','lretallackp0@cnn.com','47526755',2),(902,'Ripley','Goodwell','1950-04-14','33924 International Point','4543493213','rgoodwellp1@woothemes.com','40761153',1),(903,'Cesare','Kroger','1971-05-06','038 La Follette Drive','2479060316','ckrogerp2@sun.com','48529272',1),(904,'Almeria','Fanthome','1975-04-10','00929 Talmadge Street','1068723194','afanthomep3@github.io','40697117',2),(905,'Madelin','Sweatman','1985-11-04','2 Sheridan Center','4925232508','msweatmanp4@netlog.com','42872042',1),(906,'Sloan','Simnor','1987-01-27','3 Randy Alley','3263153449','ssimnorp5@cbsnews.com','41937879',2),(907,'Catarina','Smallpiece','1976-10-08','8720 Del Mar Street','7893473834','csmallpiecep6@quantcast.com','45629480',2),(908,'Vicky','Agg','1955-10-07','8487 Colorado Way','7033708391','vaggp7@wp.com','40583606',2),(909,'Lindsey','Stroyan','1992-11-24','2727 Nobel Road','9883933241','lstroyanp8@dell.com','46262716',1),(910,'Abbey','Thorne','1982-12-16','3709 Sutteridge Center','8405560418','athornep9@fastcompany.com','45153510',2),(911,'Arte','Baudacci','1996-07-03','5 Colorado Parkway','7491771003','abaudaccipa@bing.com','42398207',1),(912,'Ryun','Strickler','1976-04-13','074 Macpherson Avenue','7346830371','rstricklerpb@npr.org','42997132',2),(913,'Kit','Chelley','1992-06-04','66 2nd Road','5848861440','kchelleypc@tinypic.com','49982341',1),(914,'Charmain','Dogerty','1984-07-19','3060 Moland Avenue','7402350478','cdogertypd@google.it','44041923',2),(915,'Giorgi','Wheway','1979-12-03','053 Monterey Street','8399250013','gwhewaype@etsy.com','40524728',2),(916,'Frederick','Blankley','1987-12-20','60 Parkside Alley','7357137259','fblankleypf@bing.com','47857759',1),(917,'Aurel','Jeyes','1958-05-11','1 Dryden Park','8503220869','ajeyespg@nasa.gov','48548307',2),(918,'Keefer','Studders','1996-09-16','625 Del Mar Court','9024973613','kstuddersph@ustream.tv','49463780',2),(919,'Chane','Frift','1995-12-09','2288 Farmco Lane','4884365286','cfriftpi@purevolume.com','47209703',1),(920,'Elise','Grabeham','1983-02-10','74183 Cherokee Drive','5051433071','egrabehampj@hao123.com','46660554',2),(921,'Becky','Collingwood','1989-08-12','666 Northridge Circle','9525600039','bcollingwoodpk@xinhuanet.com','49614148',2),(922,'Ainslie','Milby','1978-03-07','058 Dottie Hill','8976730878','amilbypl@spiegel.de','48234478',1),(923,'Xymenes','Mussard','1951-08-02','50265 Shelley Trail','2175888559','xmussardpm@nsw.gov.au','48892617',1),(924,'Mariele','Whisson','1976-12-22','3 Melrose Plaza','3606932235','mwhissonpn@alibaba.com','47166610',2),(925,'Warden','Rodinger','1955-05-16','5 Del Sol Place','4051702585','wrodingerpo@opensource.org','45224214',1),(926,'Geno','Newstead','1996-01-27','070 Center Drive','9779977216','gnewsteadpp@vistaprint.com','44686684',1),(927,'Fowler','Waggatt','1974-10-14','329 Buhler Circle','6212952656','fwaggattpq@usda.gov','41822731',2),(928,'Twila','Lucks','1987-06-24','86 Katie Crossing','7929654456','tluckspr@plala.or.jp','40624378',2),(929,'Ekaterina','Kuller','1979-06-04','989 Dawn Street','9703077040','ekullerps@eventbrite.com','44555898',1),(930,'Brennen','Grzeskowski','1997-12-18','0 Laurel Alley','5446396578','bgrzeskowskipt@hugedomains.com','41870630',1),(931,'Jeromy','Crocetto','1989-05-06','41374 Arkansas Lane','2136660094','jcrocettopu@infoseek.co.jp','43702230',2),(932,'Tiffanie','Reddlesden','1980-02-18','48571 Veith Avenue','9263232624','treddlesdenpv@studiopress.com','41565289',2),(933,'Franklyn','Winfrey','1996-09-29','103 Arkansas Pass','2441824209','fwinfreypw@skyrock.com','40238207',1),(934,'Neile','O\'Giany','1986-10-06','01242 Mccormick Way','9486239319','nogianypx@npr.org','44537103',1),(935,'Raul','Lighton','1986-10-05','089 Elgar Street','3932013886','rlightonpy@pbs.org','48797817',2),(936,'Freda','Rea','1983-04-07','4746 Messerschmidt Terrace','2445653059','freapz@dailymotion.com','41372491',2),(937,'Jacynth','Olczyk','1972-05-19','514 Autumn Leaf Lane','2217310292','jolczykq0@google.ca','45016207',2),(938,'Merola','Sedgefield','1956-06-25','61394 Vermont Road','7614211052','msedgefieldq1@foxnews.com','46151483',2),(939,'Peri','Birdseye','1980-07-22','32738 Manley Way','9026110882','pbirdseyeq2@google.ca','49805211',1),(940,'Peri','Cicco','1976-06-23','8 Clemons Lane','2971222277','pciccoq3@zimbio.com','45033398',1),(941,'Kristian','Eccersley','1983-05-23','5 Beilfuss Alley','7595690113','keccersleyq4@youtube.com','41190151',1),(942,'Esme','Boustead','1974-05-17','20245 Carberry Road','8672238294','ebousteadq5@symantec.com','44278762',1),(943,'Reine','Koopman','1972-10-31','9497 Meadow Valley Point','3025607315','rkoopmanq6@europa.eu','43256473',2),(944,'Phyllis','Knoller','1968-09-09','030 Utah Alley','7724269770','pknollerq7@parallels.com','42423923',1),(945,'Pansie','Allwright','1973-04-07','00 Everett Pass','9585578144','pallwrightq8@geocities.com','42815027',1),(946,'Starla','Gaudin','1986-09-03','404 Mccormick Lane','4751791235','sgaudinq9@yahoo.com','43430341',2),(947,'Edik','Alastair','1966-09-18','5 Fremont Crossing','3277519231','ealastairqa@hugedomains.com','41896984',2),(948,'Lou','McConnal','1965-11-03','43442 Cascade Way','6823647202','lmcconnalqb@bloglovin.com','43887102',1),(949,'Fidole','Rusbridge','1959-01-08','4 Anhalt Court','6574901632','frusbridgeqc@ted.com','42534159',2),(950,'Patricia','Pattingson','1991-04-15','849 Kenwood Alley','7962361109','ppattingsonqd@usda.gov','42312451',1),(951,'Nanny','Ibberson','1952-12-16','26 Lakewood Gardens Plaza','6468506665','nibbersonqe@businessinsider.com','40724086',2),(952,'Grove','Gould','1998-06-26','08 Barby Trail','5278357962','ggouldqf@cam.ac.uk','48005968',2),(953,'Shayla','Howen','1999-03-07','93375 Texas Court','5102898372','showenqg@ca.gov','40096593',2),(954,'Brenna','Risely','1965-12-13','068 Scott Terrace','9874824246','briselyqh@flavors.me','47235370',2),(955,'Baxy','Brodeur','1999-11-10','08114 Blue Bill Park Point','6245690767','bbrodeurqi@bigcartel.com','49078438',2),(956,'Claudine','Piff','1956-11-09','231 Brickson Park Lane','9866585994','cpiffqj@tuttocitta.it','47838425',1),(957,'Ianthe','Edmonstone','1995-01-15','2111 Shasta Alley','9156508446','iedmonstoneqk@google.com.br','41245056',1),(958,'Yolane','Estcot','1990-11-24','6922 Talmadge Way','9121441949','yestcotql@weather.com','45313236',1),(959,'Hugh','MacTeague','1967-02-18','9 Logan Crossing','3611333784','hmacteagueqm@tiny.cc','42846438',1),(960,'Griz','Yacobsohn','1950-12-11','331 Hayes Park','9768836555','gyacobsohnqn@redcross.org','46333933',2),(961,'Celle','Elsey','1963-06-01','6701 Manitowish Drive','8508878475','celseyqo@indiegogo.com','43810625',1),(962,'Abby','Switsur','1999-11-08','508 Sunfield Point','9782486503','aswitsurqp@gov.uk','45226357',1),(963,'Darrelle','Lean','1966-10-03','922 Basil Alley','3852937783','dleanqq@imgur.com','45576635',2),(964,'Elnar','Tungate','1980-09-14','58769 Bartillon Lane','3716353630','etungateqr@mtv.com','47472214',2),(965,'Rupert','Reary','1975-04-03','37401 Schlimgen Junction','8165178419','rrearyqs@globo.com','46888205',1),(966,'Joyann','Orchart','1999-05-06','69 Beilfuss Circle','4796908459','jorchartqt@tiny.cc','43708347',1),(967,'Bronson','Huddleston','1997-03-02','96844 Mayer Terrace','7523770204','bhuddlestonqu@yahoo.co.jp','49400173',1),(968,'Bea','Peinton','1997-09-17','526 Menomonie Center','5756312298','bpeintonqv@netlog.com','48730085',2),(969,'Linn','Mithun','1994-08-24','51608 Longview Junction','1205854395','lmithunqw@nifty.com','40702393',1),(970,'Burton','Iskower','1958-07-29','4 Northland Drive','7181956623','biskowerqx@theglobeandmail.com','49880368',2),(971,'Margy','Jarrel','1954-12-18','67 Anniversary Court','8828488364','mjarrelqy@nhs.uk','49639236',2),(972,'Marielle','Airlie','1976-05-12','49257 Arkansas Pass','1415418443','mairlieqz@java.com','48238783',1),(973,'Ranna','Matveiko','1973-08-31','540 Oak Circle','1883549974','rmatveikor0@usgs.gov','44680959',2),(974,'Jessa','Dorbon','1991-02-09','3006 Towne Alley','5561334576','jdorbonr1@github.io','45244153',1),(975,'Calida','Dober','1971-04-12','58 Messerschmidt Avenue','9443799074','cdoberr2@home.pl','42362119',2),(976,'Dewitt','Chander','1983-01-03','5649 Duke Pass','1553858365','dchanderr3@naver.com','46129025',2),(977,'Tove','Lorraine','1962-01-01','936 Donald Court','4526057507','tlorrainer4@blogtalkradio.com','48557810',1),(978,'Melly','Showl','1997-08-13','183 Ramsey Plaza','8629721604','mshowlr5@amazon.co.uk','46278064',2),(979,'Mair','Houchin','1975-12-16','0 American Ash Crossing','2397542605','mhouchinr6@naver.com','41552448',1),(980,'Dorene','Kintzel','1971-02-15','617 Village Pass','2339832390','dkintzelr7@prweb.com','49524501',1),(981,'Bartel','Eadie','1986-03-28','52323 Manley Alley','8333978043','beadier8@patch.com','43052158',2),(982,'Mateo','Lowdeane','1977-01-26','062 Oneill Crossing','4972647855','mlowdeaner9@diigo.com','40586832',1),(983,'Janessa','Austin','1951-03-21','25 Messerschmidt Terrace','1259162975','jaustinra@networksolutions.com','43039634',1),(984,'Lucretia','Truman','1975-01-20','67 Petterle Circle','7681724656','ltrumanrb@china.com.cn','46710305',2),(985,'Jone','Backsal','1969-05-14','0 Pennsylvania Way','8101005618','jbacksalrc@nsw.gov.au','43971090',1),(986,'Yoshi','Strowther','1997-11-06','5 Division Place','2704688427','ystrowtherrd@booking.com','42480801',1),(987,'Vachel','Niblo','1989-11-19','957 Troy Lane','7415435210','vniblore@artisteer.com','48642058',1),(988,'Milissent','Symones','1960-02-09','261 Stoughton Terrace','3143420005','msymonesrf@shareasale.com','45213630',2),(989,'Dede','Mallall','1975-04-26','995 Scofield Road','4113433650','dmallallrg@kickstarter.com','46836518',1),(990,'Pepi','Ollerearnshaw','1960-08-17','62 Sullivan Lane','6296261349','pollerearnshawrh@wix.com','48064485',1),(991,'Rhianna','Gawkroge','1972-03-24','38744 Buena Vista Avenue','2161189092','rgawkrogeri@wordpress.com','48791463',1),(992,'Abagail','Cove','1993-08-10','743 Heffernan Circle','5076776422','acoverj@census.gov','43301404',1),(993,'Welbie','Barcroft','1988-12-08','44127 Clove Junction','8429277592','wbarcroftrk@dedecms.com','40612645',2),(994,'Regen','Adrain','1983-11-20','304 Talisman Crossing','3857709728','radrainrl@goo.ne.jp','49280352',2),(995,'Jyoti','Mattisson','1959-06-08','78 David Crossing','3615196863','jmattissonrm@blog.com','45353632',2),(996,'Siana','Peer','1969-06-08','99 Gina Pass','8497980159','speerrn@vistaprint.com','43552543',1),(997,'Dwain','Ochterlony','1969-06-12','828 Mandrake Court','5451035035','dochterlonyro@narod.ru','47192353',2),(998,'Jenny','Blennerhassett','1974-09-12','245 Cody Terrace','1479116202','jblennerhassettrp@apache.org','49860746',1),(999,'Harrison','McRitchie','1956-01-23','81955 Armistice Lane','3277031707','hmcritchierq@opera.com','47480846',2),(1000,'Wally','Arthey','1953-05-07','970 Elgar Avenue','5691997083','wartheyrr@woothemes.com','42136733',2);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recorridos`
--

DROP TABLE IF EXISTS `recorridos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recorridos` (
  `id_recorrido` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `duracion_estimada` int DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_recorrido`),
  KEY `idx_recorridos_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recorridos`
--

LOCK TABLES `recorridos` WRITE;
/*!40000 ALTER TABLE `recorridos` DISABLE KEYS */;
INSERT INTO `recorridos` VALUES (1,'Safari Africano',120,'Recorrido en vehículo por la zona africana'),(2,'Paseo por la Sabana',90,'Caminata entre jirafas y elefantes'),(3,'Sendero de las Aves',60,'Visita guiada por el aviario'),(4,'Exploración de Primates',75,'Observación de primates en su hábitat');
/*!40000 ALTER TABLE `recorridos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `descripcion` text,
  `fecha_fundacion` date DEFAULT NULL,
  `area` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'Reserva Natural Agustina','Ubicación X','Esta es una reserva de prueba creada para el trabajo final','2024-01-01',1000.00);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexos`
--

DROP TABLE IF EXISTS `sexos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexos` (
  `id_sexo` int NOT NULL AUTO_INCREMENT,
  `sexo` varchar(10) NOT NULL,
  PRIMARY KEY (`id_sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexos`
--

LOCK TABLES `sexos` WRITE;
/*!40000 ALTER TABLE `sexos` DISABLE KEYS */;
INSERT INTO `sexos` VALUES (1,'Masculino'),(2,'Femenino'),(3,'Otro');
/*!40000 ALTER TABLE `sexos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vt_animales_x_habitats_x_zonas`
--

DROP TABLE IF EXISTS `vt_animales_x_habitats_x_zonas`;
/*!50001 DROP VIEW IF EXISTS `vt_animales_x_habitats_x_zonas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vt_animales_x_habitats_x_zonas` AS SELECT 
 1 AS `id_animal`,
 1 AS `animal`,
 1 AS `nombre comun especie`,
 1 AS `nombre cientifico especie`,
 1 AS `descripcion especie`,
 1 AS `habitat`,
 1 AS `descripcion habitat`,
 1 AS `zona`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_personas_guias_recorridos_horarios`
--

DROP TABLE IF EXISTS `vt_personas_guias_recorridos_horarios`;
/*!50001 DROP VIEW IF EXISTS `vt_personas_guias_recorridos_horarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vt_personas_guias_recorridos_horarios` AS SELECT 
 1 AS `id_persona`,
 1 AS `nombre_persona`,
 1 AS `apellido_persona`,
 1 AS `fecha_nacimiento`,
 1 AS `id_guia`,
 1 AS `fecha_ingreso_guia`,
 1 AS `especialidad_guia`,
 1 AS `id_recorrido`,
 1 AS `nombre_recorrido`,
 1 AS `duracion_estimada`,
 1 AS `descripcion_recorrido`,
 1 AS `horarios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_zonas_animales`
--

DROP TABLE IF EXISTS `vt_zonas_animales`;
/*!50001 DROP VIEW IF EXISTS `vt_zonas_animales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vt_zonas_animales` AS SELECT 
 1 AS `id_zona`,
 1 AS `zona`,
 1 AS `descripcion`,
 1 AS `cantidad de animales`,
 1 AS `especies en zona`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `zonas`
--

DROP TABLE IF EXISTS `zonas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonas` (
  `id_zona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_zona`),
  KEY `idx_zonas_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonas`
--

LOCK TABLES `zonas` WRITE;
/*!40000 ALTER TABLE `zonas` DISABLE KEYS */;
INSERT INTO `zonas` VALUES (1,'Zona Africana','Zona de animales africanos'),(2,'Zona Asiática','Zona de animales asiáticos'),(3,'Zona Americana','Zona de animales americanos');
/*!40000 ALTER TABLE `zonas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonas_por_recorrido`
--

DROP TABLE IF EXISTS `zonas_por_recorrido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonas_por_recorrido` (
  `id_recorrido` int NOT NULL,
  `id_zona` int NOT NULL,
  `orden` int DEFAULT NULL,
  PRIMARY KEY (`id_recorrido`,`id_zona`),
  KEY `fk_zonas_por_recorrido_zona` (`id_zona`),
  CONSTRAINT `fk_zonas_por_recorrido_recorrido` FOREIGN KEY (`id_recorrido`) REFERENCES `recorridos` (`id_recorrido`),
  CONSTRAINT `fk_zonas_por_recorrido_zona` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonas_por_recorrido`
--

LOCK TABLES `zonas_por_recorrido` WRITE;
/*!40000 ALTER TABLE `zonas_por_recorrido` DISABLE KEYS */;
INSERT INTO `zonas_por_recorrido` VALUES (1,1,1),(1,2,2),(2,1,1),(2,2,2),(3,3,1),(4,1,1),(4,3,2);
/*!40000 ALTER TABLE `zonas_por_recorrido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'reservas_naturales'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_indice_biodiversidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_indice_biodiversidad`(p_id_habitat INT) RETURNS decimal(5,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE total_especies INT DEFAULT 0;
    DECLARE total_animales INT DEFAULT 0;
    DECLARE indice_biodiversidad DECIMAL(5, 2) DEFAULT 0;

    -- Calcular el número total de especies en el hábitat
    SELECT COUNT(DISTINCT a.id_especie) INTO total_especies
    FROM animales a
    JOIN animales_por_habitats ah ON a.id_animal = ah.id_animal
    WHERE ah.id_habitat = p_id_habitat
      AND a.fecha_fallecimiento IS NULL;

    -- Calcular el número total de animales en el hábitat
    SELECT COUNT(a.id_animal) INTO total_animales
    FROM animales a
    JOIN animales_por_habitats ah ON a.id_animal = ah.id_animal
    WHERE ah.id_habitat = p_id_habitat
      AND a.fecha_fallecimiento IS NULL;

    -- Calcular el índice de biodiversidad
    IF total_animales > 0 THEN
        SET indice_biodiversidad = (total_especies / total_animales) * 100;
    ELSE
        SET indice_biodiversidad = 0;
    END IF;

    RETURN indice_biodiversidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `recorrido_mayor_duracion_promedio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `recorrido_mayor_duracion_promedio`() RETURNS varchar(100) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE recorrido_nombre VARCHAR(100);
    DECLARE max_duracion_promedio DECIMAL(5, 2);

    -- Encontrar el recorrido con la mayor duración promedio
    SELECT r.nombre INTO recorrido_nombre
    FROM recorridos r
    JOIN horarios_recorridos hr ON r.id_recorrido = hr.id_recorrido
    GROUP BY r.id_recorrido, r.nombre
    ORDER BY AVG(TIME_TO_SEC(hr.hora) / 60) DESC
    LIMIT 1;

    RETURN recorrido_nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `analisis_distribucion_animales_zona_estado_conservacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `analisis_distribucion_animales_zona_estado_conservacion`()
BEGIN
    -- Consultar el número total de animales en cada zona y el desglose por estado de conservación
    SELECT
        z.id_zona,
        z.nombre AS nombre_zona,
        COUNT(a.id_animal) AS total_animales,
        COALESCE(SUM(CASE WHEN e.estado_conservacion = 'En Peligro' THEN 1 ELSE 0 END), 0) AS animales_en_peligro,
        COALESCE(SUM(CASE WHEN e.estado_conservacion = 'Vulnerable' THEN 1 ELSE 0 END), 0) AS animales_vulnerables,
        COALESCE(SUM(CASE WHEN e.estado_conservacion = 'Preocupación Menor' THEN 1 ELSE 0 END), 0) AS animales_preocupacion_menor,
        COALESCE(SUM(CASE WHEN e.estado_conservacion = 'No Evaluado' THEN 1 ELSE 0 END), 0) AS animales_no_evaluado
    FROM zonas z
    LEFT JOIN habitats_por_zonas hz ON z.id_zona = hz.id_zona
    LEFT JOIN habitats h ON hz.id_habitat = h.id_habitat
    LEFT JOIN animales_por_habitats ah ON h.id_habitat = ah.id_habitat
    LEFT JOIN animales a ON ah.id_animal = a.id_animal
    LEFT JOIN especies e ON a.id_especie = e.id_especie
    WHERE a.fecha_fallecimiento IS NULL
    GROUP BY z.id_zona, z.nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `informe_completo_recorridos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `informe_completo_recorridos`(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT
        r.id_recorrido,
        r.nombre AS nombre_recorrido,
        r.duracion_estimada,
        r.descripcion AS descripcion_recorrido,
        
        -- Concatenar zonas
        (SELECT GROUP_CONCAT(DISTINCT z.nombre ORDER BY z.nombre SEPARATOR ', ')
         FROM zonas z
         JOIN zonas_por_recorrido zr ON z.id_zona = zr.id_zona
         WHERE zr.id_recorrido = r.id_recorrido
        ) AS zonas_concatenadas,

        -- Concatenar hábitats
        (SELECT GROUP_CONCAT(DISTINCT h.nombre ORDER BY h.nombre SEPARATOR ', ')
         FROM habitats h
         JOIN habitats_por_zonas hz ON h.id_habitat = hz.id_habitat
         JOIN zonas_por_recorrido zr ON hz.id_zona = zr.id_zona
         WHERE zr.id_recorrido = r.id_recorrido
        ) AS habitats_concatenados,

        -- Detalles de animales
        (SELECT GROUP_CONCAT(DISTINCT CONCAT(
                'Hábitat: ', h.nombre,
                ' (Cantidad de Animales: ', COALESCE(COUNT(a.id_animal), 0), ')'
            ) ORDER BY h.nombre SEPARATOR '; ')
         FROM habitats h
         LEFT JOIN animales_por_habitats ah ON h.id_habitat = ah.id_habitat
         LEFT JOIN animales a ON ah.id_animal = a.id_animal
         JOIN habitats_por_zonas hz ON h.id_habitat = hz.id_habitat
         JOIN zonas_por_recorrido zr ON hz.id_zona = zr.id_zona
         WHERE zr.id_recorrido = r.id_recorrido
         GROUP BY h.id_habitat, h.nombre
        ) AS detalles_animales_concatenados

    FROM recorridos r
    JOIN horarios_recorridos hr ON r.id_recorrido = hr.id_recorrido
    JOIN guias g ON hr.id_guia = g.id_guia
    JOIN personas p ON g.id_persona = p.id_persona
    WHERE hr.dia BETWEEN p_fecha_inicio AND p_fecha_fin
    GROUP BY r.id_recorrido, r.nombre, r.duracion_estimada, r.descripcion
    ORDER BY r.id_recorrido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `informe_detallado_recorridos_guia_animales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `informe_detallado_recorridos_guia_animales`(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT
        r.id_recorrido,
        r.nombre AS nombre_recorrido,
        r.duracion_estimada,
        r.descripcion AS descripcion_recorrido,
        CONCAT(p.nombre, ' ', p.apellido) AS nombre_guia,
        g.especialidad AS especialidad_guia,
        COUNT(hr.id_recorrido) AS cantidad_recorridos_guiados,
        -- Detalle de zonas y hábitats
        GROUP_CONCAT(DISTINCT CONCAT(z.nombre, ' (ID: ', z.id_zona, ')') ORDER BY z.nombre SEPARATOR ', ') AS zonas_concatenadas,
        GROUP_CONCAT(DISTINCT CONCAT(h.nombre, ' (ID: ', h.id_habitat, ')') ORDER BY h.nombre SEPARATOR ', ') AS habitats_concatenados,
        -- Detalle de animales con su estado de conservación
        GROUP_CONCAT(DISTINCT CONCAT(
            a.nombre, ' (Estado: ', e.estado_conservacion, ')'
        ) ORDER BY a.nombre SEPARATOR '; ') AS detalles_animales_concatenados
    FROM recorridos r
    JOIN horarios_recorridos hr ON r.id_recorrido = hr.id_recorrido
    JOIN guias g ON hr.id_guia = g.id_guia
    JOIN personas p ON g.id_persona = p.id_persona
    JOIN zonas_por_recorrido zr ON r.id_recorrido = zr.id_recorrido
    JOIN zonas z ON zr.id_zona = z.id_zona
    JOIN habitats_por_zonas hz ON z.id_zona = hz.id_zona
    JOIN habitats h ON hz.id_habitat = h.id_habitat
    LEFT JOIN animales_por_habitats ah ON h.id_habitat = ah.id_habitat
    LEFT JOIN animales a ON ah.id_animal = a.id_animal
    LEFT JOIN especies e ON a.id_especie = e.id_especie
    WHERE hr.dia BETWEEN p_fecha_inicio AND p_fecha_fin
    GROUP BY r.id_recorrido, r.nombre, r.duracion_estimada, r.descripcion, g.id_guia, p.nombre, p.apellido
    ORDER BY r.id_recorrido;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vt_animales_x_habitats_x_zonas`
--

/*!50001 DROP VIEW IF EXISTS `vt_animales_x_habitats_x_zonas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_animales_x_habitats_x_zonas` AS select `a`.`id_animal` AS `id_animal`,`a`.`nombre` AS `animal`,`e`.`nombre_comun` AS `nombre comun especie`,`e`.`nombre_cientifico` AS `nombre cientifico especie`,`e`.`descripcion` AS `descripcion especie`,`h`.`nombre` AS `habitat`,`h`.`descripcion` AS `descripcion habitat`,`z`.`nombre` AS `zona` from (((((`animales` `a` join `especies` `e` on((`a`.`id_especie` = `e`.`id_especie`))) join `animales_por_habitats` `ah` on((`a`.`id_animal` = `ah`.`id_animal`))) join `habitats` `h` on((`ah`.`id_habitat` = `h`.`id_habitat`))) join `habitats_por_zonas` `hz` on((`h`.`id_habitat` = `hz`.`id_habitat`))) join `zonas` `z` on((`hz`.`id_zona` = `z`.`id_zona`))) where (`a`.`fecha_fallecimiento` is null) order by `z`.`id_zona` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_personas_guias_recorridos_horarios`
--

/*!50001 DROP VIEW IF EXISTS `vt_personas_guias_recorridos_horarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_personas_guias_recorridos_horarios` AS select `p`.`id_persona` AS `id_persona`,`p`.`nombre` AS `nombre_persona`,`p`.`apellido` AS `apellido_persona`,`p`.`fecha_nacimiento` AS `fecha_nacimiento`,`g`.`id_guia` AS `id_guia`,`g`.`fecha_ingreso` AS `fecha_ingreso_guia`,`g`.`especialidad` AS `especialidad_guia`,`r`.`id_recorrido` AS `id_recorrido`,`r`.`nombre` AS `nombre_recorrido`,concat(`r`.`duracion_estimada`,' minutos') AS `duracion_estimada`,`r`.`descripcion` AS `descripcion_recorrido`,group_concat(distinct concat(`hr`.`dia`,' ',`hr`.`hora`) order by `hr`.`dia` ASC,`hr`.`hora` ASC separator ', ') AS `horarios` from (((`personas` `p` join `guias` `g` on((`p`.`id_persona` = `g`.`id_persona`))) join `horarios_recorridos` `hr` on((`hr`.`id_guia` = `g`.`id_guia`))) join `recorridos` `r` on((`hr`.`id_recorrido` = `r`.`id_recorrido`))) where exists(select 1 from `cuidadores` `c` where (`c`.`id_persona` = `p`.`id_persona`)) group by `p`.`id_persona`,`p`.`nombre`,`p`.`apellido`,`p`.`fecha_nacimiento`,`g`.`id_guia`,`g`.`fecha_ingreso`,`g`.`especialidad`,`r`.`id_recorrido`,`r`.`nombre`,`r`.`duracion_estimada`,`r`.`descripcion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_zonas_animales`
--

/*!50001 DROP VIEW IF EXISTS `vt_zonas_animales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_zonas_animales` AS select `z`.`id_zona` AS `id_zona`,`z`.`nombre` AS `zona`,`z`.`descripcion` AS `descripcion`,count(`a`.`id_animal`) AS `cantidad de animales`,group_concat(distinct `e`.`nombre_comun` order by `e`.`nombre_comun` ASC separator ', ') AS `especies en zona` from (((((`zonas` `z` left join `habitats_por_zonas` `hz` on((`z`.`id_zona` = `hz`.`id_zona`))) left join `habitats` `h` on((`hz`.`id_habitat` = `h`.`id_habitat`))) left join `animales_por_habitats` `ah` on((`h`.`id_habitat` = `ah`.`id_habitat`))) left join `animales` `a` on((`ah`.`id_animal` = `a`.`id_animal`))) left join `especies` `e` on((`a`.`id_especie` = `e`.`id_especie`))) where (`a`.`fecha_fallecimiento` is null) group by `z`.`id_zona`,`z`.`nombre`,`z`.`descripcion` */;
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

-- Dump completed on 2024-08-08 10:45:08