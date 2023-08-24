<?php
define('DB_NAME', getenv('MARIADB_DATABASE'));
define('DB_USER', getenv('MARIADB_USER'));
define('DB_PASSWORD', getenv('MARIADB_PASSWORD'));
define('DB_HOST', 'mariadb');

$table_prefix = 'wp_';
require_once(ABSPATH . 'wp-settings.php');
?>