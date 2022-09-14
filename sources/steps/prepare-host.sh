# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    prepare-host.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/13 22:19:28 by felix             #+#    #+#              #
#    Updated: 2022/09/14 14:24:18 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

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

# Extract source code
source ./sources/steps/source/extract-sources.sh

# ================================================= #
# Step 3 : Prepare temporary system build.			#
# ================================================= #

# Create linux from scratch usrs
source ./sources/steps/user-env/create-user.sh

# Create tool directory
source ./sources/steps/user-env/create-tools-directory.sh

source ./sources/steps/create-program-aliases.sh