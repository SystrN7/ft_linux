# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    diffutils.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 10:49:36 by felix             #+#    #+#              #
#    Updated: 2022/10/13 10:52:39 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/diffutils-3.7 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/diffutils-3.7

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
rm -rf $LFS_TOOLS_PATH/build/diffutils-3.7