DROP DATABASE  IF  EXISTS `training_tracker`;

CREATE DATABASE  IF NOT EXISTS `training_tracker` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `training_tracker`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: training_tracker
-- ------------------------------------------------------
-- Server version	5.1.31-community

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
-- Table structure for table `AuthAssignment`
--

DROP TABLE IF EXISTS `AuthAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthAssignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthAssignment`
--

LOCK TABLES `AuthAssignment` WRITE;
/*!40000 ALTER TABLE `AuthAssignment` DISABLE KEYS */;
INSERT INTO `AuthAssignment` VALUES ('admin','1',NULL,'N;'),('admin','3',NULL,'N;'),('authenticated','2',NULL,'N;');
/*!40000 ALTER TABLE `AuthAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthItem`
--

DROP TABLE IF EXISTS `AuthItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthItem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthItem`
--

LOCK TABLES `AuthItem` WRITE;
/*!40000 ALTER TABLE `AuthItem` DISABLE KEYS */;
INSERT INTO `AuthItem` VALUES ('admin',2,'administrator',NULL,'N;'),('authenticated',2,'authenticated user','return !Yii::app()->user->isGuest;','N;'),('guest',2,'guest user','return Yii::app()->user->isGuest;','N;');
/*!40000 ALTER TABLE `AuthItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthItemChild`
--

DROP TABLE IF EXISTS `AuthItemChild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthItemChild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthItemChild`
--

LOCK TABLES `AuthItemChild` WRITE;
/*!40000 ALTER TABLE `AuthItemChild` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuthItemChild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `athlete`
--

DROP TABLE IF EXISTS `athlete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `athlete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(150) NOT NULL,
  `height` decimal(10,2) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `sex_typeid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `athlete_sex_type` (`sex_typeid`),
  CONSTRAINT `athlete_sex_type` FOREIGN KEY (`sex_typeid`) REFERENCES `sex_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athlete`
--

LOCK TABLES `athlete` WRITE;
/*!40000 ALTER TABLE `athlete` DISABLE KEYS */;
INSERT INTO `athlete` VALUES (1,'chitin','Burton','barry@gmail.com',21.00,131.00,1),(2,'chitin','zamora','zamora@gmail.com',21.00,81.00,1),(3,'chitin','zamora','chitin@gmail.com',20.00,30.00,1),(5,'javier','dobles','javier@avantica.net',20.00,99.99,2),(6,'genesis','parrales','javier@avantica.net',30.00,39.58,2),(7,'christhian','perez','javier@avantica.net',40.00,39.00,1),(8,'javier','dobles','javier@avantica.net',80.99,78.99,2);
/*!40000 ALTER TABLE `athlete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body_profiles`
--

DROP TABLE IF EXISTS `body_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `body_profiles` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `body_part__name` varchar(45) NOT NULL,
  `weight` decimal(10,0) NOT NULL,
  `height` decimal(10,0) NOT NULL,
  `sex_typeid` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `body_profiles_sex_type` (`sex_typeid`),
  CONSTRAINT `body_profiles_sex_type` FOREIGN KEY (`sex_typeid`) REFERENCES `sex_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_profiles`
--

LOCK TABLES `body_profiles` WRITE;
/*!40000 ALTER TABLE `body_profiles` DISABLE KEYS */;
INSERT INTO `body_profiles` VALUES (1,'Legs',20,10,2),(2,'Arms',20,30,2),(3,'Trunk',54,54,1),(4,'Upper Arm',3,3,1),(5,'Forearm and half hand',2,2,1),(6,'Thigh',11,11,1),(7,'Leg and foot',6,6,1),(8,'Weight',100,100,1),(9,'Head and Neck',11,11,1),(10,'Trunk',30,30,2),(11,'Upper Arm',17,17,2),(12,'Forearm and half hand',19,19,2),(13,'Thigh',23,23,2),(14,'Leg and foot',29,29,2),(15,'Other Distance',100,100,2);
/*!40000 ALTER TABLE `body_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'Thruster'),(2,'Pull Up'),(3,'Hang Clean and Jerk'),(4,'Power Clean and Jerk'),(5,'Power Clean'),(6,'Burpee Box Jump'),(7,'Burpee'),(8,'Strict Press'),(9,'Back of the Neck Push Press'),(10,'Push Press'),(11,'Dead Lift'),(12,'Box Jump'),(13,'Snatch Balance'),(14,'Toes to Bar'),(15,'Kettlebell Push Press'),(16,'Kettlebell Swing'),(17,'Double Under'),(18,'Power Snatch'),(19,'Hand Stand Push Up'),(20,'Hand Release Push Up'),(21,'Push Up'),(22,'Chest to Bar Pull Up'),(23,'Ring Dip'),(24,'Hang Clean'),(25,'Wall Ball'),(26,'Power Clean'),(27,'Hang Power Snatch'),(28,'Row'),(29,'Medicine Ball Sit up'),(30,'Sit up'),(31,'Front Squat'),(32,'Back Squat'),(33,'Overhead Squat'),(34,'Lunge'),(35,'Air Squat'),(36,'Lunge'),(37,'Overhead Plate Lunge'),(38,'Mountain Climber'),(39,'Pistol');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_detail`
--

DROP TABLE IF EXISTS `exercise_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attr1` decimal(10,6) NOT NULL,
  `attr2` decimal(10,6) NOT NULL,
  `attr3` decimal(10,6) NOT NULL,
  `attr4` decimal(10,6) NOT NULL,
  `attr5` decimal(10,6) NOT NULL,
  `attr6` decimal(10,6) NOT NULL,
  `attr7` decimal(10,6) NOT NULL,
  `body_profilesId` int(11) NOT NULL,
  `exerciseid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exercise_profile_detail_body_profiles` (`body_profilesId`),
  KEY `exercise_profile_detail_exercise_profile` (`exerciseid`),
  CONSTRAINT `exercise_profile_detail_body_profiles` FOREIGN KEY (`body_profilesId`) REFERENCES `body_profiles` (`Id`),
  CONSTRAINT `exercise_profile_detail_exercise_profile` FOREIGN KEY (`exerciseid`) REFERENCES `exercise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_detail`
--

LOCK TABLES `exercise_detail` WRITE;
/*!40000 ALTER TABLE `exercise_detail` DISABLE KEYS */;
INSERT INTO `exercise_detail` VALUES (1,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,1,1),(2,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,1,2),(3,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,3),(4,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,4),(5,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,5),(6,1.000000,2.000000,0.000000,0.000000,2.000000,2.000000,2.000000,1,6),(7,1.000000,2.000000,0.000000,0.000000,2.000000,2.000000,2.000000,1,7),(8,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,8),(9,0.000000,0.000000,0.000000,0.000000,0.500000,0.000000,0.000000,1,9),(10,0.000000,0.000000,0.000000,0.000000,0.500000,0.000000,0.000000,1,10),(11,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,1,11),(12,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,1,12),(13,0.000000,0.000000,0.000000,0.000000,0.000000,2.250000,0.000000,1,13),(14,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,14),(15,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,15),(16,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,16),(17,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,1,17),(18,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,18),(19,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,1,19),(20,0.000000,0.000000,0.000000,2.000000,2.000000,0.000000,0.000000,1,20),(21,0.000000,0.000000,0.000000,2.000000,2.000000,0.000000,0.000000,1,21),(22,0.000000,0.000000,0.250000,2.000000,0.000000,0.000000,0.000000,1,22),(23,0.000000,0.000000,0.000000,2.000000,2.000000,0.000000,0.000000,1,23),(24,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,24),(25,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,1,25),(26,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,1,26),(27,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,27),(28,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,28),(29,2.000000,2.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,29),(30,2.000000,2.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,30),(31,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,1,31),(32,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,1,32),(33,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,1,33),(34,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,1,34),(35,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,1,35),(36,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,1,36),(37,0.000000,0.000000,0.000000,0.000000,0.500000,0.000000,0.000000,1,37),(38,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1,38),(39,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,1,39),(40,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,2,1),(41,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,2,2),(42,0.000000,0.500000,0.000000,0.000000,0.000000,0.000000,0.000000,2,3),(43,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,4),(44,0.000000,0.000000,0.500000,0.000000,0.000000,0.000000,0.000000,2,5),(45,0.000000,1.000000,0.000000,0.000000,2.000000,2.000000,2.000000,2,6),(46,0.000000,1.000000,0.000000,0.000000,2.000000,2.000000,2.000000,2,7),(47,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,8),(48,0.000000,0.000000,0.000000,0.000000,0.500000,0.000000,0.000000,2,9),(49,0.000000,0.000000,0.000000,0.000000,0.500000,0.000000,0.000000,2,10),(50,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,2,11),(51,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,2,12),(52,0.000000,0.000000,0.000000,0.000000,0.000000,2.250000,0.000000,2,13),(53,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,14),(54,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,15),(55,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,16),(56,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,2,17),(57,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,18),(58,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,2,19),(59,0.000000,0.000000,0.000000,2.000000,2.000000,0.000000,0.000000,2,20),(60,0.000000,0.000000,0.000000,2.000000,2.000000,0.000000,0.000000,2,21),(61,0.000000,0.000000,0.250000,2.000000,0.000000,0.000000,0.000000,2,22),(62,0.000000,0.000000,0.000000,2.000000,2.000000,0.000000,0.000000,2,23),(63,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,24),(64,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,2,25),(65,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,2,26),(66,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,27),(67,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,28),(68,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,29),(69,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,30),(70,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,2,31),(71,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,2,32),(72,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,2,33),(73,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,2,34),(74,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,2,35),(75,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,2,36),(76,0.000000,0.000000,0.000000,0.000000,0.500000,0.000000,0.000000,2,37),(77,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2,38),(78,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,2,39),(79,0.000000,0.000000,0.000000,2.000000,0.000000,2.000000,0.000000,3,1),(80,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,3,2),(81,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,3,3),(82,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,3,4),(83,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,3,5),(84,0.000000,1.500000,1.000000,0.000000,2.000000,2.000000,2.000000,3,6),(85,0.000000,1.500000,1.000000,0.000000,2.000000,2.000000,2.000000,3,7),(86,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,3,8),(87,0.000000,0.000000,1.000000,2.000000,0.500000,0.000000,0.000000,3,9),(88,0.000000,0.000000,1.000000,2.000000,0.500000,0.000000,0.000000,3,10),(89,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,3,11),(90,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,3,12),(91,0.000000,0.000000,0.000000,1.000000,0.000000,0.250000,0.000000,3,13),(92,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,3,14),(93,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,3,15),(94,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,3,16),(95,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,3,17),(96,0.000000,0.000000,0.000000,2.000000,0.000000,2.000000,0.000000,3,18),(97,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,3,19),(98,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,3,20),(99,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,3,21),(100,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,3,22),(101,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,3,23),(102,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,3,24),(103,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,3,25),(104,0.000000,0.000000,2.000000,1.000000,0.000000,0.000000,0.000000,3,26),(105,0.000000,0.000000,0.000000,2.000000,0.000000,2.000000,0.000000,3,27),(106,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,3,28),(107,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,0.000000,3,29),(108,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,0.000000,3,30),(109,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,3,31),(110,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,3,32),(111,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,3,33),(112,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,3,34),(113,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,3,35),(114,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,3,36),(115,0.000000,0.000000,1.000000,2.000000,0.500000,0.000000,0.000000,3,37),(116,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,3,38),(117,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,3,39),(118,0.000000,0.000000,0.000000,2.000000,1.000000,2.000000,0.000000,4,1),(119,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,4,2),(120,0.000000,0.000000,1.000000,2.000000,2.000000,0.000000,0.000000,4,3),(121,0.000000,0.000000,1.000000,2.000000,2.000000,0.800000,0.000000,4,4),(122,0.000000,0.000000,1.000000,2.000000,2.000000,0.800000,0.000000,4,5),(123,0.000000,0.750000,0.000000,0.000000,2.000000,2.000000,2.000000,4,6),(124,0.000000,0.750000,0.000000,0.000000,2.000000,2.000000,2.000000,4,7),(125,0.000000,0.000000,2.000000,1.000000,0.000000,0.000000,0.000000,4,8),(126,0.000000,0.000000,1.000000,2.000000,0.500000,0.000000,0.000000,4,9),(127,0.000000,0.000000,1.000000,2.000000,0.500000,0.000000,0.000000,4,10),(128,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,4,11),(129,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,4,12),(130,0.000000,0.000000,0.000000,2.000000,1.000000,0.250000,0.000000,4,13),(131,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,4,14),(132,0.000000,0.000000,2.000000,1.000000,0.000000,0.000000,0.000000,4,15),(133,0.000000,0.000000,2.000000,2.000000,1.000000,0.000000,0.000000,4,16),(134,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,4,17),(135,0.000000,0.000000,0.000000,2.000000,1.000000,2.000000,1.000000,4,18),(136,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,4,19),(137,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,4,20),(138,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,4,21),(139,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,4,22),(140,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,4,23),(141,0.000000,0.000000,0.000000,2.000000,1.000000,0.000000,0.000000,4,24),(142,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,4,25),(143,0.000000,0.000000,2.000000,2.000000,1.000000,0.000000,0.000000,4,26),(144,0.000000,0.000000,0.000000,2.000000,1.000000,2.000000,1.000000,4,27),(145,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,4,28),(146,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,0.000000,4,29),(147,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,0.000000,4,30),(148,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,4,31),(149,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,4,32),(150,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,4,33),(151,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,4,34),(152,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,4,35),(153,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,4,36),(154,0.000000,0.000000,1.000000,2.000000,0.500000,0.000000,0.000000,4,37),(155,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,4,38),(156,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,4,39),(157,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,1),(158,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,5,2),(159,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,3),(160,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,4),(161,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,5),(162,0.000000,0.000000,0.000000,0.000000,1.000000,2.000000,2.000000,5,6),(163,0.000000,0.000000,0.000000,0.000000,1.000000,2.000000,2.000000,5,7),(164,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,8),(165,0.000000,0.000000,0.000000,0.000000,0.250000,0.000000,0.000000,5,9),(166,0.000000,0.000000,0.000000,0.000000,0.250000,0.000000,0.000000,5,10),(167,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,11),(168,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,5,12),(169,0.000000,0.000000,0.000000,0.000000,0.000000,1.125000,0.000000,5,13),(170,0.000000,0.000000,2.000000,0.000000,0.000000,1.000000,0.000000,5,14),(171,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,15),(172,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,16),(173,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,5,17),(174,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,18),(175,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,5,19),(176,0.000000,0.000000,0.000000,0.400000,0.400000,0.000000,0.000000,5,20),(177,0.000000,0.000000,0.000000,0.400000,0.400000,0.000000,0.000000,5,21),(178,0.000000,0.000000,0.250000,2.000000,0.000000,0.000000,0.000000,5,22),(179,0.000000,0.000000,0.000000,2.000000,2.000000,0.000000,0.000000,5,23),(180,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,24),(181,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,5,25),(182,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,26),(183,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,27),(184,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,28),(185,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,29),(186,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5,30),(187,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,5,31),(188,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,5,32),(189,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,5,33),(190,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,5,34),(191,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,5,35),(192,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,5,36),(193,0.000000,0.000000,0.000000,0.000000,0.250000,0.000000,0.000000,5,37),(194,0.000000,0.203874,0.000000,0.000000,0.000000,0.000000,0.000000,5,38),(195,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,5,39),(196,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,1),(197,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,6,2),(198,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,3),(199,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,4),(200,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,5),(201,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,2.000000,6,6),(202,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,2.000000,6,7),(203,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,8),(204,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,9),(205,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,10),(206,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,11),(207,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,6,12),(208,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,13),(209,0.000000,0.000000,2.000000,1.000000,0.000000,2.000000,1.000000,6,14),(210,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,15),(211,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,16),(212,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,6,17),(213,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,18),(214,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,6,19),(215,0.000000,0.000000,0.000000,0.200000,0.200000,0.000000,0.000000,6,20),(216,0.000000,0.000000,0.000000,0.200000,0.200000,0.000000,0.000000,6,21),(217,0.000000,0.000000,0.250000,2.000000,0.000000,0.000000,0.000000,6,22),(218,0.000000,0.000000,0.000000,2.000000,2.000000,0.000000,0.000000,6,23),(219,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,24),(220,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,25),(221,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,26),(222,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,27),(223,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,28),(224,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,29),(225,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,30),(226,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,31),(227,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,32),(228,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,33),(229,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,34),(230,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,35),(231,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,36),(232,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,37),(233,0.000000,0.203874,0.000000,0.000000,0.000000,0.000000,0.000000,6,38),(234,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,6,39),(235,0.000000,0.000000,0.000000,2.000000,2.000000,2.000000,0.000000,7,1),(236,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,7,2),(237,0.000000,2.000000,2.000000,2.000000,2.000000,0.000000,0.000000,7,3),(238,0.000000,2.000000,2.000000,2.000000,2.000000,1.600000,0.000000,7,4),(239,0.000000,2.000000,0.000000,0.000000,2.000000,1.600000,0.000000,7,5),(240,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,7,6),(241,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,7,7),(242,0.000000,0.000000,2.000000,2.000000,0.000000,0.000000,0.000000,7,8),(243,0.000000,0.000000,2.000000,2.000000,0.500000,0.000000,0.000000,7,9),(244,0.000000,0.000000,2.000000,2.000000,0.500000,0.000000,0.000000,7,10),(245,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,7,11),(246,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,7,12),(247,0.000000,0.000000,0.000000,2.000000,2.000000,1.250000,0.000000,7,13),(248,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,7,14),(249,0.000000,0.000000,2.000000,2.000000,0.000000,0.000000,0.000000,7,15),(250,0.000000,0.000000,2.000000,2.000000,2.000000,0.000000,0.000000,7,16),(251,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.000000,7,17),(252,0.000000,0.000000,2.000000,1.500000,1.500000,2.000000,2.000000,7,18),(253,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,7,19),(254,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,7,20),(255,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,7,21),(256,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,7,22),(257,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,7,23),(258,0.000000,0.000000,2.000000,0.000000,0.000000,1.600000,0.000000,7,24),(259,0.000000,0.000000,2.000000,0.000000,0.000000,2.000000,2.000000,7,25),(260,0.000000,0.000000,2.000000,0.000000,0.000000,2.000000,2.000000,7,26),(261,0.000000,0.000000,2.000000,1.500000,1.500000,0.000000,0.000000,7,27),(262,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,7,28),(263,0.000000,4.000000,4.000000,4.000000,0.000000,0.000000,0.000000,7,29),(264,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,7,30),(265,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,7,31),(266,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,7,32),(267,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,7,33),(268,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,7,34),(269,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,7,35),(270,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,7,36),(271,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,7,37),(272,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,7,38),(273,0.000000,0.000000,0.000000,0.000000,2.000000,0.000000,0.000000,7,39);
/*!40000 ALTER TABLE `exercise_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_data`
--

DROP TABLE IF EXISTS `record_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weight` decimal(10,0) NOT NULL,
  `height` decimal(10,0) NOT NULL,
  `calories` decimal(10,0) NOT NULL,
  `assist` decimal(10,0) NOT NULL,
  `reps` int(11) NOT NULL,
  `time` time NOT NULL,
  `athleteid` int(11) NOT NULL,
  `workout_detailid` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `record_data_athlete` (`athleteid`),
  KEY `record_data_detail_workout` (`workout_detailid`),
  CONSTRAINT `record_data_athlete` FOREIGN KEY (`athleteid`) REFERENCES `athlete` (`id`),
  CONSTRAINT `record_data_detail_workout` FOREIGN KEY (`workout_detailid`) REFERENCES `workout_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_data`
--

LOCK TABLES `record_data` WRITE;
/*!40000 ALTER TABLE `record_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sex_type`
--

DROP TABLE IF EXISTS `sex_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sex_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sex_type`
--

LOCK TABLES `sex_type` WRITE;
/*!40000 ALTER TABLE `sex_type` DISABLE KEYS */;
INSERT INTO `sex_type` VALUES (1,'Male'),(2,'Female');
/*!40000 ALTER TABLE `sex_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Jason','pass1','test1@example.com'),(2,'test2','pass2','test2@example.com'),(3,'test3','pass3','test3@example.com'),(4,'test4','pass4','test4@example.com'),(5,'test5','pass5','test5@example.com'),(6,'test6','pass6','test6@example.com'),(7,'test7','pass7','test7@example.com'),(8,'test8','pass8','test8@example.com'),(9,'test9','pass9','test9@example.com'),(10,'test10','pass10','test10@example.com'),(11,'test11','pass11','test11@example.com'),(12,'test12','pass12','test12@example.com'),(13,'test13','pass13','test13@example.com'),(14,'test14','pass14','test14@example.com'),(15,'test15','pass15','test15@example.com'),(16,'test16','pass16','test16@example.com'),(17,'test17','pass17','test17@example.com'),(18,'test18','pass18','test18@example.com'),(19,'test19','pass19','test19@example.com'),(20,'test20','pass20','test20@example.com'),(21,'test21','pass21','test21@example.com'),(22,'admin','admin','admin@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout`
--

DROP TABLE IF EXISTS `workout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(150) NOT NULL,
  `workout_typeid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workout_workout_type` (`workout_typeid`),
  CONSTRAINT `workout_workout_type` FOREIGN KEY (`workout_typeid`) REFERENCES `workout_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout`
--

LOCK TABLES `workout` WRITE;
/*!40000 ALTER TABLE `workout` DISABLE KEYS */;
INSERT INTO `workout` VALUES (1,'2014-04-07','Mary','No se',2),(8,'2014-04-07','fran','no se',1),(9,'2014-04-08','Fran','12-15-9 thrusters, pullups',1),(10,'2014-04-11','Henry','working',1);
/*!40000 ALTER TABLE `workout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_detail`
--

DROP TABLE IF EXISTS `workout_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workout_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `measure_weight` tinyint(1) NOT NULL,
  `measure_height` tinyint(1) NOT NULL,
  `measure_calories` tinyint(1) NOT NULL,
  `measure_assist` tinyint(1) NOT NULL,
  `total_reps` int(11) DEFAULT NULL,
  `total_time` time DEFAULT NULL,
  `workoutid` int(11) NOT NULL,
  `exerciseid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detail_workout_workout` (`workoutid`),
  KEY `workout_detail_exercise_profile` (`exerciseid`),
  CONSTRAINT `detail_workout_workout` FOREIGN KEY (`workoutid`) REFERENCES `workout` (`id`),
  CONSTRAINT `workout_detail_exercise_profile` FOREIGN KEY (`exerciseid`) REFERENCES `exercise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_detail`
--

LOCK TABLES `workout_detail` WRITE;
/*!40000 ALTER TABLE `workout_detail` DISABLE KEYS */;
INSERT INTO `workout_detail` VALUES (4,0,0,1,0,20,'10:00:00',1,13),(5,1,1,0,0,20,'20:10:00',8,18),(6,1,0,1,1,20,'10:15:00',8,8),(7,1,0,1,1,20,'01:20:00',1,18),(8,0,1,0,0,20,NULL,8,17),(12,0,0,1,1,20,NULL,8,2),(15,0,1,0,0,20,'10:10:00',1,10),(17,0,1,0,0,NULL,'15:12:00',1,37),(18,0,0,1,1,50,NULL,8,40),(19,0,1,1,0,NULL,'15:12:00',1,13),(20,1,0,1,0,NULL,'01:00:00',1,6),(37,0,1,1,0,10,NULL,8,12),(38,1,1,1,1,NULL,'15:12:00',1,35),(39,0,1,1,1,NULL,'15:10:00',1,19),(45,1,0,0,1,NULL,'15:00:00',1,12),(49,0,1,1,0,10,NULL,10,12),(51,1,1,1,1,10,NULL,10,7);
/*!40000 ALTER TABLE `workout_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_type`
--

DROP TABLE IF EXISTS `workout_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workout_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_type`
--

LOCK TABLES `workout_type` WRITE;
/*!40000 ALTER TABLE `workout_type` DISABLE KEYS */;
INSERT INTO `workout_type` VALUES (1,'ForTime'),(2,'ForReps'),(3,'MaxWeight'),(4,'NoScore');
/*!40000 ALTER TABLE `workout_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-16 10:30:37
