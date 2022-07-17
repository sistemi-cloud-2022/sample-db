-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: localhost    Database: sample_db
-- ------------------------------------------------------
-- Server version	5.7.38

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
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acronym` varchar(255) DEFAULT NULL,
  `age_high` int(11) DEFAULT NULL,
  `age_low` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `age_unit_id` int(11) DEFAULT NULL,
  `material_type_id` int(11) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm31mt908cjah7ur1jfu4aii7i` (`age_unit_id`),
  KEY `FKewrin2xiqlcfsxxxyhtau4tx7` (`material_type_id`),
  KEY `FKnmrgx543ojjj7bdn1pag0n638` (`sex_id`),
  CONSTRAINT `FKewrin2xiqlcfsxxxyhtau4tx7` FOREIGN KEY (`material_type_id`) REFERENCES `miabis_material_type` (`id`),
  CONSTRAINT `FKm31mt908cjah7ur1jfu4aii7i` FOREIGN KEY (`age_unit_id`) REFERENCES `static_age_unit` (`id`),
  CONSTRAINT `FKnmrgx543ojjj7bdn1pag0n638` FOREIGN KEY (`sex_id`) REFERENCES `miabis_sex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (1,NULL,NULL,NULL,NULL,'prova',NULL,1,2,2),(2,'tst',29,28,'AD:test di giorno 30/09/2019','test','test',1,4,1),(3,'tst',5,8,NULL,'prova',NULL,1,10,2),(4,'vvvv',34,2,'vvvvv','v','vvvv',1,11,1);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_samples`
--

DROP TABLE IF EXISTS `collections_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_samples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfxa5dx5f90uyvo67sl5ay6p6r` (`collection_id`),
  KEY `FKor8gxuf0m6ajh32fcqgx2pwxq` (`sample_id`),
  CONSTRAINT `FKfxa5dx5f90uyvo67sl5ay6p6r` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`),
  CONSTRAINT `FKor8gxuf0m6ajh32fcqgx2pwxq` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_samples`
--

