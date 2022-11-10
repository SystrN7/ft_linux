# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    diffutils.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 10:49:36 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:37:53 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/diffutils-3.7 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/diffutils-3.7

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
rm -rf $LFS_TOOLS_PATH/build/diffutils-3.7