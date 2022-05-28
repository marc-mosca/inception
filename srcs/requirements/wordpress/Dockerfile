# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmosca <mmosca@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/02 15:04:42 by mmosca            #+#    #+#              #
#    Updated: 2022/05/28 13:23:19 by mmosca           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

## ~~~~ Operating System ~~~~ ##
FROM debian:buster

## ~~~~ Image's metadatas ~~~~ ##
LABEL version="1.0" maintainer="MOSCA Marc <mmosca@student42lyon.fr>"

## ~~~~ Variables ~~~~ ##
ARG	APT="apt-get"
ARG APT_FLAGS="-qy"

## ~~~~ Run ~~~~ ##
RUN	$APT $APT_FLAGS update \
&&	$APT $APT_FLAGS upgrade \
&&	$APT clean
