# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mount-disk.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 11:23:07 by fgalaup           #+#    #+#              #
#    Updated: 2022/09/23 14:03:56 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Enables the kernel module requested by kpartx, just in case.
# sudo modprobe dm-mod # D'ont work on WSL2

# Mount virtual hard drive partition for creation file system
LINUX_LOOP=$(sudo partx -av $LFS_VIRTUAL_DRIVE_FILE | tail -1 | sed 's/\/dev\///' | sed 's/:.*//')

echo "[i] - LFS drive is mount to the linux loop device : $LINUX_LOOP"
echo 'LINUX_LOOP='$LINUX_LOOP > $LFS_BUILD_DIRECTORY'build.env'