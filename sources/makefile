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

all: settings fs
	
fs: partition
	sh ./steps/create-fs.sh
	sh ./steps/mount-fs.sh

partition:
	sh ./steps/create-partition.sh

settings:	
	sh ./settings.sh







