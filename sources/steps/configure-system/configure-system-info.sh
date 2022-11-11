# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    configure-system-info.sh                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/11 17:37:13 by felix             #+#    #+#              #
#    Updated: 2022/11/11 17:47:57 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Create lfs vesion
echo 8.4 > /etc/lfs-release

# Information file for lsb complience
echo "DISTRIB_ID=\"Ft_Linux\"
DISTRIB_RELEASE=\"1\"
DISTRIB_CODENAME=\"$LFS_KERNEL_CODENAME\"
DISTRIB_DESCRIPTION=\"Linux From Scratch for 42\"" > /etc/lsb-release
