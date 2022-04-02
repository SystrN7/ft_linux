# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create-user.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:54:00 by felix             #+#    #+#              #
#    Updated: 2022/04/02 12:56:00 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Creating lfs User & Group
sudo groupadd $LFS_GROUP
sudo useradd -s /bin/bash -g $LFS_GROUP -m -k /dev/null $LFS_USER

# Change LFS user password
sudo chpasswd <<< "$LFS_USER:$LFS_USER_PASSWORD"
# passwd $LFS_USER