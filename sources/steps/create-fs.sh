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

# ??? - Fix loop for user dynamic name

# Enables the kernel module requested by kpartx, just in case.
# sudo modprobe dm-mod # D'ont work on WSL2

# Mount virtual hard drive partition for creation file system
sudo kpartx -av $LFS_VIRTUAL_DRIVE_FILE

# Creating Fat32 file system
mkfs.vfat /dev/mapper/loop2p1 -F 32

# Creating swap file system
mkswap /dev/mapper/loop2p2

# Creating roots file system with ext4 fs
mkfs -v -t ext4 /dev/mapper/loop2p3

# Unmount virtual hard drive partition for creation file system
sudo kpartx -dv /dev/loop2