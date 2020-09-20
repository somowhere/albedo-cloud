/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : albedo-config

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 20/09/2020 17:38:31
*/
DROP DATABASE IF EXISTS `albedo-config`;

CREATE DATABASE  `albedo-config` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE `albedo-config`;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `src_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_schema` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` VALUES (9, 'albedo-auth-dev.yml', 'DEFAULT_GROUP', '# 数据源\r\nspring:\r\n  datasource:\r\n    type: com.zaxxer.hikari.HikariDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: 111111\r\n    url: jdbc:mysql://albedo-mysql:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\r\n  freemarker:\r\n    allow-request-override: false\r\n    allow-session-override: false\r\n    cache: true\r\n    charset: UTF-8\r\n    check-template-location: true\r\n    content-type: text/html\r\n    enabled: true\r\n    expose-request-attributes: false\r\n    expose-session-attributes: false\r\n    expose-spring-macro-helpers: true\r\n    prefer-file-system-access: true\r\n    suffix: .ftl\r\n    template-loader-path: classpath:/templates/\r\n\r\n', 'fcc5994d3dc19089c5d0ba88df894be3', '2019-12-13 17:53:57', '2020-06-25 17:39:04', NULL, '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (10, 'albedo-gateway-dev.yml', 'DEFAULT_GROUP', 'spring:\r\n  cloud:\r\n    gateway:\r\n      locator:\r\n        enabled: true\r\n      routes:\r\n        # 认证中心\r\n        - id: albedo-auth\r\n          uri: lb://albedo-auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n            # 验证码处理\r\n            - ValidateCodeGatewayFilter\r\n            # 前端密码解密\r\n            - PasswordDecoderFilter\r\n        #系统管理 模块\r\n        - id: albedo-sys\r\n          uri: lb://albedo-sys\r\n          predicates:\r\n            - Path=/sys/**\r\n          filters:\r\n            # 限流配置\r\n            - name: RequestRateLimiter\r\n              args:\r\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\r\n                redis-rate-limiter.replenishRate: 100\r\n                redis-rate-limiter.burstCapacity: 200\r\n        # 代码生成模块\r\n        - id: albedo-gen\r\n          uri: lb://albedo-gen\r\n          predicates:\r\n            - Path=/gen/**\r\n        # 任务调度模块\r\n        - id: albedo-quartz\r\n          uri: lb://albedo-quartz\r\n          predicates:\r\n            - Path=/quartz/**\r\nsecurity:\r\n  encode:\r\n    # 前端密码密钥，必须16位\r\n    key: \'somewhere-albedo\'\r\n\r\n# 不校验验证码终端\r\nignore:\r\n  clients:\r\n    - swagger\r\n', '1c5d703b01b81bdbbae69612c815084e', '2019-12-13 17:54:26', '2020-06-25 17:41:41', NULL, '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (11, 'albedo-gen-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(FGKBtFgGcI+XAg5c+7EAJg==)\r\n      client-secret: ENC(PE5+ODGIk7rfbiaZXHVhow==)\r\n      scope: server\r\n\r\n# 数据源配置\r\nspring:\r\n  datasource:\r\n    type: com.zaxxer.hikari.HikariDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: 111111\r\n    url: jdbc:mysql://albedo-mysql:3306/albedo-gen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\r\n  resources:\r\n    static-locations: classpath:/static/,classpath:/views/\r\n\r\n# 直接放行URL\r\nignore:\r\n  urls:\r\n    - /v2/**\r\n    - /actuator/**\r\n', '4f97f24b4ef687b9843d4ddb7c8cd99f', '2019-12-13 17:54:43', '2020-09-19 16:09:19', NULL, '127.0.0.1', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (12, 'albedo-monitor-dev.yml', 'DEFAULT_GROUP', 'spring:\r\n  # 安全配置\r\n  security:\r\n    user:\r\n      name: ENC(ToJTk3p6JF+h0gsHeHVRoQ==)     # albedo\r\n      password: ENC(sGfB6KY7Zq0BTfwbWYxnWw==) # albedo\r\n', 'c9e2b0633b44d33b37beb14a7f3dc501', '2019-12-13 17:54:58', '2019-12-13 17:54:58', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (13, 'albedo-quartz-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(FGKBtFgGcI+XAg5c+7EAJg==)\r\n      client-secret: ENC(PE5+ODGIk7rfbiaZXHVhow==)\r\n      scope: server\r\n\r\n# 数据源配置\r\nspring:\r\n  datasource:\r\n    type: com.zaxxer.hikari.HikariDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: 111111\r\n    url: jdbc:mysql://albedo-mysql:3306/albedo-quartz?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\r\n  resources:\r\n    static-locations: classpath:/static/,classpath:/views/\r\n\r\n# 直接放行URL\r\nignore:\r\n  urls:\r\n    - /v2/**\r\n    - /actuator/**\r\n', 'd8b6a9f5ffc3aa17773d453d307ea73f', '2019-12-13 17:55:19', '2020-09-19 16:09:34', NULL, '127.0.0.1', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (14, 'albedo-sys-dev.yml', 'DEFAULT_GROUP', 'dubbo:\r\n  cloud:\r\n    # The subscribed services in consumer side\r\n    subscribed-services: albedo-auth\r\n# 直接放行URL\r\nignore:\r\n  urls:\r\n    - /v2/**\r\n    - /actuator/**\r\n    - /user/info/*\r\n    - /menu/gen\r\n    - /dict/all\r\n    - /log-operate/**\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(WJRDLZlPlWkmLu/d+gkeAw==)\r\n      client-secret: ENC(gyOtaeY+fxP8/Rkd3PKm8Q==)\r\n      scope: server\r\n\r\n# 数据源\r\nspring:\r\n  datasource:\r\n    type: com.zaxxer.hikari.HikariDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: 111111\r\n    url: jdbc:mysql://albedo-mysql:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true\r\n\r\n\r\n\r\n', '5163a8104fe0326a3b11f5c24200064e', '2019-12-13 17:56:02', '2020-06-02 09:31:32', NULL, '127.0.0.1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (15, 'albedo-sys-prod.yml', 'DEFAULT_GROUP', 'dubbo:\r\n  cloud:\r\n    # The subscribed services in consumer side\r\n    subscribed-services: albedo-auth\r\n# 直接放行URL\r\nignore:\r\n  urls:\r\n    - /v2/**\r\n    - /actuator/**\r\n    - /user/info/*\r\n    - /menu/gen\r\n    - /dict/all\r\n    - /log-operate/**\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(WJRDLZlPlWkmLu/d+gkeAw==)\r\n      client-secret: ENC(gyOtaeY+fxP8/Rkd3PKm8Q==)\r\n      scope: server\r\n\r\n# 数据源\r\nspring:\r\n  datasource:\r\n    type: com.zaxxer.hikari.HikariDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: 111111\r\n    url: jdbc:mysql://albedo-mysql:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true\r\n\r\n\r\n\r\n', '5163a8104fe0326a3b11f5c24200064e', '2019-12-13 17:56:30', '2020-09-20 16:47:59', NULL, '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (16, 'application-dev.yml', 'DEFAULT_GROUP', '# 加解密根密码\njasypt:\n  encryptor:\n    password: albedo #根密码\n\n\ndubbo:\n  scan:\n    base-packages: com.albedo.java.*\n  protocols:\n    dubbo:\n      name: dubbo\n      port: -1\n  registry:\n    #   The Spring Cloud Dubbo\'s registry extension\n    ##  the default value of dubbo-provider-services is \"*\", that means to subscribe all providers,\n    ##  thus it\'s optimized if subscriber specifies the required providers.\n    address: spring-cloud://localhost\n  cloud:\n    # The subscribed services in consumer side\n    subscribed-services: albedo-sys\n\n# Spring 相关\nspring:\n  redis:\n    password:\n    host: albedo-redis\n  cloud:\n    sentinel:\n      eager: true\n      transport:\n        dashboard: albedo-sentinel:8858\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: always\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n      useGzipDecoder: true\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: UUID\n      field-strategy: NOT_NULL\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n\n# spring security 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://albedo-auth/oauth/check_token\n    # 通用放行URL，服务个性化，请在对应配置文件覆盖\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n\n# ===================================================================\n# Albedo specific properties\n# ===================================================================\n\napplication:\n  developMode: true\n  address-enabled: true\n  logPath: logs\n  static-file-directory:\n    mac: ~/albedo-file\n    linux: /home/albedo/file/\n    win: C:\\albedo\\file\\\n#密码加密传输，前端公钥加密，后端私钥解密\n  rsa:\n    public-key: MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAN4UOrkIuLpL0o7WItgIUkP/RFBsurMPQ7fTaOKwT+S9tWly0xMmJzSl9Kdh8MpWcyz+5nUSb7SgGWxiE3qIL2sCAwEAAQ==\n    private-key: MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEA3hQ6uQi4ukvSjtYi2AhSQ/9EUGy6sw9Dt9No4rBP5L21aXLTEyYnNKX0p2HwylZzLP7mdRJvtKAZbGITeogvawIDAQABAkBnojsRE//Yd/+nRkh2VdPGBX5kpYiufKYWR6K/fpWZ4QrASv5sIuD2Cqfp5e8K6fZ4DW/CSUMKGq6Vq6xZVeLJAiEA/BazblQTEeGFsQydEmaBA1CWupPOAFO2xg7c/5s1sI8CIQDhhlRtXfjqcUWhj4Um1t8pFBkFHiN8RC1hufaZs9OJZQIgEuLogoWOADLzPzaAthYz6DmrcUMNlfyvntsSN5w7Q4UCIQCu7raAWvsgRxqe1iePV+6j+33o1VbrJisZedkJok48bQIgWVX940QICkAUhYRJgX9uj7oWOAyE1V8ambte6SHBHhs=\n  cors: #By default CORS are not enabled. Uncomment to enable.\n    allowed-origins: \"*\"\n    allowed-methods: \"*\"\n    allowed-headers: \"*\"\n    exposed-headers: \"Authorization,Link,X-Total-Count\"\n    allow-credentials: true\n    max-age: 1800\n  swagger:\n    title: Albedo Swagger API\n    license: Powered By somewhere\n    licenseUrl: https://github.com/somowhere\n    terms-of-service-url: https://github.com/somowhere\n    contact:\n      email: somewhere0813@gmail.com\n      url: https://github.com/somowhere\n    authorization:\n      name: Albedo OAuth\n      auth-regex: ^.*$\n      authorization-scope-list:\n        - scope: server\n          description: server all\n      token-url-list:\n        - http://${GATEWAY_HOST:albedo-gateway}:${GATEWAY-PORT:9999}/auth/oauth/token', 'ec4f549443841da54e5faaf9799765f0', '2019-12-14 10:14:03', '2020-07-06 21:43:28', NULL, '0:0:0:0:0:0:0:1', '', '', '通用配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (37, 'application-prod.yml', 'DEFAULT_GROUP', '# 加解密根密码\njasypt:\n  encryptor:\n    password: albedo #根密码\n\n\ndubbo:\n  scan:\n    base-packages: com.albedo.java.*\n  protocols:\n    dubbo:\n      name: dubbo\n      port: -1\n  registry:\n    #   The Spring Cloud Dubbo\'s registry extension\n    ##  the default value of dubbo-provider-services is \"*\", that means to subscribe all providers,\n    ##  thus it\'s optimized if subscriber specifies the required providers.\n    address: spring-cloud://localhost\n  cloud:\n    # The subscribed services in consumer side\n    subscribed-services: albedo-sys\n\n# Spring 相关\nspring:\n  redis:\n    password:\n    host: albedo-redis\n  cloud:\n    sentinel:\n      eager: true\n      transport:\n        dashboard: albedo-sentinel:8858\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: always\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n      useGzipDecoder: true\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: UUID\n      field-strategy: NOT_NULL\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n\n# spring security 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://albedo-auth/oauth/check_token\n    # 通用放行URL，服务个性化，请在对应配置文件覆盖\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n\n# ===================================================================\n# Albedo specific properties\n# ===================================================================\n\napplication:\n  developMode: true\n  address-enabled: true\n  logPath: logs\n  static-file-directory:\n    mac: ~/albedo-file\n    linux: /home/albedo/file/\n    win: C:\\albedo\\file\\\n#密码加密传输，前端公钥加密，后端私钥解密\n  rsa:\n    public-key: MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAN4UOrkIuLpL0o7WItgIUkP/RFBsurMPQ7fTaOKwT+S9tWly0xMmJzSl9Kdh8MpWcyz+5nUSb7SgGWxiE3qIL2sCAwEAAQ==\n    private-key: MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEA3hQ6uQi4ukvSjtYi2AhSQ/9EUGy6sw9Dt9No4rBP5L21aXLTEyYnNKX0p2HwylZzLP7mdRJvtKAZbGITeogvawIDAQABAkBnojsRE//Yd/+nRkh2VdPGBX5kpYiufKYWR6K/fpWZ4QrASv5sIuD2Cqfp5e8K6fZ4DW/CSUMKGq6Vq6xZVeLJAiEA/BazblQTEeGFsQydEmaBA1CWupPOAFO2xg7c/5s1sI8CIQDhhlRtXfjqcUWhj4Um1t8pFBkFHiN8RC1hufaZs9OJZQIgEuLogoWOADLzPzaAthYz6DmrcUMNlfyvntsSN5w7Q4UCIQCu7raAWvsgRxqe1iePV+6j+33o1VbrJisZedkJok48bQIgWVX940QICkAUhYRJgX9uj7oWOAyE1V8ambte6SHBHhs=\n  cors: #By default CORS are not enabled. Uncomment to enable.\n    allowed-origins: \"*\"\n    allowed-methods: \"*\"\n    allowed-headers: \"*\"\n    exposed-headers: \"Authorization,Link,X-Total-Count\"\n    allow-credentials: true\n    max-age: 1800\n  swagger:\n    title: Albedo Swagger API\n    license: Powered By somewhere\n    licenseUrl: https://github.com/somowhere\n    terms-of-service-url: https://github.com/somowhere\n    contact:\n      email: somewhere0813@gmail.com\n      url: https://github.com/somowhere\n    authorization:\n      name: Albedo OAuth\n      auth-regex: ^.*$\n      authorization-scope-list:\n        - scope: server\n          description: server all\n      token-url-list:\n        - http://${GATEWAY_HOST:albedo-gateway}:${GATEWAY-PORT:9999}/auth/oauth/token', 'ec4f549443841da54e5faaf9799765f0', '2020-09-20 16:51:14', '2020-09-20 16:51:28', NULL, '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (39, 'albedo-auth-prod.yml', 'DEFAULT_GROUP', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 111111\n    url: jdbc:mysql://albedo-mysql:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/\n\n', '82adeaf4a15157972cf63e6c558f92d9', '2020-09-20 16:52:24', '2020-09-20 16:52:24', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (40, 'albedo-gateway-prod.yml', 'DEFAULT_GROUP', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: albedo-auth\n          uri: lb://albedo-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n        #系统管理 模块\n        - id: albedo-sys\n          uri: lb://albedo-sys\n          predicates:\n            - Path=/sys/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: albedo-gen\n          uri: lb://albedo-gen\n          predicates:\n            - Path=/gen/**\n        # 任务调度模块\n        - id: albedo-quartz\n          uri: lb://albedo-quartz\n          predicates:\n            - Path=/quartz/**\nsecurity:\n  encode:\n    # 前端密码密钥，必须16位\n    key: \'somewhere-albedo\'\n\n# 不校验验证码终端\nignore:\n  clients:\n    - swagger\n', '8f3e8ad92dab858c350e3f303a9440b7', '2020-09-20 16:52:59', '2020-09-20 16:52:59', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (41, 'albedo-gen-prod.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(FGKBtFgGcI+XAg5c+7EAJg==)\n      client-secret: ENC(PE5+ODGIk7rfbiaZXHVhow==)\n      scope: server\n\n# 数据源配置\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 111111\n    url: jdbc:mysql://albedo-mysql:3306/albedo-gen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\n# 直接放行URL\nignore:\n  urls:\n    - /v2/**\n    - /actuator/**\n', 'b49dd307c4edfe2a4d9c3b8ffde52f1f', '2020-09-20 16:53:22', '2020-09-20 16:53:22', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (42, 'albedo-monitor-prod.yml', 'DEFAULT_GROUP', 'spring:\n  # 安全配置\n  security:\n    user:\n      name: ENC(ToJTk3p6JF+h0gsHeHVRoQ==)     # albedo\n      password: ENC(sGfB6KY7Zq0BTfwbWYxnWw==) # albedo\n', 'a71b77b1b47f810aed0dc5756faeacb6', '2020-09-20 16:53:49', '2020-09-20 16:53:49', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (43, 'albedo-quartz-prod.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(FGKBtFgGcI+XAg5c+7EAJg==)\n      client-secret: ENC(PE5+ODGIk7rfbiaZXHVhow==)\n      scope: server\n\n# 数据源配置\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 111111\n    url: jdbc:mysql://albedo-mysql:3306/albedo-quartz?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\n# 直接放行URL\nignore:\n  urls:\n    - /v2/**\n    - /actuator/**\n', 'afd441522fe4ef46f4bf4935eb3b08ac', '2020-09-20 16:54:17', '2020-09-20 16:54:17', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'yaml', NULL);
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `datum_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='增加租户字段';

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `src_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='config_info_beta';

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tag_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `src_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='config_info_tag';

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tag_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='config_tag_relation';

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Records of group_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `src_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  KEY `idx_gmt_create` (`gmt_create`) USING BTREE,
  KEY `idx_gmt_modified` (`gmt_modified`) USING BTREE,
  KEY `idx_did` (`data_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` VALUES (11, 23, 'albedo-gen-dev.yml', 'DEFAULT_GROUP', '', '## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(FGKBtFgGcI+XAg5c+7EAJg==)\r\n      client-secret: ENC(PE5+ODGIk7rfbiaZXHVhow==)\r\n      scope: server\r\n\r\n# 数据源配置\r\nspring:\r\n  datasource:\r\n    type: com.zaxxer.hikari.HikariDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: 111111\r\n    url: jdbc:mysql://albedo-mysql:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\r\n  resources:\r\n    static-locations: classpath:/static/,classpath:/views/\r\n\r\n# 直接放行URL\r\nignore:\r\n  urls:\r\n    - /v2/**\r\n    - /actuator/**\r\n', '4f8316a85099f352cf83565175fa20ac', '2010-05-05 00:00:00', '2020-09-19 16:09:19', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (13, 24, 'albedo-quartz-dev.yml', 'DEFAULT_GROUP', '', '## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(FGKBtFgGcI+XAg5c+7EAJg==)\r\n      client-secret: ENC(PE5+ODGIk7rfbiaZXHVhow==)\r\n      scope: server\r\n\r\n# 数据源配置\r\nspring:\r\n  datasource:\r\n    type: com.zaxxer.hikari.HikariDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: 111111\r\n    url: jdbc:mysql://albedo-mysql:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\r\n  resources:\r\n    static-locations: classpath:/static/,classpath:/views/\r\n\r\n# 直接放行URL\r\nignore:\r\n  urls:\r\n    - /v2/**\r\n    - /actuator/**\r\n', '4f8316a85099f352cf83565175fa20ac', '2010-05-05 00:00:00', '2020-09-19 16:09:34', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 25, 'albedo-xxl-job-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: root\n      password: 111111\n      url: jdbc:mysql://albedo-mysql:3306/albedo-job?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n\nxxl:\n  job:\n    admin:\n      addresses: http://albedo-xxl-job-admin:8080/xxl-job-admin', 'ba2c626955975a7b69c06380fe618a5d', '2010-05-05 00:00:00', '2020-09-19 16:36:36', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (15, 26, 'albedo-sys-prod.yml', 'DEFAULT_GROUP', '', 'dubbo:\r\n  cloud:\r\n    # The subscribed services in consumer side\r\n    subscribed-services: albedo-auth\r\n# 直接放行URL\r\nignore:\r\n  urls:\r\n    - /v2/**\r\n    - /actuator/**\r\n    - /user/info/*\r\n    - /menu/gen\r\n    - /dict/all\r\n    - /log-operate/**\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(WJRDLZlPlWkmLu/d+gkeAw==)\r\n      client-secret: ENC(gyOtaeY+fxP8/Rkd3PKm8Q==)\r\n      scope: server\r\n\r\n# 数据源\r\nspring:\r\n  datasource:\r\n    type: com.zaxxer.hikari.HikariDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: 111111\r\n    url: jdbc:mysql://albedo-mysql:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\r\n\r\n\r\n\r\n', '85624bf00c4775d3ea3e89ba8f7712fa', '2010-05-05 00:00:00', '2020-09-20 16:47:59', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 27, 'application-prod', 'DEFAULT_GROUP', '', '# 加解密根密码\njasypt:\n  encryptor:\n    password: albedo #根密码\n\n\ndubbo:\n  scan:\n    base-packages: com.albedo.java.*\n  protocols:\n    dubbo:\n      name: dubbo\n      port: -1\n  registry:\n    #   The Spring Cloud Dubbo\'s registry extension\n    ##  the default value of dubbo-provider-services is \"*\", that means to subscribe all providers,\n    ##  thus it\'s optimized if subscriber specifies the required providers.\n    address: spring-cloud://localhost\n  cloud:\n    # The subscribed services in consumer side\n    subscribed-services: albedo-sys\n\n# Spring 相关\nspring:\n  redis:\n    password:\n    host: albedo-redis\n  cloud:\n    sentinel:\n      eager: true\n      transport:\n        dashboard: albedo-sentinel:8858\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: always\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n      useGzipDecoder: true\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: UUID\n      field-strategy: NOT_NULL\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n\n# spring security 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://albedo-auth/oauth/check_token\n    # 通用放行URL，服务个性化，请在对应配置文件覆盖\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n\n# ===================================================================\n# Albedo specific properties\n# ===================================================================\n\napplication:\n  developMode: true\n  address-enabled: true\n  logPath: logs\n  static-file-directory:\n    mac: ~/albedo-file\n    linux: /home/albedo/file/\n    win: C:\\albedo\\file\\\n#密码加密传输，前端公钥加密，后端私钥解密\n  rsa:\n    public-key: MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAN4UOrkIuLpL0o7WItgIUkP/RFBsurMPQ7fTaOKwT+S9tWly0xMmJzSl9Kdh8MpWcyz+5nUSb7SgGWxiE3qIL2sCAwEAAQ==\n    private-key: MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEA3hQ6uQi4ukvSjtYi2AhSQ/9EUGy6sw9Dt9No4rBP5L21aXLTEyYnNKX0p2HwylZzLP7mdRJvtKAZbGITeogvawIDAQABAkBnojsRE//Yd/+nRkh2VdPGBX5kpYiufKYWR6K/fpWZ4QrASv5sIuD2Cqfp5e8K6fZ4DW/CSUMKGq6Vq6xZVeLJAiEA/BazblQTEeGFsQydEmaBA1CWupPOAFO2xg7c/5s1sI8CIQDhhlRtXfjqcUWhj4Um1t8pFBkFHiN8RC1hufaZs9OJZQIgEuLogoWOADLzPzaAthYz6DmrcUMNlfyvntsSN5w7Q4UCIQCu7raAWvsgRxqe1iePV+6j+33o1VbrJisZedkJok48bQIgWVX940QICkAUhYRJgX9uj7oWOAyE1V8ambte6SHBHhs=\n  cors: #By default CORS are not enabled. Uncomment to enable.\n    allowed-origins: \"*\"\n    allowed-methods: \"*\"\n    allowed-headers: \"*\"\n    exposed-headers: \"Authorization,Link,X-Total-Count\"\n    allow-credentials: true\n    max-age: 1800\n  swagger:\n    title: Albedo Swagger API\n    license: Powered By somewhere\n    licenseUrl: https://github.com/somowhere\n    terms-of-service-url: https://github.com/somowhere\n    contact:\n      email: somewhere0813@gmail.com\n      url: https://github.com/somowhere\n    authorization:\n      name: Albedo OAuth\n      auth-regex: ^.*$\n      authorization-scope-list:\n        - scope: server\n          description: server all\n      token-url-list:\n        - http://${GATEWAY_HOST:albedo-gateway}:${GATEWAY-PORT:9999}/auth/oauth/token', 'ec4f549443841da54e5faaf9799765f0', '2010-05-05 00:00:00', '2020-09-20 16:50:02', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (36, 28, 'application-prod', 'DEFAULT_GROUP', '', '# 加解密根密码\njasypt:\n  encryptor:\n    password: albedo #根密码\n\n\ndubbo:\n  scan:\n    base-packages: com.albedo.java.*\n  protocols:\n    dubbo:\n      name: dubbo\n      port: -1\n  registry:\n    #   The Spring Cloud Dubbo\'s registry extension\n    ##  the default value of dubbo-provider-services is \"*\", that means to subscribe all providers,\n    ##  thus it\'s optimized if subscriber specifies the required providers.\n    address: spring-cloud://localhost\n  cloud:\n    # The subscribed services in consumer side\n    subscribed-services: albedo-sys\n\n# Spring 相关\nspring:\n  redis:\n    password:\n    host: albedo-redis\n  cloud:\n    sentinel:\n      eager: true\n      transport:\n        dashboard: albedo-sentinel:8858\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: always\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n      useGzipDecoder: true\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: UUID\n      field-strategy: NOT_NULL\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n\n# spring security 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://albedo-auth/oauth/check_token\n    # 通用放行URL，服务个性化，请在对应配置文件覆盖\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n\n# ===================================================================\n# Albedo specific properties\n# ===================================================================\n\napplication:\n  developMode: true\n  address-enabled: true\n  logPath: logs\n  static-file-directory:\n    mac: ~/albedo-file\n    linux: /home/albedo/file/\n    win: C:\\albedo\\file\\\n#密码加密传输，前端公钥加密，后端私钥解密\n  rsa:\n    public-key: MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAN4UOrkIuLpL0o7WItgIUkP/RFBsurMPQ7fTaOKwT+S9tWly0xMmJzSl9Kdh8MpWcyz+5nUSb7SgGWxiE3qIL2sCAwEAAQ==\n    private-key: MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEA3hQ6uQi4ukvSjtYi2AhSQ/9EUGy6sw9Dt9No4rBP5L21aXLTEyYnNKX0p2HwylZzLP7mdRJvtKAZbGITeogvawIDAQABAkBnojsRE//Yd/+nRkh2VdPGBX5kpYiufKYWR6K/fpWZ4QrASv5sIuD2Cqfp5e8K6fZ4DW/CSUMKGq6Vq6xZVeLJAiEA/BazblQTEeGFsQydEmaBA1CWupPOAFO2xg7c/5s1sI8CIQDhhlRtXfjqcUWhj4Um1t8pFBkFHiN8RC1hufaZs9OJZQIgEuLogoWOADLzPzaAthYz6DmrcUMNlfyvntsSN5w7Q4UCIQCu7raAWvsgRxqe1iePV+6j+33o1VbrJisZedkJok48bQIgWVX940QICkAUhYRJgX9uj7oWOAyE1V8ambte6SHBHhs=\n  cors: #By default CORS are not enabled. Uncomment to enable.\n    allowed-origins: \"*\"\n    allowed-methods: \"*\"\n    allowed-headers: \"*\"\n    exposed-headers: \"Authorization,Link,X-Total-Count\"\n    allow-credentials: true\n    max-age: 1800\n  swagger:\n    title: Albedo Swagger API\n    license: Powered By somewhere\n    licenseUrl: https://github.com/somowhere\n    terms-of-service-url: https://github.com/somowhere\n    contact:\n      email: somewhere0813@gmail.com\n      url: https://github.com/somowhere\n    authorization:\n      name: Albedo OAuth\n      auth-regex: ^.*$\n      authorization-scope-list:\n        - scope: server\n          description: server all\n      token-url-list:\n        - http://${GATEWAY_HOST:albedo-gateway}:${GATEWAY-PORT:9999}/auth/oauth/token', 'ec4f549443841da54e5faaf9799765f0', '2010-05-05 00:00:00', '2020-09-20 16:50:46', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 29, 'application-prod.yml', 'DEFAULT_GROUP', '', 's', '03c7c0ace395d80182db07ae2c30f034', '2010-05-05 00:00:00', '2020-09-20 16:51:14', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (37, 30, 'application-prod.yml', 'DEFAULT_GROUP', '', 's', '03c7c0ace395d80182db07ae2c30f034', '2010-05-05 00:00:00', '2020-09-20 16:51:28', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 31, 'albedo-auth-prod.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 111111\n    url: jdbc:mysql://albedo-mysql:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/\n\n', '82adeaf4a15157972cf63e6c558f92d9', '2010-05-05 00:00:00', '2020-09-20 16:52:24', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 32, 'albedo-gateway-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: albedo-auth\n          uri: lb://albedo-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n        #系统管理 模块\n        - id: albedo-sys\n          uri: lb://albedo-sys\n          predicates:\n            - Path=/sys/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: albedo-gen\n          uri: lb://albedo-gen\n          predicates:\n            - Path=/gen/**\n        # 任务调度模块\n        - id: albedo-quartz\n          uri: lb://albedo-quartz\n          predicates:\n            - Path=/quartz/**\nsecurity:\n  encode:\n    # 前端密码密钥，必须16位\n    key: \'somewhere-albedo\'\n\n# 不校验验证码终端\nignore:\n  clients:\n    - swagger\n', '8f3e8ad92dab858c350e3f303a9440b7', '2010-05-05 00:00:00', '2020-09-20 16:52:59', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 33, 'albedo-gen-prod.yml', 'DEFAULT_GROUP', '', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(FGKBtFgGcI+XAg5c+7EAJg==)\n      client-secret: ENC(PE5+ODGIk7rfbiaZXHVhow==)\n      scope: server\n\n# 数据源配置\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 111111\n    url: jdbc:mysql://albedo-mysql:3306/albedo-gen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\n# 直接放行URL\nignore:\n  urls:\n    - /v2/**\n    - /actuator/**\n', 'b49dd307c4edfe2a4d9c3b8ffde52f1f', '2010-05-05 00:00:00', '2020-09-20 16:53:22', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 34, 'albedo-monitor-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  # 安全配置\n  security:\n    user:\n      name: ENC(ToJTk3p6JF+h0gsHeHVRoQ==)     # albedo\n      password: ENC(sGfB6KY7Zq0BTfwbWYxnWw==) # albedo\n', 'a71b77b1b47f810aed0dc5756faeacb6', '2010-05-05 00:00:00', '2020-09-20 16:53:49', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 35, 'albedo-quartz-prod.yml', 'DEFAULT_GROUP', '', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(FGKBtFgGcI+XAg5c+7EAJg==)\n      client-secret: ENC(PE5+ODGIk7rfbiaZXHVhow==)\n      scope: server\n\n# 数据源配置\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 111111\n    url: jdbc:mysql://albedo-mysql:3306/albedo-quartz?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\n# 直接放行URL\nignore:\n  urls:\n    - /v2/**\n    - /actuator/**\n', 'afd441522fe4ef46f4bf4935eb3b08ac', '2010-05-05 00:00:00', '2020-09-20 16:54:17', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 36, 'albedo-xxl-job-prod.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: root\n      password: 111111\n      url: jdbc:mysql://albedo-mysql:3306/albedo-job?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n\nxxl:\n  job:\n    admin:\n      addresses: http://albedo-xxl-job-admin:8080/xxl-job-admin', 'ba2c626955975a7b69c06380fe618a5d', '2010-05-05 00:00:00', '2020-09-20 16:54:40', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (34, 37, 'albedo-xxl-job-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: root\n      password: 111111\n      url: jdbc:mysql://albedo-mysql:3306/albedo-job?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n\nxxl:\n  job:\n    admin:\n      addresses: http://albedo-xxl-job-admin:8080/xxl-job-admin', 'ba2c626955975a7b69c06380fe618a5d', '2010-05-05 00:00:00', '2020-09-20 16:55:26', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 38, 'albedo-job-prod.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: root\n      password: 111111\n      url: jdbc:mysql://albedo-mysql:3306/albedo-job?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n\nxxl:\n  job:\n    admin:\n      addresses: http://albedo-job:8080/xxl-job-admin', '1185e76f57836485250d7dcc23a1e7a5', '2010-05-05 00:00:00', '2020-09-20 16:56:06', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 39, 'albedo-job-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: root\n      password: 111111\n      url: jdbc:mysql://albedo-mysql:3306/albedo-job?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n\nxxl:\n  job:\n    admin:\n      addresses: http://albedo-job:8080/xxl-job-admin', '1185e76f57836485250d7dcc23a1e7a5', '2010-05-05 00:00:00', '2020-09-20 16:56:23', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (34, 40, 'albedo-xxl-job-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: root\n      password: 111111\n      url: jdbc:mysql://albedo-mysql:3306/albedo-job?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n\nxxl:\n  job:\n    admin:\n      addresses: http://albedo-job:8080/xxl-job-admin', '1185e76f57836485250d7dcc23a1e7a5', '2010-05-05 00:00:00', '2020-09-20 16:56:31', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (44, 41, 'albedo-xxl-job-prod.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: root\n      password: 111111\n      url: jdbc:mysql://albedo-mysql:3306/albedo-job?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n\nxxl:\n  job:\n    admin:\n      addresses: http://albedo-xxl-job-admin:8080/xxl-job-admin', 'ba2c626955975a7b69c06380fe618a5d', '2010-05-05 00:00:00', '2020-09-20 16:56:36', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (46, 42, 'albedo-job-prod.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: root\n      password: 111111\n      url: jdbc:mysql://albedo-mysql:3306/albedo-job?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n\nxxl:\n  job:\n    admin:\n      addresses: http://albedo-job:8080/xxl-job-admin', '1185e76f57836485250d7dcc23a1e7a5', '2010-05-05 00:00:00', '2020-09-20 17:04:03', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (47, 43, 'albedo-job-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: root\n      password: 111111\n      url: jdbc:mysql://albedo-mysql:3306/albedo-job?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n\nxxl:\n  job:\n    admin:\n      addresses: http://albedo-job:8080/xxl-job-admin', '1185e76f57836485250d7dcc23a1e7a5', '2010-05-05 00:00:00', '2020-09-20 17:04:03', NULL, '0:0:0:0:0:0:0:1', 'D', '');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='租户容量信息表';

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tenant_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tenant_desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_source` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('nacos', '$2a$10$1fXDf9q5CKAA.Fe4rjTzzONGDI4cXFvMfPx9Yribr9OQC2.JDe/wK', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
