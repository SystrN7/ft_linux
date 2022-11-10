# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create-partition.sh                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 12:27:29 by fgalaup           #+#    #+#              #
#    Updated: 2022/11/10 17:19:51 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Create partition table
parted -s $LFS_VIRTUAL_DRIVE_FILE mktable gpt

# Creating Boot partition
parted -s $LFS_VIRTUAL_DRIVE_FILE mkpart primary ext2 2048s 131071s
# Creating Swap partition
parted -s $LFS_VIRTUAL_DRIVE_FILE mkpart primary linux-swap 131072s 4325375s
# Creating Root partition
parted -s $LFS_VIRTUAL_DRIVE_FILE mkpart primary ext4 4325376s 100%

parted -s $LFS_VIRTUAL_DRIVE_FILE align-check optimal 1
parted -s $LFS_VIRTUAL_DRIVE_FILE align-check optimal 2
parted -s $LFS_VIRTUAL_DRIVE_FILE align-check optimal 3

parted -s $LFS_VIRTUAL_DRIVE_FILE name 1 UEFI
parted -s $LFS_VIRTUAL_DRIVE_FILE name 2 SWAP
parted -s $LFS_VIRTUAL_DRIVE_FILE name 3 SYSTEM
