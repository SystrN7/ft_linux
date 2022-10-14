# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    python.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/14 15:32:16 by felix             #+#    #+#              #
#    Updated: 2022/10/14 15:39:08 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/Python-3.7.2 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/Python-3.7.2

# Use our toolchain insted of system toolchain.
sed -i '/def add_multiarch_paths/a \        return' setup.py

# Create makefile with config
./configure --prefix=/tools --without-ensurepip

# Build
make

# Install
make install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/Python-3.7.2