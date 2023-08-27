#!/bin/sh

# Function to set up necessary directories and permissions
initialize_directories() {
  mkdir -p /run/mysqld/
  chown -R mysql:mysql /run/mysqld /var/lib/mysql/
  chmod -R 770 /var/lib/mysql/
}

# Function to initialize MariaDB database
initialize_mariadb() {
  mysql_install_db --user=mysql --datadir=/var/lib/mysql
}

# Function to execute SQL statements
execute_sql() {
  local sql=$1
  mysql -u root -p$MARIADB_ROOT_PASSWORD -e "$sql"
}

# Function to set up MariaDB users and permissions
setup_users_and_permissions() {
  mariadbd --user=mysql &
  sleep 10
  
  execute_sql "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}'"
  execute_sql "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE}"
  execute_sql "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}'"
  execute_sql "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%'"
  execute_sql "FLUSH PRIVILEGES"

  pkill mariadbd
  sleep 3
}

initialize_directories

# Main Script Execution
if [ ! -d "/var/lib/mysql/mysql" ]; then
  initialize_mariadb
  setup_users_and_permissions
fi

exec mariadbd --user=mysql