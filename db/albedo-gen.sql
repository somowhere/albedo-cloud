/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : albedo-gen

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 11/04/2022 14:03:11
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_datasource_conf
-- ----------------------------
DROP TABLE IF EXISTS `gen_datasource_conf`;
CREATE TABLE `gen_datasource_conf`
(
  `id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `url`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'url',
  `username`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `version`            int(0) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  `description`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL,
  `created_date`       timestamp(3)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP (3),
  `last_modified_by`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_datasource_conf
-- ----------------------------
INSERT INTO `gen_datasource_conf`
VALUES ('1513396646128386048', 'gen',
        'jdbc:mysql://localhost:3306/albedo-gen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true',
        'root', 'WjSXie6L3c9bMSnX9SrL7g==', '0', 1, NULL, '1', '2022-04-11 14:00:49.665', '1',
        '2022-04-11 14:00:49.665', '0000');
INSERT INTO `gen_datasource_conf`
VALUES ('1513396899208495104', 'cloud',
        'jdbc:mysql://localhost:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true',
        'root', 'ZB8attIFlgfTv5JZVZxV7w==', '0', 0, NULL, '1', '2022-04-11 14:01:52.982', '1',
        '2022-04-11 14:01:52.983', '0000');
INSERT INTO `gen_datasource_conf`
VALUES ('4a56eae38c1efba4b3a55153a0616ba9', 'albedoGen', 'jdbc:mysql://albedo-mysql:3306/albedo-gen', 'root',
        'z4aETx/0mMW0mfZByjM8dQ==', '0', 0, NULL, '1', '2020-09-20 12:49:48.862', '1', '2020-09-20 12:49:48.862', '');
INSERT INTO `gen_datasource_conf`
VALUES ('893af6088511440a2998c9277886ec76', 'albedoCloud', 'jdbc:mysql://albedo-mysql:3306/albedo-cloud', 'root',
        'egwpbMYBPEimOtvJRoPiag==', '0', 2, NULL, '1', '2020-09-20 10:48:25.392', '1', '2020-09-20 13:06:55.370', '');

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme`
(
  `id`                   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL COMMENT '编号',
  `name`                 varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `category`             varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `view_type`            char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视图类型 0  普通表格 1  表格采用ajax刷新',
  `package_name`         varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name`          varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name`      varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成子模块名',
  `function_name`        varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成表编号',
  `version`              int(0) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  `description`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by`           varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL,
  `created_date`         timestamp(3)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP (3),
  `last_modified_by`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date`   timestamp(3) NULL DEFAULT NULL,
  `del_flag`             char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_code`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生成方案' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
INSERT INTO `gen_scheme`
VALUES ('1513397040871112704', '测试书籍', 'curd', NULL, 'com.albedo.java.modules', 'test', NULL, '测试书籍', '测试书籍', 'admin',
        '1513396943223521280', 0, NULL, '1', '2022-04-11 14:02:26.758', '1', '2022-04-11 14:02:26.758', '0', '0000');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`
(
  `id`                 varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL COMMENT '编号',
  `name`               varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '名称',
  `comments`           varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `class_name`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '实体类名称',
  `ds_name`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源',
  `parent_table`       varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联父表外键',
  `version`            int(0) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  `description`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL,
  `created_date`       timestamp(3)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP (3),
  `last_modified_by`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX                `gen_table_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table`
VALUES ('1513396943223521280', 'test_book', '测试书籍', 'TestBook', 'gen', NULL, NULL, 0, NULL, '1',
        '2022-04-11 14:02:03.477', '1', '2022-04-11 14:02:03.477', '0', '0000');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`
(
  `id`                 varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL COMMENT '编号',
  `gen_table_id`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `name`               varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `title`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '标题',
  `comments`           varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述备注',
  `jdbc_type`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type`          varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk`              bit(1) NULL DEFAULT NULL COMMENT '是否主键',
  `is_unique`          bit(1) NULL DEFAULT NULL COMMENT '是否唯一（1：是；0：否）',
  `is_null`            bit(1) NULL DEFAULT NULL COMMENT '是否可为空',
  `is_insert`          bit(1) NULL DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit`            bit(1) NULL DEFAULT NULL COMMENT '是否编辑字段',
  `is_list`            bit(1) NULL DEFAULT NULL COMMENT '是否列表字段',
  `is_query`           bit(1) NULL DEFAULT NULL COMMENT '是否查询字段',
  `query_type`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `settings`           varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort`               decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `version`            int(0) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  `description`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL,
  `created_date`       timestamp(3)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP (3),
  `last_modified_by`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX                `gen_table_column_table_id`(`gen_table_id`) USING BTREE,
  INDEX                `gen_table_column_name`(`name`) USING BTREE,
  INDEX                `gen_table_column_sort`(`sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column`
VALUES ('1513396943353544704', '1513396943223521280', 'id', 'id', NULL, 'varchar(32)', 'String', 'id', b'1', b'0', b'0',
        b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 10, 0, NULL, '1', '2022-04-11 14:02:03.508', '1',
        '2022-04-11 14:02:03.508', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943370321920', '1513396943223521280', 'title_', '标题', NULL, 'varchar(32)', 'String', 'title', b'0',
        b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 20, 0, NULL, '1', '2022-04-11 14:02:03.512', '1',
        '2022-04-11 14:02:03.512', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943378710528', '1513396943223521280', 'author_', '作者', NULL, 'varchar(50)', 'String', 'author', b'0',
        b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 0, NULL, '1', '2022-04-11 14:02:03.514', '1',
        '2022-04-11 14:02:03.514', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943387099136', '1513396943223521280', 'name_', '名称', NULL, 'varchar(50)', 'String', 'name', b'0', b'0',
        b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 40, 0, NULL, '1', '2022-04-11 14:02:03.516', '1',
        '2022-04-11 14:02:03.516', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943391293440', '1513396943223521280', 'email_', '邮箱', NULL, 'varchar(100)', 'String', 'email', b'0',
        b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 0, NULL, '1', '2022-04-11 14:02:03.517', '1',
        '2022-04-11 14:02:03.517', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943403876352', '1513396943223521280', 'phone_', '手机', NULL, 'varchar(32)', 'String', 'phone', b'0',
        b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 60, 0, NULL, '1', '2022-04-11 14:02:03.520', '1',
        '2022-04-11 14:02:03.520', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943408070656', '1513396943223521280', 'activated_', 'activated_', NULL, 'bit(1)', 'Integer',
        'activated', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 70, 0, NULL, '1',
        '2022-04-11 14:02:03.521', '1', '2022-04-11 14:02:03.521', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943416459264', '1513396943223521280', 'number_', 'key', NULL, 'int', 'Long', 'number', b'0', b'0', b'1',
        b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 80, 0, NULL, '1', '2022-04-11 14:02:03.523', '1',
        '2022-04-11 14:02:03.523', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943420653568', '1513396943223521280', 'money_', 'money_', NULL, 'decimal(20,2)', 'Double', 'money',
        b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 90, 0, NULL, '1', '2022-04-11 14:02:03.524',
        '1', '2022-04-11 14:02:03.524', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943429042176', '1513396943223521280', 'amount_', 'amount_', NULL, 'double(11,2)', 'Double', 'amount',
        b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 100, 0, NULL, '1', '2022-04-11 14:02:03.526',
        '1', '2022-04-11 14:02:03.526', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943433236480', '1513396943223521280', 'reset_date', 'reset_date', NULL, 'timestamp(3)',
        'java.util.Date', 'resetDate', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'dateselect', '', NULL, 110, 0,
        NULL, '1', '2022-04-11 14:02:03.527', '1', '2022-04-11 14:02:03.527', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943437430784', '1513396943223521280', 'created_by', 'created_by', NULL, 'varchar(50)', 'String',
        'createdBy', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 120, 0, NULL, '1',
        '2022-04-11 14:02:03.528', '1', '2022-04-11 14:02:03.528', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943441625088', '1513396943223521280', 'created_date', 'created_date', NULL, 'timestamp(3)',
        'java.util.Date', 'createdDate', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 130, 0,
        NULL, '1', '2022-04-11 14:02:03.529', '1', '2022-04-11 14:02:03.529', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943450013696', '1513396943223521280', 'last_modified_by', 'last_modified_by', NULL, 'varchar(50)',
        'String', 'lastModifiedBy', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 140, 0, NULL,
        '1', '2022-04-11 14:02:03.531', '1', '2022-04-11 14:02:03.531', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943454208000', '1513396943223521280', 'last_modified_date', 'last_modified_date', NULL, 'timestamp(3)',
        'java.util.Date', 'lastModifiedDate', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL,
        150, 0, NULL, '1', '2022-04-11 14:02:03.532', '1', '2022-04-11 14:02:03.532', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943458402304', '1513396943223521280', 'description', '备注', NULL, 'varchar(255)', 'String',
        'description', b'0', b'0', b'1', b'1', b'1', b'0', b'0', 'eq', 'input', '', NULL, 160, 0, NULL, '1',
        '2022-04-11 14:02:03.533', '1', '2022-04-11 14:02:03.533', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943466790912', '1513396943223521280', 'version', 'version', NULL, 'int', 'Long', 'version', b'0', b'0',
        b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 170, 0, NULL, '1', '2022-04-11 14:02:03.535', '1',
        '2022-04-11 14:02:03.535', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943475179520', '1513396943223521280', 'del_flag', '0-正常，1-删除', NULL, 'char(1)', 'String', 'delFlag',
        b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'radio', 'sys_flag', NULL, 180, 0, NULL, '1',
        '2022-04-11 14:02:03.537', '1', '2022-04-11 14:02:03.537', '0', '0000');
INSERT INTO `gen_table_column`
VALUES ('1513396943479373824', '1513396943223521280', 'tenant_code', '租户编码', NULL, 'varchar(20)', 'String',
        'tenantCode', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 190, 0, NULL, '1',
        '2022-04-11 14:02:03.538', '1', '2022-04-11 14:02:03.538', '0', '0000');

-- ----------------------------
-- Table structure for gen_table_fk
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_fk`;
CREATE TABLE `gen_table_fk`
(
  `id`                 varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL COMMENT '编号',
  `gen_table_id`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `name`               varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `comments`           varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `jdbc_type`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type`          varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk`              char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键',
  `is_unique`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否唯一（1：是；0：否）',
  `is_null`            char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可为空',
  `is_insert`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit`            char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段',
  `is_list`            char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段',
  `is_query`           char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段',
  `query_type`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `settings`           varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort`               decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `version`            int(0) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  `description`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL,
  `created_date`       timestamp(3)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP (3),
  `last_modified_by`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX                `gen_table_column_table_id`(`gen_table_id`) USING BTREE,
  INDEX                `gen_table_column_name`(`name`) USING BTREE,
  INDEX                `gen_table_column_sort`(`sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_fk
-- ----------------------------

-- ----------------------------
-- Table structure for test_book
-- ----------------------------
DROP TABLE IF EXISTS `test_book`;
CREATE TABLE `test_book`
(
  `id`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title_`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `author_`    varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `name_`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `email_`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone_`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `activated_` bit(1)                                                 NOT NULL,
  `number_`    int(0) NULL DEFAULT NULL COMMENT 'key',
  `money_`     decimal(20, 2) NULL DEFAULT NULL,
  `amount_`    double(11, 2
) NULL DEFAULT NULL,
  `reset_date` timestamp(3) NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试书籍' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_book
-- ----------------------------

-- ----------------------------
-- Table structure for test_tree_book
-- ----------------------------
DROP TABLE IF EXISTS `test_tree_book`;
CREATE TABLE `test_tree_book`
(
  `id`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单IDs',
  `name`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `sort`       int(0) NULL DEFAULT NULL COMMENT '排序',
  `leaf`       bit(1) NULL DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `author_`    varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `email_`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone_`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `activated_` bit(1)                                                 NOT NULL,
  `number_`    int(0) NULL DEFAULT NULL COMMENT 'key',
  `money_`     decimal(20, 2) NULL DEFAULT NULL,
  `amount_`    double(11, 2
) NULL DEFAULT NULL,
  `reset_date` timestamp(3) NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  `version` int(0) NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '  测试树书' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_tree_book
-- ----------------------------

SET
FOREIGN_KEY_CHECKS = 1;
