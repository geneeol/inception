#!/bin/sh

mkdir -p /run/mysqld/
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql/
chmod -R 770 /var/lib/mysql/

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    mariadbd --user=mysql &
    sleep 10

    mysql -u root -p$MARIADB_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
    mysql -u root -p$MARIADB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
    mysql -u root -p$MARIADB_ROOT_PASSWORD -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
    mysql -u root -p$MARIADB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';"
    mysql -u root -p$MARIADB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

    pkill mariadbd

    sleep 3
fi

exec mariadbd --user=mysql