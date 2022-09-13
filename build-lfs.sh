# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-lfs.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:54:20 by felix             #+#    #+#              #
#    Updated: 2022/09/13 11:03:39 by felix            ###   ########lyon.fr    #
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

# Download source file (Is include into the repository)
source ./sources/steps/sources/download-sources.sh

# ================================================= #
# Step 3 : Prepare temporary system build.			#
# ================================================= #

# Create linux from scratch usrs
source ./sources/steps/user-env/create-user.sh

# Create tool directory
source ./sources/steps/user-env/create-tools-directory.sh

# Login to the lfs user
echo "You need to type manualy the lfs user password"
echo "Password is : $LFS_USER_PASSWORD"
su - $LFS_USER

# Build system
./sources/steps/user-env/setup-lfs-user-env.sh

# 
source ./sources/steps/create-program-aliases.sh


# ================================================= #
# Step 4 : Built temporary system.					#
# ================================================= #


# ================================================= #
# Step end : Close all.								#
# ================================================= #

# Clean User
source ./sources/steps/user-env/clean-user-env.sh

# Unmout FileSystem
source ./sources/steps/disk/unmount.sh

echo "[v]-Build"