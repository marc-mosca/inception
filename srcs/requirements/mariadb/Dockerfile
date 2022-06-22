# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmosca <mmosca@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/14 21:21:00 by mmosca            #+#    #+#              #
#    Updated: 2022/06/14 21:43:45 by mmosca           ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
LABEL version="1.0" maintainer="MOSCA Marc <mmosca@student.42lyon.fr>"

ARG APT="apt-get"
ARG APT_FLAGS="-qy"
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN ${APT} ${APT_FLAGS} update \
	&& ${APT} ${APT_FLAGS} upgrade \
	&& ${APT} ${APT_FLAGS} install mariadb-server \
	&& service mysql start \
	&& mysql -e "create database if not exists ${MYSQL_DATABASE};\
	alter user 'root'@'localhost' identified by '${MYSQL_ROOT_PASSWORD}';\
	grant all privileges on ${MYSQL_DATABASE}.* to '${MYSQL_USER}'@'%' identified by '${MYSQL_PASSWORD}';\
	flush privileges;" \
	&& ${APT} clean

EXPOSE 3306
ENTRYPOINT [ "mysqld", "--bind-address=0.0.0.0" ]