LOCK TABLES `collections_samples` WRITE;
/*!40000 ALTER TABLE `collections_samples` DISABLE KEYS */;
INSERT INTO `collections_samples` VALUES (3,1,5),(4,1,6),(5,1,2),(6,2,1),(7,2,3),(8,2,7),(10,1,4),(11,1,4),(12,1,4),(13,1,4),(14,1,4),(15,2,1),(16,3,8),(17,3,10);
/*!40000 ALTER TABLE `collections_samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miabis_material_type`
--

DROP TABLE IF EXISTS `miabis_material_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miabis_material_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `definition` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miabis_material_type`
--

LOCK TABLES `miabis_material_type` WRITE;
/*!40000 ALTER TABLE `miabis_material_type` DISABLE KEYS */;
INSERT INTO `miabis_material_type` VALUES (1,'Blood that has not been separated into its various components; blood that has not been modified except for the addition of an anticoagulant.','Blood'),(2,'A long linear double-stranded polymer formed from nucleotides attached to a deoxyribose backbone and found in the nucleus of a cell; associated with the transmission of genetic information.','DNA'),(3,'The material discharged from the bowel during defecation. It consists of undigested food, intestinal mucus, epithelial cells, and bacteria.','Faeces'),(4,'Cells of a single type (human, animal, or plant) that have been adapted to grow continuously in the laboratory and are used in research.','Immortalized Cell Lines'),(5,'An isolated biological agent causing disease; a disease producer e.g. virus, bacterium, prion, other microorganism etc.','Isolated Pathogen'),(6,'Any other type of material taken from a biological entity, e.g. amniotic fluid, cerebrospinal fluid (CSV), mitochondrial RNA.','Other'),(7,'Plasma is the fluid (acellular) portion of the circulating blood, as distinguished from the serum that is the fluid portion of the blood obtained by removal of the fibrin clot and blood cells after coagulation.','Plasma'),(8,'One of two types of nucleic acid made by cells. RNA contains information that has been copied from DNA (the other type of nucleic acid). Cells make several different forms of RNA, and each form has a specific job in the cell.','RNA'),(9,'A clear liquid secreted into the mouth by the salivary glands and mucous glands of the mouth; moistens the mouth and starts the digestion of starches.','Saliva'),(10,'The clear portion of the blood that remains after the removal of the blood cells and the clotting proteins.','Serum'),(11,'An anatomical structure consisting of similarly specialized cells and intercellular matrix, aggregated according to genetically determined spatial relationships, performing a specific function.','Tissue (Frozen)'),(12,'Tissue, formalin fixated and paraffin preserved or equivalent.','Tissue (FFPE)'),(13,'The fluid that is excreted by the kidneys. It is stored in the bladder and discharged through the urethra.','Urine');
/*!40000 ALTER TABLE `miabis_material_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miabis_quantities`
--

DROP TABLE IF EXISTS `miabis_quantities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miabis_quantities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_of_measure` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miabis_quantities`
--

LOCK TABLES `miabis_quantities` WRITE;
/*!40000 ALTER TABLE `miabis_quantities` DISABLE KEYS */;
INSERT INTO `miabis_quantities` VALUES (1,'ml'),(2,'l'),(3,'g'),(4,'mg');
/*!40000 ALTER TABLE `miabis_quantities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miabis_sex`
--

DROP TABLE IF EXISTS `miabis_sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miabis_sex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `definition` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miabis_sex`
--

LOCK TABLES `miabis_sex` WRITE;
/*!40000 ALTER TABLE `miabis_sex` DISABLE KEYS */;
INSERT INTO `miabis_sex` VALUES (1,'Male.','Male'),(2,'Female.','Female'),(3,'A proper value is applicable but not known.','Unknown'),(4,'Undifferentiated, the gender could not be uniquely identified such as hermaphrodite.','Undifferentiated');
/*!40000 ALTER TABLE `miabis_sex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miabis_storage_temperature`
--

DROP TABLE IF EXISTS `miabis_storage_temperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miabis_storage_temperature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `definition` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miabis_storage_temperature`
--

LOCK TABLES `miabis_storage_temperature` WRITE;
/*!40000 ALTER TABLE `miabis_storage_temperature` DISABLE KEYS */;
INSERT INTO `miabis_storage_temperature` VALUES (1,'Room temperature','RT'),(2,'Between 2 °C and 10 °C','2 °C to 10°C'),(3,'Between -18 °C and -35 °C','-18 °C to -35 °C'),(4,'Between -60 °C and -85 °C','-60 °C to -85 °C'),(5,'Liquid Nitrogen, -150 °C to -196 °C','LN'),(6,'Any other temperature or long time storage information','Other');
/*!40000 ALTER TABLE `miabis_storage_temperature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample`
--

DROP TABLE IF EXISTS `sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anatomycal_site` varchar(255) DEFAULT NULL,
  `box_id` int(11) DEFAULT NULL,
  `consent_id` int(11) DEFAULT NULL,
  `donor_id` int(11) DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `location_path` varchar(255) DEFAULT NULL,
  `parent_sample_id` varchar(255) DEFAULT NULL,
  `residual_quantity` float DEFAULT NULL,
  `sample_id` varchar(255) DEFAULT NULL,
  `sampled_time` varchar(255) DEFAULT NULL,
  `sampling_technique` varchar(255) DEFAULT NULL,
  `sprec` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `storage_temperature` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8ow47pyd865rvuqt1ltea1o1x` (`storage_temperature`),
  KEY `FKohlwo8qdfrhntiivmei40yqvl` (`type_id`),
  KEY `FKt0gneju1xc305684t1shkk30r` (`um_id`),
  CONSTRAINT `FK8ow47pyd865rvuqt1ltea1o1x` FOREIGN KEY (`storage_temperature`) REFERENCES `miabis_storage_temperature` (`id`),
  CONSTRAINT `FKohlwo8qdfrhntiivmei40yqvl` FOREIGN KEY (`type_id`) REFERENCES `sample_type` (`id`),
  CONSTRAINT `FKt0gneju1xc305684t1shkk30r` FOREIGN KEY (`um_id`) REFERENCES `miabis_quantities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample`
--

LOCK TABLES `sample` WRITE;
/*!40000 ALTER TABLE `sample` DISABLE KEYS */;
INSERT INTO `sample` VALUES (1,NULL,NULL,NULL,30,'9','Freezer 1/Division 1/Drawer 1/Slot 3',NULL,150,'SA903F94462','2018-05-25 15:12:00',NULL,'CLN-A12-B-B-ACA-G-T',1,1,39,1),(2,'ddd',NULL,NULL,NULL,'7','Freezer 1/Division 1/Drawer 1/Slot 1',NULL,NULL,'SC7D2A18B40','2019-08-08 09:00:00',NULL,'CEN-A06-B-B-ALL-B-D',1,1,38,1),(3,NULL,1,NULL,NULL,'7','Freezer 1/Division 1/Drawer 1/Slot 1',NULL,NULL,'SCB56E14484',NULL,NULL,'AMN-ADD-J-N-N-J-N',NULL,NULL,2,1),(4,NULL,1,1,22,'2','Freezer 2',NULL,NULL,'S89A9AC7486',NULL,'klòkokpèok',NULL,NULL,2,39,3),(5,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'S8B94326D91',NULL,NULL,'AMN-ACD-N-J-N-J-N',NULL,NULL,2,NULL),(6,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'SFB2CAB69B5',NULL,NULL,NULL,NULL,NULL,2,NULL),(7,NULL,NULL,NULL,NULL,'2','Freezer 2',NULL,NULL,'S73525269DD','2019-01-01 00:00:00',NULL,NULL,1,1,2,1),(8,NULL,NULL,NULL,24,'2','Freezer 2',NULL,NULL,'S82C2BF4479','2018-05-25 15:12:00',NULL,NULL,1,2,3,1),(9,NULL,NULL,NULL,25,'2','Freezer 2',NULL,NULL,'S956A6E8C82','2018-05-25 15:12:00',NULL,NULL,1,2,38,1),(10,NULL,NULL,NULL,26,'2','Freezer 2',NULL,NULL,'S64A719ECA1','2019-02-04 00:00:00',NULL,NULL,1,1,38,1),(11,NULL,NULL,NULL,NULL,'2','Freezer 2',NULL,NULL,'SC7F2017DE8','2019-01-01 00:01:00',NULL,NULL,1,5,38,1);
/*!40000 ALTER TABLE `sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_type`
--

DROP TABLE IF EXISTS `sample_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acronym` varchar(255) DEFAULT NULL,
  `denomination` varchar(255) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_type`
--

LOCK TABLES `sample_type` WRITE;
/*!40000 ALTER TABLE `sample_type` DISABLE KEYS */;
INSERT INTO `sample_type` VALUES (1,'ASC','Ascites Fluid',0),(2,'AMN','Amniotic Fluid',0),(3,'BAL','Bronchoalveolar Lavage',0),(4,'BLD','Blood (whole)',0),(5,'BMA','Bone Marrow Aspirate',0),(6,'BMK','Breast Milk',0),(7,'BUC','Buccal Cells',0),(8,'BUF','Unficolled buffy coat, viable',0),(9,'BFF','Unficolled buffy coat, non viable',0),(10,'CEL','Ficoll mononuclear cells, viable',0),(11,'CEN','Fresh cells from nonblooc specimen type',0),(12,'CLN','Cells from nonblood speciment type (e.g., ascites, amniotic) viable',0),(13,'CSF','Cord Blood',0),(14,'CSF','Cerebrospinal Fluid',0),(15,'CTC','Enriched (physichochemically) circulating tumor cells',0),(16,'DWB','Dried whole blood (e.g., Gunthrie cards)',0),(17,'NAS','Nasal Washing',0),(18,'PEL','Ficoll mononuclear cells, nonviable',0),(19,'PEN','Cells from nonblood specimen type (e.g, ascites, amniotic) nonviable',0),(20,'PFL','Pleural Fluid',0),(21,'PLP','Dental Pulp',0),(22,'PL1','Plasma, single spun',0),(23,'PL2','Plasma, double spun',0),(24,'RBC','Red blood cells',0),(25,'SAL','Saliva',0),(26,'SEM','Semen',0),(27,'SER','Serum',0),(28,'SPT','Sputum',0),(29,'STL','Stool',0),(30,'SYN','Synovial Fluid',0),(31,'TER','Tears',0),(32,'U24','24h Urine',0),(33,'URN','Urine, random (\"spot\")',0),(34,'URM','Urine, first morning',0),(35,'URT','Urine, timed',0),(36,'ZZZ','Other',0),(37,'BON','Bone',1),(38,'CEN','Fresh cells from nonblood specimen type (e.g., biopsy)',1),(39,'CLN','Cells from nonblood specimen type (e.g., dissociated tissue), viable',1),(40,'FNA','Cells from fine needle aspirate',1),(41,'HAR','Hair',1),(42,'LCM','Cells from lase capture microdissected tissue',1),(43,'NAL','Nails',1),(44,'PEN','Cells from nonblood specimen type (e.g., dissociated tissue), nonviable',1),(45,'PLC','Placenta',1),(46,'TIS','Solid Tissue',1),(47,'TCM','Disrupted tissue, nonviable',1),(48,'TTH','Teeth',1),(49,'ZZZ','Other',1);
/*!40000 ALTER TABLE `sample_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_age_unit`
--

DROP TABLE IF EXISTS `static_age_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_age_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_age_unit`
--

LOCK TABLES `static_age_unit` WRITE;
/*!40000 ALTER TABLE `static_age_unit` DISABLE KEYS */;
INSERT INTO `static_age_unit` VALUES (1,'Years'),(2,'Months'),(3,'Weeks'),(4,'Days');
/*!40000 ALTER TABLE `static_age_unit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-17 14:11:08
