# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    tar.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/14 15:50:07 by felix             #+#    #+#              #
#    Updated: 2022/11/10 18:36:33 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/tar-1.31 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/tar-1.31

# Create makefile with config
./configure --prefix=/tools

# Build
make

# if [[ "$LFS_TEST_RUN" == "true" ]]; then
#     # Run test (test 124 faild) and tar test (can fill the hard drive)
#     # make check
# fi

# Install
make install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/tar-1.31