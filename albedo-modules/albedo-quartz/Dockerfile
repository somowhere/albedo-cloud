FROM moxm/java:1.8-full

MAINTAINER somewhere0813@gmail.com

ENV TZ=Asia/Shanghai JAVA_OPTS="-Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom"

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /albedo-quartz

WORKDIR /albedo-quartz

EXPOSE 5004

ADD ./target/albedo-quartz.jar ./

CMD sleep 60;java $JAVA_OPTS -jar albedo-quartz.jar
