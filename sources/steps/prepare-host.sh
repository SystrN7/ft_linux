# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    prepare-host.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/13 22:19:28 by felix             #+#    #+#              #
#    Updated: 2022/09/23 15:14:54 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# ================================================= #
# Step 1 : Building file systerm.					#
# ================================================= #

# Create Disk
source ./sources/steps/disk/create-disk.sh

# Create Partition
source ./sources/steps/disk/create-partition.sh

# Mount Disk
source ./sources/steps/disk/mount-disk.sh

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

# Extract source code
source ./sources/steps/sources/extract-sources.sh

# Create program aliases to use the rigth software
source ./sources/steps/user-env/create-program-aliases.sh

# Login to the lfs user
echo "[i]-If You need to type manualy the lfs user password"
echo "Password is : $LFS_USER_PASSWORD"
# Setup user default shell environement
su --command="$(pwd)/sources/steps/user-env/setup-lfs-user-env.sh" $LFS_USER - # TODO : Change file permition to make executable by other user
