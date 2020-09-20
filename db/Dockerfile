FROM mysql:8.0.21

MAINTAINER somewhere(somewhere0813@gmail.com)

ENV TZ=Asia/Shanghai

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./db/albedo-cloud.sql /docker-entrypoint-initdb.d

COPY ./db/albedo-config.sql /docker-entrypoint-initdb.d

COPY ./db/albedo-gen.sql /docker-entrypoint-initdb.d

COPY ./db/albedo-job.sql /docker-entrypoint-initdb.d
