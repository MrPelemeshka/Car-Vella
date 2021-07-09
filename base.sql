-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: caravella_db
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `codename` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codename_UNIQUE` (`codename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bicycle_rent_payments`
--

DROP TABLE IF EXISTS `bicycle_rent_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bicycle_rent_payments` (
  `id` int NOT NULL,
  `rent_id` int NOT NULL,
  `total_cost` decimal(10,0) NOT NULL,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`rent_id`),
  KEY `fk_bicycle_rent_payments_bicycles_rents1_idx` (`rent_id`),
  CONSTRAINT `fk_bicycle_rent_payments_bicycles_rents1` FOREIGN KEY (`rent_id`) REFERENCES `bicycles_rents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bicycle_rent_payments`
--

LOCK TABLES `bicycle_rent_payments` WRITE;
/*!40000 ALTER TABLE `bicycle_rent_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bicycle_rent_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bicycles_inventory`
--

DROP TABLE IF EXISTS `bicycles_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bicycles_inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `bicycle_id` int NOT NULL,
  `bicycles_parking_id` int DEFAULT NULL,
  `is_rented_now` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`inventory_id`,`bicycle_id`),
  KEY `fk_bicycles_inventory_bicycles_list1_idx` (`bicycle_id`),
  KEY `fk_bicycles_inventory_bicycles_parkings1_idx` (`bicycles_parking_id`),
  CONSTRAINT `fk_bicycles_inventory_bicycles_list1` FOREIGN KEY (`bicycle_id`) REFERENCES `bicycles_list` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_bicycles_inventory_bicycles_parkings1` FOREIGN KEY (`bicycles_parking_id`) REFERENCES `bicycles_parkings` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bicycles_inventory`
--

