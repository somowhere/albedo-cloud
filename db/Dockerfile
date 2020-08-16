FROM mysql:5.7

MAINTAINER somewhere(somewhere0813@gmail.com)

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY ./db/albedo-cloud.sql /docker-entrypoint-initdb.d

COPY ./db/albedo-config.sql /docker-entrypoint-initdb.d
