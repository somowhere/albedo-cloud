FROM openjdk:8-jdk-alpine

MAINTAINER somewhere0813@gmail.com

ENV TZ=Asia/Shanghai

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apk update && apk add --no-cache libc6-compat
RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2

RUN mkdir -p /albedo-register

WORKDIR /albedo-register

EXPOSE 8878

ADD ./target/albedo-register.jar ./

CMD sleep 10;java -Djava.security.egd=file:/dev/./urandom -jar albedo-register.jar


