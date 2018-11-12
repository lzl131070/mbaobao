-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: mbaobao
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add img',8,'add_img'),(23,'Can change img',8,'change_img'),(24,'Can delete img',8,'delete_img'),(25,'Can add goods',9,'add_goods'),(26,'Can change goods',9,'change_goods'),(27,'Can delete goods',9,'delete_goods'),(28,'Can add detail',10,'add_detail'),(29,'Can change detail',10,'change_detail'),(30,'Can delete detail',10,'delete_detail'),(31,'Can add text',11,'add_text'),(32,'Can change text',11,'change_text'),(33,'Can delete text',11,'delete_text'),(34,'Can add cart',12,'add_cart'),(35,'Can change cart',12,'change_cart'),(36,'Can delete cart',12,'delete_cart'),(37,'Can add order',13,'add_order'),(38,'Can change order',13,'change_order'),(39,'Can delete order',13,'delete_order'),(40,'Can add order detail',14,'add_orderdetail'),(41,'Can change order detail',14,'change_orderdetail'),(42,'Can delete order detail',14,'delete_orderdetail');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$xudHfaHruK6l$hnTNMF32BmVRi9THjn5yF2SjMevwGRuP8+o4W2sp/Vc=','2018-11-09 01:41:11.933839',1,'lzl','','','616108722@qq.com',1,1,'2018-10-30 08:08:43.222576');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'mbbapp','cart'),(10,'mbbapp','detail'),(9,'mbbapp','goods'),(8,'mbbapp','img'),(13,'mbbapp','order'),(14,'mbbapp','orderdetail'),(11,'mbbapp','text'),(7,'mbbapp','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-27 07:23:51.377957'),(2,'auth','0001_initial','2018-10-27 07:23:52.649299'),(3,'admin','0001_initial','2018-10-27 07:23:52.859761'),(4,'admin','0002_logentry_remove_auto_add','2018-10-27 07:23:52.873767'),(5,'contenttypes','0002_remove_content_type_name','2018-10-27 07:23:52.937411'),(6,'auth','0002_alter_permission_name_max_length','2018-10-27 07:23:52.957549'),(7,'auth','0003_alter_user_email_max_length','2018-10-27 07:23:53.006505'),(8,'auth','0004_alter_user_username_opts','2018-10-27 07:23:53.021976'),(9,'auth','0005_alter_user_last_login_null','2018-10-27 07:23:53.063673'),(10,'auth','0006_require_contenttypes_0002','2018-10-27 07:23:53.067335'),(11,'auth','0007_alter_validators_add_error_messages','2018-10-27 07:23:53.078247'),(12,'auth','0008_alter_user_username_max_length','2018-10-27 07:23:53.101472'),(13,'mbbapp','0001_initial','2018-10-27 07:23:53.121018'),(14,'sessions','0001_initial','2018-10-27 07:23:53.217715'),(15,'mbbapp','0002_auto_20181027_0724','2018-10-27 07:24:25.841694'),(16,'mbbapp','0003_auto_20181027_0816','2018-10-27 08:16:21.650366'),(17,'mbbapp','0004_auto_20181027_0818','2018-10-27 08:18:51.536785'),(18,'mbbapp','0005_user_token','2018-10-29 08:17:09.220201'),(19,'mbbapp','0006_img','2018-10-29 12:37:44.391758'),(20,'mbbapp','0007_auto_20181029_1239','2018-10-29 12:39:06.087194'),(21,'mbbapp','0008_auto_20181029_1250','2018-10-29 12:50:45.047430'),(22,'mbbapp','0009_auto_20181029_1252','2018-10-29 12:52:31.683251'),(23,'mbbapp','0010_goods','2018-10-30 07:52:06.459502'),(24,'mbbapp','0011_auto_20181030_0758','2018-10-30 07:58:53.823014'),(25,'mbbapp','0012_text','2018-10-31 06:16:26.258234'),(26,'mbbapp','0013_auto_20181031_1150','2018-10-31 11:50:49.311645'),(27,'mbbapp','0014_auto_20181031_1307','2018-10-31 13:07:25.358542'),(28,'mbbapp','0015_usercart','2018-11-06 07:41:41.118392'),(29,'mbbapp','0016_auto_20181106_0741','2018-11-06 07:41:41.144514'),(30,'mbbapp','0017_auto_20181106_0746','2018-11-06 07:48:03.264706'),(31,'mbbapp','0018_auto_20181106_0747','2018-11-06 07:48:03.458195'),(32,'mbbapp','0019_auto_20181106_0748','2018-11-06 07:48:03.536217'),(33,'mbbapp','0020_auto_20181106_0812','2018-11-06 08:12:38.082590'),(34,'mbbapp','0021_order_orderdetail','2018-11-12 01:05:03.325728');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6p64cpsycqknxmgw5rcb3nye4lkpubrb','NTZjNjk1OWY2YWE5M2JlMDkwYjcxNGZlNTFlNzk4NWE3ZDhlZmQ3Mjp7InRva2VuIjoiNzJhZjY1MmM0NTBkMzczOGY1ZDQ1OTNhNGQ0MTY2MTYifQ==','2018-11-21 07:20:02.128669'),('7h39inqdon9jntklp0x3ilfzplwqzs7u','N2U2MzBjN2MwYjdhMjE4MmE3Nzc3OTlkZjJlMmFlMzJhNmUxYWQyNzp7InRva2VuIjoiNjZhMDgzZjEwNTA1ZDExMTljNDlkZTAzMzljZDc4YWUifQ==','2018-11-20 10:43:25.458393'),('8ovvfkbxlap8lc9b4v7v6ngnftcdazrx','OTQzOTk3Y2NlMGI4M2VkYTg3ZTk1OTc2YzJjYWYxNTYxNjdhMWE1Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMzA5NzkzODI1M2FmYjZmZGJhZmVhNWFjMzQ3NjE0NWQwZWUwZGQ5IiwidG9rZW4iOiI5MDViYTIwMTg2Y2EzNGM5ZDBjNjA4ZjhkYmY4YmVkMCJ9','2018-11-14 08:08:53.348337'),('9e7cyofxj7wh8shvq1odxiwogja5tc09','MDJmZmI4MzNkYjc4YmI2OThhNTkzNDFlNmZhZWUyOTM3ZDNmZGJmZTp7InRva2VuIjoiYzQ2N2Q3ODk4OGU4OGFkNTE4ZDQ2ODI1OTc1N2IzMWEifQ==','2018-11-13 03:14:04.192980'),('cax6e8jol749ugb3184g04eyxngutuyc','OTg4ODY2MjJlYzgyNzRhZGIzMzBhZDg0ZWEzMjU5YmMwOWY1NDdiYzp7InRva2VuIjoiZmFjNzEzYmUzODYzYWZkNjAyMTJiZDllMmQ0YTYyNjcifQ==','2018-11-26 06:48:50.505941'),('cvlibozf8yl1xwnq5i56l4pxv3ga8ayo','NjAxMjk4YzI1ZDUwM2E4ZGNiM2RlNzBkMzZiYzI5YjgyN2MxMGM3Yzp7InVzZXJuYW1lIjoiMTUyMDAzNDUzMzIifQ==','2018-11-16 01:04:54.087277'),('gl1obrob5u5wjm8ls7x4r6w7bq82cnow','MTM1YjI3NGUyNTFlNWVkYjJiOTFkOTdjOWIwODk0ZjA2OTVlM2NlOTp7InRva2VuIjoiNzE3OTViOWY1NmI5YzE5YjAyMDczZjdlZTc1YTYwMjMifQ==','2018-11-19 16:10:01.943621'),('gwv82i9gja3x31js8u5j4wd2pz8g8emv','NTkyMTM5NzNmNjE3ZmZmOTBhYjdjYWZmZTQxNWFhOWU4OTY5ZWNjNzp7InVzZXJuYW1lIjoiMTMxMDcwMzI2MTEiLCJ0b2tlbiI6ImQxNjVlOTY4MjZmNzAxOGEzMmY4Zjc5MzllNjBmNmM0In0=','2018-11-19 01:37:34.319115'),('k095e4a3200ikerczbrskq7lc73mpq8p','NGEyYWRjMzI1MjkxM2Q1ZGZhNzljY2VmMzI4Mzg2ZWYwNDUyNjdlZjp7InRva2VuIjoiZGU1ZjZhMmM2YmY5ODY0MjIyOWQ4ZjkwZTZmOTQ3MTUifQ==','2018-11-20 01:02:49.751143'),('rtv96wqe3ilm9uvs8kc8u58k3gkotzlq','OTJiY2I2ODQ2Zjc4M2E4MmU4ZjM0MDdmY2Q4MmI1NDNlZGEzOWYwZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMzA5NzkzODI1M2FmYjZmZGJhZmVhNWFjMzQ3NjE0NWQwZWUwZGQ5In0=','2018-11-13 08:09:01.400238'),('xczqbp4g6ejgt1bw12iufrrcld4p51cf','N2RkMjU0Mjk4NjA2MzBkNGUyODUwYWI5NTlkZjM2MjY1MWEzNzNhNzp7InRva2VuIjoiYjA2MDllMmY5OTFkNjFiN2JiMGIwYzY5MGI2NjgxNGIifQ==','2018-11-19 16:27:47.128982'),('zyxe1yycag1he4zc3x7ossiluo2jealw','MjlhZjQ5ZTlkZjQ3ZDNmYTNkMjg0NGU1ZmZmMDIxNDcxZjMxMGUxYzp7InRva2VuIjoiMTkyZGRkNzBmMzNjZGU5NzE0NzJmNWY0MzNjMWZmODciLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTMwOTc5MzgyNTNhZmI2ZmRiYWZlYTVhYzM0NzYxNDVkMGVlMGRkOSJ9','2018-11-23 01:41:11.936568');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbbapp_cart`
--

