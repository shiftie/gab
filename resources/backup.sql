-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: pimcore
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `application_logs`
--

DROP TABLE IF EXISTS `application_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `message` varchar(1024) DEFAULT NULL,
  `priority` enum('emergency','alert','critical','error','warning','notice','info','debug') DEFAULT NULL,
  `fileobject` varchar(1024) DEFAULT NULL,
  `info` varchar(1024) DEFAULT NULL,
  `component` varchar(190) DEFAULT NULL,
  `source` varchar(190) DEFAULT NULL,
  `relatedobject` bigint(20) DEFAULT NULL,
  `relatedobjecttype` enum('object','document','asset') DEFAULT NULL,
  `maintenanceChecked` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component` (`component`),
  KEY `timestamp` (`timestamp`),
  KEY `relatedobject` (`relatedobject`),
  KEY `priority` (`priority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_logs`
--

LOCK TABLES `application_logs` WRITE;
/*!40000 ALTER TABLE `application_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET ascii DEFAULT '',
  `path` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `mimetype` varchar(190) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `customSettings` text,
  `hasMetaData` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`filename`),
  KEY `parentId` (`parentId`),
  KEY `filename` (`filename`),
  KEY `path` (`path`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,0,'folder','','/',NULL,1479473990,1479473990,1,1,NULL,0),(3,1,'folder','home','/',NULL,1479545698,1479545698,1,0,'a:0:{}',0),(4,3,'image','1150461_760828250657319_5488560786455551087_o_1.jpg','/home/','image/jpeg',1479545698,1479545698,2,2,'a:3:{s:10:\"imageWidth\";i:1155;s:11:\"imageHeight\";i:805;s:25:\"imageDimensionsCalculated\";b:1;}',0),(5,3,'image','003.jpg','/home/','image/jpeg',1479545698,1479545698,2,2,'a:3:{s:10:\"imageWidth\";i:1920;s:11:\"imageHeight\";i:1080;s:25:\"imageDimensionsCalculated\";b:1;}',0),(6,3,'image','1150461_760828250657319_5488560786455551087_o.jpg','/home/','image/jpeg',1479545698,1479545698,2,2,'a:3:{s:10:\"imageWidth\";i:2800;s:11:\"imageHeight\";i:1947;s:25:\"imageDimensionsCalculated\";b:1;}',0),(7,3,'image','1531853_621380787935400_987677339_o.jpg','/home/','image/jpeg',1479545698,1479545698,2,2,'a:3:{s:10:\"imageWidth\";i:2800;s:11:\"imageHeight\";i:1947;s:25:\"imageDimensionsCalculated\";b:1;}',0),(8,3,'image','001.jpg','/home/','image/jpeg',1479545699,1479545699,2,2,'a:3:{s:10:\"imageWidth\";i:2800;s:11:\"imageHeight\";i:1947;s:25:\"imageDimensionsCalculated\";b:1;}',0),(9,1,'folder','projects','/',NULL,1479545714,1479545714,1,0,'a:0:{}',0),(10,9,'folder','oribe','/projects/',NULL,1479545714,1479545714,1,0,'a:0:{}',0),(11,10,'image','03.jpg','/projects/oribe/','image/jpeg',1479545714,1479545714,2,2,'a:3:{s:10:\"imageWidth\";i:1168;s:11:\"imageHeight\";i:1532;s:25:\"imageDimensionsCalculated\";b:1;}',0),(12,10,'image','02.jpg','/projects/oribe/','image/jpeg',1479545714,1479545714,2,2,'a:3:{s:10:\"imageWidth\";i:1600;s:11:\"imageHeight\";i:2093;s:25:\"imageDimensionsCalculated\";b:1;}',0),(13,10,'image','07.jpg','/projects/oribe/','image/jpeg',1479545714,1479545714,2,2,'a:3:{s:10:\"imageWidth\";i:1600;s:11:\"imageHeight\";i:2272;s:25:\"imageDimensionsCalculated\";b:1;}',0),(14,10,'image','04.jpg','/projects/oribe/','image/jpeg',1479545715,1479545715,2,2,'a:3:{s:10:\"imageWidth\";i:2444;s:11:\"imageHeight\";i:3132;s:25:\"imageDimensionsCalculated\";b:1;}',0),(15,10,'image','05.jpg','/projects/oribe/','image/jpeg',1479545714,1479545714,2,2,'a:3:{s:10:\"imageWidth\";i:2852;s:11:\"imageHeight\";i:1493;s:25:\"imageDimensionsCalculated\";b:1;}',0),(16,10,'image','06.jpg','/projects/oribe/','image/jpeg',1479545714,1479545714,2,2,'a:3:{s:10:\"imageWidth\";i:1600;s:11:\"imageHeight\";i:2383;s:25:\"imageDimensionsCalculated\";b:1;}',0),(17,10,'image','08.jpg','/projects/oribe/','image/jpeg',1479545715,1479545715,2,2,'a:3:{s:10:\"imageWidth\";i:1173;s:11:\"imageHeight\";i:1672;s:25:\"imageDimensionsCalculated\";b:1;}',0),(18,10,'image','09.jpg','/projects/oribe/','image/jpeg',1479545716,1479545716,2,2,'a:3:{s:10:\"imageWidth\";i:2882;s:11:\"imageHeight\";i:1529;s:25:\"imageDimensionsCalculated\";b:1;}',0),(19,10,'image','1.jpg','/projects/oribe/','image/jpeg',1479545716,1479545716,2,2,'a:3:{s:10:\"imageWidth\";i:1600;s:11:\"imageHeight\";i:2091;s:25:\"imageDimensionsCalculated\";b:1;}',0),(20,10,'image','11.jpg','/projects/oribe/','image/jpeg',1479545716,1479545716,2,2,'a:3:{s:10:\"imageWidth\";i:640;s:11:\"imageHeight\";i:3989;s:25:\"imageDimensionsCalculated\";b:1;}',0),(21,10,'image','10.jpg','/projects/oribe/','image/jpeg',1479545716,1479545716,2,2,'a:3:{s:10:\"imageWidth\";i:640;s:11:\"imageHeight\";i:4143;s:25:\"imageDimensionsCalculated\";b:1;}',0),(22,10,'image','12.jpg','/projects/oribe/','image/jpeg',1479545716,1479545716,2,2,'a:3:{s:10:\"imageWidth\";i:640;s:11:\"imageHeight\";i:2835;s:25:\"imageDimensionsCalculated\";b:1;}',0),(23,10,'image','13.jpg','/projects/oribe/','image/jpeg',1479545717,1479545717,2,2,'a:3:{s:10:\"imageWidth\";i:640;s:11:\"imageHeight\";i:4141;s:25:\"imageDimensionsCalculated\";b:1;}',0);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_metadata`
--

DROP TABLE IF EXISTS `assets_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_metadata` (
  `cid` int(11) DEFAULT NULL,
  `name` varchar(190) DEFAULT NULL,
  `language` varchar(190) DEFAULT NULL,
  `type` enum('input','textarea','asset','document','object','date','select','checkbox') DEFAULT NULL,
  `data` text,
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_metadata`
--

LOCK TABLES `assets_metadata` WRITE;
/*!40000 ALTER TABLE `assets_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `id` varchar(165) NOT NULL DEFAULT '',
  `data` longblob,
  `mtime` bigint(20) DEFAULT NULL,
  `expire` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('pimcore_asset_1','O:26:\"Pimcore\\Model\\Asset\\Folder\":17:{s:4:\"type\";s:6:\"folder\";s:2:\"id\";i:1;s:8:\"parentId\";i:0;s:8:\"filename\";s:0:\"\";s:4:\"path\";s:1:\"/\";s:8:\"mimetype\";N;s:12:\"creationDate\";i:1479473990;s:16:\"modificationDate\";i:1479473990;s:9:\"userOwner\";s:1:\"1\";s:16:\"userModification\";s:1:\"1\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:0:{}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545699,1481964899),('pimcore_asset_10','O:26:\"Pimcore\\Model\\Asset\\Folder\":17:{s:4:\"type\";s:6:\"folder\";s:2:\"id\";i:10;s:8:\"parentId\";i:9;s:8:\"filename\";s:5:\"oribe\";s:4:\"path\";s:10:\"/projects/\";s:8:\"mimetype\";N;s:12:\"creationDate\";i:1479545714;s:16:\"modificationDate\";i:1479545714;s:9:\"userOwner\";s:1:\"1\";s:16:\"userModification\";s:1:\"0\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:0:{}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_11','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:11;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"03.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545714;s:16:\"modificationDate\";i:1479545714;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1168;s:11:\"imageHeight\";i:1532;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_12','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:12;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"02.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545714;s:16:\"modificationDate\";i:1479545714;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1600;s:11:\"imageHeight\";i:2093;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_13','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:13;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"07.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545714;s:16:\"modificationDate\";i:1479545714;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1600;s:11:\"imageHeight\";i:2272;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_14','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:14;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"04.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545715;s:16:\"modificationDate\";i:1479545715;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:2444;s:11:\"imageHeight\";i:3132;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_15','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:15;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"05.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545714;s:16:\"modificationDate\";i:1479545714;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:2852;s:11:\"imageHeight\";i:1493;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_16','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:16;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"06.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545714;s:16:\"modificationDate\";i:1479545714;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1600;s:11:\"imageHeight\";i:2383;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_17','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:17;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"08.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545715;s:16:\"modificationDate\";i:1479545715;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1173;s:11:\"imageHeight\";i:1672;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_18','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:18;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"09.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545716;s:16:\"modificationDate\";i:1479545716;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:2882;s:11:\"imageHeight\";i:1529;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_19','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:19;s:8:\"parentId\";i:10;s:8:\"filename\";s:5:\"1.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545716;s:16:\"modificationDate\";i:1479545716;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1600;s:11:\"imageHeight\";i:2091;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_20','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:20;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"11.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545716;s:16:\"modificationDate\";i:1479545716;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:640;s:11:\"imageHeight\";i:3989;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_21','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:21;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"10.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545716;s:16:\"modificationDate\";i:1479545716;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:640;s:11:\"imageHeight\";i:4143;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_22','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:22;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"12.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545716;s:16:\"modificationDate\";i:1479545716;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:640;s:11:\"imageHeight\";i:2835;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_23','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:23;s:8:\"parentId\";i:10;s:8:\"filename\";s:6:\"13.jpg\";s:4:\"path\";s:16:\"/projects/oribe/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545717;s:16:\"modificationDate\";i:1479545717;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:640;s:11:\"imageHeight\";i:4141;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_3','O:26:\"Pimcore\\Model\\Asset\\Folder\":17:{s:4:\"type\";s:6:\"folder\";s:2:\"id\";i:3;s:8:\"parentId\";i:1;s:8:\"filename\";s:4:\"home\";s:4:\"path\";s:1:\"/\";s:8:\"mimetype\";N;s:12:\"creationDate\";i:1479545698;s:16:\"modificationDate\";i:1479545698;s:9:\"userOwner\";s:1:\"1\";s:16:\"userModification\";s:1:\"0\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:0:{}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545699,1481964899),('pimcore_asset_4','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:4;s:8:\"parentId\";i:3;s:8:\"filename\";s:51:\"1150461_760828250657319_5488560786455551087_o_1.jpg\";s:4:\"path\";s:6:\"/home/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545698;s:16:\"modificationDate\";i:1479545698;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1155;s:11:\"imageHeight\";i:805;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545699,1481964899),('pimcore_asset_5','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:5;s:8:\"parentId\";i:3;s:8:\"filename\";s:7:\"003.jpg\";s:4:\"path\";s:6:\"/home/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545698;s:16:\"modificationDate\";i:1479545698;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1920;s:11:\"imageHeight\";i:1080;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545699,1481964899),('pimcore_asset_6','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:6;s:8:\"parentId\";i:3;s:8:\"filename\";s:49:\"1150461_760828250657319_5488560786455551087_o.jpg\";s:4:\"path\";s:6:\"/home/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545698;s:16:\"modificationDate\";i:1479545698;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:2800;s:11:\"imageHeight\";i:1947;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545699,1481964899),('pimcore_asset_7','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:7;s:8:\"parentId\";i:3;s:8:\"filename\";s:39:\"1531853_621380787935400_987677339_o.jpg\";s:4:\"path\";s:6:\"/home/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545698;s:16:\"modificationDate\";i:1479545698;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:2800;s:11:\"imageHeight\";i:1947;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545699,1481964899),('pimcore_asset_8','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:8;s:8:\"parentId\";i:3;s:8:\"filename\";s:7:\"001.jpg\";s:4:\"path\";s:6:\"/home/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1479545699;s:16:\"modificationDate\";i:1479545699;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:2800;s:11:\"imageHeight\";i:1947;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545699,1481964899),('pimcore_asset_9','O:26:\"Pimcore\\Model\\Asset\\Folder\":17:{s:4:\"type\";s:6:\"folder\";s:2:\"id\";i:9;s:8:\"parentId\";i:1;s:8:\"filename\";s:8:\"projects\";s:4:\"path\";s:1:\"/\";s:8:\"mimetype\";N;s:12:\"creationDate\";i:1479545714;s:16:\"modificationDate\";i:1479545714;s:9:\"userOwner\";s:1:\"1\";s:16:\"userModification\";s:1:\"0\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:0:{}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1479545719,1481964919),('pimcore_asset_properties_6','a:0:{}',1479545741,1481964941),('pimcore_document_1','O:27:\"Pimcore\\Model\\Document\\Page\":25:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:8:\"metaData\";a:0:{}s:4:\"type\";s:4:\"page\";s:9:\"prettyUrl\";N;s:8:\"personas\";s:0:\"\";s:6:\"module\";N;s:10:\"controller\";s:7:\"default\";s:6:\"action\";s:7:\"default\";s:8:\"template\";s:20:\"/default/default.php\";s:8:\"elements\";a:9:{s:19:\"contenthome-slider1\";O:34:\"Pimcore\\Model\\Document\\Tag\\Wysiwyg\":5:{s:4:\"text\";s:184:\"<p>Meditation thundercats paleo, kogi subway tile typewriter photo booth tofu humblebrag tacos YOLO. Tote bag bicycle rights pabst, cliche 3 wolf moon af brooklyn cred neutra VHS.</p>\n\";s:7:\"\0*\0name\";s:19:\"contenthome-slider1\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:1;s:12:\"\0*\0inherited\";b:0;}s:19:\"contenthome-slider2\";O:34:\"Pimcore\\Model\\Document\\Tag\\Wysiwyg\":5:{s:4:\"text\";s:138:\"<p>Shoreditch mlkshk hammock, banh mi vape vegan ugh helvetica bitters waistcoat umami enamel pin microdosing af messenger bag.&nbsp;</p>\n\";s:7:\"\0*\0name\";s:19:\"contenthome-slider2\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:1;s:12:\"\0*\0inherited\";b:0;}s:11:\"home-slider\";O:32:\"Pimcore\\Model\\Document\\Tag\\Block\":7:{s:7:\"indices\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:7:\"current\";i:0;s:8:\"suffixes\";a:0:{}s:7:\"\0*\0name\";s:11:\"home-slider\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:1;s:12:\"\0*\0inherited\";b:0;}s:16:\"linkhome-slider1\";O:31:\"Pimcore\\Model\\Document\\Tag\\Href\":7:{s:2:\"id\";i:4;s:4:\"type\";s:8:\"document\";s:7:\"subtype\";s:4:\"page\";s:7:\"\0*\0name\";s:16:\"linkhome-slider1\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:1;s:12:\"\0*\0inherited\";b:0;}s:16:\"linkhome-slider2\";O:31:\"Pimcore\\Model\\Document\\Tag\\Href\":7:{s:2:\"id\";i:4;s:4:\"type\";s:5:\"asset\";s:7:\"subtype\";s:5:\"image\";s:7:\"\0*\0name\";s:16:\"linkhome-slider2\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:1;s:12:\"\0*\0inherited\";b:0;}s:16:\"testhome-slider1\";O:32:\"Pimcore\\Model\\Document\\Tag\\Image\":13:{s:2:\"id\";i:4;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";N;s:6:\"marker\";N;s:7:\"\0*\0name\";s:16:\"testhome-slider1\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:1;s:12:\"\0*\0inherited\";b:0;}s:16:\"testhome-slider2\";O:32:\"Pimcore\\Model\\Document\\Tag\\Image\":13:{s:2:\"id\";i:6;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";N;s:6:\"marker\";N;s:7:\"\0*\0name\";s:16:\"testhome-slider2\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:1;s:12:\"\0*\0inherited\";b:0;}s:17:\"titlehome-slider1\";O:32:\"Pimcore\\Model\\Document\\Tag\\Input\":5:{s:4:\"text\";s:5:\"Oribe\";s:7:\"\0*\0name\";s:17:\"titlehome-slider1\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:1;s:12:\"\0*\0inherited\";b:0;}s:17:\"titlehome-slider2\";O:32:\"Pimcore\\Model\\Document\\Tag\\Input\":5:{s:4:\"text\";s:12:\"Vnex & Eaglz\";s:7:\"\0*\0name\";s:17:\"titlehome-slider2\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:1;s:12:\"\0*\0inherited\";b:0;}}s:23:\"contentMasterDocumentId\";N;s:2:\"id\";i:1;s:8:\"parentId\";i:0;s:3:\"key\";s:0:\"\";s:4:\"path\";s:1:\"/\";s:5:\"index\";i:999999;s:9:\"published\";b:1;s:12:\"creationDate\";i:1479473990;s:16:\"modificationDate\";i:1479546192;s:9:\"userOwner\";i:1;s:16:\"userModification\";i:2;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1479546192,1481965392),('pimcore_document_2','O:30:\"Pimcore\\Model\\Document\\Snippet\":20:{s:4:\"type\";s:7:\"snippet\";s:6:\"module\";N;s:10:\"controller\";s:7:\"default\";s:6:\"action\";s:7:\"contact\";s:8:\"template\";s:20:\"/default/contact.php\";s:8:\"elements\";a:5:{s:11:\"home-slider\";O:32:\"Pimcore\\Model\\Document\\Tag\\Block\":7:{s:7:\"indices\";a:0:{}s:7:\"current\";i:0;s:8:\"suffixes\";a:0:{}s:7:\"\0*\0name\";s:11:\"home-slider\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:2;s:12:\"\0*\0inherited\";b:0;}s:10:\"linklinks1\";O:31:\"Pimcore\\Model\\Document\\Tag\\Link\":5:{s:4:\"data\";a:11:{s:4:\"text\";s:4:\"Yolo\";s:4:\"path\";s:36:\"http://dictionnaire-urbain.fr/?p=457\";s:6:\"target\";s:6:\"_blank\";s:10:\"parameters\";s:0:\"\";s:6:\"anchor\";s:0:\"\";s:5:\"title\";s:0:\"\";s:9:\"accesskey\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:8:\"tabindex\";s:0:\"\";s:5:\"class\";s:0:\"\";s:10:\"attributes\";s:0:\"\";}s:7:\"\0*\0name\";s:10:\"linklinks1\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:2;s:12:\"\0*\0inherited\";b:0;}s:10:\"linklinks2\";O:31:\"Pimcore\\Model\\Document\\Tag\\Link\":5:{s:4:\"data\";a:11:{s:4:\"text\";s:10:\"Fk glutten\";s:4:\"path\";s:27:\"http://noglutenshop.com/fr/\";s:6:\"target\";s:6:\"_blank\";s:10:\"parameters\";s:0:\"\";s:6:\"anchor\";s:0:\"\";s:5:\"title\";s:0:\"\";s:9:\"accesskey\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:8:\"tabindex\";s:0:\"\";s:5:\"class\";s:0:\"\";s:10:\"attributes\";s:0:\"\";}s:7:\"\0*\0name\";s:10:\"linklinks2\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:2;s:12:\"\0*\0inherited\";b:0;}s:5:\"links\";O:32:\"Pimcore\\Model\\Document\\Tag\\Block\":7:{s:7:\"indices\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:7:\"current\";i:0;s:8:\"suffixes\";a:0:{}s:7:\"\0*\0name\";s:5:\"links\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:2;s:12:\"\0*\0inherited\";b:0;}s:4:\"text\";O:34:\"Pimcore\\Model\\Document\\Tag\\Wysiwyg\":5:{s:4:\"text\";s:704:\"Meditation thundercats paleo, kogi subway tile typewriter photo booth tofu humblebrag tacos YOLO. Tote bag bicycle rights pabst, cliche 3 wolf moon af brooklyn cred neutra VHS. Shoreditch mlkshk hammock, banh mi vape vegan ugh helvetica bitters waistcoat umami enamel pin microdosing af messenger bag. 3 wolf moon meh plaid fashion axe everyday carry, chicharrones hashtag food truck post-ironic pabst stumptown echo park vape small batch gentrify. Offal glossier af, pitchfork cardigan selvage literally meggings. Narwhal roof party ramps, affogato chicharrones enamel pin polaroid. Retro quinoa stumptown, intelligentsia pop-up chambray brooklyn thundercats sriracha umami tofu wolf biodiesel glossier.\";s:7:\"\0*\0name\";s:4:\"text\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:2;s:12:\"\0*\0inherited\";b:0;}}s:23:\"contentMasterDocumentId\";N;s:2:\"id\";i:2;s:8:\"parentId\";i:1;s:3:\"key\";s:7:\"contact\";s:4:\"path\";s:1:\"/\";s:5:\"index\";i:1;s:9:\"published\";b:1;s:12:\"creationDate\";i:1479545827;s:16:\"modificationDate\";i:1479545991;s:9:\"userOwner\";i:2;s:16:\"userModification\";i:2;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1479545991,1481965191),('pimcore_document_3','O:29:\"Pimcore\\Model\\Document\\Folder\":14:{s:4:\"type\";s:6:\"folder\";s:2:\"id\";i:3;s:8:\"parentId\";i:1;s:3:\"key\";s:8:\"projects\";s:4:\"path\";s:1:\"/\";s:5:\"index\";i:2;s:9:\"published\";b:1;s:12:\"creationDate\";i:1479546083;s:16:\"modificationDate\";i:1479546083;s:9:\"userOwner\";i:2;s:16:\"userModification\";i:2;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1479546084,1481965284),('pimcore_document_4','O:27:\"Pimcore\\Model\\Document\\Page\":25:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:8:\"metaData\";a:0:{}s:4:\"type\";s:4:\"page\";s:9:\"prettyUrl\";N;s:8:\"personas\";s:0:\"\";s:6:\"module\";N;s:10:\"controller\";s:7:\"default\";s:6:\"action\";s:7:\"project\";s:8:\"template\";s:20:\"/default/project.php\";s:8:\"elements\";a:9:{s:22:\"blocktypecontentblock1\";O:33:\"Pimcore\\Model\\Document\\Tag\\Select\":5:{s:4:\"text\";s:3:\"two\";s:7:\"\0*\0name\";s:22:\"blocktypecontentblock1\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:4;s:12:\"\0*\0inherited\";b:0;}s:22:\"blocktypecontentblock2\";O:33:\"Pimcore\\Model\\Document\\Tag\\Select\":5:{s:4:\"text\";s:3:\"one\";s:7:\"\0*\0name\";s:22:\"blocktypecontentblock2\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:4;s:12:\"\0*\0inherited\";b:0;}s:12:\"contentblock\";O:32:\"Pimcore\\Model\\Document\\Tag\\Block\":7:{s:7:\"indices\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:7:\"current\";i:0;s:8:\"suffixes\";a:0:{}s:7:\"\0*\0name\";s:12:\"contentblock\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:4;s:12:\"\0*\0inherited\";b:0;}s:11:\"home-slider\";O:32:\"Pimcore\\Model\\Document\\Tag\\Block\":7:{s:7:\"indices\";a:0:{}s:7:\"current\";i:0;s:8:\"suffixes\";a:0:{}s:7:\"\0*\0name\";s:11:\"home-slider\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:4;s:12:\"\0*\0inherited\";b:0;}s:19:\"image1contentblock1\";O:32:\"Pimcore\\Model\\Document\\Tag\\Image\":13:{s:2:\"id\";i:13;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";a:0:{}s:6:\"marker\";a:0:{}s:7:\"\0*\0name\";s:19:\"image1contentblock1\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:4;s:12:\"\0*\0inherited\";b:0;}s:19:\"image2contentblock1\";O:32:\"Pimcore\\Model\\Document\\Tag\\Image\":13:{s:2:\"id\";i:17;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";a:0:{}s:6:\"marker\";a:0:{}s:7:\"\0*\0name\";s:19:\"image2contentblock1\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:4;s:12:\"\0*\0inherited\";b:0;}s:18:\"imagecontentblock2\";O:32:\"Pimcore\\Model\\Document\\Tag\\Image\":13:{s:2:\"id\";i:12;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";N;s:6:\"marker\";N;s:7:\"\0*\0name\";s:18:\"imagecontentblock2\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:4;s:12:\"\0*\0inherited\";b:0;}s:13:\"project-title\";O:32:\"Pimcore\\Model\\Document\\Tag\\Input\":5:{s:4:\"text\";s:5:\"Oribe\";s:7:\"\0*\0name\";s:13:\"project-title\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:4;s:12:\"\0*\0inherited\";b:0;}s:4:\"test\";O:32:\"Pimcore\\Model\\Document\\Tag\\Image\":13:{s:2:\"id\";i:4;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";a:0:{}s:6:\"marker\";a:0:{}s:7:\"\0*\0name\";s:4:\"test\";s:11:\"\0*\0realName\";N;s:13:\"\0*\0documentId\";i:4;s:12:\"\0*\0inherited\";b:0;}}s:23:\"contentMasterDocumentId\";N;s:2:\"id\";i:4;s:8:\"parentId\";i:3;s:3:\"key\";s:5:\"oribe\";s:4:\"path\";s:10:\"/projects/\";s:5:\"index\";i:1;s:9:\"published\";b:1;s:12:\"creationDate\";i:1479546091;s:16:\"modificationDate\";i:1479546185;s:9:\"userOwner\";i:2;s:16:\"userModification\";i:2;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1479546185,1481965385),('pimcore_document_properties_1','a:0:{}',1479546198,1481965398),('pimcore_document_properties_2','a:1:{s:15:\"navigation_name\";O:22:\"Pimcore\\Model\\Property\":8:{s:4:\"name\";s:15:\"navigation_name\";s:4:\"data\";s:7:\"contact\";s:4:\"type\";s:4:\"text\";s:5:\"ctype\";s:8:\"document\";s:5:\"cpath\";N;s:3:\"cid\";i:2;s:11:\"inheritable\";b:1;s:9:\"inherited\";b:0;}}',1479546198,1481965398),('pimcore_document_properties_4','a:1:{s:15:\"navigation_name\";O:22:\"Pimcore\\Model\\Property\":8:{s:4:\"name\";s:15:\"navigation_name\";s:4:\"data\";s:5:\"oribe\";s:4:\"type\";s:4:\"text\";s:5:\"ctype\";s:8:\"document\";s:5:\"cpath\";N;s:3:\"cid\";i:4;s:11:\"inheritable\";b:1;s:9:\"inherited\";b:0;}}',1479546202,1481965402),('pimcore_nav_3737133af4030a3240a06a958be4f8be','O:15:\"Zend_Navigation\":3:{s:9:\"\0*\0_pages\";a:0:{}s:9:\"\0*\0_index\";a:0:{}s:14:\"\0*\0_dirtyIndex\";b:0;}',1479546198,1481965398),('pimcore_site_domain_4641c10d7d866ca730c4119d54c125bb','s:6:\"failed\";',1479546068,1481965268),('pimcore_site_domain_8802c0ab4bf43e4a8747073b13103e73','s:6:\"failed\";',1479545098,1481964298),('pimcore_system_resource_columns_edit_lock','a:6:{i:0;s:2:\"id\";i:1;s:3:\"cid\";i:2;s:5:\"ctype\";i:3;s:6:\"userId\";i:4;s:9:\"sessionId\";i:5;s:4:\"date\";}',1479544739,1481963939),('pimcore_system_resource_columns_recyclebin','a:7:{i:0;s:2:\"id\";i:1;s:4:\"type\";i:2;s:7:\"subtype\";i:3;s:4:\"path\";i:4;s:6:\"amount\";i:5;s:4:\"date\";i:6;s:9:\"deletedby\";}',1479545708,1481964908),('pimcore_system_route_redirect','a:0:{}',1479547034,1481966234),('pimcore_Translate_Website_data_en','a:1:{s:15:\"__pimcore_dummy\";s:12:\"only_a_dummy\";}',1479544739,1481963939),('pimcore_translations_admin_data','a:0:{}',1479546168,1479547167),('pimcore_website_config','O:11:\"Zend_Config\":8:{s:22:\"\0*\0_allowModifications\";b:1;s:9:\"\0*\0_index\";i:0;s:9:\"\0*\0_count\";i:0;s:8:\"\0*\0_data\";a:0:{}s:21:\"\0*\0_skipNextIteration\";N;s:17:\"\0*\0_loadedSection\";N;s:11:\"\0*\0_extends\";a:0:{}s:20:\"\0*\0_loadFileErrorStr\";N;}',1479546198,1481965398);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_tags`
--

DROP TABLE IF EXISTS `cache_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_tags` (
  `id` varchar(165) NOT NULL DEFAULT '',
  `tag` varchar(165) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tag`),
  KEY `id` (`id`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_tags`
--

LOCK TABLES `cache_tags` WRITE;
/*!40000 ALTER TABLE `cache_tags` DISABLE KEYS */;
INSERT INTO `cache_tags` VALUES ('pimcore_asset_1','asset_1'),('pimcore_asset_10','asset_10'),('pimcore_asset_11','asset_11'),('pimcore_asset_12','asset_12'),('pimcore_asset_13','asset_13'),('pimcore_asset_14','asset_14'),('pimcore_asset_15','asset_15'),('pimcore_asset_16','asset_16'),('pimcore_asset_17','asset_17'),('pimcore_asset_18','asset_18'),('pimcore_asset_19','asset_19'),('pimcore_asset_20','asset_20'),('pimcore_asset_21','asset_21'),('pimcore_asset_22','asset_22'),('pimcore_asset_23','asset_23'),('pimcore_asset_3','asset_3'),('pimcore_asset_4','asset_4'),('pimcore_asset_5','asset_5'),('pimcore_asset_6','asset_6'),('pimcore_asset_7','asset_7'),('pimcore_asset_8','asset_8'),('pimcore_asset_9','asset_9'),('pimcore_asset_properties_6','asset_6'),('pimcore_asset_properties_6','asset_properties'),('pimcore_asset_properties_6','asset_properties_6'),('pimcore_document_1','asset_4'),('pimcore_document_1','asset_6'),('pimcore_document_1','document_1'),('pimcore_document_2','document_2'),('pimcore_document_3','document_3'),('pimcore_document_4','asset_12'),('pimcore_document_4','asset_13'),('pimcore_document_4','asset_17'),('pimcore_document_4','asset_4'),('pimcore_document_4','document_4'),('pimcore_document_properties_1','document_1'),('pimcore_document_properties_1','document_properties'),('pimcore_document_properties_1','document_properties_1'),('pimcore_document_properties_2','document_2'),('pimcore_document_properties_2','document_properties'),('pimcore_document_properties_2','document_properties_2'),('pimcore_document_properties_4','document_4'),('pimcore_document_properties_4','document_properties'),('pimcore_document_properties_4','document_properties_4'),('pimcore_nav_3737133af4030a3240a06a958be4f8be','navigation'),('pimcore_nav_3737133af4030a3240a06a958be4f8be','nav_3737133af4030a3240a06a958be4f8be'),('pimcore_nav_3737133af4030a3240a06a958be4f8be','output'),('pimcore_site_domain_4641c10d7d866ca730c4119d54c125bb','site'),('pimcore_site_domain_4641c10d7d866ca730c4119d54c125bb','site_domain_4641c10d7d866ca730c4119d54c125bb'),('pimcore_site_domain_4641c10d7d866ca730c4119d54c125bb','system'),('pimcore_site_domain_8802c0ab4bf43e4a8747073b13103e73','site'),('pimcore_site_domain_8802c0ab4bf43e4a8747073b13103e73','site_domain_8802c0ab4bf43e4a8747073b13103e73'),('pimcore_site_domain_8802c0ab4bf43e4a8747073b13103e73','system'),('pimcore_system_resource_columns_edit_lock','resource'),('pimcore_system_resource_columns_edit_lock','system'),('pimcore_system_resource_columns_edit_lock','system_resource_columns_edit_lock'),('pimcore_system_resource_columns_recyclebin','resource'),('pimcore_system_resource_columns_recyclebin','system'),('pimcore_system_resource_columns_recyclebin','system_resource_columns_recyclebin'),('pimcore_system_route_redirect','redirect'),('pimcore_system_route_redirect','route'),('pimcore_system_route_redirect','system'),('pimcore_system_route_redirect','system_route_redirect'),('pimcore_Translate_Website_data_en','translate'),('pimcore_Translate_Website_data_en','Translate_Website_data_en'),('pimcore_Translate_Website_data_en','translator'),('pimcore_Translate_Website_data_en','translator_website'),('pimcore_translations_admin_data','translate'),('pimcore_translations_admin_data','translations_admin_data'),('pimcore_translations_admin_data','translator'),('pimcore_website_config','config'),('pimcore_website_config','output'),('pimcore_website_config','system'),('pimcore_website_config','website_config');
/*!40000 ALTER TABLE `cache_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(190) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collectionrelations`
--

DROP TABLE IF EXISTS `classificationstore_collectionrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_collectionrelations` (
  `colId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `sorter` int(10) DEFAULT '0',
  PRIMARY KEY (`colId`,`groupId`),
  KEY `colId` (`colId`),
  KEY `FK_classificationstore_collectionrelations_groups` (`groupId`),
  CONSTRAINT `FK_classificationstore_collectionrelations_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collectionrelations`
--

LOCK TABLES `classificationstore_collectionrelations` WRITE;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collections`
--

DROP TABLE IF EXISTS `classificationstore_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collections`
--

LOCK TABLES `classificationstore_collections` WRITE;
/*!40000 ALTER TABLE `classificationstore_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_groups`
--

DROP TABLE IF EXISTS `classificationstore_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `parentId` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_groups`
--

LOCK TABLES `classificationstore_groups` WRITE;
/*!40000 ALTER TABLE `classificationstore_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_keys`
--

DROP TABLE IF EXISTS `classificationstore_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `type` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  `definition` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `enabled` (`enabled`),
  KEY `type` (`type`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_keys`
--

LOCK TABLES `classificationstore_keys` WRITE;
/*!40000 ALTER TABLE `classificationstore_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_relations`
--

DROP TABLE IF EXISTS `classificationstore_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_relations` (
  `groupId` bigint(20) NOT NULL,
  `keyId` bigint(20) NOT NULL,
  `sorter` int(11) DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`groupId`,`keyId`),
  KEY `FK_classificationstore_relations_classificationstore_keys` (`keyId`),
  KEY `groupId` (`groupId`),
  KEY `mandatory` (`mandatory`),
  CONSTRAINT `FK_classificationstore_relations_classificationstore_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_classificationstore_relations_classificationstore_keys` FOREIGN KEY (`keyId`) REFERENCES `classificationstore_keys` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_relations`
--

LOCK TABLES `classificationstore_relations` WRITE;
/*!40000 ALTER TABLE `classificationstore_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_stores`
--

DROP TABLE IF EXISTS `classificationstore_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_stores`
--

LOCK TABLES `classificationstore_stores` WRITE;
/*!40000 ALTER TABLE `classificationstore_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_layouts`
--

DROP TABLE IF EXISTS `custom_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_layouts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classId` int(11) unsigned NOT NULL,
  `name` varchar(190) DEFAULT NULL,
  `description` text,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `default` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_layouts`
--

LOCK TABLES `custom_layouts` WRITE;
/*!40000 ALTER TABLE `custom_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS `dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencies` (
  `sourcetype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `sourceid` int(11) unsigned NOT NULL DEFAULT '0',
  `targettype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `targetid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sourcetype`,`sourceid`,`targetid`,`targettype`),
  KEY `sourceid` (`sourceid`),
  KEY `targetid` (`targetid`),
  KEY `sourcetype` (`sourcetype`),
  KEY `targettype` (`targettype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencies`
--

LOCK TABLES `dependencies` WRITE;
/*!40000 ALTER TABLE `dependencies` DISABLE KEYS */;
INSERT INTO `dependencies` VALUES ('document',1,'document',4),('document',1,'asset',4),('document',1,'asset',6),('document',4,'asset',4),('document',4,'asset',12),('document',4,'asset',13),('document',4,'asset',17);
/*!40000 ALTER TABLE `dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` enum('page','link','snippet','folder','hardlink','email','newsletter','printpage','printcontainer') DEFAULT NULL,
  `key` varchar(255) CHARACTER SET ascii DEFAULT '',
  `path` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `index` int(11) unsigned DEFAULT '0',
  `published` tinyint(1) unsigned DEFAULT '1',
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`key`),
  KEY `parentId` (`parentId`),
  KEY `key` (`key`),
  KEY `path` (`path`),
  KEY `published` (`published`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,0,'page','','/',999999,1,1479473990,1479546192,1,2),(2,1,'snippet','contact','/',1,1,1479545827,1479545991,2,2),(3,1,'folder','projects','/',2,1,1479546083,1479546083,2,2),(4,3,'page','oribe','/projects/',1,1,1479546091,1479546185,2,2);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_elements`
--

DROP TABLE IF EXISTS `documents_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_elements` (
  `documentId` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(750) CHARACTER SET ascii NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`documentId`,`name`),
  KEY `documentId` (`documentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_elements`
--

LOCK TABLES `documents_elements` WRITE;
/*!40000 ALTER TABLE `documents_elements` DISABLE KEYS */;
INSERT INTO `documents_elements` VALUES (1,'contenthome-slider1','wysiwyg','<p>Meditation thundercats paleo, kogi subway tile typewriter photo booth tofu humblebrag tacos YOLO. Tote bag bicycle rights pabst, cliche 3 wolf moon af brooklyn cred neutra VHS.</p>\n'),(1,'contenthome-slider2','wysiwyg','<p>Shoreditch mlkshk hammock, banh mi vape vegan ugh helvetica bitters waistcoat umami enamel pin microdosing af messenger bag.&nbsp;</p>\n'),(1,'home-slider','block','a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}'),(1,'linkhome-slider1','href','a:3:{s:2:\"id\";i:4;s:4:\"type\";s:8:\"document\";s:7:\"subtype\";s:4:\"page\";}'),(1,'linkhome-slider2','href','a:3:{s:2:\"id\";i:4;s:4:\"type\";s:5:\"asset\";s:7:\"subtype\";s:5:\"image\";}'),(1,'testhome-slider1','image','a:9:{s:2:\"id\";i:4;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";N;s:6:\"marker\";N;}'),(1,'testhome-slider2','image','a:9:{s:2:\"id\";i:6;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";N;s:6:\"marker\";N;}'),(1,'titlehome-slider1','input','Oribe'),(1,'titlehome-slider2','input','Vnex & Eaglz'),(2,'home-slider','block','a:0:{}'),(2,'linklinks1','link','a:11:{s:4:\"text\";s:4:\"Yolo\";s:4:\"path\";s:36:\"http://dictionnaire-urbain.fr/?p=457\";s:6:\"target\";s:6:\"_blank\";s:10:\"parameters\";s:0:\"\";s:6:\"anchor\";s:0:\"\";s:5:\"title\";s:0:\"\";s:9:\"accesskey\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:8:\"tabindex\";s:0:\"\";s:5:\"class\";s:0:\"\";s:10:\"attributes\";s:0:\"\";}'),(2,'linklinks2','link','a:11:{s:4:\"text\";s:10:\"Fk glutten\";s:4:\"path\";s:27:\"http://noglutenshop.com/fr/\";s:6:\"target\";s:6:\"_blank\";s:10:\"parameters\";s:0:\"\";s:6:\"anchor\";s:0:\"\";s:5:\"title\";s:0:\"\";s:9:\"accesskey\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:8:\"tabindex\";s:0:\"\";s:5:\"class\";s:0:\"\";s:10:\"attributes\";s:0:\"\";}'),(2,'links','block','a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}'),(2,'text','wysiwyg','Meditation thundercats paleo, kogi subway tile typewriter photo booth tofu humblebrag tacos YOLO. Tote bag bicycle rights pabst, cliche 3 wolf moon af brooklyn cred neutra VHS. Shoreditch mlkshk hammock, banh mi vape vegan ugh helvetica bitters waistcoat umami enamel pin microdosing af messenger bag. 3 wolf moon meh plaid fashion axe everyday carry, chicharrones hashtag food truck post-ironic pabst stumptown echo park vape small batch gentrify. Offal glossier af, pitchfork cardigan selvage literally meggings. Narwhal roof party ramps, affogato chicharrones enamel pin polaroid. Retro quinoa stumptown, intelligentsia pop-up chambray brooklyn thundercats sriracha umami tofu wolf biodiesel glossier.'),(4,'blocktypecontentblock1','select','two'),(4,'blocktypecontentblock2','select','one'),(4,'contentblock','block','a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}'),(4,'home-slider','block','a:0:{}'),(4,'image1contentblock1','image','a:9:{s:2:\"id\";i:13;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";a:0:{}s:6:\"marker\";a:0:{}}'),(4,'image2contentblock1','image','a:9:{s:2:\"id\";i:17;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";a:0:{}s:6:\"marker\";a:0:{}}'),(4,'imagecontentblock2','image','a:9:{s:2:\"id\";i:12;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";N;s:6:\"marker\";N;}'),(4,'project-title','input','Oribe'),(4,'test','image','a:9:{s:2:\"id\";i:4;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";a:0:{}s:6:\"marker\";a:0:{}}');
/*!40000 ALTER TABLE `documents_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_email`
--

DROP TABLE IF EXISTS `documents_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_email` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_email`
--

LOCK TABLES `documents_email` WRITE;
/*!40000 ALTER TABLE `documents_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_hardlink`
--

DROP TABLE IF EXISTS `documents_hardlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_hardlink` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `sourceId` int(11) DEFAULT NULL,
  `propertiesFromSource` tinyint(1) DEFAULT NULL,
  `childsFromSource` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_hardlink`
--

LOCK TABLES `documents_hardlink` WRITE;
/*!40000 ALTER TABLE `documents_hardlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_hardlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_link`
--

DROP TABLE IF EXISTS `documents_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_link` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `internalType` enum('document','asset') DEFAULT NULL,
  `internal` int(11) unsigned DEFAULT NULL,
  `direct` varchar(1000) DEFAULT NULL,
  `linktype` enum('direct','internal') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_link`
--

LOCK TABLES `documents_link` WRITE;
/*!40000 ALTER TABLE `documents_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_newsletter`
--

DROP TABLE IF EXISTS `documents_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_newsletter` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `trackingParameterSource` varchar(255) DEFAULT NULL,
  `trackingParameterMedium` varchar(255) DEFAULT NULL,
  `trackingParameterName` varchar(255) DEFAULT NULL,
  `enableTrackingParameters` tinyint(1) unsigned DEFAULT NULL,
  `sendingMode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_newsletter`
--

LOCK TABLES `documents_newsletter` WRITE;
/*!40000 ALTER TABLE `documents_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_page`
--

DROP TABLE IF EXISTS `documents_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_page` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `metaData` text,
  `prettyUrl` varchar(190) DEFAULT NULL,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  `personas` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prettyUrl` (`prettyUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_page`
--

LOCK TABLES `documents_page` WRITE;
/*!40000 ALTER TABLE `documents_page` DISABLE KEYS */;
INSERT INTO `documents_page` VALUES (1,NULL,'default','default','/default/default.php','','','a:0:{}',NULL,NULL,''),(2,NULL,'default','default','/default/contact.php','','','a:0:{}',NULL,NULL,''),(4,NULL,'default','project','/default/project.php','','','a:0:{}',NULL,NULL,'');
/*!40000 ALTER TABLE `documents_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_printpage`
--

DROP TABLE IF EXISTS `documents_printpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_printpage` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `lastGenerated` int(11) DEFAULT NULL,
  `lastGenerateMessage` text,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_printpage`
--

LOCK TABLES `documents_printpage` WRITE;
/*!40000 ALTER TABLE `documents_printpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_printpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_snippet`
--

DROP TABLE IF EXISTS `documents_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_snippet` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_snippet`
--

LOCK TABLES `documents_snippet` WRITE;
/*!40000 ALTER TABLE `documents_snippet` DISABLE KEYS */;
INSERT INTO `documents_snippet` VALUES (2,NULL,'default','contact','/default/contact.php',NULL);
/*!40000 ALTER TABLE `documents_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_translations`
--

DROP TABLE IF EXISTS `documents_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_translations` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `sourceId` int(11) unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceId`,`language`),
  KEY `id` (`id`),
  KEY `sourceId` (`sourceId`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_translations`
--

LOCK TABLES `documents_translations` WRITE;
/*!40000 ALTER TABLE `documents_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_lock`
--

DROP TABLE IF EXISTS `edit_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit_lock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `sessionId` varchar(255) DEFAULT NULL,
  `date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `cidtype` (`cid`,`ctype`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_lock`
--

LOCK TABLES `edit_lock` WRITE;
/*!40000 ALTER TABLE `edit_lock` DISABLE KEYS */;
INSERT INTO `edit_lock` VALUES (3,1,'asset',2,'72vq1dbd6ob9kbcnupbn4lksq5',1479474084),(4,2,'asset',2,'72vq1dbd6ob9kbcnupbn4lksq5',1479474091),(11,1,'document',2,'3ut82apah4mfvv80iuiprs1k72',1479544907),(16,2,'document',2,'3ut82apah4mfvv80iuiprs1k72',1479545912),(18,4,'document',2,'3ut82apah4mfvv80iuiprs1k72',1479546110);
/*!40000 ALTER TABLE `edit_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_workflow_state`
--

DROP TABLE IF EXISTS `element_workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_workflow_state` (
  `cid` int(10) NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  `workflowId` int(11) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`,`ctype`,`workflowId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_workflow_state`
--

LOCK TABLES `element_workflow_state` WRITE;
/*!40000 ALTER TABLE `element_workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `element_workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_blacklist`
--

DROP TABLE IF EXISTS `email_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_blacklist` (
  `address` varchar(190) NOT NULL DEFAULT '',
  `creationDate` int(11) unsigned DEFAULT NULL,
  `modificationDate` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_blacklist`
--

LOCK TABLES `email_blacklist` WRITE;
/*!40000 ALTER TABLE `email_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentId` int(11) DEFAULT NULL,
  `requestUri` varchar(500) DEFAULT NULL,
  `params` text,
  `from` varchar(500) DEFAULT NULL,
  `to` longtext,
  `cc` longtext,
  `bcc` longtext,
  `sentDate` bigint(20) DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary`
--

DROP TABLE IF EXISTS `glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(10) DEFAULT NULL,
  `casesensitive` tinyint(1) DEFAULT NULL,
  `exactmatch` tinyint(1) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `site` int(11) unsigned DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `language` (`language`),
  KEY `site` (`site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary`
--

LOCK TABLES `glossary` WRITE;
/*!40000 ALTER TABLE `glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `http_error_log`
--

DROP TABLE IF EXISTS `http_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `http_error_log` (
  `uri` varchar(3000) CHARACTER SET ascii DEFAULT NULL,
  `code` int(3) DEFAULT NULL,
  `parametersGet` longtext,
  `parametersPost` longtext,
  `cookies` longtext,
  `serverVars` longtext,
  `date` bigint(20) DEFAULT NULL,
  `count` bigint(20) DEFAULT NULL,
  KEY `uri` (`uri`(765)),
  KEY `code` (`code`),
  KEY `date` (`date`),
  KEY `count` (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `http_error_log`
--

LOCK TABLES `http_error_log` WRITE;
/*!40000 ALTER TABLE `http_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `http_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyvalue_groups`
--

DROP TABLE IF EXISTS `keyvalue_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyvalue_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyvalue_groups`
--

LOCK TABLES `keyvalue_groups` WRITE;
/*!40000 ALTER TABLE `keyvalue_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyvalue_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyvalue_keys`
--

DROP TABLE IF EXISTS `keyvalue_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyvalue_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `type` enum('bool','number','select','text','translated','translatedSelect','range') DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `possiblevalues` text,
  `group` int(11) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  `translator` int(11) DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  CONSTRAINT `keyvalue_keys_ibfk_1` FOREIGN KEY (`group`) REFERENCES `keyvalue_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyvalue_keys`
--

LOCK TABLES `keyvalue_keys` WRITE;
/*!40000 ALTER TABLE `keyvalue_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyvalue_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyvalue_translator_configuration`
--

DROP TABLE IF EXISTS `keyvalue_translator_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyvalue_translator_configuration` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `translator` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyvalue_translator_configuration`
--

LOCK TABLES `keyvalue_translator_configuration` WRITE;
/*!40000 ALTER TABLE `keyvalue_translator_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyvalue_translator_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locks` (
  `id` varchar(150) NOT NULL DEFAULT '',
  `date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locks`
--

LOCK TABLES `locks` WRITE;
/*!40000 ALTER TABLE `locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `ctype` enum('asset','document','object') DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_data`
--

DROP TABLE IF EXISTS `notes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes_data` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `type` enum('text','date','document','asset','object','bool') DEFAULT NULL,
  `data` text,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_data`
--

LOCK TABLES `notes_data` WRITE;
/*!40000 ALTER TABLE `notes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objects` (
  `o_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `o_parentId` int(11) unsigned DEFAULT NULL,
  `o_type` enum('object','folder','variant') DEFAULT NULL,
  `o_key` varchar(255) CHARACTER SET ascii DEFAULT '',
  `o_path` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `o_index` int(11) unsigned DEFAULT '0',
  `o_published` tinyint(1) unsigned DEFAULT '1',
  `o_creationDate` bigint(20) unsigned DEFAULT NULL,
  `o_modificationDate` bigint(20) unsigned DEFAULT NULL,
  `o_userOwner` int(11) unsigned DEFAULT NULL,
  `o_userModification` int(11) unsigned DEFAULT NULL,
  `o_classId` int(11) unsigned DEFAULT NULL,
  `o_className` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  UNIQUE KEY `fullpath` (`o_path`,`o_key`),
  KEY `key` (`o_key`),
  KEY `path` (`o_path`),
  KEY `published` (`o_published`),
  KEY `parentId` (`o_parentId`),
  KEY `type` (`o_type`),
  KEY `o_modificationDate` (`o_modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,0,'folder','','/',999999,1,1479473990,1479473990,1,1,NULL,NULL);
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `type` enum('text','document','asset','object','bool','select') DEFAULT NULL,
  `data` text,
  `inheritable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`cid`,`ctype`,`name`),
  KEY `cpath` (`cpath`),
  KEY `inheritable` (`inheritable`),
  KEY `ctype` (`ctype`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (2,'document','/contact','navigation_name','text','contact',1),(4,'document','/projects/oribe','navigation_name','text','oribe',1);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantityvalue_units`
--

DROP TABLE IF EXISTS `quantityvalue_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quantityvalue_units` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group` varchar(50) DEFAULT NULL,
  `abbreviation` varchar(10) NOT NULL,
  `longname` varchar(250) DEFAULT NULL,
  `baseunit` varchar(10) DEFAULT NULL,
  `factor` double DEFAULT NULL,
  `conversionOffset` double DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantityvalue_units`
--

LOCK TABLES `quantityvalue_units` WRITE;
/*!40000 ALTER TABLE `quantityvalue_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `quantityvalue_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recyclebin`
--

DROP TABLE IF EXISTS `recyclebin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recyclebin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `path` varchar(765) DEFAULT NULL,
  `amount` int(3) DEFAULT NULL,
  `date` bigint(20) DEFAULT NULL,
  `deletedby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recyclebin`
--

LOCK TABLES `recyclebin` WRITE;
/*!40000 ALTER TABLE `recyclebin` DISABLE KEYS */;
INSERT INTO `recyclebin` VALUES (1,'asset','image','/grad.jpg',1,1479545708,'admin');
/*!40000 ALTER TABLE `recyclebin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirects`
--

DROP TABLE IF EXISTS `redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `sourceEntireUrl` tinyint(1) DEFAULT NULL,
  `sourceSite` int(11) DEFAULT NULL,
  `passThroughParameters` tinyint(1) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `targetSite` int(11) DEFAULT NULL,
  `statusCode` varchar(3) DEFAULT NULL,
  `priority` int(2) DEFAULT '0',
  `active` tinyint(1) DEFAULT NULL,
  `expiry` bigint(20) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirects`
--

LOCK TABLES `redirects` WRITE;
/*!40000 ALTER TABLE `redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanitycheck`
--

DROP TABLE IF EXISTS `sanitycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanitycheck` (
  `id` int(11) unsigned NOT NULL,
  `type` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanitycheck`
--

LOCK TABLES `sanitycheck` WRITE;
/*!40000 ALTER TABLE `sanitycheck` DISABLE KEYS */;
INSERT INTO `sanitycheck` VALUES (1,'document');
/*!40000 ALTER TABLE `sanitycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_tasks`
--

DROP TABLE IF EXISTS `schedule_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_tasks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `date` bigint(20) unsigned DEFAULT NULL,
  `action` enum('publish','unpublish','delete','publish-version') DEFAULT NULL,
  `version` bigint(20) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_tasks`
--

LOCK TABLES `schedule_tasks` WRITE;
/*!40000 ALTER TABLE `schedule_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_backend_data`
--

DROP TABLE IF EXISTS `search_backend_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_backend_data` (
  `id` int(11) NOT NULL,
  `fullpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `maintype` varchar(8) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(255) DEFAULT NULL,
  `published` bigint(20) DEFAULT NULL,
  `creationDate` bigint(20) DEFAULT NULL,
  `modificationDate` bigint(20) DEFAULT NULL,
  `userOwner` int(11) DEFAULT NULL,
  `userModification` int(11) DEFAULT NULL,
  `data` longtext,
  `properties` text,
  PRIMARY KEY (`id`,`maintype`),
  KEY `id` (`id`),
  KEY `fullpath` (`fullpath`),
  KEY `maintype` (`maintype`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`(250)),
  KEY `published` (`published`),
  FULLTEXT KEY `data` (`data`),
  FULLTEXT KEY `properties` (`properties`),
  FULLTEXT KEY `fulltext` (`data`,`properties`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_backend_data`
--

LOCK TABLES `search_backend_data` WRITE;
/*!40000 ALTER TABLE `search_backend_data` DISABLE KEYS */;
INSERT INTO `search_backend_data` VALUES (1,'/','document','page','page',1,1479473990,1479546192,1,2,'ID: 1  \nPath: /  \nMeditation thundercats paleo, kogi subway tile typewriter photo booth tofu humblebrag tacos YOLO. Tote bag bicycle rights pabst, cliche 3 wolf moon af brooklyn cred neutra VHS. Shoreditch mlkshk hammock, banh mi vape vegan ugh helvetica bitters waistcoat umami enamel pin microdosing af messenger bag.&nbsp; /projects/oribe /home/1150461_760828250657319_5488560786455551087_o_1.jpg Oribe Vnex & Eaglz ',''),(2,'/contact','document','snippet','snippet',1,1479545827,1479545991,2,2,'ID: 2  \nPath: /contact  \n Meditation thundercats paleo, kogi subway tile typewriter photo booth tofu humblebrag tacos YOLO. Tote bag bicycle rights pabst, cliche 3 wolf moon af brooklyn cred neutra VHS. Shoreditch mlkshk hammock, banh mi vape vegan ugh helvetica bitters waistcoat umami enamel pin microdosing af messenger bag. 3 wolf moon meh plaid fashion axe everyday carry, chicharrones hashtag food truck post-ironic pabst stumptown echo park vape small batch gentrify. Offal glossier af, pitchfork cardigan selvage literally meggings. Narwhal roof party ramps, affogato chicharrones enamel pin polaroid. Retro quinoa stumptown, intelligentsia pop-up chambray brooklyn thundercats sriracha umami tofu wolf biodiesel glossier. Yolo Fk glutten ','navigation_name:contact '),(3,'/home','asset','folder','folder',1,1479545698,1479545698,1,0,'ID: 3  \nPath: /home  \nhome',''),(3,'/projects','document','folder','folder',1,1479546083,1479546083,2,2,'ID: 3  \nPath: /projects  \nprojects',''),(4,'/home/1150461_760828250657319_5488560786455551087_o_1.jpg','asset','image','image',1,1479545698,1479545698,2,2,'ID: 4  \nPath: /home/1150461_760828250657319_5488560786455551087_o_1.jpg  \n1150461_760828250657319_5488560786455551087_o_1.jpg FileDateTime : 1479545698 FileSize : 135978 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(4,'/projects/oribe','document','page','page',1,1479546091,1479546185,2,2,'ID: 4  \nPath: /projects/oribe  \ntwo one Oribe ','navigation_name:oribe '),(5,'/home/003.jpg','asset','image','image',1,1479545698,1479545698,2,2,'ID: 5  \nPath: /home/003.jpg  \n003.jpg FileName : 003.jpg FileDateTime : 1479545698 FileSize : 867859 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(6,'/home/1150461_760828250657319_5488560786455551087_o.jpg','asset','image','image',1,1479545698,1479545698,2,2,'ID: 6  \nPath: /home/1150461_760828250657319_5488560786455551087_o.jpg  \n1150461_760828250657319_5488560786455551087_o.jpg FileName : 1150461_760828250657319_5488560786455551087_o.jpg FileDateTime : 1479545698 FileSize : 825062 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(7,'/home/1531853_621380787935400_987677339_o.jpg','asset','image','image',1,1479545698,1479545698,2,2,'ID: 7  \nPath: /home/1531853_621380787935400_987677339_o.jpg  \n1531853_621380787935400_987677339_o.jpg FileName : 1531853_621380787935400_987677339_o.jpg FileDateTime : 1479545698 FileSize : 868862 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(8,'/home/001.jpg','asset','image','image',1,1479545699,1479545699,2,2,'ID: 8  \nPath: /home/001.jpg  \n001.jpg FileName : 001.jpg FileDateTime : 1479545699 FileSize : 825062 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(9,'/projects','asset','folder','folder',1,1479545714,1479545714,1,0,'ID: 9  \nPath: /projects  \nprojects',''),(10,'/projects/oribe','asset','folder','folder',1,1479545714,1479545714,1,0,'ID: 10  \nPath: /projects/oribe  \noribe',''),(11,'/projects/oribe/03.jpg','asset','image','image',1,1479545714,1479545714,2,2,'ID: 11  \nPath: /projects/oribe/03.jpg  \n03.jpg FileName : 03.jpg FileDateTime : 1479545714 FileSize : 132574 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(12,'/projects/oribe/02.jpg','asset','image','image',1,1479545714,1479545714,2,2,'ID: 12  \nPath: /projects/oribe/02.jpg  \n02.jpg FileName : 02.jpg FileDateTime : 1479545714 FileSize : 366890 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(13,'/projects/oribe/07.jpg','asset','image','image',1,1479545714,1479545714,2,2,'ID: 13  \nPath: /projects/oribe/07.jpg  \n07.jpg FileName : 07.jpg FileDateTime : 1479545714 FileSize : 340489 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(14,'/projects/oribe/04.jpg','asset','image','image',1,1479545715,1479545715,2,2,'ID: 14  \nPath: /projects/oribe/04.jpg  \n04.jpg FileName : 04.jpg FileDateTime : 1479545715 FileSize : 456083 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(15,'/projects/oribe/05.jpg','asset','image','image',1,1479545714,1479545714,2,2,'ID: 15  \nPath: /projects/oribe/05.jpg  \n05.jpg FileName : 05.jpg FileDateTime : 1479545714 FileSize : 549959 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(16,'/projects/oribe/06.jpg','asset','image','image',1,1479545714,1479545714,2,2,'ID: 16  \nPath: /projects/oribe/06.jpg  \n06.jpg FileName : 06.jpg FileDateTime : 1479545714 FileSize : 412360 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(17,'/projects/oribe/08.jpg','asset','image','image',1,1479545715,1479545715,2,2,'ID: 17  \nPath: /projects/oribe/08.jpg  \n08.jpg FileName : 08.jpg FileDateTime : 1479545715 FileSize : 174521 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(18,'/projects/oribe/09.jpg','asset','image','image',1,1479545716,1479545716,2,2,'ID: 18  \nPath: /projects/oribe/09.jpg  \n09.jpg FileName : 09.jpg FileDateTime : 1479545716 FileSize : 341153 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(19,'/projects/oribe/1.jpg','asset','image','image',1,1479545716,1479545716,2,2,'ID: 19  \nPath: /projects/oribe/1.jpg  \n1.jpg FileName : 1.jpg FileDateTime : 1479545716 FileSize : 432016 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(20,'/projects/oribe/11.jpg','asset','image','image',1,1479545716,1479545716,2,2,'ID: 20  \nPath: /projects/oribe/11.jpg  \n11.jpg FileName : 11.jpg FileDateTime : 1479545716 FileSize : 962627 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(21,'/projects/oribe/10.jpg','asset','image','image',1,1479545716,1479545716,2,2,'ID: 21  \nPath: /projects/oribe/10.jpg  \n10.jpg FileName : 10.jpg FileDateTime : 1479545716 FileSize : 970776 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(22,'/projects/oribe/12.jpg','asset','image','image',1,1479545716,1479545716,2,2,'ID: 22  \nPath: /projects/oribe/12.jpg  \n12.jpg FileName : 12.jpg FileDateTime : 1479545716 FileSize : 314909 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ',''),(23,'/projects/oribe/13.jpg','asset','image','image',1,1479545717,1479545717,2,2,'ID: 23  \nPath: /projects/oribe/13.jpg  \n13.jpg FileName : 13.jpg FileDateTime : 1479545717 FileSize : 766305 FileType : 2 MimeType : image/jpeg SectionsFound : IFD0, APP12 Company : Ducky Info : ','');
/*!40000 ALTER TABLE `search_backend_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mainDomain` varchar(255) DEFAULT NULL,
  `domains` text,
  `rootId` int(11) unsigned DEFAULT NULL,
  `errorDocument` varchar(255) DEFAULT NULL,
  `redirectToMainDomain` tinyint(1) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rootId` (`rootId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned DEFAULT NULL,
  `idPath` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpath` (`idPath`),
  KEY `parentid` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_assignment`
--

DROP TABLE IF EXISTS `tags_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_assignment` (
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` int(10) NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`tagid`,`cid`,`ctype`),
  KEY `ctype` (`ctype`),
  KEY `ctype_cid` (`cid`,`ctype`),
  KEY `tagid` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_assignment`
--

LOCK TABLES `tags_assignment` WRITE;
/*!40000 ALTER TABLE `tags_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_personas`
--

DROP TABLE IF EXISTS `targeting_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targeting_personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `conditions` longtext,
  `threshold` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_personas`
--

LOCK TABLES `targeting_personas` WRITE;
/*!40000 ALTER TABLE `targeting_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_rules`
--

DROP TABLE IF EXISTS `targeting_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targeting_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `scope` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `conditions` longtext,
  `actions` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_rules`
--

LOCK TABLES `targeting_rules` WRITE;
/*!40000 ALTER TABLE `targeting_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_store`
--

DROP TABLE IF EXISTS `tmp_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_store` (
  `id` varchar(190) NOT NULL DEFAULT '',
  `tag` varchar(190) DEFAULT NULL,
  `data` longtext,
  `serialized` tinyint(2) NOT NULL DEFAULT '0',
  `date` int(10) DEFAULT NULL,
  `expiryDate` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`),
  KEY `date` (`date`),
  KEY `expiryDate` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_store`
--

LOCK TABLES `tmp_store` WRITE;
/*!40000 ALTER TABLE `tmp_store` DISABLE KEYS */;
INSERT INTO `tmp_store` VALUES ('image-thumbnails/0/2/thumb__responsive/grad.jpeg','image-optimize-queue','-',0,1479545584,1479631984),('image-thumbnails/0/4/thumb__responsive/1150461_760828250657319_5488560786455551087_o_1.jpeg','image-optimize-queue','-',0,1479545773,1479632173),('image-thumbnails/0/4/thumb__responsive/1150461_760828250657319_5488560786455551087_o_1~-~1024w.jpeg','image-optimize-queue','-',0,1479546629,1479633029),('image-thumbnails/0/4/thumb__responsive/1150461_760828250657319_5488560786455551087_o_1~-~420w.jpeg','image-optimize-queue','-',0,1479546441,1479632841),('image-thumbnails/0/4/thumb__responsive/1150461_760828250657319_5488560786455551087_o_1~-~420w@2x.jpeg','image-optimize-queue','-',0,1479546355,1479632755),('image-thumbnails/0/6/thumb__responsive/1150461_760828250657319_5488560786455551087_o.jpeg','image-optimize-queue','-',0,1479545774,1479632174),('image-thumbnails/0/6/thumb__responsive/1150461_760828250657319_5488560786455551087_o~-~1024w.jpeg','image-optimize-queue','-',0,1479546629,1479633029),('image-thumbnails/0/6/thumb__responsive/1150461_760828250657319_5488560786455551087_o~-~420w.jpeg','image-optimize-queue','-',0,1479546441,1479632841),('image-thumbnails/0/6/thumb__responsive/1150461_760828250657319_5488560786455551087_o~-~420w@2x.jpeg','image-optimize-queue','-',0,1479546380,1479632780);
/*!40000 ALTER TABLE `tmp_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_events`
--

DROP TABLE IF EXISTS `tracking_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) unsigned DEFAULT NULL,
  `year` int(5) unsigned DEFAULT NULL,
  `month` int(2) unsigned DEFAULT NULL,
  `day` int(2) unsigned DEFAULT NULL,
  `dayOfWeek` int(1) unsigned DEFAULT NULL,
  `dayOfYear` int(3) unsigned DEFAULT NULL,
  `weekOfYear` int(2) unsigned DEFAULT NULL,
  `hour` int(2) unsigned DEFAULT NULL,
  `minute` int(2) unsigned DEFAULT NULL,
  `second` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `day` (`day`),
  KEY `dayOfWeek` (`dayOfWeek`),
  KEY `dayOfYear` (`dayOfYear`),
  KEY `weekOfYear` (`weekOfYear`),
  KEY `hour` (`hour`),
  KEY `minute` (`minute`),
  KEY `second` (`second`),
  KEY `category` (`category`),
  KEY `action` (`action`),
  KEY `label` (`label`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_events`
--

LOCK TABLES `tracking_events` WRITE;
/*!40000 ALTER TABLE `tracking_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_admin`
--

DROP TABLE IF EXISTS `translations_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations_admin` (
  `key` varchar(190) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_admin`
--

LOCK TABLES `translations_admin` WRITE;
/*!40000 ALTER TABLE `translations_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_website`
--

DROP TABLE IF EXISTS `translations_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations_website` (
  `key` varchar(190) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_website`
--

LOCK TABLES `translations_website` WRITE;
/*!40000 ALTER TABLE `translations_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_locks`
--

DROP TABLE IF EXISTS `tree_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tree_locks` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` enum('asset','document','object') NOT NULL DEFAULT 'asset',
  `locked` enum('self','propagate') DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `id` (`id`),
  KEY `type` (`type`),
  KEY `locked` (`locked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_locks`
--

LOCK TABLES `tree_locks` WRITE;
/*!40000 ALTER TABLE `tree_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tree_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` enum('user','userfolder','role','rolefolder') NOT NULL DEFAULT 'user',
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `contentLanguages` longtext,
  `admin` tinyint(1) unsigned DEFAULT '0',
  `active` tinyint(1) unsigned DEFAULT '1',
  `permissions` text,
  `roles` varchar(1000) DEFAULT NULL,
  `welcomescreen` tinyint(1) DEFAULT NULL,
  `closeWarning` tinyint(1) DEFAULT NULL,
  `memorizeTabs` tinyint(1) DEFAULT NULL,
  `allowDirtyClose` tinyint(1) unsigned DEFAULT '1',
  `docTypes` varchar(255) DEFAULT NULL,
  `classes` varchar(255) DEFAULT NULL,
  `apiKey` varchar(255) DEFAULT NULL,
  `activePerspective` varchar(255) DEFAULT NULL,
  `perspectives` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type`,`name`),
  KEY `parentId` (`parentId`),
  KEY `name` (`name`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,0,'user','system',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(2,0,'user','admin','$2y$10$Dunj8s.q5BHDANmr63qhDepxJZ0vnm2mzBdxRlfi9Z.Hah3L8fmIO',NULL,NULL,NULL,'en',NULL,1,1,'','',0,1,1,1,'','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_permission_definitions`
--

DROP TABLE IF EXISTS `users_permission_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_permission_definitions` (
  `key` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_permission_definitions`
--

LOCK TABLES `users_permission_definitions` WRITE;
/*!40000 ALTER TABLE `users_permission_definitions` DISABLE KEYS */;
INSERT INTO `users_permission_definitions` VALUES ('application_logging'),('assets'),('backup'),('classes'),('clear_cache'),('clear_temp_files'),('dashboards'),('documents'),('document_types'),('emails'),('glossary'),('http_errors'),('notes_events'),('objects'),('plugins'),('predefined_properties'),('qr_codes'),('recyclebin'),('redirects'),('reports'),('robots.txt'),('routes'),('seemode'),('seo_document_editor'),('system_settings'),('tags_assignment'),('tags_config'),('tags_search'),('tag_snippet_management'),('targeting'),('thumbnails'),('translations'),('users'),('website_settings');
/*!40000 ALTER TABLE `users_permission_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_asset`
--

DROP TABLE IF EXISTS `users_workspaces_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_workspaces_asset` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `list` tinyint(1) DEFAULT '0',
  `view` tinyint(1) DEFAULT '0',
  `publish` tinyint(1) DEFAULT '0',
  `delete` tinyint(1) DEFAULT '0',
  `rename` tinyint(1) DEFAULT '0',
  `create` tinyint(1) DEFAULT '0',
  `settings` tinyint(1) DEFAULT '0',
  `versions` tinyint(1) DEFAULT '0',
  `properties` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_asset`
--

LOCK TABLES `users_workspaces_asset` WRITE;
/*!40000 ALTER TABLE `users_workspaces_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_document`
--

DROP TABLE IF EXISTS `users_workspaces_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_workspaces_document` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `list` tinyint(1) unsigned DEFAULT '0',
  `view` tinyint(1) unsigned DEFAULT '0',
  `save` tinyint(1) unsigned DEFAULT '0',
  `publish` tinyint(1) unsigned DEFAULT '0',
  `unpublish` tinyint(1) unsigned DEFAULT '0',
  `delete` tinyint(1) unsigned DEFAULT '0',
  `rename` tinyint(1) unsigned DEFAULT '0',
  `create` tinyint(1) unsigned DEFAULT '0',
  `settings` tinyint(1) unsigned DEFAULT '0',
  `versions` tinyint(1) unsigned DEFAULT '0',
  `properties` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_document`
--

LOCK TABLES `users_workspaces_document` WRITE;
/*!40000 ALTER TABLE `users_workspaces_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_object`
--

DROP TABLE IF EXISTS `users_workspaces_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_workspaces_object` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `list` tinyint(1) unsigned DEFAULT '0',
  `view` tinyint(1) unsigned DEFAULT '0',
  `save` tinyint(1) unsigned DEFAULT '0',
  `publish` tinyint(1) unsigned DEFAULT '0',
  `unpublish` tinyint(1) unsigned DEFAULT '0',
  `delete` tinyint(1) unsigned DEFAULT '0',
  `rename` tinyint(1) unsigned DEFAULT '0',
  `create` tinyint(1) unsigned DEFAULT '0',
  `settings` tinyint(1) unsigned DEFAULT '0',
  `versions` tinyint(1) unsigned DEFAULT '0',
  `properties` tinyint(1) unsigned DEFAULT '0',
  `lEdit` text,
  `lView` text,
  `layouts` text,
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_object`
--

LOCK TABLES `users_workspaces_object` WRITE;
/*!40000 ALTER TABLE `users_workspaces_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uuids`
--

DROP TABLE IF EXISTS `uuids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uuids` (
  `uuid` char(36) NOT NULL,
  `itemId` bigint(20) unsigned NOT NULL,
  `type` varchar(25) NOT NULL,
  `instanceIdentifier` varchar(50) NOT NULL,
  PRIMARY KEY (`itemId`,`type`,`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uuids`
--

LOCK TABLES `uuids` WRITE;
/*!40000 ALTER TABLE `uuids` DISABLE KEYS */;
/*!40000 ALTER TABLE `uuids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int(11) unsigned DEFAULT NULL,
  `note` text,
  `date` bigint(1) unsigned DEFAULT NULL,
  `public` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `serialized` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (2,1,'document',2,NULL,1479544763,0,1),(3,1,'document',2,NULL,1479545095,0,1),(4,4,'asset',2,NULL,1479545698,0,1),(5,5,'asset',2,NULL,1479545698,0,1),(6,6,'asset',2,NULL,1479545698,0,1),(7,7,'asset',2,NULL,1479545698,0,1),(8,8,'asset',2,NULL,1479545699,0,1),(9,11,'asset',2,NULL,1479545714,0,1),(10,12,'asset',2,NULL,1479545714,0,1),(11,13,'asset',2,NULL,1479545714,0,1),(12,16,'asset',2,NULL,1479545714,0,1),(13,15,'asset',2,NULL,1479545714,0,1),(14,14,'asset',2,NULL,1479545715,0,1),(15,17,'asset',2,NULL,1479545715,0,1),(16,18,'asset',2,NULL,1479545716,0,1),(17,19,'asset',2,NULL,1479545716,0,1),(18,20,'asset',2,NULL,1479545716,0,1),(19,21,'asset',2,NULL,1479545716,0,1),(20,22,'asset',2,NULL,1479545716,0,1),(21,23,'asset',2,NULL,1479545717,0,1),(22,1,'document',2,NULL,1479545760,0,1),(23,1,'document',2,NULL,1479545768,0,1),(24,2,'document',2,NULL,1479545827,0,1),(25,2,'document',2,NULL,1479545842,0,1),(26,2,'document',2,NULL,1479545873,0,1),(27,2,'document',2,NULL,1479545910,0,1),(28,2,'document',2,NULL,1479545991,0,1),(29,4,'document',2,NULL,1479546091,0,1),(30,4,'document',2,NULL,1479546107,0,1),(31,4,'document',2,NULL,1479546184,0,1),(32,4,'document',2,NULL,1479546185,0,1),(33,1,'document',2,NULL,1479546192,0,1);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_settings`
--

DROP TABLE IF EXISTS `website_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` enum('text','document','asset','object','bool') DEFAULT NULL,
  `data` text,
  `siteId` int(11) unsigned DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `siteId` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_settings`
--

LOCK TABLES `website_settings` WRITE;
/*!40000 ALTER TABLE `website_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-19  9:22:01
