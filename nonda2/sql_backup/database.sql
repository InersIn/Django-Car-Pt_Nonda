-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: PtNonda
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_customers`
--

DROP TABLE IF EXISTS `accounts_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CustomerAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CustomerGender` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CustomerPhone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CustomerAnnualIncome` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CustomerName` (`CustomerName`),
  UNIQUE KEY `CustomerAddress` (`CustomerAddress`),
  UNIQUE KEY `CustomerGender` (`CustomerGender`),
  UNIQUE KEY `CustomerPhone` (`CustomerPhone`),
  UNIQUE KEY `CustomerAnnualIncome` (`CustomerAnnualIncome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customers`
--

LOCK TABLES `accounts_customers` WRITE;
/*!40000 ALTER TABLE `accounts_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_customer` tinyint(1) DEFAULT NULL,
  `is_dealer` tinyint(1) DEFAULT NULL,
  `is_supplier` tinyint(1) DEFAULT NULL,
  `is_hire` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'pbkdf2_sha256$260000$tgqxslSWepzXdvTKMSAJ5K$UJYMvoiDARPohwtbgXtK0X95LjMq3KSreic9uZwIZEw=','2021-06-22 05:19:48.643879',1,'admin','','','',1,1,'2021-06-22 03:14:15.297256',0,0,0,0),(2,'pbkdf2_sha256$260000$RBbBR6pxxYNqGrQzmbLebn$VS0xWHza8UmA1wyXpfTCEwQnPS3VVUYwBR+zdYYHxkY=','2021-06-22 05:18:29.484907',0,'udin','','','',0,1,'2021-06-22 03:15:04.686160',0,1,0,1),(3,'pbkdf2_sha256$260000$V78vwqa9TRExjc6pmWS4mN$Ldvv/OLc+0y0exF25k07Oyk/oYuMz7sxNtFb9OOLosg=','2021-06-22 13:42:41.555852',0,'dwi','','','',0,1,'2021-06-22 03:59:54.560321',1,0,0,1),(4,'pbkdf2_sha256$260000$Ammmar6PQ35AyLttTuFRJZ$ISTEKwKUScd4fUAlqPtmd4T8nlAcGHjxn2LYSmDqn+k=','2021-06-22 13:40:26.486583',0,'adit','','','',0,1,'2021-06-22 13:40:15.582730',0,1,0,0);
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_groups`
--

DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_groups`
--

LOCK TABLES `accounts_user_groups` WRITE;
/*!40000 ALTER TABLE `accounts_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_user_permissions`
--

DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_user_permissions`
--

LOCK TABLES `accounts_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Customers',6,'add_customers'),(22,'Can change Customers',6,'change_customers'),(23,'Can delete Customers',6,'delete_customers'),(24,'Can view Customers',6,'view_customers'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add dealers',8,'add_dealers'),(30,'Can change dealers',8,'change_dealers'),(31,'Can delete dealers',8,'delete_dealers'),(32,'Can view dealers',8,'view_dealers'),(33,'Can add transaction',9,'add_transaction'),(34,'Can change transaction',9,'change_transaction'),(35,'Can delete transaction',9,'delete_transaction'),(36,'Can view transaction',9,'view_transaction'),(37,'Can add units',10,'add_units'),(38,'Can change units',10,'change_units'),(39,'Can delete units',10,'delete_units'),(40,'Can view units',10,'view_units'),(41,'Can add brands',11,'add_brands'),(42,'Can change brands',11,'change_brands'),(43,'Can delete brands',11,'delete_brands'),(44,'Can view brands',11,'view_brands'),(45,'Can add colors',12,'add_colors'),(46,'Can change colors',12,'change_colors'),(47,'Can delete colors',12,'delete_colors'),(48,'Can view colors',12,'view_colors'),(49,'Can add models',13,'add_models'),(50,'Can change models',13,'change_models'),(51,'Can delete models',13,'delete_models'),(52,'Can view models',13,'view_models'),(53,'Can add vehicle',14,'add_vehicle'),(54,'Can change vehicle',14,'change_vehicle'),(55,'Can delete vehicle',14,'delete_vehicle'),(56,'Can view vehicle',14,'view_vehicle'),(57,'Can add units',15,'add_units'),(58,'Can change units',15,'change_units'),(59,'Can delete units',15,'delete_units'),(60,'Can view units',15,'view_units'),(61,'Can add transaction',16,'add_transaction'),(62,'Can change transaction',16,'change_transaction'),(63,'Can delete transaction',16,'delete_transaction'),(64,'Can view transaction',16,'view_transaction');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealers_dealers`
--

