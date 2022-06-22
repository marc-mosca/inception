# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmosca <mmosca@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/12 18:57:47 by mmosca            #+#    #+#              #
#    Updated: 2022/06/16 12:16:29 by mmosca           ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

##	~~	Properties -------------------------------------------------------------

NAME	:=	inception
DOCKER	:=	docker-compose --project-directory=srcs --file srcs/docker-compose.yml -p $(NAME)

##	~~	Rules ------------------------------------------------------------------

up:	build
	$(DOCKER) up -d

build:	volumes
	$(DOCKER) build --parallel

down:
	$(DOCKER) down

start:
	$(DOCKER) start

stop:
	$(DOCKER) stop

restart:
	$(DOCKER) restart

destroy:
	$(DOCKER) down --rmi all --volumes
	rm -Rf /home/$(USER)/data/*

volumes:
	mkdir -p /home/$(USER)/data/db
	mkdir -p /home/$(USER)/data/site

.PHONY: up build down start stop restart destroy volumes