DROP TABLE IF EXISTS `mbbapp_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbbapp_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mbbapp_cart_user_id_fca1e0bf` (`user_id`),
  KEY `mbbapp_cart_good_id_c2bf8201` (`good_id`),
  CONSTRAINT `mbbapp_cart_good_id_c2bf8201_fk_mbbapp_detail_id` FOREIGN KEY (`good_id`) REFERENCES `mbbapp_detail` (`id`),
  CONSTRAINT `mbbapp_cart_user_id_fca1e0bf_fk_mbbapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `mbbapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbbapp_cart`
--

LOCK TABLES `mbbapp_cart` WRITE;
/*!40000 ALTER TABLE `mbbapp_cart` DISABLE KEYS */;
INSERT INTO `mbbapp_cart` VALUES (9,6,2,0,0),(26,6,10,0,0),(27,6,6,0,0),(28,6,7,0,0);
/*!40000 ALTER TABLE `mbbapp_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbbapp_detail`
--

DROP TABLE IF EXISTS `mbbapp_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbbapp_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(50) NOT NULL,
  `mbbprice` varchar(50) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `picnum` varchar(255) NOT NULL,
  `pic1` varchar(255) NOT NULL,
  `pic2` varchar(255) NOT NULL,
  `pic3` varchar(255) NOT NULL,
  `pic4` varchar(255) NOT NULL,
  `pic5` varchar(255) NOT NULL,
  `pic6` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbbapp_detail`
--

LOCK TABLES `mbbapp_detail` WRITE;
/*!40000 ALTER TABLE `mbbapp_detail` DISABLE KEYS */;
INSERT INTO `mbbapp_detail` VALUES (1,'1001','[mbaobao]刺绣椰树系列 手提单肩斜挎包','199.00','388.00','￥','/static/img/index/pic49.jpg','/static/img/detail/01_1_1.jpg','/static/img/detail/01_1.jpg','/static/img/detail/01_2.jpg','/static/img/detail/01_3.jpg','/static/img/detail/01_4.jpg','/static/img/detail/01_5.jpg','/static/img/detail/01_6.jpg'),(2,'1002','[mbaobao]撞色蝴蝶结系列 单肩斜挎包','169.00','328.00','￥','/static/img/index/pic39.jpg','/static/img/detail/02_1_1.jpg','/static/img/detail/02_1.jpg','/static/img/detail/02_2.jpg','/static/img/detail/02_3.jpg','/static/img/detail/02_4.jpg','/static/img/detail/02_5.jpg','/static/img/detail/02_6.jpg'),(3,'1003','[mbaobao]刺绣椰树系列 手提单肩斜挎包','189.00','368.00','￥','/static/img/index/pic32.jpg','/static/img/detail/03_1_1.jpg','/static/img/detail/03_1.jpg','/static/img/detail/03_2.jpg','/static/img/detail/03_3.jpg','/static/img/detail/03_4.jpg','/static/img/detail/03_5.jpg','/static/img/detail/03_6.jpg'),(4,'1004','[mbaobao]闪电猫系列 单肩斜挎包','199.00','388.00','￥','/static/img/index/pic36.jpg','/static/img/detail/04_1_1.jpg','/static/img/detail/04_1.jpg','/static/img/detail/04_2.jpg','/static/img/detail/04_3.jpg','/static/img/detail/04_4.jpg','/static/img/detail/04_5.jpg','/static/img/detail/04_6.jpg'),(5,'1005','[mbaobao]潇洒小姐系列双肩单肩多用包(小款）','219.00','468.00','￥','/static/img/index/pic46.jpg','/static/img/detail/05_1_1.jpg','/static/img/detail/05_1.jpg','/static/img/detail/05_2.jpg','/static/img/detail/05_3.jpg','/static/img/detail/05_4.jpg','/static/img/detail/05_5.jpg','/static/img/detail/05_6.jpg'),(6,'1006','[mbaobao]双面花扣系列 手提单肩斜挎包','169.00','328.00','￥','/static/img/index/pic41.jpg','/static/img/detail/06_1_1.jpg','/static/img/detail/06_1.jpg','/static/img/detail/06_2.jpg','/static/img/detail/06_3.jpg','/static/img/detail/06_4.jpg','/static/img/detail/06_5.jpg','/static/img/detail/06_6.jpg'),(7,'1007','[mbaobao]潇洒小姐系列双肩单肩多用包(小款）','219.00','468.00','￥','/static/img/index/pic46.jpg','/static/img/detail/05_1_1.jpg','/static/img/detail/05_1.jpg','/static/img/detail/05_2.jpg','/static/img/detail/05_3.jpg','/static/img/detail/05_4.jpg','/static/img/detail/05_5.jpg','/static/img/detail/05_6.jpg'),(8,'1008','[mbaobao]复古方包系列 单肩斜挎包','189.00','368.00','￥','/static/img/index/pic28.jpg','/static/img/detail/08_1_1.jpg','/static/img/detail/08_1.jpg','/static/img/detail/08_2.jpg','/static/img/detail/08_3.jpg','/static/img/detail/08_4.jpg','/static/img/detail/08_5.jpg','/static/img/detail/08_6.jpg'),(9,'1009','[mbaobao]金属花朵系列 单肩斜挎包','199.00','828.00','￥','/static/img/index/pic26.jpg','/static/img/detail/09_1_1.jpg','/static/img/detail/09_1.jpg','/static/img/detail/09_2.jpg','/static/img/detail/09_3.jpg','/static/img/detail/09_4.jpg','/static/img/detail/09_5.jpg','/static/img/detail/09_6.jpg'),(10,'1010','[mbaobao]撞色蝴蝶结系列 手提单肩斜挎包','169.00','328.00','￥','/static/img/index/pic42.jpg','/static/img/detail/10_1_1.jpg','/static/img/detail/10_1.jpg','/static/img/detail/10_2.jpg','/static/img/detail/10_3.jpg','/static/img/detail/10_4.jpg','/static/img/detail/10_5.jpg','/static/img/detail/10_6.jpg');
/*!40000 ALTER TABLE `mbbapp_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbbapp_goods`
--

DROP TABLE IF EXISTS `mbbapp_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbbapp_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(50) NOT NULL,
  `mbbprice` varchar(50) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `pic1` varchar(255) NOT NULL,
  `pic2` varchar(255) DEFAULT NULL,
  `pic3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbbapp_goods`
