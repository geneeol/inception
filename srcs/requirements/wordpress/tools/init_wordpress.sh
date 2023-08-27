#!/bin/sh

sleep 20

chmod +x /usr/local/bin/wp

# www-data라는 사용자 및 그룹 추가, 추가후 소유권, 권한 부여
grep -q "^www-data:" /etc/group || addgroup -g 81 -S www-data

adduser -u 81 -D -S -G www-data www-data

chown -R www-data:www-data /var/www/html

chmod -R 770 /var/www/html

# wordpress 셋업 및 유저 추가
if [ ! -d "/var/www/html/wp-admin" ]; then
    wp core download --path=/var/www/html
    wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$MARIADB_HOST:
    wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_USER@example.com
    wp user create $WP_USER $WP_USER@example.com --user_pass=$WP_USER_PASS
fi

exec php-fpm81 -F
# exec wp server --host=0.0.0.0 --port=9000