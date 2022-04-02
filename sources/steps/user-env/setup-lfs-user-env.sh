# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup-lfs-user-env.sh                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:56:52 by felix             #+#    #+#              #
#    Updated: 2022/04/02 15:34:25 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

export $(grep -v '^#' config.env | xargs -d '\n')

if [ $(whoami) = "$LFS_USER" ]; then
	
# Create custom bash profil to prevent loading of system default env
cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

# Create custom bash config to configure build
cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS_PATH=$LFS_PATH
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
export MAKEFLAGS='-j $(nproc --all)'
EOF

# source ~/.bash_profile

fi
