# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    coreutils.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 10:44:47 by felix             #+#    #+#              #
#    Updated: 2022/10/13 11:08:52 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/coreutils-8.30 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/coreutils-8.30

# Create makefile with config
./configure --prefix=/tools --enable-install-program=hostname

# Build
make

# Run test
make RUN_EXPENSIVE_TESTS=yes check

# Install
make install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/coreutils-8.30