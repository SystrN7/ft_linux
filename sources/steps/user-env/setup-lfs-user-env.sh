# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup-lfs-user-env.sh                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:56:52 by felix             #+#    #+#              #
#    Updated: 2022/09/14 14:09:45 by felix            ###   ########lyon.fr    #
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

echo 'set +h' > ~/.bashrc
echo 'umask 022' >> ~/.bashrc
echo "LFS_PATH=$LFS_PATH" >> ~/.bashrc
echo "LFS_TOOLS_PATH=$LFS_TOOLS_PATH" >> ~/.bashrc
echo "LFS_SOURCES_PATH=$LFS_SOURCES_PATH" >> ~/.bashrc
echo 'LC_ALL=POSIX' >> ~/.bashrc
echo 'LFS_TGT=$(uname -m)-lfs-linux-gnu' >> ~/.bashrc
echo "PATH=$LFS_TOOLS_PATH/bin:/bin:/usr/bin" >> ~/.bashrc
echo 'export LFS LC_ALL LFS_TGT PATH' >> ~/.bashrc
# Add this to build faster
echo "export MAKEFLAGS='-j \$(nproc --all)'" >> ~/.bashrc

source ~/.bash_profile

fi
