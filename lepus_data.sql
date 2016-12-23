-- MySQL dump 10.13  Distrib 5.7.7-rc, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: lepus
-- ------------------------------------------------------
-- Server version	5.7.7-rc-log

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
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menu` (
  `menu_id` smallint(4) NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(30) NOT NULL,
  `menu_level` tinyint(2) NOT NULL DEFAULT '0',
  `parent_id` tinyint(2) NOT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_icon` varchar(50) DEFAULT NULL,
  `system` tinyint(2) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `display_order` smallint(4) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (3,'MySQL Monitor',1,0,'mysql','icon-dashboard',0,1,3,'2014-02-25 08:57:29'),(5,'Permission System',1,0,'rabc','icon-legal',0,1,10,'2014-02-26 01:24:33'),(6,'Health Monitor',2,3,'mysql/index',' icon-list',0,1,1,'2014-02-26 01:25:15'),(8,'Replication Monitor',2,3,'mysql/replication',' icon-list',0,1,6,'2014-02-26 01:26:05'),(9,'Slowquery Analysis',2,3,'mysql/slowquery','icon-list',0,1,9,'2014-02-26 01:26:52'),(10,'User',2,5,'user/index','',0,1,1,'2014-02-26 01:43:02'),(11,'Role',2,5,'role/index','',0,1,2,'2014-02-26 01:43:19'),(12,'Menu',2,5,'menu/index','',0,1,3,'2014-02-26 01:43:41'),(13,'Privilege',2,5,'privilege/index','',0,1,4,'2014-02-26 01:45:01'),(15,'Authorization',2,5,'auth/index','',0,1,2,'2014-03-03 11:23:28'),(16,'Servers Configure',1,0,'server','icon-dashboard',0,1,2,'2014-03-05 07:31:17'),(18,'MySQL',2,16,'servers_mysql/index','icon-list',0,1,3,'2014-03-05 07:33:40'),(19,'AWR Report',2,3,'mysql/awrreport','icon-list',0,1,12,'2014-03-06 02:47:17'),(20,'Alarm Panel',1,0,'alarm','icon-dashboard',0,1,9,'2014-03-11 10:41:13'),(21,'Alarm List',2,20,'alarm/index','',0,1,0,'2014-03-11 10:46:28'),(22,'OS Monitor',1,0,'os','icon-dashboard',0,1,8,'2014-03-24 04:33:42'),(26,'Disk',2,22,'os/disk','icon-list',0,1,4,'2014-03-24 06:46:29'),(28,'BigTable Analysis',2,3,'mysql/bigtable','icon-list',0,1,7,'2014-04-02 02:38:15'),(29,'Key Cache Monitor',2,3,'mysql/key_cache','icon-list',0,1,3,'2014-04-09 04:52:12'),(30,'InnoDB Monitor',2,3,'mysql/innodb','icon-list',0,1,4,'2014-04-09 04:54:47'),(31,'Resource Monitor',2,3,'mysql/resource','icon-list',0,1,2,'2014-04-10 02:23:06'),(32,'MongoDB',2,16,'servers_mongodb/index','icon-list',0,1,5,'2014-04-14 01:26:35'),(33,'MongoDB Monitor',1,0,'mongodb','icon-dashboard',0,1,5,'2014-04-14 03:15:52'),(34,'Health Montior',2,33,'mongodb/index','icon-list',0,1,1,'2014-04-14 03:17:23'),(35,'Indexes Monitor',2,33,'mongodb/indexes','icon-list',0,1,2,'2014-04-14 05:25:48'),(36,'Memory Monitor',2,33,'mongodb/memory','icon-list',0,1,3,'2014-04-14 05:26:50'),(40,'Oracle',2,16,'servers_oracle/index','icon-list',0,1,4,'2014-05-27 02:21:49'),(43,'Health Monitor',2,22,'os/index','icon-list',0,1,0,'2014-07-07 22:19:11'),(44,'Disk IO',2,22,'os/disk_io','icon-list',0,1,5,'2014-07-15 04:35:56'),(45,'OS',2,16,'servers_os/index','icon-list',0,1,8,'2014-07-15 23:32:13'),(46,'Settings',2,16,'settings/index','icon-list',0,1,0,'2014-08-12 04:30:54'),(48,'Redis Monitor',1,0,'redis','icon-dashboard',0,1,6,'2014-09-02 01:36:41'),(50,'Health Monitor',2,48,'redis/index','icon-list',0,1,2,'2014-09-02 01:39:58'),(51,'Redis',2,16,'servers_redis/index','icon-list',0,1,6,'2014-09-09 06:15:41'),(52,'Memory Monitor',2,48,'redis/memory','icon-list',0,1,3,'2014-09-11 03:34:13'),(54,'Replication Monitor',2,48,'redis/replication','icon-list',0,1,5,'2014-09-11 03:37:12'),(56,'Oracle Monitor',1,0,'oracle','icon-dashboard',0,1,4,'2014-10-24 04:34:50'),(57,'Health Montior',2,56,'oracle/index','icon-list',0,1,1,'2014-10-24 04:35:47'),(58,'Tablespace Monitor',2,56,'oracle/tablespace','icon-list',0,1,2,'2014-10-24 04:37:19'),(59,'Memcache Monitor',1,0,'memcache','icon-dashboard',0,1,7,'2016-09-09 08:38:14'),(60,'Health Monitor',2,59,'memcache/index','icon-list',0,1,0,'2016-09-09 08:43:18'),(61,'Memory Monitor',2,59,'memcache/memory','icon-list',0,1,1,'2016-09-09 08:45:15'),(62,'Memcache',2,16,'servers_memcache/index','icon-list',0,1,7,'2016-09-11 01:57:11'),(63,'SQLServer Monitor',1,0,'sqlserver','icon-dashboard',0,1,8,'2016-09-26 09:09:32'),(64,'SQLServer',2,16,'servers_sqlserver/index','icon-list',0,1,9,'2016-09-26 09:14:50'),(65,'Health Monitor',2,63,'sqlserver/index','icon-list',0,1,1,'2016-09-26 09:18:05'),(66,'Backup',1,0,'backup','icon-dashboard',0,1,9,'2016-09-27 06:11:28'),(67,'Backup list',2,66,'backup/index','icon-list',0,1,0,'2016-09-27 06:12:21');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_privilege`
--

DROP TABLE IF EXISTS `admin_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_privilege` (
  `privilege_id` smallint(4) NOT NULL AUTO_INCREMENT,
  `privilege_title` varchar(30) DEFAULT NULL,
  `menu_id` smallint(4) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `display_order` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_privilege`
