#!/bin/bash
sleep 8

cd /var/www/html

if [ ! -f "./wp-config.php" ]; then
	wp config create	--allow-root \
						--dbname=$db_name \
						--dbuser=$db_user \
						--dbpass=$db_pass \
						--dbhost=mariadb:3306 \
						--path='/var/www/wordpress'

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
						--user_pass=$WP_PWD
fi

if  [ ! -d "/run/php" ]; then
	mkdir -p /run/php
fi

php-fpm8.3 -F
