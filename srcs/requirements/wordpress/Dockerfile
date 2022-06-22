# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmosca <mmosca@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/14 21:28:37 by mmosca            #+#    #+#              #
#    Updated: 2022/06/16 12:11:15 by mmosca           ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
LABEL version="1.0" maintainer="MOSCA Marc <mmosca@student.42lyon.fr>"

ARG APT="apt-get"
ARG APT_FLAGS="-qy"
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_HOST

RUN ${APT} ${APT_FLAGS} update \
	&& ${APT} ${APT_FLAGS} upgrade \
	&& ${APT} ${APT_FLAGS} install wget curl php-fpm php-mysql \
	&& service php7.3-fpm start \
	&& service php7.3-fpm stop \
	&& sed -i "s/\/run\/php\/php7.3-fpm.sock/wordpress:9000/" /etc/php/7.3/fpm/pool.d/www.conf \
	&& ${APT} clean

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp \
	&& mkdir -p /var/www/html/wordpress \
	&& cd /var/www/html/wordpress \
	&& wp core download --allow-root

RUN cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php \
	&& sed -i "s/database_name_here/${MYSQL_DATABASE}/" /var/www/html/wordpress/wp-config.php \
	&& sed -i "s/username_here/${MYSQL_USER}/" /var/www/html/wordpress/wp-config.php \
	&& sed -i "s/password_here/${MYSQL_PASSWORD}/" /var/www/html/wordpress/wp-config.php \
	&& sed -i "s/localhost/${MYSQL_HOST}/" /var/www/html/wordpress/wp-config.php

RUN mkdir -p /var/www/html/wordpress/adminer \
	&& cd /var/www/html/wordpress/adminer \
	&& wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php \
	&& mv adminer-4.8.1.php index.php

EXPOSE 9000
COPY ./conf/entrypoint.sh /tmp
COPY ./conf/inception /var/www/html/wordpress/inception
ENTRYPOINT [ "sh", "./tmp/entrypoint.sh" ]
