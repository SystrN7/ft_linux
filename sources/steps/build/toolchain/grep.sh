# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grep.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 15:09:19 by felix             #+#    #+#              #
#    Updated: 2022/10/13 15:11:22 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/grep-3.3 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/grep-3.3

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
rm -rf $LFS_TOOLS_PATH/build/grep-3.3