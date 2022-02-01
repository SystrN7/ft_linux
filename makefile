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

.PHONY: all settings fs partition

all: setup settings drive fs

# Step 0 - Setup required software.
setup:
	./sources/setup/debian.sh

# Step 1 - Create virtual hard drive.
drive: settings
	sh ./sources/steps/create-disk.sh

# Step 2 - 
fs: partition
	sh ./sources/steps/create-fs.sh
	sh ./sources/steps/mount-fs.sh

partition:
	sh ./sources/steps/create-partition.sh

settings:	
	sh ./sources/Settings.sh

clean:
	sudo umount /mnt/VHD/
	rm -Rf ./build