LOCK TABLES `bicycles_inventory` WRITE;
/*!40000 ALTER TABLE `bicycles_inventory` DISABLE KEYS */;
INSERT INTO `bicycles_inventory` VALUES (1,1,NULL,0),(2,1,NULL,0),(3,1,NULL,0),(4,2,NULL,0),(5,2,NULL,0),(6,2,NULL,0),(7,3,NULL,0),(8,3,NULL,0),(9,3,NULL,0),(10,3,NULL,0);
/*!40000 ALTER TABLE `bicycles_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bicycles_list`
--

DROP TABLE IF EXISTS `bicycles_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bicycles_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `rent_price` float NOT NULL,
  `photo_path` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `info` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bicycles_list`
--

LOCK TABLES `bicycles_list` WRITE;
/*!40000 ALTER TABLE `bicycles_list` DISABLE KEYS */;
INSERT INTO `bicycles_list` VALUES (1,'Детский велосипед',4,'/media/bicycles/forkids.jpg','Для самых юных'),(2,'Взрослый велосипед',4,'/media/bicycles/common.jpg','Для не самых юных'),(3,'Электро-велосипед',5,'/media/bicycles/e-bicycles.jpg','Для самых богатых');
/*!40000 ALTER TABLE `bicycles_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bicycles_parkings`
--

DROP TABLE IF EXISTS `bicycles_parkings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bicycles_parkings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bicycles_parkings`
--

LOCK TABLES `bicycles_parkings` WRITE;
/*!40000 ALTER TABLE `bicycles_parkings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bicycles_parkings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bicycles_rents`
--

DROP TABLE IF EXISTS `bicycles_rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bicycles_rents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `bicycle_inventory_id` int DEFAULT NULL,
  `rent_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rent_start_use_time` timestamp NULL DEFAULT NULL,
  `rent_end_use_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bicycles_rents_users1_idx` (`user_id`),
  KEY `fk_bicycles_rents_bicycles_inventory1_idx` (`bicycle_inventory_id`),
  CONSTRAINT `fk_bicycles_rents_bicycles_inventory1` FOREIGN KEY (`bicycle_inventory_id`) REFERENCES `bicycles_inventory` (`inventory_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bicycles_rents_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bicycles_rents`
--

LOCK TABLES `bicycles_rents` WRITE;
/*!40000 ALTER TABLE `bicycles_rents` DISABLE KEYS */;
/*!40000 ALTER TABLE `bicycles_rents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'BMW'),(2,'Audi'),(3,'Mercedes');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars_inventory`
--

DROP TABLE IF EXISTS `cars_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `car_id` int NOT NULL,
  `cars_parking_id` int DEFAULT NULL,
  `is_rented_now` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`inventory_id`,`car_id`),
  KEY `fk_cars_inventory_cars_parkings1_idx` (`cars_parking_id`),
  KEY `fk_cars_inventory_cars_list1_idx` (`car_id`),
  CONSTRAINT `fk_cars_inventory_cars_list1` FOREIGN KEY (`car_id`) REFERENCES `cars_list` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cars_inventory_cars_parkings1` FOREIGN KEY (`cars_parking_id`) REFERENCES `cars_parkings` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_inventory`
--

LOCK TABLES `cars_inventory` WRITE;
/*!40000 ALTER TABLE `cars_inventory` DISABLE KEYS */;
INSERT INTO `cars_inventory` VALUES (1,1,NULL,0),(2,1,NULL,0),(3,1,NULL,0),(4,2,NULL,0),(5,2,NULL,0),(6,2,NULL,0),(7,3,NULL,0),(8,3,NULL,0),(9,3,NULL,0),(10,3,NULL,0);
/*!40000 ALTER TABLE `cars_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars_list`
--

DROP TABLE IF EXISTS `cars_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `rent_price` float NOT NULL,
  `photo_path` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `info` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`brand_id`),
  KEY `fk_cars_list_brands1_idx` (`brand_id`),
  CONSTRAINT `fk_cars_list_brands1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_list`
--

LOCK TABLES `cars_list` WRITE;
/*!40000 ALTER TABLE `cars_list` DISABLE KEYS */;
INSERT INTO `cars_list` VALUES (1,1,'X6',3,'/media/cars/bmw_x6.png','Крутая тачка'),(2,2,'RS 5 Coupe',3,'/media/cars/audi_coupe.png','ООООЧень крутая тачка'),(3,3,'Sedan C-class',3,'/media/cars/iris.png','Тоже крутая тачка');
/*!40000 ALTER TABLE `cars_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars_parkings`
--

DROP TABLE IF EXISTS `cars_parkings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_parkings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_parkings`
--

LOCK TABLES `cars_parkings` WRITE;
/*!40000 ALTER TABLE `cars_parkings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cars_parkings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars_rent_payments`
--

DROP TABLE IF EXISTS `cars_rent_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_rent_payments` (
  `id` int NOT NULL,
  `rent_id` int NOT NULL,
  `total_cost` decimal(10,0) NOT NULL,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`rent_id`),
  KEY `fk_cars_rent_payments_cars_rents1_idx` (`rent_id`),
  CONSTRAINT `fk_cars_rent_payments_cars_rents1` FOREIGN KEY (`rent_id`) REFERENCES `cars_rents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_rent_payments`
--

LOCK TABLES `cars_rent_payments` WRITE;
/*!40000 ALTER TABLE `cars_rent_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cars_rent_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars_rents`
--

DROP TABLE IF EXISTS `cars_rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_rents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int DEFAULT NULL,
  `cars_inventory_inventory_id` int DEFAULT NULL,
  `rent_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rent_start_use_time` timestamp NULL DEFAULT NULL,
  `rent_end_use_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_has_cars_inventory_cars_inventory1_idx` (`cars_inventory_inventory_id`),
  KEY `fk_users_has_cars_inventory_users1_idx` (`users_id`),
  CONSTRAINT `fk_users_has_cars_inventory_cars_inventory1` FOREIGN KEY (`cars_inventory_inventory_id`) REFERENCES `cars_inventory` (`inventory_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_cars_inventory_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_rents`
--

LOCK TABLES `cars_rents` WRITE;
/*!40000 ALTER TABLE `cars_rents` DISABLE KEYS */;
/*!40000 ALTER TABLE `cars_rents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'sessions','0001_initial','2021-06-09 06:01:03.245108');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`,`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES (1,'gv1r1z6epcrsik1ysrwhtajryw67muwn','eyJjc3JmX3Rva2VuIjoiMTZjYWZkNDczOTNmNDEyOTkyYjljMDU3ZTRiMjI3Y2MifQ:1lsMAZ:G3EBAsbhhPg_h-g40znR2adWALhbVPKyOhaYaELsKVo','2021-06-27 09:12:39.058243'),(3,'ur276kl8j4rpi8niar4s18o6ftjsq0a4','eyJjc3JmX3Rva2VuIjoiYjU4NWZiODY0MjAzNDUzY2JjZjU5ZmY3ZDY3ZGQ5OGQiLCJpc19hdXRob3JpemVkIjp0cnVlLCJ1c2VyX2lkIjo1LCJhY2Nlc3NfbGV2ZWwiOjJ9:1lsMBA:NFcPrZaQfeskdbdF9Cc17fqb03hKCpjcdPg9bKethks','2021-06-27 09:13:16.124862'),(4,'uc2wtz46axqgmitjyjspa133n8d19syn','.eJwNx0EOwiAQBdC7_DWLOhadchlCxk8kNjZhwIXGu-vbvQ-a5zLH_ejtzRvS6JMB09lz-zcGFDO6550v7kgSYN5rHseDTyREXcqitjFWWUU2PWsUXsvFrK5yUnx_pmwfmQ:1lsMcJ:Hq5mdxNAeu7F50bYkCkoBjAqYujwSb3OUBVloC7SJSc','2021-06-27 09:41:19.355016'),(5,'1f64vs7doy3fccci7yr8p4pafkbash8o','eyJpc19hdXRob3JpemVkIjp0cnVlLCJ1c2VyX2lkIjo1LCJhY2Nlc3NfbGV2ZWwiOjJ9:1lsN9W:zMPcvH88oCO--TRppbU-ggpSqHM2hCKIGa8LrhocAsM','2021-06-27 10:15:38.652677'),(6,'gn143fj6oogd59j7cyda0ynyy0ge3426','eyJpc19hdXRob3JpemVkIjp0cnVlLCJ1c2VyX2lkIjo1LCJhY2Nlc3NfbGV2ZWwiOjIsImNzcmZfdG9rZW4iOiJUSEkyTXlMd3RBWkNqRG43WURYTmN0a1JKWElXUkhieSJ9:1lsN9z:i6RGqCfIpXynlXfXjbFtkqFWEwkBonPmPmwuLz8RqNQ','2021-06-27 10:16:07.120167'),(13,'czcghxykx90hzvis84hvs0x0ri3jddd7','eyJpc19hdXRob3JpemVkIjp0cnVlLCJ1c2VyX2lkIjo1LCJhY2Nlc3NfbGV2ZWwiOjIsImNzcmZfdG9rZW4iOiIxR05oYXJVQzEwOGxneUZObjJaTUlocEE3RzRIeWNtbiJ9:1lsOyW:JHPOlEk24ZPMcBptuFlFAOd2zHTxcRWlQC66WzGKSiI','2021-06-27 12:12:24.068266');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_validation_result`
--

DROP TABLE IF EXISTS `driver_validation_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_validation_result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drivers_validation_id` int NOT NULL,
  `is_validated` tinyint(1) NOT NULL DEFAULT '0',
  `comments` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`drivers_validation_id`),
  KEY `fk_driver_validation_result_drivers_validation1_idx` (`drivers_validation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_validation_result`
--

LOCK TABLES `driver_validation_result` WRITE;
/*!40000 ALTER TABLE `driver_validation_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver_validation_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers_validation`
--

DROP TABLE IF EXISTS `drivers_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers_validation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `validation_manager_id` int DEFAULT NULL,
  `document_photo_path` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_drivers_validation_users1_idx` (`user_id`),
  KEY `fk_drivers_validation_users2_idx` (`validation_manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers_validation`
--

LOCK TABLES `drivers_validation` WRITE;
/*!40000 ALTER TABLE `drivers_validation` DISABLE KEYS */;
/*!40000 ALTER TABLE `drivers_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo_conditions`
--

DROP TABLE IF EXISTS `promo_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo_conditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `codename` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo_conditions`
--

LOCK TABLES `promo_conditions` WRITE;
/*!40000 ALTER TABLE `promo_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promo_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo_types`
--

DROP TABLE IF EXISTS `promo_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `codename` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo_types`
--

LOCK TABLES `promo_types` WRITE;
/*!40000 ALTER TABLE `promo_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `promo_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocodes`
--

DROP TABLE IF EXISTS `promocodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `activations_count` int NOT NULL,
  `activations_limit` int NOT NULL,
  `active_until` timestamp NOT NULL,
  `promo_type` int NOT NULL,
  `reward` int NOT NULL,
  `promo_condition` int NOT NULL,
  `condition_value` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `fk_promocodes_promo_types1_idx` (`promo_type`),
  KEY `fk_promocodes_promo_conditions1_idx` (`promo_condition`),
  CONSTRAINT `fk_promocodes_promo_types1` FOREIGN KEY (`promo_type`) REFERENCES `promo_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocodes`
--

LOCK TABLES `promocodes` WRITE;
/*!40000 ALTER TABLE `promocodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocodes_activations`
--

DROP TABLE IF EXISTS `promocodes_activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocodes_activations` (
  `promocodes_id` int NOT NULL,
  `users_id` int NOT NULL,
  `activation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`promocodes_id`,`users_id`),
  KEY `fk_promocodes_has_users_users1_idx` (`users_id`),
  KEY `fk_promocodes_has_users_promocodes1_idx` (`promocodes_id`),
  CONSTRAINT `fk_promocodes_has_users_promocodes1` FOREIGN KEY (`promocodes_id`) REFERENCES `promocodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_promocodes_has_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocodes_activations`
--

LOCK TABLES `promocodes_activations` WRITE;
/*!40000 ALTER TABLE `promocodes_activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocodes_activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_chat`
--

DROP TABLE IF EXISTS `qa_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_chat` (
  `ticket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `message_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  KEY `fk_qa_chat_users1_idx` (`user_id`),
  KEY `fk_qa_chat_qa_tickets1` (`ticket_id`),
  CONSTRAINT `fk_qa_chat_qa_tickets1` FOREIGN KEY (`ticket_id`) REFERENCES `qa_tickets` (`ticket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qa_chat_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_chat`
--

LOCK TABLES `qa_chat` WRITE;
/*!40000 ALTER TABLE `qa_chat` DISABLE KEYS */;
INSERT INTO `qa_chat` VALUES (61,6,'2021-07-09 17:12:02','Говорят там жарко'),(62,7,'2021-07-09 17:12:02','Помогите. Тут темно'),(63,8,'2021-07-09 17:12:02','Сплю-сплю такой. А потом я в политехе'),(64,9,'2021-07-09 17:12:02','Не хочу на площадь трёх вокзалов'),(65,10,'2021-07-09 17:12:02','Сколько я должен за ремонт'),(66,11,'2021-07-09 17:12:02','Хотеть ездить дешево'),(67,12,'2021-07-09 17:12:02','Вот Бамбалби говорит. И ваши машины говорят'),(68,13,'2021-07-09 17:12:02','Сын провинился и не заслужил место в машине. Пусть едет рядом на велике'),(69,14,'2021-07-09 17:12:02','Я исколесил Европу. И вас исколесю'),(70,15,'2021-07-09 17:12:02','Быбыка пык пык делает'),(63,20,'2021-07-09 17:13:17','Бывает'),(65,20,'2021-07-09 17:13:17','сто тыщ деняг'),(66,20,'2021-07-09 17:13:17','А мы не хотим'),(67,20,'2021-07-09 17:13:17','Наши машины говорит о Навальном'),(69,20,'2021-07-09 17:13:17','Налог на исколесения составляет 100 тыщ деняг');
/*!40000 ALTER TABLE `qa_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_tickets`
--

DROP TABLE IF EXISTS `qa_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_tickets` (
  `ticket` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticket`,`user`),
  KEY `fk_qa_tickets_users1_idx` (`user`),
  CONSTRAINT `fk_qa_tickets_users1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_tickets`
--

LOCK TABLES `qa_tickets` WRITE;
/*!40000 ALTER TABLE `qa_tickets` DISABLE KEYS */;
INSERT INTO `qa_tickets` VALUES (61,6,'Ну как там в Египте?','2021-07-09 16:57:47',0),(62,7,'Я попал в аварию','2021-07-09 16:57:47',0),(63,8,'Я попал в Политех?','2021-07-09 16:57:47',1),(64,9,'Как не отчислиться?','2021-07-09 16:57:47',0),(65,10,'Ремонт','2021-07-09 16:57:47',1),(66,11,'Скидка','2021-07-09 16:57:47',1),(67,12,'О чём говорят машины','2021-07-09 16:57:47',1),(68,13,'Бронь с велика и тачки','2021-07-09 16:57:47',0),(69,14,'Хочу скидку за аренду на весь день','2021-07-09 16:57:47',1),(70,15,'Не заводится машина','2021-07-09 16:57:47',0);
/*!40000 ALTER TABLE `qa_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `codename` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `access_level` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codename_UNIQUE` (`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Пользователь','role.user',0),(2,'Менеджер','role.manager',1),(3,'Администратор','role.admin',2);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `key_fingerprint` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `surname` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `age` int NOT NULL,
  `is_validated_driver` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `profile_photo_path` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_user_blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_users_roles1_idx` (`role_id`),
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,1,'Ruetheeor','c4f17cd6faf5cd8acb879f1c57225f1523bf89e2a81107f82fb05b6fb2f0360e9e6c2885e6a7cb35dd11531fdb24fe588d40c52895efd8ce2f62625f37d956a4','2021-07-09 16:41:04','Михаил','Евсеев',20,1,'trujucraucato-3459@yopmail.com',0,NULL,0),(7,1,'Gelbuod','3a576c21413224748f8b4d6bb62b8a506c46b4893209154bf72efd1f330fdb0271717f565e98db5137948347c6c4cfa116225fd0c2e68b8b6d8e9c9507a246a2','2021-07-09 16:41:04','Макар','Зуев',22,1,'sougaugreudeddo-6471@yopmail.com',0,NULL,0),(8,1,'Ppevaham','e83476049a09b9ba305820e8729d710c338d40b7b5241efb60fd5eaebb338a3cd31aa3b25bb5e27c62929031f427bfcab212f6ee948688b5aa5235abd02e9cd5','2021-07-09 16:41:04','Анна','Белова',34,1,'sgepudapewa-5790@yopmail.com',0,NULL,0),(9,1,'Drieysar','04ce3c30b660224cb82ba557e7bd5ba71e2991244c05a09041a7cf258ddaebf8a9057e4e1dd36f765c80ba832abdebcbce16e5efc1d77555f940704da7a3b766','2021-07-09 16:41:04','Савелий','Воронин',51,1,'peigousseiddacroi-5704@yopmail.com',0,NULL,0),(10,1,'Onaronai','589643f04921db48745426348582116ae6c462285878e3ff254f7d35a44962893e2cc6a195cbb8e56f90e50b3131b837f24ab905a3133f643bed89b522d0bd21','2021-07-09 16:41:04','Александра','Мельникова',43,1,'reuppafaunnesse-8213@yopmail.com',0,NULL,0),(11,1,'Tonannst','2c83e00115b0845dea8648bc59e71af2d938ee85cdcbaf4eb094ef7034dfe29e303a5f8e4f050d8e2b7d889fd5cc81fc980edaffe28df23a236a9cadb7ecddb5','2021-07-09 16:41:04','Дарья','Максимова',26,1,'jeiyofiweigo-6635@yopmail.com',0,NULL,0),(12,1,'Jeareyloo','7f16bc5b9acab341f5acdb70d5a32c898a7dfa288afa7ae93aa0a91773c3db967f0845c18ef78a7e4853e1169de3ebb1dfcdf5bb2855510caf618a485d6aeba2','2021-07-09 16:41:04','Роман','Иванов',24,1,'soppommoiffelli-9255@yopmail.com',0,NULL,0),(13,1,'Ghaserary','d34f685918045bfcaa85aefeaf9e1e7c3613b9d800116e9fd7f0582c87b72704859df8674b3d29b30b98c0102424afb5607a323757962c780520a356daee4585','2021-07-09 16:41:04','Мирон','Исаев',66,1,'mussitromaro-8639@yopmail.com',0,NULL,0),(14,1,'Qulaelli','42ee50a2b620d84bb7bb44755e74f1e9db9a194bf35b047d34e8f7fdf89e0a7094bf5a94d12accf8a6480294e0b53f283d90eada4bb5cbe9e15cb061a5ecec8f','2021-07-09 16:41:04','Фёдор','Горбачев',43,1,'grofreupeittouhi-6098@yopmail.com',0,NULL,0),(15,1,'Lelevinon','f5da2471add1399285167c50aa5137f96d0fe2b01dadc9c9a00e14e94893c337c98d6db1e88706e87560bd901b1330d8367b6d3e2f27cfbe336d87c6878fa458','2021-07-09 16:41:04','Ева','Шапошникова',32,1,'siseibrikeppu-6913@yopmail.com',0,NULL,0),(16,1,'Yridroniy','749675be0d6b100aeaa6588d643763e5557c925b0b9f97633a5d1b0da8551ecdf98a0d27d850eae033445b2d11d2cbfb1d8ba391c2f2f3a27ae35798fb4240f7','2021-07-09 16:41:04','Мила','Никольская',27,1,'hebroikabapro-1926@yopmail.com',0,NULL,0),(17,1,'Nlamrewed','89772600f5b2c89ec5d9dadd77878b1b9fc726b49ecc4de06e3c3e70e0454f4a18c748d8215d858207ba1274ebf22b73e5d95539df6ebe088df0e79da9e8a64c','2021-07-09 16:41:04','Татьяна','Семенова',22,1,'guyasatreive-1248@yopmail.com',0,NULL,0),(18,1,'Zalileri','27bcfdf529b1733f17f4939aebf7194182c2b5230a422ce7a412b27f602e7712d87b495b700e8e467be07b933fd14ad58a675555d3660503e3cdc26b942a5a63','2021-07-09 16:41:04','Даниил','Алешин',22,1,'hagatabaga-6628@yopmail.com',0,NULL,0),(19,1,'Palsyoyrk','8c26f5f23a3d0a1e8bc5aafceb053159a0f9bf732fa4c3975fc0c2435f42eac7b8a205d6502891f0efcbe653e5fdf1338eb563ca4dc6117bf212aa4d83ca7fab','2021-07-09 16:41:04','Ева','Ермолаева',24,1,'frisseumottoippeu-8125@yopmail.com',0,NULL,0),(20,2,'Yndennngi','5e7f2b34e454da6d0e6ea454ea46b43ebeda942bc11e490739cb48b366f9f7c750f456c83340aea900fd7d15713e9ae4032290d865990ab51072cccef2081c9c','2021-07-09 16:41:04','Андрей','Колесников',45,1,'vodeuwafomma-7460@yopmail.com',0,NULL,0),(21,2,'Byermanel','5fdbf7374f66995ee52851abe1fa7534634030495266732c26646212084309231ffafa02cdf7fae283419c86fafe03936c5c7b2671e2ced622e328a14836d516','2021-07-09 16:41:04','Кирилл','Мальцев',24,1,'xeuddilipossou-2627@yopmail.com',0,NULL,0),(22,2,'Zonebll','6ebb3188b1ba2788a4449305be110578c720ac4d94be9d2a81f7f776ac4245fd0f1687d72a725c48038e6cf831cd312ca006cbd44942728d37db40281668d0c1','2021-07-09 16:41:04','Роберт','Кузнецов',33,1,'vefipracrige-3459@yopmail.com',0,NULL,0),(23,3,'Warornt','4e25e87efbde7d295a28c8b27675629f455fd9cc3e7be02a19e143b023a59707d94d37c2abb435c5d11426e66b31c1690902e62be998d5956802c6d069f1a6c7','2021-07-09 16:41:04','Ева','Ермолаева',24,1,'fonnaucraguze-6699@yopmail.com',0,NULL,0),(24,3,'Fistrryst','e13dd1cd19dd413e06bf65055ab2c8c0cb1386bfb2b1bdcf49cc635b0e9c45b36eeb9108a4a8c976567a570705a0a00822bd657bded2155d289ccc717499ceb2','2021-07-09 16:41:04','Полина','Ткачева',43,1,'taffabrabrize-7524@yopmail.com',0,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_activities`
--

DROP TABLE IF EXISTS `users_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_activities` (
  `users_id` int NOT NULL,
  `activities_id` int NOT NULL,
  PRIMARY KEY (`users_id`,`activities_id`),
  KEY `fk_users_has_activities_activities1_idx` (`activities_id`),
  KEY `fk_users_has_activities_users_idx` (`users_id`),
  CONSTRAINT `fk_users_has_activities_activities1` FOREIGN KEY (`activities_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_activities_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_activities`
--

LOCK TABLES `users_activities` WRITE;
/*!40000 ALTER TABLE `users_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_password_recovery_tokens`
--

DROP TABLE IF EXISTS `users_password_recovery_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_password_recovery_tokens` (
  `token` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiration_time` timestamp NOT NULL DEFAULT ((now() + 3600)),
  PRIMARY KEY (`token`,`user_id`),
  KEY `fk_password_recovery_tokens_users1_idx` (`user_id`),
  CONSTRAINT `fk_password_recovery_tokens_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_password_recovery_tokens`
--

LOCK TABLES `users_password_recovery_tokens` WRITE;
/*!40000 ALTER TABLE `users_password_recovery_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_password_recovery_tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-10  0:29:42
