-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: zoologico
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `id_animal` varchar(4) NOT NULL,
  `nombre_animal` varchar(40) DEFAULT NULL,
  `apodo_animal` varchar(40) DEFAULT NULL,
  `familia_animal` varchar(40) DEFAULT NULL,
  `descripcion_animal` text,
  `id_cuidador` varchar(4) NOT NULL,
  `id_entrega` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `id_entrega` (`id_entrega`),
  KEY `id_cuidador` (`id_cuidador`),
  CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id_entrega`) REFERENCES `comida` (`id_entrega`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`id_cuidador`) REFERENCES `cuidador` (`id_cuidador`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES ('0046','Cotorra','Pepe','Aves','Animal super hablador','0001','1006'),('0047','Guacamayo','','Aves','Un volador que vuela','0002','1007'),('0048','Tucan','Che','Aves','Un argentino papa','0003','1008'),('0049','Pavo Real','','Aves','Tiene hartas plumas','0004','1006'),('0050','Condor','Condorito','Aves','Icono chileno','0005','1007'),('0051','Loro','','Aves','Bueno para hablar el compa','0006','1008'),('0052','Buho','Chuncho','Aves','Mirada intensa','0007','1006'),('0053','Ciervo','Bambi','Mamifero','Presa preferida de los carnivoros','0008','1012'),('0054','Leon','Simba','Mamifero','El rey de todos los animales','0009','1003'),('0055','Cebra','Marty','Mamifero','Tiene los colores mas bonitos de todo el mundo','0010','1013'),('0056','Elefante','','Mamifero','Tiene una trompa larga','0011','1014'),('0057','Jirafa','Melman','Mamifero','Tiene un cuello largisimo y es mudo','0012','1000'),('0058','Hipopotamo','Gloria','Mamifero','Tiene la boca tan grande que es capaz de comer a una persona de un mordisco','0013','1001'),('0059','Tigre de Bengala','Diego','Mamifero','Animal con colores super lindos','0014','1004'),('0060','Puma','','Mamifero','Una marca deportiva se inspiro en este animal','0015','1005'),('0061','Llama','','Mamifero','Escupe demasiado','0001','1002'),('0062','Alpaca','','Mamifero','Originaria del norte de Chile','0002','1000'),('0063','Huemul','','Mamifero','Se parece a la llama','0003','1001'),('0064','Zorro','Nick Wilde','Mamifero','Vive por las monta├▒as','0004','1003'),('0065','Pantera','','Mamifero','Animal que al asechar es silencioso','0005','1004'),('0066','Koala','','Mamifero','Es bueno para dormir','0006','1000'),('0067','Tortuga Marina','Chiki','Reptiles','Es suaaaaveeee','0007','1010'),('0068','Cocodrilo','','Reptiles','Si te le acercas no te suelta jamas','0008','1004');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comida`
--