DROP TABLE IF EXISTS `dealers_dealers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealers_dealers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `DealerName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DealerDesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `DealerBanner` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DealerLogo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DealerSlug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DealerAdmin_id` bigint(20) NOT NULL,
  `DealerBrand_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dealers_dealers_DealerSlug_f6f5628b` (`DealerSlug`),
  KEY `dealers_dealers_DealerAdmin_id_937552c9_fk_accounts_user_id` (`DealerAdmin_id`),
  KEY `dealers_dealers_DealerBrand_id_270e83ee_fk_manufactu` (`DealerBrand_id`),
  CONSTRAINT `dealers_dealers_DealerAdmin_id_937552c9_fk_accounts_user_id` FOREIGN KEY (`DealerAdmin_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `dealers_dealers_DealerBrand_id_270e83ee_fk_manufactu` FOREIGN KEY (`DealerBrand_id`) REFERENCES `manufactures_brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealers_dealers`
--

LOCK TABLES `dealers_dealers` WRITE;
/*!40000 ALTER TABLE `dealers_dealers` DISABLE KEYS */;
INSERT INTO `dealers_dealers` VALUES (1,'Fitzgerald Buick GMC','Visit Fitzgerald Buick GMC for a variety of new & used cars by Buick & GMC in the Rockville area. Our Buick & GMC dealership, serving Gaithersburg, Washington DC, Bethesda & Clarksville, is ready to assist you!','','dealers/logo/2021/06/21/fitzgerald_buick_gmc_g7eSZn0.jpg','fitzgerald-buick-gmc',2,1),(2,'Ourisman Chevrolet','Ourisman Automotive Group has been serving the members of our community for nearly 100 years.  For four generations, our dedication to customer care has shined a light on our commitment to excellence.','','dealers/logo/2021/06/21/ourisman-chevrolet_J1KMTCP.jpg','ourishman-chevrolet',4,2);
/*!40000 ALTER TABLE `dealers_dealers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealers_transaction`
--

DROP TABLE IF EXISTS `dealers_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealers_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_buy` tinyint(1) DEFAULT NULL,
  `is_sell` tinyint(1) DEFAULT NULL,
  `DateBuy` datetime(6) DEFAULT NULL,
  `DateSell` date DEFAULT NULL,
  `TotalPrice_currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TotalPrice` decimal(55,2) NOT NULL,
  `Colors` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Buyers_id` bigint(20) DEFAULT NULL,
  `Owner_id` bigint(20) DEFAULT NULL,
  `Vin_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dealers_transaction_Buyers_id_2f83f5de_fk_dealers_dealers_id` (`Buyers_id`),
  KEY `dealers_transaction_Owner_id_afe551ce_fk_accounts_user_id` (`Owner_id`),
  KEY `dealers_transaction_Vin_id_dc4b0a53_fk_manufactures_units_id` (`Vin_id`),
  CONSTRAINT `dealers_transaction_Buyers_id_2f83f5de_fk_dealers_dealers_id` FOREIGN KEY (`Buyers_id`) REFERENCES `dealers_dealers` (`id`),
  CONSTRAINT `dealers_transaction_Owner_id_afe551ce_fk_accounts_user_id` FOREIGN KEY (`Owner_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `dealers_transaction_Vin_id_dc4b0a53_fk_manufactures_units_id` FOREIGN KEY (`Vin_id`) REFERENCES `manufactures_units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealers_transaction`
--

LOCK TABLES `dealers_transaction` WRITE;
/*!40000 ALTER TABLE `dealers_transaction` DISABLE KEYS */;
INSERT INTO `dealers_transaction` VALUES (1,1,1,'2021-06-22 13:36:14.914725','2021-03-22','IDR',765984772.00,'grey',1,3,1),(2,1,0,'2021-06-22 13:36:31.505209',NULL,'IDR',458978940.00,'red',1,NULL,36),(3,1,0,'2021-06-22 13:36:59.306551',NULL,'IDR',355059180.00,'red',1,NULL,6),(4,1,0,'2021-06-22 13:37:18.366352',NULL,'IDR',628844447.00,'black',1,NULL,9),(5,1,1,'2021-06-22 13:37:44.342185','2021-03-22','IDR',355059180.00,'white',1,3,12),(6,1,1,'2021-06-22 13:37:58.574674','2021-03-22','IDR',765984772.00,'grey',1,3,3),(7,1,1,'2021-06-22 13:41:01.117524','2021-03-22','IDR',479271035.00,'black',2,3,5),(8,1,1,'2021-06-22 13:41:13.258269','2021-06-22','IDR',507979993.00,'black',2,3,4),(9,1,1,'2021-06-22 13:41:25.744182','2021-03-22','IDR',645240739.00,'white',2,3,2),(10,1,0,'2021-06-22 13:41:37.378260',NULL,'IDR',507979993.00,'black',2,NULL,8),(11,1,0,'2021-06-22 13:41:49.795151',NULL,'IDR',507979993.00,'grey',2,NULL,33),(12,1,1,'2021-06-22 13:42:03.921081','2021-06-22','IDR',479271035.00,'white',2,3,10);
/*!40000 ALTER TABLE `dealers_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealers_units`
--

DROP TABLE IF EXISTS `dealers_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealers_units` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_sell` tinyint(1) NOT NULL,
  `Colors` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Buyers_id` bigint(20) DEFAULT NULL,
  `Owner_id` bigint(20) DEFAULT NULL,
  `Vin_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dealers_units_Buyers_id_0ed1fbae_fk_accounts_user_id` (`Buyers_id`),
  KEY `dealers_units_Owner_id_be51f8f4_fk_dealers_dealers_id` (`Owner_id`),
  KEY `dealers_units_Vin_id_d8481dcd_fk_manufactures_units_id` (`Vin_id`),
  CONSTRAINT `dealers_units_Buyers_id_0ed1fbae_fk_accounts_user_id` FOREIGN KEY (`Buyers_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `dealers_units_Owner_id_be51f8f4_fk_dealers_dealers_id` FOREIGN KEY (`Owner_id`) REFERENCES `dealers_dealers` (`id`),
  CONSTRAINT `dealers_units_Vin_id_d8481dcd_fk_manufactures_units_id` FOREIGN KEY (`Vin_id`) REFERENCES `manufactures_units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealers_units`
--

LOCK TABLES `dealers_units` WRITE;
/*!40000 ALTER TABLE `dealers_units` DISABLE KEYS */;
INSERT INTO `dealers_units` VALUES (1,1,'grey',3,1,1),(2,0,'red',NULL,1,36),(3,0,'red',NULL,1,6),(4,0,'black',NULL,1,9),(5,1,'white',3,1,12),(6,1,'grey',3,1,3),(7,1,'black',3,2,5),(8,1,'black',3,2,4),(9,1,'white',3,2,2),(10,0,'black',NULL,2,8),(11,0,'grey',NULL,2,33),(12,1,'white',3,2,10);
/*!40000 ALTER TABLE `dealers_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-06-22 13:40:44.858042','2','Ourisman Chevrolet',2,'[{\"changed\": {\"fields\": [\"DealerAdmin\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','customers'),(7,'accounts','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'dealers','dealers'),(9,'dealers','transaction'),(10,'dealers','units'),(11,'manufactures','brands'),(12,'manufactures','colors'),(13,'manufactures','models'),(16,'manufactures','transaction'),(15,'manufactures','units'),(14,'manufactures','vehicle'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-06-22 13:28:11.117228'),(2,'contenttypes','0002_remove_content_type_name','2021-06-22 13:28:11.474121'),(3,'auth','0001_initial','2021-06-22 13:28:13.743332'),(4,'auth','0002_alter_permission_name_max_length','2021-06-22 13:28:14.444804'),(5,'auth','0003_alter_user_email_max_length','2021-06-22 13:28:14.473522'),(6,'auth','0004_alter_user_username_opts','2021-06-22 13:28:14.500297'),(7,'auth','0005_alter_user_last_login_null','2021-06-22 13:28:14.515875'),(8,'auth','0006_require_contenttypes_0002','2021-06-22 13:28:14.520276'),(9,'auth','0007_alter_validators_add_error_messages','2021-06-22 13:28:14.537262'),(10,'auth','0008_alter_user_username_max_length','2021-06-22 13:28:14.548429'),(11,'auth','0009_alter_user_last_name_max_length','2021-06-22 13:28:14.559465'),(12,'auth','0010_alter_group_name_max_length','2021-06-22 13:28:14.609303'),(13,'auth','0011_update_proxy_permissions','2021-06-22 13:28:14.625710'),(14,'auth','0012_alter_user_first_name_max_length','2021-06-22 13:28:14.637030'),(15,'accounts','0001_initial','2021-06-22 13:28:17.580177'),(16,'admin','0001_initial','2021-06-22 13:28:19.091954'),(17,'admin','0002_logentry_remove_auto_add','2021-06-22 13:28:19.117278'),(18,'admin','0003_logentry_add_action_flag_choices','2021-06-22 13:28:19.132043'),(19,'dealers','0001_initial','2021-06-22 13:28:20.683395'),(20,'manufactures','0001_initial','2021-06-22 13:28:24.617131'),(21,'dealers','0002_initial','2021-06-22 13:28:27.565809'),(22,'sessions','0001_initial','2021-06-22 13:28:27.841967');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4l2lxigk9lqt4vbjelt2c3utqoq7qtbw','.eJxVjLsOAiEUBf-F2pDLGyzt9xsIcEFWDSTLbmX8d0OyhbZnZs6b-HDs1R8jb35FciWCXH63GNIztwnwEdq909Tbvq2RToWedNClY37dTvfvoIZRZ61dVlZlkxjDZJ2VRhpUgllIYIpGqZPjEEwpICwit1yCYzxqQG1iJp8vy4w3Kg:1lvgfp:y98bepjLqyUevFvp7_D3oFj1WFBfTQYJnvZp7ms_iug','2021-07-06 13:42:41.566613'),('hzl3pnj6pnpotqxhx3vd8v286fvf20xb','.eJxVjMsOwiAQRf-FtSGUdni4dO83kIEZpGogKe3K-O_apAvd3nPOfYmA21rC1nkJM4mzGMTpd4uYHlx3QHestyZTq-syR7kr8qBdXhvx83K4fwcFe_nWGXFy4I2KZBUwZ-V0okxMk89O2Zj06AYzogUFPiJESxqMZTUSg3bi_QH5RzgN:1lvgbm:3_c7uH0wK15OGomhpFbByxvAzCRB5uqMIGcpvQJbK_g','2021-07-06 13:38:30.407593'),('vkh5ed5onx6309kci4usmckapzvf6gsn','.eJxVjMsOgjAUBf-la23aYi-FpXu_gfQ-EMRQUmBhjP8uJCx0e2bOvFUT16Vr1lly07Oq1UWdfjeMNMi4A37E8Z40pXHJPepd0Qed9S2xPK-H-xfo4txtb_AYg41QgTMgVeELY1kQgkF0vmytYypJfAhoTYtgKkQuEcF5MlLQFp1y4pWW8yAvVbvPF4BlPUk:1lvgfD:W0-8XB7TaykdeEFtur3Y1lWGHK01LmDKckf5Fo9R9sk','2021-07-06 13:42:03.989336');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactures_brands`
--

DROP TABLE IF EXISTS `manufactures_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactures_brands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BrandName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Images` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactures_brands`
--

LOCK TABLES `manufactures_brands` WRITE;
/*!40000 ALTER TABLE `manufactures_brands` DISABLE KEYS */;
INSERT INTO `manufactures_brands` VALUES (1,'Buick','brands/2021/06/21/buick-logo_xTMbAGI.png'),(2,'Chevrolet','brands/2021/06/21/chevrolet-logo-v2_O6hsoe4.png');
/*!40000 ALTER TABLE `manufactures_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactures_colors`
--

DROP TABLE IF EXISTS `manufactures_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactures_colors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ColorsName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactures_colors`
--

LOCK TABLES `manufactures_colors` WRITE;
/*!40000 ALTER TABLE `manufactures_colors` DISABLE KEYS */;
INSERT INTO `manufactures_colors` VALUES (1,'red'),(2,'black'),(3,'white'),(4,'grey');
/*!40000 ALTER TABLE `manufactures_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactures_models`
--

DROP TABLE IF EXISTS `manufactures_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactures_models` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ModelsName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactures_models`
--

LOCK TABLES `manufactures_models` WRITE;
/*!40000 ALTER TABLE `manufactures_models` DISABLE KEYS */;
INSERT INTO `manufactures_models` VALUES (1,'Commercial'),(2,'Hatchback'),(3,'Hybrid'),(4,'MPV'),(5,'SUV'),(6,'Truck');
/*!40000 ALTER TABLE `manufactures_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactures_transaction`
--

DROP TABLE IF EXISTS `manufactures_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactures_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime(6) NOT NULL,
  `TotalPrice_currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TotalPrice` decimal(55,2) NOT NULL,
  `Colors` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Buyers_id` bigint(20) DEFAULT NULL,
  `Vin_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manufactures_transac_Buyers_id_94df317a_fk_dealers_d` (`Buyers_id`),
  KEY `manufactures_transac_Vin_id_7bae196b_fk_manufactu` (`Vin_id`),
  CONSTRAINT `manufactures_transac_Buyers_id_94df317a_fk_dealers_d` FOREIGN KEY (`Buyers_id`) REFERENCES `dealers_dealers` (`id`),
  CONSTRAINT `manufactures_transac_Vin_id_7bae196b_fk_manufactu` FOREIGN KEY (`Vin_id`) REFERENCES `manufactures_units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactures_transaction`
--

LOCK TABLES `manufactures_transaction` WRITE;
/*!40000 ALTER TABLE `manufactures_transaction` DISABLE KEYS */;
INSERT INTO `manufactures_transaction` VALUES (1,'2021-06-22 13:36:14.949141','IDR',765984772.00,'grey',1,1),(2,'2021-06-22 13:36:31.615511','IDR',458978940.00,'red',1,36),(3,'2021-06-22 13:36:59.337921','IDR',355059180.00,'red',1,6),(4,'2021-06-22 13:37:18.439240','IDR',628844447.00,'black',1,9),(5,'2021-06-22 13:37:44.450791','IDR',355059180.00,'white',1,12),(6,'2021-06-22 13:37:58.651056','IDR',765984772.00,'grey',1,3),(7,'2021-06-22 13:41:01.131247','IDR',479271035.00,'black',2,5),(8,'2021-06-22 13:41:13.321434','IDR',507979993.00,'black',2,4),(9,'2021-06-22 13:41:25.776494','IDR',645240739.00,'white',2,2),(10,'2021-06-22 13:41:37.399084','IDR',507979993.00,'black',2,8),(11,'2021-06-22 13:41:49.865902','IDR',507979993.00,'grey',2,33),(12,'2021-06-22 13:42:03.956175','IDR',479271035.00,'white',2,10);
/*!40000 ALTER TABLE `manufactures_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactures_units`
--

DROP TABLE IF EXISTS `manufactures_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactures_units` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Vin` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_sell` tinyint(1) NOT NULL,
  `VehicleName_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manufactures_units_VehicleName_id_e797cfaa_fk_manufactu` (`VehicleName_id`),
  CONSTRAINT `manufactures_units_VehicleName_id_e797cfaa_fk_manufactu` FOREIGN KEY (`VehicleName_id`) REFERENCES `manufactures_vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactures_units`
--

LOCK TABLES `manufactures_units` WRITE;
/*!40000 ALTER TABLE `manufactures_units` DISABLE KEYS */;
INSERT INTO `manufactures_units` VALUES (1,'2GCDC14H9B1172761',1,7),(2,'1G4AW69N2DH524774',1,1),(3,'JH4KA4530LC018693',1,7),(4,'1B4HS28N9YF105991',1,3),(5,'JH4KA8160RC002560',1,2),(6,'SAJGX2040XC042591',1,4),(7,'1GYFK63878R248711',0,7),(8,'JH4DA9470PS008042',1,3),(9,'1C4BJWFGXDL531773',1,6),(10,'2G1AN35J4C1202219',1,2),(11,'WVGAV75N69W510474',0,7),(12,'1G2JB12F047226515',1,4),(13,'JH4KA7660RC001542',0,4),(14,'JH4KA8270PC001686',0,1),(15,'WVWSB61J71W607153',0,7),(16,'JH4CC2540NC006770',0,4),(17,'1GBJK39DX6E165432',0,7),(18,'1GNDT13W3W2249640',0,2),(19,'4T3ZK3BB7BU042861',0,1),(20,'JH4KA3140LC003233',0,7),(21,'2FTHF36F8SCA65608',0,6),(22,'JH4KA4640JC021212',0,7),(23,'2T1AE97A4MC092797',0,7),(24,'5T4KP41Y923355338',0,6),(25,'KMHD25LE1DU042025',0,7),(26,'1G4GJ11Y9HP422546',0,6),(27,'1FVACXCSX7HY67259',0,2),(28,'JH4NA1150RT000268',0,6),(29,'1HD1FMW166Y641723',0,1),(30,'2T1BR18E5WC056406',0,7),(31,'JH4DA9440NS003801',0,1),(32,'4T1BG22K8VU176482',0,7),(33,'1GKEL19WXRB546238',1,3),(34,'JH4KA4633KC020287',0,1),(35,'2C4GM68475R667819',0,6),(36,'2FDJF37G2BCA83848',1,5),(37,'JH4DB7560SS004122',0,3),(38,'JHMCG56492C003897',0,5),(39,'JH4KA8172PC002873',0,4),(40,'JH4DC4330RS802540',0,3),(41,'1FTPW145X4KA09727',0,6),(42,'1GKEL19WXRB546238',0,3),(43,'JH4DA175XGS009825',0,6),(44,'JHMSZ542XDC028494',0,3),(45,'JH4KA8170MC002642',0,5),(46,'JH4DA1844GS001970',0,4),(47,'1FVACYDC37HW59012',0,6),(48,'JH4NA1150RT000268',0,4),(49,'JH4KA4640LC001187',0,4),(50,'1FDLF47M6REA05016',0,7),(51,'WDBHA33G2XF844170',0,6),(52,'WDBRF52H76F783280',0,4),(53,'JH4KA7660RC001542',0,2),(54,'2C3HD46R4WH170262',0,4),(55,'1FAFP45X83F403461',0,2),(56,'1GCHC33N7RJ376544',0,5),(57,'JALC4J167C7000484',0,1),(58,'5FNRL38679B039269',0,3),(59,'1G1AF1F57A7192174',0,3),(60,'1FASP11J6TW112004',0,4),(61,'WAUD2AFD7DN006931',0,7),(62,'2G1WD57C491198247',0,6),(63,'JH4KA8150MC012098',0,2),(64,'JH4DA3450JS001899',0,3),(65,'JH4CC2544PC004877',0,6),(66,'3B7KF2363YG116285',0,3),(67,'ZAMGJ45A390047326',0,2),(68,'JH4KA3140LC003233',0,2),(69,'YS3DF78K527013330',0,2),(70,'2T1KR32EX4C175599',0,4),(71,'3GCRKSE34AG162050',0,1),(72,'1C3BC55D0CG133270',0,6),(73,'1FVACXCSX7HY67259',0,3),(74,'3VWDZ7AJ7BM373945',0,3),(75,'3C3CFFER6CT225038',0,2),(76,'JH4DB1540PS000784',0,4),(77,'JH4KA4550JC048596',0,1),(78,'JH4KA8150MC012098',0,2),(79,'JH4DB7550SS005262',0,2),(80,'3C8FY68B72T322831',0,5),(81,'1FTZR15VXXTB07251',0,1),(82,'KMHDU4AD5AU136970',0,3),(83,'1HD1FCW116Y619817',0,7),(84,'JH4KA7670RC000738',0,4),(85,'JH4KA7532NC036794',0,5),(86,'2G1WH55K5Y9322458',0,1),(87,'1FVACWDU1BHBB3474',0,6),(88,'2CNBJ134146900067',0,1),(89,'JH4KA7630MC005945',0,6),(90,'1GKLVKED8AJ155580',0,6),(91,'1FMZU77E62UB95003',0,6),(92,'JH4DA9450PS000246',0,7),(93,'WDDDJ72X97A116339',0,1),(94,'2T1BR30E46C595221',0,5),(95,'KMHFG4JG1CA181127',0,2),(96,'SCA664S5XAUX48670',0,1),(97,'1HD1FMW166Y641723',0,4),(98,'JH4KA3250KC009863',0,2),(99,'1C4RJFAG8DC537142',0,4),(100,'WDBNG75J32A225892',0,4),(101,'JH4DB8590SS001561',0,7),(102,'5J6RE4H48BL023237',0,5),(103,'4XAXH76A8AD092394',0,3),(104,'JH4KA3250LC002400',0,5),(105,'1G1BU51H2HX113345',0,4),(106,'1FDWE35SX5HA40825',0,3),(107,'3B7KF23Z91G223647',0,7),(108,'1G8ZF52801Z328015',0,5),(109,'4S3BJ6321N6900903',0,4),(110,'WBA3A5C57CF256651',0,4),(111,'WA1LKAFP1AA007546',0,5),(112,'JH4KA4640KC013757',0,2),(113,'1G1ZT51816F264066',0,6),(114,'2FTHF26L7GCA92029',0,7),(115,'1G4AH51N1K6437778',0,1),(116,'1M1AK06Y96N008881',0,6),(117,'5XYKT3A69DG353356',0,5),(118,'JH4NA1260MT001906',0,1),(119,'JH4DA9440PS002537',0,2),(120,'JH4DB1560LS012302',0,3),(121,'1FTRW14W84KC76110',0,2),(122,'SHSRD78875U336227',0,1),(123,'JTJZB1BA8A2400307',0,7),(124,'JT2BG22K3Y0485107',0,5),(125,'JS3TX92V364102160',0,3),(126,'JN8AZ2NE5C9016953',0,2),(127,'1FV3EFAC7TL676933',0,1),(128,'1FMCU14T6JU400773',0,2),(129,'WDBGA51E4TA328716',0,1),(130,'5FNRL382X7B001853',0,5),(131,'4S3BK4355T6319316',0,6),(132,'1LNHM81V87Y600143',0,1),(133,'JH4KA3160KC018606',0,1),(134,'JH4KA8260PC000495',0,7),(135,'JH4KA7630PC007649',0,5),(136,'1GCHK29U87E198693',0,6),(137,'1HD1FAL11NY500561',0,7),(138,'1FASP11J6TW112004',0,3),(139,'1FUJBGAN04HM86987',0,6),(140,'2FTHF36F8SCA65608',0,4),(141,'1G4AH51N1K6437778',0,6),(142,'JN8AZ2NC5B9300256',0,5),(143,'1C4RJFBG5DC522189',0,6),(144,'JH4DC2380SS000012',0,4),(145,'3N1BC13E99L480541',0,7),(146,'JTMWF4DV8C5047998',0,1),(147,'JH4KA3161HC006800',0,2),(148,'1FUJA6CV74DM34063',0,2),(149,'5TEWN72N63Z275910',0,2),(150,'YV1LZ5647W2469314',0,4);
/*!40000 ALTER TABLE `manufactures_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactures_vehicle`
--

DROP TABLE IF EXISTS `manufactures_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactures_vehicle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `VehicleName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price_currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` decimal(55,2) NOT NULL,
  `Images` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BrandName_id` bigint(20) DEFAULT NULL,
  `ModelsName_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manufactures_vehicle_BrandName_id_e41a953d_fk_manufactu` (`BrandName_id`),
  KEY `manufactures_vehicle_ModelsName_id_587607cc_fk_manufactu` (`ModelsName_id`),
  CONSTRAINT `manufactures_vehicle_BrandName_id_e41a953d_fk_manufactu` FOREIGN KEY (`BrandName_id`) REFERENCES `manufactures_brands` (`id`),
  CONSTRAINT `manufactures_vehicle_ModelsName_id_587607cc_fk_manufactu` FOREIGN KEY (`ModelsName_id`) REFERENCES `manufactures_models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactures_vehicle`
--

LOCK TABLES `manufactures_vehicle` WRITE;
/*!40000 ALTER TABLE `manufactures_vehicle` DISABLE KEYS */;
INSERT INTO `manufactures_vehicle` VALUES (1,'Traverse RS SUV','IDR',645240739.00,'vehicle/2021/06/21/Traverse_RS_SUV_IvzU7KB.jpg',2,5),(2,'Blazer 2LT SUV','IDR',479271035.00,'vehicle/2021/06/21/Blazer_2LT_SUV_sZ7TEPu.jpg',2,5),(3,'Bolt EV Premier','IDR',507979993.00,'vehicle/2021/06/21/Bolt_EV_Premier_mfKRusE_RooMx2I.jpg',2,2),(4,'ENCORE','IDR',355059180.00,'vehicle/2021/06/21/ENCORE_5hmQsm1.jpg',1,5),(5,'ALL-NEW ENVISION','IDR',458978940.00,'vehicle/2021/06/21/ALL-NEW_ENVISION_WYjVbui.jpg',1,5),(6,'Envision Avenir SUV','IDR',628844447.00,'vehicle/2021/06/21/Envision_Avenir_SUV_jkide7m.jpg',1,5),(7,'Sierra 1500 Elevation Truck','IDR',765984772.00,'vehicle/2021/06/21/Sierra_1500_Elevation_Truck_SEEKaRw.jpg',1,6);
/*!40000 ALTER TABLE `manufactures_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactures_vehicle_Colors`
--

DROP TABLE IF EXISTS `manufactures_vehicle_Colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactures_vehicle_Colors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vehicle_id` bigint(20) NOT NULL,
  `colors_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manufactures_vehicle_Colors_vehicle_id_colors_id_0afd97fa_uniq` (`vehicle_id`,`colors_id`),
  KEY `manufactures_vehicle_colors_id_cc8f75dc_fk_manufactu` (`colors_id`),
  CONSTRAINT `manufactures_vehicle_colors_id_cc8f75dc_fk_manufactu` FOREIGN KEY (`colors_id`) REFERENCES `manufactures_colors` (`id`),
  CONSTRAINT `manufactures_vehicle_vehicle_id_70838ae5_fk_manufactu` FOREIGN KEY (`vehicle_id`) REFERENCES `manufactures_vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactures_vehicle_Colors`
--

LOCK TABLES `manufactures_vehicle_Colors` WRITE;
/*!40000 ALTER TABLE `manufactures_vehicle_Colors` DISABLE KEYS */;
INSERT INTO `manufactures_vehicle_Colors` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,2),(6,2,3),(7,2,4),(8,3,2),(9,3,3),(10,3,4),(11,4,1),(12,4,2),(13,4,3),(14,5,1),(15,5,2),(16,5,3),(17,6,2),(18,7,4);
/*!40000 ALTER TABLE `manufactures_vehicle_Colors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-22 22:34:31
