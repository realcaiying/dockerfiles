FROM openjdk:8-jdk-alpine

RUN echo -e "https://mirrors.ustc.edu.cn/alpine/latest-stable/main\nhttps://mirrors.ustc.edu.cn/alpine/latest-stable/community" > /etc/apk/repositories && \
    apk update upgrade && \
    apk add --no-cache tzdata bash && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

ENV NAME="sentinel-dashboard"
ENV HOST=127.0.0.1
ENV PORT=8080

ENV JVM_OPTS=""
ENV PARAMS=""

ADD ./sentinel-dashboard.jar /app.jar

CMD ["sh", "-c", "java -Djava.security.egd=file:/dev/./urandom -Dserver.port=${PORT} -Dcsp.sentinel.dashboard.server=${HOST}:${PORT} -Dproject.name=${NAME} ${JVM_OPTS} -jar /app.jar ${PARAMS} "]