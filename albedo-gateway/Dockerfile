FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER somewhere0813@gmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /albedo-gateway

WORKDIR /albedo-gateway

EXPOSE 9999

ADD ./albedo-gateway/target/albedo-gateway.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar albedo-gateway.jar
