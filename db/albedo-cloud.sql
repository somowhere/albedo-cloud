/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : albedo-cloud

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 11/04/2022 14:02:54
*/

DROP DATABASE IF EXISTS `albedo-cloud`;

CREATE DATABASE  `albedo-cloud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE `albedo-cloud`;
SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_appendix
-- ----------------------------
DROP TABLE IF EXISTS `sys_appendix`;
CREATE TABLE `sys_appendix`
(
  `id`                 bigint(0) NOT NULL COMMENT 'ID',
  `biz_id`             bigint(0) NOT NULL DEFAULT 0 COMMENT '业务id',
  `biz_type`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '业务类型',
  `file_type`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件类型',
  `bucket`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '桶',
  `path`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件相对地址',
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '原始文件名',
  `content_type`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件类型',
  `size`               bigint(0) NULL DEFAULT 0 COMMENT '大小',
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '租户编码',
  `created_by`         bigint(0) NOT NULL,
  `created_date`       timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
  `last_modified_by`   bigint(0) NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '修改时间',
  `description`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version`            int(0) NOT NULL,
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_appendix
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
  `id`                 varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL,
  `parent_id`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_ids`         varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单IDs',
  `name`               varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `sort`               int(0) NULL DEFAULT NULL COMMENT '排序',
  `leaf`               bit(1) NULL DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `available`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '1-正常，0-锁定',
  `created_by`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL,
  `created_date`       timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
  `last_modified_by`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '修改时间',
  `version`            int(0) NOT NULL,
  `description`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept`
VALUES ('1', '-1', NULL, '总部', 30, b'0', '1', '1', '2020-05-16 02:26:57.020', '1', '2021-12-23 10:14:44.459', 15, '',
        '0', '0000');
INSERT INTO `sys_dept`
VALUES ('2', '1', '1,', '运营部', 30, b'1', '1', '1', '2020-05-16 03:03:46.542', '1', '2021-12-23 10:14:44.467', 2, '',
        '0', '0000');
INSERT INTO `sys_dept`
VALUES ('3', '1', '1,', 'AI部', 30, b'1', '1', '1', '2020-05-16 03:04:11.395', '1', '2021-12-23 10:14:44.468', 3, NULL,
        '0', '0000');
INSERT INTO `sys_dept`
VALUES ('4', '-1', NULL, 'test', 1, b'0', '1', '1', '2020-05-16 03:05:05.919', '1', '2021-12-23 10:14:44.469', 1, NULL,
        '1', '0000');
INSERT INTO `sys_dept`
VALUES ('5', '-1', NULL, '平台', 30, b'1', '1', '1', '2020-05-16 02:28:08.383', '1', '2021-12-23 10:14:44.471', 2, NULL,
        '0', '0000');
INSERT INTO `sys_dept`
VALUES ('6', '1', '1,', '测试部', 30, b'1', '1', '1', '2020-05-16 03:03:57.184', '1', '2021-12-23 10:14:44.473', 1, NULL,
        '0', '0000');
INSERT INTO `sys_dept`
VALUES ('7', '1', '1,', '开发部', 30, b'1', '1', '1', '2020-05-16 03:03:23.518', '1', '2021-12-23 10:14:44.490', 3, NULL,
        '0', '0000');

