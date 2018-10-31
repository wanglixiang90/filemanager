FROM alpine:latest
MAINTAINER WangLX<15201376500@163.com>

ADD Caddyfile /Caddyfile
 
RUN apk --no-cache add curl && \
    curl "https://caddyserver.com/download/linux/amd64?plugins=http.cache,http.filemanager,http.login,http.upload&license=personal&telemetry=off" | tar -xz caddy && \
    mkdir -p /share /db && \
    mv caddy /usr/bin/caddy && \
    chmod -R 777 /usr/bin/caddy /share /db && \
    apk del --purge curl

CMD caddy -conf /Caddyfile

WORKDIR /share
EXPOSE 80 8080