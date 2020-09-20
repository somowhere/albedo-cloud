FROM moxm/java:1.8-full

MAINTAINER somewhere0813@gmail.com

ENV TZ=Asia/Shanghai JAVA_OPTS="-Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom"

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /albedo-job

WORKDIR /albedo-job

EXPOSE 5005

ADD ./target/albedo-job.jar ./

CMD sleep 60;java $JAVA_OPTS -jar albedo-job.jar