--

LOCK TABLES `mbbapp_goods` WRITE;
/*!40000 ALTER TABLE `mbbapp_goods` DISABLE KEYS */;
INSERT INTO `mbbapp_goods` VALUES (1,'1001','[mbaobao]双面料系列 手提单肩斜挎包 ','229.00','488.00','￥','/static/img/list/01-1.jpg','/static/img/list/01-1-1.jpg','/static/img/list/01-2-1.jpg',''),(2,'1002','[mbaobao]花朵提手系列 手提包','169.00','328.00','￥','/static/img/list/02-1.jpg','/static/img/list/02-1-1.jpg','/static/img/list/02-2-1.jpg','static/img/list/02-3-1.jpg'),(3,'1003','[mbaobao]花朵提手系列 手提单肩斜挎包','368.00','368.00','￥','/static/img/list/03-1.jpg','/static/img/list/03-1-1.jpg','/static/img/list/03-2-1.jpg','static/img/list/03-3-1.jpg'),(4,'1004','[mbaobao]刺绣椰树系列 手提单肩斜挎包','199.00','388.00','￥','/static/img/list/04-1.jpg','/static/img/list/04-1-1.jpg','',''),(5,'1005','[mbaobao]刺绣花朵系列 单肩斜挎包','189.00','368.00','￥','/static/img/list/05-1.jpg','/static/img/list/05-1-1.jpg','',''),(6,'1006','[mbaobao]猫脸系列单肩斜挎包','179.00','348.00','￥','/static/img/list/06-2.jpg','/static/img/list/06-1-1.jpg','/static/img/list/06-2-1.jpg',''),(7,'1007','[mbaobao]猫脸系列手提双肩包','229.00','448.00','￥','/static/img/list/07-1.jpg','/static/img/list/07-1-1.jpg','',''),(8,'1008','[mbaobao]纯色钱夹系列 钱包','99.00','188.00','￥','/static/img/list/08-1.jpg','/static/img/list/08-1-1.jpg','/static/img/list/08-2-1.jpg','static/img/list/08-3-1.jpg');
/*!40000 ALTER TABLE `mbbapp_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbbapp_img`
--

DROP TABLE IF EXISTS `mbbapp_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbbapp_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) NOT NULL,
  `img` varchar(120) NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mbbapp_img_img_af4310b9_uniq` (`img`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbbapp_img`
--

LOCK TABLES `mbbapp_img` WRITE;
/*!40000 ALTER TABLE `mbbapp_img` DISABLE KEYS */;
INSERT INTO `mbbapp_img` VALUES (1,'101','/static/img/index/banner06.jpg','双面佳人'),(2,'102','/static/img/index/banner07.jpg','趣味emoji'),(3,'103','/static/img/index/banner08.jpg','洒脱旅行'),(4,'104','/static/img/index/banner09.jpg','少女环游记'),(5,'105','/static/img/index/banner10.jpg','幸运许愿星'),(6,'101','/static/img/index/1-1704001901.jpg','轻盈好时髦'),(7,'102','/static/img/index/1-9132562101.jpg','潮萌机器人'),(8,'103','/static/img/index/1-1704001601.jpg','摩登鳄鱼纹'),(9,'104','/static/img/index/1-9132593002.jpg','酷感星光'),(10,'105','/static/img/index/1-1706000902.jpg','职场小心机'),(11,'101','/static/img/index/2-1511011402.jpg','温柔优雅'),(12,'102','/static/img/index/2-1704002101.jpg','温雅小女人'),(13,'103','/static/img/index/9132624901.jpg','精致气质'),(14,'104','/static/img/index/9132645501.jpg','线条美学'),(15,'105','/static/img/index/9132657003.jpg','皮艺风尚'),(16,'101','/static/img/index/3-1411000102.jpg','天生行动派'),(17,'102','/static/img/index/3-1611008401.jpg','硬朗精英'),(18,'103','/static/img/index/952-440-1(1).jpg','魅力法则'),(19,'104','/static/img/index/3-1604009101.jpg','帅气轻旅'),(20,'105','/static/img/index/3-1612004702.jpg','拒绝中庸'),(21,'101','/static/img/index/5-041904.jpg','活力色彩'),(22,'102','/static/img/index/5-1605002801.jpg','小怪兽大风头'),(23,'103','/static/img/index/952-440-2(1).jpg','奇幻鲨鱼'),(24,'104','/static/img/index/5-1606001001.jpg','朋克摇滚梦想'),(25,'105','/static/img/index/952-440-3(1).jpg','玩转拼接'),(26,'101','/static/img/index/banner1.jpg','0'),(27,'102','/static/img/index/banner2.jpg','0'),(28,'103','/static/img/index/banner3.jpg','0'),(29,'104','/static/img/index/banner4.jpg','0'),(30,'105','/static/img/index/banner5.jpg','0');
/*!40000 ALTER TABLE `mbbapp_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbbapp_order`
--

DROP TABLE IF EXISTS `mbbapp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbbapp_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernum` varchar(255) NOT NULL,
  `adv` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mbbapp_order_user_id_7120e86b_fk_mbbapp_user_id` (`user_id`),
  CONSTRAINT `mbbapp_order_user_id_7120e86b_fk_mbbapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `mbbapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbbapp_order`
--

LOCK TABLES `mbbapp_order` WRITE;
/*!40000 ALTER TABLE `mbbapp_order` DISABLE KEYS */;
INSERT INTO `mbbapp_order` VALUES (14,'1541987400.185353521430411','内蒙古#呼和浩特市#阿拉善左旗#\n             11                   ',1,6);
/*!40000 ALTER TABLE `mbbapp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbbapp_orderdetail`
--

DROP TABLE IF EXISTS `mbbapp_orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbbapp_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) NOT NULL,
  `good_id` int(11) NOT NULL,
  `ordernum_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mbbapp_orderdetail_good_id_eb535108_fk_mbbapp_detail_id` (`good_id`),
  KEY `mbbapp_orderdetail_ordernum_id_34849c45_fk_mbbapp_order_id` (`ordernum_id`),
  CONSTRAINT `mbbapp_orderdetail_good_id_eb535108_fk_mbbapp_detail_id` FOREIGN KEY (`good_id`) REFERENCES `mbbapp_detail` (`id`),
  CONSTRAINT `mbbapp_orderdetail_ordernum_id_34849c45_fk_mbbapp_order_id` FOREIGN KEY (`ordernum_id`) REFERENCES `mbbapp_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbbapp_orderdetail`
--

LOCK TABLES `mbbapp_orderdetail` WRITE;
/*!40000 ALTER TABLE `mbbapp_orderdetail` DISABLE KEYS */;
INSERT INTO `mbbapp_orderdetail` VALUES (1,'1',7,14);
/*!40000 ALTER TABLE `mbbapp_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbbapp_text`
--

DROP TABLE IF EXISTS `mbbapp_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbbapp_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `str` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbbapp_text`
--

LOCK TABLES `mbbapp_text` WRITE;
/*!40000 ALTER TABLE `mbbapp_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbbapp_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbbapp_user`
--

DROP TABLE IF EXISTS `mbbapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbbapp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(256) NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mbbapp_user_username_3973a376_uniq` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbbapp_user`
--

LOCK TABLES `mbbapp_user` WRITE;
/*!40000 ALTER TABLE `mbbapp_user` DISABLE KEYS */;
INSERT INTO `mbbapp_user` VALUES (4,'15200345332','3d6afd6361ad3fbc98e8b1454548d6ed2af6011d40fdf58ddc503fcfc3caf79d5f47906912a723edc0923022ff1e3b96f911d25f9e11eadf996bbd2e57fb9749','cae53412-30b3-505a-ac50-00ff572cc4f5','/static/upload/59-u=1763044357,684998663&fm=26&gp=0.jpg'),(6,'13107032611','ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413','fac713be3863afd60212bd9e2d4a6267','/static/upload/48-u=1763044357,684998663&fm=26&gp=0.jpg');
/*!40000 ALTER TABLE `mbbapp_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-11 23:37:52
