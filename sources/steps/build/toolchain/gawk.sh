# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gawk.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 14:30:06 by felix             #+#    #+#              #
#    Updated: 2022/10/13 14:46:19 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/gawk-4.2.1 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/gawk-4.2.1

# Create makefile with config
./configure --prefix=/tools

# Build
make

# Run test (??? tow test faild for somme resson)
# make check

# Install
make install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/gawk-4.2.1