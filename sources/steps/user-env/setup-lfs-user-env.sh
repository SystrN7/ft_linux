# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup-lfs-user-env.sh                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:56:52 by felix             #+#    #+#              #
#    Updated: 2022/10/11 16:30:55 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Goto to the ft_linux directory
LFS_REPOSITORY_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ../../.. && pwd )
export LFS_REPOSITORY_PATH
cd $LFS_REPOSITORY_PATH


export $(grep -v '^#' config.env | xargs -d '\n')

if [ $(whoami) = "$LFS_USER" ]; then
	
# Create custom bash profil to prevent loading of system default env
# Useless because linux(su) dont work in scripting case (Fuck you linux, fuck you) but he throw
echo 'exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash' > ~/.bash_profile

# Create custom bash config to configure build

echo 'set +h' > ~/.bashrc
# echo 'set +m' >> ~/.bashrc
echo 'set -e' >> ~/.bashrc # Exit shell on error
echo 'umask 022' >> ~/.bashrc
echo "LFS_PATH=$LFS_PATH" >> ~/.bashrc
echo "LFS_TOOLS_PATH=$LFS_TOOLS_PATH" >> ~/.bashrc
echo "LFS_SOURCES_PATH=$LFS_SOURCES_PATH" >> ~/.bashrc
echo "LFS_SCRIPT_PATH=$LFS_REPOSITORY_PATH" >> ~/.bashrc
echo 'LC_ALL=POSIX' >> ~/.bashrc
echo 'LFS_TGT=$(/bin/uname -m)-lfs-linux-gnu' >> ~/.bashrc
echo 'HOME='$HOME >> ~/.bashrc
echo 'TERM='$TERM >> ~/.bashrc
echo 'PS1='\u:\w\$ '' >> ~/.bashrc #Can be remove (is just interactive shell promt format)
echo "PATH=/$LFS_TOOLS_DIRECTORY/bin:/bin:/usr/bin" >> ~/.bashrc
echo 'export LFS_SCRIPT_PATH LFS_PATH LFS_SOURCES_PATH LFS_TOOLS_PATH LC_ALL LFS_TGT PATH HOME TERM PS1' >> ~/.bashrc
# Add this to build faster
echo "export MAKEFLAGS='-j '$(nproc --all)" >> ~/.bashrc

fi
