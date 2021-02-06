FROM openjdk:8-jdk-alpine

MAINTAINER somewhere0813@gmail.com

ENV TZ=Asia/Shanghai

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /albedo-gateway

WORKDIR /albedo-gateway

EXPOSE 8878

ADD ./target/albedo-gateway.jar ./

CMD sleep 30;java -Djava.security.egd=file:/dev/./urandom -jar albedo-gateway.jar


