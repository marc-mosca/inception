#!/bin/bash

cd /var/www/html/wordpress

if ! wp core is-installed --allow-root
then
	wp core install --allow-root \
		--url=${DOMAIN_NAME} \
		--title="${WP_TITLE}" \
		--admin_user=${WP_ADMIN} \
		--admin_password=${WP_ADMIN_PASSWORD} \
		--admin_email=${WP_ADMIN_EMAIL}
	wp --allow-root --path=/var/www/html/wordpress user create ${WP_USER_NAME} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --role=${WP_ROLE}
fi

php-fpm7.3 -F
