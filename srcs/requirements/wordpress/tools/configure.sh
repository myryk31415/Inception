#!/bin/bash
sleep 20

cd /var/www/html
curl -O https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz --strip-components=1
if [ ! -f "./wp-config.php" ]; then
	wp config create	--allow-root \
						--dbname=$db_name \
						--dbuser=$db_user \
						--dbpass=$db_pass \
						--dbhost=mariadb:3306 \
						--path='/var/www/html'

	wp core install		--allow-root \
						--url=$wp_domain \
						--title=$wp_title \
						--admin_user=$wp_admin \
						--admin_password=$wp_admin_pass \
						--admin_email=$wp_admin_email \
						--skip-email

	wp user create		--allow-root \
						$wp_user $wp_email \
						--role=author \
						--user_pass=$wp_pwd
fi

if  [ ! -d "/run/php" ]; then
	mkdir -p /run/php
fi

exec php-fpm7.4 -F
