FROM alpine:3.17

RUN apk update \
	&& apk add mysql mysql-client

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d

COPY ./tools/init_mariadb.sh /scripts/

RUN chmod +x /scripts/init_mariadb.sh

RUN apk add --no-cache dumb-init

# TODO: 추후 삭제
ENV MARIADB_ROOT_PASSWORD='1234' \
	MARIADB_DATABASE='wordpress' \
	MARIADB_USER='wordpress' \
	MARIADB_PASSWORD='wordpress' \
	\
	MARIADB_HOST='mariadb' \
	MARIADB_DATABASE='wordpress' \
	MARIADB_USER='wordpress' \
	MARIADB_PASSWORD='wordpress'

EXPOSE 3306

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD [ "/scripts/init_mariadb.sh" ]