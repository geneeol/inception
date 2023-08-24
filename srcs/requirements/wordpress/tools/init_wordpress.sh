#!/bin/sh

sleep 20

mv /temp_conf/wp-config.php /var/www/html/

chmod +x /usr/local/bin/wp

grep -q "^www-data:" /etc/group || addgroup -g 81 -S www-data

adduser -u 81 -D -S -G www-data www-data

chown -R www-data:www-data /var/www/html

chmod -R 755 /var/www/html

# wordpress download
# if [ ! -f "/var/www/html/wp-config.php" ]; then

wp core download
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_USER@example.com
wp user create $WP_USER $WP_USER@example.com --user_pass=$WP_USER_PASS

exec php-fpm81 -F