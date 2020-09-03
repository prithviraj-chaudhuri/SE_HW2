-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: se-hw2.cth1wiuws3gg.us-east-2.rds.amazonaws.com    Database: hw2
-- ------------------------------------------------------
-- Server version	8.0.17

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add token',1,'add_token'),(2,'Can change token',1,'change_token'),(3,'Can delete token',1,'delete_token'),(4,'Can view token',1,'view_token'),(5,'Can add record',2,'add_record'),(6,'Can change record',2,'change_record'),(7,'Can delete record',2,'delete_record'),(8,'Can view record',2,'view_record'),(9,'Can add log entry',3,'add_logentry'),(10,'Can change log entry',3,'change_logentry'),(11,'Can delete log entry',3,'delete_logentry'),(12,'Can view log entry',3,'view_logentry'),(13,'Can add permission',4,'add_permission'),(14,'Can change permission',4,'change_permission'),(15,'Can delete permission',4,'delete_permission'),(16,'Can view permission',4,'view_permission'),(17,'Can add group',5,'add_group'),(18,'Can change group',5,'change_group'),(19,'Can delete group',5,'delete_group'),(20,'Can view group',5,'view_group'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add content type',7,'add_contenttype'),(26,'Can change content type',7,'change_contenttype'),(27,'Can delete content type',7,'delete_contenttype'),(28,'Can view content type',7,'view_contenttype'),(29,'Can add session',8,'add_session'),(30,'Can change session',8,'change_session'),(31,'Can delete session',8,'delete_session'),(32,'Can view session',8,'view_session'),(33,'Can add questionnaire',9,'add_questionnaire'),(34,'Can change questionnaire',9,'change_questionnaire'),(35,'Can delete questionnaire',9,'delete_questionnaire'),(36,'Can view questionnaire',9,'view_questionnaire'),(37,'Can add questionnaire response',10,'add_questionnaireresponse'),(38,'Can change questionnaire response',10,'change_questionnaireresponse'),(39,'Can delete questionnaire response',10,'delete_questionnaireresponse'),(40,'Can view questionnaire response',10,'view_questionnaireresponse'),(41,'Can add scripts',11,'add_scripts'),(42,'Can change scripts',11,'change_scripts'),(43,'Can delete scripts',11,'delete_scripts'),(44,'Can view scripts',11,'view_scripts');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (3,'admin','logentry'),(5,'auth','group'),(4,'auth','permission'),(6,'auth','user'),(7,'contenttypes','contenttype'),(9,'frontend','questionnaire'),(10,'frontend','questionnaireresponse'),(11,'gol','scripts'),(2,'records','record'),(8,'sessions','session'),(1,'tokens','token');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-08-21 22:30:22.245532'),(2,'auth','0001_initial','2020-08-21 22:30:22.421089'),(3,'admin','0001_initial','2020-08-21 22:30:22.769242'),(4,'admin','0002_logentry_remove_auto_add','2020-08-21 22:30:22.866715'),(5,'admin','0003_logentry_add_action_flag_choices','2020-08-21 22:30:22.880729'),(6,'contenttypes','0002_remove_content_type_name','2020-08-21 22:30:22.965348'),(7,'auth','0002_alter_permission_name_max_length','2020-08-21 22:30:23.020424'),(8,'auth','0003_alter_user_email_max_length','2020-08-21 22:30:23.048173'),(9,'auth','0004_alter_user_username_opts','2020-08-21 22:30:23.062018'),(10,'auth','0005_alter_user_last_login_null','2020-08-21 22:30:23.112984'),(11,'auth','0006_require_contenttypes_0002','2020-08-21 22:30:23.120385'),(12,'auth','0007_alter_validators_add_error_messages','2020-08-21 22:30:23.135294'),(13,'auth','0008_alter_user_username_max_length','2020-08-21 22:30:23.190735'),(14,'auth','0009_alter_user_last_name_max_length','2020-08-21 22:30:23.242571'),(15,'auth','0010_alter_group_name_max_length','2020-08-21 22:30:23.267165'),(16,'auth','0011_update_proxy_permissions','2020-08-21 22:30:23.284563'),(17,'auth','0012_alter_user_first_name_max_length','2020-08-21 22:30:23.338658'),(18,'records','0001_initial','2020-08-21 22:30:23.367965'),(19,'records','0002_record_token','2020-08-21 22:30:23.397160'),(20,'sessions','0001_initial','2020-08-21 22:30:23.425153'),(21,'tokens','0001_initial','2020-08-21 22:30:23.470076'),(22,'frontend','0001_initial','2020-08-24 05:29:48.058550'),(23,'frontend','0002_questionnaireresponse','2020-08-24 05:29:48.090181'),(24,'gol','0001_initial','2020-08-24 05:29:48.122100'),(25,'records','0003_auto_20200823_1854','2020-08-24 05:29:48.213071'),(26,'gol','0002_scripts_readme_link','2020-08-24 14:54:10.880352'),(27,'records','0004_auto_20200824_1454','2020-08-24 14:54:10.917948'),(28,'records','0004_auto_20200825_0210','2020-08-25 02:11:00.763907');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_questionnaire`
--