--

LOCK TABLES `admin_privilege` WRITE;
/*!40000 ALTER TABLE `admin_privilege` DISABLE KEYS */;
INSERT INTO `admin_privilege` VALUES (1,'MySQL Health Monitor',6,'mysql/index',1),(3,'MySQL Replication Monitor',8,'mysql/replication',2),(4,'MySQLSlowQuery',9,'mysql/slowquery',4),(6,'Admin User View',10,'user/index',52),(7,'Admin User Add ',10,'user/add',52),(8,'Admin User Edit',10,'user/edit',53),(9,'Admin User Delete',10,'user/forever_delete',54),(10,'Admin Role View',11,'role/index',61),(11,'Admin Role Add',11,'role/add',62),(12,'Admin Role Edit',11,'role/edit',63),(13,'Admin Role Delete',11,'role/forever_delete',64),(14,'Admin Menu View',12,'menu/index',71),(15,'Admin Menu Add',12,'menu/add',72),(16,'Admin Menu Edit',12,'menu/edit',73),(17,'Admin Menu Delete',12,'menu/forever_delete',74),(18,'Admin Privilege View',13,'privilege/index',81),(19,'Admin Privilege Add',13,'privilege/add',82),(20,'Admin Privilege Edit',13,'privilege/edit',83),(21,'Admin Privilege Delete',13,'privilege/forever_delete',84),(22,'Admin Auth View',15,'auth/index',91),(23,'Admin Role Privilege Update',15,'auth/update_role_privilege',92),(24,'Login System',0,'index/index',0),(25,'Admin User Role Update',13,'auth/update_user_role',93),(31,'MySQL Servers View',18,'servers_mysql/index',36),(32,'MySQL Servers Add',18,'servers_mysql/add',37),(33,'MySQL Servers Edit',18,'servers_mysql/edit',38),(34,'MySQL Servers Trash',18,'servers_mysql/trash',39),(35,'MySQL Servers Delete',18,'servers_mysql/delete',40),(36,'MySQLSlowQuery Detail',9,'mysql/slowquery_detail',4),(37,'MySQL AWR Report',19,'mysql/awrreport',5),(38,'MySQL Health Chart',6,'mysql/chart',1),(39,'MySQL Replication Chart',8,'mysql/replication_chart',2),(40,'Alarm View',21,'alarm/index',8),(41,'OS Health View',43,'os/index',100),(44,'OS Disk View',26,'os/disk',100),(46,'OS Disk Chart View',26,'os/disk_chart',100),(48,'OS Health Chart View',43,'os/chart',100),(49,'MySQL BigTable Analysis',28,'mysql/bigtable',8),(50,'MySQL BigTable Analysis Chart',28,'mysql/bigtable_chart',8),(51,'MySQL Key Cache Monitor',29,'mysql/key_cache',2),(52,'MySQL InnoDB Monitor',30,'mysql/innodb',2),(53,'MySQL Resource Monitor',31,'mysql/resource',2),(54,'MongoDB Servers View',32,'servers_mongodb/index',42),(55,'MongoDB Servers Add',32,'servers_mongodb/add',43),(56,'MongoDB Servers Edit',32,'servers_mongodb/edit',44),(57,'MongoDB Servers Trash',32,'servers_mongodb/trash',44),(58,'MongoDB Servers Delete',32,'servers_mongodb/delete',44),(59,'MongoDB Health View',34,'mongodb/index',10),(60,'MongoDB Indexes View',35,'mongodb/indexes',11),(61,'MongoDB Memory View',36,'mongodb/memory',12),(67,'Oracle Servers View',40,'servers_oracle/index',45),(68,'Oracle Servers Add',40,'servers_oracle/add',46),(69,'Oracle Servers Edit',40,'servers_oracle/edit',47),(76,'Mongodb Health Chart View',34,'mongodb/chart',13),(77,'OS Disk View',44,'os/disk_io',100),(78,'OS Disk Chart View',44,'os/disk_io_chart',100),(79,'OS Servers View',45,'servers_os/index',50),(80,'OS  Servers Add',45,'servers_os/add',50),(81,'OS Servers Edit',45,'servers_os/edit',50),(82,'OS Servers Delete',45,'servers_os/delete',50),(83,'OS Servers Trash',45,'servers_os/trash',50),(84,'OS Servers Batch Add',45,'servers_os/batch_add',50),(85,'MongoDB Servers Batch Add',32,'servers_mongodb/batch_add',44),(86,'MySQL Servers Batch Add',18,'servers_mysql/batch_add',40),(87,'Settings View',46,'settings/index',30),(92,'Redis Health View',50,'redis/index',19),(93,'Redis Health Chart View',50,'redis/chart',20),(94,'Redis Servers View',51,'servers_redis/index',51),(95,'Redis Servers Add',51,'servers_redis/add',51),(96,'Redis Servers Edit',51,'servers_redis/edit',51),(97,'Redis Servers Trash',51,'servers_redis/trash',51),(98,'Redis Servers Delete',51,'servers_redis/delete',51),(99,'Redis Servers Batch Add',51,'servers_redis/batch_add',51),(100,'Redis Memory View',52,'redis/memory',21),(101,'Redis Memory Chart View',52,'redis/memory_chart',21),(104,'Redis Replication View',54,'redis/replication',23),(105,'Redis Replication Chart View',54,'redis/replication_chart',23),(110,'Oracle Health Monitor',57,'oracle/index',25),(111,'Oracle Health Chart',57,'oracle/chart',26),(112,'Oracle Tablespace Monitor',58,'oracle/tablespace',27),(113,'Settings Save',46,'settings/save',31),(114,'Oracle Servers Trash',40,'servers_oracle/trash',48),(115,'Oracle Servers Delete',40,'servers_oracle/delete',48),(116,'Oracle Servers Batch Add',40,'servers_oracle/batch_add',48),(117,'Memcache Health View',60,'memcache/index',101),(118,'Memcache Servers Add',62,'servers_memcache/add',103),(119,'Memcache Servers View',62,'servers_memcache/index',102),(120,'Memcache Servers Batch Add',62,'servers_memcache/batch_add',104),(121,'Memcache Servers Trash',62,'servers_memcache/trash',106),(122,'Memcache Servers Edit',62,'servers_memcache/edit',105),(123,'SQLServer Servers View',64,'servers_sqlserver/index',107),(124,'SQLServer Servers Add',64,'servers_sqlserver/add',108),(125,'SQLServer Servers Edit',64,'servers_sqlserver/edit',110),(126,'SQLServer Servers Trash',64,'servers_sqlserver/trash',111),(127,'SQLServer Servers Batch Add',64,'servers_sqlserver/batch_add',112),(128,'SQLServer Health Monitor',65,'sqlserver/index',113),(129,'SQLServer Health Chart',65,'sqlserver/chart',114),(130,'Backview View',67,'backup/index',115),(131,'Memcache Health Chart',60,'memcache/chart',102);
/*!40000 ALTER TABLE `admin_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role` (
  `role_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
INSERT INTO `admin_role` VALUES (1,'Administrator'),(3,'IT-DBA'),(5,'IT-Developer'),(7,'guest_group');
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_privilege`
--

DROP TABLE IF EXISTS `admin_role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_privilege` (
  `role_id` smallint(4) NOT NULL,
  `privilege_id` smallint(4) NOT NULL,
  PRIMARY KEY (`role_id`,`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_privilege`
--

LOCK TABLES `admin_role_privilege` WRITE;
/*!40000 ALTER TABLE `admin_role_privilege` DISABLE KEYS */;
INSERT INTO `admin_role_privilege` VALUES (1,1),(1,3),(1,4),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,44),(1,46),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,67),(1,68),(1,69),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,98),(1,99),(1,100),(1,101),(1,104),(1,105),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(2,4),(3,1),(3,2),(3,3),(3,4),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),(3,60),(3,61),(3,67),(3,68),(3,69),(3,70),(3,71),(3,72),(3,74),(3,75),(3,76),(3,77),(3,78),(3,79),(3,80),(3,81),(3,82),(3,83),(3,84),(3,85),(3,86),(3,87),(3,88),(3,89),(3,90),(5,1),(5,3),(5,4),(5,24),(5,36),(5,38),(5,39),(5,42),(5,43),(5,44),(5,46),(5,47),(5,48),(5,59),(5,60),(5,61),(5,74),(5,75),(5,76),(5,77),(5,78),(5,88),(5,89),(5,90),(7,1),(7,3),(7,4),(7,6),(7,10),(7,14),(7,18),(7,22),(7,24),(7,36),(7,37),(7,38),(7,39),(7,40),(7,41),(7,44),(7,46),(7,48),(7,49),(7,50),(7,51),(7,52),(7,53),(7,59),(7,60),(7,61),(7,76),(7,77),(7,78),(7,87),(7,92),(7,93),(7,100),(7,101),(7,104),(7,105),(7,110),(7,111),(7,112);
/*!40000 ALTER TABLE `admin_role_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `login_count` int(11) DEFAULT '0',
  `last_login_ip` varchar(100) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'admin','6f493fbddf9107797f5044bb229ac6ee','Administrator','admin@mail.com','',66,'10.1.4.216','2016-12-22 23:00:46',1,'2013-12-25 04:58:34'),(8,'guest','e10adc3949ba59abbe56e057f20f883e','Guest','','',0,'','2015-01-06 16:55:14',1,'2014-03-12 06:06:36');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_role`
--

DROP TABLE IF EXISTS `admin_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_role` (
  `user_id` int(10) NOT NULL,
  `role_id` smallint(4) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_role`
--

LOCK TABLES `admin_user_role` WRITE;
/*!40000 ALTER TABLE `admin_user_role` DISABLE KEYS */;
INSERT INTO `admin_user_role` VALUES (1,1),(2,1),(2,2),(2,3),(2,5),(8,7),(9,3);
/*!40000 ALTER TABLE `admin_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `name` varchar(50) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES ('monitor','1','是否开启全局监控,此项如果关闭则所有项目都不会被监控，下面监控选项都失效'),('monitor_mysql','1','是否开启MySQL状态监控'),('send_alarm_mail','1','是否发送报警邮件'),('send_mail_to_list','','报警邮件通知人员'),('monitor_os','1','是否开启OS监控'),('monitor_mongodb','1','是否监控MongoDB'),('alarm','1','是否开启告警'),('send_mail_max_count','3','发送邮件最大次数'),('report_mail_to_list','','报告邮件推送接收人员'),('frequency_monitor','60','监控频率'),('send_mail_sleep_time','720','发送邮件休眠时间(分钟)'),('mailtype','html','邮件发送配置:邮件类型'),('mailprotocol','smtp','邮件发送配置:邮件协议'),('smtp_host','mail.wondersgroup.com','邮件发送配置:邮件主机'),('smtp_port','25','邮件发送配置:邮件端口'),('smtp_user','','邮件发送配置:用户'),('smtp_pass','','邮件发送配置:密码'),('smtp_timeout','10','邮件发送配置:超时时间'),('mailfrom','lepus@wondersgroup.com','邮件发送配置:发件人'),('monitor_redis','1','是否监控Redis'),('monitor_oracle','1','是否监控Oracle'),('send_alarm_sms','1','是否发生短信'),('send_sms_to_list','','短信收件人列表'),('send_sms_max_count','1','发送短信最大次数'),('send_sms_sleep_time','180','发送短信休眠时间(分钟)'),('sms_fetion_user','','飞信发送短信账号'),('sms_fetion_pass','','飞信发送短信密码'),('smstype','fetion','发送短信方式：fetion/api'),('monitor_memcache','1','是否监控memcache'),('monitor_sqlserver','1','是否开启SQLServer监控');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lepus_status`
--

DROP TABLE IF EXISTS `lepus_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lepus_status` (
  `lepus_variables` varchar(255) NOT NULL,
  `lepus_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lepus_status`
--

LOCK TABLES `lepus_status` WRITE;
/*!40000 ALTER TABLE `lepus_status` DISABLE KEYS */;
INSERT INTO `lepus_status` VALUES ('lepus_running','1'),('lepus_version','4.0.0'),('lepus_checktime','2016-12-23 10:30:43');
/*!40000 ALTER TABLE `lepus_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-23 10:31:20
