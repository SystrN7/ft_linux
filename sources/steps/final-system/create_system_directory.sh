# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create_system_directory.sh                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/18 14:17:26 by felix             #+#    #+#              #
#    Updated: 2022/10/18 15:05:53 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Create system directory
mkdir -pv $LFS_PATH/{dev,proc,sys,run}

# Create required devices by linux kernel
sudo mknod -m 600 $LFS_PATH/dev/console c 5 1
sudo mknod -m 666 $LFS_PATH/dev/null c 1 3

# mouting host syetem device to the lfs
sudo mount -v --bind /dev $LFS_PATH/dev

# Mount other system directory
sudo mount -vt devpts devpts $LFS_PATH/dev/pts -o gid=5,mode=620
sudo mount -vt proc proc $LFS_PATH/proc
sudo mount -vt sysfs sysfs $LFS_PATH/sys
sudo mount -vt tmpfs tmpfs $LFS_PATH/run

# Mount other system directory if exist
if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi