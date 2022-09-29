# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-toolchain.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/13 22:19:37 by felix             #+#    #+#              #
#    Updated: 2022/09/29 11:00:11 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# chmod +x ~/.bashrc
for c in $(env | cut -d '=' -f 1); do unset $c; done
source ~/.bashrc

# For debuging
# cat ~/.bashrc
# env

# Move to the lfs scipts path 
cd $LFS_SCRIPT_PATH

# ================================================= #
# Step 4 : Built temporary system.					#
# ================================================= #

# TODO : Remove this
# Fix env with absolute path
export LFS_PATH=$(pwd)/$LFS_PATH;

# Create temp build directory 
mkdir -v $LFS_TOOLS_PATH/build/

# Build binutils (Passe 1)
source ./sources/steps/build/toolchain/binutils.sh

# Build GCC (Passe 1)
source ./sources/steps/build/toolchain/gcc.sh

# Build (Extract linux header)
source ./sources/steps/build/toolchain/linux-headers.sh