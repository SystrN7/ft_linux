# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    settings.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fgalaup <fgalaup@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 10:51:13 by fgalaup           #+#    #+#              #
#    Updated: 2021/02/06 11:56:15 by fgalaup          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

echo 

# The path contain virtual hard drive file
export LFS_VIRTUAL_DRIVE_FILE=./build/linux_from_scratch.img

# Location of partion using to build lfs
export LFS_PARTITION=/dev/sdb1

# Location of linux from scratch file systeme (In linux from scratch tutorial is the LFS variable)
export LFS_PATH=/mnt/lfs
export LFS_BOOT_PATH=/mnt/