# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gzip.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 15:15:42 by felix             #+#    #+#              #
#    Updated: 2022/10/13 15:16:11 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/gzip-1.10 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/gzip-1.10

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
rm -rf $LFS_TOOLS_PATH/build/gzip-1.10