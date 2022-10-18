# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    builds.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:54:20 by felix             #+#    #+#              #
#    Updated: 2022/10/18 15:10:20 by felix            ###   ########lyon.fr    #
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
cp -r ./sources/steps/final-system/ $LFS_PATH/script/final-system/

# Mouting fs
source ./sources/steps/final-system/create_system_directory.sh

# ================================================= #
# Clean Step : Close all and clean the system.		#
# ================================================= #

exit 0; # TODO remove when script is finish

# Clean User
source ./sources/steps/user-env/clean-user-env.sh

# Unmout FileSystem
source ./sources/steps/disk/unmount.sh

echo "[v]-Build"