-- ----------------------------
-- Table structure for sys_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation`
(
  `ancestor`    varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci   NOT NULL COMMENT '祖先节点',
  `descendant`  varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci   NOT NULL COMMENT '后代节点',
  `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`ancestor`, `descendant`) USING BTREE,
  INDEX         `idx1`(`ancestor`) USING BTREE,
  INDEX         `idx2`(`descendant`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '部门关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept_relation
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`
(
  `id`                 bigint(0) NOT NULL COMMENT '编号',
  `name`               varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '标签名',
  `val`                varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据值',
  `code`               varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '类型',
  `parent_id`          bigint(0) NULL DEFAULT NULL COMMENT '父菜单ID',
  `parent_ids`         varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单IDs',
  `sort`               int(0) NOT NULL COMMENT '排序（升序）',
  `available`          bit(1) NULL DEFAULT b'1' COMMENT '是否显示1 是0否',
  `leaf`               bit(1) NULL DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `created_by`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL,
  `created_date`       timestamp(3)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(3)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '更新时间',
  `version`            int(0) NOT NULL DEFAULT 0,
  `description`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX                `sys_dict_value`(`val`) USING BTREE,
  INDEX                `sys_dict_label`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict`
VALUES (0, '所在机构及以下数据', 'THIS_LEVEL_CHILDREN', 'sys_data_scope_2', 199, '1,', 20, b'1', b'1', '1',
        '2019-07-14 05:53:55.000', '1', '2021-11-22 14:52:37.391', 10, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (1, '数据字典', '', 'base', -1, NULL, 1, b'1', b'0', '1', '2018-07-09 06:16:14.000', '1', '2021-12-08 11:07:00.622',
        17, '', '1', '0000');
INSERT INTO `sys_dict`
VALUES (2, '是否标识', '', 'sys_flag', 455, '1,', 10, b'1', b'0', '1', '2019-06-02 17:17:44.000', '1',
        '2021-11-22 14:49:12.709', 21, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (3, '是', '1', 'sys_flag_yes', 2, '1,', 10, b'1', b'1', '1', '2018-07-09 06:15:40.000', '1',
        '2021-11-22 14:49:12.709', 12, '', '0', '0000');
INSERT INTO `sys_dict`
VALUES (4, '否', '0', 'sys_flag_no', 2, '1,', 30, b'1', b'1', '1', '2019-06-02 17:26:40.000', '1',
        '2021-11-22 14:49:12.709', 8, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (111, '编辑', 'EDIT', 'sys_business_type_edit', 4555, '1,', 20, b'1', b'1', '1', '2019-08-07 16:50:20.634', '1',
        '2021-11-22 14:52:56.329', 6, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (199, '数据范围', '', 'sys_data_scope', 455, '1,', 30, b'1', b'0', '1', '2019-07-14 05:50:08.000', '1',
        '2021-11-22 14:49:12.709', 20, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (222, '运行中', '1', 'quartz_job_status_1', 344, '1,', 10, b'1', b'1', '1', '2020-05-16 10:14:46.614', '1',
        '2021-11-25 16:40:23.140', 2, NULL, '1', '0000');
INSERT INTO `sys_dict`
VALUES (223, '导入', 'IMPORT', 'sys_business_type_import', 4555, '1,', 60, b'1', b'1', '1', '2019-08-07 16:51:45.855',
        '1', '2021-11-22 14:52:56.320', 5, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (233, '其他', 'OTHER', 'sys_business_type_other', 4555, '1,', 90, b'1', b'1', '1', '2020-05-17 13:45:33.764', '1',
        '2021-11-22 14:52:56.317', 1, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (333, '放弃执行', '3', 'quartz_misfire_policy_3', 445, '1,', 30, b'1', b'1', '1', '2019-08-15 10:24:54.175', '1',
        '2021-11-25 16:40:12.635', 4, NULL, '1', '0000');
INSERT INTO `sys_dict`
VALUES (334, '按明细设置', 'CUSTOMIZE', 'sys_data_scope_5', 199, '1,', 50, b'1', b'1', '1', '2019-07-14 06:01:11.000', '1',
        '2021-11-22 14:52:43.388', 9, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (344, '任务状态', NULL, 'quartz_job_status', 1, '1,', 30, b'1', b'0', '1', '2020-05-16 10:13:18.543', '1',
        '2021-11-25 16:40:31.975', 6, NULL, '1', '0000');
INSERT INTO `sys_dict`
VALUES (345, '失败', '0', 'sys_status_0', 1177, '1,', 30, b'1', b'1', '1', '2019-08-14 11:28:11.000', '1',
        '2021-11-22 14:51:06.891', 3, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (444, '所在机构数据', 'THIS_LEVEL', 'sys_data_scope_3', 199, '1,', 30, b'1', b'1', '1', '2019-07-14 05:59:13.000', '1',
        '2021-11-22 14:52:39.790', 10, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (445, '计划执行错误策略', NULL, 'quartz_misfire_policy', 1, '1,', 30, b'1', b'0', '1', '2019-08-15 10:23:54.460', '1',
        '2021-11-25 16:40:17.971', 11, NULL, '1', '0000');
INSERT INTO `sys_dict`
VALUES (455, '系统数据', 'sys', 'sys', -1, '1,', 30, b'1', b'0', '1', '2019-07-14 01:13:12.000', '1',
        '2021-11-22 14:49:12.709', 30, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (555, '系统', 'SYSTEM', 'quartz_job_group_system', 55345, '1,', 20, b'1', b'1', '1', '2019-08-15 16:34:47.139',
        '1', '2021-11-22 14:53:49.574', 5, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (666, '生成代码', 'GEN_CODE', 'sys_business_type_gen_code', 4555, '1,', 80, b'1', b'1', '1',
        '2019-08-07 16:52:36.997', '1', '2021-11-22 14:52:56.322', 6, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (777, '目录', '0', 'sys_menu_type_0', 66555, '1,', 10, b'1', b'1', '1', '2019-07-14 06:04:10.000', '1',
        '2021-11-22 14:52:05.625', 7, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (888, '操作人类别', NULL, 'sys_operator_type', 455, '1,', 30, b'1', b'0', '1', '2019-08-07 15:37:09.613', '1',
        '2021-11-22 14:49:12.709', 13, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (999, '后台用户', 'MANAGE', 'sys_operate_type_manage', 888, '1,', 20, b'1', b'1', '1', '2019-08-07 16:48:40.344',
        '1', '2021-11-22 14:51:23.856', 6, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (1122, '导出', 'EXPORT', 'sys_business_type_export', 4555, '1,', 50, b'1', b'1', '1', '2019-08-07 16:51:33.286',
        '1', '2021-11-22 14:52:56.328', 5, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (1133, '离线', 'OFFLINE', 'sys_online_status_off_line', 9967, '1,', 30, b'1', b'1', '1', '2019-08-11 11:17:50.132',
        '1', '2021-11-25 09:35:25.921', 3, NULL, '1', '0000');
INSERT INTO `sys_dict`
VALUES (1144, '删除', 'DELETE', 'sys_business_type_delete', 4555, '1,', 40, b'1', b'1', '1', '2019-08-07 16:50:45.270',
        '1', '2021-11-22 14:52:56.329', 5, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (1155, 'test', 'test', 'test', -1, NULL, 30, b'1', b'1', '1', '2019-07-14 03:59:38.000', '1',
        '2021-11-22 14:49:12.709', 0, NULL, '1', '0000');
INSERT INTO `sys_dict`
VALUES (1166, '默认', 'DEFAULT', 'quartz_job_group_default', 55345, '1,', 10, b'1', b'1', '1', '2019-08-15 16:34:28.547',
        '1', '2021-11-22 14:53:49.576', 5, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (1177, '状态', NULL, 'sys_status', 455, '1,', 30, b'1', b'0', '1', '2019-08-14 11:26:50.424', '1',
        '2021-11-22 14:49:12.709', 6, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (4447, '按钮', '2', 'sys_menu_type_2', 66555, '1,', 30, b'1', b'1', '1', '2019-08-07 13:55:24.531', '1',
        '2021-11-22 14:52:12.939', 8, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (4453, '强退', 'FORCE_LOGOUT', 'sys_business_type_force_logout', 4555, '1,', 70, b'1', b'1', '1',
        '2019-08-07 16:52:15.681', '1', '2021-11-22 14:52:56.327', 5, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (4534, '其他', 'OTHER', 'sys_operate_type_other', 888, '1,', 10, b'1', b'1', '1', '2019-08-07 16:48:21.644', '1',
        '2021-11-22 14:51:17.223', 6, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (4555, '业务操作类型', NULL, 'sys_business_type', 455, '1,', 30, b'1', b'0', '1', '2019-08-07 15:33:35.000', '1',
        '2021-11-22 14:49:12.709', 37, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (4564, '执行一次', '2', 'quartz_misfire_policy_2', 445, '1,', 20, b'1', b'1', '1', '2019-08-15 10:24:39.273', '1',
        '2021-11-25 16:39:53.801', 5, NULL, '1', '0000');
INSERT INTO `sys_dict`
VALUES (4623, '立即执行', '1', 'quartz_misfire_policy_1', 445, '1,', 10, b'1', b'1', '1', '2019-08-15 10:24:19.706', '1',
        '2021-11-25 16:39:47.020', 5, NULL, '1', '0000');
INSERT INTO `sys_dict`
VALUES (5555, '已暂停', '0', 'quartz_job_status_0', 344, '1,', 20, b'1', b'1', '1', '2020-05-16 10:15:08.604', '1',
        '2021-11-25 16:40:27.853', 2, NULL, '1', '0000');
INSERT INTO `sys_dict`
VALUES (6663, '锁定', 'LOCK', 'sys_business_type_lock', 4555, '1,', 30, b'1', b'1', '1', '2019-08-07 16:50:32.457', '1',
        '2021-11-22 14:52:56.319', 6, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (7654, '手机端用户', 'MOBILE', 'sys_operate_type_moblie', 888, '1,', 30, b'1', b'1', '1', '2019-08-07 16:49:00.766',
        '1', '2021-11-22 14:51:21.205', 6, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (9967, '在线状态', NULL, 'sys_online_status', 455, '1,', 30, b'1', b'0', '1', '2019-08-11 11:16:52.095', '1',
        '2021-11-25 09:35:36.574', 5, NULL, '1', '0000');
INSERT INTO `sys_dict`
VALUES (11888, '全部', 'ALL', 'sys_data_scope_1', 199, '1,', 10, b'1', b'1', '1', '2019-07-14 05:52:44.000', '1',
        '2021-11-22 14:52:35.489', 10, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (40654, '仅本人数据', 'SELF', 'sys_data_scope_4', 199, '1,', 40, b'1', b'1', '1', '2019-07-14 06:00:03.000', '1',
        '2021-11-22 14:52:41.740', 8, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (44223, '菜单', '1', 'sys_menu_type_1', 66555, '1,', 20, b'1', b'1', '1', '2019-07-14 06:04:44.000', '1',
        '2021-11-22 14:52:09.706', 7, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (55345, '任务分组', NULL, 'quartz_job_group', 455, '1,', 30, b'1', b'0', '1', '2019-08-15 16:33:54.745', '1',
        '2021-11-22 14:49:12.709', 10, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (55634, '在线', 'ONLINE', 'sys_online_status_on_line', 9967, '1,', 30, b'1', b'1', '1', '2019-08-11 11:17:28.210',
        '1', '2021-11-25 09:35:32.195', 3, NULL, '1', '0000');
INSERT INTO `sys_dict`
VALUES (55734, '查看', 'VIEW', 'sys_business_type_view', 4555, '1,', 10, b'1', b'1', '1', '2019-08-07 16:49:39.000', '1',
        '2021-11-22 14:52:56.315', 8, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (64456, '登录', 'LOGIN', 'sys_business_type_login', 4555, '1,', 100, b'0', b'1', '1', '2020-05-27 11:41:37.787',
        '1', '2021-11-22 14:52:56.318', 1, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (65765, '业务数据', 'biz', 'biz', -1, '1,', 30, b'1', b'1', '1', '2019-07-14 04:01:51.000', '1',
        '2021-11-22 14:49:12.709', 6, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (66555, '菜单类型', '', 'sys_menu_type', 455, '1,', 30, b'1', b'0', '1', '2019-07-14 06:01:48.000', '1',
        '2021-11-22 14:49:12.709', 15, NULL, '0', '0000');
INSERT INTO `sys_dict`
VALUES (74563, '正常', '1', 'sys_status_1', 1177, '1,', 30, b'1', b'1', '1', '2019-08-14 11:28:01.693', '1',
        '2021-11-22 14:51:09.036', 2, NULL, '0', '0000');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`
(
  `id`                 bigint(0) NOT NULL COMMENT 'ID',
  `biz_type`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '业务类型',
  `file_type`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件类型',
  `storage_type`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储类型\nLOCAL FAST_DFS MIN_IO ALI \n',
  `bucket`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '桶',
  `path`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件相对地址',
  `url`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件访问地址',
  `unique_file_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '唯一文件名',
  `file_md5`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件md5',
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '原始文件名',
  `content_type`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件类型',
  `suffix`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '后缀',
  `size`               bigint(0) NULL DEFAULT 0 COMMENT '大小',
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '租户编码',
  `created_by`         bigint(0) NOT NULL,
  `created_date`       timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
  `last_modified_by`   bigint(0) NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '修改时间',
  `description`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version`            int(0) NOT NULL,
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '增量文件上传日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file`
VALUES (1467023162330841088, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/a5b549c113b94f849b412742723bd1b9.jpg',
        'https://static.tangyh.top/file/dev/0000/USER_AVATAR/2021/12/04/a5b549c113b94f849b412742723bd1b9.jpg',
        'a5b549c113b94f849b412742723bd1b9.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 14:49:12.511', 1, '2021-12-08 10:30:22.838', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467023384859639808, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/c904f1e9ea7549c6943535ddc52695a5.jpg',
        'https://static.tangyh.top/file/dev/0000/USER_AVATAR/2021/12/04/c904f1e9ea7549c6943535ddc52695a5.jpg',
        'c904f1e9ea7549c6943535ddc52695a5.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 14:50:05.583', 1, '2021-12-08 10:35:03.808', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467024571344355328, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/d3ee9280828b4f29b3a4ad2ae27de921.jpg',
        'https://static.tangyh.top/file/dev/0000/USER_AVATAR/2021/12/04/d3ee9280828b4f29b3a4ad2ae27de921.jpg',
        'd3ee9280828b4f29b3a4ad2ae27de921.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 14:54:48.462', 1, '2021-12-08 10:35:03.808', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467024702038867968, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/2f15a9e12b654e6da0d697747997036f.jpg',
        'https://static.tangyh.top/file/dev/0000/USER_AVATAR/2021/12/04/2f15a9e12b654e6da0d697747997036f.jpg',
        '2f15a9e12b654e6da0d697747997036f.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 14:55:19.623', 1, '2021-12-08 10:35:03.808', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467024956737978368, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/11d4d77207a6470bbdc9a838b5e92634.jpg',
        'https://static.tangyh.top/file/dev/0000/USER_AVATAR/2021/12/04/11d4d77207a6470bbdc9a838b5e92634.jpg',
        '11d4d77207a6470bbdc9a838b5e92634.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 14:56:20.348', 1, '2021-12-08 10:35:03.808', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467027979442847744, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/1202170e9efa4a32b587a501a03f79d6.jpg',
        'https://static.tangyh.top/file/dev/0000/USER_AVATAR/2021/12/04/1202170e9efa4a32b587a501a03f79d6.jpg',
        '1202170e9efa4a32b587a501a03f79d6.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:08:21.011', 1, '2021-12-08 10:35:03.808', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467028392086863872, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/ae4a01d7c2aa46008980cb52d9d5fb77.jpg',
        'https://static.tangyh.top/file/dev/0000/USER_AVATAR/2021/12/04/ae4a01d7c2aa46008980cb52d9d5fb77.jpg',
        'ae4a01d7c2aa46008980cb52d9d5fb77.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:09:59.391', 1, '2021-12-08 10:35:03.808', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467029366637592576, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/a13e42026b014bf5940548da97d21a8e.jpg',
        'https://static.tangyh.top/file/dev/0000/USER_AVATAR/2021/12/04/a13e42026b014bf5940548da97d21a8e.jpg',
        'a13e42026b014bf5940548da97d21a8e.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:13:51.747', 1, '2021-12-08 10:35:03.808', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467033048376672256, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/ac22b263cddf4dadb0886d579602f8fc.jpg',
        'https://static.tangyh.top/file/dev/0000/USER_AVATAR/2021/12/04/ac22b263cddf4dadb0886d579602f8fc.jpg',
        'ac22b263cddf4dadb0886d579602f8fc.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:28:29.541', 1, '2021-12-08 10:30:26.026', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467034144696434688, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/139e2822c6cb4635b333af4e2f3f1fff.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/139e2822c6cb4635b333af4e2f3f1fff.jpg',
        '139e2822c6cb4635b333af4e2f3f1fff.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:32:50.912', 1, '2021-12-08 10:35:00.362', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467034290523996160, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/d685c34ab657404aa1f562fb5e25ba4a.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/d685c34ab657404aa1f562fb5e25ba4a.jpg',
        'd685c34ab657404aa1f562fb5e25ba4a.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:33:25.696', 1, '2021-12-08 10:34:58.515', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467034373625741312, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/8c1aef8043d0495ba73929239e96d3de.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/8c1aef8043d0495ba73929239e96d3de.jpg',
        '8c1aef8043d0495ba73929239e96d3de.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:33:45.510', 1, '2021-12-08 10:34:55.786', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467034699288281088, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/4f8c39bcacb74ff0a0a15a465b562a31.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/4f8c39bcacb74ff0a0a15a465b562a31.jpg',
        '4f8c39bcacb74ff0a0a15a465b562a31.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:35:03.154', 1, '2021-12-08 10:35:03.808', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467035096501452800, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/7f1b6dbcce2d4830a6ed5a09a5367a96.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/7f1b6dbcce2d4830a6ed5a09a5367a96.jpg',
        '7f1b6dbcce2d4830a6ed5a09a5367a96.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:36:37.856', 1, '2021-12-08 10:35:03.808', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467035309022642176, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/125725a79c9c433d9a78b68e472edb54.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/125725a79c9c433d9a78b68e472edb54.jpg',
        '125725a79c9c433d9a78b68e472edb54.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:37:28.526', 1, '2021-12-08 10:35:03.808', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467035384608194560, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/252822ef2f7b42ef9b2fe7856b1b4af1.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/252822ef2f7b42ef9b2fe7856b1b4af1.jpg',
        '252822ef2f7b42ef9b2fe7856b1b4af1.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:37:46.547', 1, '2021-12-08 11:26:55.356', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467035692767903744, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/756e5d2cce154afc85dccd953d9f71ed.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/756e5d2cce154afc85dccd953d9f71ed.jpg',
        '756e5d2cce154afc85dccd953d9f71ed.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:39:00.013', 1, '2021-12-08 11:26:55.356', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467035880945352704, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/8651019de0b546e8bea62d78545ab0dc.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/8651019de0b546e8bea62d78545ab0dc.jpg',
        '8651019de0b546e8bea62d78545ab0dc.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:39:44.882', 1, '2021-12-08 11:26:55.356', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467036516415963136, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/a83b05ddeda14db3a80eac1a017ab0e5.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/a83b05ddeda14db3a80eac1a017ab0e5.jpg',
        'a83b05ddeda14db3a80eac1a017ab0e5.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:42:16.391', 1, '2021-12-08 11:26:52.882', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467036966729023488, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/370dd47b2f1942ffb26a81b30f92fdd8.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/370dd47b2f1942ffb26a81b30f92fdd8.jpg',
        '370dd47b2f1942ffb26a81b30f92fdd8.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:44:03.752', 1, '2021-12-08 11:26:52.882', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467037132164956160, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/9c7e6aa57824469196b2cd5fc11ed4b8.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/9c7e6aa57824469196b2cd5fc11ed4b8.jpg',
        '9c7e6aa57824469196b2cd5fc11ed4b8.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:44:43.197', 1, '2021-12-08 11:26:52.882', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467037699943694336, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/87d2d42bc8ed44758cfa3340efad27c2.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/87d2d42bc8ed44758cfa3340efad27c2.jpg',
        '87d2d42bc8ed44758cfa3340efad27c2.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:46:58.565', 1, '2021-12-08 11:26:52.882', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467039487262457856, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/97e69d2762be4a24aff43085894b3505.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/97e69d2762be4a24aff43085894b3505.jpg',
        '97e69d2762be4a24aff43085894b3505.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 15:54:04.695', 1, '2021-12-08 11:26:52.882', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1467044287936987136, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/04/946d98eb4c0b4b6da1eccc1b648f023d.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/04/946d98eb4c0b4b6da1eccc1b648f023d.jpg',
        '946d98eb4c0b4b6da1eccc1b648f023d.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-04 16:13:09.254', 1, '2021-12-08 11:26:52.882', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1468419790770012160, 'BASE_FILE', 'DOC', 'LOCAL', 'dev',
        '0000/BASE_FILE/2021/12/08/1ec3372296b24002bae2542cb02ab7dd.txt',
        'http://127.0.0.1:8061/file/dev/0000/BASE_FILE/2021/12/08/1ec3372296b24002bae2542cb02ab7dd.txt',
        '1ec3372296b24002bae2542cb02ab7dd.txt', NULL, '200个免费节点.txt', 'text/plain', 'txt', 121456, '0000', 1,
        '2021-12-08 11:18:54.691', 1, '2021-12-08 11:26:52.882', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1468420594188943360, 'BASE_FILE', 'DOC', 'LOCAL', 'dev',
        '0000/BASE_FILE/2021/12/08/dd32fe8cf00b4509a79d37ec865d89cf.txt',
        'http://127.0.0.1:8061/file/dev/0000/BASE_FILE/2021/12/08/dd32fe8cf00b4509a79d37ec865d89cf.txt',
        'dd32fe8cf00b4509a79d37ec865d89cf.txt', NULL, '200个免费节点.txt', 'text/plain', 'txt', 121456, '0000', 1,
        '2021-12-08 11:22:06.246', 1, '2021-12-08 11:26:52.882', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1468421198781087744, 'BASE_FILE', 'DOC', 'LOCAL', 'dev',
        '0000/BASE_FILE/2021/12/08/f316089dbe3e42b7a629be446c1c7238.txt',
        'http://127.0.0.1:8061/file/dev/0000/BASE_FILE/2021/12/08/f316089dbe3e42b7a629be446c1c7238.txt',
        'f316089dbe3e42b7a629be446c1c7238.txt', NULL, '200个免费节点.txt', 'text/plain', 'txt', 121456, '0000', 1,
        '2021-12-08 11:24:30.388', 1, '2021-12-08 11:26:52.882', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1468421746632687616, 'BASE_FILE', 'DOC', 'LOCAL', 'dev',
        '0000/BASE_FILE/2021/12/08/f02fba0a4d6f47b285606311e6a059a2.txt',
        'http://127.0.0.1:8061/file/dev/0000/BASE_FILE/2021/12/08/f02fba0a4d6f47b285606311e6a059a2.txt',
        'f02fba0a4d6f47b285606311e6a059a2.txt', NULL, '200个免费节点.txt', 'text/plain', 'txt', 121456, '0000', 1,
        '2021-12-08 11:26:41.010', 1, '2021-12-08 11:26:52.882', NULL, 0, '1');
INSERT INTO `sys_file`
VALUES (1468421845593096192, 'BASE_FILE', 'DOC', 'LOCAL', 'dev',
        '0000/BASE_FILE/2021/12/08/7d697a6b334b463db51a630ffe741573.txt',
        'http://127.0.0.1:8061/file/dev/0000/BASE_FILE/2021/12/08/7d697a6b334b463db51a630ffe741573.txt',
        '7d697a6b334b463db51a630ffe741573.txt', NULL, '200个免费节点.txt', 'text/plain', 'txt', 121456, '0000', 1,
        '2021-12-08 11:27:04.604', 1, '2021-12-08 11:27:04.605', NULL, 0, '0');
INSERT INTO `sys_file`
VALUES (1468421845609873408, 'BASE_FILE', 'IMAGE', 'LOCAL', 'dev',
        '0000/BASE_FILE/2021/12/08/0a63a34fd90543a88cf43ee4b3626723.jpg',
        'http://127.0.0.1:8061/file/dev/0000/BASE_FILE/2021/12/08/0a63a34fd90543a88cf43ee4b3626723.jpg',
        '0a63a34fd90543a88cf43ee4b3626723.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-08 11:27:04.608', 1, '2021-12-08 11:27:04.609', NULL, 0, '0');
INSERT INTO `sys_file`
VALUES (1469157645930725376, 'USER_AVATAR', 'IMAGE', 'LOCAL', 'dev',
        '0000/USER_AVATAR/2021/12/10/d1b42710b67f4e80a710a687fd4d8412.jpg',
        'http://127.0.0.1:8061/file/dev/0000/USER_AVATAR/2021/12/10/d1b42710b67f4e80a710a687fd4d8412.jpg',
        'd1b42710b67f4e80a710a687fd4d8412.jpg', NULL, '31921638496726_.pic.jpg', 'image/jpeg', 'jpg', 816277, '0000', 1,
        '2021-12-10 12:10:53.062', 1, '2021-12-10 12:10:53.075', NULL, 0, '0');

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login`
(
  `id`           bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `user_id`      bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `username`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `nickname`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录人昵称',
  `ip_address`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `ip_location`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `user_agent`   varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `request_uri`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `params`       text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作提交的数据',
  `login_date`   char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录时间',
  `tenant_code`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  `created_by`   bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `created_date` timestamp(3)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `description`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `del_flag`     char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin            NOT NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX          `sys_log_create_by`(`created_by`) USING BTREE,
  INDEX          `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX          `sys_log_create_date`(`created_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1596 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO `sys_log_login`
VALUES (1576, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B83741641447668242%5D&password=%5B111111%5D&code=%5B2%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-01-06', '0000', 1, '2022-01-06 13:41:18.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1577, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B79661641455245936%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-01-06', '0000', 1, '2022-01-06 15:47:46.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1578, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B41661641455841194%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-01-06', '0000', 1, '2022-01-06 15:57:25.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1579, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B88011641456097766%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-01-06', '0000', 1, '2022-01-06 16:01:41.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1580, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B38711641456185622%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-01-06', '0000', 1, '2022-01-06 16:03:10.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1581, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B74811649653583419%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:06:56.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1582, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B29961649653616845%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:07:45.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1583, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B33031649653665571%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:09:36.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1584, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B54551649653806416%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:10:08.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1585, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B24331649653808969%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:11:11.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1586, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B25811649653875513%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:11:18.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1587, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B33761649653916767%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:12:00.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1588, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B43491649653952363%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:12:34.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1589, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B77431649653958508%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:12:40.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1590, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B41031649653978393%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:13:00.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1591, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B24721649653980372%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:24:45.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1592, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B15391649654884266%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:28:05.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1593, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B11071649654953438%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:29:15.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1594, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B21991649654955786%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:29:19.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1595, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B35911649654999950%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:30:03.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1596, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B24591649656152585%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:49:14.000', NULL, '0');
INSERT INTO `sys_log_login`
VALUES (1597, '用户登录成功', 1, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/oauth/token',
        'randomStr=%5B37091649656696810%5D&password=%5B111111%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D',
        '2022-04-11', '0000', 1, '2022-04-11 13:58:18.000', NULL, '0');

-- ----------------------------
-- Table structure for sys_log_operate
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_operate`;
CREATE TABLE `sys_log_operate`
(
  `id`            bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `log_type`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `username`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `service_id`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `ip_address`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `ip_location`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `user_agent`    varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `request_uri`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `method`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params`        text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作提交的数据',
  `time`          mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行时间',
  `operator_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `tenant_code`   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  `business_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `exception`     text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常信息',
  `created_by`    bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `created_date`  timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
  `description`   varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `del_flag`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX           `sys_log_create_by`(`created_by`) USING BTREE,
  INDEX           `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX           `sys_log_create_date`(`created_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2314 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log_operate
-- ----------------------------
INSERT INTO `sys_log_operate`
VALUES (2233, '用户管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user/', 'com.albedo.java.modules.sys.web.UserResource.findPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  userQueryCriteria: UserQueryCriteria(deptIds=null, blurry=null, available=null, deptId=null, createdDate=null) }',
        '130', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:01:25.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2234, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '39', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:01:27.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2235, '部门管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/dept/', 'com.albedo.java.modules.sys.web.DeptResource.findTreeList()',
        '{ deptQueryCriteria: DeptQueryCriteria(notId=null, deptIds=null, name=null, available=null, blurry=null, parentId=null, createdDate=null) }',
        '29', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:01:28.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2236, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '98', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:01:30.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2237, '字典管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/dict/', 'com.albedo.java.modules.sys.web.DictResource.findTreeList()',
        '{ dictQueryCriteria: DictQueryCriteria(notId=null, name=null, available=null, blurry=null, parentId=null, createdDate=null) }',
        '42', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:01:32.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2238, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '1034', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:01:45.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2239, '登录日志管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/log-login/', 'com.albedo.java.modules.sys.web.LogLoginResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[OrderItem(column=createdDate, asc=false)])  logLoginQueryCriteria: LogLoginQueryCriteria(title=null, userId=null) }',
        '63', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:01:54.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2240, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '2507', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:05:39.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2241, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '4513', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:05:40.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2242, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '79', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:06:28.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2243, '菜单管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.save()',
        '{ menuDto: MenuDto(permission=sys_monitor_view, icon=codeConsole, component=monitor/service/index, type=1, hidden=0, cache=0, iframe=0, path=server) }',
        '256', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:06:50.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2244, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '50', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:06:50.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2245, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '51', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:06:53.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2246, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '74', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:07:23.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2247, '菜单管理删除', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.removeByIds()', '{ ids: [1468397111971151872] }', '97',
        'MANAGE', '0000', '0',
        'BizException [message=菜单含有下级不能删除, errorCode=0]\n	at com.albedo.java.modules.sys.service.impl.MenuServiceImpl.lambda$removeByIds$5(MenuServiceImpl.java:202)\n	at java.lang.Iterable.forEach(Iterable.java:75)\n	at com.albedo.java.modules.sys.service.impl.MenuServiceImpl.removeByIds(MenuServiceImpl.java:197)\n	at com.albedo.java.modules.sys.service.impl.MenuServiceImpl$$FastClassBySpringCGLIB$$6ae2146d.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\n	at com.albedo.java.modules.sys.service.impl.MenuServiceImpl$$EnhancerBySpringCGLIB$$e28200eb.removeByIds(<generated>)\n	at com.albedo.java.modules.sys.web.MenuResource.removeByIds(MenuResource.java:166)\n	at com.albedo.java.modules.sys.web.MenuResource$$FastClassBySpringCGLIB$$3f5bd433.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springfra',
        1, '2022-01-06 15:07:30.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2248, '菜单管理删除', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.removeByIds()',
        '{ ids: [1468397112000512000, 1468397112017289216, 1468397112029872128] }', '520', 'MANAGE', '0000', '0', NULL,
        1, '2022-01-06 15:07:53.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2249, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '51', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:07:54.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2250, '菜单管理删除', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.removeByIds()', '{ ids: [1468397111971151872] }', '76',
        'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:08:00.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2251, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '49', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:08:00.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2252, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '52', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:08:03.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2253, '字典管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/dict/', 'com.albedo.java.modules.sys.web.DictResource.findTreeList()',
        '{ dictQueryCriteria: DictQueryCriteria(notId=null, name=null, available=null, blurry=null, parentId=null, createdDate=null) }',
        '30', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:08:07.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2254, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '775', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:08:12.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2255, '登录日志管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/log-login/', 'com.albedo.java.modules.sys.web.LogLoginResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[OrderItem(column=createdDate, asc=false)])  logLoginQueryCriteria: LogLoginQueryCriteria(title=null, userId=null) }',
        '54', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:08:18.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2256, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '58', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:08:36.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2257, '菜单管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.save()',
        '{ menuDto: MenuDto(permission=sys_monitor_view, icon=codeConsole, component=monitor/service/index, type=1, hidden=0, cache=0, iframe=0, path=service) }',
        '79', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:08:58.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2258, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '57', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:08:59.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2259, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '52', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:09:02.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2260, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '593', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:14:44.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2261, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '117', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:15:41.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2262, '菜单管理删除', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.removeByIds()', '{ ids: [2600] }', '75', 'MANAGE',
        '0000', '0',
        'BizException [message=菜单含有下级不能删除, errorCode=0]\n	at com.albedo.java.modules.sys.service.impl.MenuServiceImpl.lambda$removeByIds$5(MenuServiceImpl.java:202)\n	at java.lang.Iterable.forEach(Iterable.java:75)\n	at com.albedo.java.modules.sys.service.impl.MenuServiceImpl.removeByIds(MenuServiceImpl.java:197)\n	at com.albedo.java.modules.sys.service.impl.MenuServiceImpl$$FastClassBySpringCGLIB$$6ae2146d.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\n	at com.albedo.java.modules.sys.service.impl.MenuServiceImpl$$EnhancerBySpringCGLIB$$e28200eb.removeByIds(<generated>)\n	at com.albedo.java.modules.sys.web.MenuResource.removeByIds(MenuResource.java:166)\n	at com.albedo.java.modules.sys.web.MenuResource$$FastClassBySpringCGLIB$$3f5bd433.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springfra',
        1, '2022-01-06 15:15:52.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2263, '菜单管理删除', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.removeByIds()', '{ ids: [5588, 2601] }', '121', 'MANAGE',
        '0000', '0', NULL, 1, '2022-01-06 15:15:58.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2264, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '62', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:15:59.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2265, '菜单管理删除', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.removeByIds()', '{ ids: [2600] }', '53', 'MANAGE',
        '0000', '0', NULL, 1, '2022-01-06 15:16:03.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2266, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '76', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:16:03.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2267, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '307', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 15:17:57.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2268, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '3289', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:19:49.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2269, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '567', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:20:17.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2270, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '1550', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:31:18.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2271, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '559', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:31:39.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2272, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '3349', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:33:35.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2273, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '700', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:33:46.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2274, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '498', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:41:12.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2275, '强退在线用户', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online', 'com.albedo.java.modules.sys.web.UserOnlineResource.removeByTokens()',
        '{ tokens: [e1d2d220-dc1b-404a-9a18-548fdf14e5f4] }', '2292', 'MANAGE', '0000', '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [DELETE] to [http://albedo-auth/token] [RemoteUserOnlineService#removeByTokens(TokenVo,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.removeByTokens(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.removeByTokens(UserOnlineResource.java:65)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoi',
        1, '2022-01-06 15:43:44.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2276, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(blurry=null, createdDate=null) }', '3597', 'MANAGE', '0000',
        '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor341.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 15:45:28.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2277, '在线用户查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '340', 'MANAGE',
        '0000', '0', NULL, 1, '2022-01-06 15:47:49.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2278, '在线用户查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '47', 'MANAGE',
        '0000', '0', NULL, 1, '2022-01-06 15:47:57.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2279, '在线用户查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '35', 'MANAGE',
        '0000', '0', NULL, 1, '2022-01-06 15:47:59.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2280, '在线用户查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '377', 'MANAGE',
        '0000', '0', NULL, 1, '2022-01-06 15:55:22.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2281, '在线用户查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '75', 'MANAGE',
        '0000', '0', NULL, 1, '2022-01-06 15:57:26.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2282, '退出成功', NULL, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/token/logout', NULL, 'Bearer 1620df8f-468e-47f9-bf6c-e4c3a5ab61aa', '0', '0', '0000', '0', NULL, 1,
        '2022-01-06 16:01:41.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2283, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '5372', 'MANAGE',
        '0000', '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(Cgl',
        1, '2022-01-06 16:03:12.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2284, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '559', 'MANAGE',
        '0000', '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor298.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 16:03:46.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2285, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '576', 'MANAGE',
        '0000', '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.GeneratedMethodAccessor298.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceed',
        1, '2022-01-06 16:04:31.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2286, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '10129', 'MANAGE',
        '0000', '0',
        'feign.RetryableException: timeout executing POST http://albedo-auth/token/find-page\n	at feign.FeignException.errorExecuting(FeignException.java:268)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:129)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.SysLogAspect.around(SysLogAspect.java:71)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImp',
        1, '2022-01-06 16:06:41.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2287, '登录日志管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/log-login/', 'com.albedo.java.modules.sys.web.LogLoginResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[OrderItem(column=createdDate, asc=false)])  logLoginQueryCriteria: LogLoginQueryCriteria(title=null, userId=null) }',
        '546', 'MANAGE', '0000', '0', NULL, 1, '2022-01-06 16:07:05.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2288, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '3102', 'MANAGE',
        '0000', '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(Cgl',
        1, '2022-01-06 16:07:09.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2289, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '597', 'MANAGE',
        '0000', '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(Cgl',
        1, '2022-01-06 16:20:05.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2290, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '10070', 'MANAGE',
        '0000', '0',
        'feign.RetryableException: timeout executing POST http://albedo-auth/token/find-page\n	at feign.FeignException.errorExecuting(FeignException.java:268)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:129)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.SysLogAspect.around(SysLogAspect.java:71)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImp',
        1, '2022-01-06 16:20:11.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2291, '在线用户查看', 'WARN', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'OSX',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '2252', 'MANAGE',
        '0000', '0',
        'feign.FeignException$BadGateway: [502 Bad Gateway] during [POST] to [http://albedo-auth/token/find-page] [RemoteUserOnlineService#findPage(UserOnlineQueryCriteria,String)]: []\n	at feign.FeignException.serverErrorStatus(FeignException.java:254)\n	at feign.FeignException.errorStatus(FeignException.java:197)\n	at feign.FeignException.errorStatus(FeignException.java:185)\n	at feign.codec.ErrorDecoder$Default.decode(ErrorDecoder.java:92)\n	at feign.AsyncResponseHandler.handleResponse(AsyncResponseHandler.java:96)\n	at feign.SynchronousMethodHandler.executeAndDecode(SynchronousMethodHandler.java:138)\n	at feign.SynchronousMethodHandler.invoke(SynchronousMethodHandler.java:89)\n	at feign.ReflectiveFeign$FeignInvocationHandler.invoke(ReflectiveFeign.java:100)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at com.sun.proxy.$Proxy242.findPage(Unknown Source)\n	at com.albedo.java.modules.sys.web.UserOnlineResource.findPage(UserOnlineResource.java:52)\n	at com.albedo.java.modules.sys.web.UserOnlineResource$$FastClassBySpringCGLIB$$8d1ba552.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(Cgl',
        1, '2022-01-06 16:20:24.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2292, '用户管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user/', 'com.albedo.java.modules.sys.web.UserResource.findPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  userQueryCriteria: UserQueryCriteria(deptIds=null, blurry=null, available=null, deptId=null, createdDate=null) }',
        '65', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:30:23.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2293, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '19', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:30:24.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2294, '部门管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/dept/', 'com.albedo.java.modules.sys.web.DeptResource.findTreeList()',
        '{ deptQueryCriteria: DeptQueryCriteria(notId=null, deptIds=null, name=null, available=null, blurry=null, parentId=null, createdDate=null) }',
        '5', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:30:26.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2295, '用户管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user/', 'com.albedo.java.modules.sys.web.UserResource.findPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  userQueryCriteria: UserQueryCriteria(deptIds=null, blurry=null, available=null, deptId=null, createdDate=null) }',
        '35', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:30:27.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2296, '用户管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user/', 'com.albedo.java.modules.sys.web.UserResource.save()',
        '{ userDto: UserDto(username=manage, nickname=null, sex=null, password=null, email=13@qqx.om, phone=13254642311, avatar=null, deptId=1, wxOpenId=null, qqOpenId=null, roleIdList=[2]) }',
        '87', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:30:30.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2297, '用户管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user/', 'com.albedo.java.modules.sys.web.UserResource.findPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  userQueryCriteria: UserQueryCriteria(deptIds=null, blurry=null, available=null, deptId=null, createdDate=null) }',
        '33', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:30:30.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2298, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '13', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:30:31.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2299, '角色管理编辑', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=超级管理员, code=admin, dataScope=ALL, level=1, menuIdList=[330, 334, 335, 336, 337, 338, 339, 440, 445, 446, 447, 448, 449, 1000, 1100, 1101, 1102, 1103, 1166, 1200, 1201, 1202, 1203, 1300, 1301, 1302, 1303, 1400, 1401, 1402, 1403, 2000, 2100, 2101, 2200, 2201, 2202, 2500, 3333, 4433, 4444, 5555, 5566, 6000, 6666, 6677, 7000, 7700, 7766, 7788, 8855, 8877, 8888, 8899, 9000, 9900, 9911, 9944, 9955, 9977, 9988, 9999, 1465502605210812416, 1465502605244366848, 1465502605277921280, 1465502605307281408, 1468405431398301696, 1468405431419273216, 1468405431440244736, 1468405431457021952], deptIdList=[8]) }',
        '175', 'MANAGE', '0000', '0',
        'org.springframework.dao.DataIntegrityViolationException: com.albedo.java.modules.sys.repository.RoleDeptRepository.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'id\' cannot be null\n; Column \'id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'id\' cannot be null\r\n	at org.springframework.jdbc.support.SQLStateSQLExceptionTranslator.doTranslate(SQLStateSQLExceptionTranslator.java:104)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:192)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:217)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.executeBatch(ServiceImpl.java:240)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.saveBatch(ServiceImpl.java:136)\r\n	at com.baomidou.mybatisplus.extension.service.IService.saveBatch(IService.java:73)\r\n	at com.baomidou.mybatisplus.extension.service.IService$$FastClassBySpringCGLIB$$f8525d18.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\r\n	at com.albedo.java.modules.sys.service.impl.RoleDeptServiceImpl$$EnhancerBySpringCGLIB$$7740c77f.saveBatch(<generated>)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:163)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:74)\r\n	at com.albedo.java.mo',
        1, '2022-04-11 13:30:41.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2300, '用户管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user/', 'com.albedo.java.modules.sys.web.UserResource.findPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  userQueryCriteria: UserQueryCriteria(deptIds=null, blurry=null, available=null, deptId=null, createdDate=null) }',
        '33', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:32:47.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2301, '用户管理删除', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user/', 'com.albedo.java.modules.sys.web.UserResource.removeByIds()', '{ ids: [9] }', '24', 'MANAGE', '0000',
        '0', NULL, 1, '2022-04-11 13:32:50.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2302, '用户管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user/', 'com.albedo.java.modules.sys.web.UserResource.findPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  userQueryCriteria: UserQueryCriteria(deptIds=null, blurry=null, available=null, deptId=null, createdDate=null) }',
        '27', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:32:50.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2303, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '13', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:33:01.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2304, '角色管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=d, code=d, dataScope=ALL, level=3, menuIdList=null, deptIdList=[]) }', '8', 'MANAGE',
        '0000', '0', NULL, 1, '2022-04-11 13:33:07.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2305, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '12', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:33:07.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2306, '角色管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=d, code=d1, dataScope=ALL, level=3, menuIdList=[], deptIdList=[]) }', '22', 'MANAGE',
        '0000', '0', NULL, 1, '2022-04-11 13:33:13.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2307, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '11', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:33:14.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2308, '角色管理删除', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.removeByIds()', '{ ids: [1513389659961425920] }', '31',
        'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:33:16.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2309, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '12', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:33:16.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2310, '角色管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=普通管理员, code=1, dataScope=CUSTOMIZE, level=4, menuIdList=[338, 440, 446, 1000, 1101, 1102, 1103, 1166, 1200, 1400, 2200, 6000, 6655, 8855, 8888, 8899, 9000, 9900, 9955, 9988], deptIdList=[]) }',
        '38', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:33:19.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2311, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '10', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:33:20.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2312, '角色管理编辑', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=机构管理员, code=1, dataScope=CUSTOMIZE, level=2, menuIdList=[334, 338, 440, 446, 1000, 1100, 1101, 1102, 1103, 1166, 1200, 1300, 1400, 2000, 2200, 6000, 6655, 8855, 8888, 8899, 9000, 9900, 9955, 9988], deptIdList=[5, 4, 3]) }',
        '34', 'MANAGE', '0000', '0',
        'org.springframework.dao.DataIntegrityViolationException: com.albedo.java.modules.sys.repository.RoleDeptRepository.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'id\' cannot be null\n; Column \'id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'id\' cannot be null\r\n	at org.springframework.jdbc.support.SQLStateSQLExceptionTranslator.doTranslate(SQLStateSQLExceptionTranslator.java:104)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:192)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:217)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.executeBatch(ServiceImpl.java:240)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.saveBatch(ServiceImpl.java:136)\r\n	at com.baomidou.mybatisplus.extension.service.IService.saveBatch(IService.java:73)\r\n	at com.baomidou.mybatisplus.extension.service.IService$$FastClassBySpringCGLIB$$f8525d18.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\r\n	at com.albedo.java.modules.sys.service.impl.RoleDeptServiceImpl$$EnhancerBySpringCGLIB$$7740c77f.saveBatch(<generated>)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:163)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:74)\r\n	at com.albedo.java.mo',
        1, '2022-04-11 13:33:22.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2313, '角色管理编辑', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=超级管理员, code=3, dataScope=ALL, level=1, menuIdList=[330, 334, 335, 336, 337, 338, 339, 440, 445, 446, 447, 448, 449, 1000, 1100, 1101, 1102, 1103, 1166, 1200, 1201, 1202, 1203, 1300, 1301, 1302, 1303, 1400, 1401, 1402, 1403, 2000, 2100, 2101, 2200, 2201, 2202, 2500, 3333, 4433, 4444, 5555, 5566, 6000, 6666, 6677, 7000, 7700, 7766, 7788, 8855, 8877, 8888, 8899, 9000, 9900, 9911, 9944, 9955, 9977, 9988, 9999, 1465502605210812416, 1465502605244366848, 1465502605277921280, 1465502605307281408, 1468405431398301696, 1468405431419273216, 1468405431440244736, 1468405431457021952], deptIdList=[8]) }',
        '45', 'MANAGE', '0000', '0',
        'org.springframework.dao.DataIntegrityViolationException: com.albedo.java.modules.sys.repository.RoleDeptRepository.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'id\' cannot be null\n; Column \'id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'id\' cannot be null\r\n	at org.springframework.jdbc.support.SQLStateSQLExceptionTranslator.doTranslate(SQLStateSQLExceptionTranslator.java:104)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:192)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:217)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.executeBatch(ServiceImpl.java:240)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.saveBatch(ServiceImpl.java:136)\r\n	at com.baomidou.mybatisplus.extension.service.IService.saveBatch(IService.java:73)\r\n	at com.baomidou.mybatisplus.extension.service.IService$$FastClassBySpringCGLIB$$f8525d18.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\r\n	at com.albedo.java.modules.sys.service.impl.RoleDeptServiceImpl$$EnhancerBySpringCGLIB$$7740c77f.saveBatch(<generated>)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:163)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:74)\r\n	at com.albedo.java.mo',
        1, '2022-04-11 13:33:27.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2314, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '10', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:34:13.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2315, '角色管理编辑', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=超级管理员, code=admin, dataScope=ALL, level=1, menuIdList=[330, 334, 335, 336, 337, 338, 339, 440, 445, 446, 447, 448, 449, 1000, 1100, 1101, 1102, 1103, 1166, 1200, 1201, 1202, 1203, 1300, 1301, 1302, 1303, 1400, 1401, 1402, 1403, 2000, 2100, 2101, 2200, 2201, 2202, 2500, 3333, 4433, 4444, 5555, 5566, 6000, 6666, 6677, 7000, 7700, 7766, 7788, 8855, 8877, 8888, 8899, 9000, 9900, 9911, 9944, 9955, 9977, 9988, 9999, 1465502605210812416, 1465502605244366848, 1465502605277921280, 1465502605307281408, 1468405431398301696, 1468405431419273216, 1468405431440244736, 1468405431457021952], deptIdList=[8]) }',
        '49', 'MANAGE', '0000', '0',
        'org.springframework.dao.DataIntegrityViolationException: com.albedo.java.modules.sys.repository.RoleDeptRepository.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'id\' cannot be null\n; Column \'id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'id\' cannot be null\r\n	at org.springframework.jdbc.support.SQLStateSQLExceptionTranslator.doTranslate(SQLStateSQLExceptionTranslator.java:104)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:192)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:217)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.executeBatch(ServiceImpl.java:240)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.saveBatch(ServiceImpl.java:136)\r\n	at com.baomidou.mybatisplus.extension.service.IService.saveBatch(IService.java:73)\r\n	at com.baomidou.mybatisplus.extension.service.IService$$FastClassBySpringCGLIB$$f8525d18.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\r\n	at com.albedo.java.modules.sys.service.impl.RoleDeptServiceImpl$$EnhancerBySpringCGLIB$$7740c77f.saveBatch(<generated>)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:163)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:74)\r\n	at com.albedo.java.mo',
        1, '2022-04-11 13:34:17.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2316, '角色管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=普通管理员, code=normal, dataScope=CUSTOMIZE, level=4, menuIdList=[338, 440, 446, 1000, 1101, 1102, 1103, 1166, 1200, 1400, 2200, 6000, 6655, 8855, 8888, 8899, 9000, 9900, 9955, 9988], deptIdList=[]) }',
        '33', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:34:21.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2317, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '12', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:34:21.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2318, '角色管理编辑', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=机构管理员, code=manage, dataScope=CUSTOMIZE, level=2, menuIdList=[334, 338, 440, 446, 1000, 1100, 1101, 1102, 1103, 1166, 1200, 1300, 1400, 2000, 2200, 6000, 6655, 8855, 8888, 8899, 9000, 9900, 9955, 9988], deptIdList=[5, 4, 3]) }',
        '33', 'MANAGE', '0000', '0',
        'org.springframework.dao.DataIntegrityViolationException: com.albedo.java.modules.sys.repository.RoleDeptRepository.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'id\' cannot be null\n; Column \'id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'id\' cannot be null\r\n	at org.springframework.jdbc.support.SQLStateSQLExceptionTranslator.doTranslate(SQLStateSQLExceptionTranslator.java:104)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:192)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:217)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.executeBatch(ServiceImpl.java:240)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.saveBatch(ServiceImpl.java:136)\r\n	at com.baomidou.mybatisplus.extension.service.IService.saveBatch(IService.java:73)\r\n	at com.baomidou.mybatisplus.extension.service.IService$$FastClassBySpringCGLIB$$f8525d18.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\r\n	at com.albedo.java.modules.sys.service.impl.RoleDeptServiceImpl$$EnhancerBySpringCGLIB$$7740c77f.saveBatch(<generated>)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:163)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:74)\r\n	at com.albedo.java.mo',
        1, '2022-04-11 13:34:23.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2319, '角色管理编辑', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=机构管理员, code=manage, dataScope=ALL, level=2, menuIdList=[334, 338, 440, 446, 1000, 1100, 1101, 1102, 1103, 1166, 1200, 1300, 1400, 2000, 2200, 6000, 6655, 8855, 8888, 8899, 9000, 9900, 9955, 9988], deptIdList=[5, 4, 3]) }',
        '40', 'MANAGE', '0000', '0',
        'org.springframework.dao.DataIntegrityViolationException: com.albedo.java.modules.sys.repository.RoleDeptRepository.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'id\' cannot be null\n; Column \'id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'id\' cannot be null\r\n	at org.springframework.jdbc.support.SQLStateSQLExceptionTranslator.doTranslate(SQLStateSQLExceptionTranslator.java:104)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:192)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:217)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.executeBatch(ServiceImpl.java:240)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.saveBatch(ServiceImpl.java:136)\r\n	at com.baomidou.mybatisplus.extension.service.IService.saveBatch(IService.java:73)\r\n	at com.baomidou.mybatisplus.extension.service.IService$$FastClassBySpringCGLIB$$f8525d18.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\r\n	at com.albedo.java.modules.sys.service.impl.RoleDeptServiceImpl$$EnhancerBySpringCGLIB$$7740c77f.saveBatch(<generated>)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:163)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:74)\r\n	at com.albedo.java.mo',
        1, '2022-04-11 13:35:15.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2320, '角色管理编辑', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=机构管理员, code=manage, dataScope=CUSTOMIZE, level=2, menuIdList=[334, 338, 440, 446, 1000, 1100, 1101, 1102, 1103, 1166, 1200, 1300, 1400, 2000, 2200, 6000, 6655, 8855, 8888, 8899, 9000, 9900, 9955, 9988], deptIdList=[5, 4, 3]) }',
        '34', 'MANAGE', '0000', '0',
        'org.springframework.dao.DataIntegrityViolationException: com.albedo.java.modules.sys.repository.RoleDeptRepository.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'id\' cannot be null\n; Column \'id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'id\' cannot be null\r\n	at org.springframework.jdbc.support.SQLStateSQLExceptionTranslator.doTranslate(SQLStateSQLExceptionTranslator.java:104)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:79)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:192)\r\n	at com.baomidou.mybatisplus.extension.toolkit.SqlHelper.executeBatch(SqlHelper.java:217)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.executeBatch(ServiceImpl.java:240)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.saveBatch(ServiceImpl.java:136)\r\n	at com.baomidou.mybatisplus.extension.service.IService.saveBatch(IService.java:73)\r\n	at com.baomidou.mybatisplus.extension.service.IService$$FastClassBySpringCGLIB$$f8525d18.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\r\n	at com.albedo.java.modules.sys.service.impl.RoleDeptServiceImpl$$EnhancerBySpringCGLIB$$7740c77f.saveBatch(<generated>)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:163)\r\n	at com.albedo.java.modules.sys.service.impl.RoleServiceImpl.saveOrUpdate(RoleServiceImpl.java:74)\r\n	at com.albedo.java.mo',
        1, '2022-04-11 13:36:40.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2321, '角色管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=机构管理员, code=manage, dataScope=CUSTOMIZE, level=2, menuIdList=[334, 338, 440, 446, 1000, 1100, 1101, 1102, 1103, 1166, 1200, 1300, 1400, 2000, 2200, 6000, 6655, 8855, 8888, 8899, 9000, 9900, 9955, 9988], deptIdList=[5, 4, 3]) }',
        '131', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:43:32.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2322, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '20', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:43:32.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2323, '角色管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role', 'com.albedo.java.modules.sys.web.RoleResource.save()',
        '{ roleDto: RoleDto(name=机构管理员, code=manage, dataScope=CUSTOMIZE, level=2, menuIdList=[334, 338, 440, 446, 1000, 1100, 1101, 1102, 1103, 1166, 1200, 1300, 1400, 2000, 2200, 6000, 6655, 8855, 8888, 8899, 9000, 9900, 9955, 9988], deptIdList=[5, 4, 3]) }',
        '43', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:43:35.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2324, '角色管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/role/', 'com.albedo.java.modules.sys.web.RoleResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  roleQueryCriteria: RoleQueryCriteria(blurry=null, available=null, createdDate=null) }',
        '15', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:43:36.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2325, '部门管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/dept/', 'com.albedo.java.modules.sys.web.DeptResource.findTreeList()',
        '{ deptQueryCriteria: DeptQueryCriteria(notId=null, deptIds=null, name=null, available=null, blurry=null, parentId=null, createdDate=null) }',
        '17', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:43:37.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2326, '部门管理编辑', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/dept', 'com.albedo.java.modules.sys.web.DeptResource.save()', '{ deptDto: DeptDto() }', '104', 'MANAGE',
        '0000', '0',
        'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\r\n### The error may exist in file [C:\\Users\\Administrator\\IdeaProjects\\albedo-cloud\\albedo-modules\\albedo-sys\\albedo-sys-server\\target\\classes\\mapper\\sys\\DeptRelationMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM sys_dept_relation WHERE tenant_code = \'0000\' AND descendant IN (SELECT temp.descendant FROM (SELECT descendant FROM sys_dept_relation WHERE ancestor = ?) temp) AND ancestor IN (SELECT temp.ancestor FROM (SELECT ancestor FROM sys_dept_relation WHERE descendant = ? AND ancestor != descendant) temp)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\r\n	at com.sun.proxy.$Proxy157.update(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.update(SqlSessionTemplate.java:288)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:64)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\r\n	at com.sun.proxy.$Proxy166.deleteDeptRelations(Unknown Source)\r\n	at com.albedo.java.modules.sys.service.impl.DeptRelationServiceImpl.updateDeptRelation(DeptRelationServiceImpl.java:110)\r\n	at com.albedo.java.modules.sys.service.impl.DeptRelationServiceImpl$$FastClassBySpringCGLIB$$f965262b.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:',
        1, '2022-04-11 13:43:39.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2327, '部门管理编辑', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/dept', 'com.albedo.java.modules.sys.web.DeptResource.save()', '{ deptDto: DeptDto() }', '20', 'MANAGE',
        '0000', '0',
        'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\r\n### The error may exist in file [C:\\Users\\Administrator\\IdeaProjects\\albedo-cloud\\albedo-modules\\albedo-sys\\albedo-sys-server\\target\\classes\\mapper\\sys\\DeptRelationMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM sys_dept_relation WHERE tenant_code = \'0000\' AND descendant IN (SELECT temp.descendant FROM (SELECT descendant FROM sys_dept_relation WHERE ancestor = ?) temp) AND ancestor IN (SELECT temp.ancestor FROM (SELECT ancestor FROM sys_dept_relation WHERE descendant = ? AND ancestor != descendant) temp)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\r\n	at com.sun.proxy.$Proxy157.update(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.update(SqlSessionTemplate.java:288)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:64)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\r\n	at com.sun.proxy.$Proxy166.deleteDeptRelations(Unknown Source)\r\n	at com.albedo.java.modules.sys.service.impl.DeptRelationServiceImpl.updateDeptRelation(DeptRelationServiceImpl.java:110)\r\n	at com.albedo.java.modules.sys.service.impl.DeptRelationServiceImpl$$FastClassBySpringCGLIB$$f965262b.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:',
        1, '2022-04-11 13:43:42.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2328, '部门管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/dept', 'com.albedo.java.modules.sys.web.DeptResource.save()', '{ deptDto: DeptDto() }', '39', 'MANAGE',
        '0000', '0', NULL, 1, '2022-04-11 13:44:33.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2329, '部门管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/dept/', 'com.albedo.java.modules.sys.web.DeptResource.findTreeList()',
        '{ deptQueryCriteria: DeptQueryCriteria(notId=null, deptIds=null, name=null, available=null, blurry=null, parentId=null, createdDate=null) }',
        '8', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:44:33.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2330, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '44', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:44:35.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2331, '菜单管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.save()',
        '{ menuDto: MenuDto(permission=null, icon=menu, component=Layout, type=0, hidden=0, cache=0, iframe=0, path=/perm) }',
        '48', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:44:37.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2332, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '29', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:44:38.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2333, '字典管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/dict/', 'com.albedo.java.modules.sys.web.DictResource.findTreeList()',
        '{ dictQueryCriteria: DictQueryCriteria(notId=null, name=null, available=null, blurry=null, parentId=null, createdDate=null) }',
        '17', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:44:39.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2334, '字典管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/dict', 'com.albedo.java.modules.sys.web.DictResource.save()',
        '{ dictDto: DictDto(val=, code=sys_flag, remark=null) }', '43', 'MANAGE', '0000', '0', NULL, 1,
        '2022-04-11 13:44:41.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2335, '字典管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/dict/', 'com.albedo.java.modules.sys.web.DictResource.findTreeList()',
        '{ dictQueryCriteria: DictQueryCriteria(notId=null, name=null, available=null, blurry=null, parentId=null, createdDate=null) }',
        '7', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:44:41.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2336, '文件分页查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/', 'com.albedo.java.modules.file.web.FileResource.findPage()',
        '{ pageModel: PageModel(current=1,size=10,orders=[OrderItem(column=createdDate, asc=false)])  fileQueryCriteria: FileQueryCriteria(bizType=null, originalFileName=null, fileType=null, storageType=null) }',
        '245', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:44:46.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2337, '在线用户查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '209', 'MANAGE',
        '0000', '0', NULL, 1, '2022-04-11 13:44:55.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2338, '登录日志管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/log-login/', 'com.albedo.java.modules.sys.web.LogLoginResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[OrderItem(column=createdDate, asc=false)])  logLoginQueryCriteria: LogLoginQueryCriteria(title=null, userId=null) }',
        '28', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:45:00.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2339, '在线用户查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '21', 'MANAGE',
        '0000', '0', NULL, 1, '2022-04-11 13:49:23.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2340, '登录日志管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/log-login/', 'com.albedo.java.modules.sys.web.LogLoginResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[OrderItem(column=createdDate, asc=false)])  logLoginQueryCriteria: LogLoginQueryCriteria(title=null, userId=null) }',
        '17', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:49:25.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2341, '数据源查看', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf/', 'com.albedo.java.modules.gen.web.DatasourceConfResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  datasourceConfQueryCriteria: DatasourceConfQueryCriteria(name=null) }',
        '587', 'MANAGE', '0000', '0',
        'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\r\n### The error may exist in com/albedo/java/modules/gen/repository/DatasourceConfRepository.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT COUNT(*) AS total FROM gen_datasource_conf WHERE del_flag = \'0\' AND tenant_code = \'0000\'\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\r\n	at com.sun.proxy.$Proxy141.selectList(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:224)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForIPage(MybatisMapperMethod.java:121)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:85)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\r\n	at com.sun.proxy.$Proxy142.selectPage(Unknown Source)\r\n	at com.baomidou.mybatisplus.extension.service.IService.page(IService.java:389)\r\n	at com.baomidou.mybatisplus.extension.service.IService$$FastClassBySpringCGLIB$$f8525d18.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.albedo.java.modules.gen.service.impl.DatasourceConfServiceImpl$$EnhancerBySpringCGLIB$$47d16b68.page(<generated>)\r\n	at com.albedo.java.modules.gen.web.DatasourceConfResource.getPage(DatasourceConfResource.java:62)\r\n	at com.albedo.java.modules.gen.web.DatasourceConfResource$$FastClassBySpringCGLIB$$b525fbfa.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinP',
        1, '2022-04-11 13:49:30.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2342, '数据源查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf/', 'com.albedo.java.modules.gen.web.DatasourceConfResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  datasourceConfQueryCriteria: DatasourceConfQueryCriteria(name=null) }',
        '84', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:50:09.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2343, '生成方案查看', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/scheme/', 'com.albedo.java.modules.gen.web.SchemeResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  schemeQueryCriteria: SchemeQueryCriteria(blurry=null, createdDate=null) }',
        '85', 'MANAGE', '0000', '0',
        'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.tenant_code\' in \'where clause\'\r\n### The error may exist in file [C:\\Users\\Administrator\\IdeaProjects\\albedo-cloud\\albedo-modules\\albedo-gen\\target\\classes\\mapper\\gen\\SchemeMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT COUNT(*) AS total FROM gen_scheme a INNER JOIN gen_table b ON a.gen_table_id = b.id AND b.tenant_code = \'0000\' WHERE a.tenant_code = \'0000\'\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.tenant_code\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'a.tenant_code\' in \'where clause\'\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\r\n	at com.sun.proxy.$Proxy141.selectList(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:224)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForIPage(MybatisMapperMethod.java:121)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:85)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\r\n	at com.sun.proxy.$Proxy168.getSchemeVoPage(Unknown Source)\r\n	at com.albedo.java.modules.gen.service.impl.SchemeServiceImpl.getSchemeVoPage(SchemeServiceImpl.java:180)\r\n	at com.albedo.java.modules.gen.service.impl.SchemeServiceImpl$$FastClassBySpringCGLIB$$ab8b31c4.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(Reflectiv',
        1, '2022-04-11 13:50:12.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2344, '业务表查看', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/table/', 'com.albedo.java.modules.gen.web.TableResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  tableQueryCriteria: TableQueryCriteria(blurry=null, createdDate=null) }',
        '36', 'MANAGE', '0000', '0',
        'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\r\n### The error may exist in com/albedo/java/modules/gen/repository/TableRepository.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT COUNT(*) AS total FROM gen_table WHERE del_flag = \'0\' AND tenant_code = \'0000\'\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tenant_code\' in \'where clause\'\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\r\n	at com.sun.proxy.$Proxy141.selectList(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:224)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForIPage(MybatisMapperMethod.java:121)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:85)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\r\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\r\n	at com.sun.proxy.$Proxy147.selectPage(Unknown Source)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:344)\r\n	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:208)\r\n	at com.sun.proxy.$Proxy148.selectPage(Unknown Source)\r\n	at com.baomidou.mybatisplus.extension.service.IService.page(IService.java:389)\r\n	at com.baomidou.mybatisplus.extension.service.IService$$FastClassBySpringCGLIB$$f8525d18.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.albedo.java.modules.gen.service.impl.TableServiceImpl$$EnhancerBySpringCGLIB$$f9fa96e1.page(<generated>)\r\n	at com.albedo.java.modules.gen.web.TableResource.getPage(TableResource.java:72)\r\n	at com.albedo.java.modules.gen.web.TableResource$$FastClassBySpringCGLIB$$3ac2dad9.invoke(<generat',
        1, '2022-04-11 13:50:14.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2345, '业务表查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/table/', 'com.albedo.java.modules.gen.web.TableResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  tableQueryCriteria: TableQueryCriteria(blurry=null, createdDate=null) }',
        '13', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:50:50.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2346, '数据源查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf/', 'com.albedo.java.modules.gen.web.DatasourceConfResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  datasourceConfQueryCriteria: DatasourceConfQueryCriteria(name=null) }',
        '12', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:50:51.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2347, '生成方案查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/scheme/', 'com.albedo.java.modules.gen.web.SchemeResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  schemeQueryCriteria: SchemeQueryCriteria(blurry=null, createdDate=null) }',
        '30', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:50:53.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2348, '数据源查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf/', 'com.albedo.java.modules.gen.web.DatasourceConfResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  datasourceConfQueryCriteria: DatasourceConfQueryCriteria(name=null) }',
        '14', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:50:55.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2349, '业务表查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/table/', 'com.albedo.java.modules.gen.web.TableResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  tableQueryCriteria: TableQueryCriteria(blurry=null, createdDate=null) }',
        '13', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:50:56.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2350, '生成方案查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/scheme/', 'com.albedo.java.modules.gen.web.SchemeResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  schemeQueryCriteria: SchemeQueryCriteria(blurry=null, createdDate=null) }',
        '23', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:50:57.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2351, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '25', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:52:17.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2352, '菜单管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.save()',
        '{ menuDto: MenuDto(permission=null, icon=icon, component=components/Icons/index, type=1, hidden=0, cache=0, iframe=0, path=icons) }',
        '43', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:54:33.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2353, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '30', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:54:33.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2354, '在线用户查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '22', 'MANAGE',
        '0000', '0', NULL, 1, '2022-04-11 13:54:49.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2355, '登录日志管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/log-login/', 'com.albedo.java.modules.sys.web.LogLoginResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[OrderItem(column=createdDate, asc=false)])  logLoginQueryCriteria: LogLoginQueryCriteria(title=null, userId=null) }',
        '15', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:54:52.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2356, '在线用户查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '16', 'MANAGE',
        '0000', '0', NULL, 1, '2022-04-11 13:55:13.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2357, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '26', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:55:32.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2358, '菜单管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.save()',
        '{ menuDto: MenuDto(permission=sys_monitor_view, icon=codeConsole, component=monitor/service/index, type=1, hidden=0, cache=0, iframe=1, path=service) }',
        '39', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:56:19.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2359, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '25', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:56:19.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2360, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '32', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:56:22.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2361, '登录日志管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/log-login/', 'com.albedo.java.modules.sys.web.LogLoginResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[OrderItem(column=createdDate, asc=false)])  logLoginQueryCriteria: LogLoginQueryCriteria(title=null, userId=null) }',
        '19', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:56:27.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2362, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '26', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:56:31.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2363, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '34', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:56:33.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2364, '在线用户查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '17', 'MANAGE',
        '0000', '0', NULL, 1, '2022-04-11 13:56:36.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2365, '在线用户查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/user-online/', 'com.albedo.java.modules.sys.web.UserOnlineResource.findPage()',
        '{ userOnlineQueryCriteria: UserOnlineQueryCriteria(current=1, size=10, username=null) }', '16', 'MANAGE',
        '0000', '0', NULL, 1, '2022-04-11 13:56:59.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2366, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '24', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:57:03.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2367, '菜单管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.save()',
        '{ menuDto: MenuDto(permission=sys_monitor_view, icon=codeConsole, component=monitor/service/index, type=1, hidden=0, cache=0, iframe=1, path=_blank) }',
        '38', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:58:03.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2368, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '28', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:58:03.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2369, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '28', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:58:05.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2370, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '23', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:58:12.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2371, '退出成功', NULL, 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/token/logout', NULL, 'Bearer 4f14afc4-bdd8-4ed5-9b99-5c4242faaaaa', '0', '0', '0000', '0', NULL, 1,
        '2022-04-11 13:58:15.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2372, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '29', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:58:19.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2373, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '24', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:59:09.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2374, '菜单管理编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu', 'com.albedo.java.modules.sys.web.MenuResource.save()',
        '{ menuDto: MenuDto(permission=sys_monitor_view, icon=codeConsole, component=monitor/service/index, type=1, hidden=0, cache=0, iframe=0, path=monitor) }',
        '36', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:59:24.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2375, '菜单管理查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/menu/', 'com.albedo.java.modules.sys.web.MenuResource.findTreeList()',
        '{ menuQueryCriteria: MenuQueryCriteria(notId=null, searchId=null, parentId=null, blurry=null, type=null, createdDate=null) }',
        '31', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:59:25.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2376, '数据源查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf/', 'com.albedo.java.modules.gen.web.DatasourceConfResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  datasourceConfQueryCriteria: DatasourceConfQueryCriteria(name=null) }',
        '23', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 13:59:37.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2377, '数据源编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf', 'com.albedo.java.modules.gen.web.DatasourceConfResource.save()',
        '{ datasourceConfDto: DatasourceConfDto(name=cloud, url=jdbc:mysql://localhost:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true, username=root, password=111111) }',
        '3090', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:00:49.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2378, '数据源查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf/', 'com.albedo.java.modules.gen.web.DatasourceConfResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  datasourceConfQueryCriteria: DatasourceConfQueryCriteria(name=null) }',
        '200', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:00:53.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2379, '业务表查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/table/', 'com.albedo.java.modules.gen.web.TableResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  tableQueryCriteria: TableQueryCriteria(blurry=null, createdDate=null) }',
        '41', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:00:56.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2380, '数据源查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf/', 'com.albedo.java.modules.gen.web.DatasourceConfResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  datasourceConfQueryCriteria: DatasourceConfQueryCriteria(name=null) }',
        '19', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:01:07.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2381, '数据源编辑', 'ERROR', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf', 'com.albedo.java.modules.gen.web.DatasourceConfResource.save()',
        '{ datasourceConfDto: DatasourceConfDto(name=gen, url=jdbc:mysql://localhost:3306/albedo-gen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true, username=root, password=11111) }',
        '51', 'MANAGE', '0000', '0',
        'java.lang.IllegalArgumentException: 无效数据源\r\n	at org.springframework.util.Assert.isTrue(Assert.java:121)\r\n	at com.albedo.java.modules.gen.service.impl.DatasourceConfServiceImpl.saveOrUpdate(DatasourceConfServiceImpl.java:76)\r\n	at com.albedo.java.modules.gen.service.impl.DatasourceConfServiceImpl.saveOrUpdate(DatasourceConfServiceImpl.java:52)\r\n	at com.albedo.java.modules.gen.service.impl.DatasourceConfServiceImpl$$FastClassBySpringCGLIB$$c683c3e0.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\r\n	at com.albedo.java.modules.gen.service.impl.DatasourceConfServiceImpl$$EnhancerBySpringCGLIB$$47d16b68.saveOrUpdate(<generated>)\r\n	at com.albedo.java.modules.gen.web.DatasourceConfResource.save(DatasourceConfResource.java:75)\r\n	at com.albedo.java.modules.gen.web.DatasourceConfResource$$FastClassBySpringCGLIB$$b525fbfa.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at com.albedo.java.common.log.aspect.RequestLogAspect.around(RequestLogAspect.java:145)\r\n	at sun.reflect.GeneratedMethodAccessor277.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\r\n',
        1, '2022-04-11 14:01:29.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2382, '数据源编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf', 'com.albedo.java.modules.gen.web.DatasourceConfResource.save()',
        '{ datasourceConfDto: DatasourceConfDto(name=gen, url=jdbc:mysql://localhost:3306/albedo-gen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true, username=root, password=111111) }',
        '76', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:01:34.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2383, '数据源查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf/', 'com.albedo.java.modules.gen.web.DatasourceConfResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  datasourceConfQueryCriteria: DatasourceConfQueryCriteria(name=null) }',
        '17', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:01:34.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2384, '业务表查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/table/', 'com.albedo.java.modules.gen.web.TableResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  tableQueryCriteria: TableQueryCriteria(blurry=null, createdDate=null) }',
        '11', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:01:40.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2385, '数据源查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf/', 'com.albedo.java.modules.gen.web.DatasourceConfResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  datasourceConfQueryCriteria: DatasourceConfQueryCriteria(name=null) }',
        '18', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:01:41.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2386, '数据源编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf', 'com.albedo.java.modules.gen.web.DatasourceConfResource.save()',
        '{ datasourceConfDto: DatasourceConfDto(name=cloud, url=jdbc:mysql://localhost:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true, username=root, password=111111) }',
        '32', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:01:52.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2387, '数据源查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/datasource-conf/', 'com.albedo.java.modules.gen.web.DatasourceConfResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  datasourceConfQueryCriteria: DatasourceConfQueryCriteria(name=null) }',
        '18', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:01:53.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2388, '业务表查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/table/', 'com.albedo.java.modules.gen.web.TableResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  tableQueryCriteria: TableQueryCriteria(blurry=null, createdDate=null) }',
        '16', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:01:54.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2389, '业务表编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/table', 'com.albedo.java.modules.gen.web.TableResource.save()',
        '{ tableDto: TableDto(name=test_book, comments=测试书籍, className=TestBook, dsName=gen, parentTable=null, parentTableFk=null, parent=null, childList=[], nameAndTitle=test_book  :  测试书籍, nameLike=null, pkList=[id], category=null, pkColumnList=null, columnList=[], columnFormList=[TableColumnDto(tableId=null, table=null, name=id, title=id, comments=null, jdbcType=varchar(32), javaType=String, javaField=id, isPk=true, isUnique=false, isNull=false, isInsert=true, isEdit=false, isList=false, isQuery=false, queryType=eq, showType=input, dictType=, sort=10, hibernateValidatorExprssion=@Size(max=32), nameAndTitle=id  :  id), TableColumnDto(tableId=null, table=null, name=title_, title=标题, comments=null, jdbcType=varchar(32), javaType=String, javaField=title, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=true, isList=true, isQuery=true, queryType=like, showType=input, dictType=, sort=20, hibernateValidatorExprssion=@Size(max=32), nameAndTitle=title_  :  标题), TableColumnDto(tableId=null, table=null, name=author_, title=作者, comments=null, jdbcType=varchar(50), javaType=String, javaField=author, isPk=false, isUnique=false, isNull=false, isInsert=true, isEdit=true, isList=true, isQuery=false, queryType=eq, showType=input, dictType=, sort=30, hibernateValidatorExprssion=@NotBlank @Size(max=50), nameAndTitle=author_  :  作者), TableColumnDto(tableId=null, table=null, name=name_, title=名称, comments=null, jdbcType=varchar(50), javaType=String, javaField=name, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=true, isList=true, isQuery=true, queryType=like, showType=input, dictType=, sort=40, hibernateValidatorExprssion=@Size(max=50), nameAndTitle=name_  :  名称), TableColumnDto(tableId=null, table=null, name=email_, title=邮箱, comments=null, jdbcType=varchar(100), javaType=String, javaField=email, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=true, isList=true, isQuery=false, queryType=eq, showType=input, dictType=, sort=50, hibernateValidatorExprssion=@Email @Size(max=100), nameAndTitle=email_  :  邮箱), TableColumnDto(tableId=null, table=null, name=phone_, title=手机, comments=null, jdbcType=varchar(32), javaType=String, javaField=phone, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=true, isList=true, isQuery=false, queryType=eq, showType=input, dictType=, sort=60, hibernateValidatorExprssion=@Size(max=32), nameAndTitle=phone_  :  手机), TableColumnDto(tableId=null, table=null, name=activated_, title=activated_, comments=null, jdbcType=bit(1), javaType=Integer, javaField=activated, isPk=false, isUnique=false, isNull=false, isInsert=true, isEdit=true, isList=true, isQuery=false, queryType=eq, showType=input, dictType=, sort=70, hibernateValidatorExprssion=@NotNull , nameAndTitle=activated_  :  activated_), TableColumnDto(tableId=null, table=null, name=number_, title=key, comments=null, jdbcType=int, javaType=Long, javaField=number, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=true, isList=true, isQuery=false, queryType=eq, showType=input, dictType=, sort=80, hibernateValidatorExprssion=, nameAndTitle=number_  :  key), TableColumnDto(tableId=null, table=null, name=money_, title=money_, comments=null, jdbcType=decimal(20,2), javaType=Double, javaField=money, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=true, isList=true, isQuery=false, queryType=eq, showType=input, dictType=, sort=90, hibernateValidatorExprssion=, nameAndTitle=money_  :  money_), TableColumnDto(tableId=null, table=null, name=amount_, title=amount_, comments=null, jdbcType=double(11,2), javaType=Double, javaField=amount, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=true, isList=true, isQuery=false, queryType=eq, showType=input, dictType=, sort=100, hibernateValidatorExprssion=, nameAndTitle=amount_  :  amount_), TableColumnDto(tableId=null, table=null, name=reset_date, title=reset_date, comments=null, jdbcType=timestamp(3), javaType=java.util.Date, javaField=resetDate, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=true, isList=true, isQuery=false, queryType=eq, showType=dateselect, dictType=, sort=110, hibernateValidatorExprssion=, nameAndTitle=reset_date  :  reset_date), TableColumnDto(tableId=null, table=null, name=created_by, title=created_by, comments=null, jdbcType=varchar(50), javaType=String, javaField=createdBy, isPk=false, isUnique=false, isNull=false, isInsert=true, isEdit=false, isList=false, isQuery=false, queryType=eq, showType=input, dictType=, sort=120, hibernateValidatorExprssion=@NotBlank @Size(max=50), nameAndTitle=created_by  :  created_by), TableColumnDto(tableId=null, table=null, name=created_date, title=created_date, comments=null, jdbcType=timestamp(3), javaType=java.util.Date, javaField=createdDate, isPk=false, isUnique=false, isNull=false, isInsert=true, isEdit=false, isList=false, isQuery=false, queryType=eq, showType=dateselect, dictType=, sort=130, hibernateValidatorExprssion=@NotNull , nameAndTitle=created_date  :  created_date), TableColumnDto(tableId=null, table=null, name=last_modified_by, title=last_modified_by, comments=null, jdbcType=varchar(50), javaType=String, javaField=lastModifiedBy, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=false, isList=false, isQuery=false, queryType=eq, showType=input, dictType=, sort=140, hibernateValidatorExprssion=@Size(max=50), nameAndTitle=last_modified_by  :  last_modified_by), TableColumnDto(tableId=null, table=null, name=last_modified_date, title=last_modified_date, comments=null, jdbcType=timestamp(3), javaType=java.util.Date, javaField=lastModifiedDate, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=false, isList=false, isQuery=false, queryType=eq, showType=dateselect, dictType=, sort=150, hibernateValidatorExprssion=, nameAndTitle=last_modified_date  :  last_modified_date), TableColumnDto(tableId=null, table=null, name=description, title=备注, comments=null, jdbcType=varchar(255), javaType=String, javaField=description, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=true, isList=false, isQuery=false, queryType=eq, showType=input, dictType=, sort=160, hibernateValidatorExprssion=@Size(max=255), nameAndTitle=description  :  备注), TableColumnDto(tableId=null, table=null, name=version, title=version, comments=null, jdbcType=int, javaType=Long, javaField=version, isPk=false, isUnique=false, isNull=true, isInsert=true, isEdit=false, isList=false, isQuery=false, queryType=eq, showType=input, dictType=, sort=170, hibernateValidatorExprssion=, nameAndTitle=version  :  version), TableColumnDto(tableId=null, table=null, name=del_flag, title=0-正常，1-删除, comments=null, jdbcType=char(1), javaType=String, javaField=delFlag, isPk=false, isUnique=false, isNull=false, isInsert=true, isEdit=false, isList=false, isQuery=false, queryType=eq, showType=radio, dictType=sys_flag, sort=180, hibernateValidatorExprssion=@NotBlank @Size(max=1), nameAndTitle=del_flag  :  0-正常，1-删除), TableColumnDto(tableId=null, table=null, name=tenant_code, title=租户编码, comments=null, jdbcType=varchar(20), javaType=String, javaField=tenantCode, isPk=false, isUnique=false, isNull=false, isInsert=true, isEdit=false, isList=false, isQuery=false, queryType=eq, showType=input, dictType=, sort=190, hibernateValidatorExprssion=@NotBlank @Size(max=20), nameAndTitle=tenant_code  :  租户编码)]) }',
        '163', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:02:03.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2390, '业务表查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/table/', 'com.albedo.java.modules.gen.web.TableResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  tableQueryCriteria: TableQueryCriteria(blurry=null, createdDate=null) }',
        '18', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:02:04.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2391, '生成方案查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/scheme/', 'com.albedo.java.modules.gen.web.SchemeResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  schemeQueryCriteria: SchemeQueryCriteria(blurry=null, createdDate=null) }',
        '22', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:02:06.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2392, '生成方案编辑', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/scheme/', 'com.albedo.java.modules.gen.web.SchemeResource.save()',
        '{ schemeDto: SchemeDto(name=测试书籍, category=curd, viewType=null, packageName=com.albedo.java.modules, moduleName=test, subModuleName=null, functionName=测试书籍, functionNameSimple=测试书籍, functionAuthor=admin, tableId=1513396943223521280, tableDto=null, genCode=false, replaceFile=false) }',
        '49', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:02:26.000', NULL, '0');
INSERT INTO `sys_log_operate`
VALUES (2393, '生成方案查看', 'INFO', 'admin', 'albedo', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        '/scheme/', 'com.albedo.java.modules.gen.web.SchemeResource.getPage()',
        '{ pm: PageModel(current=1,size=10,orders=[])  schemeQueryCriteria: SchemeQueryCriteria(blurry=null, createdDate=null) }',
        '41', 'MANAGE', '0000', '0', NULL, 1, '2022-04-11 14:02:26.000', NULL, '0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
  `id`                 bigint(0) NOT NULL COMMENT '菜单ID',
  `name`               varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL COMMENT '菜单名称',
  `type`               char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单类型 （0目录 1菜单 2按钮）',
  `permission`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限标识',
  `path`               varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端URL',
  `parent_id`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单ID',
  `parent_ids`         varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单IDs',
  `icon`               varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `component`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'VUE页面',
  `hidden`             bit(1) NULL DEFAULT b'0' COMMENT '隐藏',
  `iframe`             bit(1) NULL DEFAULT b'0' COMMENT '是否外链',
  `cache_`             bit(1) NULL DEFAULT b'0' COMMENT '缓存',
  `leaf`               bit(1) NULL DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `sort`               int(0) NULL DEFAULT 1 COMMENT '排序值',
  `created_by`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL,
  `created_date`       timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
  `last_modified_by`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '更新时间',
  `description`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version`            int(0) NOT NULL,
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (330, '生成方案编辑', '2', 'gen_scheme_edit', NULL, '9999', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-07-21 13:29:14.000', '1', '2021-11-22 15:20:28.451', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (334, '服务监控', '1', 'sys_monitor_view', 'monitor', '2000', '2000,', 'codeConsole', 'monitor/service/index', b'0',
        b'0', b'0', b'1', 40, '1', '2019-08-05 17:21:10.000', '1', '2021-11-19 18:29:35.734', NULL, 5, '0', '0000');
INSERT INTO `sys_menu`
VALUES (335, '生成方案查看', '2', 'gen_scheme_view', NULL, '9999', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-08-11 08:48:09.000', '1', '2021-11-22 15:20:28.453', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (336, '操作日志查看', '2', 'sys_logOperate_view', NULL, '2100', '2000,2100,', NULL, NULL, b'0', b'0', b'0', b'1', 30,
        '1', '2019-08-07 17:51:38.454', '1', '2021-11-19 18:29:35.736', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (337, '数据源编辑', '2', 'gen_datasourceConf_edit', NULL, '8877', '', NULL, NULL, b'0', b'0', b'0', b'1', 40, '1',
        '2020-09-20 09:11:12.778', '1', '2021-11-22 15:30:14.383', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (338, '组件管理', '0', NULL, '/components', '-1', NULL, 'zujian', 'Layout', b'0', b'0', b'0', b'0', 80, '1',
        '2020-05-15 20:57:28.521', '1', '2021-11-19 18:29:35.739', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (339, '生成方案代码', '2', 'gen_scheme_code', NULL, '9999', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-08-11 08:55:37.000', '1', '2021-11-22 15:20:28.443', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (440, '三级菜单2', '1', NULL, 'menu1-2', '9000', '', 'dev', 'nested/menu1/menu1-2', b'0', b'0', b'0', b'1', 30, '1',
        '2020-05-18 11:13:18.819', '1', '2021-11-22 15:34:11.433', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (445, '业务表删除', '2', 'gen_table_del', NULL, '7000', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-07-21 13:24:45.000', '1', '2021-11-22 15:20:53.409', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (446, '多级菜单', '0', NULL, '/nested', '-1', NULL, 'dev', 'Layout', b'0', b'0', b'0', b'0', 100, '1',
        '2020-05-18 11:09:23.393', '1', '2021-11-19 18:29:35.745', NULL, 9, '0', '0000');
INSERT INTO `sys_menu`
VALUES (447, '系统工具', '0', NULL, '/admin', '-1', NULL, 'sys-tools', 'Layout', b'0', b'0', b'0', b'0', 30, '1',
        '2019-08-05 15:58:12.000', '1', '2021-11-19 18:29:35.750', NULL, 2, '0', '0000');
INSERT INTO `sys_menu`
VALUES (448, '在线用户强退', '2', 'sys_userOnline_logout', NULL, '7766', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-08-11 10:57:51.502', '1', '2021-11-22 15:21:25.665', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (449, '数据源查看', '2', 'gen_datasourceConf_view', NULL, '8877', '', NULL, NULL, b'0', b'0', b'0', b'1', 20, '1',
        '2020-09-20 09:11:12.771', '1', '2021-11-22 15:30:14.384', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1000, '系统管理', '0', NULL, '/perm', '-1', NULL, 'menu', 'Layout', b'0', b'0', b'0', b'0', 10, '1',
        '2018-09-28 08:29:53.000', '1', '2021-12-26 11:31:40.144', NULL, 4, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1100, '用户管理', '1', 'sys_user_view', 'user', '1000', '1000,', 'peoples', 'sys/user/index', b'0', b'0', b'0',
        b'0', 10, '1', '2017-11-02 22:24:37.000', '1', '2021-12-26 11:31:40.146', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1101, '用户编辑', '2', 'sys_user_edit', NULL, '1100', '1000,1100,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2017-11-08 09:52:09.000', '1', '2021-12-26 11:31:40.147', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1102, '用户锁定', '2', 'sys_user_lock', NULL, '1100', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2017-11-08 09:52:48.000', NULL, '2021-12-26 11:31:40.148', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1103, '用户删除', '2', 'sys_user_del', NULL, '1100', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2017-11-08 09:54:01.000', NULL, '2021-12-26 11:31:40.149', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1166, '富文本', '1', NULL, 'editor', '338', '', 'fwb', 'components/Editor', b'0', b'0', b'0', b'1', 30, '1',
        '2020-05-15 21:16:40.552', '1', '2021-11-22 15:33:24.892', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1200, '菜单管理', '1', 'sys_menu_view', 'menu', '1000', '1000,', 'menu', 'sys/menu/index', b'0', b'0', b'0', b'0',
        40, '1', '2017-11-08 09:57:27.000', '1', '2021-12-26 11:31:40.151', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1201, '菜单编辑', '2', 'sys_menu_edit', NULL, '1200', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2017-11-08 10:15:53.000', NULL, '2021-12-26 11:31:40.152', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1202, '菜单锁定', '2', 'sys_menu_lock', NULL, '1200', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2017-11-08 10:16:23.000', NULL, '2021-12-26 11:31:40.154', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1203, '菜单删除', '2', 'sys_menu_del', NULL, '1200', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2017-11-08 10:16:43.000', NULL, '2021-12-26 11:31:40.155', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1300, '角色管理', '1', 'sys_role_view', 'role', '1000', '1000,', 'role', 'sys/role/index', b'0', b'0', b'0', b'0',
        20, '1', '2017-11-08 10:13:37.000', '1', '2021-12-26 11:31:40.156', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1301, '角色编辑', '2', 'sys_role_edit', NULL, '1300', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2017-11-08 10:14:18.000', NULL, '2021-12-26 11:31:40.158', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1302, '角色锁定', '2', 'sys_role_lock', NULL, '1300', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2017-11-08 10:14:41.000', NULL, '2021-12-26 11:31:40.159', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1303, '角色删除', '2', 'sys_role_del', NULL, '1300', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2017-11-08 10:14:59.000', NULL, '2021-12-26 11:31:40.161', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1400, '部门管理', '1', 'sys_dept_view', 'dept', '1000', '1000,', 'dept', 'sys/dept/index', b'0', b'0', b'0', b'0',
        30, '1', '2018-01-20 13:17:19.000', '1', '2021-12-26 11:31:40.163', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1401, '部门编辑', '2', 'sys_dept_edit', NULL, '1400', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2018-01-20 14:56:16.000', NULL, '2021-12-26 11:31:40.164', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1402, '部门锁定', '2', 'sys_dept_lock', NULL, '1400', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2018-01-20 14:56:59.000', NULL, '2021-12-26 11:31:40.165', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1403, '部门删除', '2', 'sys_dept_del', NULL, '1400', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2018-01-20 14:57:28.000', NULL, '2021-12-26 11:31:40.166', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (2000, '系统监控', '0', NULL, '/sys', '-1', NULL, 'system', 'Layout', b'0', b'0', b'0', b'0', 20, '1',
        '2017-11-07 20:56:00.000', '1', '2021-11-19 18:29:35.780', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (2100, '操作日志', '1', NULL, 'log-operate', '2000', '2000,', 'log', 'monitor/log-operate/index', b'0', b'0', b'0',
        b'0', 60, '1', '2017-11-20 14:06:22.000', '1', '2021-11-19 18:29:35.781', NULL, 1, '0', '0000');
INSERT INTO `sys_menu`
VALUES (2101, '操作日志删除', '2', 'sys_logOperate_del', NULL, '2100', '2000,2100,', NULL, NULL, b'0', b'0', b'0', b'1', 30,
        '1', '2017-11-20 20:37:37.000', '1', '2021-11-19 18:29:35.782', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (2200, '字典管理', '1', 'sys_dict_view', 'dict', '1000', '1000,', 'dictionary', 'sys/dict/index', b'0', b'0', b'0',
        b'0', 50, '1', '2017-11-29 11:30:52.000', '1', '2021-12-26 11:31:40.171', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (2201, '字典删除', '2', 'sys_dict_del', NULL, '2200', '1000,2200,', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2017-11-29 11:30:11.000', '1', '2021-12-26 11:31:40.173', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (2202, '字典编辑', '2', 'sys_dict_edit', NULL, '2200', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 30, '1',
        '2018-05-11 22:34:55.000', '1', '2021-12-26 11:31:40.174', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (2500, '接口文档', '1', NULL, 'swagger2', '447', '', 'swagger', 'tool/swagger/index', b'0', b'0', b'0', b'1', 20,
        '1', '2018-06-26 10:50:32.000', '1', '2021-11-22 15:31:37.510', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (2600, '令牌管理', '1', NULL, 'persistent-token', '2000', '2000,', 'dev', 'monitor/persistent-token/index', b'0',
        b'0', b'0', b'0', 20, '1', '2018-09-04 05:58:41.000', '1', '2022-01-06 15:16:03.553', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (2601, '令牌删除', '2', 'sys_persistentToken_del', NULL, '2600', '', NULL, NULL, b'0', b'0', b'0', b'1', 1, '1',
        '2018-09-04 05:59:50.000', '1', '2022-01-06 15:15:59.099', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (3333, '在线用户查看', '2', 'sys_userOnline_view', NULL, '7766', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-08-07 09:05:28.000', '1', '2021-11-22 15:21:25.667', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (4422, '任务调度执行', '2', 'quartz_job_run', NULL, '6655', '', NULL, NULL, b'0', b'0', b'0', b'1', 20, '1',
        '2019-08-15 16:10:59.000', '1', '2021-12-26 12:00:46.281', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (4433, '支付宝工具', '1', NULL, 'alipay', '447', '', 'alipay', 'tool/alipay/index', b'0', b'0', b'0', b'1', 40, '1',
        '2020-05-17 17:58:06.876', '1', '2021-11-22 15:31:26.775', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (4444, '邮件工具', '1', NULL, 'email', '447', '', 'email', 'tool/email/index', b'0', b'0', b'0', b'1', 30, '1',
        '2020-05-17 17:56:56.008', '1', '2021-11-22 15:31:26.773', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (4455, '任务调度查看', '2', 'quartz_job_view', NULL, '6655', '', NULL, NULL, b'0', b'0', b'0', b'1', 10, '1',
        '2019-08-14 10:36:47.085', '1', '2021-12-26 12:00:46.281', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (5544, '任务调度日志', '2', 'quartz_jobLog_view', NULL, '6655', '', NULL, NULL, b'0', b'0', b'0', b'1', 50, '1',
        '2019-08-15 16:11:30.986', '1', '2021-12-26 12:00:46.281', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (5555, '操作日志导出', '2', 'sys_logOperate_export', NULL, '2100', '2000,2100,', NULL, NULL, b'0', b'0', b'0', b'1',
        30, '1', '2019-08-07 17:50:46.973', '1', '2021-11-19 18:29:35.796', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (5566, '数据源删除', '2', 'gen_datasourceConf_del', NULL, '8877', '', NULL, NULL, b'0', b'0', b'0', b'1', 80, '1',
        '2020-09-20 09:11:12.784', '1', '2021-11-22 15:30:14.380', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (5588, '令牌查看', '2', 'sys_persistentToken_view', NULL, '2600', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-08-08 09:44:25.617', '1', '2022-01-06 15:15:59.053', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (6000, '图表库', '1', NULL, 'Echarts', '338', '', 'chart', 'components/Echarts', b'0', b'0', b'0', b'1', 20, '1',
        '2020-05-15 21:12:39.827', '1', '2021-11-22 15:33:36.828', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (6655, '任务调度', '1', NULL, 'job', '1000', '1000,', 'timing', 'quartz/job/index', b'0', b'0', b'0', b'0', 60, '1',
        '2019-08-14 10:36:47.081', '1', '2021-12-26 12:00:55.719', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (6666, '字典可用', '2', 'sys_dict_lock', NULL, '2200', '1000,2200,', NULL, NULL, b'0', NULL, b'0', b'1', 999, '1',
        '2020-05-15 17:24:57.559', '1', '2021-12-26 11:31:40.179', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (6677, '代码生成', '0', NULL, '/gen', '447', '', 'codeConsole', 'gen/index', b'0', b'0', b'0', b'0', 10, '1',
        '2019-07-20 12:00:48.000', '1', '2021-11-22 15:32:02.221', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (7000, '业务表', '1', '', 'table', '6677', '', 'list', 'gen/table/index', b'0', b'0', b'0', b'0', 10, '1',
        '2019-07-20 12:02:02.000', '1', '2021-11-22 15:32:49.229', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (7700, '业务表编辑', '1', 'gen_table_edit', 'edit', '6677', '', NULL, 'gen/table/edit', b'1', b'0', b'0', b'1', 20,
        '1', '2019-07-21 13:24:02.000', '1', '2021-11-22 15:20:53.411', NULL, 1, '0', '0000');
INSERT INTO `sys_menu`
VALUES (7766, '在线用户', '1', '', 'user-online', '2000', '2000,', 'Steve-Jobs', 'monitor/user-online/index', b'0', b'0',
        b'0', b'0', 30, '1', '2019-08-07 09:03:52.000', '1', '2021-11-19 18:29:35.805', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (7777, '任务调度删除', '2', 'quartz_job_del', NULL, '6655', NULL, NULL, NULL, b'0', b'0', b'0', b'0', 40, '1',
        '2019-08-14 10:36:47.091', '1', '2021-12-26 12:00:46.281', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (7788, '生成方案菜单', '2', 'gen_scheme_menu', NULL, '9999', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-07-25 13:03:03.000', '1', '2021-11-22 15:20:28.452', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (7799, '任务调度编辑', '2', 'quartz_job_edit', NULL, '6655', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-08-14 10:36:47.088', '1', '2021-12-26 12:00:46.281', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (8855, 'Markdown', '1', NULL, 'markdown', '338', '', 'markdown', 'components/MarkDown', b'0', b'0', b'0', b'1',
        40, '1', '2020-05-15 21:21:46.675', '1', '2021-11-22 15:33:22.311', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (8877, '数据源', '1', NULL, 'datasource-conf', '6677', '', 'database', 'gen/datasource-conf/index', b'0', b'0',
        b'0', b'0', 5, '1', '2020-09-20 09:11:12.765', '1', '2021-11-22 15:33:20.945', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (8888, '二级菜单1', '1', NULL, 'menu1', '446', '', 'dev', 'nested/menu1/index', b'0', b'0', b'0', b'0', 10, '1',
        '2020-05-18 11:10:06.354', '1', '2021-11-22 15:33:58.182', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (8899, 'Yaml编辑器', '1', NULL, 'yaml', '338', '', 'dev', 'components/YamlEdit', b'0', b'0', b'0', b'1', 50, '1',
        '2020-05-15 21:22:43.364', '1', '2021-11-22 15:33:14.776', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (9000, '二级菜单2', '1', NULL, 'menu2', '446', '', 'dev', 'nested/menu2/index', b'0', b'0', b'0', b'1', 30, '1',
        '2020-05-18 11:14:32.907', '1', '2021-11-22 15:34:07.276', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (9900, '三级菜单1', '1', NULL, 'menu1-1', '9000', '', 'dev', 'nested/menu1/menu1-1', b'0', b'0', b'0', b'1', 30, '1',
        '2020-05-18 11:11:16.436', '1', '2021-11-22 15:34:09.295', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (9911, '生成方案删除', '2', 'gen_scheme_del', NULL, '9999', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-07-21 13:30:18.000', '1', '2021-11-22 15:20:28.449', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (9922, '任务调度日志导出', '2', 'quartz_jobLog_export', NULL, '6655', '', NULL, NULL, b'0', b'0', b'0', b'1', 60, '1',
        '2019-08-15 16:13:16.742', '1', '2021-12-26 12:00:46.281', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (9944, '业务表查看', '2', 'gen_table_view', NULL, '7000', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-08-11 08:47:39.828', '1', '2021-11-22 15:20:53.413', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (9955, '用户导出', '2', 'sys_user_export', NULL, '1100', '1000,1100,', NULL, NULL, b'0', b'0', b'0', b'1', 80, '1',
        '2019-08-07 17:50:02.000', '1', '2021-12-26 11:31:40.170', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (9977, '在线用户删除', '2', 'sys_userOnline_del', NULL, '7766', '', NULL, NULL, b'0', b'0', b'0', b'1', 30, '1',
        '2019-08-07 09:06:33.448', '1', '2021-11-22 15:21:25.663', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (9988, '图标库', '1', NULL, 'icons', '338', '', 'icon', 'components/Icons/index', b'0', b'0', b'0', b'1', 10, '1',
        '2020-05-15 21:14:28.945', '1', '2021-11-22 15:33:12.130', NULL, 1, '0', '0000');
INSERT INTO `sys_menu`
VALUES (9999, '生成方案', '1', NULL, 'scheme', '6677', '', 'dev', 'gen/scheme/index', b'0', b'0', b'0', b'0', 30, '1',
        '2019-07-21 13:27:35.000', '1', '2021-11-22 15:33:01.113', NULL, 2, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1465206065929912320, '测试书籍', '1', NULL, 'test-book', '446', NULL, 'icon-right-square', 'test/test-book/index',
        b'0', b'0', b'0', b'0', 30, '1', '2021-11-29 14:28:42.987', '1', '2021-12-26 11:31:40.169', NULL, 0, '0',
        '0000');
INSERT INTO `sys_menu`
VALUES (1465206065955078144, '测试书籍查看', '2', 'test_testBook_view', NULL, '1465206065929912320', NULL, NULL, NULL, b'0',
        b'0', b'0', b'0', 20, '1', '2021-11-29 14:28:42.993', '1', '2021-12-26 11:31:40.167', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1465206065976049664, '测试书籍编辑', '2', 'test_testBook_edit', NULL, '1465206065929912320', NULL, NULL, NULL, b'0',
        b'0', b'0', b'0', 40, '1', '2021-11-29 14:28:42.998', '1', '2021-12-26 11:31:40.150', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1465206065988632576, '测试书籍删除', '2', 'test_testBook_del', NULL, '1465206065929912320', NULL, NULL, NULL, b'0',
        b'0', b'0', b'0', 80, '1', '2021-11-29 14:28:43.001', '1', '2021-12-26 11:31:40.143', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1465216162739519488, '测试树书籍', '1', NULL, 'test-tree-book', '446', NULL, 'icon-right-square',
        'test/test-tree-book/index', b'0', b'0', b'0', b'0', 30, '1', '2021-11-29 15:08:50.254', '1',
        '2021-12-26 11:31:40.142', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1465216162764685312, '测试树书籍查看', '2', 'test_testTreeBook_view', NULL, '1465216162739519488', NULL, NULL, NULL,
        b'0', b'0', b'0', b'0', 20, '1', '2021-11-29 15:08:50.259', '1', '2021-12-26 11:31:40.141', NULL, 0, '0',
        '0000');
INSERT INTO `sys_menu`
VALUES (1465216162777268224, '测试树书籍编辑', '2', 'test_testTreeBook_edit', NULL, '1465216162739519488', NULL, NULL, NULL,
        b'0', b'0', b'0', b'0', 40, '1', '2021-11-29 15:08:50.263', '1', '2021-12-26 11:31:40.140', NULL, 0, '0',
        '0000');
INSERT INTO `sys_menu`
VALUES (1465216162798239744, '测试树书籍删除', '2', 'test_testTreeBook_del', NULL, '1465216162739519488', NULL, NULL, NULL,
        b'0', b'0', b'0', b'0', 80, '1', '2021-11-29 15:08:50.268', '1', '2021-12-26 11:31:40.125', NULL, 0, '0',
        '0000');
INSERT INTO `sys_menu`
VALUES (1465502605210812416, '登录日志', '1', NULL, 'log-login', '2000', NULL, 'log', 'monitor/log-login/index', b'0', b'0',
        b'0', b'0', 50, '1', '2021-11-30 10:07:03.460', '1', '2021-11-30 10:07:03.460', NULL, 3, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1465502605244366848, '登录日志查看', '2', 'sys_logLogin_view', NULL, '1465502605210812416', NULL, NULL, NULL, b'0',
        b'0', b'0', b'0', 20, '1', '2021-11-30 10:07:03.469', '1', '2021-11-30 10:07:03.469', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1465502605277921280, '登录日志导出', '2', 'sys_logLogin_export', NULL, '1465502605210812416', NULL, NULL, NULL, b'0',
        b'0', b'0', b'0', 40, '1', '2021-11-30 10:07:03.477', '1', '2021-11-30 10:07:03.477', NULL, 1, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1465502605307281408, '登录日志删除', '2', 'sys_logLogin_del', NULL, '1465502605210812416', NULL, NULL, NULL, b'0',
        b'0', b'0', b'0', 80, '1', '2021-11-30 10:07:03.484', '1', '2021-11-30 10:07:03.484', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1468397111971151872, '附件管理', '1', NULL, 'appendix', '1000', NULL, 'documentation', 'sys/appendix/index', b'0',
        b'0', b'0', b'0', 70, '1', '2021-12-08 09:48:47.649', '1', '2022-01-06 15:08:00.496', NULL, 2, '1', '0000');
INSERT INTO `sys_menu`
VALUES (1468397112000512000, '附件管理查看', '2', 'sys_appendix_view', NULL, '1468397111971151872', NULL, NULL, NULL, b'0',
        b'0', b'0', b'0', 20, '1', '2021-12-08 09:48:47.657', '1', '2022-01-06 15:07:53.885', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (1468397112017289216, '附件管理添加', '2', 'sys_appendix_add', NULL, '1468397111971151872', NULL, NULL, NULL, b'0',
        b'0', b'0', b'0', 40, '1', '2021-12-08 09:48:47.661', '1', '2022-01-06 15:07:53.951', NULL, 1, '1', '0000');
INSERT INTO `sys_menu`
VALUES (1468397112029872128, '附件管理删除', '2', 'sys_appendix_del', NULL, '1468397111971151872', NULL, NULL, NULL, b'0',
        b'0', b'0', b'0', 80, '1', '2021-12-08 09:48:47.664', '1', '2022-01-06 15:07:53.994', NULL, 0, '1', '0000');
INSERT INTO `sys_menu`
VALUES (1468405431398301696, '文件管理', '1', NULL, 'file', '1000', NULL, 'app', 'sys/file/index', b'0', b'0', b'0', b'0',
        70, '1', '2021-12-08 10:21:51.156', '1', '2021-12-26 11:31:40.117', NULL, 1, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1468405431419273216, '文件管理查看', '2', 'sys_file_view', NULL, '1468405431398301696', NULL, NULL, NULL, b'0', b'0',
        b'0', b'0', 20, '1', '2021-12-08 10:21:51.161', '1', '2021-12-26 11:31:40.116', NULL, 0, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1468405431440244736, '文件管理编辑', '2', 'sys_file_add', NULL, '1468405431398301696', NULL, NULL, NULL, b'0', b'0',
        b'0', b'0', 40, '1', '2021-12-08 10:21:51.166', '1', '2021-12-26 11:31:40.115', NULL, 1, '0', '0000');
INSERT INTO `sys_menu`
VALUES (1468405431457021952, '文件管理删除', '2', 'sys_file_del', NULL, '1468405431398301696', NULL, NULL, NULL, b'0', b'0',
        b'0', b'0', 80, '1', '2021-12-08 10:21:51.169', '1', '2021-12-26 11:31:40.112', NULL, 0, '0', '0000');

-- ----------------------------
-- Table structure for sys_oauth_client_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_detail`;
CREATE TABLE `sys_oauth_client_detail`
(
  `client_id`               varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '客户端ID',
  `resource_ids`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '资源ID',
  `client_secret`           varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '客户端密钥',
  `scope`                   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '作用域',
  `authorized_grant_types`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '授权方式',
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '重定向地址',
  `authorities`             varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限',
  `access_token_validity`   int(0) NULL DEFAULT NULL COMMENT '请求令牌有效时间',
  `refresh_token_validity`  int(0) NULL DEFAULT NULL COMMENT '刷新令牌有效时间',
  `additional_information`  varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '扩展信息',
  `autoapprove`             varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否自动放行',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '终端信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oauth_client_detail
-- ----------------------------
INSERT INTO `sys_oauth_client_detail`
VALUES ('albedo', NULL, 'albedo', 'server', 'password,refresh_token,authorization_code,client_credentials',
        'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail`
VALUES ('app', NULL, 'app', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail`
VALUES ('daemon', NULL, 'daemon', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail`
VALUES ('gen', NULL, 'gen', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail`
VALUES ('swagger', NULL, 'swagger', 'all', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');

-- ----------------------------
-- Table structure for sys_parameter
-- ----------------------------
DROP TABLE IF EXISTS `sys_parameter`;
CREATE TABLE `sys_parameter`
(
  `id`                 bigint(0) NOT NULL COMMENT 'ID',
  `key_`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数键',
  `value`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数值',
  `name`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数名称',
  `state`              bit(1) NULL DEFAULT b'1' COMMENT '状态',
  `readonly_`          bit(1) NULL DEFAULT b'0' COMMENT '内置',
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '租户编码',
  `created_by`         bigint(0) NOT NULL,
  `created_date`       timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
  `last_modified_by`   bigint(0) NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '修改时间',
  `description`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version`            int(0) NOT NULL,
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_key`(`tenant_code`, `key_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_parameter
-- ----------------------------
INSERT INTO `sys_parameter`
VALUES (1, 'LoginPolicy', 'MANY', '登录策略', b'1', b'1', '0000', 0, '2021-10-27 13:51:01.785', NULL, NULL, NULL, 0, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
  `id`                 bigint(0) NOT NULL,
  `name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin        NOT NULL COMMENT '名称',
  `code`               varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '编码',
  `level`              int(0) NULL DEFAULT NULL COMMENT '角色级别',
  `data_scope`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据权限 1全部 2所在机构及以下数据  3 所在机构数据  4仅本人数据 5 按明细设置',
  `available`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '1-正常，0-锁定',
  `created_by`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL,
  `created_date`       timestamp(3)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `last_modified_by`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (3),
  `description`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version`            int(0) NOT NULL,
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '超级管理员', 'admin', 1, 'ALL', '1', '', '2017-10-29 15:45:51.000', '1', '2022-04-11 13:34:01.971', NULL, 75,
        '0', '0000');
INSERT INTO `sys_role`
VALUES (2, '机构管理员', 'manage', 2, 'CUSTOMIZE', '1', '0', '2018-11-11 19:42:26.000', '1', '2022-04-11 13:34:04.691', NULL,
        21, '0', '0000');
INSERT INTO `sys_role`
VALUES (5, '普通管理员', 'normal', 4, 'CUSTOMIZE', '1', '1', '2020-05-14 11:00:50.813', '1', '2022-04-11 13:34:10.663',
        '普通管理', 8, '0', '0000');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`
(
  `id`          bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id`     bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  `dept_id`     bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与部门对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept`
VALUES (1, 1, 8, '0000');
INSERT INTO `sys_role_dept`
VALUES (8, 2, 5, '0000');
INSERT INTO `sys_role_dept`
VALUES (9, 2, 4, '0000');
INSERT INTO `sys_role_dept`
VALUES (10, 2, 3, '0000');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
  `role_id`     bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id`     bigint(0) NOT NULL COMMENT '菜单ID',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu`
VALUES (1, 330, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 334, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 335, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 336, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 337, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 338, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 339, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 440, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 445, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 446, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 447, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 448, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 449, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1000, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1100, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1101, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1102, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1103, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1166, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1200, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1201, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1202, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1203, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1300, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1301, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1302, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1303, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1400, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1401, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1402, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1403, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 2000, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 2100, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 2101, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 2200, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 2201, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 2202, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 2500, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 3333, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 4433, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 4444, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 5555, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 5566, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 6000, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 6666, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 6677, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 7000, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 7700, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 7766, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 7788, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 8855, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 8877, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 8888, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 8899, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 9000, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 9900, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 9911, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 9944, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 9955, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 9977, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 9988, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 9999, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1465502605210812416, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1465502605244366848, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1465502605277921280, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1465502605307281408, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1468405431398301696, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1468405431419273216, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1468405431440244736, '0000');
INSERT INTO `sys_role_menu`
VALUES (1, 1468405431457021952, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 334, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 338, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 440, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 446, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 1000, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 1100, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 1101, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 1102, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 1103, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 1166, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 1200, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 1300, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 1400, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 2000, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 2200, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 6000, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 6655, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 8855, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 8888, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 8899, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 9000, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 9900, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 9955, '0000');
INSERT INTO `sys_role_menu`
VALUES (2, 9988, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 338, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 440, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 446, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 1000, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 1101, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 1102, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 1103, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 1166, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 1200, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 1400, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 2200, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 6000, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 6655, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 8855, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 8888, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 8899, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 9000, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 9900, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 9955, '0000');
INSERT INTO `sys_role_menu`
VALUES (5, 9988, '0000');

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`
(
  `id`                 bigint(0) NOT NULL COMMENT '主键ID',
  `code`               varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业编码',
  `name`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '企业名称',
  `type`               varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '类型 \n#{CREATE:创建;REGISTER:注册}',
  `connect_type`       varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '链接类型 \n#TenantConnectTypeEnum{LOCAL:本地;REMOTE:远程}',
  `status`             varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '状态 \n#{NORMAL:正常;WAIT_INIT:待初始化;FORBIDDEN:禁用;WAITING:待审核;REFUSE:拒绝;DELETE:已删除}',
  `readonly_`          bit(1) NULL DEFAULT b'0' COMMENT '内置',
  `duty`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '责任人',
  `expiration_time`    datetime(0) NULL DEFAULT NULL COMMENT '有效期 \n为空表示永久',
  `logo`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'logo地址',
  `describe_`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简介',
  `created_by`         bigint(0) NOT NULL,
  `created_date`       timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
  `last_modified_by`   bigint(0) NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '修改时间',
  `description`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version`            int(0) NOT NULL,
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '企业' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant`
VALUES (1, '0000', '最后内置的运营&超级租户', 'CREATE', 'LOCAL', 'NORMAL', b'1', '最后', NULL, NULL, NULL, 0,
        '2021-10-27 13:51:59.303', NULL, NULL, NULL, 0, '0');

-- ----------------------------
-- Table structure for sys_tenant_datasource_conf
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_datasource_conf`;
CREATE TABLE `sys_tenant_datasource_conf`
(
  `id`                   bigint(0) NOT NULL COMMENT 'ID',
  `tenant_id`            bigint(0) NOT NULL COMMENT '租户id',
  `datasource_config_id` bigint(0) NOT NULL COMMENT '数据源id',
  `application`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '服务',
  `created_by`           bigint(0) NOT NULL,
  `created_date`         timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
  `version`              int(0) NOT NULL,
  `del_flag`             char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenan_application`(`tenant_id`, `datasource_config_id`, `application`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '租户数据源关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant_datasource_conf
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
  `id`                 bigint(0) NOT NULL DEFAULT 1 COMMENT '主键ID',
  `username`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin        NOT NULL COMMENT '用户名',
  `password`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin       NOT NULL,
  `nickname`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '昵称',
  `phone`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '简介',
  `email`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `avatar`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像',
  `sex`                varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '性别 \n#Sex{W:女;M:男;N:未知}',
  `dept_id`            varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '部门ID',
  `qq_open_id`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'QQ openid',
  `wx_open_id`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '微信openid',
  `available`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '1-正常，0-锁定',
  `created_by`         bigint(0) NOT NULL,
  `created_date`       timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP (3) COMMENT '创建时间',
  `last_modified_by`   bigint(0) NULL DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '修改时间',
  `description`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version`            int(0) NOT NULL,
  `del_flag`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX                `user_wx_openid`(`wx_open_id`) USING BTREE,
  INDEX                `user_qq_openid`(`qq_open_id`) USING BTREE,
  INDEX                `user_idx1_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 'admin', '$2a$10$6z14VGdfVnlWY2K1pvdzJOHkvjLmOuBrJXXeZ0mGIqB60Qd6WYDoC', 'albedo', '17034642999',
        'albedo@ss.com', 'default.jpg', 'W', '1', NULL, 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', '1', 1,
        '2018-04-20 07:15:18.000', 1, '2021-12-25 09:46:31.267', '11', 90, '0', '0000');
INSERT INTO `sys_user`
VALUES (2, 'manage', '$2a$10$rmMeskeLIFFqP39zH5a2duJ0pcDvePqdwrSQHFW.rBVszm3lE9E2y', NULL, '13254642311', '13@qqx.om',
        NULL, 'M', '1', NULL, NULL, '1', 1, '2020-05-12 09:51:46.703', 1, '2021-12-04 13:15:51.645', NULL, 16, '0',
        '0000');
INSERT INTO `sys_user`
VALUES (3, 'ttttt', '$2a$10$KYuAjYBhucUG4GbYQTuRO.YOl6JJlGdEdD5zGLkfrSumnjEF59S7G', '1', '13245678975', '1@e.com', NULL,
        'N', '1', NULL, NULL, '1', 1, '2020-05-29 16:41:21.126', 1, '2021-12-04 13:15:52.453', NULL, 12, '1', '0000');
INSERT INTO `sys_user`
VALUES (4, 'normal', '$2a$10$tr91uxFhn2emY7sXqLqzz.66xrXGgLkzxyREnRhgWcNbxmlgUXJU6', NULL, '13258465211', 'qq@ee.com',
        NULL, 'N', '1', NULL, NULL, '1', 1, '2020-05-12 10:22:11.393', 1, '2021-12-04 13:15:53.372', NULL, 24, '0',
        '0000');
INSERT INTO `sys_user`
VALUES (5, 'dddd', '$2a$10$hZ5daUd8k4LSOgmFuRlSZuEnYRndkGjMJ/wsl6UQ5.rlWFqNcmPSe', 'dd', '13258465214', '1@1.com', NULL,
        'N', '1', NULL, NULL, '1', 1, '2020-05-28 03:08:17.639', 1, '2021-12-04 13:15:54.490', NULL, 1, '1', '0000');
INSERT INTO `sys_user`
VALUES (6, 'dsafdf', '$2a$10$hZ5daUd8k4LSOgmFuRlSZuEnYRndkGjMJ/wsl6UQ5.rlWFqNcmPSe', NULL, '13258462101',
        '837158@qq.com', NULL, 'N', '1', NULL, NULL, '1', 1, '2019-07-07 14:32:17.000', 1, '2021-12-04 13:15:55.244',
        '11', 26, '1', '0000');
INSERT INTO `sys_user`
VALUES (7, 'test', '$2a$10$hZ5daUd8k4LSOgmFuRlSZuEnYRndkGjMJ/wsl6UQ5.rlWFqNcmPSe', NULL, '13258462222', 'ww@qq.com',
        NULL, 'N', '1', NULL, NULL, '1', 1, '2019-07-07 14:35:13.000', 1, '2021-12-04 13:15:55.937', NULL, 50, '1',
        '0000');
INSERT INTO `sys_user`
VALUES (8, 'ttt', '$2a$10$hZ5daUd8k4LSOgmFuRlSZuEnYRndkGjMJ/wsl6UQ5.rlWFqNcmPSe', NULL, '13254732131', '2113@ed.bom',
        NULL, 'N', '1', NULL, NULL, '1', 1, '2020-05-12 10:06:21.381', 1, '2021-12-04 13:15:56.571', NULL, 1, '1',
        '0000');
INSERT INTO `sys_user`
VALUES (9, 'test', '$2a$10$g74ZwJNgw52R/A6t7lQBzuMbBcBFzm.cKd7SqS5uNxkkecvN/MVte', NULL, '13265843021', '33@d.com',
        NULL, 'N', '1', NULL, NULL, '1', 1, '2021-12-02 20:03:08.829', 1, '2022-04-11 13:32:50.274', NULL, 3, '1',
        '0000');
INSERT INTO `sys_user`
VALUES (1467013500122431488, 'dddddd', '$2a$10$K0C0WyfF4owq6M1c.p4G6OzJkCY8vWCBRrFeSlGy.3b9YdKVEdX7.', NULL,
        '13258465001', '1@1x.com', NULL, 'W', '1', NULL, NULL, '1', 1, '2021-12-04 14:10:48.872', 1,
        '2021-12-04 14:10:48.879', NULL, 1, '0', '0000');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
  `user_id`     bigint(0) NOT NULL COMMENT '用户ID',
  `role_id`     bigint(0) NOT NULL COMMENT '角色ID',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (1, 1, '0000');
INSERT INTO `sys_user_role`
VALUES (2, 2, '0000');
INSERT INTO `sys_user_role`
VALUES (3, 2, '0000');
INSERT INTO `sys_user_role`
VALUES (4, 5, '0000');
INSERT INTO `sys_user_role`
VALUES (9, 5, '0000');
INSERT INTO `sys_user_role`
VALUES (1466377391856156672, 5, '0000');
INSERT INTO `sys_user_role`
VALUES (1467013500122431488, 5, '0000');

-- ----------------------------
-- Table structure for tool_alipay_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_alipay_config`;
CREATE TABLE `tool_alipay_config`
(
  `id`                      bigint(0) NOT NULL COMMENT 'ID',
  `app_id`                  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用ID',
  `charset`                 varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `format`                  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网关地址',
  `notify_url`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异步回调',
  `private_key`             text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '私钥',
  `public_key`              text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公钥',
  `return_url`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调地址',
  `sign_type`               varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户号',
  `tenant_code`             varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝配置类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tool_alipay_config
-- ----------------------------
INSERT INTO `tool_alipay_config`
VALUES (1, '2016091700532697', 'utf-8', 'JSON', 'https://openapi.alipaydev.com/gateway.do',
        'http://api.auauz.net/api/aliPay/notify',
        'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5js8sInU10AJ0cAQ8UMMyXrQ+oHZEkVt5lBwsStmTJ7YikVYgbskx1YYEXTojRsWCb+SH/kDmDU4pK/u91SJ4KFCRMF2411piYuXU/jF96zKrADznYh/zAraqT6hvAIVtQAlMHN53nx16rLzZ/8jDEkaSwT7+HvHiS+7sxSojnu/3oV7BtgISoUNstmSe8WpWHOaWv19xyS+Mce9MY4BfseFhzTICUymUQdd/8hXA28/H6osUfAgsnxAKv7Wil3aJSgaJczWuflYOve0dJ3InZkhw5Cvr0atwpk8YKBQjy5CdkoHqvkOcIB+cYHXJKzOE5tqU7inSwVbHzOLQ3XbnAgMBAAECggEAVJp5eT0Ixg1eYSqFs9568WdetUNCSUchNxDBu6wxAbhUgfRUGZuJnnAll63OCTGGck+EGkFh48JjRcBpGoeoHLL88QXlZZbC/iLrea6gcDIhuvfzzOffe1RcZtDFEj9hlotg8dQj1tS0gy9pN9g4+EBH7zeu+fyv+qb2e/v1l6FkISXUjpkD7RLQr3ykjiiEw9BpeKb7j5s7Kdx1NNIzhkcQKNqlk8JrTGDNInbDM6inZfwwIO2R1DHinwdfKWkvOTODTYa2MoAvVMFT9Bec9FbLpoWp7ogv1JMV9svgrcF9XLzANZ/OQvkbe9TV9GWYvIbxN6qwQioKCWO4GPnCAQKBgQDgW5MgfhX8yjXqoaUy/d1VjI8dHeIyw8d+OBAYwaxRSlCfyQ+tieWcR2HdTzPca0T0GkWcKZm0ei5xRURgxt4DUDLXNh26HG0qObbtLJdu/AuBUuCqgOiLqJ2f1uIbrz6OZUHns+bT/jGW2Ws8+C13zTCZkZt9CaQsrp3QOGDx5wKBgQDTul39hp3ZPwGNFeZdkGoUoViOSd5Lhowd5wYMGAEXWRLlU8z+smT5v0POz9JnIbCRchIY2FAPKRdVTICzmPk2EPJFxYTcwaNbVqL6lN7J2IlXXMiit5QbiLauo55w7plwV6LQmKm9KV7JsZs5XwqF7CEovI7GevFzyD3w+uizAQKBgC3LY1eRhOlpWOIAhpjG6qOoohmeXOphvdmMlfSHq6WYFqbWwmV4rS5d/6LNpNdL6fItXqIGd8I34jzql49taCmi+A2nlR/E559j0mvM20gjGDIYeZUz5MOE8k+K6/IcrhcgofgqZ2ZED1ksHdB/E8DNWCswZl16V1FrfvjeWSNnAoGAMrBplCrIW5xz+J0Hm9rZKrs+AkK5D4fUv8vxbK/KgxZ2KaUYbNm0xv39c+PZUYuFRCz1HDGdaSPDTE6WeWjkMQd5mS6ikl9hhpqFRkyh0d0fdGToO9yLftQKOGE/q3XUEktI1XvXF0xyPwNgUCnq0QkpHyGVZPtGFxwXiDvpvgECgYA5PoB+nY8iDiRaJNko9w0hL4AeKogwf+4TbCw+KWVEn6jhuJa4LFTdSqp89PktQaoVpwv92el/AhYjWOl/jVCm122f9b7GyoelbjMNolToDwe5pF5RnSpEuDdLy9MfE8LnE3PlbE7E5BipQ3UjSebkgNboLHH/lNZA5qvEtvbfvQ==',
        'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAut9evKRuHJ/2QNfDlLwvN/S8l9hRAgPbb0u61bm4AtzaTGsLeMtScetxTWJnVvAVpMS9luhEJjt+Sbk5TNLArsgzzwARgaTKOLMT1TvWAK5EbHyI+eSrc3s7Awe1VYGwcubRFWDm16eQLv0k7iqiw+4mweHSz/wWyvBJVgwLoQ02btVtAQErCfSJCOmt0Q/oJQjj08YNRV4EKzB19+f5A+HQVAKy72dSybTzAK+3FPtTtNen/+b5wGeat7c32dhYHnGorPkPeXLtsqqUTp1su5fMfd4lElNdZaoCI7osZxWWUo17vBCZnyeXc9fk0qwD9mK6yRAxNbrY72Xx5VqIqwIDAQAB',
        'http://api.auauz.net/api/aliPay/return', 'RSA2', '2088102176044281', '');

-- ----------------------------
-- Table structure for tool_email_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_email_config`;
CREATE TABLE `tool_email_config`
(
  `id`          bigint(0) NOT NULL COMMENT 'ID',
  `from_user`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `host`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `port`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口',
  `user`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件者用户名',
  `tenant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮箱配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tool_email_config
-- ----------------------------

SET
FOREIGN_KEY_CHECKS = 1;
