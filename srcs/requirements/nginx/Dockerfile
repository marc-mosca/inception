# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmosca <mmosca@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/02 15:04:36 by mmosca            #+#    #+#              #
#    Updated: 2022/05/28 14:02:28 by mmosca           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

## ~~~~ Operating System ~~~~ ##
FROM debian:buster

## ~~~~ Image's metadatas ~~~~ ##
LABEL version="1.0" maintainer="MOSCA Marc <mmosca@student42lyon.fr>"

## ~~~~ Variables ~~~~ ##
ARG	APT="apt-get"
ARG APT_FLAGS="-qy"

## ~~~~ Installation ~~~~ ##
RUN	$APT $APT_FLAGS update \
&&	$APT $APT_FLAGS upgrade \
&&	$APT $APT_FLAGS install nginx openssl \
&&	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=France/L=Lyon/emailAddress=mmosca@student.42lyon.fr" \
	-keyout /etc/ssl/private/inception_nginx.key \
	-out /etc/ssl/certs/inception_nginx.crt \
&&	$APT clean

## ~~~~ Configuration ~~~~ ##
COPY	./conf/nginx.conf /etc/nginx/sites-available/default

## ~~~~ Ports ~~~~ ##
EXPOSE	443

## ~~~~ Start ~~~~ ##
ENTRYPOINT	["nginx", "-g", "daemon off;"]
