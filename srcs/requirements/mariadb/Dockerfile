FROM alpine:3.17

RUN apk update \
	&& apk add mysql mysql-client

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d

COPY ./tools/init_mariadb.sh /scripts/

RUN chmod +x /scripts/init_mariadb.sh

RUN apk add --no-cache dumb-init

EXPOSE 3306

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD [ "/scripts/init_mariadb.sh" ]