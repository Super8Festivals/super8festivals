-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: omeka
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `omeka_collections`
--

DROP TABLE IF EXISTS `omeka_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_collections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `public` tinyint NOT NULL,
  `featured` tinyint NOT NULL,
  `added` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `owner_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `public` (`public`),
  KEY `featured` (`featured`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_collections`
--

LOCK TABLES `omeka_collections` WRITE;
/*!40000 ALTER TABLE `omeka_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_element_sets`
--

DROP TABLE IF EXISTS `omeka_element_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_element_sets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `record_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `record_type` (`record_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_element_sets`
--

LOCK TABLES `omeka_element_sets` WRITE;
/*!40000 ALTER TABLE `omeka_element_sets` DISABLE KEYS */;
INSERT INTO `omeka_element_sets` VALUES (1,NULL,'Dublin Core','The Dublin Core metadata element set is common to all Omeka records, including items, files, and collections. For more information see, http://dublincore.org/documents/dces/.'),(3,'Item','Item Type Metadata','The item type metadata element set, consisting of all item type elements bundled with Omeka and all item type elements created by an administrator.');
/*!40000 ALTER TABLE `omeka_element_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_element_texts`
--

DROP TABLE IF EXISTS `omeka_element_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_element_texts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int unsigned NOT NULL,
  `record_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `element_id` int unsigned NOT NULL,
  `html` tinyint NOT NULL,
  `text` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `record_type_record_id` (`record_type`,`record_id`),
  KEY `element_id` (`element_id`),
  KEY `text` (`text`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_element_texts`
--

LOCK TABLES `omeka_element_texts` WRITE;
/*!40000 ALTER TABLE `omeka_element_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_element_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_elements`
--

DROP TABLE IF EXISTS `omeka_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_elements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `element_set_id` int unsigned NOT NULL,
  `order` int unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_element_set_id` (`element_set_id`,`name`),
  UNIQUE KEY `order_element_set_id` (`element_set_id`,`order`),
  KEY `element_set_id` (`element_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_elements`
--

LOCK TABLES `omeka_elements` WRITE;
/*!40000 ALTER TABLE `omeka_elements` DISABLE KEYS */;
INSERT INTO `omeka_elements` VALUES (1,3,NULL,'Text','Any textual data included in the document',NULL),(2,3,NULL,'Interviewer','The person(s) performing the interview',NULL),(3,3,NULL,'Interviewee','The person(s) being interviewed',NULL),(4,3,NULL,'Location','The location of the interview',NULL),(5,3,NULL,'Transcription','Any written text transcribed from a sound',NULL),(6,3,NULL,'Local URL','The URL of the local directory containing all assets of the website',NULL),(7,3,NULL,'Original Format','The type of object, such as painting, sculpture, paper, photo, and additional data',NULL),(10,3,NULL,'Physical Dimensions','The actual physical size of the original image',NULL),(11,3,NULL,'Duration','Length of time involved (seconds, minutes, hours, days, class periods, etc.)',NULL),(12,3,NULL,'Compression','Type/rate of compression for moving image file (i.e. MPEG-4)',NULL),(13,3,NULL,'Producer','Name (or names) of the person who produced the video',NULL),(14,3,NULL,'Director','Name (or names) of the person who produced the video',NULL),(15,3,NULL,'Bit Rate/Frequency','Rate at which bits are transferred (i.e. 96 kbit/s would be FM quality audio)',NULL),(16,3,NULL,'Time Summary','A summary of an interview given for different time stamps throughout the interview',NULL),(17,3,NULL,'Email Body','The main body of the email, including all replied and forwarded text and headers',NULL),(18,3,NULL,'Subject Line','The content of the subject line of the email',NULL),(19,3,NULL,'From','The name and email address of the person sending the email',NULL),(20,3,NULL,'To','The name(s) and email address(es) of the person to whom the email was sent',NULL),(21,3,NULL,'CC','The name(s) and email address(es) of the person to whom the email was carbon copied',NULL),(22,3,NULL,'BCC','The name(s) and email address(es) of the person to whom the email was blind carbon copied',NULL),(23,3,NULL,'Number of Attachments','The number of attachments to the email',NULL),(24,3,NULL,'Standards','',NULL),(25,3,NULL,'Objectives','',NULL),(26,3,NULL,'Materials','',NULL),(27,3,NULL,'Lesson Plan Text','',NULL),(28,3,NULL,'URL','',NULL),(29,3,NULL,'Event Type','',NULL),(30,3,NULL,'Participants','Names of individuals or groups participating in the event',NULL),(31,3,NULL,'Birth Date','',NULL),(32,3,NULL,'Birthplace','',NULL),(33,3,NULL,'Death Date','',NULL),(34,3,NULL,'Occupation','',NULL),(35,3,NULL,'Biographical Text','',NULL),(36,3,NULL,'Bibliography','',NULL),(37,1,8,'Contributor','An entity responsible for making contributions to the resource',NULL),(38,1,15,'Coverage','The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant',NULL),(39,1,4,'Creator','An entity primarily responsible for making the resource',NULL),(40,1,7,'Date','A point or period of time associated with an event in the lifecycle of the resource',NULL),(41,1,3,'Description','An account of the resource',NULL),(42,1,11,'Format','The file format, physical medium, or dimensions of the resource',NULL),(43,1,14,'Identifier','An unambiguous reference to the resource within a given context',NULL),(44,1,12,'Language','A language of the resource',NULL),(45,1,6,'Publisher','An entity responsible for making the resource available',NULL),(46,1,10,'Relation','A related resource',NULL),(47,1,9,'Rights','Information about rights held in and over the resource',NULL),(48,1,5,'Source','A related resource from which the described resource is derived',NULL),(49,1,2,'Subject','The topic of the resource',NULL),(50,1,1,'Title','A name given to the resource',NULL),(51,1,13,'Type','The nature or genre of the resource',NULL);
/*!40000 ALTER TABLE `omeka_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_files`
--

DROP TABLE IF EXISTS `omeka_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int unsigned NOT NULL,
  `order` int unsigned DEFAULT NULL,
  `size` bigint unsigned NOT NULL,
  `has_derivative_image` tinyint(1) NOT NULL,
  `authentication` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  `metadata` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_files`
--

LOCK TABLES `omeka_files` WRITE;
/*!40000 ALTER TABLE `omeka_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_item_types`
--

DROP TABLE IF EXISTS `omeka_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_item_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_item_types`
--

LOCK TABLES `omeka_item_types` WRITE;
/*!40000 ALTER TABLE `omeka_item_types` DISABLE KEYS */;
INSERT INTO `omeka_item_types` VALUES (1,'Text','A resource consisting primarily of words for reading. Examples include books, letters, dissertations, poems, newspapers, articles, archives of mailing lists. Note that facsimiles or images of texts are still of the genre Text.'),(3,'Moving Image','A series of visual representations imparting an impression of motion when shown in succession. Examples include animations, movies, television programs, videos, zoetropes, or visual output from a simulation.'),(4,'Oral History','A resource containing historical information obtained in interviews with persons having firsthand knowledge.'),(5,'Sound','A resource primarily intended to be heard. Examples include a music playback file format, an audio compact disc, and recorded speech or sounds.'),(6,'Still Image','A static visual representation. Examples include paintings, drawings, graphic designs, plans and maps. Recommended best practice is to assign the type Text to images of textual materials.'),(7,'Website','A resource comprising of a web page or web pages and all related assets ( such as images, sound and video files, etc. ).'),(8,'Event','A non-persistent, time-based occurrence. Metadata for an event provides descriptive information that is the basis for discovery of the purpose, location, duration, and responsible agents associated with an event. Examples include an exhibition, webcast, conference, workshop, open day, performance, battle, trial, wedding, tea party, conflagration.'),(9,'Email','A resource containing textual messages and binary attachments sent electronically from one person to another or one person to many people.'),(10,'Lesson Plan','A resource that gives a detailed description of a course of instruction.'),(11,'Hyperlink','A link, or reference, to another resource on the Internet.'),(12,'Person','An individual.'),(13,'Interactive Resource','A resource requiring interaction from the user to be understood, executed, or experienced. Examples include forms on Web pages, applets, multimedia learning objects, chat services, or virtual reality environments.'),(14,'Dataset','Data encoded in a defined structure. Examples include lists, tables, and databases. A dataset may be useful for direct machine processing.'),(15,'Physical Object','An inanimate, three-dimensional object or substance. Note that digital representations of, or surrogates for, these objects should use Moving Image, Still Image, Text or one of the other types.'),(16,'Service','A system that provides one or more functions. Examples include a photocopying service, a banking service, an authentication service, interlibrary loans, a Z39.50 or Web server.'),(17,'Software','A computer program in source or compiled form. Examples include a C source file, MS-Windows .exe executable, or Perl script.');
/*!40000 ALTER TABLE `omeka_item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_item_types_elements`
--

DROP TABLE IF EXISTS `omeka_item_types_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_item_types_elements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int unsigned NOT NULL,
  `element_id` int unsigned NOT NULL,
  `order` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_type_id_element_id` (`item_type_id`,`element_id`),
  KEY `item_type_id` (`item_type_id`),
  KEY `element_id` (`element_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_item_types_elements`
--

LOCK TABLES `omeka_item_types_elements` WRITE;
/*!40000 ALTER TABLE `omeka_item_types_elements` DISABLE KEYS */;
INSERT INTO `omeka_item_types_elements` VALUES (1,1,7,NULL),(2,1,1,NULL),(3,6,7,NULL),(6,6,10,NULL),(7,3,7,NULL),(8,3,11,NULL),(9,3,12,NULL),(10,3,13,NULL),(11,3,14,NULL),(12,3,5,NULL),(13,5,7,NULL),(14,5,11,NULL),(15,5,15,NULL),(16,5,5,NULL),(17,4,7,NULL),(18,4,11,NULL),(19,4,15,NULL),(20,4,5,NULL),(21,4,2,NULL),(22,4,3,NULL),(23,4,4,NULL),(24,4,16,NULL),(25,9,17,NULL),(26,9,18,NULL),(27,9,20,NULL),(28,9,19,NULL),(29,9,21,NULL),(30,9,22,NULL),(31,9,23,NULL),(32,10,24,NULL),(33,10,25,NULL),(34,10,26,NULL),(35,10,11,NULL),(36,10,27,NULL),(37,7,6,NULL),(38,11,28,NULL),(39,8,29,NULL),(40,8,30,NULL),(41,8,11,NULL),(42,12,31,NULL),(43,12,32,NULL),(44,12,33,NULL),(45,12,34,NULL),(46,12,35,NULL),(47,12,36,NULL);
/*!40000 ALTER TABLE `omeka_item_types_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_items`
--

DROP TABLE IF EXISTS `omeka_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int unsigned DEFAULT NULL,
  `collection_id` int unsigned DEFAULT NULL,
  `featured` tinyint NOT NULL,
  `public` tinyint NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `owner_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_type_id` (`item_type_id`),
  KEY `collection_id` (`collection_id`),
  KEY `public` (`public`),
  KEY `featured` (`featured`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_items`
--

LOCK TABLES `omeka_items` WRITE;
/*!40000 ALTER TABLE `omeka_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_keys`
--

DROP TABLE IF EXISTS `omeka_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `key` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varbinary(16) DEFAULT NULL,
  `accessed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_keys`
--

LOCK TABLES `omeka_keys` WRITE;
/*!40000 ALTER TABLE `omeka_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_options`
--

DROP TABLE IF EXISTS `omeka_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_options`
--

LOCK TABLES `omeka_options` WRITE;
/*!40000 ALTER TABLE `omeka_options` DISABLE KEYS */;
INSERT INTO `omeka_options` VALUES (1,'omeka_version','2.8'),(2,'administrator_email','admin@super8festivals.org'),(3,'copyright',''),(4,'site_title','Super 8 Festivals (DEV)'),(5,'author',''),(6,'description','This is the Super 8 Festivals development site powered by Docker.'),(7,'thumbnail_constraint','200'),(8,'square_thumbnail_constraint','200'),(9,'fullsize_constraint','800'),(10,'per_page_admin','10'),(11,'per_page_public','10'),(12,'show_empty_elements','0'),(13,'path_to_convert','/usr/bin'),(14,'admin_theme','default'),(16,'file_extension_whitelist','aac,aif,aiff,asf,asx,avi,bmp,c,cc,class,css,divx,doc,docx,exe,gif,gz,gzip,h,ico,j2k,jp2,jpe,jpeg,jpg,m4a,m4v,mdb,mid,midi,mov,mp2,mp3,mp4,mpa,mpe,mpeg,mpg,mpp,odb,odc,odf,odg,odp,ods,odt,ogg,opus,pdf,png,pot,pps,ppt,pptx,qt,ra,ram,rtf,rtx,swf,tar,tif,tiff,txt,wav,wax,webm,wma,wmv,wmx,wri,xla,xls,xlsx,xlt,xlw,zip'),(17,'file_mime_type_whitelist','application/msword,application/ogg,application/pdf,application/rtf,application/vnd.ms-access,application/vnd.ms-excel,application/vnd.ms-powerpoint,application/vnd.ms-project,application/vnd.ms-write,application/vnd.oasis.opendocument.chart,application/vnd.oasis.opendocument.database,application/vnd.oasis.opendocument.formula,application/vnd.oasis.opendocument.graphics,application/vnd.oasis.opendocument.presentation,application/vnd.oasis.opendocument.spreadsheet,application/vnd.oasis.opendocument.text,application/x-ms-wmp,application/x-ogg,application/x-gzip,application/x-msdownload,application/x-shockwave-flash,application/x-tar,application/zip,audio/aac,audio/aiff,audio/mid,audio/midi,audio/mp3,audio/mp4,audio/mpeg,audio/mpeg3,audio/ogg,audio/wav,audio/wma,audio/x-aac,audio/x-aiff,audio/x-m4a,audio/x-midi,audio/x-mp3,audio/x-mp4,audio/x-mpeg,audio/x-mpeg3,audio/x-mpegaudio,audio/x-ms-wax,audio/x-realaudio,audio/x-wav,audio/x-wma,image/bmp,image/gif,image/icon,image/jpeg,image/pjpeg,image/png,image/tiff,image/x-icon,image/x-ms-bmp,text/css,text/plain,text/richtext,text/rtf,video/asf,video/avi,video/divx,video/mp4,video/mpeg,video/msvideo,video/ogg,video/quicktime,video/webm,video/x-m4v,video/x-ms-wmv,video/x-msvideo'),(18,'disable_default_file_validation',''),(20,'display_system_info','1'),(21,'html_purifier_is_enabled','1'),(22,'html_purifier_allowed_html_elements','p,br,strong,em,span,div,ul,ol,li,a,h1,h2,h3,h4,h5,h6,address,pre,table,tr,td,blockquote,thead,tfoot,tbody,th,dl,dt,dd,q,small,strike,sup,sub,b,i,big,small,tt'),(23,'html_purifier_allowed_html_attributes','*.style,*.class,a.href,a.title,a.target'),(24,'tag_delimiter',','),(25,'public_navigation_main','[{\"can_delete\":false,\"uid\":\"\\/items\\/browse\",\"label\":\"Browse Items\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":1,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"type\":\"Omeka_Navigation_Page_Mvc\",\"pages\":[],\"action\":\"browse\",\"controller\":\"items\",\"module\":null,\"params\":[],\"route\":\"default\",\"reset_params\":true,\"encodeUrl\":true,\"scheme\":null},{\"can_delete\":false,\"uid\":\"\\/collections\\/browse\",\"label\":\"Browse Collections\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":2,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"type\":\"Omeka_Navigation_Page_Mvc\",\"pages\":[],\"action\":\"browse\",\"controller\":\"collections\",\"module\":null,\"params\":[],\"route\":\"default\",\"reset_params\":true,\"encodeUrl\":true,\"scheme\":null}]'),(26,'search_record_types','a:3:{s:4:\"Item\";s:4:\"Item\";s:4:\"File\";s:4:\"File\";s:10:\"Collection\";s:10:\"Collection\";}'),(27,'api_enable',''),(28,'api_per_page','50'),(29,'show_element_set_headings','1'),(30,'use_square_thumbnail','1'),(31,'omeka_update','a:2:{s:14:\"latest_version\";s:4:\"2.8\n\";s:12:\"last_updated\";i:1616958526;}'),(34,'theme_default_options','a:18:{s:10:\"text_color\";s:7:\"#444444\";s:16:\"background_color\";s:7:\"#FFFFFF\";s:10:\"link_color\";s:7:\"#888888\";s:12:\"button_color\";s:7:\"#000000\";s:17:\"button_text_color\";s:7:\"#FFFFFF\";s:18:\"header_title_color\";s:7:\"#000000\";s:4:\"logo\";N;s:17:\"header_background\";N;s:11:\"footer_text\";N;s:24:\"display_footer_copyright\";s:1:\"0\";s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";N;s:13:\"homepage_text\";N;s:17:\"item_file_gallery\";s:1:\"1\";s:19:\"use_advanced_search\";s:1:\"1\";s:17:\"theme_config_csrf\";N;}'),(37,'theme_seasons_options','a:13:{s:11:\"style_sheet\";s:6:\"winter\";s:4:\"logo\";N;s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";N;s:13:\"homepage_text\";N;s:11:\"footer_text\";N;s:24:\"display_footer_copyright\";s:1:\"0\";s:17:\"item_file_gallery\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"1\";s:12:\"exhibits_nav\";s:4:\"side\";s:17:\"theme_config_csrf\";N;}'),(39,'theme_berlin_options','a:13:{s:4:\"logo\";N;s:12:\"header_image\";N;s:16:\"header_image_alt\";N;s:21:\"display_featured_item\";s:1:\"1\";s:27:\"display_featured_collection\";s:1:\"1\";s:24:\"display_featured_exhibit\";s:1:\"1\";s:21:\"homepage_recent_items\";N;s:13:\"homepage_text\";N;s:11:\"footer_text\";N;s:24:\"display_footer_copyright\";s:1:\"0\";s:19:\"use_advanced_search\";s:1:\"0\";s:17:\"item_file_display\";s:1:\"0\";s:17:\"theme_config_csrf\";N;}'),(44,'public_theme','SuperEightFestivals'),(45,'theme_supereightfestivals_options','a:1:{s:17:\"theme_config_csrf\";N;}');
/*!40000 ALTER TABLE `omeka_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_plugins`
--

DROP TABLE IF EXISTS `omeka_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_plugins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint NOT NULL,
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `active_idx` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_plugins`
--

LOCK TABLES `omeka_plugins` WRITE;
/*!40000 ALTER TABLE `omeka_plugins` DISABLE KEYS */;
INSERT INTO `omeka_plugins` VALUES (1,'SuperEightFestivals',1,'1.0.0');
/*!40000 ALTER TABLE `omeka_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_processes`
--

DROP TABLE IF EXISTS `omeka_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_processes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `pid` int unsigned DEFAULT NULL,
  `status` enum('starting','in progress','completed','paused','error','stopped') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `args` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `started` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `stopped` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pid` (`pid`),
  KEY `started` (`started`),
  KEY `stopped` (`stopped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_processes`
--

LOCK TABLES `omeka_processes` WRITE;
/*!40000 ALTER TABLE `omeka_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_records_tags`
--

DROP TABLE IF EXISTS `omeka_records_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_records_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int unsigned NOT NULL,
  `record_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag_id` int unsigned NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`record_type`,`record_id`,`tag_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_records_tags`
--

LOCK TABLES `omeka_records_tags` WRITE;
/*!40000 ALTER TABLE `omeka_records_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_records_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_schema_migrations`
--

DROP TABLE IF EXISTS `omeka_schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_schema_migrations` (
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_schema_migrations`
--

LOCK TABLES `omeka_schema_migrations` WRITE;
/*!40000 ALTER TABLE `omeka_schema_migrations` DISABLE KEYS */;
INSERT INTO `omeka_schema_migrations` VALUES ('20100401000000'),('20100810120000'),('20110113000000'),('20110124000001'),('20110301103900'),('20110328192100'),('20110426181300'),('20110601112200'),('20110627223000'),('20110824110000'),('20120112100000'),('20120220000000'),('20120221000000'),('20120224000000'),('20120224000001'),('20120402000000'),('20120516000000'),('20120612112000'),('20120623095000'),('20120710000000'),('20120723000000'),('20120808000000'),('20120808000001'),('20120813000000'),('20120914000000'),('20121007000000'),('20121015000000'),('20121015000001'),('20121018000001'),('20121110000000'),('20121218000000'),('20130422000000'),('20130426000000'),('20130429000000'),('20130701000000'),('20130809000000'),('20140304131700'),('20150211000000'),('20150310141100'),('20150814155100'),('20151118214800'),('20151209103299'),('20151209103300'),('20161209171900'),('20170331084000'),('20170405125800'),('20200127165700');
/*!40000 ALTER TABLE `omeka_schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_search_texts`
--

DROP TABLE IF EXISTS `omeka_search_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_search_texts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `record_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `record_id` int unsigned NOT NULL,
  `public` tinyint(1) NOT NULL,
  `title` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_name` (`record_type`,`record_id`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_search_texts`
--

LOCK TABLES `omeka_search_texts` WRITE;
/*!40000 ALTER TABLE `omeka_search_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_search_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_sessions`
--

DROP TABLE IF EXISTS `omeka_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_sessions` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `modified` bigint DEFAULT NULL,
  `lifetime` int DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_sessions`
--

LOCK TABLES `omeka_sessions` WRITE;
/*!40000 ALTER TABLE `omeka_sessions` DISABLE KEYS */;
INSERT INTO `omeka_sessions` VALUES ('6e0ed0e07f9346e4cf951ed2ea245436',1616961928,1209600,_binary 'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}__ZF|a:2:{s:41:\"Zend_Form_Element_Hash_salt_settings_csrf\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1616962130;}s:41:\"Zend_Form_Element_Hash_salt_security_csrf\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1616962133;}}Zend_Form_Element_Hash_salt_settings_csrf|a:1:{s:4:\"hash\";s:32:\"6c3d64db43b28bef7b0ac1ba7a8c466b\";}Zend_Form_Element_Hash_salt_security_csrf|a:1:{s:4:\"hash\";s:32:\"fea8dd3562d94afbe50ecd434ea40892\";}OmekaSessionCsrfToken|a:1:{s:5:\"token\";s:32:\"29b38a24caf6af4485990e204867e4b7\";}');
/*!40000 ALTER TABLE `omeka_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_cities`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_cities` (
  `country_id` int unsigned NOT NULL,
  `location_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `location_id` (`location_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `omeka_super_eight_festivals_countries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_cities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `omeka_super_eight_festivals_locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_cities_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_cities_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_cities`
--

LOCK TABLES `omeka_super_eight_festivals_cities` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_cities` DISABLE KEYS */;
INSERT INTO `omeka_super_eight_festivals_cities` VALUES (8,23,1,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(2,24,2,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(3,25,3,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(4,26,4,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(5,27,5,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(18,28,6,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(20,29,7,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(7,30,8,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(14,31,9,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(9,32,10,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(10,33,11,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(12,34,12,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(12,35,13,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(13,36,14,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(11,37,15,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(15,38,16,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(16,39,17,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(6,40,18,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(6,41,19,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(19,42,20,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(21,43,21,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28'),(1,44,22,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28'),(17,45,23,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28'),(22,46,24,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28');
/*!40000 ALTER TABLE `omeka_super_eight_festivals_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_city_banners`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_city_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_city_banners` (
  `city_id` int unsigned NOT NULL,
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_city_banners_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `omeka_super_eight_festivals_cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_city_banners_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_city_banners_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_city_banners_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_city_banners`
--

LOCK TABLES `omeka_super_eight_festivals_city_banners` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_city_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_city_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_city_timelines`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_city_timelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_city_timelines` (
  `city_id` int unsigned NOT NULL,
  `timeline_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `timeline_id` (`timeline_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_city_timelines_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `omeka_super_eight_festivals_cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_city_timelines_ibfk_2` FOREIGN KEY (`timeline_id`) REFERENCES `omeka_super_eight_festivals_timelines` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_city_timelines_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_city_timelines_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_city_timelines`
--

LOCK TABLES `omeka_super_eight_festivals_city_timelines` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_city_timelines` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_city_timelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_contributors`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_contributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_contributors` (
  `person_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_contributors_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `omeka_super_eight_festivals_people` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_contributors_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_contributors_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_contributors`
--

LOCK TABLES `omeka_super_eight_festivals_contributors` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_contributors` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_contributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_countries`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_countries` (
  `location_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_countries_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `omeka_super_eight_festivals_locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_countries_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_countries_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_countries`
--

LOCK TABLES `omeka_super_eight_festivals_countries` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_countries` DISABLE KEYS */;
INSERT INTO `omeka_super_eight_festivals_countries` VALUES (1,1,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(2,2,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(3,3,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(4,4,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(5,5,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(6,6,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(7,7,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(8,8,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(9,9,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(10,10,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(11,11,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(12,12,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(13,13,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(14,14,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(15,15,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(16,16,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(17,17,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(18,18,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(19,19,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(20,20,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(21,21,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(22,22,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27');
/*!40000 ALTER TABLE `omeka_super_eight_festivals_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_embeds`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_embeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_embeds` (
  `embed` mediumtext COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `contributor_id` int unsigned DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contributor_id` (`contributor_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_embeds_ibfk_1` FOREIGN KEY (`contributor_id`) REFERENCES `omeka_super_eight_festivals_contributors` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_embeds_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_embeds_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_embeds`
--

LOCK TABLES `omeka_super_eight_festivals_embeds` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_embeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_embeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_federation_bylaws`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_federation_bylaws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_federation_bylaws` (
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_federation_bylaws_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_federation_bylaws_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_federation_bylaws_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_federation_bylaws`
--

LOCK TABLES `omeka_super_eight_festivals_federation_bylaws` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_federation_bylaws` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_federation_bylaws` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_federation_magazines`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_federation_magazines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_federation_magazines` (
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_federation_magazines_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_federation_magazines_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_federation_magazines_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_federation_magazines`
--

LOCK TABLES `omeka_super_eight_festivals_federation_magazines` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_federation_magazines` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_federation_magazines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_federation_newsletters`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_federation_newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_federation_newsletters` (
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_federation_newsletters_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_federation_newsletters_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_federation_newsletters_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_federation_newsletters`
--

LOCK TABLES `omeka_super_eight_festivals_federation_newsletters` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_federation_newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_federation_newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_federation_photos`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_federation_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_federation_photos` (
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_federation_photos_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_federation_photos_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_federation_photos_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_federation_photos`
--

LOCK TABLES `omeka_super_eight_festivals_federation_photos` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_federation_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_federation_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_festival_film_catalogs`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_festival_film_catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_festival_film_catalogs` (
  `festival_id` int unsigned NOT NULL,
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `festival_id` (`festival_id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_festival_film_catalogs_ibfk_1` FOREIGN KEY (`festival_id`) REFERENCES `omeka_super_eight_festivals_festivals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_festival_film_catalogs_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_festival_film_catalogs_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_festival_film_catalogs_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_festival_film_catalogs`
--

LOCK TABLES `omeka_super_eight_festivals_festival_film_catalogs` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festival_film_catalogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festival_film_catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_festival_films`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_festival_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_festival_films` (
  `festival_id` int unsigned NOT NULL,
  `filmmaker_film_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `festival_id` (`festival_id`),
  KEY `filmmaker_film_id` (`filmmaker_film_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_festival_films_ibfk_1` FOREIGN KEY (`festival_id`) REFERENCES `omeka_super_eight_festivals_festivals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_festival_films_ibfk_2` FOREIGN KEY (`filmmaker_film_id`) REFERENCES `omeka_super_eight_festivals_filmmaker_films` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_festival_films_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_festival_films_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_festival_films`
--

LOCK TABLES `omeka_super_eight_festivals_festival_films` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festival_films` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festival_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_festival_photos`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_festival_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_festival_photos` (
  `festival_id` int unsigned NOT NULL,
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `festival_id` (`festival_id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_festival_photos_ibfk_1` FOREIGN KEY (`festival_id`) REFERENCES `omeka_super_eight_festivals_festivals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_festival_photos_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_festival_photos_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_festival_photos_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_festival_photos`
--

LOCK TABLES `omeka_super_eight_festivals_festival_photos` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festival_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festival_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_festival_posters`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_festival_posters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_festival_posters` (
  `festival_id` int unsigned NOT NULL,
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `festival_id` (`festival_id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_festival_posters_ibfk_1` FOREIGN KEY (`festival_id`) REFERENCES `omeka_super_eight_festivals_festivals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_festival_posters_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_festival_posters_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_festival_posters_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_festival_posters`
--

LOCK TABLES `omeka_super_eight_festivals_festival_posters` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festival_posters` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festival_posters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_festival_print_medias`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_festival_print_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_festival_print_medias` (
  `festival_id` int unsigned NOT NULL,
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `festival_id` (`festival_id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_festival_print_medias_ibfk_1` FOREIGN KEY (`festival_id`) REFERENCES `omeka_super_eight_festivals_festivals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_festival_print_medias_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_festival_print_medias_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_festival_print_medias_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_festival_print_medias`
--

LOCK TABLES `omeka_super_eight_festivals_festival_print_medias` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festival_print_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festival_print_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_festivals`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_festivals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_festivals` (
  `city_id` int unsigned NOT NULL,
  `year` int NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_festivals_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `omeka_super_eight_festivals_cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_festivals_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_festivals_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_festivals`
--

LOCK TABLES `omeka_super_eight_festivals_festivals` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festivals` DISABLE KEYS */;
INSERT INTO `omeka_super_eight_festivals_festivals` VALUES (1,0,1,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(2,0,2,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(3,0,3,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(4,0,4,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(5,0,5,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(6,0,6,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(7,0,7,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(8,0,8,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(9,0,9,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(10,0,10,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(11,0,11,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(12,0,12,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(13,0,13,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(14,0,14,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(15,0,15,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(16,0,16,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(17,0,17,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(18,0,18,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(19,0,19,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(20,0,20,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28'),(21,0,21,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28'),(22,0,22,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28'),(23,0,23,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28'),(24,0,24,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28');
/*!40000 ALTER TABLE `omeka_super_eight_festivals_festivals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_files`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_files` (
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `contributor_id` int unsigned DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contributor_id` (`contributor_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_files_ibfk_1` FOREIGN KEY (`contributor_id`) REFERENCES `omeka_super_eight_festivals_contributors` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_files_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_files_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_files`
--

LOCK TABLES `omeka_super_eight_festivals_files` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_filmmaker_films`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_filmmaker_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_filmmaker_films` (
  `filmmaker_id` int unsigned NOT NULL,
  `embed_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filmmaker_id` (`filmmaker_id`),
  KEY `embed_id` (`embed_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_filmmaker_films_ibfk_1` FOREIGN KEY (`filmmaker_id`) REFERENCES `omeka_super_eight_festivals_filmmakers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_filmmaker_films_ibfk_2` FOREIGN KEY (`embed_id`) REFERENCES `omeka_super_eight_festivals_embeds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_filmmaker_films_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_filmmaker_films_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_filmmaker_films`
--

LOCK TABLES `omeka_super_eight_festivals_filmmaker_films` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_filmmaker_films` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_filmmaker_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_filmmaker_photos`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_filmmaker_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_filmmaker_photos` (
  `filmmaker_id` int unsigned NOT NULL,
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filmmaker_id` (`filmmaker_id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_filmmaker_photos_ibfk_1` FOREIGN KEY (`filmmaker_id`) REFERENCES `omeka_super_eight_festivals_filmmakers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_filmmaker_photos_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_filmmaker_photos_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_filmmaker_photos_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_filmmaker_photos`
--

LOCK TABLES `omeka_super_eight_festivals_filmmaker_photos` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_filmmaker_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_filmmaker_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_filmmakers`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_filmmakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_filmmakers` (
  `person_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_filmmakers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `omeka_super_eight_festivals_people` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_filmmakers_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_filmmakers_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_filmmakers`
--

LOCK TABLES `omeka_super_eight_festivals_filmmakers` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_filmmakers` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_filmmakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_locations`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_locations` (
  `latitude` float(8,4) DEFAULT NULL,
  `longitude` float(8,4) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_locations_ibfk_1` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_locations_ibfk_2` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_locations`
--

LOCK TABLES `omeka_super_eight_festivals_locations` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_locations` DISABLE KEYS */;
INSERT INTO `omeka_super_eight_festivals_locations` VALUES (0.0000,0.0000,'algeria','',1,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'argentina','',2,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'australia','',3,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'belgium','',4,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'brazil','',5,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'canada','',6,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'colombia','',7,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'germany','',8,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'hong kong','',9,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'iran','',10,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'italy','',11,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'japan','',12,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'mexico','',13,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'philippines','',14,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'portugal','',15,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'puerto rico','',16,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'senegal','',17,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'spain','',18,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'tunisia','',19,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'united states','',20,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'venezuela','',21,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(0.0000,0.0000,'zaire','',22,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(52.5200,13.4050,'berlin','',23,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(-32.9587,-60.6930,'rosario','',24,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(-33.8688,151.2093,'sydney','',25,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(50.8503,4.3517,'brussels','',26,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(-23.5505,-46.6333,'sao paulo','',27,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(41.3851,2.1734,'barcelona','',28,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(41.8781,-87.6298,'chicago','',29,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(4.7110,-74.0721,'cali','',30,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(14.5995,120.9842,'manila','',31,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(22.3193,114.1694,'hong kong','',32,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(35.6892,51.3890,'tehran','',33,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(35.6762,139.6503,'tokyo','',34,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(34.3853,132.4553,'hiroshima','',35,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(19.4326,-99.1332,'mexico city','',36,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(39.8184,18.3129,'montecatini','',37,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(38.7223,-9.1393,'lisbon','',38,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(18.4655,-66.1057,'san juan','',39,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(45.5017,-73.5673,'montreal','',40,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(43.6532,-79.3832,'toronto','',41,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(36.8462,11.0995,'kelibia','',42,1,'2021-03-28 20:05:27',1,'2021-03-28 20:05:27'),(10.4806,-66.9036,'caracas','',43,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28'),(0.0000,0.0000,'algiers','',44,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28'),(0.0000,0.0000,'dakar','',45,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28'),(0.0000,0.0000,'kinshasa','',46,1,'2021-03-28 20:05:28',1,'2021-03-28 20:05:28');
/*!40000 ALTER TABLE `omeka_super_eight_festivals_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_nearby_festival_photos`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_nearby_festival_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_nearby_festival_photos` (
  `nearby_festival_id` int unsigned NOT NULL,
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nearby_festival_id` (`nearby_festival_id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_nearby_festival_photos_ibfk_1` FOREIGN KEY (`nearby_festival_id`) REFERENCES `omeka_super_eight_festivals_nearby_festivals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_nearby_festival_photos_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_nearby_festival_photos_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_nearby_festival_photos_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_nearby_festival_photos`
--

LOCK TABLES `omeka_super_eight_festivals_nearby_festival_photos` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_nearby_festival_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_nearby_festival_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_nearby_festival_print_medias`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_nearby_festival_print_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_nearby_festival_print_medias` (
  `nearby_festival_id` int unsigned NOT NULL,
  `file_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nearby_festival_id` (`nearby_festival_id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_nearby_festival_print_medias_ibfk_1` FOREIGN KEY (`nearby_festival_id`) REFERENCES `omeka_super_eight_festivals_nearby_festivals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_nearby_festival_print_medias_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_nearby_festival_print_medias_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_nearby_festival_print_medias_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_nearby_festival_print_medias`
--

LOCK TABLES `omeka_super_eight_festivals_nearby_festival_print_medias` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_nearby_festival_print_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_nearby_festival_print_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_nearby_festivals`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_nearby_festivals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_nearby_festivals` (
  `city_id` int unsigned NOT NULL,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_nearby_festivals_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `omeka_super_eight_festivals_cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_nearby_festivals_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_nearby_festivals_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_nearby_festivals`
--

LOCK TABLES `omeka_super_eight_festivals_nearby_festivals` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_nearby_festivals` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_nearby_festivals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_people`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_people` (
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_people_ibfk_1` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_people_ibfk_2` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_people`
--

LOCK TABLES `omeka_super_eight_festivals_people` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_people` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_staffs`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_staffs` (
  `person_id` int unsigned NOT NULL,
  `file_id` int unsigned DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `file_id` (`file_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_staffs_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `omeka_super_eight_festivals_people` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_staffs_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `omeka_super_eight_festivals_files` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_staffs_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_staffs_ibfk_4` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_staffs`
--

LOCK TABLES `omeka_super_eight_festivals_staffs` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_staffs` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_super_eight_festivals_timelines`
--

DROP TABLE IF EXISTS `omeka_super_eight_festivals_timelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_super_eight_festivals_timelines` (
  `embed_id` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified_by_id` int unsigned DEFAULT NULL,
  `modified_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `embed_id` (`embed_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `last_modified_by_id` (`last_modified_by_id`),
  CONSTRAINT `omeka_super_eight_festivals_timelines_ibfk_1` FOREIGN KEY (`embed_id`) REFERENCES `omeka_super_eight_festivals_embeds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `omeka_super_eight_festivals_timelines_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `omeka_super_eight_festivals_timelines_ibfk_3` FOREIGN KEY (`last_modified_by_id`) REFERENCES `omeka_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_super_eight_festivals_timelines`
--

LOCK TABLES `omeka_super_eight_festivals_timelines` WRITE;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_timelines` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_super_eight_festivals_timelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_tags`
--

DROP TABLE IF EXISTS `omeka_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_tags`
--

LOCK TABLES `omeka_tags` WRITE;
/*!40000 ALTER TABLE `omeka_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_users`
--

DROP TABLE IF EXISTS `omeka_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL,
  `role` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `active_idx` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_users`
--

LOCK TABLES `omeka_users` WRITE;
/*!40000 ALTER TABLE `omeka_users` DISABLE KEYS */;
INSERT INTO `omeka_users` VALUES (1,'admin','Super User','admin@super8festivals.org','191240d5abb77512a89cb3949f0fdddab95b67c8','3f020d3ad218dbef',1,'super');
/*!40000 ALTER TABLE `omeka_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_users_activations`
--

DROP TABLE IF EXISTS `omeka_users_activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omeka_users_activations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_users_activations`
--

LOCK TABLES `omeka_users_activations` WRITE;
/*!40000 ALTER TABLE `omeka_users_activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_users_activations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-28 20:13:01
