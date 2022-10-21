# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    builds.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:54:20 by felix             #+#    #+#              #
#    Updated: 2022/10/21 15:57:46 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

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
cp -r ./sources/steps/final-system/ $LFS_PATH/script/final-system/
cp -r ./sources/steps/build/system $LFS_PATH/script/build

# Mouting host system device and other requirement
source ./sources/steps/final-system/create_system_directory.sh

# Mounting the lfs img as root of file system to prepare file system
sudo chroot $(pwd)"/$LFS_PATH" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h +e /script/prepare-system.sh

# Mounting the lfs img as root of file system to build final system
sudo chroot $(pwd)"/$LFS_PATH" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h +e /script/build-system.sh

# ================================================= #
# Clean Step : Close all and clean the system.		#
# ================================================= #

exit 0; # TODO remove when script is finish

# Clean User
source ./sources/steps/user-env/clean-user-env.sh

# Unmout FileSystem
source ./sources/steps/disk/unmount.sh

echo "[v]-Build"
