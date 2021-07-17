/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : albedo-gen

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 26/12/2020 11:33:29
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
                                       `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
                                       `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'url',
                                       `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
                                       `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
                                       `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
                                       `version` int DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
                                       `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
                                       `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                                       `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
                                       `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
                                       `last_modified_date` timestamp(3) NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据源表';
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='数据源表';

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

