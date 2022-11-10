# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    coreutils.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felix <felix@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 10:44:47 by felix             #+#    #+#              #
#    Updated: 2022/11/10 10:37:15 by felix            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Copy sources.
cp -r --preserve build/lfs/sources/coreutils-8.30 $LFS_TOOLS_PATH/build/

pushd $LFS_TOOLS_PATH/build/coreutils-8.30

# Create makefile with config
./configure --prefix=/tools --enable-install-program=hostname

# Build
make

if [[ "$LFS_TEST_RUN" == "true" ]]; then
    # Run test
    make RUN_EXPENSIVE_TESTS=yes check
fi


# Install
make install

popd

# Remove temps build directory
rm -rf $LFS_TOOLS_PATH/build/coreutils-8.30