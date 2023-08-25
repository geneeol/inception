# FROM alpine:3.17

# WORKDIR /var/www/html

# COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf

# COPY ./conf/wp-config.php /temp_conf/

# COPY ./tools/init_wordpress.sh /scripts/

# RUN apk update && apk add curl php81 php81-fpm php81-mysqli php81-openssl php81-phar php81-iconv

# RUN curl -o /usr/local/bin/wp -fSL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# RUN apk add --no-cache dumb-init

# ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# EXPOSE 9000

# CMD ["/scripts/init_wordpress.sh"]

FROM alpine:3.17

WORKDIR /var/www/html

RUN apk update && apk add curl php81 php81-fpm php81-mysqli php81-openssl php81-phar php81-iconv mariadb-client curl php81-mbstring

RUN curl -o /usr/local/bin/wp -fSL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

COPY ./conf/www.conf /etc/php81/php-fpm.d

COPY ./tools/init_wordpress.sh /scripts/

RUN apk add --no-cache dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

EXPOSE 9000

CMD ["/scripts/init_wordpress.sh"]