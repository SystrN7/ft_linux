# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bison.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/11 16:16:29 by felix             #+#    #+#              #
#    Updated: 2022/10/13 10:36:05 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/bison-3.3.2 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/bison-3.3.2

# Create makefile with config
./configure --prefix=/tools

# Build
make

# # Run test
make check

# Install
make install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/bison-3.3.2