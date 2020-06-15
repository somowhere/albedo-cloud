FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER somewhere0813@gmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /albedo-sys

WORKDIR /albedo-sys

EXPOSE 4000

ADD ./albedo-modules/albedo-sys/target/albedo-sys.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar albedo-sys.jar
