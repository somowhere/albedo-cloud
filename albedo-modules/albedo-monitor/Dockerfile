FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER somewhere0813@gmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /albedo-monitor

WORKDIR /albedo-monitor

EXPOSE 5001

ADD ./albedo-visual/albedo-monitor/target/albedo-monitor.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar albedo-monitor.jar
