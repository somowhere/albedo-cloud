/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : albedo-gen

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 20/09/2020 14:41:03
*/
DROP DATABASE IF EXISTS `albedo-gen`;

CREATE DATABASE  `albedo-gen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE `albedo-gen`;

-- ----------------------------
-- Table structure for gen_datasource_conf
-- ----------------------------
DROP TABLE IF EXISTS `gen_datasource_conf`;
CREATE TABLE `gen_datasource_conf` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'url',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  `version` int DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据源表';

-- ----------------------------
-- Records of gen_datasource_conf
-- ----------------------------
BEGIN;
INSERT INTO `gen_datasource_conf` VALUES ('4a56eae38c1efba4b3a55153a0616ba9', 'albedoGen', 'jdbc:mysql://albedo-mysql:3306/albedo-gen', 'root', 'z4aETx/0mMW0mfZByjM8dQ==', '0', 0, NULL, '1', '2020-09-20 12:49:48.862', '1', '2020-09-20 12:49:48.862');
INSERT INTO `gen_datasource_conf` VALUES ('893af6088511440a2998c9277886ec76', 'albedoCloud', 'jdbc:mysql://albedo-mysql:3306/albedo-cloud', 'root', 'egwpbMYBPEimOtvJRoPiag==', '0', 2, NULL, '1', '2020-09-20 10:48:25.392', '1', '2020-09-20 13:06:55.370');
COMMIT;

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `view_type` char(2) DEFAULT NULL COMMENT '视图类型 0  普通表格 1  表格采用ajax刷新',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `version` int DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='生成方案';

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
BEGIN;
INSERT INTO `gen_scheme` VALUES ('2216d96cfe208261688d10295a40b862', '数据源', 'curd', NULL, 'com.albedo.java.modules', 'gen', NULL, '数据源', '数据源', 'somewhere', '282bc2de9fab41947d2a26a59787b735', 1, NULL, '1', '2020-09-20 14:11:34.204', '1', '2020-09-20 14:11:07.391', '1');
INSERT INTO `gen_scheme` VALUES ('8968837239f0c84207bf0cf441c1701f', '测试书籍', 'curd', NULL, 'com.albedo.java.modules', 'test', NULL, '测试书籍', '测试书籍', 'admin', '7cad1d7c638e03f74cf95266d18495d6', 1, NULL, '1', '2020-09-20 14:11:34.204', '1', '2020-09-20 14:11:09.586', '1');
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实体类名称',
  `ds_name` varchar(255) DEFAULT NULL COMMENT '数据源',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `version` int DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `gen_table_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES ('1d63d9cfd59470742b8bb4f66b172020', 'test_tree_book', '  测试树书', 'TestTreeBook', 'albedoGen', NULL, NULL, 0, NULL, '1', '2020-09-20 14:11:24.890', '1', '2020-09-20 14:05:03.946', '1');
