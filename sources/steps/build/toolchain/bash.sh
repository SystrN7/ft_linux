# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bash.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/30 14:58:10 by felix             #+#    #+#              #
#    Updated: 2022/10/11 16:16:53 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/bash-5.0 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/bash-5.0


# Create makefile with config
./configure --prefix=/tools --without-bash-malloc

# Build
make

# # Run test
# make tests

# Install
make install
ln -sv bash /tools/bin/sh

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/bash-5.0