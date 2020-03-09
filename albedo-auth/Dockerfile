FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER somewhere0813@gmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /albedo-auth

WORKDIR /albedo-auth

EXPOSE 3000

ADD ./albedo-auth/target/albedo-auth.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar albedo-auth.jar