INSERT INTO `gen_table` VALUES ('282bc2de9fab41947d2a26a59787b735', 'gen_datasource_conf', '数据源表', 'DatasourceConf', 'albedoGen', NULL, NULL, 1, NULL, '1', '2020-09-20 14:11:24.926', '1', '2020-09-20 11:11:24.426', '1');
INSERT INTO `gen_table` VALUES ('7cad1d7c638e03f74cf95266d18495d6', 'test_book', '测试书籍', 'TestBook', 'albedoGen', NULL, NULL, 0, NULL, '1', '2020-09-20 14:11:24.995', '1', '2020-06-07 11:57:29.575', '1');
INSERT INTO `gen_table` VALUES ('d13c98724e8094718e31878a5bdacebe', 'sys_oauth_client_detail', '终端信息表', 'OauthClientDetail', 'albedoCloud', NULL, NULL, 0, NULL, '1', '2020-09-20 14:11:24.960', '1', '2020-09-20 14:10:42.598', '1');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述备注',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` bit(1) DEFAULT NULL COMMENT '是否主键',
  `is_unique` bit(1) DEFAULT NULL COMMENT '是否唯一（1：是；0：否）',
  `is_null` bit(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` bit(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` bit(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` bit(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` bit(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `version` int DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gen_table_column_table_id` (`gen_table_id`) USING BTREE,
  KEY `gen_table_column_name` (`name`) USING BTREE,
  KEY `gen_table_column_sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES ('02b8f1ce1f168a15523b6bdb94c85f42', 'd13c98724e8094718e31878a5bdacebe', 'resource_ids', '资源ID', NULL, 'varchar(256)', 'String', 'resourceIds', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 20, 0, NULL, '1', '2020-09-20 14:10:48.973', '1', '2020-09-20 14:10:42.617', '1');
INSERT INTO `gen_table_column` VALUES ('0611b03437dc21931c6195454def0fea', '7cad1d7c638e03f74cf95266d18495d6', 'last_modified_by', 'last_modified_by', NULL, 'varchar(50)', 'String', 'lastModifiedBy', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 140, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.635', '1');
INSERT INTO `gen_table_column` VALUES ('07f4ef2b55f5a8db55ccf46ca463061a', 'd13c98724e8094718e31878a5bdacebe', 'access_token_validity', '请求令牌有效时间', NULL, 'int', 'Long', 'accessTokenValidity', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 80, 0, NULL, '1', '2020-09-20 14:11:24.974', '1', '2020-09-20 14:10:50.866', '1');
INSERT INTO `gen_table_column` VALUES ('09dd9f7bf365f4eb987d40f4cc894637', '7cad1d7c638e03f74cf95266d18495d6', 'phone_', '手机', NULL, 'varchar(32)', 'String', 'phone', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 60, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.623', '1');
INSERT INTO `gen_table_column` VALUES ('0ce811e04d10bb38170d8ad06bdb1ff3', 'd13c98724e8094718e31878a5bdacebe', 'refresh_token_validity', '刷新令牌有效时间', NULL, 'int', 'Long', 'refreshTokenValidity', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 90, 0, NULL, '1', '2020-09-20 14:10:48.973', '1', '2020-09-20 14:10:42.625', '1');
INSERT INTO `gen_table_column` VALUES ('0d822b9eba68c84389cf1b196779b44c', '1d63d9cfd59470742b8bb4f66b172020', 'number_', 'key', NULL, 'int', 'Long', 'number', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 110, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.152', '1');
INSERT INTO `gen_table_column` VALUES ('0da483b4d618db57a660752695278505', '7cad1d7c638e03f74cf95266d18495d6', 'del_flag', '0-正常，1-删除', NULL, 'char(1)', 'String', 'delFlag', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'radio', 'sys_flag', NULL, 180, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.356', '1');
INSERT INTO `gen_table_column` VALUES ('0dc508e60af803e84a7f18bccf9d9704', 'd13c98724e8094718e31878a5bdacebe', 'autoapprove', '是否自动放行', NULL, 'varchar(256)', 'String', 'autoapprove', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 110, 0, NULL, '1', '2020-09-20 14:10:48.973', '1', '2020-09-20 14:10:42.627', '1');
INSERT INTO `gen_table_column` VALUES ('0f2ba39663517eab096241e43d2536fe', '7cad1d7c638e03f74cf95266d18495d6', 'name_', '名称', NULL, 'varchar(50)', 'String', 'name', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 40, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.779', '1');
INSERT INTO `gen_table_column` VALUES ('1087c6a83b93364f69920a9a368500e8', '1d63d9cfd59470742b8bb4f66b172020', 'description', '备注', NULL, 'varchar(100)', 'String', 'description', b'0', b'0', b'1', b'1', b'1', b'0', b'0', 'eq', 'input', '', NULL, 210, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.172', '1');
INSERT INTO `gen_table_column` VALUES ('114211c2ee985eb9b6b19de4d561d1ac', '1d63d9cfd59470742b8bb4f66b172020', 'del_flag', '0-正常，1-删除', NULL, 'char(1)', 'String', 'delFlag', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'radio', 'sys_flag', NULL, 180, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.167', '1');
INSERT INTO `gen_table_column` VALUES ('1438570c6af38ae0555f01148518c195', '7cad1d7c638e03f74cf95266d18495d6', 'phone_', '手机', NULL, 'varchar(32)', 'String', 'phone', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 60, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.781', '1');
INSERT INTO `gen_table_column` VALUES ('17b2ef201f2e22fec727358305b975a2', '282bc2de9fab41947d2a26a59787b735', 'name', '名称', NULL, 'varchar(64)', 'String', 'name', b'0', b'1', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 20, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.331', '1');
INSERT INTO `gen_table_column` VALUES ('181e4fc7c1eb33b10d92662153d0c27a', '282bc2de9fab41947d2a26a59787b735', 'last_modified_date', 'last_modified_date', NULL, 'timestamp(3)', 'java.util.Date', 'lastModifiedDate', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 120, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.205', '1');
INSERT INTO `gen_table_column` VALUES ('1c702c73ef2564af1d58599a2cde70e0', '7cad1d7c638e03f74cf95266d18495d6', 'author_', '作者', NULL, 'varchar(50)', 'String', 'author', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.777', '1');
INSERT INTO `gen_table_column` VALUES ('1d58c43cc373a7edbe741a3eb81a114c', '1d63d9cfd59470742b8bb4f66b172020', 'email_', '邮箱', NULL, 'varchar(100)', 'String', 'email', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 80, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.147', '1');
INSERT INTO `gen_table_column` VALUES ('1e4464c793d47b71d47668db14bea61c', '1d63d9cfd59470742b8bb4f66b172020', 'sort', '排序', NULL, 'int', 'Long', 'sort', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.140', '1');
INSERT INTO `gen_table_column` VALUES ('1ec15295197f52b3679534800bd6306b', '282bc2de9fab41947d2a26a59787b735', 'del_flag', '0-正常，1-删除', NULL, 'char(1)', 'String', 'delFlag', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'radio', 'sys_flag', NULL, 60, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.197', '1');
INSERT INTO `gen_table_column` VALUES ('1ed5de156c06ad93fae0b1848bf25285', '1d63d9cfd59470742b8bb4f66b172020', 'name', '部门名称', NULL, 'varchar(50)', 'String', 'name', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 40, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.135', '1');
INSERT INTO `gen_table_column` VALUES ('2243a26a57a05b6cc13fe3e09da53930', '7cad1d7c638e03f74cf95266d18495d6', 'last_modified_date', 'last_modified_date', NULL, 'timestamp(3)', 'java.util.Date', 'lastModifiedDate', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 150, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.354', '1');
INSERT INTO `gen_table_column` VALUES ('243cec51e2049f929290bb1a39217480', '7cad1d7c638e03f74cf95266d18495d6', 'email_', '邮箱', NULL, 'varchar(100)', 'String', 'email', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.346', '1');
INSERT INTO `gen_table_column` VALUES ('2475c754df089d65a716eee2cfacf686', '7cad1d7c638e03f74cf95266d18495d6', 'email_', '邮箱', NULL, 'varchar(100)', 'String', 'email', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.780', '1');
INSERT INTO `gen_table_column` VALUES ('280346c5455813eb4992287020f86cb5', 'd13c98724e8094718e31878a5bdacebe', 'client_id', '客户端ID', NULL, 'varchar(32)', 'String', 'clientId', b'1', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 10, 0, NULL, '1', '2020-09-20 14:10:50.545', '1', '2020-09-20 14:10:49.230', '1');
INSERT INTO `gen_table_column` VALUES ('2bdbfe09f3a77567eeb3f178a34555b7', '7cad1d7c638e03f74cf95266d18495d6', 'amount_', 'amount_', NULL, 'double(11,2)', 'Double', 'amount', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 100, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.350', '1');
INSERT INTO `gen_table_column` VALUES ('2f29482ca08d4cecfec13e4906d27202', '7cad1d7c638e03f74cf95266d18495d6', 'phone_', '手机', NULL, 'varchar(32)', 'String', 'phone', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 60, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.347', '1');
INSERT INTO `gen_table_column` VALUES ('2fd8520c98563235f464218d60232719', '7cad1d7c638e03f74cf95266d18495d6', 'money_', 'money_', NULL, 'decimal(20,2)', 'Double', 'money', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 90, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.784', '1');
INSERT INTO `gen_table_column` VALUES ('3016b4bc50f9de5727fd1b9f736f69d5', '282bc2de9fab41947d2a26a59787b735', 'created_date', 'created_date', NULL, 'timestamp(3)', 'java.util.Date', 'createdDate', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 100, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.466', '1');
INSERT INTO `gen_table_column` VALUES ('32540e2d21671c0687d25f36662f0141', '7cad1d7c638e03f74cf95266d18495d6', 'id', 'id', NULL, 'varchar(32)', 'String', 'id', b'1', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 10, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.773', '1');
INSERT INTO `gen_table_column` VALUES ('3259796c903fd6307be18d0cf57bf600', 'd13c98724e8094718e31878a5bdacebe', 'client_id', '客户端ID', NULL, 'varchar(32)', 'String', 'clientId', b'1', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 10, 0, NULL, '1', '2020-09-20 14:11:24.974', '1', '2020-09-20 14:10:50.853', '1');
INSERT INTO `gen_table_column` VALUES ('330ce873d01cd89621662dc46becb9d2', 'd13c98724e8094718e31878a5bdacebe', 'authorized_grant_types', '授权方式', NULL, 'varchar(256)', 'String', 'authorizedGrantTypes', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 0, NULL, '1', '2020-09-20 14:11:24.974', '1', '2020-09-20 14:10:50.862', '1');
INSERT INTO `gen_table_column` VALUES ('359538b842a56acea433594bdb846779', '1d63d9cfd59470742b8bb4f66b172020', 'activated_', 'activated_', NULL, 'bit(1)', 'Integer', 'activated', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 100, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.150', '1');
INSERT INTO `gen_table_column` VALUES ('39b82ac57b140bc0c341514ed0ef5285', '7cad1d7c638e03f74cf95266d18495d6', 'number_', 'key', NULL, 'int(11)', 'Long', 'number', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 80, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.626', '1');
INSERT INTO `gen_table_column` VALUES ('3c47eb6445d63b3dd4aecbca3ae3f2d1', '7cad1d7c638e03f74cf95266d18495d6', 'activated_', 'activated_', NULL, 'bit(1)', 'Integer', 'activated', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 70, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.348', '1');
INSERT INTO `gen_table_column` VALUES ('3c82fc71ffbe2effeb5d0c4f070d352e', 'd13c98724e8094718e31878a5bdacebe', 'scope', '作用域', NULL, 'varchar(256)', 'String', 'scope', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 40, 0, NULL, '1', '2020-09-20 14:11:24.974', '1', '2020-09-20 14:10:50.860', '1');
INSERT INTO `gen_table_column` VALUES ('3d558924ff8c598a863fc4a53efe8cf3', 'd13c98724e8094718e31878a5bdacebe', 'web_server_redirect_uri', '重定向地址', NULL, 'varchar(256)', 'String', 'webServerRedirectUri', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 60, 0, NULL, '1', '2020-09-20 14:10:50.545', '1', '2020-09-20 14:10:49.240', '1');
INSERT INTO `gen_table_column` VALUES ('3ef433e90fb63ee7d56079a3d2735e06', '7cad1d7c638e03f74cf95266d18495d6', 'title_', '标题', NULL, 'varchar(32)', 'String', 'title', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 20, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.776', '1');
INSERT INTO `gen_table_column` VALUES ('413ed0efcb957509deb3b88bd58ae89f', '1d63d9cfd59470742b8bb4f66b172020', 'created_date', '创建时间', NULL, 'timestamp(3)', 'java.util.Date', 'createdDate', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 160, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.163', '1');
INSERT INTO `gen_table_column` VALUES ('45b08a556bc9d163565790c2b4ec5fd9', '1d63d9cfd59470742b8bb4f66b172020', 'phone_', '手机', NULL, 'varchar(32)', 'String', 'phone', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 90, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.149', '1');
INSERT INTO `gen_table_column` VALUES ('46951fd7445e7f3b98b101866fb0f1ab', 'd13c98724e8094718e31878a5bdacebe', 'web_server_redirect_uri', '重定向地址', NULL, 'varchar(256)', 'String', 'webServerRedirectUri', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 60, 0, NULL, '1', '2020-09-20 14:11:24.974', '1', '2020-09-20 14:10:50.863', '1');
INSERT INTO `gen_table_column` VALUES ('49117967d056c80c70677e678989f794', '1d63d9cfd59470742b8bb4f66b172020', 'amount_', 'amount_', NULL, 'double(11,2)', 'Double', 'amount', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 130, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.155', '1');
INSERT INTO `gen_table_column` VALUES ('50b0eb5a4f7575b06dd3e2b4c62a2060', 'd13c98724e8094718e31878a5bdacebe', 'refresh_token_validity', '刷新令牌有效时间', NULL, 'int', 'Long', 'refreshTokenValidity', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 90, 0, NULL, '1', '2020-09-20 14:11:24.974', '1', '2020-09-20 14:10:50.868', '1');
INSERT INTO `gen_table_column` VALUES ('5340b60a8315482f84f9f9b3591cd33b', 'd13c98724e8094718e31878a5bdacebe', 'additional_information', '扩展信息', NULL, 'varchar(4096)', 'String', 'additionalInformation', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 100, 0, NULL, '1', '2020-09-20 14:11:24.974', '1', '2020-09-20 14:10:50.869', '1');
INSERT INTO `gen_table_column` VALUES ('5aed53f90896e104f094577ce8bcc180', '282bc2de9fab41947d2a26a59787b735', 'last_modified_by', 'last_modified_by', NULL, 'varchar(50)', 'String', 'lastModifiedBy', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 110, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.479', '1');
INSERT INTO `gen_table_column` VALUES ('5bc1f9beb2abd7039d6881667a67b482', '7cad1d7c638e03f74cf95266d18495d6', 'del_flag', '0-正常，1-删除', NULL, 'char(1)', 'String', 'delFlag', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'radio', 'sys_flag', NULL, 180, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.643', '1');
INSERT INTO `gen_table_column` VALUES ('5e836acc457ddc3b15ccd83962465b2e', '7cad1d7c638e03f74cf95266d18495d6', 'email_', '邮箱', NULL, 'varchar(100)', 'String', 'email', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.620', '1');
INSERT INTO `gen_table_column` VALUES ('6134d65acf10341f918040071d435915', '7cad1d7c638e03f74cf95266d18495d6', 'title_', '标题', NULL, 'varchar(32)', 'String', 'title', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 20, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.343', '1');
INSERT INTO `gen_table_column` VALUES ('61b03dc3a7f7fe79100f16c8ba0c3151', 'd13c98724e8094718e31878a5bdacebe', 'scope', '作用域', NULL, 'varchar(256)', 'String', 'scope', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 40, 0, NULL, '1', '2020-09-20 14:10:48.973', '1', '2020-09-20 14:10:42.619', '1');
INSERT INTO `gen_table_column` VALUES ('6961cd941d9f3b5323e7cfb89ac0b2a4', '1d63d9cfd59470742b8bb4f66b172020', 'money_', 'money_', NULL, 'decimal(20,2)', 'Double', 'money', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 120, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.153', '1');
INSERT INTO `gen_table_column` VALUES ('69f73577ae1369418c8e5da89c5e4f45', 'd13c98724e8094718e31878a5bdacebe', 'access_token_validity', '请求令牌有效时间', NULL, 'int', 'Long', 'accessTokenValidity', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 80, 0, NULL, '1', '2020-09-20 14:10:50.545', '1', '2020-09-20 14:10:49.243', '1');
INSERT INTO `gen_table_column` VALUES ('6a0a9b8cc485607323cdfe6333c4e49a', '1d63d9cfd59470742b8bb4f66b172020', 'parent_id', 'parent_id', NULL, 'varchar(32)', 'String', 'parentId', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 20, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.131', '1');
INSERT INTO `gen_table_column` VALUES ('6bd6d07ee724fc1d36379771e207e645', '7cad1d7c638e03f74cf95266d18495d6', 'version', 'version', NULL, 'int', 'Long', 'version', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 170, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.356', '1');
INSERT INTO `gen_table_column` VALUES ('6cc32f2c877c1b5b20d25dd5e3e43908', 'd13c98724e8094718e31878a5bdacebe', 'additional_information', '扩展信息', NULL, 'varchar(4096)', 'String', 'additionalInformation', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 100, 0, NULL, '1', '2020-09-20 14:10:48.973', '1', '2020-09-20 14:10:42.626', '1');
INSERT INTO `gen_table_column` VALUES ('6d72f94d13cd989b679b6146e2134785', '282bc2de9fab41947d2a26a59787b735', 'version', '默认0，必填，离线乐观锁', NULL, 'int', 'Long', 'version', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 70, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.198', '1');
INSERT INTO `gen_table_column` VALUES ('6d917ca2b26569cbf67699f66da4899f', '7cad1d7c638e03f74cf95266d18495d6', 'id', 'id', NULL, 'varchar(32)', 'String', 'id', b'1', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 10, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.606', '1');
INSERT INTO `gen_table_column` VALUES ('708564467651c280c142a9459b034249', '7cad1d7c638e03f74cf95266d18495d6', 'reset_date', 'reset_date', NULL, 'timestamp(3)', 'java.util.Date', 'resetDate', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'dateselect', '', NULL, 110, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.786', '1');
INSERT INTO `gen_table_column` VALUES ('70e2fa6ab7f5eadaaaa1b1987284cbf9', '7cad1d7c638e03f74cf95266d18495d6', 'author_', '作者', NULL, 'varchar(50)', 'String', 'author', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.615', '1');
INSERT INTO `gen_table_column` VALUES ('7176f84c7875628111ee6b227d69d221', '7cad1d7c638e03f74cf95266d18495d6', 'id', 'id', NULL, 'varchar(32)', 'String', 'id', b'1', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 10, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.340', '1');
INSERT INTO `gen_table_column` VALUES ('73cd778f285c141ef4186666c53419e3', '1d63d9cfd59470742b8bb4f66b172020', 'reset_date', 'reset_date', NULL, 'timestamp(3)', 'java.util.Date', 'resetDate', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'dateselect', '', NULL, 140, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.158', '1');
INSERT INTO `gen_table_column` VALUES ('740b030b75eb77b5bd9af3467ce760f3', '1d63d9cfd59470742b8bb4f66b172020', 'last_modified_date', '修改时间', NULL, 'timestamp(3)', 'java.util.Date', 'lastModifiedDate', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 190, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.168', '1');
INSERT INTO `gen_table_column` VALUES ('773cb798397086fc931c043c97c6f6db', 'd13c98724e8094718e31878a5bdacebe', 'autoapprove', '是否自动放行', NULL, 'varchar(256)', 'String', 'autoapprove', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 110, 0, NULL, '1', '2020-09-20 14:11:24.974', '1', '2020-09-20 14:10:50.871', '1');
INSERT INTO `gen_table_column` VALUES ('77a828833a1b64940a1f82b45f924c1c', '7cad1d7c638e03f74cf95266d18495d6', 'name_', '名称', NULL, 'varchar(50)', 'String', 'name', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 40, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.617', '1');
INSERT INTO `gen_table_column` VALUES ('7bce765829fcc6bdec26aa98bccd6aea', '7cad1d7c638e03f74cf95266d18495d6', 'last_modified_by', 'last_modified_by', NULL, 'varchar(50)', 'String', 'lastModifiedBy', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 140, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.353', '1');
INSERT INTO `gen_table_column` VALUES ('7f37f3cea3a7824c277837def6946c75', 'd13c98724e8094718e31878a5bdacebe', 'refresh_token_validity', '刷新令牌有效时间', NULL, 'int', 'Long', 'refreshTokenValidity', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 90, 0, NULL, '1', '2020-09-20 14:10:50.545', '1', '2020-09-20 14:10:49.244', '1');
INSERT INTO `gen_table_column` VALUES ('83e89e6ea3b5fad53a5d8e9b5e085857', '282bc2de9fab41947d2a26a59787b735', 'last_modified_date', 'last_modified_date', NULL, 'timestamp(3)', 'java.util.Date', 'lastModifiedDate', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 120, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.493', '1');
INSERT INTO `gen_table_column` VALUES ('8616c5075f812c5138566b9007c9fb44', '7cad1d7c638e03f74cf95266d18495d6', 'created_date', 'created_date', NULL, 'timestamp(3)', 'java.util.Date', 'createdDate', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 130, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.787', '1');
INSERT INTO `gen_table_column` VALUES ('872d52793a5c8d2192df326c3c03b67e', '7cad1d7c638e03f74cf95266d18495d6', 'created_date', 'created_date', NULL, 'timestamp(3)', 'java.util.Date', 'createdDate', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 130, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.353', '1');
INSERT INTO `gen_table_column` VALUES ('87cd4951ed2a7cff9aedc06aad7d92c6', '7cad1d7c638e03f74cf95266d18495d6', 'activated_', 'activated_', NULL, 'bit(1)', 'Integer', 'activated', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 70, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.782', '1');
INSERT INTO `gen_table_column` VALUES ('8971e05fab1af6bbf4d4762e3484a295', '7cad1d7c638e03f74cf95266d18495d6', 'created_date', 'created_date', NULL, 'timestamp(3)', 'java.util.Date', 'createdDate', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 130, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.634', '1');
INSERT INTO `gen_table_column` VALUES ('8c3c6e03a86b719fa156e61e64ab3eef', 'd13c98724e8094718e31878a5bdacebe', 'client_id', '客户端ID', NULL, 'varchar(32)', 'String', 'clientId', b'1', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 10, 0, NULL, '1', '2020-09-20 14:10:48.973', '1', '2020-09-20 14:10:42.613', '1');
INSERT INTO `gen_table_column` VALUES ('8d4ca2d7ee78669590cc73e65da7f08d', '282bc2de9fab41947d2a26a59787b735', 'password', '密码', NULL, 'varchar(64)', 'String', 'password', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.195', '1');
INSERT INTO `gen_table_column` VALUES ('8d84c4c32140f90b16455c4a2827126c', 'd13c98724e8094718e31878a5bdacebe', 'additional_information', '扩展信息', NULL, 'varchar(4096)', 'String', 'additionalInformation', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 100, 0, NULL, '1', '2020-09-20 14:10:50.545', '1', '2020-09-20 14:10:49.245', '1');
INSERT INTO `gen_table_column` VALUES ('8e96468369872a0cb202691495590aaf', '7cad1d7c638e03f74cf95266d18495d6', 'last_modified_by', 'last_modified_by', NULL, 'varchar(50)', 'String', 'lastModifiedBy', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 140, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.788', '1');
INSERT INTO `gen_table_column` VALUES ('8f400b708460ec0f323e38027d04c34a', 'd13c98724e8094718e31878a5bdacebe', 'authorities', '权限', NULL, 'varchar(256)', 'String', 'authorities', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 70, 0, NULL, '1', '2020-09-20 14:10:50.545', '1', '2020-09-20 14:10:49.242', '1');
INSERT INTO `gen_table_column` VALUES ('929872e3a048d7b2a934d7409d1c7b7e', '1d63d9cfd59470742b8bb4f66b172020', 'author_', '作者', NULL, 'varchar(50)', 'String', 'author', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 70, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.145', '1');
INSERT INTO `gen_table_column` VALUES ('9622c085726724a78c4867d7c335eaa7', '282bc2de9fab41947d2a26a59787b735', 'last_modified_by', 'last_modified_by', NULL, 'varchar(50)', 'String', 'lastModifiedBy', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 110, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.204', '1');
INSERT INTO `gen_table_column` VALUES ('968b59748a4b81cc2e83ccd5bb5db6e3', '7cad1d7c638e03f74cf95266d18495d6', 'amount_', 'amount_', NULL, 'double(11,2)', 'Double', 'amount', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 100, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.785', '1');
INSERT INTO `gen_table_column` VALUES ('98212cfc59be61c719c980cf5f002221', 'd13c98724e8094718e31878a5bdacebe', 'autoapprove', '是否自动放行', NULL, 'varchar(256)', 'String', 'autoapprove', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 110, 0, NULL, '1', '2020-09-20 14:10:50.545', '1', '2020-09-20 14:10:49.246', '1');
INSERT INTO `gen_table_column` VALUES ('98ee1505d0449d67a53e85b5f8807df1', '282bc2de9fab41947d2a26a59787b735', 'url', 'url', NULL, 'varchar(255)', 'String', 'url', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.193', '1');
INSERT INTO `gen_table_column` VALUES ('a1b2d01a0cc25387e5e7a41313518ca4', '1d63d9cfd59470742b8bb4f66b172020', 'leaf', '叶子节点', NULL, 'bit(1)', 'Integer', 'leaf', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 60, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.143', '1');
INSERT INTO `gen_table_column` VALUES ('a595c9d3233ef1b3ec0b9ebcbfe1a2f1', 'd13c98724e8094718e31878a5bdacebe', 'client_secret', '客户端密钥', NULL, 'varchar(256)', 'String', 'clientSecret', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 0, NULL, '1', '2020-09-20 14:11:24.974', '1', '2020-09-20 14:10:50.859', '1');
INSERT INTO `gen_table_column` VALUES ('a992cb9fe1eb3082dffce8559b3f21cb', '282bc2de9fab41947d2a26a59787b735', 'id', '主键', NULL, 'int', 'Long', 'id', b'1', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 10, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.141', '1');
INSERT INTO `gen_table_column` VALUES ('af5c512e95e03fe561a079a5d077fbc5', '7cad1d7c638e03f74cf95266d18495d6', 'money_', 'money_', NULL, 'decimal(20,2)', 'Double', 'money', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 90, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.628', '1');
INSERT INTO `gen_table_column` VALUES ('af60dc1d1768e00f56f6b3b652a67659', '1d63d9cfd59470742b8bb4f66b172020', 'created_by', 'created_by', NULL, 'varchar(50)', 'String', 'createdBy', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 150, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.160', '1');
INSERT INTO `gen_table_column` VALUES ('b1c4985f45e324560e408d9a534bbfa0', '7cad1d7c638e03f74cf95266d18495d6', 'number_', 'key', NULL, 'int', 'Long', 'number', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 80, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.783', '1');
INSERT INTO `gen_table_column` VALUES ('b58a7d447cca8f6c0d49ccf0e1619198', 'd13c98724e8094718e31878a5bdacebe', 'client_secret', '客户端密钥', NULL, 'varchar(256)', 'String', 'clientSecret', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 0, NULL, '1', '2020-09-20 14:10:48.973', '1', '2020-09-20 14:10:42.618', '1');
INSERT INTO `gen_table_column` VALUES ('b5e434804901668a686cd244ecfee16d', 'd13c98724e8094718e31878a5bdacebe', 'scope', '作用域', NULL, 'varchar(256)', 'String', 'scope', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 40, 0, NULL, '1', '2020-09-20 14:10:50.545', '1', '2020-09-20 14:10:49.238', '1');
INSERT INTO `gen_table_column` VALUES ('b60693d6d03db0e10125680ebf855c8a', '282bc2de9fab41947d2a26a59787b735', 'password', '密码', NULL, 'varchar(64)', 'String', 'password', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.396', '1');
INSERT INTO `gen_table_column` VALUES ('b70bc245c04b2794ff244a894acc1a73', '7cad1d7c638e03f74cf95266d18495d6', 'reset_date', 'reset_date', NULL, 'timestamp(3)', 'java.util.Date', 'resetDate', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'dateselect', '', NULL, 110, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.351', '1');
INSERT INTO `gen_table_column` VALUES ('b78401f34e823ddde7024ead792ebca9', '1d63d9cfd59470742b8bb4f66b172020', 'id', 'id', NULL, 'varchar(32)', 'String', 'id', b'1', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 10, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.121', '1');
INSERT INTO `gen_table_column` VALUES ('b7a9ccec14661b9b0aa4e2ef85f6b4da', '282bc2de9fab41947d2a26a59787b735', 'created_date', 'created_date', NULL, 'timestamp(3)', 'java.util.Date', 'createdDate', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 100, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.203', '1');
INSERT INTO `gen_table_column` VALUES ('bb69df4c11b95c4c8643dd5acad6877f', '7cad1d7c638e03f74cf95266d18495d6', 'del_flag', '0-正常，1-删除', NULL, 'char(1)', 'String', 'delFlag', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'radio', 'sys_flag', NULL, 180, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.792', '1');
INSERT INTO `gen_table_column` VALUES ('bd64c85b0288fae71e87c1b546da6333', '7cad1d7c638e03f74cf95266d18495d6', 'created_by', 'created_by', NULL, 'varchar(50)', 'String', 'createdBy', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 120, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.352', '1');
INSERT INTO `gen_table_column` VALUES ('c1e7548f0b79197ff6144bf6f692abf9', '1d63d9cfd59470742b8bb4f66b172020', 'last_modified_by', 'last_modified_by', NULL, 'varchar(50)', 'String', 'lastModifiedBy', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 170, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.165', '1');
INSERT INTO `gen_table_column` VALUES ('c29db843cdba8111042a3ed514b52816', '7cad1d7c638e03f74cf95266d18495d6', 'created_by', 'created_by', NULL, 'varchar(50)', 'String', 'createdBy', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 120, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.632', '1');
INSERT INTO `gen_table_column` VALUES ('c3acd4117409125fc55eebeba41e848f', '7cad1d7c638e03f74cf95266d18495d6', 'reset_date', 'reset_date', NULL, 'timestamp(3)', 'java.util.Date', 'resetDate', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'dateselect', '', NULL, 110, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.631', '1');
INSERT INTO `gen_table_column` VALUES ('c470d920784f9cb19b2d002e41358344', '282bc2de9fab41947d2a26a59787b735', 'username', '用户名', NULL, 'varchar(64)', 'String', 'username', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 40, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.375', '1');
INSERT INTO `gen_table_column` VALUES ('c524c5d7b19267ba76f756eef359610a', 'd13c98724e8094718e31878a5bdacebe', 'resource_ids', '资源ID', NULL, 'varchar(256)', 'String', 'resourceIds', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 20, 0, NULL, '1', '2020-09-20 14:10:50.545', '1', '2020-09-20 14:10:49.235', '1');
INSERT INTO `gen_table_column` VALUES ('c70ce133b37a2c21459bdce1519b0e90', '7cad1d7c638e03f74cf95266d18495d6', 'description', '备注', NULL, 'varchar(255)', 'String', 'description', b'0', b'0', b'1', b'1', b'1', b'0', b'0', 'eq', 'input', '', NULL, 160, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.640', '1');
INSERT INTO `gen_table_column` VALUES ('c82dbbc7ace7c5b5f0859678ebdee515', 'd13c98724e8094718e31878a5bdacebe', 'authorized_grant_types', '授权方式', NULL, 'varchar(256)', 'String', 'authorizedGrantTypes', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 0, NULL, '1', '2020-09-20 14:10:48.973', '1', '2020-09-20 14:10:42.620', '1');
INSERT INTO `gen_table_column` VALUES ('c865465db761d3426687508e05342934', '282bc2de9fab41947d2a26a59787b735', 'del_flag', '0-正常，1-删除', NULL, 'char(1)', 'String', 'delFlag', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'radio', 'sys_flag', NULL, 60, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.412', '1');
INSERT INTO `gen_table_column` VALUES ('c8cc82c7c49c6e90c2ec419d9f75c964', '7cad1d7c638e03f74cf95266d18495d6', 'name_', '名称', NULL, 'varchar(50)', 'String', 'name', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 40, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.345', '1');
INSERT INTO `gen_table_column` VALUES ('c90d52959eab753384ae0f12ba15bf5e', 'd13c98724e8094718e31878a5bdacebe', 'web_server_redirect_uri', '重定向地址', NULL, 'varchar(256)', 'String', 'webServerRedirectUri', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 60, 0, NULL, '1', '2020-09-20 14:10:48.973', '1', '2020-09-20 14:10:42.622', '1');
INSERT INTO `gen_table_column` VALUES ('cb51a518f6e0ca1c17b69c0d2e79cacd', 'd13c98724e8094718e31878a5bdacebe', 'resource_ids', '资源ID', NULL, 'varchar(256)', 'String', 'resourceIds', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 20, 0, NULL, '1', '2020-09-20 14:11:24.974', '1', '2020-09-20 14:10:50.857', '1');
INSERT INTO `gen_table_column` VALUES ('cbcc8032a543c6e20d78ca93d3c3952e', '7cad1d7c638e03f74cf95266d18495d6', 'title_', '标题', NULL, 'varchar(32)', 'String', 'title', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 20, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.614', '1');
INSERT INTO `gen_table_column` VALUES ('cf3133c77ac602f7bf80bdc7aeef3c86', '282bc2de9fab41947d2a26a59787b735', 'description', '备注', NULL, 'varchar(255)', 'String', 'description', b'0', b'0', b'1', b'1', b'1', b'0', b'0', 'eq', 'input', '', NULL, 80, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.199', '1');
INSERT INTO `gen_table_column` VALUES ('cff77a5d8d037ec2e55559cb0967c8d1', '7cad1d7c638e03f74cf95266d18495d6', 'number_', 'key', NULL, 'int', 'Long', 'number', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 80, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.348', '1');
INSERT INTO `gen_table_column` VALUES ('d160befb5273591904330a4facd662d1', 'd13c98724e8094718e31878a5bdacebe', 'authorized_grant_types', '授权方式', NULL, 'varchar(256)', 'String', 'authorizedGrantTypes', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 0, NULL, '1', '2020-09-20 14:10:50.545', '1', '2020-09-20 14:10:49.239', '1');
INSERT INTO `gen_table_column` VALUES ('d316609495c4f6fc93c81a54a9e0c8a6', '282bc2de9fab41947d2a26a59787b735', 'name', '名称', NULL, 'varchar(64)', 'String', 'name', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 20, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.191', '1');
INSERT INTO `gen_table_column` VALUES ('d7538fabddefec3588446b5a56397ab3', '1d63d9cfd59470742b8bb4f66b172020', 'version', 'version', NULL, 'int', 'Long', 'version', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 200, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.170', '1');
INSERT INTO `gen_table_column` VALUES ('d98f52b608425ecec9fd2440970c6067', '7cad1d7c638e03f74cf95266d18495d6', 'money_', 'money_', NULL, 'decimal(20,2)', 'Double', 'money', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 90, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.349', '1');
INSERT INTO `gen_table_column` VALUES ('dac038d1d5aecfdd367e2fa54677f029', 'd13c98724e8094718e31878a5bdacebe', 'client_secret', '客户端密钥', NULL, 'varchar(256)', 'String', 'clientSecret', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 0, NULL, '1', '2020-09-20 14:10:50.545', '1', '2020-09-20 14:10:49.236', '1');
INSERT INTO `gen_table_column` VALUES ('dafbde84423d5f612ee63b2b14c2f3df', '282bc2de9fab41947d2a26a59787b735', 'url', 'url', NULL, 'varchar(255)', 'String', 'url', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.352', '1');
INSERT INTO `gen_table_column` VALUES ('db9eed0b3179b475db4062dd5cf436bf', '7cad1d7c638e03f74cf95266d18495d6', 'created_by', 'created_by', NULL, 'varchar(50)', 'String', 'createdBy', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 120, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.786', '1');
INSERT INTO `gen_table_column` VALUES ('e0174d0d336e6dcc2eb1e375b800b711', '7cad1d7c638e03f74cf95266d18495d6', 'last_modified_date', 'last_modified_date', NULL, 'timestamp(3)', 'java.util.Date', 'lastModifiedDate', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 150, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.789', '1');
INSERT INTO `gen_table_column` VALUES ('e2caafbe3699439c90141dbdea0c4e73', '1d63d9cfd59470742b8bb4f66b172020', 'parent_ids', '父菜单IDs', NULL, 'varchar(2000)', 'String', 'parentIds', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 0, NULL, '1', '2020-09-20 14:11:24.909', '1', '2020-09-20 14:05:04.133', '1');
INSERT INTO `gen_table_column` VALUES ('e4e0e1910c2435cfc506aa3b04655df6', '7cad1d7c638e03f74cf95266d18495d6', 'amount_', 'amount_', NULL, 'double(11,2)', 'Double', 'amount', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 100, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.630', '1');
INSERT INTO `gen_table_column` VALUES ('e6623d35fc69ef013e15a209c375220e', '7cad1d7c638e03f74cf95266d18495d6', 'author_', '作者', NULL, 'varchar(50)', 'String', 'author', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.344', '1');
INSERT INTO `gen_table_column` VALUES ('e7fd7d7791401287583885ee1949419a', '7cad1d7c638e03f74cf95266d18495d6', 'description', '备注', NULL, 'varchar(255)', 'String', 'description', b'0', b'0', b'1', b'1', b'1', b'0', b'0', 'eq', 'input', '', NULL, 160, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.790', '1');
INSERT INTO `gen_table_column` VALUES ('e89d5a95220cc9e374600c434bac7650', '7cad1d7c638e03f74cf95266d18495d6', 'description', '备注', NULL, 'varchar(255)', 'String', 'description', b'0', b'0', b'1', b'1', b'1', b'0', b'0', 'eq', 'input', '', NULL, 160, 0, NULL, '1', '2020-09-20 14:11:25.010', '1', '2020-09-20 14:10:53.355', '1');
INSERT INTO `gen_table_column` VALUES ('e97d1350649d39693f322bea5500ed6a', '282bc2de9fab41947d2a26a59787b735', 'created_by', 'created_by', NULL, 'varchar(50)', 'String', 'createdBy', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 90, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.454', '1');
INSERT INTO `gen_table_column` VALUES ('eabb120f423fccf823ecb5356d31c74d', '7cad1d7c638e03f74cf95266d18495d6', 'activated_', 'activated_', NULL, 'bit(1)', 'Integer', 'activated', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 70, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.624', '1');
INSERT INTO `gen_table_column` VALUES ('ed227363e9017ec47c47994db94eacf4', '282bc2de9fab41947d2a26a59787b735', 'id', '主键', NULL, 'varchar(64)', 'String', 'id', b'1', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 10, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.187', '1');
INSERT INTO `gen_table_column` VALUES ('ef8d26942b398ee03ca4f11f9da2fa11', 'd13c98724e8094718e31878a5bdacebe', 'authorities', '权限', NULL, 'varchar(256)', 'String', 'authorities', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 70, 0, NULL, '1', '2020-09-20 14:11:24.974', '1', '2020-09-20 14:10:50.865', '1');
INSERT INTO `gen_table_column` VALUES ('efd9d90d6be292074b8b90e20769a079', 'd13c98724e8094718e31878a5bdacebe', 'access_token_validity', '请求令牌有效时间', NULL, 'int', 'Long', 'accessTokenValidity', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 80, 0, NULL, '1', '2020-09-20 14:10:48.973', '1', '2020-09-20 14:10:42.624', '1');
INSERT INTO `gen_table_column` VALUES ('f725728ee6ecb9a1e68816ed9c17e816', 'd13c98724e8094718e31878a5bdacebe', 'authorities', '权限', NULL, 'varchar(256)', 'String', 'authorities', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 70, 0, NULL, '1', '2020-09-20 14:10:48.973', '1', '2020-09-20 14:10:42.623', '1');
INSERT INTO `gen_table_column` VALUES ('f729799a92a0c4d872a1a6e9a3f40a4f', '7cad1d7c638e03f74cf95266d18495d6', 'version', 'version', NULL, 'int', 'Long', 'version', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 170, 0, NULL, '1', '2020-09-20 14:10:52.919', '1', '2020-09-20 14:05:12.791', '1');
INSERT INTO `gen_table_column` VALUES ('f950ebe32f121efc24ba9fc0dfd2f46c', '282bc2de9fab41947d2a26a59787b735', 'created_by', 'created_by', NULL, 'varchar(50)', 'String', 'createdBy', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 90, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.201', '1');
INSERT INTO `gen_table_column` VALUES ('f9a1bfb44facebf06ea0982c2d5cd849', '7cad1d7c638e03f74cf95266d18495d6', 'version', 'version', NULL, 'int(11)', 'Long', 'version', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 170, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.641', '1');
INSERT INTO `gen_table_column` VALUES ('fb2f2d75d84694205a4846e27884cd6c', '282bc2de9fab41947d2a26a59787b735', 'version', '默认0，必填，离线乐观锁', NULL, 'int', 'Long', 'version', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 70, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.426', '1');
INSERT INTO `gen_table_column` VALUES ('fbaed61eb06279371840eb21e1458e2a', '282bc2de9fab41947d2a26a59787b735', 'description', '备注', NULL, 'varchar(255)', 'String', 'description', b'0', b'0', b'1', b'1', b'1', b'0', b'0', 'eq', 'input', '', NULL, 80, 2, NULL, '1', '2020-09-20 14:10:55.827', '1', '2020-09-20 13:52:34.439', '1');
INSERT INTO `gen_table_column` VALUES ('fc39e0964ecc4f4a8a7351431a91cdfb', '282bc2de9fab41947d2a26a59787b735', 'username', '用户名', NULL, 'varchar(64)', 'String', 'username', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 40, 0, NULL, '1', '2020-09-20 14:11:24.945', '1', '2020-09-20 14:10:56.194', '1');
INSERT INTO `gen_table_column` VALUES ('ffa4d6ee1dc208a077165a05df83cc49', '7cad1d7c638e03f74cf95266d18495d6', 'last_modified_date', 'last_modified_date', NULL, 'timestamp(3)', 'java.util.Date', 'lastModifiedDate', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 150, 0, NULL, '1', '2020-09-20 14:05:12.311', '1', '2020-06-07 11:57:29.638', '1');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_fk
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_fk`;
CREATE TABLE `gen_table_fk` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_unique` char(1) DEFAULT '0' COMMENT '是否唯一（1：是；0：否）',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `version` int DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gen_table_column_table_id` (`gen_table_id`) USING BTREE,
  KEY `gen_table_column_name` (`name`) USING BTREE,
  KEY `gen_table_column_sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_fk
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for test_book
-- ----------------------------
DROP TABLE IF EXISTS `test_book`;
CREATE TABLE `test_book` (
  `id` varchar(32) NOT NULL,
  `title_` varchar(32) DEFAULT NULL COMMENT '标题',
  `author_` varchar(50) NOT NULL COMMENT '作者',
  `name_` varchar(50) DEFAULT NULL COMMENT '名称',
  `email_` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone_` varchar(32) DEFAULT NULL COMMENT '手机',
  `activated_` bit(1) NOT NULL,
  `number_` int DEFAULT NULL COMMENT 'key',
  `money_` decimal(20,2) DEFAULT NULL,
  `amount_` double(11,2) DEFAULT NULL,
  `reset_date` timestamp(3) NULL DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `version` int DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='测试书籍';

-- ----------------------------
-- Records of test_book
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for test_tree_book
-- ----------------------------
DROP TABLE IF EXISTS `test_tree_book`;
CREATE TABLE `test_tree_book` (
  `id` varchar(32) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单IDs',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `sort` int DEFAULT NULL COMMENT '排序',
  `leaf` bit(1) DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `author_` varchar(50) NOT NULL COMMENT '作者',
  `email_` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone_` varchar(32) DEFAULT NULL COMMENT '手机',
  `activated_` bit(1) NOT NULL,
  `number_` int DEFAULT NULL COMMENT 'key',
  `money_` decimal(20,2) DEFAULT NULL,
  `amount_` double(11,2) DEFAULT NULL,
  `reset_date` timestamp(3) NULL DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  `version` int NOT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='  测试树书';

-- ----------------------------
-- Records of test_tree_book
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
