FROM anapsix/alpine-java:8_server-jre_unlimited as builder
WORKDIR /build
ARG JAR_FILE=target/albedo-gen.jar
COPY ${JAR_FILE} app.jar
RUN java -Djarmode=layertools -jar app.jar extract && rm app.jar

FROM anapsix/alpine-java:8_server-jre_unlimited
LABEL maintainer="somewhere0813@gmail.com"
ENV TZ=Asia/Shanghai JAVA_OPTS="-Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom"
WORKDIR albedo-gen

COPY --from=builder /build/dependencies/ ./
COPY --from=builder /build/snapshot-dependencies/ ./
COPY --from=builder /build/spring-boot-loader/ ./
COPY --from=builder /build/application/ ./

EXPOSE 9999

CMD sleep 5; java $JAVA_OPTS org.springframework.boot.loader.JarLauncher
