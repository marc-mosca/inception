# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmosca <mmosca@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/14 21:28:26 by mmosca            #+#    #+#              #
#    Updated: 2022/06/16 12:23:31 by mmosca           ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
LABEL version="1.0" maintainer="MOSCA Marc <mmosca@student.42lyon.fr>"

ARG APT="apt-get"
ARG APT_FLAGS="-qy"

RUN ${APT} ${APT_FLAGS} update \
	&& ${APT} ${APT_FLAGS} upgrade \
	&& ${APT} ${APT_FLAGS} install nginx openssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=France/L=Lyon/emailAdress=mmosca@student.42lyon.fr" \
	-keyout /etc/ssl/private/inception.key \
	-out /etc/ssl/certs/inception.crt \
	&& ${APT} clean

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
EXPOSE 443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
