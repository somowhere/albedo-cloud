/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : albedo-config

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 11/04/2022 14:03:03
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`
(
  `id`           bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create`   datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user`     mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `src_ip`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_name`     varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `c_desc`       varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `c_use`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `effect`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `c_schema`     mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info`
VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP',
        '# 加解密根密码\njasypt:\n  encryptor:\n    password: albedo #根密码\n\nlogging:\n  config: classpath:logback-spring.xml\n  level:\n    ROOT: INFO\n    com.albedo.java: DEBUG\n    com.albedo.java.plugins.database.interceptor.TenantLineInnerInterceptor: INFO\n# Spring 相关\nspring:\n  redis:\n    host: albedo-redis\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: ${application.mysql.driverClassName}\n    username: ${application.mysql.username}\n    password: ${application.mysql.password}\n    url: ${application.mysql.url}\n    dynamic:\n      p6spy: ${application.database.p6spy}\n      seata: ${application.database.isSeata}\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n  cloud:\n    sentinel:\n      filter:\n        enabled: false\n      eager: true\n      transport:\n        dashboard: albedo-sentinel:8858\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \' *\'\n  endpoint:\n    health:\n      show-details: always\n  logfile:\n    enabled: true\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n      useGzipDecoder: true\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath*:/mapper/*/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: input\n      insert-strategy: NOT_NULL\n      update-strategy: NOT_NULL\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n    default-enum-type-handler: com.albedo.java.plugins.database.mybatis.typehandler.CustomEnumTypeHandler\n\n# spring security 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://albedo-auth/oauth/check_token\n    # 通用放行URL，服务个性化，请在对应配置文件覆盖\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n\n# ===================================================================\n# Albedo specific properties\n# ===================================================================\n\napplication:\n  developMode: true\n  logPath: logs\n  rabbitmq:\n    enabled: false\n    ip: albedo-mysql\n    port: 5672\n    username: albedo\n    password: albedo\n  mysql:\n    ip: albedo-mysql\n    port: 3306\n    driverClassName: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 111111\n  database:\n    tenantDatabasePrefix: albedo-cloud-base\n    multiTenantType: DATASOURCE_COLUMN\n    tenantIdColumn: tenant_code\n    ignore-tables:\n      - sys_tenant\n    ignore-mapper-ids:\n      - com.albedo.java.modules.gen.repository.TableRepository.findTableList\n      - com.albedo.java.modules.gen.repository.TableRepository.findTableColumnList\n      - com.albedo.java.modules.gen.repository.TableRepository.findTablePk\n    isNotWrite: false\n    p6spy: true\n    isBlockAttack: false  # 是否启用 攻击 SQL 阻断解析器\n    isSeata: false\n    id-type: HU_TOOL\n    hutoolId:\n      workerId: 0\n      dataCenterId: 0\n    cache-id:\n      time-bits: 31\n      worker-bits: 22\n      seq-bits: 10\n      epochStr: \'2020 -
        09 - 15\'\n      boost-power: 3\n      padding-factor: 50\n  file:\n    storageType: LOCAL #  FAST_DFS LOCAL MIN_IO ALI_OSS HUAWEI_OSS QINIU_OSS\n    delFile: false\n    local:\n      storage-path: D:\\\\data\\\\projects\\\\uploadfile\\\\file\\\\     # 文件存储路径 ~/data/projects/uploadfile/file/  （ 某些版本的 window 需要改成  D:\\\\data\\\\projects\\\\uploadfile\\\\file\\\\  ）\n      endpoint: http://127.0.0.1/file/   # 文件访问 （部署nginx后，配置nginx的ip，并配置nginx静态代理storage-path地址的静态资源）\n      inner-uri-prefix: null  #  内网的url前缀\n    ali:\n      # 请填写自己的阿里云存储配置\n      uriPrefix: \"http://albedo-admin-cloud.oss-cn-beijing.aliyuncs.com/\"\n      bucket-name: \"albedo-admin-cloud\"\n      endpoint: \"oss-cn-beijing.aliyuncs.com\"\n      access-key-id: \"填写你的id\"\n      access-key-secret: \"填写你的秘钥\"\n    minIo:\n      endpoint: \"http://127.0.0.1:9000/\"\n      accessKey: \"aledo\"\n      secretKey: \"aledo\"\n      bucket: \"dev\"\n    huawei:\n      uriPrefix: \"dev.obs.cn-southwest-2.myhuaweicloud.com\"\n      endpoint: \"obs.cn-southwest-2.myhuaweicloud.com\"\n      accessKey: \"1\"\n      secretKey: \"2\"\n      location: \"cn-southwest-2\"\n      bucket: \"dev\"\n    qiNiu:\n      zone: \"z0\"\n      accessKey: \"1\"\n      secretKey: \"2\"\n      bucket: \"albedo_admin\"\n#密码加密传输，前端公钥加密，后端私钥解密\n  rsa:\n    public-key: MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAN4UOrkIuLpL0o7WItgIUkP/RFBsurMPQ7fTaOKwT+S9tWly0xMmJzSl9Kdh8MpWcyz+5nUSb7SgGWxiE3qIL2sCAwEAAQ==\n    private-key: MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEA3hQ6uQi4ukvSjtYi2AhSQ/9EUGy6sw9Dt9No4rBP5L21aXLTEyYnNKX0p2HwylZzLP7mdRJvtKAZbGITeogvawIDAQABAkBnojsRE//Yd/+nRkh2VdPGBX5kpYiufKYWR6K/fpWZ4QrASv5sIuD2Cqfp5e8K6fZ4DW/CSUMKGq6Vq6xZVeLJAiEA/BazblQTEeGFsQydEmaBA1CWupPOAFO2xg7c/5s1sI8CIQDhhlRtXfjqcUWhj4Um1t8pFBkFHiN8RC1hufaZs9OJZQIgEuLogoWOADLzPzaAthYz6DmrcUMNlfyvntsSN5w7Q4UCIQCu7raAWvsgRxqe1iePV+6j+33o1VbrJisZedkJok48bQIgWVX940QICkAUhYRJgX9uj7oWOAyE1V8ambte6SHBHhs=\n  cors: #By default CORS are not enabled. Uncomment to enable.\n    allowed-origins: \"*\"\n    allowed-methods: \"*\"\n    allowed-headers: \"*\"\n    exposed-headers: \"Authorization,Link,X-Total-Count\"\n    allow-credentials: true\n    max-age: 1800\n  swagger:\n    title: Albedo Swagger API\n    license: Powered By somewhere\n    licenseUrl: https://github.com/somowhere\n    terms-of-service-url: https://github.com/somowhere\n    contact:\n      email: somewhere0813@gmail.com\n      url: https://github.com/somowhere\n    authorization:\n      name: Albedo OAuth\n      auth-regex: ^.*$\n      authorization-scope-list:\n        - scope: server\n          description: server all\n      token-url-list:\n        - http://${GATEWAY_HOST:albedo-gateway}:${GATEWAY-PORT:9999}/auth/oauth/token ', ' a29d59e027d7133cb2708726b289174d ', '2019-12-14 10:14:03', '2022-02-24 13:14:59', 'nacos', '192.168.2.57', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', '通用配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (2, 'application-prod.yml', 'DEFAULT_GROUP', '# 加解密根密码\njasypt:\n  encryptor:\n    password: albedo #根密码\n\nlogging:\n  config: classpath:logback-spring.xml\n  level:\n    ROOT: INFO\n    com.albedo.java: INFO\n    com.albedo.java.plugins.database.interceptor.TenantLineInnerInterceptor: INFO\n# Spring 相关\nspring:\n  redis:\n    host: albedo-redis\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name:
        ${application.mysql.driverClassName}\n    username: ${application.mysql.username}\n    password:
        ${application.mysql.password}\n    url: ${application.mysql.url}\n    dynamic:\n      p6spy:
        ${application.database.p6spy}\n      seata:
        ${application.database.isSeata}\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n  cloud:\n    sentinel:\n      filter:\n        enabled: false\n      eager: true\n      transport:\n        dashboard: albedo-sentinel:8858\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: always\n  logfile:\n    enabled: true\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n      useGzipDecoder: true\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath*:/mapper/*/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: input\n      insert-strategy: NOT_NULL\n      update-strategy: NOT_NULL\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n    default-enum-type-handler: com.albedo.java.plugins.database.mybatis.typehandler.CustomEnumTypeHandler\n\n# spring security 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://albedo-auth/oauth/check_token\n    # 通用放行URL，服务个性化，请在对应配置文件覆盖\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n\n# ===================================================================\n# Albedo specific properties\n# ===================================================================\n\napplication:\n  developMode: true\n  logPath: logs\n  rabbitmq:\n    enabled: false\n    ip: albedo-mysql\n    port: 5672\n    username: albedo\n    password: albedo\n  mysql:\n    ip: albedo-mysql\n    port: 3306\n    driverClassName: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 111111\n  database:\n    tenantDatabasePrefix: albedo-cloud-base\n    multiTenantType: DATASOURCE_COLUMN\n    tenantIdColumn: tenant_code\n    ignore-tables:\n      - sys_tenant\n    ignore-mapper-ids:\n      - com.albedo.java.modules.gen.repository.TableRepository.findTableList\n      - com.albedo.java.modules.gen.repository.TableRepository.findTableColumnList\n      - com.albedo.java.modules.gen.repository.TableRepository.findTablePk\n    isNotWrite: false\n    p6spy: false\n    isBlockAttack: false  # 是否启用 攻击 SQL 阻断解析器\n    isSeata: false\n    id-type: HU_TOOL\n    hutoolId:\n      workerId: 0\n      dataCenterId: 0\n    cache-id:\n      time-bits: 31\n      worker-bits: 22\n      seq-bits: 10\n      epochStr: \'2020-09-15\'\n      boost-power: 3\n      padding-factor: 50\n  file:\n    storageType: LOCAL #  FAST_DFS LOCAL MIN_IO ALI_OSS HUAWEI_OSS QINIU_OSS\n    delFile: false\n    local:\n      storage-path: D:\\\\data\\\\projects\\\\uploadfile\\\\file\\\\     # 文件存储路径 ~/data/projects/uploadfile/file/  （ 某些版本的 window 需要改成  D:\\\\data\\\\projects\\\\uploadfile\\\\file\\\\  ）\n      endpoint: http://127.0.0.1/file/   # 文件访问 （部署nginx后，配置nginx的ip，并配置nginx静态代理storage-path地址的静态资源）\n      inner-uri-prefix: null  #  内网的url前缀\n    ali:\n      # 请填写自己的阿里云存储配置\n      uriPrefix: \"http://albedo-admin-cloud.oss-cn-beijing.aliyuncs.com/\"\n      bucket-name: \"albedo-admin-cloud\"\n      endpoint: \"oss-cn-beijing.aliyuncs.com\"\n      access-key-id: \"填写你的id\"\n      access-key-secret: \"填写你的秘钥\"\n    minIo:\n      endpoint: \"http://127.0.0.1:9000/\"\n      accessKey: \"aledo\"\n      secretKey: \"aledo\"\n      bucket: \"dev\"\n    huawei:\n      uriPrefix: \"dev.obs.cn-southwest-2.myhuaweicloud.com\"\n      endpoint: \"obs.cn-southwest-2.myhuaweicloud.com\"\n      accessKey: \"1\"\n      secretKey: \"2\"\n      location: \"cn-southwest-2\"\n      bucket: \"dev\"\n    qiNiu:\n      zone: \"z0\"\n      accessKey: \"1\"\n      secretKey: \"2\"\n      bucket: \"albedo_admin\"\n#密码加密传输，前端公钥加密，后端私钥解密\n  rsa:\n    public-key: MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAN4UOrkIuLpL0o7WItgIUkP/RFBsurMPQ7fTaOKwT+S9tWly0xMmJzSl9Kdh8MpWcyz+5nUSb7SgGWxiE3qIL2sCAwEAAQ==\n    private-key: MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEA3hQ6uQi4ukvSjtYi2AhSQ/9EUGy6sw9Dt9No4rBP5L21aXLTEyYnNKX0p2HwylZzLP7mdRJvtKAZbGITeogvawIDAQABAkBnojsRE//Yd/+nRkh2VdPGBX5kpYiufKYWR6K/fpWZ4QrASv5sIuD2Cqfp5e8K6fZ4DW/CSUMKGq6Vq6xZVeLJAiEA/BazblQTEeGFsQydEmaBA1CWupPOAFO2xg7c/5s1sI8CIQDhhlRtXfjqcUWhj4Um1t8pFBkFHiN8RC1hufaZs9OJZQIgEuLogoWOADLzPzaAthYz6DmrcUMNlfyvntsSN5w7Q4UCIQCu7raAWvsgRxqe1iePV+6j+33o1VbrJisZedkJok48bQIgWVX940QICkAUhYRJgX9uj7oWOAyE1V8ambte6SHBHhs=\n  cors: #By default CORS are not enabled. Uncomment to enable.\n    allowed-origins: \"*\"\n    allowed-methods: \"*\"\n    allowed-headers: \"*\"\n    exposed-headers: \"Authorization,Link,X-Total-Count\"\n    allow-credentials: true\n    max-age: 1800\n  swagger:\n    title: Albedo Swagger API\n    license: Powered By somewhere\n    licenseUrl: https://github.com/somowhere\n    terms-of-service-url: https://github.com/somowhere\n    contact:\n      email: somewhere0813@gmail.com\n      url: https://github.com/somowhere\n    authorization:\n      name: Albedo OAuth\n      auth-regex: ^.*$\n      authorization-scope-list:\n        - scope: server\n          description: server all\n      token-url-list:\n        - http://${GATEWAY_HOST:albedo-gateway}:${GATEWAY-PORT:9999}/auth/oauth/token', '9d7470a9634757e76f2155ab140d2795', '2020-09-20 16:51:14', '2022-02-24 12:34:30', 'nacos', '192.168.2.57', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (5, 'albedo-auth-dev.yml', 'DEFAULT_GROUP', 'logging:\n  level:\n    ROOT: INFO\n# 数据源\nspring:\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/\n\napplication:\n  rabbitmq:\n    enabled: false\n    ip: albedo-mysql\n    port: 5672\n    username: albedo\n    password: albedo\n  mysql:\n    ip: albedo-mysql\n    port: 3306\n    driverClassName: com.mysql.cj.jdbc.Driver\n    database: albedo-cloud\n    username: root\n    password: 111111\n    url: jdbc:mysql://${application.mysql.ip}:${application.mysql.port}/${application.mysql.database}?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true\n  ', 'aa46ab319eb0389a9188217a3d6fd488', '2019-12-13 17:53:57', '2021-12-25 14:00:48', 'nacos', '0:0:0:0:0:0:0:1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (6, 'albedo-auth-prod.yml', 'DEFAULT_GROUP', '# 数据源\nspring:\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/\n\napplication:\n  rabbitmq:\n    enabled: false\n    ip: albedo-mysql\n    port: 5672\n    username: albedo\n    password: albedo\n  mysql:\n    ip: albedo-mysql\n    port: 3306\n    driverClassName: com.mysql.cj.jdbc.Driver\n    database: albedo-cloud\n    username: root\n    password: 111111\n    url: jdbc:mysql://${application.mysql.ip}:${application.mysql.port}/${application.mysql.database}?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true\n  ', '00ba636bd319f2a4c2bb6d05688e911d', '2020-09-20 16:52:24', '2021-12-13 12:03:27', 'nacos', '127.0.0.1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (7, 'albedo-gateway-dev.yml', 'DEFAULT_GROUP', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: albedo-auth\n          uri: lb://albedo-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n        #系统管理 模块\n        - id: albedo-sys-server\n          uri: lb://albedo-sys-server\n          predicates:\n            - Path=/sys/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: albedo-gen\n          uri: lb://albedo-gen\n          predicates:\n            - Path=/gen/**\n        # 文件调度模块\n        - id: albedo-file-server\n          uri: lb://albedo-file-server\n          predicates:\n            - Path=/file/**\n\napplication:\n  gateway:\n    encode-key: \'somewhere-albedo\'\n    ignore-clients:\n      - test\n  swagger:\n    ignore-providers:\n      - albedo-gen\n', '31e76009c30e91414516dec390ef2ef9', '2019-12-13 17:54:26', '2022-01-26 15:16:25', 'nacos', '0:0:0:0:0:0:0:1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (8, 'albedo-gateway-prod.yml', 'DEFAULT_GROUP', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: albedo-auth\n          uri: lb://albedo-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n        #系统管理 模块\n        - id: albedo-sys-server\n          uri: lb://albedo-sys-server\n          predicates:\n            - Path=/sys/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: albedo-gen\n          uri: lb://albedo-gen\n          predicates:\n            - Path=/gen/**\n        # 文件模块\n        - id: albedo-file-server\n          uri: lb://albedo-file-server\n          predicates:\n            - Path=/file/**\n\napplication:\n  gateway:\n    encode-key: \'somewhere-albedo\'\n    ignore-clients:\n      - test\n  swagger:\n    ignore-providers:\n      - albedo-auth\n      - albedo-gen\n', '93ee32ac41e4f48fc9232d58759206a8', '2020-09-20 16:52:59', '2022-01-26 15:16:50', 'nacos', '0:0:0:0:0:0:0:1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (9, 'albedo-sys-server-dev.yml', 'DEFAULT_GROUP', 'security:\n  oauth2:\n    client:\n      client-id: ENC(WJRDLZlPlWkmLu/d+gkeAw==)\n      client-secret: ENC(gyOtaeY+fxP8/Rkd3PKm8Q==)\n      scope: server\n    # 通用放行URL，服务个性化，请在对应配置文件覆盖\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n        - /user/info/*\n        - /menu/gen\n        - /dict/all\n        - /log-operate\n\napplication:\n  mysql:\n    ip: albedo-mysql\n    port: 3306\n    driverClassName: com.mysql.cj.jdbc.Driver\n    database: albedo-cloud\n    username: root\n    password: 111111\n    url: jdbc:mysql://${application.mysql.ip}:${application.mysql.port}/${application.mysql.database}?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true\n  \n\n', '8f12c4d0b9935114c0eee25287479043', '2019-12-13 17:56:02', '2021-12-31 11:42:42', 'nacos', '127.0.0.1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (10, 'albedo-sys-server-prod.yml', 'DEFAULT_GROUP', 'dubbo:\n  cloud:\n    # The subscribed services in consumer side\n    subscribed-services: albedo-auth\n# 直接放行URL\nignore:\n  urls:\n    - /v2/**\n    - /actuator/**\n    - /user/info/*\n    - /menu/gen\n    - /dict/all\n    - /log-operate/\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(WJRDLZlPlWkmLu/d+gkeAw==)\n      client-secret: ENC(gyOtaeY+fxP8/Rkd3PKm8Q==)\n      scope: server\n\n# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 111111\n    url: jdbc:mysql://albedo-mysql:3306/albedo-cloud?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true\n\n\n\n', 'fe3498bba491b92b445d721e2f3d7062', '2019-12-13 17:56:30', '2021-12-31 11:41:20', 'nacos', '127.0.0.1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (15, 'albedo-gen-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(FGKBtFgGcI+XAg5c+7EAJg==)\n      client-secret: ENC(PE5+ODGIk7rfbiaZXHVhow==)\n      scope: server\n\n# 数据源配置\nspring:\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\napplication:\n  mysql:\n    ip: albedo-mysql\n    port: 3306\n    driverClassName: com.mysql.cj.jdbc.Driver\n    database: albedo-gen\n    username: root\n    password: 111111\n    url: jdbc:mysql://${application.mysql.ip}:${application.mysql.port}/${application.mysql.database}?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true\n  \n\n', 'd98d170ccfeb6c4a58093324d2ab1f77', '2019-12-13 17:54:43', '2021-12-15 13:41:13', 'nacos', '127.0.0.1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (16, 'albedo-gen-prod.yml', 'DEFAULT_GROUP', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: albedo-auth\n          uri: lb://albedo-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n        #系统管理 模块\n        - id: albedo-sys\n          uri: lb://albedo-sys\n          predicates:\n            - Path=/sys/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: albedo-gen\n          uri: lb://albedo-gen\n          predicates:\n            - Path=/gen/**\n        # 任务调度模块\n        - id: albedo-quartz\n          uri: lb://albedo-quartz\n          predicates:\n            - Path=/quartz/**\n        # 文件模块\n        - id: albedo-file\n          uri: lb://albedo-file\n          predicates:\n            - Path=/file/**\n\napplication:\n  gateway:\n    encode-key: \'somewhere-albedo\'\n    ignore-clients:\n      - test\n\n  swagger:\n    ignore-providers:\n      - albedo-auth\n      - albedo-gen\n      - swagger\n', '1c69c3a0a35548896ce6f58a4384a7e1', '2020-09-20 16:53:22', '2021-12-15 14:01:03', 'nacos', '127.0.0.1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (20, 'albedo-monitor-dev.yml', 'DEFAULT_GROUP', 'spring:\r\n  # 安全配置\r\n  security:\r\n    user:\r\n      name: ENC(ToJTk3p6JF+h0gsHeHVRoQ==)     # albedo\r\n      password: ENC(sGfB6KY7Zq0BTfwbWYxnWw==) # albedo\r\n', 'c9e2b0633b44d33b37beb14a7f3dc501', '2019-12-13 17:54:58', '2019-12-13 17:54:58', NULL, '0:0:0:0:0:0:0:1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (21, 'albedo-monitor-prod.yml', 'DEFAULT_GROUP', 'spring:\n  # 安全配置\n  security:\n    user:\n      name: ENC(ToJTk3p6JF+h0gsHeHVRoQ==)     # albedo\n      password: ENC(sGfB6KY7Zq0BTfwbWYxnWw==) # albedo\n', 'a71b77b1b47f810aed0dc5756faeacb6', '2020-09-20 16:53:49', '2020-09-20 16:53:49', NULL, '0:0:0:0:0:0:0:1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (30, 'albedo-quartz-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(FGKBtFgGcI+XAg5c+7EAJg==)\n      client-secret: ENC(PE5+ODGIk7rfbiaZXHVhow==)\n      scope: server\n\n# 数据源配置\nspring:\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\napplication:\n  mysql:\n    ip: albedo-mysql\n    port: 3306\n    driverClassName: com.mysql.cj.jdbc.Driver\n    database: albedo-quartz\n    username: root\n    password: 111111\n    url: jdbc:mysql://${application.mysql.ip}:${application.mysql.port}/${application.mysql.database}?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true\n  \n\n', 'eb3c3b00fc32e376cef2c9ffb70abb30', '2019-12-13 17:55:19', '2021-12-15 13:42:49', 'nacos', '127.0.0.1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (31, 'albedo-quartz-prod.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(FGKBtFgGcI+XAg5c+7EAJg==)\n      client-secret: ENC(PE5+ODGIk7rfbiaZXHVhow==)\n      scope: server\n\n# 数据源配置\nspring:\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\napplication:\n  mysql:\n    ip: albedo-mysql\n    port: 3306\n    driverClassName: com.mysql.cj.jdbc.Driver\n    database: albedo-quartz\n    username: root\n    password: 111111\n    url: jdbc:mysql://${application.mysql.ip}:${application.mysql.port}/${application.mysql.database}?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true\n  \n\n', 'eb3c3b00fc32e376cef2c9ffb70abb30', '2020-09-20 16:54:17', '2021-12-15 13:42:15', 'nacos', '127.0.0.1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (40, 'albedo-file-server-dev.yml', 'DEFAULT_GROUP', 'security:\n  oauth2:\n    client:\n      client-id: ENC(WJRDLZlPlWkmLu/d+gkeAw==)\n      client-secret: ENC(gyOtaeY+fxP8/Rkd3PKm8Q==)\n      scope: server\n\n# ===================================================================\n# Albedo specific properties\n# ===================================================================\napplication:\n  mysql:\n    ip: albedo-mysql\n    port: 3306\n    driverClassName: com.mysql.cj.jdbc.Driver\n    database: albedo-cloud\n    username: root\n    password: 111111\n    url: jdbc:mysql://${application.mysql.ip}:${application.mysql.port}/${application.mysql.database}?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true\n  file:\n    storageType: LOCAL #  FAST_DFS LOCAL MIN_IO ALI_OSS HUAWEI_OSS QINIU_OSS\n    delFile: false\n    local:\n      storage-path: D:\\\\data\\\\projects\\\\uploadfile\\\\file\\\\     # 文件存储路径 ~/data/projects/uploadfile/file/  （ 某些版本的 window 需要改成  D:\\\\data\\\\projects\\\\uploadfile\\\\file\\\\  ）\n      endpoint: http://127.0.0.1/file/   # 文件访问 （部署nginx后，配置nginx的ip，并配置nginx静态代理storage-path地址的静态资源）\n      inner-uri-prefix: null  #  内网的url前缀\n    ali:\n      # 请填写自己的阿里云存储配置\n      uriPrefix: \"http://albedo-admin-cloud.oss-cn-beijing.aliyuncs.com/\"\n      bucket-name: \"albedo-admin-cloud\"\n      endpoint: \"oss-cn-beijing.aliyuncs.com\"\n      access-key-id: \"填写你的id\"\n      access-key-secret: \"填写你的秘钥\"\n    minIo:\n      endpoint: \"http://127.0.0.1:9000/\"\n      accessKey: \"aledo\"\n      secretKey: \"aledo\"\n      bucket: \"dev\"\n    huawei:\n      uriPrefix: \"dev.obs.cn-southwest-2.myhuaweicloud.com\"\n      endpoint: \"obs.cn-southwest-2.myhuaweicloud.com\"\n      accessKey: \"1\"\n      secretKey: \"2\"\n      location: \"cn-southwest-2\"\n      bucket: \"dev\"\n    qiNiu:\n      zone: \"z0\"\n      accessKey: \"1\"\n      secretKey: \"2\"\n      bucket: \"albedo_admin\"\n', '490bb3aad15d9953f506bb6be7679393', '2021-12-15 13:35:45', '2022-01-26 16:32:22', 'nacos', '0:0:0:0:0:0:0:1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (105, 'albedo-tenant-dev.yml', 'DEFAULT_GROUP', 'security:\n  oauth2:\n    client:\n      client-id: ENC(WJRDLZlPlWkmLu/d+gkeAw==)\n      client-secret: ENC(gyOtaeY+fxP8/Rkd3PKm8Q==)\n      scope: server\n\n# ===================================================================\n# Albedo specific properties\n# ===================================================================\napplication:\n  mysql:\n    ip: albedo-mysql\n    port: 3306\n    driverClassName: com.mysql.cj.jdbc.Driver\n    database: albedo-cloud\n    username: root\n    password: 111111\n    url: jdbc:mysql://${application.mysql.ip}:${application.mysql.port}/${application.mysql.database}?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true', '9d2c48cac1f9f62cd1e32bc4290b5ee3', '2021-12-31 11:24:03', '2021-12-31 11:24:03', NULL, '127.0.0.1', '', '7372cf74-38e6-4887-b026-b4018fb48dc0', NULL, NULL, NULL, 'yaml', NULL);

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `datum_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `src_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `src_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nid` bigint(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quota` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(0) UNSIGNED NOT NULL,
  `nid` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `src_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quota` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_source` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` bigint(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '7372cf74-38e6-4887-b026-b4018fb48dc0', 'albedo-cloud', 'albedo-cloud', 'nacos', 1640236263415, 1640236263415);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$1fXDf9q5CKAA.Fe4rjTzzONGDI4cXFvMfPx9Yribr9OQC2.JDe/wK', 1);

SET FOREIGN_KEY_CHECKS = 1;
