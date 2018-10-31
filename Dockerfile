FROM alpine:latest
MAINTAINER WangLX<15201376500@163.com>

ADD caddy /usr/bin/caddy
ADD Caddyfile /Caddyfile
 
RUN mkdir -p /share /db && \
    chmod -R 777 /usr/bin/caddy /share /db

CMD caddy -conf /Caddyfile

WORKDIR /share
EXPOSE 80 8080
