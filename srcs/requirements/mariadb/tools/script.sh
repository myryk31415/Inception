#!/bin/bash
#db_name = Database Name
#db_user = User
#db_pwd = User Password

mysqld_safe --skip-networking

while ! mysqladmin ping --silent; do
    sleep 5
done

# echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > db1.sql
# echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pass' ;" >> db1.sql
# echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_root_pass' ;" >> db1.sql
# echo "FLUSH PRIVILEGES;" >> db1.sql

# mysql < db1.sql

# mysqld_safe

mysql -e "CREATE DATABASE IF NOT EXISTS \`${db_name}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${db_user}\`@'localhost' IDENTIFIED BY '${db_pass}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO \`${db_user}\`@'%' IDENTIFIED BY '${db_pass}';"

#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${db_root_pass}');"

mysql -e "FLUSH PRIVILEGES;"

sleep 10

mysqladmin -u root -p$db_root_pass shutdown

exec mysqld_safe
