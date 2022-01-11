# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fgalaup <fgalaup@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 10:51:10 by fgalaup           #+#    #+#              #
#    Updated: 2021/02/06 12:10:14 by fgalaup          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

.PHONY all settings fs partition

all: setup settings fs

setup:
	./sources/setup/debian.sh

fs: partition
	sh ./sources/steps/create-fs.sh
	sh ./sources/steps/mount-fs.sh

partition:
	sh ./sources/steps/create-partition.sh

settings:	
	sh ./sources/settings.sh







