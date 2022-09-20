# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create-tools-directory.sh                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:55:10 by felix             #+#    #+#              #
#    Updated: 2022/09/16 19:19:25 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Create lsf build tool directory
mkdir $LFS_TOOLS_PATH
mkdir $LFS_SOURCES_PATH

# Create link between host system an lfs
sudo ln -s $LFS_TOOLS_PATH /$LFS_TOOLS_DIRECTORY

# Change tools give permision
sudo chown -v $LFS_USER $LFS_TOOLS_PATH
sudo chown -v $LFS_USER $LFS_SOURCES_PATH
# chown -v lfs $LFS/sources