# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    builds.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:54:20 by felix             #+#    #+#              #
#    Updated: 2022/11/10 21:50:09 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
set -e

# ================================================= #
# Step 0 : - Setup Environement.					#
# ================================================= #

# Load Config file
export $(grep -v '^#' config.env | xargs -d '\n')

# Test if build directory exist
if [ -d "$LFS_BUILD_DIRECTORY" ]; then

	if [ -e "$LFS_BUILD_DIRECTORY/build.env" ]; then
		echo "[i]-Unmount filesystem."
		export $(grep -v '^#' "$LFS_BUILD_DIRECTORY/build.env" | xargs -d '\n')
		source ./sources/steps/disk/unmount.sh
	fi

	echo "[i]-Remove lfs build directory."
	rm -rf "$LFS_BUILD_DIRECTORY"
fi


echo "[i]-Create lfs build directory."
mkdir -p "$LFS_BUILD_DIRECTORY"

# Execute with your user
source ./sources/steps/prepare-host.sh

# Login with lfs user and build the linux from scratch toolchain
su --command="$(pwd)/sources/steps/build-toolchain.sh" $LFS_USER -

# Copy lfs sripts
mkdir $LFS_PATH/script
cp ./sources/steps/prepare-system.sh $LFS_PATH/script/prepare-system.sh
cp ./sources/steps/build-system.sh $LFS_PATH/script/build-system.sh
cp ./sources/steps/configure-system.sh $LFS_PATH/script/configure-system.sh
cp ./sources/steps/final.sh $LFS_PATH/script/final.sh
cp -r ./sources/steps/prepare-system/ $LFS_PATH/script/prepare-system/
cp -r ./sources/steps/build/system $LFS_PATH/script/build
cp -r ./sources/steps/configure-system/* $LFS_PATH/script/
cp -r ./sources/steps/final/. $LFS_PATH/script/

# Mouting host system device and other requirement
source ./sources/steps/prepare-system/create-system-directory.sh

# Mounting the lfs img as root of file system to prepare file system
sudo chroot $(pwd)"/$LFS_PATH" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login -e +h /script/prepare-system.sh

# Mounting the lfs img as root of file system to build final system
sudo chroot $(pwd)"/$LFS_PATH" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    LFS_TEST_RUN=$LFS_TEST_RUN  \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login -e +h /script/build-system.sh

# Mounting the lfs img as root of file system to configure the system
sudo chroot $(pwd)"/$LFS_PATH" /usr/bin/env -i \
    HOME=/root TERM="$TERM"            \
    PS1='(lfs chroot) \u:\w\$ '        \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login -e +h /script/configure-system.sh

# Mounting boot into the lfs folder
sudo mount --bind $LFS_BOOT_PATH $LFS_PATH/boot

# Mounting the lfs img as root of file system to build & install linux and grub
sudo chroot $(pwd)"/$LFS_PATH" /usr/bin/env -i \
    HOME=/root TERM="$TERM"            \
    PS1='(lfs chroot) \u:\w\$ '        \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    LINUX_LOOP=$LINUX_LOOP             \
    /bin/bash --login -e +h /script/final.sh

sudo umount $LFS_PATH/boot

# ================================================= #
# Clean Step : Close all and clean the system.		#
# ================================================= #

exit 0; # TODO remove when script is finish

# Clean User
source ./sources/steps/user-env/clean-user-env.sh

# Unmout FileSystem
source ./sources/steps/disk/unmount.sh

echo "[v]-Build"
