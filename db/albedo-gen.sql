-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: albedo-gen
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE=''+00:00'' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gen_datasource_conf`
--
DROP DATABASE IF EXISTS `albedo-gen`;

CREATE DATABASE  `albedo-gen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE `albedo-cloud`;
DROP TABLE IF EXISTS `gen_datasource_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_datasource_conf` (
  `id` varchar(64) NOT NULL COMMENT ''主键'',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT ''名称'',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT ''url'',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT ''用户名'',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT ''密码'',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''0'' COMMENT ''0-正常，1-删除'',
  `version` int DEFAULT ''0'' COMMENT ''默认0，必填，离线乐观锁'',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT ''描述'',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '''' COMMENT ''租户编码'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT=''数据源表'';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_datasource_conf`
--

LOCK TABLES `gen_datasource_conf` WRITE;
/*!40000 ALTER TABLE `gen_datasource_conf` DISABLE KEYS */;
INSERT INTO `gen_datasource_conf` VALUES (''1513396646128386048'',''gen'',''jdbc:mysql://localhost:3306/albedo-gen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true'',''root'',''WjSXie6L3c9bMSnX9SrL7g=='',''0'',1,NULL,''1'',''2022-04-11 06:00:49.665'',''1'',''2022-04-11 06:00:49.665'',''0000''),(''1513396899208495104'',''cloud'',''jdbc:mysql://localhost:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true'',''root'',''ZB8attIFlgfTv5JZVZxV7w=='',''0'',0,NULL,''1'',''2022-04-11 06:01:52.982'',''1'',''2022-04-11 06:01:52.983'',''0000''),(''4a56eae38c1efba4b3a55153a0616ba9'',''albedoGen'',''jdbc:mysql://albedo-mysql:3306/albedo-gen'',''root'',''z4aETx/0mMW0mfZByjM8dQ=='',''0'',0,NULL,''1'',''2020-09-20 04:49:48.862'',''1'',''2020-09-20 04:49:48.862'',''''),(''893af6088511440a2998c9277886ec76'',''albedoCloud'',''jdbc:mysql://albedo-mysql:3306/albedo-cloud'',''root'',''egwpbMYBPEimOtvJRoPiag=='',''0'',2,NULL,''1'',''2020-09-20 02:48:25.392'',''1'',''2020-09-20 05:06:55.370'','''');
/*!40000 ALTER TABLE `gen_datasource_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_scheme`
--

DROP TABLE IF EXISTS `gen_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT ''编号'',
  `name` varchar(200) DEFAULT NULL COMMENT ''名称'',
  `category` varchar(2000) DEFAULT NULL COMMENT ''分类'',
  `view_type` char(2) DEFAULT NULL COMMENT ''视图类型 0  普通表格 1  表格采用ajax刷新'',
  `package_name` varchar(500) DEFAULT NULL COMMENT ''生成包路径'',
  `module_name` varchar(30) DEFAULT NULL COMMENT ''生成模块名'',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT ''生成子模块名'',
  `function_name` varchar(500) DEFAULT NULL COMMENT ''生成功能名'',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT ''生成功能名（简写）'',
  `function_author` varchar(100) DEFAULT NULL COMMENT ''生成功能作者'',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT ''生成表编号'',
  `version` int DEFAULT ''0'' COMMENT ''默认0，必填，离线乐观锁'',
  `description` varchar(255) DEFAULT NULL COMMENT ''描述'',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''0'' COMMENT ''0-正常，1-删除'',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '''' COMMENT ''租户编码'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT=''生成方案'';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_scheme`
--

LOCK TABLES `gen_scheme` WRITE;
/*!40000 ALTER TABLE `gen_scheme` DISABLE KEYS */;
INSERT INTO `gen_scheme` VALUES (''1513397040871112704'',''测试书籍'',''curd'',NULL,''com.albedo.java.modules'',''test'',NULL,''测试书籍'',''测试书籍'',''admin'',''1539469852043902976'',3,NULL,''1'',''2022-04-11 06:02:26.758'',''1'',''2022-04-11 06:02:26.758'',''0'',''0000'');
/*!40000 ALTER TABLE `gen_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT ''编号'',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''名称'',
  `comments` varchar(500) DEFAULT NULL COMMENT ''描述'',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''实体类名称'',
  `ds_name` varchar(255) DEFAULT NULL COMMENT ''数据源'',
  `parent_table` varchar(200) DEFAULT NULL COMMENT ''关联父表'',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT ''关联父表外键'',
  `version` int DEFAULT ''0'' COMMENT ''默认0，必填，离线乐观锁'',
  `description` varchar(255) DEFAULT NULL COMMENT ''描述'',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''0'' COMMENT ''0-正常，1-删除'',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '''' COMMENT ''租户编码'',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `gen_table_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT=''业务表'';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (''1513396943223521280'',''test_book'',''测试书籍'',''TestBook'',''gen'',NULL,NULL,0,NULL,''1'',''2022-06-22 03:37:46.285'',''1'',''2022-06-22 03:37:46.283'',''1'',''0000''),(''1539452614784057344'',''test_book'',''测试书籍'',''TestBook'',''gen'',NULL,NULL,0,NULL,''1'',''2022-06-22 04:46:17.900'',''1'',''2022-06-22 04:46:17.893'',''1'',''0000''),(''1539469852043902976'',''test_book'',''测试书籍'',''TestBook'',''gen'',NULL,NULL,0,NULL,''1'',''2022-06-22 04:46:29.350'',''1'',''2022-06-22 04:46:29.350'',''0'',''0000'');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT ''编号'',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT ''归属表编号'',
  `name` varchar(200) DEFAULT NULL COMMENT ''名称'',
  `title` varchar(255) NOT NULL COMMENT ''标题'',
  `comments` varchar(500) DEFAULT NULL COMMENT ''描述备注'',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT ''列的数据类型的字节长度'',
  `java_type` varchar(500) DEFAULT NULL COMMENT ''JAVA类型'',
  `java_field_name` varchar(200) DEFAULT NULL COMMENT ''JAVA字段名'',
  `pk` bit(1) DEFAULT NULL COMMENT ''是否主键'',
  `unique_field` bit(1) DEFAULT NULL COMMENT ''是否唯一（1：是；0：否）'',
  `null_field` bit(1) DEFAULT NULL COMMENT ''是否可为空'',
  `insert_field` bit(1) DEFAULT NULL COMMENT ''是否为插入字段'',
  `edit_field` bit(1) DEFAULT NULL COMMENT ''是否编辑字段'',
  `list_field` bit(1) DEFAULT NULL COMMENT ''是否列表字段'',
  `query_field` bit(1) DEFAULT NULL COMMENT ''是否查询字段'',
  `query_type` varchar(200) DEFAULT NULL COMMENT ''查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）'',
  `show_type` varchar(200) DEFAULT NULL COMMENT ''字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）'',
  `dict_type` varchar(200) DEFAULT NULL COMMENT ''字典类型'',
  `settings` varchar(2000) DEFAULT NULL COMMENT ''其它设置（扩展字段JSON）'',
  `sort` decimal(10,0) DEFAULT NULL COMMENT ''排序（升序）'',
  `version` int DEFAULT ''0'' COMMENT ''默认0，必填，离线乐观锁'',
  `description` varchar(255) DEFAULT NULL COMMENT ''描述'',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''0'' COMMENT ''0-正常，1-删除'',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '''' COMMENT ''租户编码'',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gen_table_column_table_id` (`gen_table_id`) USING BTREE,
  KEY `gen_table_column_name` (`name`) USING BTREE,
  KEY `gen_table_column_sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT=''业务表字段'';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (''1513396943353544704'',''1513396943223521280'',''id'',''id'',NULL,''varchar(32)'',''String'',''id'',_binary '''',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,10,0,NULL,''1'',''2022-06-22 03:37:05.617'',''1'',''2022-06-22 03:37:05.597'',''1'',''0000''),(''1513396943370321920'',''1513396943223521280'',''title_'',''标题'',NULL,''varchar(32)'',''String'',''title'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary '''',_binary '''',''like'',''input'','''',NULL,20,0,NULL,''1'',''2022-06-22 03:37:05.650'',''1'',''2022-06-22 03:37:05.602'',''1'',''0000''),(''1513396943378710528'',''1513396943223521280'',''author_'',''作者'',NULL,''varchar(50)'',''String'',''author'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,30,0,NULL,''1'',''2022-06-22 03:37:05.650'',''1'',''2022-06-22 03:37:05.603'',''1'',''0000''),(''1513396943387099136'',''1513396943223521280'',''name_'',''名称'',NULL,''varchar(50)'',''String'',''name'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary '''',_binary '''',''like'',''input'','''',NULL,40,0,NULL,''1'',''2022-06-22 03:37:05.651'',''1'',''2022-06-22 03:37:05.603'',''1'',''0000''),(''1513396943391293440'',''1513396943223521280'',''email_'',''邮箱'',NULL,''varchar(100)'',''String'',''email'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,50,0,NULL,''1'',''2022-06-22 03:37:05.651'',''1'',''2022-06-22 03:37:05.604'',''1'',''0000''),(''1513396943403876352'',''1513396943223521280'',''phone_'',''手机'',NULL,''varchar(32)'',''String'',''phone'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,60,0,NULL,''1'',''2022-06-22 03:37:05.651'',''1'',''2022-06-22 03:37:05.605'',''1'',''0000''),(''1513396943408070656'',''1513396943223521280'',''activated_'',''activated_'',NULL,''bit(1)'',''Integer'',''activated'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,70,0,NULL,''1'',''2022-06-22 03:37:05.652'',''1'',''2022-06-22 03:37:05.605'',''1'',''0000''),(''1513396943416459264'',''1513396943223521280'',''number_'',''key'',NULL,''int'',''Long'',''number'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,80,0,NULL,''1'',''2022-06-22 03:37:05.652'',''1'',''2022-06-22 03:37:05.606'',''1'',''0000''),(''1513396943420653568'',''1513396943223521280'',''money_'',''money_'',NULL,''decimal(20,2)'',''Double'',''money'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,90,0,NULL,''1'',''2022-06-22 03:37:05.652'',''1'',''2022-06-22 03:37:05.607'',''1'',''0000''),(''1513396943429042176'',''1513396943223521280'',''amount_'',''amount_'',NULL,''double(11,2)'',''Double'',''amount'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,100,0,NULL,''1'',''2022-06-22 03:37:05.653'',''1'',''2022-06-22 03:37:05.608'',''1'',''0000''),(''1513396943433236480'',''1513396943223521280'',''reset_date'',''reset_date'',NULL,''timestamp(3)'',''java.util.Date'',''resetDate'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''dateselect'','''',NULL,110,0,NULL,''1'',''2022-06-22 03:37:05.659'',''1'',''2022-06-22 03:37:05.608'',''1'',''0000''),(''1513396943437430784'',''1513396943223521280'',''created_by'',''created_by'',NULL,''varchar(50)'',''String'',''createdBy'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,120,0,NULL,''1'',''2022-06-22 03:37:05.659'',''1'',''2022-06-22 03:37:05.609'',''1'',''0000''),(''1513396943441625088'',''1513396943223521280'',''created_date'',''created_date'',NULL,''timestamp(3)'',''java.util.Date'',''createdDate'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''dateselect'','''',NULL,130,0,NULL,''1'',''2022-06-22 03:37:05.659'',''1'',''2022-06-22 03:37:05.610'',''1'',''0000''),(''1513396943450013696'',''1513396943223521280'',''last_modified_by'',''last_modified_by'',NULL,''varchar(50)'',''String'',''lastModifiedBy'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,140,0,NULL,''1'',''2022-06-22 03:37:05.660'',''1'',''2022-06-22 03:37:05.610'',''1'',''0000''),(''1513396943454208000'',''1513396943223521280'',''last_modified_date'',''last_modified_date'',NULL,''timestamp(3)'',''java.util.Date'',''lastModifiedDate'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''dateselect'','''',NULL,150,0,NULL,''1'',''2022-06-22 03:37:05.660'',''1'',''2022-06-22 03:37:05.611'',''1'',''0000''),(''1513396943458402304'',''1513396943223521280'',''description'',''备注'',NULL,''varchar(255)'',''String'',''description'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,160,0,NULL,''1'',''2022-06-22 03:37:05.660'',''1'',''2022-06-22 03:37:05.612'',''1'',''0000''),(''1513396943466790912'',''1513396943223521280'',''version'',''version'',NULL,''int'',''Long'',''version'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,170,0,NULL,''1'',''2022-06-22 03:37:05.660'',''1'',''2022-06-22 03:37:05.613'',''1'',''0000''),(''1513396943475179520'',''1513396943223521280'',''del_flag'',''0-正常，1-删除'',NULL,''char(1)'',''String'',''delFlag'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''radio'',''sys_flag'',NULL,180,0,NULL,''1'',''2022-06-22 03:37:05.661'',''1'',''2022-06-22 03:37:05.614'',''1'',''0000''),(''1513396943479373824'',''1513396943223521280'',''tenant_code'',''租户编码'',NULL,''varchar(20)'',''String'',''tenantCode'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,190,0,NULL,''1'',''2022-06-22 03:37:05.661'',''1'',''2022-06-22 03:37:05.614'',''1'',''0000''),(''1539452388409081856'',''1513396943223521280'',''id'',''id'',NULL,''varchar(32)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,10,0,NULL,''1'',''2022-06-22 03:37:46.371'',''1'',''2022-06-22 03:37:46.359'',''1'',''0000''),(''1539452388425859072'',''1513396943223521280'',''title_'',''标题'',NULL,''varchar(32)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''like'',''input'','''',NULL,20,0,NULL,''1'',''2022-06-22 03:37:46.372'',''1'',''2022-06-22 03:37:46.361'',''1'',''0000''),(''1539452388430053376'',''1513396943223521280'',''author_'',''作者'',NULL,''varchar(50)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,30,0,NULL,''1'',''2022-06-22 03:37:46.372'',''1'',''2022-06-22 03:37:46.361'',''1'',''0000''),(''1539452388438441984'',''1513396943223521280'',''name_'',''名称'',NULL,''varchar(50)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''like'',''input'','''',NULL,40,0,NULL,''1'',''2022-06-22 03:37:46.372'',''1'',''2022-06-22 03:37:46.362'',''1'',''0000''),(''1539452388442636288'',''1513396943223521280'',''email_'',''邮箱'',NULL,''varchar(100)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,50,0,NULL,''1'',''2022-06-22 03:37:46.372'',''1'',''2022-06-22 03:37:46.362'',''1'',''0000''),(''1539452388446830592'',''1513396943223521280'',''phone_'',''手机'',NULL,''varchar(32)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,60,0,NULL,''1'',''2022-06-22 03:37:46.373'',''1'',''2022-06-22 03:37:46.363'',''1'',''0000''),(''1539452388451024896'',''1513396943223521280'',''activated_'',''activated_'',NULL,''bit(1)'',''Integer'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,70,0,NULL,''1'',''2022-06-22 03:37:46.373'',''1'',''2022-06-22 03:37:46.363'',''1'',''0000''),(''1539452388451024897'',''1513396943223521280'',''number_'',''key'',NULL,''int'',''Long'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,80,0,NULL,''1'',''2022-06-22 03:37:46.373'',''1'',''2022-06-22 03:37:46.364'',''1'',''0000''),(''1539452388459413504'',''1513396943223521280'',''money_'',''money_'',NULL,''decimal(20,2)'',''Double'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,90,0,NULL,''1'',''2022-06-22 03:37:46.373'',''1'',''2022-06-22 03:37:46.364'',''1'',''0000''),(''1539452388463607808'',''1513396943223521280'',''amount_'',''amount_'',NULL,''double(11,2)'',''Double'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,100,0,NULL,''1'',''2022-06-22 03:37:46.373'',''1'',''2022-06-22 03:37:46.365'',''1'',''0000''),(''1539452388463607809'',''1513396943223521280'',''reset_date'',''reset_date'',NULL,''timestamp(3)'',''java.util.Date'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''dateselect'','''',NULL,110,0,NULL,''1'',''2022-06-22 03:37:46.373'',''1'',''2022-06-22 03:37:46.365'',''1'',''0000''),(''1539452388467802112'',''1513396943223521280'',''created_by'',''created_by'',NULL,''varchar(50)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,120,0,NULL,''1'',''2022-06-22 03:37:46.374'',''1'',''2022-06-22 03:37:46.366'',''1'',''0000''),(''1539452388471996416'',''1513396943223521280'',''created_date'',''created_date'',NULL,''timestamp(3)'',''java.util.Date'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''dateselect'','''',NULL,130,0,NULL,''1'',''2022-06-22 03:37:46.374'',''1'',''2022-06-22 03:37:46.366'',''1'',''0000''),(''1539452388471996417'',''1513396943223521280'',''last_modified_by'',''last_modified_by'',NULL,''varchar(50)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,140,0,NULL,''1'',''2022-06-22 03:37:46.374'',''1'',''2022-06-22 03:37:46.367'',''1'',''0000''),(''1539452388476190720'',''1513396943223521280'',''last_modified_date'',''last_modified_date'',NULL,''timestamp(3)'',''java.util.Date'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''dateselect'','''',NULL,150,0,NULL,''1'',''2022-06-22 03:37:46.374'',''1'',''2022-06-22 03:37:46.367'',''1'',''0000''),(''1539452388476190721'',''1513396943223521280'',''description'',''备注'',NULL,''varchar(255)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,160,0,NULL,''1'',''2022-06-22 03:37:46.374'',''1'',''2022-06-22 03:37:46.368'',''1'',''0000''),(''1539452388480385024'',''1513396943223521280'',''version'',''version'',NULL,''int'',''Long'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,170,0,NULL,''1'',''2022-06-22 03:37:46.374'',''1'',''2022-06-22 03:37:46.368'',''1'',''0000''),(''1539452388484579328'',''1513396943223521280'',''del_flag'',''0-正常，1-删除'',NULL,''char(1)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''radio'',''sys_flag'',NULL,180,0,NULL,''1'',''2022-06-22 03:37:46.374'',''1'',''2022-06-22 03:37:46.369'',''1'',''0000''),(''1539452388484579329'',''1513396943223521280'',''tenant_code'',''租户编码'',NULL,''varchar(20)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,190,0,NULL,''1'',''2022-06-22 03:37:46.375'',''1'',''2022-06-22 03:37:46.370'',''1'',''0000''),(''1539452615086047232'',''1539452614784057344'',''id'',''id'',NULL,''varchar(32)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,10,0,NULL,''1'',''2022-06-22 04:46:17.966'',''1'',''2022-06-22 04:46:17.948'',''1'',''0000''),(''1539452615094435840'',''1539452614784057344'',''title_'',''标题'',NULL,''varchar(32)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''like'',''input'','''',NULL,20,0,NULL,''1'',''2022-06-22 04:46:17.966'',''1'',''2022-06-22 04:46:17.951'',''1'',''0000''),(''1539452615094435841'',''1539452614784057344'',''author_'',''作者'',NULL,''varchar(50)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,30,0,NULL,''1'',''2022-06-22 04:46:17.966'',''1'',''2022-06-22 04:46:17.951'',''1'',''0000''),(''1539452615098630144'',''1539452614784057344'',''name_'',''名称'',NULL,''varchar(50)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''like'',''input'','''',NULL,40,0,NULL,''1'',''2022-06-22 04:46:17.967'',''1'',''2022-06-22 04:46:17.952'',''1'',''0000''),(''1539452615098630145'',''1539452614784057344'',''email_'',''邮箱'',NULL,''varchar(100)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,50,0,NULL,''1'',''2022-06-22 04:46:17.967'',''1'',''2022-06-22 04:46:17.953'',''1'',''0000''),(''1539452615102824448'',''1539452614784057344'',''phone_'',''手机'',NULL,''varchar(32)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,60,0,NULL,''1'',''2022-06-22 04:46:17.967'',''1'',''2022-06-22 04:46:17.953'',''1'',''0000''),(''1539452615102824449'',''1539452614784057344'',''activated_'',''activated_'',NULL,''bit(1)'',''Integer'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,70,0,NULL,''1'',''2022-06-22 04:46:17.967'',''1'',''2022-06-22 04:46:17.954'',''1'',''0000''),(''1539452615107018752'',''1539452614784057344'',''number_'',''key'',NULL,''int'',''Long'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,80,0,NULL,''1'',''2022-06-22 04:46:17.968'',''1'',''2022-06-22 04:46:17.955'',''1'',''0000''),(''1539452615107018753'',''1539452614784057344'',''money_'',''money_'',NULL,''decimal(20,2)'',''Double'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,90,0,NULL,''1'',''2022-06-22 04:46:17.968'',''1'',''2022-06-22 04:46:17.955'',''1'',''0000''),(''1539452615107018754'',''1539452614784057344'',''amount_'',''amount_'',NULL,''double(11,2)'',''Double'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,100,0,NULL,''1'',''2022-06-22 04:46:17.968'',''1'',''2022-06-22 04:46:17.956'',''1'',''0000''),(''1539452615111213056'',''1539452614784057344'',''reset_date'',''reset_date'',NULL,''timestamp(3)'',''java.util.Date'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''dateselect'','''',NULL,110,0,NULL,''1'',''2022-06-22 04:46:17.968'',''1'',''2022-06-22 04:46:17.957'',''1'',''0000''),(''1539452615111213057'',''1539452614784057344'',''created_by'',''created_by'',NULL,''varchar(50)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,120,0,NULL,''1'',''2022-06-22 04:46:17.969'',''1'',''2022-06-22 04:46:17.958'',''1'',''0000''),(''1539452615115407360'',''1539452614784057344'',''created_date'',''created_date'',NULL,''timestamp(3)'',''java.util.Date'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''dateselect'','''',NULL,130,0,NULL,''1'',''2022-06-22 04:46:17.981'',''1'',''2022-06-22 04:46:17.959'',''1'',''0000''),(''1539452615115407361'',''1539452614784057344'',''last_modified_by'',''last_modified_by'',NULL,''varchar(50)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,140,0,NULL,''1'',''2022-06-22 04:46:17.982'',''1'',''2022-06-22 04:46:17.960'',''1'',''0000''),(''1539452615119601664'',''1539452614784057344'',''last_modified_date'',''last_modified_date'',NULL,''timestamp(3)'',''java.util.Date'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''dateselect'','''',NULL,150,0,NULL,''1'',''2022-06-22 04:46:17.982'',''1'',''2022-06-22 04:46:17.962'',''1'',''0000''),(''1539452615119601665'',''1539452614784057344'',''description'',''备注'',NULL,''varchar(255)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,160,0,NULL,''1'',''2022-06-22 04:46:17.982'',''1'',''2022-06-22 04:46:17.963'',''1'',''0000''),(''1539452615119601666'',''1539452614784057344'',''version'',''version'',NULL,''int'',''Long'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,170,0,NULL,''1'',''2022-06-22 04:46:17.982'',''1'',''2022-06-22 04:46:17.964'',''1'',''0000''),(''1539452615123795968'',''1539452614784057344'',''del_flag'',''0-正常，1-删除'',NULL,''char(1)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''radio'',''sys_flag'',NULL,180,0,NULL,''1'',''2022-06-22 04:46:17.983'',''1'',''2022-06-22 04:46:17.964'',''1'',''0000''),(''1539452615123795969'',''1539452614784057344'',''tenant_code'',''租户编码'',NULL,''varchar(20)'',''String'',NULL,_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,190,0,NULL,''1'',''2022-06-22 04:46:17.983'',''1'',''2022-06-22 04:46:17.965'',''1'',''0000''),(''1539469852186509312'',''1539469852043902976'',''id'',''id'',NULL,''varchar(32)'',''String'',''id'',_binary '''',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,10,0,NULL,''1'',''2022-06-22 04:46:29.385'',''1'',''2022-06-22 04:46:29.385'',''0'',''0000''),(''1539469852199092224'',''1539469852043902976'',''title_'',''标题'',NULL,''varchar(32)'',''String'',''title'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary '''',''like'',''input'','''',NULL,20,0,NULL,''1'',''2022-06-22 04:46:29.388'',''1'',''2022-06-22 04:46:29.388'',''0'',''0000''),(''1539469852203286528'',''1539469852043902976'',''author_'',''作者'',NULL,''varchar(50)'',''String'',''author'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,30,0,NULL,''1'',''2022-06-22 04:46:29.389'',''1'',''2022-06-22 04:46:29.389'',''0'',''0000''),(''1539469852203286529'',''1539469852043902976'',''name_'',''名称'',NULL,''varchar(50)'',''String'',''name'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary '''',''like'',''input'','''',NULL,40,0,NULL,''1'',''2022-06-22 04:46:29.389'',''1'',''2022-06-22 04:46:29.389'',''0'',''0000''),(''1539469852207480832'',''1539469852043902976'',''email_'',''邮箱'',NULL,''varchar(100)'',''String'',''email'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,50,0,NULL,''1'',''2022-06-22 04:46:29.390'',''1'',''2022-06-22 04:46:29.390'',''0'',''0000''),(''1539469852211675136'',''1539469852043902976'',''phone_'',''手机'',NULL,''varchar(32)'',''String'',''phone'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,60,0,NULL,''1'',''2022-06-22 04:46:29.391'',''1'',''2022-06-22 04:46:29.391'',''0'',''0000''),(''1539469852211675137'',''1539469852043902976'',''activated_'',''activated_'',NULL,''bit(1)'',''Integer'',''activated'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,70,0,NULL,''1'',''2022-06-22 04:46:29.391'',''1'',''2022-06-22 04:46:29.391'',''0'',''0000''),(''1539469852215869440'',''1539469852043902976'',''number_'',''key'',NULL,''int'',''Long'',''number'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,80,0,NULL,''1'',''2022-06-22 04:46:29.392'',''1'',''2022-06-22 04:46:29.392'',''0'',''0000''),(''1539469852220063744'',''1539469852043902976'',''money_'',''money_'',NULL,''decimal(20,2)'',''Double'',''money'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,90,0,NULL,''1'',''2022-06-22 04:46:29.393'',''1'',''2022-06-22 04:46:29.393'',''0'',''0000''),(''1539469852220063745'',''1539469852043902976'',''amount_'',''amount_'',NULL,''double(11,2)'',''Double'',''amount'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''input'','''',NULL,100,0,NULL,''1'',''2022-06-22 04:46:29.393'',''1'',''2022-06-22 04:46:29.393'',''0'',''0000''),(''1539469852224258048'',''1539469852043902976'',''reset_date'',''reset_date'',NULL,''timestamp(3)'',''java.util.Date'',''resetDate'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary '''',_binary ''\0'',''eq'',''dateselect'','''',NULL,110,0,NULL,''1'',''2022-06-22 04:46:29.394'',''1'',''2022-06-22 04:46:29.394'',''0'',''0000''),(''1539469852224258049'',''1539469852043902976'',''created_by'',''created_by'',NULL,''varchar(50)'',''String'',''createdBy'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,120,0,NULL,''1'',''2022-06-22 04:46:29.394'',''1'',''2022-06-22 04:46:29.394'',''0'',''0000''),(''1539469852228452352'',''1539469852043902976'',''created_date'',''created_date'',NULL,''timestamp(3)'',''java.util.Date'',''createdDate'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''dateselect'','''',NULL,130,0,NULL,''1'',''2022-06-22 04:46:29.395'',''1'',''2022-06-22 04:46:29.395'',''0'',''0000''),(''1539469852228452353'',''1539469852043902976'',''last_modified_by'',''last_modified_by'',NULL,''varchar(50)'',''String'',''lastModifiedBy'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,140,0,NULL,''1'',''2022-06-22 04:46:29.395'',''1'',''2022-06-22 04:46:29.395'',''0'',''0000''),(''1539469852232646656'',''1539469852043902976'',''last_modified_date'',''last_modified_date'',NULL,''timestamp(3)'',''java.util.Date'',''lastModifiedDate'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''dateselect'','''',NULL,150,0,NULL,''1'',''2022-06-22 04:46:29.396'',''1'',''2022-06-22 04:46:29.396'',''0'',''0000''),(''1539469852232646657'',''1539469852043902976'',''description'',''备注'',NULL,''varchar(255)'',''String'',''description'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary '''',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,160,0,NULL,''1'',''2022-06-22 04:46:29.396'',''1'',''2022-06-22 04:46:29.396'',''0'',''0000''),(''1539469852236840960'',''1539469852043902976'',''version'',''version'',NULL,''int'',''Long'',''version'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,170,0,NULL,''1'',''2022-06-22 04:46:29.397'',''1'',''2022-06-22 04:46:29.397'',''0'',''0000''),(''1539469852236840961'',''1539469852043902976'',''del_flag'',''0-正常，1-删除'',NULL,''char(1)'',''String'',''delFlag'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''radio'',''sys_flag'',NULL,180,0,NULL,''1'',''2022-06-22 04:46:29.397'',''1'',''2022-06-22 04:46:29.397'',''0'',''0000''),(''1539469852241035264'',''1539469852043902976'',''tenant_code'',''租户编码'',NULL,''varchar(20)'',''String'',''tenantCode'',_binary ''\0'',_binary ''\0'',_binary ''\0'',_binary '''',_binary ''\0'',_binary ''\0'',_binary ''\0'',''eq'',''input'','''',NULL,190,0,NULL,''1'',''2022-06-22 04:46:29.398'',''1'',''2022-06-22 04:46:29.398'',''0'',''0000'');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_fk`
--

DROP TABLE IF EXISTS `gen_table_fk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_fk` (
  `id` varchar(64) NOT NULL COMMENT ''编号'',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT ''归属表编号'',
  `name` varchar(200) DEFAULT NULL COMMENT ''名称'',
  `comments` varchar(500) DEFAULT NULL COMMENT ''描述'',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT ''列的数据类型的字节长度'',
  `java_type` varchar(500) DEFAULT NULL COMMENT ''JAVA类型'',
  `java_field` varchar(200) DEFAULT NULL COMMENT ''JAVA字段名'',
  `is_pk` char(1) DEFAULT NULL COMMENT ''是否主键'',
  `is_unique` char(1) DEFAULT ''0'' COMMENT ''是否唯一（1：是；0：否）'',
  `is_null` char(1) DEFAULT NULL COMMENT ''是否可为空'',
  `is_insert` char(1) DEFAULT NULL COMMENT ''是否为插入字段'',
  `is_edit` char(1) DEFAULT NULL COMMENT ''是否编辑字段'',
  `is_list` char(1) DEFAULT NULL COMMENT ''是否列表字段'',
  `is_query` char(1) DEFAULT NULL COMMENT ''是否查询字段'',
  `query_type` varchar(200) DEFAULT NULL COMMENT ''查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）'',
  `show_type` varchar(200) DEFAULT NULL COMMENT ''字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）'',
  `dict_type` varchar(200) DEFAULT NULL COMMENT ''字典类型'',
  `settings` varchar(2000) DEFAULT NULL COMMENT ''其它设置（扩展字段JSON）'',
  `sort` decimal(10,0) DEFAULT NULL COMMENT ''排序（升序）'',
  `version` int DEFAULT ''0'' COMMENT ''默认0，必填，离线乐观锁'',
  `description` varchar(255) DEFAULT NULL COMMENT ''描述'',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''0'' COMMENT ''0-正常，1-删除'',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '''' COMMENT ''租户编码'',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gen_table_column_table_id` (`gen_table_id`) USING BTREE,
  KEY `gen_table_column_name` (`name`) USING BTREE,
  KEY `gen_table_column_sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT=''业务表字段'';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_fk`
--

LOCK TABLES `gen_table_fk` WRITE;
/*!40000 ALTER TABLE `gen_table_fk` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_fk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_book`
--

DROP TABLE IF EXISTS `test_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_book` (
  `id` varchar(32) NOT NULL,
  `title_` varchar(32) DEFAULT NULL COMMENT ''标题'',
  `author_` varchar(50) NOT NULL COMMENT ''作者'',
  `name_` varchar(50) DEFAULT NULL COMMENT ''名称'',
  `email_` varchar(100) DEFAULT NULL COMMENT ''邮箱'',
  `phone_` varchar(32) DEFAULT NULL COMMENT ''手机'',
  `activated_` bit(1) NOT NULL,
  `number_` int DEFAULT NULL COMMENT ''key'',
  `money_` decimal(20,2) DEFAULT NULL,
  `amount_` double(11,2) DEFAULT NULL,
  `reset_date` timestamp(3) NULL DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `version` int DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''0'' COMMENT ''0-正常，1-删除'',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '''' COMMENT ''租户编码'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT=''测试书籍'';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_book`
--

LOCK TABLES `test_book` WRITE;
/*!40000 ALTER TABLE `test_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_tree_book`
--

DROP TABLE IF EXISTS `test_tree_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_tree_book` (
  `id` varchar(32) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT ''父菜单IDs'',
  `name` varchar(50) DEFAULT NULL COMMENT ''部门名称'',
  `sort` int DEFAULT NULL COMMENT ''排序'',
  `leaf` bit(1) DEFAULT b''0'' COMMENT ''1 叶子节点 0 非叶子节点'',
  `author_` varchar(50) NOT NULL COMMENT ''作者'',
  `email_` varchar(100) DEFAULT NULL COMMENT ''邮箱'',
  `phone_` varchar(32) DEFAULT NULL COMMENT ''手机'',
  `activated_` bit(1) NOT NULL,
  `number_` int DEFAULT NULL COMMENT ''key'',
  `money_` decimal(20,2) DEFAULT NULL,
  `amount_` double(11,2) DEFAULT NULL,
  `reset_date` timestamp(3) NULL DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT ''创建时间'',
  `last_modified_by` varchar(50) DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''0'' COMMENT ''0-正常，1-删除'',
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT ''修改时间'',
  `version` int NOT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT ''描述'',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '''' COMMENT ''租户编码'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT=''  测试树书'';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_tree_book`
--

LOCK TABLES `test_tree_book` WRITE;
/*!40000 ALTER TABLE `test_tree_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_tree_book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-22 14:08:57
