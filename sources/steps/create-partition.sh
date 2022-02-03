# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create-partition.sh                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fgalaup <fgalaup@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 12:27:29 by fgalaup           #+#    #+#              #
#    Updated: 2021/02/06 12:27:31 by fgalaup          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Create partition table
sudo parted -s $LFS_VIRTUAL_DRIVE_FILE mktable gpt

# Creating Boot partition
sudo parted -s $LFS_VIRTUAL_DRIVE_FILE mkpart primary fat32 2048s 131071s
# Creating Swap partition
sudo parted -s $LFS_VIRTUAL_DRIVE_FILE mkpart primary linux-swap 131072s 4325375s
# Creating Root partition
sudo parted -s $LFS_VIRTUAL_DRIVE_FILE mkpart primary ext4 4325376s 100%

sudo parted -s $LFS_VIRTUAL_DRIVE_FILE align-check optimal 1
sudo parted -s $LFS_VIRTUAL_DRIVE_FILE align-check optimal 2
sudo parted -s $LFS_VIRTUAL_DRIVE_FILE align-check optimal 3

sudo parted -s $LFS_VIRTUAL_DRIVE_FILE name 1 UEFI
sudo parted -s $LFS_VIRTUAL_DRIVE_FILE name 2 SWAP
sudo parted -s $LFS_VIRTUAL_DRIVE_FILE name 3 SYSTEM
