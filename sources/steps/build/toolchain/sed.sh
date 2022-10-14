# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    sed.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/14 15:46:05 by felix             #+#    #+#              #
#    Updated: 2022/10/14 15:47:32 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/sed-4.7 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/sed-4.7

# Create makefile with config
./configure --prefix=/tools

# Build
make

# Run test
make check

# Install
make install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/sed-4.7