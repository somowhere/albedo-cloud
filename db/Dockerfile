FROM mysql:8.0.24

MAINTAINER somewhere(somewhere0813@gmail.com)

ENV TZ=Asia/Shanghai

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./albedo-cloud.sql /docker-entrypoint-initdb.d

COPY ./albedo-config.sql /docker-entrypoint-initdb.d

COPY ./albedo-gen.sql /docker-entrypoint-initdb.d

COPY ./albedo-job.sql /docker-entrypoint-initdb.d

COPY ./albedo-quartz.sql /docker-entrypoint-initdb.d
