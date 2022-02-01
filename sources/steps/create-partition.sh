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

# Creating Boot partition
# Creating Swap partition
# Creating Root partition

sudo parted $LFS_VIRTUAL_DRIVE_FILE

mktable gpt

mkpart primary fat32 2048s 131071s
mkpart primary linux-swap 131072s 4325375s
mkpart primary ext4 4325376s 100%

align-check optimal 1
align-check optimal 2
align-check optimal 3

name 1 UEFI
name 2 SWAP
name 3 SYSTEM

quit
