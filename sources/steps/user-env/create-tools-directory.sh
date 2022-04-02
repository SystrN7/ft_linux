# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create-tools-directory.sh                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:55:10 by felix             #+#    #+#              #
#    Updated: 2022/04/02 12:56:29 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Create lsf build tool directory
sudo mkdir $LFS_TOOLS_PATH

# Create link between host system an lfs
sudo ln -s $LFS_TOOLS_PATH /

# Change tools give permision
sudo chown -v $LFS_USER $LFS_TOOLS_PATH
# chown -v lfs $LFS/sources