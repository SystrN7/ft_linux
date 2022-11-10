# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    file.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 11:16:44 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:38:05 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/file-5.36 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/file-5.36

# Create makefile with config
./configure --prefix=/tools

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then
    # Run test
    make check
fi

# Install
make install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/file-5.36