FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER somewhere0813@gmail.com

ENV TZ=Asia/Shanghai

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /albedo-sentinel

WORKDIR /albedo-sentinel

EXPOSE 5003

ADD ./albedo-modules/albedo-sentinel/target/albedo-sentinel.jar ./

CMD sleep 30;java -Djava.security.egd=file:/dev/./urandom -jar albedo-sentinel.jar
