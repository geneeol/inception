#!/bin/sh

mkdir -p /run/mysqld/
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql/
chmod -R 770 /var/lib/mysql/