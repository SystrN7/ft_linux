# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create-fs.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 11:23:07 by fgalaup           #+#    #+#              #
#    Updated: 2022/11/10 17:19:40 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Creating ext2 file system
sudo mkfs -v -t ext2 /dev/$LINUX_LOOP'p1'

# Creating swap file system
sudo mkswap /dev/$LINUX_LOOP'p2'

# Creating roots file system with ext4 fs
sudo mkfs -v -t ext4 /dev/$LINUX_LOOP'p3'