DROP TABLE IF EXISTS `comida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comida` (
  `id_entrega` varchar(4) NOT NULL,
  `nombre_comida` varchar(20) NOT NULL,
  `id_proveedor` varchar(4) NOT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `fk_entrega_comida` (`id_proveedor`),
  CONSTRAINT `fk_entrega_comida` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comida`
--

LOCK TABLES `comida` WRITE;
/*!40000 ALTER TABLE `comida` DISABLE KEYS */;
INSERT INTO `comida` VALUES ('1000','Frutas','0016'),('1001','Frutas','0017'),('1002','Frutas','0018'),('1003','Carne','0019'),('1004','Carne','0020'),('1005','Carne','0021'),('1006','Semillas','0022'),('1007','Semillas','0023'),('1008','Semillas','0024'),('1009','Pescado','0025'),('1010','Pescado','0026'),('1011','Pescado','0027'),('1012','Verduras','0028'),('1013','Verduras','0029'),('1014','Verduras','0030');
/*!40000 ALTER TABLE `comida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuida`
--

DROP TABLE IF EXISTS `cuida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuida` (
  `id_animal` varchar(4) NOT NULL,
  `id_vet` varchar(4) NOT NULL,
  PRIMARY KEY (`id_animal`,`id_vet`),
  KEY `id_vet` (`id_vet`),
  CONSTRAINT `cuida_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuida_ibfk_2` FOREIGN KEY (`id_vet`) REFERENCES `veterinario` (`id_vet`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuida`
--

LOCK TABLES `cuida` WRITE;
/*!40000 ALTER TABLE `cuida` DISABLE KEYS */;
INSERT INTO `cuida` VALUES ('0046','0031'),('0061','0031'),('0047','0032'),('0062','0032'),('0048','0033'),('0063','0033'),('0049','0034'),('0064','0034'),('0050','0035'),('0065','0035'),('0051','0036'),('0066','0036'),('0052','0037'),('0067','0037'),('0053','0038'),('0068','0038'),('0054','0039'),('0055','0040'),('0056','0041'),('0057','0042'),('0058','0043'),('0059','0044'),('0060','0045');
/*!40000 ALTER TABLE `cuida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuidador`
--

DROP TABLE IF EXISTS `cuidador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuidador` (
  `id_cuidador` varchar(4) NOT NULL,
  `nombre_cuidador` varchar(20) NOT NULL,
  `apellido_cuidador` varchar(20) NOT NULL,
  `telefono_cuidador` varchar(9) NOT NULL,
  `email_cuidador` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cuidador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuidador`
--

LOCK TABLES `cuidador` WRITE;
/*!40000 ALTER TABLE `cuidador` DISABLE KEYS */;
INSERT INTO `cuidador` VALUES ('0001','David','Navarro','989898762','davidn@gmail.com'),('0002','Karla','Ruiz','919191918','karlar@gmail.com'),('0003','Jose','Diaz','929292927','josed@gmail.com'),('0004','Alejandra','Serrano','939393937','alejandras@gmail.com'),('0005','Ana','Hernandez','949494948','anah@gmail.com'),('0006','Lucia','Munoz','959595956','luciam@gmail.com'),('0007','Rafael','Saez','969696964','rafaels@gmail.com'),('0008','Laura','Romero','979797975','laurar@gmail.com'),('0009','Juan','Rubio','978263745','juanr@gmail.com'),('0010','Luis','Alfaro','912311123','luisa@gmail.com'),('0011','Teresa','Molina','990982303','teresam@gmail.com'),('0012','Joaquin','Castillo','900013675','joaquinc@gmail.com'),('0013','Elena','Lozano','989393330','elenal@gmail.com'),('0014','Sergio','Picazo','912349900','sergiop@gmail.com'),('0015','Manuela','Ortega','989001329','manuelao@gmail.com');
/*!40000 ALTER TABLE `cuidador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` varchar(4) NOT NULL,
  `nombre_proveedor` varchar(20) NOT NULL,
  `telefono_proveedor` varchar(9) NOT NULL,
  `email_proveedor` varchar(20) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('0016','Rosa Morcillo','910026378','rosa@gmail.com'),('0017','Andres Cano','909087482','andres@gmail.com'),('0018','Ramon Garrido','911206792','ramon@gmail.com'),('0019','Raul Torres','997853412','raul@gmail.com'),('0020','Mercedes Marin','933278194','mercedes@gmail.com'),('0021','Alberto Cuenca','942100979','alberto@gmail.com'),('0022','Enrique Gil','912222890','enrique@gmail.com'),('0023','Irene Molina','900978239','irene@gmail.com'),('0024','Alvaro Ortiz','998887421','alvaro@gmail.com'),('0025','Beatriz Calero','912345671','beatriz@gmail.com'),('0026','Angela Cebrian','956743657','angela@gmail.com'),('0027','Diego Rodenas','912312312','diego@gmail.com'),('0028','Julian Alarcon','909097652','julian@gmail.com'),('0029','Rocio Blazquez','999122156','rocio@gmail.com'),('0030','Emilio Valero','998765432','emilio@gmail.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinario` (
  `id_vet` varchar(4) NOT NULL,
  `nombre_vet` varchar(20) DEFAULT NULL,
  `apellido_vet` varchar(20) NOT NULL,
  `turno_vet` varchar(2) NOT NULL,
  PRIMARY KEY (`id_vet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinario`
--

LOCK TABLES `veterinario` WRITE;
/*!40000 ALTER TABLE `veterinario` DISABLE KEYS */;
INSERT INTO `veterinario` VALUES ('0031','Andres','Fuentes','6'),('0032','Camila','Araya','5'),('0033','Omar','Martinez','7'),('0034','Cesar','Veliz','8'),('0035','Antonio','Garcia','8'),('0036','Maria','Martinez','8'),('0037','Francisco','Lopez','6'),('0038','Isabel','Sanchez','4'),('0039','Manuel','Gonzalez','6'),('0040','Carmen','Gomez','4'),('0041','Jesus','Fernandez','4'),('0042','Pilar','Moreno','7'),('0043','Miguel','Jimenez','6'),('0044','Javiera','Perez','7'),('0045','Antonia','Rodriguez','8');
/*!40000 ALTER TABLE `veterinario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-05 16:32:26
