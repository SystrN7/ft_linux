# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mount-fs.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 12:27:37 by fgalaup           #+#    #+#              #
#    Updated: 2022/11/10 17:17:04 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Mount tuto at (https://stefanoprenna.com/blog/2014/09/22/tutorial-how-to-mount-raw-images-img-images-on-linux/);
# Command to get virtual disque info
# fdisk -l build/linux_from_scratch.img

mkdir -pv $LFS_BOOT_PATH
mkdir -pv $LFS_PATH

# mounting partition in lfs path

sudo mount -t ext2 /dev/$LINUX_LOOP'p1' $LFS_BOOT_PATH
sudo mount -t ext4 /dev/$LINUX_LOOP'p3' $LFS_PATH

sudo chown -R $(whoami) ./$LFS_BUILD_DIRECTORY
