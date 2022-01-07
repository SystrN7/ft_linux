# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mount-fs.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fgalaup <fgalaup@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 12:27:37 by fgalaup           #+#    #+#              #
#    Updated: 2021/02/06 12:28:09 by fgalaup          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

mkdir -pv $LFS
# mounting partition in lfs path
mount -v -t ext4 $LFS_PARTITION $LFS_PATH