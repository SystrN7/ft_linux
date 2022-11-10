# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    xz.sh                                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/14 15:50:07 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:46:34 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/xz-5.2.4 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/xz-5.2.4

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
rm -rf $LFS_TOOLS_PATH/build/xz-5.2.4