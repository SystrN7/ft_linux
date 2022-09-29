# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    dejagnu.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 19:09:57 by felix             #+#    #+#              #
#    Updated: 2022/09/29 19:31:43 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/dejagnu-1.6.2 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/dejagnu-1.6.2

# Create makefile with config
./configure --prefix=/tools

# Build & Install
make install

# Run test
make check

popd

# Remove temps build dir
rm -rf $LFS_TOOLS_PATH/build/dejagnu-1.6.2
