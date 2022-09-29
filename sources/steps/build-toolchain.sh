# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build-toolchain.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/13 22:19:37 by felix             #+#    #+#              #
#    Updated: 2022/09/29 19:06:12 by felix            ###   ########lyon.fr    #
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
# source ./sources/steps/build/toolchain/binutils.sh

# Build GCC (Passe 1)
# source ./sources/steps/build/toolchain/gcc.sh

# Build (Extract linux header)
# source ./sources/steps/build/toolchain/linux-headers.sh

# Build Glibc
# source ./sources/steps/build/toolchain/glibc.sh

# Test the current stage of build
# source ./sources/steps/build/tests/toolchain-glibc-test.sh

# Build Standard library C++
# source ./sources/steps/build/toolchain/libstdcpp.sh

# Build binutils (Passe 2)
# source ./sources/steps/build/toolchain/binutils-2.sh

# Build GCC (Passe 2)
# source ./sources/steps/build/toolchain/gcc-2.sh

# Test the current stage of build
# source ./sources/steps/build/tests/toolchain-glibc-test.sh

# Build TCL (Test) (Optional)
source ./sources/steps/build/toolchain/tcl.sh

