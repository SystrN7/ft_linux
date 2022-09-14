# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-lfs.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/02 12:54:20 by felix             #+#    #+#              #
#    Updated: 2022/09/14 14:22:07 by felix            ###   ########lyon.fr    #
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
		source ./sources/steps/disk/unmount.sh
	fi

	echo "[i]-Remove lfs build directory."
	rm -rf $LFS_BUILD_DIRECTORY
fi


echo "[i]-Create lfs build directory."
mkdir -p "$LFS_BUILD_DIRECTORY"

# Execute with user
source ./sources/steps/prepare-host.sh

# Login to the lfs user
echo "[i]-If You need to type manualy the lfs user password"
echo "Password is : $LFS_USER_PASSWORD"
su --command="$(pwd)/sources/steps/build-toolchain.sh" $LFS_USER -


# ================================================= #
# Clean Step : Close all.							#
# ================================================= #

# Clean User
source ./sources/steps/user-env/clean-user-env.sh

# Unmout FileSystem
source ./sources/steps/disk/unmount.sh

echo "[v]-Build"