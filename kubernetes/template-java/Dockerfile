FROM openjdk:8-jdk-alpine

RUN echo -e "https://mirrors.ustc.edu.cn/alpine/latest-stable/main\nhttps://mirrors.ustc.edu.cn/alpine/latest-stable/community" > /etc/apk/repositories && \
    apk update upgrade && \
    apk add --no-cache tzdata bash tini && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

ENV APOLLO_META=http://127.0.0.1:8080

ENV DUBBO_IP_TO_REGISTRY 127.0.0.1
ENV DUBBO_PORT_TO_REGISTRY 9090

ENV JVM_OPTS=""
ENV PARAMS=""

VOLUME /tmp
COPY ./target/*.jar app.jar
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "-c", "java -XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0 -Djava.security.egd=file:/dev/./urandom -Djava.net.preferIPv4Stack=true -Dapollo.meta=${APOLLO_META} ${JVM_OPTS} -jar /app.jar ${PARAMS} "]