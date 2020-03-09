FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER somewhere0813@gmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /albedo-gen

WORKDIR /albedo-gen

EXPOSE 5003

ADD ./albedo-visual/albedo-gen/target/albedo-gen.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar albedo-gen.jar
