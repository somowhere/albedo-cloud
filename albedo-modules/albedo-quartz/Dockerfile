FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER somewhere0813@gmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /albedo-quartz

WORKDIR /albedo-quartz

EXPOSE 5004

ADD ./albedo-modules/albedo-quartz/target/albedo-quartz.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar albedo-quartz.jar
