# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    patch.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 17:07:48 by felix             #+#    #+#              #
#    Updated: 2022/10/13 17:09:22 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/patch-2.7.6 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/patch-2.7.6

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
rm -rf $LFS_TOOLS_PATH/build/patch-2.7.6