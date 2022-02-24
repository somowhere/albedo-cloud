 <p align="center">
   <img src="https://img.shields.io/badge/Spring%20Cloud-2021.0.1-blue.svg" alt="Coverage Status">
   <img src="https://img.shields.io/badge/Spring%20Cloud%20Alibaba-2021.1-blue.svg" alt="Coverage Status">
   <img src="https://img.shields.io/badge/Spring%20Boot-2.6.3-blue.svg" alt="Downloads">
 </p>  

**albedo-cloud Microservice Architecture**

- 全网最新spring-cloud-alibaba微服务架构
- 前端<a href="https://github.com/somowhere/albedo-ui" target="_blank">albedo-ui </a>
- 基于<a href="https://gitee.com/log4j/pig" target="_blank">pix</a>开源版本（保持更新）二次开发(
  同时借鉴<a href="https://www.jhipster.tech/" target="_blank">jhipster</a>)
- 基于 Spring Cloud 、Spring Security OAuth2 的RBAC权限管理系统
- 基于数据驱动视图的理念封装 Element-ui，即使没有 vue 的使用经验也能快速上手
- 提供对常见容器化支持 Docker、Kubernetes、Rancher2 支持
- 提供 lambda 、stream api 、webflux 的生产实践

#### 快速开始

1. 在host添加

```
127.0.0.1 albedo-mysql
127.0.0.1 albedo-redis
127.0.0.1 albedo-auth
127.0.0.1 albedo-gateway
127.0.0.1 albedo-register
127.0.0.1 albedo-sentinel
127.0.0.1 albedo-monitor
```

2. 依次启动

```
AlbedoRegisterApplication
AlbedoAuthApplication
AlbedoSysApplication
AlbedoGenApplication
AlbedoQuartzApplication
AlbedoMonitorApplication
AlbedoSentinelApplication
AlbedoJobApplication
AlbedoGatewayApplication
```

3. 启动前端[albedi-ui](https://github.com/somowhere/albedo-ui) 访问[localhost](http://localhost:4000)

#### 系统预览

<table>
    <tr>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/1.png"/></td>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/2.png"/></td>
    </tr>
    <tr>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/3.png"/></td>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/4.png"/></td>
    </tr>
    <tr>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/5.png"/></td>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/6.png"/></td>
    </tr>
    <tr>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/7.png"/></td>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/8.png"/></td>
    </tr>
    <tr>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/9.png"/></td>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/10.png"/></td>
    </tr>
    <tr>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/11.png"/></td>
        <td></td>
    </tr>
</table>
#### 核心依赖 

依赖 | 版本
---|---
Spring Boot |  2.6.3
Spring Cloud | 2021.0.1
Spring Cloud Alibaba | 2021.1
Spring Security OAuth2 | 2.3.6.RELEASE
Mybatis Plus | 3.5.1
hutool | 5.7.21

#### 模块说明

```
albedo
├── albedo-auth -- 授权服务提供[3000]
└── albedo-common -- 系统公共模块 
     ├── albedo-sys-api --  服务基础api
     ├── albedo-common-core -- 公共工具类核心包
     ├── albedo-common-log -- 日志服务
     ├── albedo-common-module -- 模块基础包
     └── albedo-common-security -- 安全工具类
├── albedo-gateway -- Spring Cloud Gateway网关[9999]
└── albedo-modules -- 功能模块
     ├── albedo-gen -- 图形化代码生成[5003]
     ├── albedo-monitor -- Spring Boot Admin监控 [5001]
     ├── albedo-quartz -- 任务调度 [5004]
     ├── albedo-sentinel -- 流量监控模块 [8858]
     ├── albedo-sys -- 通用用户权限管理系统业务处理模块[4000]
     └── albedo-job -- 分布式调度模块[5005]
└── albedo-plugin  -- 插件模块 
     ├── albedo-database -- mybatis 基础模块
     └── albedo-swagger-api -- swagger api
└── albedo-register  -- Nacos 注册中心
	 
```

#### 特别鸣谢

- 感谢 [JetBrains](https://www.jetbrains.com/) 提供的非商业开源软件开发授权
- 感谢
  [jhipster](https://www.jhipster.tech/)  [pig](https://gitee.com/log4j/pig)  [RuoYi](https://gitee.com/y_project/RuoYi)  [eladmin](https://github.com/elunez/eladmin)

#### 提交反馈

1. 欢迎提交 issue，请写清楚遇到问题的原因，开发环境，复显步骤。

2. 不接受`功能请求`的 issue，功能请求可能会被直接关闭。

3. <a href="mailto:somewhere0813@gmail.com">somewhere0813@gmail.com</a>

4. QQ群: 685728393

#### 项目捐赠

项目的发展离不开您的支持，请作者喝杯咖啡吧☕

<table>
    <tr>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/alipay.png"/></td>
        <td><img src="https://raw.githubusercontent.com/somowhere/albedo-source/master/albedo/wxpay.png"/></td>
    </tr>
</table>
 

