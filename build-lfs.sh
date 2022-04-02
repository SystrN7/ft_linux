# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-lfs.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:54:20 by felix             #+#    #+#              #
#    Updated: 2022/04/02 15:37:57 by felix            ###   ########lyon.fr    #
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

	if [ -e "$LFS_BUILD_DIRECTOR/build.env" ]; then
		echo "[i]-Unmount filesystem."
		export $(grep -v '^#' $LFS_BUILD_DIRECTORY/build.env | xargs -d '\n')
		source ./sources/unmount.sh	
	fi

	echo "[i]-Remove lfs build directory."
	rm -rf $LFS_BUILD_DIRECTORY
fi


echo "[i]-Create lfs build directory."
mkdir -p "$LFS_BUILD_DIRECTORY"


# ================================================= #
# Step 1 : Building file systerm.					#
# ================================================= #

# Create Disk
source ./sources/steps/disk/create-disk.sh

# Mount Disk
source ./sources/steps/disk/mount-disk.sh

# Create Partition
source ./sources/steps/disk/create-partition.sh

# Create FileSystem
source ./sources/steps/disk/create-fs.sh

# Mount FileSystem
source ./sources/steps/disk/mount-fs.sh

# ================================================= #
# Step 2 : Downloads softwares source code.			#
# ================================================= #

source ./sources/steps/sources/download-sources.sh

# ================================================= #
# Step 3 : Prepare Temp system build.				#
# ================================================= #

source ./sources/steps/user-env/create-user.sh
source ./sources/steps/user-env/create-tools-directory.sh
./sources/utils/login $LFS_USER $LFS_USER_PASSWORD ./sources/steps/user-env/setup-lfs-user-env.sh


# ================================================= #
# Step end : Close all.								#
# ================================================= #

# Unmout FileSystem
source ./sources/steps/disk/unmount.sh

echo "[v]-Build"