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

# Create Partition
source ./sources/steps/disk/create-partition.sh

# Create FileSystem
source ./sources/steps/disk/create-fs.sh

# Mount FileSystem
source ./sources/steps/disk/mount-fs.sh

# ================================================= #
# Step 2 : Downloads softwares source code.			#
# ================================================= #


# ================================================= #
# Step end : Close all.								#
# ================================================= #

# Unmout FileSystem
source /sources/steps/disk/unmount.sh

echo "[v]-Build"