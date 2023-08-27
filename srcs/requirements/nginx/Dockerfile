FROM alpine:3.17

# nginx 설치
RUN apk update \
    && apk add openssl curl ca-certificates \
    && printf "%s%s%s\n" \
    "http://nginx.org/packages/mainline/alpine/v" \
    `egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` \
    "/main" \
    | tee -a /etc/apk/repositories \
    && curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub \
    && openssl rsa -pubin -in /tmp/nginx_signing.rsa.pub -text -noout \
    && mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/ \
    && apk add nginx \
    && rm -rf /var/cache/apk/*

# 인증서용 프라이빗키 생성(개인키)
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/conf.d/cert.key \
    -out /etc/nginx/conf.d/cert.crt \
    -subj "/C=KR/L=Seoul/O=42Seoul/CN=dahkang.42.fr"

RUN rm -rf /etc/nginx/conf.d/default.conf

COPY conf/default.conf /etc/nginx/conf.d/default.conf

RUN apk add --no-cache dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