DROP TABLE IF EXISTS `log_questionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_questionnaire` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(10000) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_questionnaire`
--

LOCK TABLES `log_questionnaire` WRITE;
/*!40000 ALTER TABLE `log_questionnaire` DISABLE KEYS */;
INSERT INTO `log_questionnaire` VALUES (1,'How well do you understand Game of life? I understand what is happening. Rate on from 1 to 5, 5 being you understand it completely.'),(2,'If asked to code from scratch, rate from 1 to 5 how comformtable will you be in doing that, 5 being you can code it sleeping.'),(3,'How familiar are you with the rules of game of life? Rate from 1 to 5, 5 being you know all the rules.'),(4,'Let us know of your programming skills by rating them from 1 to 5, 5 being you are a pro.'),(5,'How long have you been coding? Rate from 1 to 5, 1 means 1+ years, 2 means 2+ years and so on.'),(6,'Rate your programming experience with GoLang from 1 to 5, 5 being pro.'),(7,'Rate your programming experience with Rust from 1 to 5, 5 being pro.'),(8,'Rate your programming experience with Fortran from 1 to 5, 5 being pro.');
/*!40000 ALTER TABLE `log_questionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_questionnaire_response`
--

DROP TABLE IF EXISTS `log_questionnaire_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_questionnaire_response` (
  `log_questionnaire_response_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `response` int(10) unsigned NOT NULL,
  PRIMARY KEY (`log_questionnaire_response_id`),
  CONSTRAINT `log_questionnaire_response_chk_1` CHECK ((`response` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_questionnaire_response`
--

LOCK TABLES `log_questionnaire_response` WRITE;
/*!40000 ALTER TABLE `log_questionnaire_response` DISABLE KEYS */;
INSERT INTO `log_questionnaire_response` VALUES (129,'1',1,2),(130,'1',2,3),(131,'1',3,4),(132,'1',4,2),(133,'1',5,1),(134,'1',6,1),(135,'1',7,2),(136,'1',8,3),(137,'r250012',1,1),(138,'r250012',2,2),(139,'r250012',3,2),(140,'r250012',4,3),(141,'r250012',5,3),(142,'r250012',6,3),(143,'r250012',7,1),(144,'r250012',8,1),(145,'r643061',1,4),(146,'r643061',2,4),(147,'r643061',3,5),(148,'r643061',4,3),(149,'r643061',5,3),(150,'r643061',6,1),(151,'r643061',7,1),(152,'r643061',8,1),(153,'r817685',1,4),(154,'r817685',2,4),(155,'r817685',3,5),(156,'r817685',4,3),(157,'r817685',5,1),(158,'r817685',6,1),(159,'r817685',7,1),(160,'r817685',8,1),(161,'r115684',1,4),(162,'r115684',2,3),(163,'r115684',3,4),(164,'r115684',4,3),(165,'r115684',5,2),(166,'r115684',6,1),(167,'r115684',7,1),(168,'r115684',8,1),(169,'r406365',1,4),(170,'r406365',2,4),(171,'r406365',3,4),(172,'r406365',4,3),(173,'r406365',5,3),(174,'r406365',6,1),(175,'r406365',7,1),(176,'r406365',8,1),(177,'r598633',1,4),(178,'r598633',2,3),(179,'r598633',3,4),(180,'r598633',4,4),(181,'r598633',5,3),(182,'r598633',6,2),(183,'r598633',7,1),(184,'r598633',8,1),(185,'r517877',1,2),(186,'r517877',2,2),(187,'r517877',3,2),(188,'r517877',4,4),(189,'r517877',5,4),(190,'r517877',6,1),(191,'r517877',7,1),(192,'r517877',8,1),(193,'r418865',1,4),(194,'r418865',2,3),(195,'r418865',3,4),(196,'r418865',4,3),(197,'r418865',5,5),(198,'r418865',6,1),(199,'r418865',7,1),(200,'r418865',8,1),(201,'2',1,5),(202,'2',2,4),(203,'2',3,4),(204,'2',4,4),(205,'2',5,5),(206,'2',6,1),(207,'2',7,1),(208,'2',8,1),(209,'r408855',1,5),(210,'r408855',2,3),(211,'r408855',3,5),(212,'r408855',4,4),(213,'r408855',5,4),(214,'r408855',6,2),(215,'r408855',7,1),(216,'r408855',8,1),(217,'r976401',1,5),(218,'r976401',2,4),(219,'r976401',3,4),(220,'r976401',4,3),(221,'r976401',5,5),(222,'r976401',6,1),(223,'r976401',7,3),(224,'r976401',8,1);
/*!40000 ALTER TABLE `log_questionnaire_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_record`
--

DROP TABLE IF EXISTS `log_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_record` (
  `log_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `language` bigint(20) NOT NULL,
  `start_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL,
  `token` varchar(20) NOT NULL,
  `duration` varchar(200) NOT NULL,
  `debug_successful` tinyint(1) NOT NULL,
  PRIMARY KEY (`log_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_record`
--

LOCK TABLES `log_record` WRITE;
/*!40000 ALTER TABLE `log_record` DISABLE KEYS */;
INSERT INTO `log_record` VALUES (42,1,'2020-08-28T19:32:11.032678','2020-08-28T19:44:03.936166','r250012','712.903488',1),(43,2,'2020-08-28T19:44:31.446986','2020-08-28T19:50:14.489249','r250012','343.042263',1),(44,3,'2020-08-28T19:51:39.177042','2020-08-28T19:54:41.073475','r250012','181.896433',1),(45,3,'2020-08-28T22:05:27.430997','2020-08-28T22:18:30.249607','r643061','782.81861',0),(46,1,'2020-08-28T22:09:25.170461','2020-08-28T22:16:00.005543','r115684','394.835082',1),(47,1,'2020-08-28T22:09:25.531756','2020-08-28T22:15:57.348027','r817685','391.816271',1),(48,2,'2020-08-28T22:16:05.818362','2020-08-28T22:33:05.443034','r817685','1019.624672',1),(49,2,'2020-08-28T22:16:08.734821','2020-08-28T22:33:17.534351','r115684','1028.79953',1),(50,1,'2020-08-28T22:18:38.630730','2020-08-28T22:29:39.712877','r643061','661.082147',0),(51,1,'2020-08-28T22:24:26.085325','2020-08-28T22:40:25.124646','r406365','959.039321',1),(52,1,'2020-08-28T22:30:51.206184','2020-08-28T22:39:09.659798','r598633','498.453614',1),(53,3,'2020-08-28T22:33:09.689486','2020-08-28T22:34:44.936861','r817685','95.247375',1),(54,3,'2020-08-28T22:33:22.694538','2020-08-28T22:35:24.882357','r115684','122.187819',1),(55,2,'2020-08-28T22:39:46.949234','2020-08-28T22:44:50.821577','r598633','303.872343',1),(56,2,'2020-08-28T22:40:49.955587','2020-08-28T22:44:44.988490','r406365','235.032903',1),(57,3,'2020-08-28T22:44:50.491825','2020-08-28T22:47:58.218304','r406365','187.726479',1),(58,3,'2020-08-28T22:45:05.940013','2020-08-28T22:48:25.494103','r598633','199.55409',1),(59,1,'2020-08-28T23:02:03.744979','2020-08-28T23:30:05.775385','r517877','1682.030406',0),(60,3,'2020-08-29T15:41:12.572667','2020-08-29T15:45:31.237429','r418865','258.664762',1),(61,2,'2020-08-29T15:45:40.607924','2020-08-29T15:56:13.467313','r418865','632.859389',1),(62,1,'2020-08-29T15:56:19.948495','2020-08-29T16:03:13.431860','r418865','413.483365',1),(64,1,'2020-08-30T19:13:34.279874','2020-08-30T19:18:44.488127','r408855','310.208253',1),(65,2,'2020-08-30T19:18:53.096032','2020-08-30T19:27:01.697835','r408855','488.601803',1),(66,3,'2020-08-30T19:27:11.494733','2020-08-30T19:33:29.468277','r408855','377.973544',1),(67,1,'2020-08-31T18:04:40.678335','2020-08-31T18:18:58.985057','r976401','858.306722',1),(68,2,'2020-08-31T18:19:29.053825','2020-08-31T18:32:58.032214','r976401','808.978389',1),(69,3,'2020-08-31T18:33:46.515192','2020-08-31T18:39:18.415970','r976401','331.900778',1);
/*!40000 ALTER TABLE `log_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_token`
--

DROP TABLE IF EXISTS `log_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_token` (
  `log_token_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(100) NOT NULL,
  `token_used` tinyint(1) NOT NULL,
  PRIMARY KEY (`log_token_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_token`
--

LOCK TABLES `log_token` WRITE;
/*!40000 ALTER TABLE `log_token` DISABLE KEYS */;
INSERT INTO `log_token` VALUES (35,'r643061',1),(36,'r517877',1),(37,'r250012',1),(38,'r598633',1),(39,'r406365',1),(40,'r418865',1),(41,'r408855',1),(42,'r976401',1),(43,'r817685',1),(44,'r115684',1),(45,'1',1),(46,'2',1);
/*!40000 ALTER TABLE `log_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scripts` (
  `script_id` int(11) NOT NULL AUTO_INCREMENT,
  `script_title` varchar(100) NOT NULL,
  `download_link` varchar(500) NOT NULL,
  `raw_url` varchar(500) NOT NULL,
  `readme_link` varchar(500) NOT NULL,
  PRIMARY KEY (`script_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (1,'GoLang','https://ideone.com/','https://raw.githubusercontent.com/Ayushi61/SE_HW2/master/go/life_bug.go','https://github.com/Ayushi61/SE_HW2/blob/master/go/README.md'),(2,'Rust','https://play.rust-lang.org/','https://raw.githubusercontent.com/Ayushi61/SE_HW2/master/rust/rust_gol_buggy.rs','https://github.com/Ayushi61/SE_HW2/blob/master/rust/README.md'),(3,'Fortran','https://www.onlinegdb.com/','https://raw.githubusercontent.com/Ayushi61/SE_HW2/master/fortran/life_bug.f90','https://github.com/Ayushi61/SE_HW2/blob/master/fortran/README.md');
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-03 18:10:29
