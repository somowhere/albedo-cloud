/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : albedo-cloud

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 01/06/2020 19:40:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `version` int(11) DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
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
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `version` int(11) DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
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
  `version` int(11) DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
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
  `version` int(11) DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
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
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_job_details` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.albedo.java.modules.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E616C6265646F2E6A6176612E6D6F64756C65732E71756172747A2E646F6D61696E2E4A6F62000000000000000102000A4C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C0005656D61696C71007E00094C000567726F757071007E00094C000269647400134C6A6176612F6C616E672F496E74656765723B4C000C696E766F6B6554617267657471007E00094C000D6D697366697265506F6C69637971007E00094C00046E616D6571007E00094C000673746174757371007E00094C00077375625461736B71007E00097872003C636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E416273747261637444617461456E7469747900000000000000010200064C000963726561746564427971007E00094C000B63726561746564446174657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C000B6465736372697074696F6E71007E00094C000E6C6173744D6F646966696564427971007E00094C00106C6173744D6F6469666965644461746571007E000C4C000776657273696F6E71007E000A78720034636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E42617365456E7469747900000000000000010200014C000764656C466C616771007E000978720037636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E47656E6572616C456E74697479000000000000000102000078720035636F6D2E62616F6D69646F752E6D796261746973706C75732E657874656E73696F6E2E6163746976657265636F72642E4D6F64656C00000000000000010200007870740001307400007372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770A05000007E3080E0A15DB7870740001317371007E0013770E05000007E405100F26182B64660078737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000097400013174000E302F3130202A202A202A202A203F7074000744454641554C547371007E00170000000174001573696D706C655461736B2E646F4E6F506172616D7374000133740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000130740001327800);
INSERT INTO `qrtz_job_details` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.albedo.java.modules.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E616C6265646F2E6A6176612E6D6F64756C65732E71756172747A2E646F6D61696E2E4A6F62000000000000000102000A4C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C0005656D61696C71007E00094C000567726F757071007E00094C000269647400134C6A6176612F6C616E672F496E74656765723B4C000C696E766F6B6554617267657471007E00094C000D6D697366697265506F6C69637971007E00094C00046E616D6571007E00094C000673746174757371007E00094C00077375625461736B71007E00097872003C636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E416273747261637444617461456E7469747900000000000000010200064C000963726561746564427971007E00094C000B63726561746564446174657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C000B6465736372697074696F6E71007E00094C000E6C6173744D6F646966696564427971007E00094C00106C6173744D6F6469666965644461746571007E000C4C000776657273696F6E71007E000A78720034636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E42617365456E7469747900000000000000010200014C000764656C466C616771007E000978720037636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E47656E6572616C456E74697479000000000000000102000078720035636F6D2E62616F6D69646F752E6D796261746973706C75732E657874656E73696F6E2E6163746976657265636F72642E4D6F64656C00000000000000010200007870740001307400007372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770E05000007E3080E0A1524389FD9807870740001317371007E0013770E05000007E405100F1C18171126C078737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000127400013174000E302F3135202A202A202A202A203F7074000744454641554C547371007E00170000000274001D73696D706C655461736B2E646F506172616D732827616C6265646F272974000133740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000130707800);
INSERT INTO `qrtz_job_details` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.albedo.java.modules.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E616C6265646F2E6A6176612E6D6F64756C65732E71756172747A2E646F6D61696E2E4A6F62000000000000000102000A4C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C0005656D61696C71007E00094C000567726F757071007E00094C000269647400134C6A6176612F6C616E672F496E74656765723B4C000C696E766F6B6554617267657471007E00094C000D6D697366697265506F6C69637971007E00094C00046E616D6571007E00094C000673746174757371007E00094C00077375625461736B71007E00097872003C636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E416273747261637444617461456E7469747900000000000000010200064C000963726561746564427971007E00094C000B63726561746564446174657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C000B6465736372697074696F6E71007E00094C000E6C6173744D6F646966696564427971007E00094C00106C6173744D6F6469666965644461746571007E000C4C000776657273696F6E71007E000A78720034636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E42617365456E7469747900000000000000010200014C000764656C466C616771007E000978720037636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E47656E6572616C456E74697479000000000000000102000078720035636F6D2E62616F6D69646F752E6D796261746973706C75732E657874656E73696F6E2E6163746976657265636F72642E4D6F64656C00000000000000010200007870740001307400007372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770A05000007E3080E0A15DB7870740001317371007E0013770E05000007E405100F0C320F60C48078737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000047400013174000E302F3230202A202A202A202A203F7074000744454641554C547371007E00170000000374004073696D706C655461736B2E646F4D756C7469706C65506172616D732827616C6265646F272C20747275652C20323030304C2C203331362E3530442C203130302974000133740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000130707800);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('AlbedoScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('AlbedoScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` VALUES ('AlbedoScheduler', 'somewheredembp.lan1590996646286', 1591011610783, 15000);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1590996650000, -1, 5, 'PAUSED', 'CRON', 1590996646000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1590996660000, -1, 5, 'PAUSED', 'CRON', 1590996647000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1590996660000, -1, 5, 'PAUSED', 'CRON', 1590996647000, 0, NULL, 2, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` varchar(32) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单IDs',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `available` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '1' COMMENT '1-正常，0-锁定',
  `leaf` bit(1) DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  `version` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('1', '-1', NULL, '山东农信', NULL, '1', b'0', '', '2018-01-22 19:00:23.000', NULL, '2019-07-04 16:57:18.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('10', '8', NULL, '院校沙县', NULL, '1', b'0', '', '2018-12-10 21:19:26.000', NULL, '2019-06-15 10:56:41.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('2', '-1', NULL, '沙县国际', NULL, '1', b'0', '', '2018-01-22 19:00:38.000', NULL, '2019-07-04 16:57:22.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('3', '1', NULL, '潍坊农信', NULL, '1', b'0', '', '2018-01-22 19:00:44.000', NULL, '2019-06-15 10:56:41.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('4', '3', NULL, '高新农信', 30, '1', b'0', '', '2018-01-22 19:00:52.000', '1', '2019-07-14 09:02:57.000', 6, '', '0');
INSERT INTO `sys_dept` VALUES ('5', '4', NULL, '院校农信', 30, '1', b'0', '', '2018-01-22 19:00:57.000', '1', '2019-07-14 09:10:44.000', 1, '', '0');
INSERT INTO `sys_dept` VALUES ('5f86e2a82b040b1f618aefc62f403024', '5', '5,', '11', 1, '1', b'1', '1', '2019-07-14 09:10:45.000', '1', '2019-07-14 09:10:57.000', 0, NULL, '1');
INSERT INTO `sys_dept` VALUES ('6', '5', NULL, '潍院农信', NULL, '1', b'0', '', '2018-01-22 19:01:06.000', NULL, '2019-01-09 10:58:18.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('7', '2', NULL, '山东沙县', NULL, '1', b'0', '', '2018-01-22 19:01:57.000', NULL, '2019-06-15 10:56:41.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('8', '7', NULL, '潍坊沙县', NULL, '1', b'0', '', '2018-01-22 19:02:03.000', NULL, '2019-06-15 10:56:41.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('9', '8', NULL, '高新沙县', NULL, '1', b'0', '', '2018-01-22 19:02:14.000', NULL, '2018-09-13 01:46:44.000', 0, '', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation` (
  `ancestor` varchar(32) NOT NULL COMMENT '祖先节点',
  `descendant` varchar(32) NOT NULL COMMENT '后代节点',
  PRIMARY KEY (`ancestor`,`descendant`) USING BTREE,
  KEY `idx1` (`ancestor`) USING BTREE,
  KEY `idx2` (`descendant`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='部门关系表';

-- ----------------------------
-- Records of sys_dept_relation
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept_relation` VALUES ('1', '1');
INSERT INTO `sys_dept_relation` VALUES ('1', '3');
INSERT INTO `sys_dept_relation` VALUES ('1', '4');
INSERT INTO `sys_dept_relation` VALUES ('1', '5');
INSERT INTO `sys_dept_relation` VALUES ('10', '10');
INSERT INTO `sys_dept_relation` VALUES ('11', '11');
INSERT INTO `sys_dept_relation` VALUES ('2', '11');
INSERT INTO `sys_dept_relation` VALUES ('2', '2');
INSERT INTO `sys_dept_relation` VALUES ('2', '7');
INSERT INTO `sys_dept_relation` VALUES ('2', '8');
INSERT INTO `sys_dept_relation` VALUES ('3', '3');
INSERT INTO `sys_dept_relation` VALUES ('3', '4');
INSERT INTO `sys_dept_relation` VALUES ('3', '5');
INSERT INTO `sys_dept_relation` VALUES ('4', '4');
INSERT INTO `sys_dept_relation` VALUES ('4', '5');
INSERT INTO `sys_dept_relation` VALUES ('5', '5');
INSERT INTO `sys_dept_relation` VALUES ('7', '11');
INSERT INTO `sys_dept_relation` VALUES ('7', '7');
INSERT INTO `sys_dept_relation` VALUES ('7', '8');
INSERT INTO `sys_dept_relation` VALUES ('8', '11');
INSERT INTO `sys_dept_relation` VALUES ('8', '8');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '标签名',
  `val` varchar(100) DEFAULT NULL COMMENT '数据值',
  `code` varchar(100) NOT NULL COMMENT '类型',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父菜单ID',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单IDs',
  `sort` int(10) NOT NULL COMMENT '排序（升序）',
  `available` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '1' COMMENT '1-正常，0-锁定',
  `leaf` bit(1) DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  `version` int(11) NOT NULL DEFAULT '0',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_value` (`val`) USING BTREE,
  KEY `sys_dict_label` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('05d01334ecdbe94b856038a32a42512b', '任务分组', NULL, 'sys_job_group', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, '1', b'0', NULL, '1', '2019-08-15 16:33:54.745', '1', '2019-08-15 16:34:47.136', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('0b2420638683f1eec41242beb9912069', '在线', 'on_line', 'sys_online_status_on_line', 'f3592a047c466e348279983336ebaf28', '1,cfd5f62f601817a3b0f38f5ccb1f5128,f3592a047c466e348279983336ebaf28,', 30, '1', b'1', NULL, '1', '2019-08-11 11:17:28.210', '1', '2019-08-11 11:17:28.210', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('0da02abef85f0c0b4350eaeefb4ca78d', '仅本人数据', '4', 'sys_data_scope_4', 'aa294a48211a2deb5c7d76c5e90dc28e', '1,cfd5f62f601817a3b0f38f5ccb1f5128,aa294a48211a2deb5c7d76c5e90dc28e,', 40, '1', b'1', NULL, '1', '2019-07-14 06:00:03.000', '1', '2019-08-09 11:26:04.724', 5, NULL, '0');
INSERT INTO `sys_dict` VALUES ('0ef7242f2bb88fdbdcbc56e7a879efb0', '其他', '0', 'sys_business_type_0', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 10, '1', b'1', NULL, '1', '2019-08-07 16:49:39.000', '1', '2019-08-09 11:26:04.726', 3, NULL, '0');
INSERT INTO `sys_dict` VALUES ('0fdd548394368b4969136f32c435fd98', '按钮', '1', 'sys_menu_type_1', 'e26ee931e276a099fb876541ca18756f', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e26ee931e276a099fb876541ca18756f,', 20, '1', b'1', NULL, '1', '2019-07-14 06:04:44.000', '1', '2019-08-09 11:26:04.726', 4, NULL, '0');
INSERT INTO `sys_dict` VALUES ('1', '数据字典', '', 'base', '-1', NULL, 1, '1', b'0', '', '1', '2018-07-09 06:16:14.000', '1', '2019-10-06 16:53:06.999', 12, '', '0');
INSERT INTO `sys_dict` VALUES ('13276f100593667c3bd40ab8fea734b4', '立即执行', '1', 'sys_misfire_policy_1', 'cb3d07975904460c94e9e2b30755c04b', '1,cfd5f62f601817a3b0f38f5ccb1f5128,cb3d07975904460c94e9e2b30755c04b,', 30, '1', b'1', NULL, '1', '2019-08-15 10:24:19.706', '1', '2019-08-15 10:24:19.706', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('181dd29afa852bd47a5ae8dd2e02a623', '正常', '1', 'sys_status_1', '952c07b027bf0be298a9243af701b8c5', '1,cfd5f62f601817a3b0f38f5ccb1f5128,952c07b027bf0be298a9243af701b8c5,', 30, '1', b'1', NULL, '1', '2019-08-14 11:28:01.693', '1', '2019-08-15 09:08:45.451', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('2', '是否标识', '', 'sys_flag', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 10, '1', b'0', NULL, '1', '2019-06-02 17:17:44.000', '1', '2019-08-09 11:26:04.727', 17, NULL, '0');
INSERT INTO `sys_dict` VALUES ('269ebbfff898cf1db0d243e3f7774d2c', '业务数据', 'biz', 'biz', '1', '1,', 30, '1', b'1', NULL, '1', '2019-07-14 04:01:51.000', '1', '2019-10-06 16:53:07.026', 5, NULL, '0');
INSERT INTO `sys_dict` VALUES ('2ec9dffe7cb0dea12c8e4e2a90279711', '强退', '6', 'sys_business_type_6', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 70, '1', b'1', NULL, '1', '2019-08-07 16:52:15.681', '1', '2019-08-09 11:26:04.727', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('3', '是', '1', 'sys_flag_yes', '2', '1,cfd5f62f601817a3b0f38f5ccb1f5128,2,', 10, '1', b'1', '', '1', '2018-07-09 06:15:40.000', '1', '2019-08-09 11:26:04.728', 5, '', '0');
INSERT INTO `sys_dict` VALUES ('31d677b181cebb9bde79b78f32e1e8a3', '其他', '0', 'sys_operate_type_0', '6b8211aef2fec451b0398b19857443a7', '1,cfd5f62f601817a3b0f38f5ccb1f5128,6b8211aef2fec451b0398b19857443a7,', 10, '1', b'1', NULL, '1', '2019-08-07 16:48:21.644', '1', '2019-08-09 11:26:04.730', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('3e949b67e0c5be3357bdcce9705f7433', '放弃执行', '3', 'sys_misfire_policy_3', 'cb3d07975904460c94e9e2b30755c04b', '1,cfd5f62f601817a3b0f38f5ccb1f5128,cb3d07975904460c94e9e2b30755c04b,', 30, '1', b'1', NULL, '1', '2019-08-15 10:24:54.175', '1', '2019-08-15 10:24:54.175', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('4', '否', '0', 'sys_flag_no', '2', '1,cfd5f62f601817a3b0f38f5ccb1f5128,2,', 30, '1', b'1', NULL, '1', '2019-06-02 17:26:40.000', '1', '2019-08-09 11:26:04.732', 6, NULL, '0');
INSERT INTO `sys_dict` VALUES ('4198b5e10fe052546ebb689b4103590e', '所在机构数据', '3', 'sys_data_scope_3', 'aa294a48211a2deb5c7d76c5e90dc28e', '1,cfd5f62f601817a3b0f38f5ccb1f5128,aa294a48211a2deb5c7d76c5e90dc28e,', 30, '1', b'1', NULL, '1', '2019-07-14 05:59:13.000', '1', '2019-08-09 11:26:04.733', 7, NULL, '0');
INSERT INTO `sys_dict` VALUES ('4ebd555fb352328cb2db93e15d3243ad', '系统', 'SYSTEM', 'sys_job_group_system', '05d01334ecdbe94b856038a32a42512b', '1,cfd5f62f601817a3b0f38f5ccb1f5128,05d01334ecdbe94b856038a32a42512b,', 30, '1', b'1', NULL, '1', '2019-08-15 16:34:47.139', '1', '2019-08-15 16:34:47.139', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('51828811168cd9f0ee1d118068a7d0b9', '编辑', '1', 'sys_business_type_1', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 20, '1', b'1', NULL, '1', '2019-08-07 16:50:20.634', '1', '2019-08-09 11:26:04.733', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('5933a853cd0199b00424d66f4b92dda3', '所在机构及以下数据', '2', 'sys_data_scope_2', 'aa294a48211a2deb5c7d76c5e90dc28e', '1,cfd5f62f601817a3b0f38f5ccb1f5128,aa294a48211a2deb5c7d76c5e90dc28e,', 20, '1', b'1', NULL, '1', '2019-07-14 05:53:55.000', '1', '2019-08-09 11:26:04.734', 7, NULL, '0');
INSERT INTO `sys_dict` VALUES ('5f2414b2670c9a66c1d5364613caa654', '后台用户', '1', 'sys_operate_type_1', '6b8211aef2fec451b0398b19857443a7', '1,cfd5f62f601817a3b0f38f5ccb1f5128,6b8211aef2fec451b0398b19857443a7,', 20, '1', b'1', NULL, '1', '2019-08-07 16:48:40.344', '1', '2019-08-09 11:26:04.734', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('6b8211aef2fec451b0398b19857443a7', '操作人类别', NULL, 'sys_operator_type', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, '1', b'0', NULL, '1', '2019-08-07 15:37:09.613', '1', '2019-08-09 11:26:04.734', 6, NULL, '0');
INSERT INTO `sys_dict` VALUES ('6e4bba74f32df9149d69f8e9bb19cd9d', '菜单', '0', 'sys_menu_type_0', 'e26ee931e276a099fb876541ca18756f', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e26ee931e276a099fb876541ca18756f,', 10, '1', b'1', NULL, '1', '2019-07-14 06:04:10.000', '1', '2019-08-09 11:26:04.736', 4, NULL, '0');
INSERT INTO `sys_dict` VALUES ('764d1eaf8a39698fc85a7204c96e7089', '生成代码', '7', 'sys_business_type_7', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 80, '1', b'1', NULL, '1', '2019-08-07 16:52:36.997', '1', '2019-08-09 11:26:04.739', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('80b084e162b0a30b348a45ff29e5b326', '导出', '4', 'sys_business_type_4', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 50, '1', b'1', NULL, '1', '2019-08-07 16:51:33.286', '1', '2019-08-09 11:26:04.739', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('8153bd2af73b6d59eed9f34d2bc05bb9', '删除', '3', 'sys_business_type_3', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 40, '1', b'1', NULL, '1', '2019-08-07 16:50:45.270', '1', '2019-08-09 11:26:04.740', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('8883abe4dcf9390df69a5740050abf74', '离线', 'off_line', 'sys_online_status_off_line', 'f3592a047c466e348279983336ebaf28', '1,cfd5f62f601817a3b0f38f5ccb1f5128,f3592a047c466e348279983336ebaf28,', 30, '1', b'1', NULL, '1', '2019-08-11 11:17:50.132', '1', '2019-08-11 11:17:50.132', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('8c4589d0a32c9b84b6254507354a195b', 'test', 'test', 'test', '-1', NULL, 30, '1', b'1', NULL, '1', '2019-07-14 03:59:38.000', '1', '2019-07-14 04:00:28.000', 0, NULL, '1');
INSERT INTO `sys_dict` VALUES ('94e00baf14b640d793c133fb7bfa4c9a', '默认', 'DEFAULT', 'sys_job_group_default', '05d01334ecdbe94b856038a32a42512b', '1,cfd5f62f601817a3b0f38f5ccb1f5128,05d01334ecdbe94b856038a32a42512b,', 30, '1', b'1', NULL, '1', '2019-08-15 16:34:28.547', '1', '2019-08-15 16:34:28.547', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('952c07b027bf0be298a9243af701b8c5', '状态', NULL, 'sys_status', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, '1', b'0', NULL, '1', '2019-08-14 11:26:50.424', '1', '2019-08-15 09:09:12.239', 3, NULL, '0');
INSERT INTO `sys_dict` VALUES ('a5dfce34bdb7aa99560e8c0d393a632f', '全部', '1', 'sys_data_scope_1', 'aa294a48211a2deb5c7d76c5e90dc28e', '1,cfd5f62f601817a3b0f38f5ccb1f5128,aa294a48211a2deb5c7d76c5e90dc28e,', 10, '1', b'1', NULL, '1', '2019-07-14 05:52:44.000', '1', '2019-08-09 11:26:04.740', 7, NULL, '0');
INSERT INTO `sys_dict` VALUES ('aa294a48211a2deb5c7d76c5e90dc28e', '数据范围', '', 'sys_data_scope', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, '1', b'0', NULL, '1', '2019-07-14 05:50:08.000', '1', '2019-08-09 11:26:04.741', 16, NULL, '0');
INSERT INTO `sys_dict` VALUES ('b672448a74c1d1a47eb1378e3d8c6dc9', '导入', '5', 'sys_business_type_5', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 60, '1', b'1', NULL, '1', '2019-08-07 16:51:45.855', '1', '2019-08-09 11:26:04.741', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('c46ec99af2c1f967bf10cf2c0d96a6c5', '按明细设置', '5', 'sys_data_scope_5', 'aa294a48211a2deb5c7d76c5e90dc28e', '1,cfd5f62f601817a3b0f38f5ccb1f5128,aa294a48211a2deb5c7d76c5e90dc28e,', 50, '1', b'1', NULL, '1', '2019-07-14 06:01:11.000', '1', '2019-08-09 11:26:04.741', 5, NULL, '0');
INSERT INTO `sys_dict` VALUES ('cb3d07975904460c94e9e2b30755c04b', '计划执行错误策略', NULL, 'sys_misfire_policy', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, '1', b'0', NULL, '1', '2019-08-15 10:23:54.460', '1', '2019-08-15 10:24:54.169', 3, NULL, '0');
INSERT INTO `sys_dict` VALUES ('cfd5f62f601817a3b0f38f5ccb1f5128', '系统数据', 'sys', 'sys', '1', '1,', 30, '1', b'0', NULL, '1', '2019-07-14 01:13:12.000', '1', '2019-08-15 16:33:54.741', 22, NULL, '0');
INSERT INTO `sys_dict` VALUES ('e0696db908c87ad57a85c6b326348dbd', '业务操作类型', NULL, 'sys_business_type', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, '1', b'0', NULL, '1', '2019-08-07 15:33:35.000', '1', '2019-08-09 11:26:04.742', 17, NULL, '0');
INSERT INTO `sys_dict` VALUES ('e26ee931e276a099fb876541ca18756f', '菜单类型', '', 'sys_menu_type', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, '1', b'0', NULL, '1', '2019-07-14 06:01:48.000', '1', '2019-08-09 11:26:04.744', 8, NULL, '0');
INSERT INTO `sys_dict` VALUES ('e7891a6351a2e143899849b2955851b2', '锁定', '2', 'sys_business_type_2', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 30, '1', b'1', NULL, '1', '2019-08-07 16:50:32.457', '1', '2019-08-09 11:26:04.746', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('ef0368c6fd52ee8f1f4270869da00f18', 'tab按钮', '2', 'sys_menu_type_2', 'e26ee931e276a099fb876541ca18756f', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e26ee931e276a099fb876541ca18756f,', 30, '1', b'1', NULL, '1', '2019-08-07 13:55:24.531', '1', '2019-08-09 11:26:04.746', 4, NULL, '0');
INSERT INTO `sys_dict` VALUES ('f3592a047c466e348279983336ebaf28', '在线状态', NULL, 'sys_online_status', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, '1', b'0', NULL, '1', '2019-08-11 11:16:52.095', '1', '2019-08-11 11:17:50.128', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('f35adf75d9ab0ca5cec43815b7db5274', '执行一次', '2', 'sys_misfire_policy_2', 'cb3d07975904460c94e9e2b30755c04b', '1,cfd5f62f601817a3b0f38f5ccb1f5128,cb3d07975904460c94e9e2b30755c04b,', 30, '1', b'1', NULL, '1', '2019-08-15 10:24:39.273', '1', '2019-08-15 10:24:39.273', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('f83a718756762758707c67db3d271c9d', '手机端用户', '2', 'sys_operate_type_2', '6b8211aef2fec451b0398b19857443a7', '1,cfd5f62f601817a3b0f38f5ccb1f5128,6b8211aef2fec451b0398b19857443a7,', 30, '1', b'1', NULL, '1', '2019-08-07 16:49:00.766', '1', '2019-08-09 11:26:04.746', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('fafe8843b2f4091f8096dc0df09c300c', '失败', '0', 'sys_status_0', '952c07b027bf0be298a9243af701b8c5', '1,cfd5f62f601817a3b0f38f5ccb1f5128,952c07b027bf0be298a9243af701b8c5,', 30, '1', b'1', NULL, '1', '2019-08-14 11:28:11.000', '1', '2019-08-15 09:08:49.884', 1, NULL, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（1允许 0禁止）',
  `sub_task` varchar(100) DEFAULT NULL COMMENT '子任务id 多个用逗号隔开',
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '报警邮箱',
  `status` char(1) DEFAULT '0' COMMENT '状态(1-运行中，0-暂停)',
  `created_by` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created_date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `last_modified_date` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3),
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `version` int(11) NOT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'simpleTask.doNoParams', '0/10 * * * * ?', '3', '1', '2', NULL, '0', '', '2019-08-14 10:21:36.000', '1', '2020-05-16 15:38:24.728', NULL, 9, '0');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '0/15 * * * * ?', '3', '1', NULL, NULL, '0', '', '2019-08-14 10:21:36.950', '1', '2020-05-16 15:28:24.387', NULL, 18, '0');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'simpleTask.doMultipleParams(\'albedo\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', NULL, NULL, '0', '', '2019-08-14 10:21:36.000', '1', '2020-05-16 15:12:50.258', NULL, 4, '0');
INSERT INTO `sys_job` VALUES (4, 'test', 'DEFAULT', 'test', '0/20 * * * * ?', '2', '1', '1', NULL, '0', '1', '2020-05-16 15:06:05.098', '1', '2020-05-16 15:21:10.516', NULL, 1, '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `start_time` datetime(3) DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(3) DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `exception_info` varchar(3000) DEFAULT '' COMMENT '异常信息',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_log_operate
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_operate`;
CREATE TABLE `sys_log_operate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `log_type` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `ip_address` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `ip_location` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '操作系统',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(255) DEFAULT NULL COMMENT '请求方法',
  `params` text COMMENT '操作提交的数据',
  `time` mediumtext COMMENT '执行时间',
  `operator_type` varchar(20) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `business_type` varchar(20) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `exception` text COMMENT '异常信息',
  `created_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_log_create_by` (`created_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_create_date` (`created_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='操作日志表';

-- ----------------------------
-- Records of sys_log_operate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(32) NOT NULL COMMENT '菜单ID',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `type` char(1) DEFAULT NULL COMMENT '菜单类型 （0目录 1菜单 2按钮）',
  `permission` varchar(32) DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) DEFAULT NULL COMMENT '前端URL',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父菜单ID',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单IDs',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `component` varchar(64) DEFAULT NULL COMMENT 'VUE页面',
  `hidden` bit(1) DEFAULT b'0' COMMENT '隐藏',
  `iframe` bit(1) DEFAULT b'0' COMMENT '是否外链',
  `cache` bit(1) DEFAULT b'0' COMMENT '缓存',
  `leaf` bit(1) DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `sort` int(11) DEFAULT '1' COMMENT '排序值',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `version` int(11) NOT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('06874adacf1f272be7928badd4fe8ed1', '配置日志', '1', NULL, 'log', 'ef2382c0cc2d99ee73444e684237a88a', 'ef2382c0cc2d99ee73444e684237a88a,', 'dev', 'admin/log/index', b'0', b'0', b'0', b'1', 30, '1', '2019-08-06 07:16:06.000', '1', '2020-05-18 08:54:34.755', NULL, 1, '1');
INSERT INTO `sys_menu` VALUES ('0747d9d8f651f19e49748ba68f18c6f5', '任务调度方案编辑', '2', 'quartz_job_edit', NULL, 'c77855e4171d00ae3f97563a8391f70a', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 40, '1', '2019-08-15 01:36:03.602', '1', '2020-05-16 12:06:35.180', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('0a160cff2d071eeec3db97f0cb0b30d6', '测试树编辑', '2', 'test_testTreeBook_edit', NULL, '3956b4690e4f49cfb1e065384c1dc0b9', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 40, '1', '2020-05-26 00:35:47.308', '1', '2020-05-26 01:12:00.658', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('0b934688321b1db735c3bf6ec3e7cdc7', 'test', '2', 'test', 'test', '-1', NULL, 'date', NULL, b'0', b'0', b'0', b'1', 999, '1', '2020-05-15 08:47:36.261', '1', '2020-05-16 12:06:35.180', NULL, 1, '1');
INSERT INTO `sys_menu` VALUES ('0d0be247863fcbf08b3db943e5f45992', '在线用户查看', '2', 'sys_userOnline_view', NULL, '6e3f89cda84ac2c6e715e7812c102ae8', '2000,6e3f89cda84ac2c6e715e7812c102ae8,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-08 00:05:28.000', '1', '2020-05-17 08:55:59.725', NULL, 6, '0');
INSERT INTO `sys_menu` VALUES ('1000', '系统管理', '0', NULL, '/perm', '-1', NULL, 'menu', 'Layout', b'0', b'0', b'0', b'0', 10, '', '2018-09-28 23:29:53.000', '1', '2020-05-17 08:55:32.580', NULL, 36, '0');
INSERT INTO `sys_menu` VALUES ('10bd98f30a42427dd7ef75418ad3da6b', '邮件工具', '1', NULL, 'email', 'ef2382c0cc2d99ee73444e684237a88a', 'ef2382c0cc2d99ee73444e684237a88a,', 'email', 'tool/email/index', b'0', b'0', b'0', b'1', 30, '1', '2020-05-18 08:56:56.008', '1', '2020-05-19 17:17:42.461', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('1100', '用户管理', '1', 'sys_user_view', 'user', '1000', '1000,', 'peoples', 'sys/user/index', b'0', b'0', b'0', b'0', 10, '', '2017-11-03 13:24:37.000', '1', '2020-05-20 21:19:27.618', NULL, 16, '0');
INSERT INTO `sys_menu` VALUES ('1101', '用户编辑', '2', 'sys_user_edit', NULL, '1100', '1000,1100,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '', '2017-11-09 01:52:09.000', '1', '2020-05-20 21:19:27.630', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('1102', '用户锁定', '2', 'sys_user_lock', NULL, '1100', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2017-11-09 01:52:48.000', NULL, '2020-05-16 12:06:35.180', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1103', '用户删除', '2', 'sys_user_del', NULL, '1100', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2017-11-09 01:54:01.000', NULL, '2020-05-16 12:06:35.180', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('11b9ae870fb0fc89c52236faf43f3d96', '任务调度方案查看', '2', 'quartz_job_view', NULL, '322efc9833f2562f8862f882dabdf3d6', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 20, '1', '2019-08-15 01:35:56.085', '1', '2020-05-16 12:06:35.180', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('1200', '菜单管理', '1', 'sys_menu_view', 'menu', '1000', '1000,', 'menu', 'sys/menu/index', b'0', b'0', b'0', b'0', 40, '', '2017-11-09 01:57:27.000', '1', '2020-05-17 08:56:34.959', NULL, 8, '0');
INSERT INTO `sys_menu` VALUES ('1201', '菜单编辑', '2', 'sys_menu_edit', NULL, '1200', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2017-11-09 02:15:53.000', NULL, '2020-05-16 12:06:35.180', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1202', '菜单锁定', '2', 'sys_menu_lock', NULL, '1200', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2017-11-09 02:16:23.000', NULL, '2020-05-16 12:06:35.180', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1203', '菜单删除', '2', 'sys_menu_del', NULL, '1200', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2017-11-09 02:16:43.000', NULL, '2020-05-16 12:06:35.180', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1300', '角色管理', '1', 'sys_role_view', 'role', '1000', '1000,', 'role', 'sys/role/index', b'0', b'0', b'0', b'0', 20, '', '2017-11-09 02:13:37.000', '1', '2020-05-17 08:56:34.949', NULL, 7, '0');
INSERT INTO `sys_menu` VALUES ('1301', '角色编辑', '2', 'sys_role_edit', NULL, '1300', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2017-11-09 02:14:18.000', NULL, '2020-05-16 12:06:35.180', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1302', '角色锁定', '2', 'sys_role_lock', NULL, '1300', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2017-11-09 02:14:41.000', NULL, '2020-05-16 12:06:35.180', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1303', '角色删除', '2', 'sys_role_del', NULL, '1300', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2017-11-09 02:14:59.000', NULL, '2020-05-16 12:06:35.180', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1304', '角色查看', '2', 'sys_role_view', NULL, '1300', '1300,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '', '2018-04-20 22:22:55.000', '1', '2020-05-16 12:06:35.180', NULL, 1, '1');
INSERT INTO `sys_menu` VALUES ('13093fb658c1806ad5bd0600316158f2', '操作日志导出', '2', 'sys_logOperate_export', NULL, '2100', '2000,2100,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-08 08:50:46.973', '1', '2020-05-18 01:23:57.541', NULL, 2, '0');
INSERT INTO `sys_menu` VALUES ('133f1408f5e3187d3e1a00b0260b7165', '字典可用', '2', 'sys_dict_lock', NULL, '2200', '1000,2200,', NULL, NULL, b'0', NULL, b'0', b'1', 999, '1', '2020-05-16 08:24:57.559', '1', '2020-05-17 08:55:19.915', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('1400', '部门管理', '1', 'sys_dept_view', 'dept', '1000', '1000,', 'dept', 'sys/dept/index', b'0', b'0', b'0', b'0', 30, '', '2018-01-21 05:17:19.000', '1', '2020-05-17 08:56:34.955', NULL, 5, '0');
INSERT INTO `sys_menu` VALUES ('1401', '部门编辑', '2', 'sys_dept_edit', NULL, '1400', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2018-01-21 06:56:16.000', NULL, '2020-05-16 12:06:35.180', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1402', '部门锁定', '2', 'sys_dept_lock', NULL, '1400', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2018-01-21 06:56:59.000', NULL, '2020-05-16 12:06:35.180', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1403', '部门删除', '2', 'sys_dept_del', NULL, '1400', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2018-01-21 06:57:28.000', NULL, '2020-05-16 12:06:35.180', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('17a713e918513ecd42d3e915d1fc79c1', '测试书籍删除', '2', 'test_testBook_del', NULL, '4f5c94e30f3a64e8e1f1bf10e7247e7e', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 80, '1', '2020-05-26 01:15:07.791', '1', '2020-05-30 07:36:27.004', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('18d6b5e0f6b986cd074bf23de11ecd34', '任务调度删除', '2', 'quartz_job_del', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 40, '1', '2019-08-15 01:36:47.091', '1', '2020-05-17 04:24:22.873', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('1a900c3f10ef5b0987e0a8ee4445316d', '用户查看', '2', 'sys_user_view', NULL, '1100', '1000,1100,', NULL, NULL, b'0', b'0', b'0', b'1', 10, '1', '2019-08-08 08:27:34.000', '1', '2020-05-16 12:06:35.180', NULL, 4, '1');
INSERT INTO `sys_menu` VALUES ('1ae562534a64d4473899e52497c40b2e', '二级菜单1', '1', NULL, 'menu1', 'eb17cee437ea6b630dad59fff2a059ca', 'eb17cee437ea6b630dad59fff2a059ca,', 'dev', 'nested/menu1/index', b'0', b'0', b'0', b'0', 10, '1', '2020-05-19 02:10:06.354', '1', '2020-05-26 01:13:50.580', NULL, 9, '0');
INSERT INTO `sys_menu` VALUES ('2000', '系统监控', '0', NULL, '/sys', '-1', NULL, 'system', 'Layout', b'0', b'0', b'0', b'0', 20, '', '2017-11-08 12:56:00.000', '1', '2020-05-18 07:52:02.575', NULL, 39, '0');
INSERT INTO `sys_menu` VALUES ('2100', '操作日志', '1', NULL, 'log-operate', '2000', '2000,', 'log', 'monitor/log-operate/index', b'0', b'0', b'0', b'0', 40, '', '2017-11-21 06:06:22.000', '1', '2020-05-18 01:23:57.530', NULL, 12, '0');
INSERT INTO `sys_menu` VALUES ('2101', '操作日志删除', '2', 'sys_logOperate_del', NULL, '2100', '2000,2100,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '', '2017-11-21 12:37:37.000', '1', '2020-05-18 01:23:57.545', NULL, 3, '0');
INSERT INTO `sys_menu` VALUES ('2200', '字典管理', '1', 'sys_dict_view', 'dict', '1000', '1000,', 'dictionary', 'sys/dict/index', b'0', b'0', b'0', b'0', 50, '', '2017-11-30 03:30:52.000', '1', '2020-05-17 08:56:34.943', NULL, 11, '0');
INSERT INTO `sys_menu` VALUES ('2201', '字典删除', '2', 'sys_dict_del', NULL, '2200', '1000,2200,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '', '2017-11-30 03:30:11.000', '1', '2020-05-17 08:55:19.918', NULL, 2, '0');
INSERT INTO `sys_menu` VALUES ('2202', '字典编辑', '2', 'sys_dict_edit', NULL, '2200', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '', '2018-05-12 13:34:55.000', '1', '2020-05-17 04:24:22.800', NULL, 3, '0');
INSERT INTO `sys_menu` VALUES ('2245134851ecd3537c454ba8a3ef915c', '测试书籍查看', '2', 'test_testBook_view', NULL, '8ce9f148e5720ace1b7cf24e0985c47e', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 20, '1', '2020-05-26 01:12:05.954', '1', '2020-05-26 01:15:07.779', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('23430df88fb72179c2a85c39eaf4d50b', '任务调度日志清空', '2', 'quartz_jobLog_clean', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, b'0', b'0', b'0', b'1', 80, '1', '2019-08-16 07:12:26.285', '1', '2020-05-17 06:40:21.370', NULL, 2, '1');
INSERT INTO `sys_menu` VALUES ('247071d42ff40267c8d8c44eac92da67', '生成方案', '1', NULL, 'scheme', '413892fe8d52c1163d6659f51299dc96', '413892fe8d52c1163d6659f51299dc96,', 'dev', 'gen/scheme/index', b'0', b'0', b'0', b'0', 30, '1', '2019-07-22 04:27:35.000', '1', '2020-05-19 02:39:42.026', NULL, 21, '0');
INSERT INTO `sys_menu` VALUES ('2500', '接口文档', '1', NULL, 'swagger2', 'ef2382c0cc2d99ee73444e684237a88a', 'ef2382c0cc2d99ee73444e684237a88a,', 'swagger', 'tool/swagger/index', b'0', b'0', b'0', b'1', 20, '', '2018-06-27 01:50:32.000', '1', '2020-05-19 17:17:26.914', NULL, 8, '0');
INSERT INTO `sys_menu` VALUES ('2600', '令牌管理', '1', NULL, 'persistent-token', '2000', '2000,', 'dev', 'monitor/persistent-token/index', b'0', b'0', b'0', b'0', 20, '', '2018-09-04 20:58:41.000', '1', '2020-05-17 08:57:31.286', NULL, 14, '0');
INSERT INTO `sys_menu` VALUES ('2601', '令牌删除', '2', 'sys_persistentToken_del', NULL, '2600', '2600,', NULL, NULL, b'0', b'0', b'0', b'1', 1, '', '2018-09-04 20:59:50.000', '1', '2020-05-17 08:57:31.293', NULL, 6, '0');
INSERT INTO `sys_menu` VALUES ('2836ced373377be75936827ecddf7fad', '测试树管理编辑', '2', 'test_testTreeBook_edit', NULL, '8d3517427e527df11d51da528261c915', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 40, '1', '2019-08-12 05:32:06.856', '1', '2020-05-16 12:06:35.180', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('29de79df95e70d8e8fbdc7945acf214a', '任务调度查看', '2', 'quartz_job_view', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, b'0', b'0', b'0', b'1', 10, '1', '2019-08-15 01:36:47.085', '1', '2020-05-17 03:10:40.648', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('29fa5859c9418ab919e172b7d21162de', '测试树查看', '2', 'test_testTreeBook_view', NULL, 'dab11e5104d690be6991002ae4da0cbd', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 20, '1', '2020-05-26 01:15:02.872', '1', '2020-05-30 07:36:26.994', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('2af0268f695b79abdf6e8b10d559d081', '测试树管理删除', '2', 'test_testTreeBook_del', NULL, '8d3517427e527df11d51da528261c915', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 80, '1', '2019-08-12 05:32:06.859', '1', '2020-05-16 12:06:35.180', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('2c0688c2ad9259b9a7e7088a2f6ade4e', '测试书籍', '1', NULL, 'test-book', 'eb17cee437ea6b630dad59fff2a059ca', NULL, 'icon-right-square', 'views/test/test-book/index', b'0', NULL, b'0', b'0', 80, '1', '2020-05-26 00:36:39.119', '1', '2020-05-26 01:12:05.946', NULL, 1, '1');
INSERT INTO `sys_menu` VALUES ('2c8fdecfee63a310266b2e4b94fd3f4c', '任务调度日志删除', '2', 'quartz_jobLog_del', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, b'0', b'0', b'0', b'1', 70, '1', '2019-08-16 07:12:07.842', '1', '2020-05-17 06:40:08.708', NULL, 2, '1');
INSERT INTO `sys_menu` VALUES ('2c90f69bccf0845b1aca8b072b730c39', '任务调度方案删除', '2', 'quartz_job_del', NULL, '322efc9833f2562f8862f882dabdf3d6', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 80, '1', '2019-08-15 01:35:56.092', '1', '2020-05-16 12:06:35.180', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('2d9efe7ea66351a96da68e6a7cca5e00', '任务调度方案删除', '2', 'quartz_job_del', NULL, 'c77855e4171d00ae3f97563a8391f70a', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 80, '1', '2019-08-15 01:36:03.606', '1', '2020-05-16 12:06:35.180', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('310c04e534c9af92935c54b4e1357447', 'tes', '1', 'te', 'te', '54cd27f34ca7e9a8848b92377468965d', '54cd27f34ca7e9a8848b92377468965d,', 'app', 'te', b'0', b'0', b'0', b'1', 999, '1', '2020-05-15 09:17:11.736', '1', '2020-05-16 12:07:50.836', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('322efc9833f2562f8862f882dabdf3d6', '任务调度方案', '1', NULL, 'job', '2000', NULL, 'timing', 'quartz/job/index', b'0', b'0', b'0', b'0', 30, '1', '2019-08-15 01:35:56.081', '1', '2020-05-16 12:07:50.836', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('34acb71268387bb85c80849f7377c7fd', '任务日志导出', '2', 'quartz_jobLog_export', NULL, 'c93f8fca7ca6f8631d383b08ab67009a', '2000,c93f8fca7ca6f8631d383b08ab67009a,', NULL, NULL, b'0', b'0', b'0', b'1', 40, '1', '2019-08-15 01:36:42.000', '1', '2020-05-17 04:43:17.758', NULL, 4, '1');
INSERT INTO `sys_menu` VALUES ('34dae0db3f9c97482d598f964bd4c9c7', '配置管理', '1', NULL, 'configuration', 'ef2382c0cc2d99ee73444e684237a88a', 'ef2382c0cc2d99ee73444e684237a88a,', 'dev', 'admin/configuration/index', b'0', b'0', b'0', b'1', 50, '1', '2019-08-06 08:46:50.000', '1', '2020-05-18 08:54:41.694', NULL, 1, '1');
INSERT INTO `sys_menu` VALUES ('365a9f74f847322d2b8a0eff2b426ef4', '登录日志导出', '2', 'sys_logLogin_export', NULL, 'a41d4ac1a6cc179696e0dbf284e3efc4', 'a41d4ac1a6cc179696e0dbf284e3efc4,', NULL, NULL, b'0', b'0', b'0', b'1', 40, '1', '2019-08-16 00:26:02.000', '1', '2020-05-18 05:55:26.858', NULL, 1, '1');
INSERT INTO `sys_menu` VALUES ('3956b4690e4f49cfb1e065384c1dc0b9', '测试树', '1', NULL, 'test-tree-book', 'eb17cee437ea6b630dad59fff2a059ca', NULL, 'icon-right-square', 'views/test/test-tree-book/index', b'0', NULL, b'0', b'0', 90, '1', '2020-05-26 00:35:47.300', '1', '2020-05-26 01:12:00.658', NULL, 1, '1');
INSERT INTO `sys_menu` VALUES ('3c1c5a48888650b9a7ba5a1763f2e205', '任务日志查看', '2', 'quartz_jobLog_view', NULL, 'c93f8fca7ca6f8631d383b08ab67009a', '2000,c93f8fca7ca6f8631d383b08ab67009a,', NULL, NULL, b'0', b'0', b'0', b'1', 20, '1', '2019-08-15 01:36:42.000', '1', '2020-05-17 04:43:17.732', NULL, 4, '1');
INSERT INTO `sys_menu` VALUES ('413892fe8d52c1163d6659f51299dc96', '代码生成', '0', NULL, '/gen', 'ef2382c0cc2d99ee73444e684237a88a', 'ef2382c0cc2d99ee73444e684237a88a,', 'codeConsole', 'gen/index', b'0', b'0', b'0', b'0', 10, '1', '2019-07-21 03:00:48.000', '1', '2020-05-19 02:39:41.987', NULL, 47, '0');
INSERT INTO `sys_menu` VALUES ('48ffd1c39241ab2b4c206155bb2ae8b4', '测试书籍查看', '2', 'test_testBook_view', NULL, '4f5c94e30f3a64e8e1f1bf10e7247e7e', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 20, '1', '2020-05-26 01:15:07.785', '1', '2020-05-30 07:36:26.964', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('4f5c94e30f3a64e8e1f1bf10e7247e7e', '测试书籍', '1', NULL, 'test-book', 'eb17cee437ea6b630dad59fff2a059ca', NULL, 'icon-right-square', 'test/test-book/index', b'0', b'0', b'0', b'0', 30, '1', '2020-05-26 01:15:07.782', '1', '2020-05-30 07:36:34.943', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('511c942a5770b6bfa10fbdb3e2fa9d10', '测试树删除', '2', 'test_testTreeBook_del', NULL, 'c206444a1d18c7b505dea8ed5a617669', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 80, '1', '2020-05-26 01:12:00.674', '1', '2020-05-26 01:15:02.864', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('52715698214e88cb09fa4dd1ea5ad348', '生成方案菜单', '2', 'gen_scheme_menu', NULL, '247071d42ff40267c8d8c44eac92da67', '413892fe8d52c1163d6659f51299dc96,247071d42ff40267c8d8c44eac92da67,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-07-26 04:03:03.000', '1', '2020-05-19 02:39:42.037', NULL, 8, '0');
INSERT INTO `sys_menu` VALUES ('5404c3df9f771dbc0237578814bbe44b', 'Yaml编辑器', '1', NULL, 'yaml', 'd9d87cf8ed7c29ed2eda06d5dec4dcda', 'd9d87cf8ed7c29ed2eda06d5dec4dcda,', 'dev', 'components/YamlEdit', b'0', b'0', b'0', b'1', 50, '1', '2020-05-16 12:22:43.364', '1', '2020-05-16 12:22:43.364', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('5431004fa397e0280fd75c4a3b73c4aa', '登录日志查看', '2', 'sys_logLogin_view', NULL, 'a41d4ac1a6cc179696e0dbf284e3efc4', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 20, '1', '2019-08-16 00:26:02.349', '1', '2020-05-18 05:55:26.848', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('54cd27f34ca7e9a8848b92377468965d', 'test', '1', 'test', 'tes', '-1', NULL, 'Steve-Jobs', 'tes', b'1', b'0', b'1', b'0', 999, '1', '2020-05-15 09:16:52.599', '1', '2020-05-16 12:07:50.836', NULL, 2, '1');
INSERT INTO `sys_menu` VALUES ('5b39ca5a25c772105c71f8c51d1f19d4', '三级菜单1', '1', NULL, 'menu1-1', '1ae562534a64d4473899e52497c40b2e', 'eb17cee437ea6b630dad59fff2a059ca,1ae562534a64d4473899e52497c40b2e,', 'dev', 'nested/menu1/menu1-1', b'0', b'0', b'0', b'1', 30, '1', '2020-05-19 02:11:16.436', '1', '2020-05-26 01:13:50.586', NULL, 6, '0');
INSERT INTO `sys_menu` VALUES ('5d94bc2151ec9572966e5e768824752d', '测试树查看', '2', 'test_testTreeBook_view', NULL, '3956b4690e4f49cfb1e065384c1dc0b9', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 20, '1', '2020-05-26 00:35:47.304', '1', '2020-05-26 01:12:00.658', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('5da31e19f05edeea6a7041e3101deefe', '任务日志删除', '2', 'quartz_jobLog_del', NULL, 'c93f8fca7ca6f8631d383b08ab67009a', '2000,c93f8fca7ca6f8631d383b08ab67009a,', NULL, NULL, b'0', b'0', b'0', b'1', 80, '1', '2019-08-15 01:36:42.000', '1', '2020-05-17 04:43:17.702', NULL, 4, '1');
INSERT INTO `sys_menu` VALUES ('618ee4b9660265a85a8b61277de2a579', '富文本', '1', NULL, 'editor', 'd9d87cf8ed7c29ed2eda06d5dec4dcda', 'd9d87cf8ed7c29ed2eda06d5dec4dcda,', 'fwb', 'components/Editor', b'0', b'0', b'0', b'1', 30, '1', '2020-05-16 12:16:40.552', '1', '2020-05-16 12:16:50.233', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('621e50e1c7d66a1febeb699bebb2fe35', '任务调度执行', '2', 'quartz_job_run', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, b'0', b'0', b'0', b'1', 20, '1', '2019-08-16 07:10:59.000', '1', '2020-05-17 03:11:01.548', NULL, 2, '0');
INSERT INTO `sys_menu` VALUES ('64b61b8966e1c74d9b309069b2f622d1', '图标库', '1', NULL, 'icons', 'd9d87cf8ed7c29ed2eda06d5dec4dcda', 'd9d87cf8ed7c29ed2eda06d5dec4dcda,', 'icon', 'components/icons/index', b'0', b'0', b'0', b'1', 10, '1', '2020-05-16 12:14:28.945', '1', '2020-05-16 12:15:00.712', NULL, 2, '0');
INSERT INTO `sys_menu` VALUES ('6e3f89cda84ac2c6e715e7812c102ae8', '在线用户', '1', '', 'user-online', '2000', '2000,', 'Steve-Jobs', 'monitor/user-online/index', b'0', b'0', b'0', b'0', 30, '1', '2019-08-08 00:03:52.000', '1', '2020-05-17 08:55:59.718', NULL, 10, '0');
INSERT INTO `sys_menu` VALUES ('74f2b2a8871a298e0acc4d7129d10e9c', '任务调度', '1', NULL, 'job', '1000', '1000,', 'timing', 'quartz/job/index', b'0', b'0', b'0', b'0', 60, '1', '2019-08-15 01:36:47.081', '1', '2020-05-17 08:56:34.966', NULL, 22, '0');
INSERT INTO `sys_menu` VALUES ('76d6087052dc26b32f3efa71b9cc119b', '任务调度日志', '2', 'quartz_jobLog_view', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, b'0', b'0', b'0', b'1', 50, '1', '2019-08-16 07:11:30.986', '1', '2020-05-17 04:43:44.992', NULL, 3, '0');
INSERT INTO `sys_menu` VALUES ('7754b1457826c48290bc189bb1289740', '支付宝工具', '1', NULL, 'alipay', 'ef2382c0cc2d99ee73444e684237a88a', 'ef2382c0cc2d99ee73444e684237a88a,', 'alipay', 'tool/alipay/index', b'0', b'0', b'0', b'1', 40, '1', '2020-05-18 08:58:06.876', '1', '2020-05-19 17:17:53.063', NULL, 2, '0');
INSERT INTO `sys_menu` VALUES ('795b4d5cf0eb3ed80e24cbab39727b9d', 'Markdown', '1', NULL, 'markdown', 'd9d87cf8ed7c29ed2eda06d5dec4dcda', 'd9d87cf8ed7c29ed2eda06d5dec4dcda,', 'markdown', 'components/MarkDown', b'0', b'0', b'0', b'1', 40, '1', '2020-05-16 12:21:46.675', '1', '2020-05-16 12:22:53.122', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('7b14af9e9fbff286856338a194422b07', '令牌查看', '2', 'sys_persistentToken_view', NULL, '2600', '2600,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-09 00:44:25.617', '1', '2020-05-17 08:57:31.295', NULL, 4, '0');
INSERT INTO `sys_menu` VALUES ('7c7a876f4cceba2dd92aa539dea6b6e5', '任务日志清空', '2', 'quartz_jobLog_clean', NULL, 'c93f8fca7ca6f8631d383b08ab67009a', '2000,c93f8fca7ca6f8631d383b08ab67009a,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-16 04:55:37.892', '1', '2020-05-17 04:43:17.774', NULL, 1, '1');
INSERT INTO `sys_menu` VALUES ('84f55c785ae71eb65e7325e148818041', '测试树查看', '2', 'test_testTreeBook_view', NULL, 'c206444a1d18c7b505dea8ed5a617669', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 20, '1', '2020-05-26 01:12:00.667', '1', '2020-05-26 01:15:02.864', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('862fa87cbc10766da4de286804e01d13', '测试树删除', '2', 'test_testTreeBook_del', NULL, 'dab11e5104d690be6991002ae4da0cbd', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 80, '1', '2020-05-26 01:15:02.877', '1', '2020-05-30 07:36:26.973', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('8ce9f148e5720ace1b7cf24e0985c47e', '测试书籍', '1', NULL, 'test-book', 'eb17cee437ea6b630dad59fff2a059ca', NULL, 'icon-right-square', 'test/test-book/index', b'0', NULL, b'0', b'0', 90, '1', '2020-05-26 01:12:05.950', '1', '2020-05-26 01:15:07.779', NULL, 1, '1');
INSERT INTO `sys_menu` VALUES ('8d3517427e527df11d51da528261c915', '测试树管理', '1', NULL, 'test-tree-book', '413892fe8d52c1163d6659f51299dc96', NULL, 'dev', 'test/test-tree-book/index', b'0', b'0', b'0', b'0', 30, '1', '2019-08-12 05:32:06.849', '1', '2020-05-16 12:07:50.836', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('92f78825551a22fa130c03066f398448', '在线用户删除', '2', 'sys_userOnline_del', NULL, '6e3f89cda84ac2c6e715e7812c102ae8', '2000,6e3f89cda84ac2c6e715e7812c102ae8,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-08 00:06:33.448', '1', '2020-05-17 08:55:59.728', NULL, 5, '0');
INSERT INTO `sys_menu` VALUES ('94b57a562063d103423e2c6125cb30ad', '菜单查看', '2', 'sys_menu_view', NULL, '1200', '1200,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-08 08:27:59.697', '1', '2020-05-16 12:06:35.180', NULL, 1, '1');
INSERT INTO `sys_menu` VALUES ('9763343d9cce11ce9eb4f21c8e49122b', '任务调度编辑', '2', 'quartz_job_edit', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-15 01:36:47.088', '1', '2020-05-17 03:11:35.820', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('97722c6d56c8b9990cc3c1a6eea3d6bb', '业务表编辑', '1', 'gen_table_edit', 'edit', '413892fe8d52c1163d6659f51299dc96', 'ef2382c0cc2d99ee73444e684237a88a,413892fe8d52c1163d6659f51299dc96,', NULL, 'gen/table/edit', b'1', b'0', b'0', b'1', 20, '1', '2019-07-22 04:24:02.000', '1', '2020-05-19 02:39:42.048', NULL, 10, '0');
INSERT INTO `sys_menu` VALUES ('9f02e346b5350366968f217daef3f1b7', '图表库', '1', NULL, 'Echarts', 'd9d87cf8ed7c29ed2eda06d5dec4dcda', 'd9d87cf8ed7c29ed2eda06d5dec4dcda,', 'chart', 'components/Echarts', b'0', b'0', b'0', b'1', 20, '1', '2020-05-16 12:12:39.827', '1', '2020-05-16 12:15:09.128', NULL, 2, '0');
INSERT INTO `sys_menu` VALUES ('a18b33e15bde209a3c9115517c56d9ec', '业务表', '1', '', 'table', '413892fe8d52c1163d6659f51299dc96', 'ef2382c0cc2d99ee73444e684237a88a,413892fe8d52c1163d6659f51299dc96,', 'database', 'gen/table/index', b'0', b'0', b'0', b'0', 10, '1', '2019-07-21 03:02:02.000', '1', '2020-05-19 02:39:42.059', NULL, 23, '0');
INSERT INTO `sys_menu` VALUES ('a41d4ac1a6cc179696e0dbf284e3efc4', '登录日志', '1', NULL, 'log-login', '2000', '2000,', 'log', 'monitor//log-login/index', b'0', b'0', b'0', b'0', 50, '1', '2019-08-16 00:26:02.345', '1', '2020-05-18 05:55:36.150', NULL, 8, '1');
INSERT INTO `sys_menu` VALUES ('b6bcb9fa8a3726bfbffb955dc9f56b91', '测试书籍编辑', '2', 'test_testBook_edit', NULL, '8ce9f148e5720ace1b7cf24e0985c47e', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 40, '1', '2020-05-26 01:12:05.958', '1', '2020-05-26 01:15:07.779', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('b8eafb6c3a8bf0919230f0bfa59d86b6', '二级菜单2', '1', NULL, 'menu2', 'eb17cee437ea6b630dad59fff2a059ca', 'eb17cee437ea6b630dad59fff2a059ca,', 'dev', 'nested/menu2/index', b'0', b'0', b'0', b'1', 30, '1', '2020-05-19 02:14:32.907', '1', '2020-05-19 02:15:14.535', NULL, 2, '0');
INSERT INTO `sys_menu` VALUES ('b961670cbf3454f5927c4bd2a327e915', '生成方案删除', '2', 'gen_scheme_del', NULL, '247071d42ff40267c8d8c44eac92da67', '413892fe8d52c1163d6659f51299dc96,247071d42ff40267c8d8c44eac92da67,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-07-22 04:30:18.000', '1', '2020-05-19 02:39:42.072', NULL, 8, '0');
INSERT INTO `sys_menu` VALUES ('b963a451117f430703817b3b6c87402a', '任务调度日志导出', '2', 'quartz_jobLog_export', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, b'0', b'0', b'0', b'1', 60, '1', '2019-08-16 07:13:16.742', '1', '2020-05-17 04:43:54.409', NULL, 2, '0');
INSERT INTO `sys_menu` VALUES ('ba860cfe687fd01fd492c683907936aa', '测试树编辑', '2', 'test_testTreeBook_edit', NULL, 'dab11e5104d690be6991002ae4da0cbd', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 40, '1', '2020-05-26 01:15:02.874', '1', '2020-05-30 07:36:27.013', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('bb9dd4b7a2a462193d0f01517308f812', '业务表查看', '2', 'gen_table_view', NULL, 'a18b33e15bde209a3c9115517c56d9ec', 'ef2382c0cc2d99ee73444e684237a88a,413892fe8d52c1163d6659f51299dc96,a18b33e15bde209a3c9115517c56d9ec,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-11 23:47:39.828', '1', '2020-05-19 02:39:42.081', NULL, 5, '0');
INSERT INTO `sys_menu` VALUES ('bceaa6c321109b9becd91e3eac3647c0', '测试书籍编辑', '2', 'test_testBook_edit', NULL, '4f5c94e30f3a64e8e1f1bf10e7247e7e', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 40, '1', '2020-05-26 01:15:07.788', '1', '2020-05-30 07:36:26.983', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('bd62904371247f56594741ff8e9bded9', '用户导出', '2', 'sys_user_export', NULL, '1100', '1000,1100,', NULL, NULL, b'0', b'0', b'0', b'1', 80, '1', '2019-08-08 08:50:02.000', '1', '2020-05-16 12:06:35.180', NULL, 7, '0');
INSERT INTO `sys_menu` VALUES ('c0ba37c10abaecd89a738c5cf2a2fd24', '服务监控', '1', 'sys_monitor_view', 'server', '2000', '2000,', 'codeConsole', 'monitor/server/index', b'0', b'0', b'0', b'1', 40, '1', '2019-08-06 08:21:10.000', '1', '2020-05-18 07:52:02.586', NULL, 5, '0');
INSERT INTO `sys_menu` VALUES ('c206444a1d18c7b505dea8ed5a617669', '测试树', '1', NULL, 'test-tree-book', 'eb17cee437ea6b630dad59fff2a059ca', 'eb17cee437ea6b630dad59fff2a059ca,', 'icon-right-square', 'test/test-tree-book/index', b'0', b'0', b'1', b'0', 80, '1', '2020-05-26 01:12:00.664', '1', '2020-05-26 01:15:02.864', NULL, 2, '1');
INSERT INTO `sys_menu` VALUES ('c77855e4171d00ae3f97563a8391f70a', '任务调度方案', '1', NULL, 'job', '2000', NULL, 'timing', 'quartz/job/index', b'0', b'0', b'0', b'0', 30, '1', '2019-08-15 01:36:03.593', '1', '2020-05-16 12:07:50.836', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('c7bc1d64972e77c15ed42d5cf21d9ec5', '测试树删除', '2', 'test_testTreeBook_del', NULL, '3956b4690e4f49cfb1e065384c1dc0b9', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 80, '1', '2020-05-26 00:35:47.314', '1', '2020-05-26 01:12:00.658', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('c8b84044eac87a2e2ed0e10da9e095d2', '测试书籍编辑', '2', 'test_testBook_edit', NULL, '2c0688c2ad9259b9a7e7088a2f6ade4e', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 40, '1', '2020-05-26 00:36:39.128', '1', '2020-05-26 01:12:05.946', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('c93f8fca7ca6f8631d383b08ab67009a', '任务日志', '1', NULL, 'job-log', '2000', '2000,', 'log', 'quartz/job-log/index', b'0', b'0', b'0', b'0', 60, '1', '2019-08-15 01:36:42.000', '1', '2020-05-17 04:43:26.449', NULL, 14, '1');
INSERT INTO `sys_menu` VALUES ('caaec41413c5713c6f290efe08c11415', '生成方案查看', '2', 'gen_scheme_view', NULL, '247071d42ff40267c8d8c44eac92da67', '413892fe8d52c1163d6659f51299dc96,247071d42ff40267c8d8c44eac92da67,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-11 23:48:09.000', '1', '2020-05-19 02:39:42.095', NULL, 5, '0');
INSERT INTO `sys_menu` VALUES ('d4c16faad8f883650a3a8eab829ebad9', '操作日志查看', '2', 'sys_logOperate_view', NULL, '2100', '2000,2100,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-08 08:51:38.454', '1', '2020-05-18 01:23:57.546', NULL, 2, '0');
INSERT INTO `sys_menu` VALUES ('d5642a62bb1dc261baaf7dc883bba7e1', '测试书籍删除', '2', 'test_testBook_del', NULL, '8ce9f148e5720ace1b7cf24e0985c47e', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 80, '1', '2020-05-26 01:12:05.961', '1', '2020-05-26 01:15:07.779', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('d5897b78312e09024546530fd8b2e8fc', '任务调度方案查看', '2', 'quartz_job_view', NULL, 'c77855e4171d00ae3f97563a8391f70a', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 20, '1', '2019-08-15 01:36:03.598', '1', '2020-05-16 12:06:35.180', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('d9d87cf8ed7c29ed2eda06d5dec4dcda', '组件管理', '0', NULL, '/components', '-1', NULL, 'zujian', 'Layout', b'0', b'0', b'0', b'0', 80, '1', '2020-05-16 11:57:28.521', '1', '2020-05-17 04:38:57.307', NULL, 26, '0');
INSERT INTO `sys_menu` VALUES ('da5709484a056154e0e89891eea6d6ac', '测试书籍查看', '2', 'test_testBook_view', NULL, '2c0688c2ad9259b9a7e7088a2f6ade4e', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 20, '1', '2020-05-26 00:36:39.124', '1', '2020-05-26 01:12:05.946', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('dab11e5104d690be6991002ae4da0cbd', '测试树', '1', NULL, 'test-tree-book', 'eb17cee437ea6b630dad59fff2a059ca', NULL, 'icon-right-square', 'test/test-tree-book/index', b'0', b'0', b'0', b'0', 30, '1', '2020-05-26 01:15:02.868', '1', '2020-05-30 07:36:34.931', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('e086c4aa4943a883b29cf94680608b89', '生成方案代码', '2', 'gen_scheme_code', NULL, '247071d42ff40267c8d8c44eac92da67', '413892fe8d52c1163d6659f51299dc96,247071d42ff40267c8d8c44eac92da67,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-11 23:55:37.000', '1', '2020-05-19 02:39:42.099', NULL, 3, '0');
INSERT INTO `sys_menu` VALUES ('e590df103d3382d3091eae818f68626b', '测试树管理查看', '2', 'test_testTreeBook_view', NULL, '8d3517427e527df11d51da528261c915', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 20, '1', '2019-08-12 05:32:06.853', '1', '2020-05-16 12:06:35.180', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('e5ea38c1f97dee0043e78f3fb27b25d6', '生成方案编辑', '2', 'gen_scheme_edit', NULL, '247071d42ff40267c8d8c44eac92da67', '413892fe8d52c1163d6659f51299dc96,247071d42ff40267c8d8c44eac92da67,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-07-22 04:29:14.000', '1', '2020-05-19 02:39:42.102', NULL, 6, '0');
INSERT INTO `sys_menu` VALUES ('e66c7efccb9e1a0519afc328339e9108', '登录日志删除', '2', 'sys_logLogin_del', NULL, 'a41d4ac1a6cc179696e0dbf284e3efc4', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 80, '1', '2019-08-16 00:26:02.357', '1', '2020-05-18 05:55:26.867', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('e6ea0a5dc986c69852010e4a24329cf1', '任务调度方案编辑', '2', 'quartz_job_edit', NULL, '322efc9833f2562f8862f882dabdf3d6', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 40, '1', '2019-08-15 01:35:56.089', '1', '2020-05-16 12:06:35.180', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('e710a66583fe0e324492462adb16014e', '业务表删除', '2', 'gen_table_del', NULL, 'a18b33e15bde209a3c9115517c56d9ec', 'ef2382c0cc2d99ee73444e684237a88a,413892fe8d52c1163d6659f51299dc96,a18b33e15bde209a3c9115517c56d9ec,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-07-22 04:24:45.000', '1', '2020-05-19 02:39:42.110', NULL, 6, '0');
INSERT INTO `sys_menu` VALUES ('eb17cee437ea6b630dad59fff2a059ca', '多级菜单', '0', NULL, '/nested', '-1', NULL, 'dev', 'Layout', b'0', b'0', b'0', b'0', 100, '1', '2020-05-19 02:09:23.393', '1', '2020-05-26 01:13:50.571', NULL, 13, '0');
INSERT INTO `sys_menu` VALUES ('ef2382c0cc2d99ee73444e684237a88a', '系统工具', '0', NULL, '/admin', '-1', NULL, 'sys-tools', 'Layout', b'0', b'0', b'0', b'0', 30, '1', '2019-08-06 06:58:12.000', '1', '2020-05-19 17:17:53.050', NULL, 46, '0');
INSERT INTO `sys_menu` VALUES ('f15e2186907d22765cd149a94905842a', '在线用户强退', '2', 'sys_userOnline_logout', NULL, '6e3f89cda84ac2c6e715e7812c102ae8', '2000,6e3f89cda84ac2c6e715e7812c102ae8,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1', '2019-08-12 01:57:51.502', '1', '2020-05-17 08:55:59.729', NULL, 5, '0');
INSERT INTO `sys_menu` VALUES ('f6d6b0be40b21899380fd7983d371c3a', '测试书籍删除', '2', 'test_testBook_del', NULL, '2c0688c2ad9259b9a7e7088a2f6ade4e', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 80, '1', '2020-05-26 00:36:39.132', '1', '2020-05-26 01:12:05.946', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('f9ad900ea905f0d388d9d2da66a42aef', '测试树编辑', '2', 'test_testTreeBook_edit', NULL, 'c206444a1d18c7b505dea8ed5a617669', NULL, NULL, NULL, b'0', NULL, b'0', b'0', 40, '1', '2020-05-26 01:12:00.671', '1', '2020-05-26 01:15:02.864', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('fe4c7938e146ec223e99d426aaa87109', '三级菜单2', '1', NULL, 'menu1-2', '1ae562534a64d4473899e52497c40b2e', 'eb17cee437ea6b630dad59fff2a059ca,1ae562534a64d4473899e52497c40b2e,', 'dev', 'nested/menu1/menu1-2', b'0', b'0', b'0', b'1', 30, '1', '2020-05-19 02:13:18.819', '1', '2020-05-26 01:13:50.588', NULL, 3, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_oauth_client_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_detail`;
CREATE TABLE `sys_oauth_client_detail` (
  `client_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '客户端ID',
  `resource_ids` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源ID',
  `client_secret` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户端密钥',
  `scope` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '作用域',
  `authorized_grant_types` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '授权方式',
  `web_server_redirect_uri` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '重定向地址',
  `authorities` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限',
  `access_token_validity` int(11) DEFAULT NULL COMMENT '请求令牌有效时间',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT '刷新令牌有效时间',
  `additional_information` varchar(4096) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展信息',
  `autoapprove` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否自动放行',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='终端信息表';

-- ----------------------------
-- Records of sys_oauth_client_detail
-- ----------------------------
BEGIN;
INSERT INTO `sys_oauth_client_detail` VALUES ('albedo', NULL, 'albedo', 'server', 'password,refresh_token,authorization_code,client_credentials', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail` VALUES ('app', NULL, 'app', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail` VALUES ('daemon', NULL, 'daemon', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail` VALUES ('gen', NULL, 'gen', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail` VALUES ('swagger', NULL, 'swagger', 'all', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `level` int(11) DEFAULT NULL COMMENT '角色级别',
  `data_scope` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据权限 1全部 2所在机构及以下数据  3 所在机构数据  4仅本人数据 5 按明细设置',
  `available` char(1) COLLATE utf8mb4_bin DEFAULT '1' COMMENT '1-正常，0-锁定',
  `created_by` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3),
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `version` int(11) NOT NULL,
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '管理员', NULL, '1', '1', '', '2017-10-29 15:45:51.000', '1', '2019-10-23 14:51:52.673', NULL, 61, '0');
INSERT INTO `sys_role` VALUES ('2', 'ROLE_CQQ', NULL, '2', '1', '', '2018-11-11 19:42:26.000', '90da0206c39867a1b36ac36ced80c1a9', '2020-04-03 16:49:12.114', NULL, 22, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `dept_id` varchar(32) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES ('1f22837ee7b6f7aacf0563cd5ed1fb8f', '2', '4');
INSERT INTO `sys_role_dept` VALUES ('60ea8dc84a13664c1b8b26bc7af11158', '2', '1');
INSERT INTO `sys_role_dept` VALUES ('7addd9aa594621c74007263800ac2b7b', '1', '8');
INSERT INTO `sys_role_dept` VALUES ('a5619c152b46b9d015bea34f7bde52fb', '2', '3');
INSERT INTO `sys_role_dept` VALUES ('ef156f1e7751861a972c5e5f635901b3', '2', '5');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(32) NOT NULL COMMENT '角色ID',
  `menu_id` varchar(32) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1100');
INSERT INTO `sys_role_menu` VALUES ('1', '1101');
INSERT INTO `sys_role_menu` VALUES ('1', '1102');
INSERT INTO `sys_role_menu` VALUES ('1', '1103');
INSERT INTO `sys_role_menu` VALUES ('1', '1200');
INSERT INTO `sys_role_menu` VALUES ('1', '1201');
INSERT INTO `sys_role_menu` VALUES ('1', '1202');
INSERT INTO `sys_role_menu` VALUES ('1', '1203');
INSERT INTO `sys_role_menu` VALUES ('1', '1300');
INSERT INTO `sys_role_menu` VALUES ('1', '1301');
INSERT INTO `sys_role_menu` VALUES ('1', '1302');
INSERT INTO `sys_role_menu` VALUES ('1', '1303');
INSERT INTO `sys_role_menu` VALUES ('1', '1304');
INSERT INTO `sys_role_menu` VALUES ('1', '13093fb658c1806ad5bd0600316158f2');
INSERT INTO `sys_role_menu` VALUES ('1', '1400');
INSERT INTO `sys_role_menu` VALUES ('1', '1401');
INSERT INTO `sys_role_menu` VALUES ('1', '1402');
INSERT INTO `sys_role_menu` VALUES ('1', '1403');
INSERT INTO `sys_role_menu` VALUES ('1', '18d6b5e0f6b986cd074bf23de11ecd34');
INSERT INTO `sys_role_menu` VALUES ('1', '1a900c3f10ef5b0987e0a8ee4445316d');
INSERT INTO `sys_role_menu` VALUES ('1', '2000');
INSERT INTO `sys_role_menu` VALUES ('1', '2100');
INSERT INTO `sys_role_menu` VALUES ('1', '2101');
INSERT INTO `sys_role_menu` VALUES ('1', '2200');
INSERT INTO `sys_role_menu` VALUES ('1', '2201');
INSERT INTO `sys_role_menu` VALUES ('1', '2202');
INSERT INTO `sys_role_menu` VALUES ('1', '23430df88fb72179c2a85c39eaf4d50b');
INSERT INTO `sys_role_menu` VALUES ('1', '247071d42ff40267c8d8c44eac92da67');
INSERT INTO `sys_role_menu` VALUES ('1', '2500');
INSERT INTO `sys_role_menu` VALUES ('1', '2600');
INSERT INTO `sys_role_menu` VALUES ('1', '2601');
INSERT INTO `sys_role_menu` VALUES ('1', '29de79df95e70d8e8fbdc7945acf214a');
INSERT INTO `sys_role_menu` VALUES ('1', '2c8fdecfee63a310266b2e4b94fd3f4c');
INSERT INTO `sys_role_menu` VALUES ('1', '34acb71268387bb85c80849f7377c7fd');
INSERT INTO `sys_role_menu` VALUES ('1', '3c1c5a48888650b9a7ba5a1763f2e205');
INSERT INTO `sys_role_menu` VALUES ('1', '413892fe8d52c1163d6659f51299dc96');
INSERT INTO `sys_role_menu` VALUES ('1', '52715698214e88cb09fa4dd1ea5ad348');
INSERT INTO `sys_role_menu` VALUES ('1', '5da31e19f05edeea6a7041e3101deefe');
INSERT INTO `sys_role_menu` VALUES ('1', '621e50e1c7d66a1febeb699bebb2fe35');
INSERT INTO `sys_role_menu` VALUES ('1', '74f2b2a8871a298e0acc4d7129d10e9c');
INSERT INTO `sys_role_menu` VALUES ('1', '76d6087052dc26b32f3efa71b9cc119b');
INSERT INTO `sys_role_menu` VALUES ('1', '7b14af9e9fbff286856338a194422b07');
INSERT INTO `sys_role_menu` VALUES ('1', '7c7a876f4cceba2dd92aa539dea6b6e5');
INSERT INTO `sys_role_menu` VALUES ('1', '825f7504bb7932eec7b19716c9afea0f');
INSERT INTO `sys_role_menu` VALUES ('1', '94b57a562063d103423e2c6125cb30ad');
INSERT INTO `sys_role_menu` VALUES ('1', '9763343d9cce11ce9eb4f21c8e49122b');
INSERT INTO `sys_role_menu` VALUES ('1', '97722c6d56c8b9990cc3c1a6eea3d6bb');
INSERT INTO `sys_role_menu` VALUES ('1', 'a18b33e15bde209a3c9115517c56d9ec');
INSERT INTO `sys_role_menu` VALUES ('1', 'b961670cbf3454f5927c4bd2a327e915');
INSERT INTO `sys_role_menu` VALUES ('1', 'b963a451117f430703817b3b6c87402a');
INSERT INTO `sys_role_menu` VALUES ('1', 'bb9dd4b7a2a462193d0f01517308f812');
INSERT INTO `sys_role_menu` VALUES ('1', 'bd62904371247f56594741ff8e9bded9');
INSERT INTO `sys_role_menu` VALUES ('1', 'c93f8fca7ca6f8631d383b08ab67009a');
INSERT INTO `sys_role_menu` VALUES ('1', 'caaec41413c5713c6f290efe08c11415');
INSERT INTO `sys_role_menu` VALUES ('1', 'd4c16faad8f883650a3a8eab829ebad9');
INSERT INTO `sys_role_menu` VALUES ('1', 'e086c4aa4943a883b29cf94680608b89');
INSERT INTO `sys_role_menu` VALUES ('1', 'e5ea38c1f97dee0043e78f3fb27b25d6');
INSERT INTO `sys_role_menu` VALUES ('1', 'e710a66583fe0e324492462adb16014e');
INSERT INTO `sys_role_menu` VALUES ('1', 'ec1ff71a4dd5318b6def9b2be47a95e1');
INSERT INTO `sys_role_menu` VALUES ('1', 'ef2382c0cc2d99ee73444e684237a88a');
INSERT INTO `sys_role_menu` VALUES ('2', '1101');
INSERT INTO `sys_role_menu` VALUES ('2', '1102');
INSERT INTO `sys_role_menu` VALUES ('2', '1103');
INSERT INTO `sys_role_menu` VALUES ('2', '1201');
INSERT INTO `sys_role_menu` VALUES ('2', '1202');
INSERT INTO `sys_role_menu` VALUES ('2', '1203');
INSERT INTO `sys_role_menu` VALUES ('2', '1300');
INSERT INTO `sys_role_menu` VALUES ('2', '1301');
INSERT INTO `sys_role_menu` VALUES ('2', '1302');
INSERT INTO `sys_role_menu` VALUES ('2', '1303');
INSERT INTO `sys_role_menu` VALUES ('2', '1304');
INSERT INTO `sys_role_menu` VALUES ('2', '1400');
INSERT INTO `sys_role_menu` VALUES ('2', '1401');
INSERT INTO `sys_role_menu` VALUES ('2', '1402');
INSERT INTO `sys_role_menu` VALUES ('2', '1403');
INSERT INTO `sys_role_menu` VALUES ('2', '1a900c3f10ef5b0987e0a8ee4445316d');
INSERT INTO `sys_role_menu` VALUES ('2', 'caaec41413c5713c6f290efe08c11415');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '1' COMMENT '主键ID',
  `username` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `nickname` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '昵称',
  `phone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简介',
  `email` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `dept_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门ID',
  `qq_open_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'QQ openid',
  `wx_open_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信openid',
  `available` char(1) COLLATE utf8mb4_bin DEFAULT '1' COMMENT '1-正常，0-锁定',
  `created_by` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `version` int(11) NOT NULL,
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_wx_openid` (`wx_open_id`) USING BTREE,
  KEY `user_qq_openid` (`qq_open_id`) USING BTREE,
  KEY `user_idx1_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$6z14VGdfVnlWY2K1pvdzJOHkvjLmOuBrJXXeZ0mGIqB60Qd6WYDoC', NULL, '17034642999', NULL, '', '1', NULL, 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', '1', '', '2018-04-20 07:15:18.000', '1', '2020-06-01 18:22:31.691', NULL, 9, '0');
INSERT INTO `sys_user` VALUES ('53fb3761bdd95ed3d03f4a07f78ea0eb', 'dsafdf', '$2a$10$81JhU58/uM.JmWKiCAcxoOiSS///NT6rXbSRATa.UgGG8stlA1ABy', NULL, '12343543432', '837158@qq.com', NULL, '3', NULL, NULL, '1', '1', '2019-07-07 14:32:17.000', '1', '2020-03-19 15:49:47.956', NULL, 19, '0');
INSERT INTO `sys_user` VALUES ('90da0206c39867a1b36ac36ced80c1a9', 'test', '$2a$10$G2sntp9sArZVIxq3VjDkve3GLEfm3fZb9nJf5TwQrtvf09niORfri', NULL, NULL, NULL, NULL, '3', NULL, NULL, '1', '1', '2019-07-07 14:35:13.000', '1', '2020-04-03 15:54:40.694', NULL, 40, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `session_id` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '登录ID',
  `username` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_id` varchar(32) DEFAULT NULL COMMENT '部门ID',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ip_address` varchar(50) DEFAULT '' COMMENT 'IP',
  `ip_location` varchar(255) DEFAULT '' COMMENT 'IP地址',
  `user_agent` varchar(2000) DEFAULT NULL COMMENT '用户代理',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('90da0206c39867a1b36ac36ced80c1a9', '2');
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
  `number_` int(11) DEFAULT NULL COMMENT 'key',
  `money_` decimal(20,2) DEFAULT NULL,
  `amount_` double(11,2) DEFAULT NULL,
  `reset_date` timestamp(3) NULL DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
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
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `leaf` bit(1) DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `author_` varchar(50) NOT NULL COMMENT '作者',
  `email_` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone_` varchar(32) DEFAULT NULL COMMENT '手机',
  `activated_` bit(1) NOT NULL,
  `number_` int(11) DEFAULT NULL COMMENT 'key',
  `money_` decimal(20,2) DEFAULT NULL,
  `amount_` double(11,2) DEFAULT NULL,
  `reset_date` timestamp(3) NULL DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  `version` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='  测试树书';

-- ----------------------------
-- Records of test_tree_book
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
