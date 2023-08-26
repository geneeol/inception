FROM alpine:3.17

RUN apk update \
	&& apk add mysql mysql-client

RUN apk add --no-cache dumb-init


COPY ./tools/init_mariadb.sh /scripts/

RUN chmod +x ./scripts/init_mariadb.sh

# ENTRYPOINT ["/usr/bin/dumb-init", "--"]

EXPOSE 3306

# CMD ["/scripts/init_mariadb.sh"]
