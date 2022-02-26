# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    make-fs.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fgalaup <fgalaup@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 11:23:07 by fgalaup           #+#    #+#              #
#    Updated: 2021/02/06 12:03:39 by fgalaup          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Enables the kernel module requested by kpartx, just in case.
# sudo modprobe dm-mod # D'ont work on WSL2

# Mount virtual hard drive partition for creation file system
LINUX_LOOP=$(sudo kpartx -av $LFS_VIRTUAL_DRIVE_FILE | head -1 | sed 's/add map //' | sed 's/p. .*//')

echo 'LINUX_LOOP='$LINUX_LOOP > $LFS_BUILD_DIRECTORY'build.env'

# Creating Fat32 file system
sudo mkfs.vfat /dev/mapper/$LINUX_LOOP'p1' -F 32

# Creating swap file system
sudo mkswap /dev/mapper/$LINUX_LOOP'p2'

# Creating roots file system with ext4 fs
sudo mkfs -v -t ext4 /dev/mapper/$LINUX_LOOP'p3'